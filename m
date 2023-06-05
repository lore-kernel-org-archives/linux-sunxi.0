Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10104DDC0
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jun 2023 19:08:29 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QZjn46Hj8z9sT5;
	Mon,  5 Jun 2023 21:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1685992104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08rp19H8fuvYiOt8wL0CXCOqu/pQ3k1ExE2PHzxQJg4=;
	b=g/HyqF8C5l/L8hZlVZNqFwjALTelM3J+Hla7XLbfCyNKnZuM4jIgsu36tJ6AZdPL7cxfF+
	2WCSveudu/64YhgOTAd3JYDRFJIZcDM0LcbVP2U1/tzfQRbPQVVW1QUrPUBglDPU/QM353
	eziEieDeT/ZTBim+wK6txBKlLGaq6UJKZaHSzSWQhf2uLCHKaoZ2svtNV60vns9+al7XAu
	5I4dqFcWA16zLZoM7khymtivCxsPQDh6CyziX/xQjxG0TApqgGJSLYd+hkyxuxOhO64MYV
	hKVDKoEk/ysro/u+X+zpUX6q1DvnjkHMxatKCvKL6FqWUbAITkGcy84vNYMTrw==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Beranek <me@crly.cz>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] clk: sunxi-ng: nkm: consider alternative parent rates when finding rate
Date: Mon,  5 Jun 2023 21:07:44 +0200
Message-Id: <20230605190745.366882-2-frank@oltmanns.dev>
In-Reply-To: <20230605190745.366882-1-frank@oltmanns.dev>
References: <20230605190745.366882-1-frank@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4QZjn46Hj8z9sT5

In case the CLK_SET_RATE_PARENT flag is set, consider using a different
parent rate when determining a new rate.

To find the best match for the requested rate, perform the following
steps for each NKM combination:
 - calculate the optimal parent rate,
 - find the best parent rate that the parent clock actually supports
 - use that parent rate to calculate the effective rate.

In case the clk does not support setting the parent rate, use the same
algorithm as before.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu_nkm.c | 40 ++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index a0978a50edae..c71e237226f2 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -16,10 +16,10 @@ struct _ccu_nkm {
 	unsigned long	m, min_m, max_m;
 };
 
-static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
-				       struct _ccu_nkm *nkm)
+static unsigned long ccu_nkm_find_best(unsigned long *parent, unsigned long rate,
+				       struct _ccu_nkm *nkm, struct clk_hw *parent_hw)
 {
-	unsigned long best_rate = 0;
+	unsigned long best_rate = 0, best_parent_rate = 0, tmp_parent = *parent;
 	unsigned long best_n = 0, best_k = 0, best_m = 0;
 	unsigned long _n, _k, _m;
 
@@ -28,12 +28,29 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
 			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
 				unsigned long tmp_rate;
 
-				tmp_rate = parent * _n * _k / _m;
+				if (parent_hw) {
+					// We must round up the desired parent rate, because the
+					// rounding down happens when calculating tmp_rate. If we
+					// round down also here, we'd round down twice.
+					unsigned long optimal_parent =
+							(rate * _m + (_n * _k - 1)) / _n / _k;
+
+					tmp_parent = clk_hw_round_rate(parent_hw, optimal_parent);
+
+					// if the optimal parent rate is below the minimum rate of
+					// the parent ignore this combination
+					if (tmp_parent > optimal_parent)
+						continue;
+					tmp_rate = tmp_parent * _n * _k / _m;
+				} else {
+					tmp_rate = tmp_parent * _n * _k / _m;
+					if (tmp_rate > rate)
+						continue;
+				}
 
-				if (tmp_rate > rate)
-					continue;
 				if ((rate - tmp_rate) < (rate - best_rate)) {
 					best_rate = tmp_rate;
+					best_parent_rate = tmp_parent;
 					best_n = _n;
 					best_k = _k;
 					best_m = _m;
@@ -46,6 +63,8 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
 	nkm->k = best_k;
 	nkm->m = best_m;
 
+	*parent = best_parent_rate;
+
 	return best_rate;
 }
 
@@ -106,7 +125,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw *hw,
 }
 
 static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
-					struct clk_hw *hw,
+					struct clk_hw *parent_hw,
 					unsigned long *parent_rate,
 					unsigned long rate,
 					void *data)
@@ -124,7 +143,10 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate *= nkm->fixed_post_div;
 
-	rate = ccu_nkm_find_best(*parent_rate, rate, &_nkm);
+	if (!clk_hw_can_set_rate_parent(&nkm->common.hw))
+		rate = ccu_nkm_find_best(parent_rate, rate, &_nkm, NULL);
+	else
+		rate = ccu_nkm_find_best(parent_rate, rate, &_nkm, parent_hw);
 
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= nkm->fixed_post_div;
@@ -159,7 +181,7 @@ static int ccu_nkm_set_rate(struct clk_hw *hw, unsigned long rate,
 	_nkm.min_m = 1;
 	_nkm.max_m = nkm->m.max ?: 1 << nkm->m.width;
 
-	ccu_nkm_find_best(parent_rate, rate, &_nkm);
+	ccu_nkm_find_best(&parent_rate, rate, &_nkm, NULL);
 
 	spin_lock_irqsave(nkm->common.lock, flags);
 
-- 
2.40.1

