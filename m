Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333590;
	b=z4sbSqChWhzOg4+ODATneWzh2UU7Sn8RH46JObS90RUke784YRr3uZY7W2SugyDFCWd1
	 tD+/EmXepBEi8WXT4aEIkYiA0JbfVY4TQd9XJym5KH0Z8lTjIe4rSppkIwqKL8AtUrXNA
	 Vwdy21w7XeDp2HRIWQLMRf61hO3C0jV5PxkjV5dyTQ9uZkgLmuitjJFFmMNCvzDvkyeZU
	 I12kGtLfegJi1RKpXoVIt4efWJpHcZ9+uiCkvi/1OYfjGBV48Vou+/szDZW6mkHcPtPMg
	 Q5/wNBVCNM09Co8HUJcuILtCNGUTcMG9Bgq/ZQS0MpJ9J2OAB+dpUwsbvcbPBMffR0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=;
	b=nAXg1CxUuNKBWLm9XnA0hDXI7RbXBKWdFKe6xmft52xd2xfLV0lzaKmMpy1yCwDb8xbu
	 sFxcXAfAyo0t0wRkISB8ypsZ/c0bi2hzhIQh9/Py04O/4RTeHf1MtqBxhXuNTdOvuwkp8
	 jH4zJRrA6DVYfvyzSD7SioKpo9Rym0kNcB7yxuuLjLN5rlk68IkY2G0EV29eziRmrT7PI
	 8m+aLbGb//VPZTQbqB9x01IvZe8KfBWhD0tDQhQR8UOf2EW1GkdKxaySuuE+p3zxrwblX
	 qbLctjcwQzeSs3BfMLQywdWERdo4VeUn+XR7/fGWCSJf2d9cY63k9K6BWK26+ElZRtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7PdVGs3;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E69606A32A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 07:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E69606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7PdVGs3
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8253bc5a613so1492695a34.0
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 23:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333589; x=1795938389; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=;
        b=f7PdVGs3dLldbMMmtYqolBE7nhW0ftxSZ2Mj8du2qPjWPV9EcVuMRAdRRTLYXC7Z87
         D9xxjAg8yG4fnH2fDJVe1tFI5MI8zES2V45Vu91YZ9YpAvY0+nMgR0QtuqiLmbs8IXgR
         zQ1EHJOf7gT3mVu/foA8d16vRM0/dDWkYvVKyG5KxF6Yvxc3AZOiF3wATpskVnYtIc+k
         7LBRh1Y2rVH1VtQnutsZo7yMo/9HxyNPP9QjCfN6+M4lnSdJWN+JYufT+GagMUIww39e
         xnO5LTB/8nSHY7bt5Z4nnNU5wDt2PQe1y4O3adagpWb26GQHdqoB94LkZf82tyMQfnbe
         LS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333589; x=1795938389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=;
        b=gTdkBR0yJMEfHPt+sgwI0+HfcS7TdAq7Msjbbu7Pl+tOuPNaPMk0xYVXrxnFQ09Bps
         +CEuE1/eOfxKMWRAAohnBKCSACDF5hi97STZY3rQht51Is4yV4lFkXWoNyCs6p6YEr7f
         ib6MdenIg04eRe5ZGfD9G80oFbQfuAWieJIWelA9OroICEnIj3HYAXfEe3GqLlYvaQ1p
         1GtUsrrk5u6ubiXgsJFZ9+s8tYAQV0FOXHApV/i7V4dBIC2ghFvxSnxTmXvSqFGM1Azc
         x7Ov9wDJFzSqjlzpsqji7YQ43Vzn0Sm2YMAztEdo0jl+EqgW0D4fj2oN6mXkdljN6kt8
         2S6w==
X-Forwarded-Encrypted: i=1; AL+hErH4IRrn2FKuqfwNpkZljFuA+HWwPu+jRezB0rivk9Hg9uIbW9Jm3SkJy468fTHpMGwFW6ZMx9JlP0ysUg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+b40uyKeoh41apF4yIzhjinpzXcDlBRW8qJNxdro4kMpSz7Dgy
	uktTF/V4HEfhee5OuhUQTkOUPReHpM2plLY+DyWyWaxmyjizt5lwSDR/
