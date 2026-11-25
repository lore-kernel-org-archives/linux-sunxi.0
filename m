Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594722;
	b=R0JQMBmLoKWzwDp1M/vQXE/xrLHmNR2IrGrzMh7zwhLbDR7OgUJbU8SZUtIyQPPGWA15
	 gvZxJ5g8C4mxoX9hAaU/y7c+Qng6cMKN6OqGcieP4n5RZdMQ6zyzb5opn/gq2BR2DPR56
	 begZlN4+iAjvcRZB3qPlbR4LqNx1f2r/n5kLncwgszj+L4seESMS7Ahdrmqv2fLguWvXK
	 i8CiOHannoPwH0NdAj5TAgcoNuG/HPKNUrkpU5Z1PtWrnSSMSAa7/nVXzP3ygX1evrUoE
	 sdsj9ntPw1SzdbLS/wiN00Mq4hKwIxi4dO86U/wdVLQuzPAduIHV50dC4zdsdUAFAaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=;
	b=O0xWkflfMpAsHba9RLoTLxQLXpngJJcoUY+OTQu8ZyMzYVbkyLmN708AL+8p+kJoxmmB
	 rL5McACN3uzrRH58G0mP9D8D89iywYBhdpO/tX3TTFbNSZAN2iNHRhw0EZDIPXlXGOMvA
	 jDevE2L25K0Upc1SgMtL5n1Kzz6fgoTgSHO3mS9gJxVlLQonQTZg+0iocqwEOFfNrtuqO
	 LLU8JXWLRZiaKqWfCMC5DAWrunPyE0mwdTbwLiK/bAnumTFta/lOAEte0/glnSp6vhbQU
	 k5EvTVTMVR4f2nomC8qxwVv01KNYCrjIfGOCbY8vKUAj3hcIvaLSpY6SxPdT5gHgtTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fgncws6p;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC3D606A684
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 08:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC3D606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fgncws6p
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4d7034a99a9so3321718b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 00:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594721; x=1796199521; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=;
        b=fgncws6pFJnCXbm0vA8svmOOzrKAreub2/n3QQHUcvaKEBhbR2cobkNLW+n/BCgnfj
         plwLSpu0Ko/BGXrl8oPO6nANSWiO87OkjZVGyrrLC5TW/sVAh7F0aqJIkN3tArIukmpG
         J5xnmNutvZ+5pAg1dQa6Z+NDiaafobGd3qzYJsIPdHdqebBEu8WOEFcH0dgdootL0t3o
         vqra7C7HSUolRDU6wwLkc2SPtVpzLovRmDwYHHd7Mj3Bzd7yvp6JzrqqNLYxb15l0s8y
         /Pk6eSBTAGtjcQ8uOK7AFJmBy0j3E4JzlMBAJWp74p77KfcjBqWvDZq4SBRSncfEKwvP
         4H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594721; x=1796199521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=;
        b=y7/NJT5qMx1GzcL/xRN2htzpiodWdu/dRBK52+7tiG60PVpOSY6jrev0j2rzNnhEUK
         ycETvAn47eYGiOtmqxhCKsBkV3PbYXHnj6uz+V2Ly0M36GLnpOCgkx2NTa8NsHSSwwde
         Inr2J6TItYqkDUFDqKCBWHSG+049ynRRY1QtdHpXAWalfRoThRq6opLWhtEM9Ds/Vy7x
         aoaWBVbDT5b/Uzsg+Iw9DgykoROjli5rN4W7aGi0V+FPabP01s4VI4BdQAxNJcrz603a
         PiNjOXUjdaFMPEhzlea628JEgms2Fz3GqIByj9P6P2dij6lX26ZQwNyoKZBOBCkU8DGf
         IPUg==
X-Forwarded-Encrypted: i=1; AL+hErE5gO2+hsvdtPpyNKH3ttkjFZw3IfnyH+LtOLxv+9Q1QpxxFTY2i/emZtnfHfzSKJc4KhOlGCftos5gpg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9uim8x6eYEoArlH75mrxHeymhFwHLCrMz0pRg5bF3CNLkNydEq
	ymaL1s4uWukVLqWVBk4aXToCzeaESWD04LbLlnXNec3Cp3SJtiP3s/YV
