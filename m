Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D760C8D5
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Aug 2023 09:36:37 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RKB6951V2z9t3w;
	Mon,  7 Aug 2023 11:36:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1691400993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9mcKw0MQbZkvm0T+PFFVFLAfn9YV5vMZt9S5qAO8u3w=;
	b=nYD32b3cl2o2XRKiOIjuFmP3C1h943i1tnDtmksfHQgqONVrb+ZcFdzkd4HHONHtTPrSiB
	2icAOSWcEIZ/jIV31X40e+gDXLDV7QwG3AztwqMUxtiptryWtKLdUDXT/i+bMP9vNo9IoK
	62J4cS0sLIy6dHoVS0mVRmNk29FwOgGp7XU3x3RCp7kRR1ykRg6FH5izSg2qtyF9+479EG
	jM2uBkWHkXpbffGQq6A5igGofusXZIsNlbrrNE+DWeI+C8DxI166QVKyGbBsOzrRQ4RGR3
	g9htKvHHE4krzwWdr4LIzxPZIP59julw8cnjzRKcmwl4YUe1Zx6qYAMbBJ8HiQ==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 07 Aug 2023 11:36:02 +0200
Subject: [PATCH 1/3] clk: sunxi-ng: add support for rate resetting notifier
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230807-a64_pll_video0_notifier-v1-1-8a7ccdc14c79@oltmanns.dev>
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
In-Reply-To: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: =?utf-8?q?Ond=C5=99ej_Jirman?= <x@xnux.eu>, linux-sunxi@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Frank Oltmanns <frank@oltmanns.dev>, 
 Icenowy Zheng <icenowy@aosc.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=9faTPbBKuBTerUTXnHS4DVgg2yfWOLyR6ZaZUiOk+UI=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBk0LseXHpd8Z3TXbEcbPia20eeAkB4rGNQVVGkN
 fe6lM7xGkGJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZNC7HgAKCRCaaaIIlErT
 xw+FC/0YMAPcK0tlMeo9CZd0InSaZ4tX5KCf/0AbmnPq3MAxLIc6ZQ+S9XYMxdmeYby46DykSME
 EdZyK0m6aFG4EFm9WePsr2kvtMPQdd9yNS/gnxJBYOZtTyB3w7/lROFkGrUNLQpbCyn4JuoCxHJ
 puqvjxnq5QPlUSnJGrinOHDxhgPgT7a7OmFh4Qdiq0eCnJLIuHsAWWmDngzSuBpyJUJgefc33zg
 wfzygR0dRdY+cxWgkJWSm/7eV/1DFbUsDWDCYuy70uOxK9nZe97R0ZiP2Oq57/g7mwzwWgQxDVy
 64yxX6AN3Sarpx6W4QTlgHdVR3ANKFS1o5IFZKcI3MUn01G0dlrekIWbbt9KmMLY1d01FqeOTn3
 xKiNqP0Vvuo6qDPGb1S9an8FOiGP7bc1jL1fgW7okHyodnisK3OIubFy5JZIZ01kYXvH8lGAmLJ
 zXPrT8mAzWuptmpcAYXyoTkKy0fUtTAEvikCy+NkDla3faDPh6t+J+NnPP8SR4+fL7Ev4=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4RKB6951V2z9t3w

From: Icenowy Zheng <icenowy@aosc.io>

In some situaitons, we will want a clock rate be kept while its parent
can change, for example, to make dual-head work on A64, TCON0 clock
needs to be kept for LCD display and its parent (or grandparent)
PLL-Video0 need to be changed for HDMI display. (There's a quirk on A64
that HDMI PHY can only use PLL-Video0, not PLL-Video1).

Add a notifier helper to create such kind of rate keeping notifier by
reset the rate after the parent changed.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clk/sunxi-ng/ccu_common.c | 22 ++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h | 12 ++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 8d28a7a079d0..434fa46ad460 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -87,6 +87,28 @@ int ccu_pll_notifier_register(struct ccu_pll_nb *pll_nb)
 }
 EXPORT_SYMBOL_NS_GPL(ccu_pll_notifier_register, SUNXI_CCU);
 
+static int ccu_rate_reset_notifier_cb(struct notifier_block *nb,
+				      unsigned long event, void *data)
+{
+	struct ccu_rate_reset_nb *rate_reset = to_ccu_rate_reset_nb(nb);
+
+	if (event == PRE_RATE_CHANGE) {
+		rate_reset->saved_rate = clk_get_rate(rate_reset->target_clk);
+	} else if (event == POST_RATE_CHANGE) {
+		clk_set_rate(rate_reset->target_clk, rate_reset->saved_rate);
+	}
+
+	return NOTIFY_DONE;
+}
+
+int ccu_rate_reset_notifier_register(struct ccu_rate_reset_nb *rate_reset_nb)
+{
+	rate_reset_nb->clk_nb.notifier_call = ccu_rate_reset_notifier_cb;
+
+	return clk_notifier_register(rate_reset_nb->common->hw.clk,
+				     &rate_reset_nb->clk_nb);
+}
+
 static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 			   struct device_node *node, void __iomem *reg,
 			   const struct sunxi_ccu_desc *desc)
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index fbf16c6b896d..6b0b05fae123 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -69,4 +69,16 @@ int devm_sunxi_ccu_probe(struct device *dev, void __iomem *reg,
 void of_sunxi_ccu_probe(struct device_node *node, void __iomem *reg,
 			const struct sunxi_ccu_desc *desc);
 
+struct ccu_rate_reset_nb {
+	struct notifier_block	clk_nb;
+	struct ccu_common	*common;
+
+	struct clk		*target_clk;
+	unsigned long		saved_rate;
+};
+
+#define to_ccu_rate_reset_nb(_nb) container_of(_nb, struct ccu_rate_reset_nb, clk_nb)
+
+int ccu_rate_reset_notifier_register(struct ccu_rate_reset_nb *rate_reset_nb);
+
 #endif /* _COMMON_H_ */

-- 
2.41.0