X-Gm-Gg: AZFdTZcbKDd5cs/KbxfBJ7IbsJj1wdS//DX04GeQhKxHZgalYWeVsLJBaPfHTZtVZmX
	YRxsKP65vBojUAgyEtFYwPHZZthzilvvw/jCrz0bdIFDJThZXWtPufA0s/0un7dqxQgV1nB5djk
	47dTxpVZI3QVEARSVdgELrxAMvsOMtvbdWNpYNT3G9y5nnY0lQjfGDSr5g0ZfZrhc8ZDfm/82pr
	yKlRalMuGbcsfV7KWK/GB6Aig6eJe89A6Kfzomdxm+GXEHaKqhFHL+vtZCUlQ3mpXohd1kFfOhN
	6bADVpdSDFYJuHoRGpQ9hieT60vMAFzepd6aE3Ho5+PDu+3n3tcv46mPXQmxNya4ajZb7Wq49sD
	83fTCRirSPQEi5bivl7h4muBsaOoHxerEkHixs8y2ajRuRFtHVGzYvatQsPoPVwvS9rGq1C9xSB
	vR63+xS+PhI9YwtSTJVlTm7kvED0jb7rh2p5VIH5rBONl+1HraSYJmqHDX5J1rzlZOlaw/mCbag
	FCULAC5ViQo6tOlddUeJaev+AlOZ4OdiX5E3nYBKIs3ZqSt+SxpnezZWQ0JIM/BDqjKOCH3acmy
	/B8Z9N7Pq/98iFnigcjTmQ6Qp8eLwW3qhhNdCg5NWVa/CL39Gfy/bRtPiKuyhSbkmlMNZq4TyKg
	E13ROM8a4iPOx5B+W5xkExxLdh4NpEdu7jInF8z6mpDrauMw9XvqHBXRmgbtoUFPKQwrl0jYv72
	zewZUKNWjGXMqPq2XPYvJG+LaYXC7DmTe/EWbqqTXvdl415HwvZppf
X-Received: by 2002:a05:6808:1387:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-57a0a937f43mr9425803b6e.33.1795333589314;
        Sat, 21 Nov 2026 23:46:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 00:45:47 -0700
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
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
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
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

Enable packet captures of complete frames with wire errors on sun8i.
Report these frames to the core with an unverified checksum so it
can deliver them when rx-all is enabled. DMA and incomplete-frame
errors still require dropping the frame.

Program runt forwarding at initialization and when rx-all changes.
Serialize live updates of RX_CTL1 so changing the receive mode cannot
overwrite a concurrent DMA start, stop or threshold update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 73 +++++++++++++----------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0ad2203f76c3..8398788d334e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -21,16 +21,12 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <linux/stmmac.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-/* General notes on dwmac-sun8i:
- * Locking: no locking is necessary in this file because all necessary locking
- *		is done in the "stmmac files"
- */
-
 /* struct emac_variant - Describe dwmac-sun8i hardware variant
  * @syscon_field		reg_field for the syscon's gmac register
  * @soc_has_internal_phy:	Does the MAC embed an internal PHY
@@ -73,6 +69,7 @@ struct sunxi_priv_data {
 	bool internal_phy_powered;
 	bool use_internal_phy;
 	void *mux_handle;
+	spinlock_t rx_ctl1_lock; /* Protects live RX_CTL1 updates */
 };
 
 /* EMAC clock register @ 0x30 in the "system control" address range */
@@ -198,6 +195,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_RUNT_FRM	BIT(2)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
@@ -442,25 +440,32 @@ static void sun8i_dwmac_dma_stop_tx(struct stmmac_priv *priv,
 	writel(v, ioaddr + EMAC_TX_CTL1);
 }
 