X-Gm-Gg: AZFdTZcKAUOZWp2OUomrc/ilJmM3KsLrDGP9ArXLRlAQUUeg50b5HjbjM7d4HqtgfD7
	W7HitIK2oGswME7QHpidFboAhH10h2J6tOT510d7U84w0vUuwj0tYeU3S7q4JyzA1CAsuAdq/A4
	G+nH4tFUdVJoGhjB8rzIGc0H0HkDS9E2LuST3byErbfqkFVcxUFg3lw7KypZne/s59YLxG6Mafz
	lkqp5Ddn1n01vquvBQEpySc0T1Sgs1RxPlS7+VOlmUMv9fwynL1bSMWA20aub6q3bAjU8rmEaMI
	wtEzFy75avuw2jh5UGWFoD/HQsoxMpih88qVIRFAk/GXHCTvZUMDqNxmN6Lf0MP84SLi2x7S2gU
	cRdE3N2VGvbqhJW+unuWaVi8OHs6+X5miIguSAvx1knB2C/TBOHvRvy+mhU5tg1SVLjgctDMGje
	DhQEmaWT0iqHPQCNLj/SzfpXJhDDjdMepCCsJlgHBrd1tBAm9H419sctRbsp7C25Xs1qPHtuUXg
	px0Iy7uuX32m8JFbwseTj+LZXJTxASfyi9LR1oB+JaCu1FEFwRu9GZNhDhNegwswGIegi1Mqn+D
	8GyD3/4Rcav5o4mdRpHfdTmu6b0jnmQvbtUdXSnQr5dRhOn3kskXrJqlPhPDr8YIz8zNNGLLxbe
	v0TKN0OwBhiRrLxBfXQ3OZ7pPWL8M0pQJytFLUpWmq6MJvgKRivJnMr7HoHS6wUAWpgtss7HERd
	sFGb7Nmdt5RauczTSFeoLN2j3u1J20JWXAIwIhgIudgK05hVXzrP0=
X-Received: by 2002:a05:6808:14c5:b0:4d6:90d3:e189 with SMTP id 5614622812f47-57a0b750822mr17691751b6e.50.1795594720871;
        Wed, 25 Nov 2026 00:18:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:32 -0700
Subject: [PATCH net-next v2 3/3] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-3-4de03fbde087@gmail.com>
References: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
In-Reply-To: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Allow packet captures to see complete frames that the sun8i MAC
forwards with wire errors. Mark these frames, including runts, as
errored with an unverified checksum so stmmac can deliver them when
rx-all is enabled. Incomplete frames and DMA errors still require a
drop.

Set runt forwarding from the rx-all setting at initialization and
update that bit when the setting changes on a running interface.
RX_CTL1 also controls DMA, but RTNL serializes the ethtool update with
open, close and reset. System suspend freezes userspace before stopping
DMA, and the sun8i interrupt handler does not change the RX threshold.
The setter can therefore update the register directly. Keep error
forwarding enabled in both modes for RX checksum handling.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 379108e3da32..a008ce1f7882 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -198,6 +198,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD		BIT(1)
+#define EMAC_RX_RUNT_FRM	BIT(2)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
@@ -648,7 +649,21 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
 
 	/* Forward checksum failures to software before starting RX. */
-	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
+	v = EMAC_RX_ERR_FRM;
+	if (dev->features & NETIF_F_RXALL)
+		v |= EMAC_RX_RUNT_FRM;
+	writel(v, ioaddr + EMAC_RX_CTL1);
+}
+
+static void sun8i_dwmac_set_rx_all(struct stmmac_priv *priv, bool enable)
+{
+	u32 v = readl(priv->ioaddr + EMAC_RX_CTL1);
+
+	if (enable)
+		v |= EMAC_RX_RUNT_FRM;
+	else
+		v &= ~EMAC_RX_RUNT_FRM;
+	writel(v, priv->ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -1053,6 +1068,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
 	.rx_ipc = sun8i_dwmac_rx_ipc,
 	.set_filter = sun8i_dwmac_set_filter,
+	.set_rx_all = sun8i_dwmac_set_rx_all,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
 	.get_umac_addr = sun8i_dwmac_get_umac_addr,
@@ -1126,7 +1142,7 @@ static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *
 	if (unlikely(runt || (status & wire_errors))) {
 		if (runt && !(status & RDES0_LENGTH_ERROR))
 			x->rx_length++;
-		return discard_frame;
+		return rx_error_frame | csum_none;
 	}
 
 	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */

-- 
2.53.0

