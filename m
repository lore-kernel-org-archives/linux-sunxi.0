Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C443F08E
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784475106; cv=none; b=hzojRRPWS4GqlM0jSmSRmpHy0/aoHRyBnSTVCVRxcqZmtEoeTq+qwYkv/do4YmKRE08xEFb53cFKyLN3AfjzbzSiI54WCaadI2bNf8cD4YBPfMRs6+4NXCOFdT3rmd0BNg9Y1H0vHTUqhbRpT6F6APEjnqpa/NRLqUrFy79u6vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784475106; c=relaxed/simple;
	bh=7rKizl1VwNt3GDPCkBsLZAl45i1jv9HwynJC+jxYgbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BIcb2zBezLw7om2iCET3bzJN8JMlFoaotijQFEWRsOcfSDxnh0T8RgbI5kw3MdJkxZmu5vE+gyS7ykI4acTSFV8fXcfcvCQAll9pTm5czn/UqS4xaLpA38wI3zbFWvx1fMwEr1o5631Ap1k9Nx3W8p3A4bwtjsVKrCW9oxYpiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMmuAFkg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMmuAFkg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so35629835e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784475103; x=1785079903; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAIvFoHSot582y5nPwOQ/4JfZFN3JPm5c7b4D+Z0OhU=;
        b=TMmuAFkgs8HL/v4NczMOfgJMR4bHEE7N3rtXdel3ccxSyqMaUUhIpDU8R1PriOCUci
         vrXdXKuxWg0Lsjv0iUhydpxm9a7Ki9slqlmgRGR8ZRAwVst/h2lm1eQKlNwhJAzutmVC
         f2Jjq+Dj0n2bJdZnvgg+/6AQuxchrTswYHLphGyKsdSyeAmshfJF3IbMDXSwFBH6LvIn
         Qe0xHS6rdeKRDl1DejZ2pkKvDWWuY8cXYoO+5KlhItenFPyy9Hvh0sTBatlH+15cdwTt
         MeWKgalbrnkIRAVJ7Iqzx0bsKnrzpE3Pe83DZSHvN5smzPKlbcSGo/pMCJLBLMNWn3cB
         7lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784475103; x=1785079903;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RAIvFoHSot582y5nPwOQ/4JfZFN3JPm5c7b4D+Z0OhU=;
        b=bqpmcDOezVvwBHfcpYh7oAWqegmiLLHMicwdPRnB/zBAO2mokuo9mUr0PlykQeAAVe
         HZMUrmnYH6PiU3DRvbYs+xO1+N9yX+CFjPe2jxA5UvzOTplGxPoMLWq00a1or5ps0Ixh
         OSuVTYoDadMypfk2nB0iLIZ6Prv2NSO3eUpqmSCY4TWXGn29VGGyzJNwKGuRS8PbD1DW
         mVq/N7C4D5g2ntV0cStP0I/Aj65745WhmudbyFvnTr48wdbWdhO7MCrsCwhIF235l/iZ
         daOt4n7QMbAHS6RAnj81pNKzX9u9M0BM5heZ2NftEMfEbp76szCVJ8oLgpyxa18w4E6Q
         sz9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqw/6GZjOzGOzbBuQGgey+TWlBqb5LRmbUO95hsB2QM5tGNOsZooN+xC6j/8Ev7lKvjcksrruGRD1aI2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy8a6KGxFf1KVRbri+1GaWye9MHYGrJOyl/YJmd3OteaEo35P0
	8VCQFmlAnDbPWEIH6EzflVQNTpb+XGBi08Mz4W2MO+bJKhSq68TjlSXm
X-Gm-Gg: AfdE7cn21qGBYUi2ESAVjrzSmQ56MxN3cI4/g4NZWfF8eO3SDUwNPDhBqhVN4fRyD1s
	hH9wnEp4zc0ecnXtvbatV/P9cjkT6hi4lJsQyDpvkbGE+AEjxVHZ8Nqd4BV6QO3XOGimbhxzDBd
	SrzWCPgiLgERHe3K/e6OKJiqZzpBRAumT9vaUpTlQKIOyTX3ZnTJhLJUD/19dnJY+etk+aRDLhX
	AJt5gvrZmpLd/RQXNxwv8IUWQ7osgTJswPKk7AUeT/c/F+XYMaaVfAznOGyMipOWrQTGJEsxu6L
	Xyu3POnoYgTgSzLKfB0BPe5Z/N/vEAZa267UmQpshLtkBvprCpZ2/GwdTVl4T5NrxZB0b809wa3
	isiyd1EOOPAw31izA0MGrlSgUWc93daA4OyrVjZFgLnql/3MgXqXk761gKnjlB0dGIWoeejwvYk
	UyKpKAeLK+f+dduQJ71wp5lKZiNs7IuefB6Cv2