-static void sun8i_dwmac_dma_start_rx(struct stmmac_priv *priv,
-				     void __iomem *ioaddr, u32 chan)
+static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 clear, u32 set)
 {
+	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 	u32 v;
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
-	v |= EMAC_RX_DMA_START;
-	v |= EMAC_RX_DMA_EN;
-	writel(v, ioaddr + EMAC_RX_CTL1);
+	guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
+	v = readl(priv->ioaddr + EMAC_RX_CTL1);
+	writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);
+}
+
+static void sun8i_dwmac_dma_start_rx(struct stmmac_priv *priv,
+				     void __iomem *ioaddr, u32 chan)
+{
+	sun8i_dwmac_update_rx_ctl1(priv, 0, EMAC_RX_DMA_START | EMAC_RX_DMA_EN);
 }
 
 static void sun8i_dwmac_dma_stop_rx(struct stmmac_priv *priv,
 				    void __iomem *ioaddr, u32 chan)
 {
-	u32 v;
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_DMA_EN, 0);
+}
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
-	v &= ~EMAC_RX_DMA_EN;
-	writel(v, ioaddr + EMAC_RX_CTL1);
+static void sun8i_dwmac_set_rx_all(struct stmmac_priv *priv, bool enable)
+{
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_RUNT_FRM,
+				   enable ? EMAC_RX_RUNT_FRM : 0);
 }
 
 static int sun8i_dwmac_dma_interrupt(struct stmmac_priv *priv,
@@ -539,24 +544,23 @@ static void sun8i_dwmac_dma_operation_mode_rx(struct stmmac_priv *priv,
 					      void __iomem *ioaddr, int mode,
 					      u32 channel, int fifosz, u8 qmode)
 {
-	u32 v;
+	u32 threshold = 0;
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
 	if (mode == SF_DMA_MODE) {
-		v |= EMAC_RX_MD;
-	} else {
-		v &= ~EMAC_RX_MD;
-		v &= ~EMAC_RX_TH_MASK;
-		if (mode < 32)
-			v |= EMAC_RX_TH_32;
-		else if (mode < 64)
-			v |= EMAC_RX_TH_64;
-		else if (mode < 96)
-			v |= EMAC_RX_TH_96;
-		else if (mode < 128)
-			v |= EMAC_RX_TH_128;
+		sun8i_dwmac_update_rx_ctl1(priv, 0, EMAC_RX_MD);
+		return;
 	}
-	writel(v, ioaddr + EMAC_RX_CTL1);
+
+	if (mode < 32)
+		threshold = EMAC_RX_TH_32;
+	else if (mode < 64)
+		threshold = EMAC_RX_TH_64;
+	else if (mode < 96)
+		threshold = EMAC_RX_TH_96;
+	else if (mode < 128)
+		threshold = EMAC_RX_TH_128;
+
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_MD | EMAC_RX_TH_MASK, threshold);
 }
 
 static void sun8i_dwmac_dma_operation_mode_tx(struct stmmac_priv *priv,
@@ -648,7 +652,10 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
 
 	/* Forward checksum failures to software before starting RX. */
-	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
+	v = EMAC_RX_ERR_FRM;
+	if (dev->features & NETIF_F_RXALL)
+		v |= EMAC_RX_RUNT_FRM;
+	writel(v, ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -1052,6 +1059,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.set_mac = sun8i_dwmac_set_mac,
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
 	.rx_ipc = sun8i_dwmac_rx_ipc,
+	.set_rx_all = sun8i_dwmac_set_rx_all,
 	.set_filter = sun8i_dwmac_set_filter,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
@@ -1126,7 +1134,7 @@ static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *
 	if (unlikely(runt || (status & wire_errors))) {
 		if (runt && !(status & RDES0_LENGTH_ERROR))
 			x->rx_length++;
-		return discard_frame;
+		return rx_error_frame | csum_none;
 	}
 
 	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */
@@ -1218,6 +1226,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (!gmac)
 		return -ENOMEM;
 
+	spin_lock_init(&gmac->rx_ctl1_lock);
 	gmac->variant = of_device_get_match_data(&pdev->dev);
 	if (!gmac->variant) {
 		dev_err(&pdev->dev, "Missing dwmac-sun8i variant\n");

-- 
2.53.0