X-Received: by 2002:a05:6000:4b11:b0:476:7036:f854 with SMTP id ffacd0b85a97d-47f622f83ccmr11899817f8f.21.1784475102735;
        Sun, 19 Jul 2026 08:31:42 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm20420729f8f.25.2026.07.19.08.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:31:42 -0700 (PDT)
From: Aureal <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH] clk: sunxi-ng: div: implement set_rate_and_parent
Date: Sun, 19 Jul 2026 17:31:22 +0200
Message-ID: <20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>

When a rate change on a ccu_div clock also switches its parent, the
clk core, in the absence of a .set_rate_and_parent op, programs the
parent first and the divider second.  If the new parent is faster than
the old one, the clock transiently runs at new_parent_rate/old_divider
between the two register writes, overshooting both the old and the
requested rate and potentially violating the consumer's maximum
allowed frequency.

This is not theoretical.  On the Allwinner A523/T527 the GPU clock is
a ccu_div muxing between pll-gpu and the fixed pll-periph0 outputs:
going from 600 MHz (pll-periph0-600M, M=1) down to 400 or 200 MHz
(both derived from pll-periph0-800M) makes the Mali G57 run at 800 MHz
for the window between the two writes, 33% above the vendor's maximum
operating point.  Observed and validated on an Orange Pi 4A (T527)
with a downstream GPU devfreq setup; mainline does not yet describe
GPU OPPs for this SoC, but any ccu_div consumer whose set_rate ends up
crossing parents is affected.

Implement .set_rate_and_parent with the same ordering rule as
clk_composite_set_rate_and_parent(): if keeping the current divider
while switching the mux would overshoot the requested rate, program
the divider first, otherwise switch the mux first.  The intermediate
rate then never exceeds both the old and the new rate.

Clocks using a prediv feature keep the historical mux-then-divider
order: the prediv helpers look the prediv up by the current parent,
which is ambiguous while both are changing.

Fixes: e9b93213103f ("clk: sunxi-ng: Add divider")
Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
Note: this touches the same area of ccu_div.c as patch 2/4 of the
pending series "clk: sun6i-rtc: Add support for Allwinner A733 SoC" v5
(<20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>), which adds
ccu_rodiv_ops right after ccu_div_ops.  The conflict is trivial
(context only); happy to rebase on top of it if it lands first.

 drivers/clk/sunxi-ng/ccu_div.c | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb..9024bcd8c 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -130,6 +130,41 @@ static int ccu_div_set_parent(struct clk_hw *hw, u8 index)
 	return ccu_mux_helper_set_parent(&cd->common, &cd->mux, index);
 }
 
+static int ccu_div_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate, u8 index)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+
+	/*
+	 * The predivider helpers look it up through the current parent,
+	 * which is ambiguous while both the parent and the divider are
+	 * changing, so keep the mux-then-divider order the core would
+	 * have used for those clocks.
+	 */
+	if (cd->common.features & (CCU_FEATURE_VARIABLE_PREDIV |
+				   CCU_FEATURE_FIXED_PREDIV |
+				   CCU_FEATURE_ALL_PREDIV)) {
+		ccu_div_set_parent(hw, index);
+		return ccu_div_set_rate(hw, rate, parent_rate);
+	}
+
+	/*
+	 * Same ordering rule as clk_composite_set_rate_and_parent(): if
+	 * switching the mux with the current divider would overshoot the
+	 * requested rate, program the divider first, so the intermediate
+	 * rate never exceeds both the old and the new rate.
+	 */
+	if (ccu_div_recalc_rate(hw, parent_rate) > rate) {
+		ccu_div_set_rate(hw, rate, parent_rate);
+		ccu_div_set_parent(hw, index);
+	} else {
+		ccu_div_set_parent(hw, index);
+		ccu_div_set_rate(hw, rate, parent_rate);
+	}
+
+	return 0;
+}
+
 const struct clk_ops ccu_div_ops = {
 	.disable	= ccu_div_disable,
 	.enable		= ccu_div_enable,
@@ -141,5 +176,6 @@ const struct clk_ops ccu_div_ops = {
 	.determine_rate	= ccu_div_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_div_set_rate,
+	.set_rate_and_parent = ccu_div_set_rate_and_parent,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.47.3

