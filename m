Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188744;
	b=yYwMJUhMSc37W5Miuw4gR8FSurZgVPhTCPN9yYnXmKBUZV0+8AAKC1CLYTpOvMOnhqJR
	 an1nD77X06SMwVMKINMG5MTtO76gKL3BhX/GeDMbNFMVC2jsyAQd47Ry/dgAP0RuLoOks
	 crwCbPAWjBUFtCUAuayLMtScbACCaSuIGtkppbve6373PxGSK52XMC1Zj2VWLgObfsGXK
	 ApRieXizeQL4FTzp+aJVXLFn0yTS00AtTzLuL1lCi8cun6tUeGl9682sn7iiUDEnlLiYz
	 NIyJ3ICV5aWup1XGdGM11lJ/MrZniXzE1XcEb5pAwXxpeSoyW02w/86jGhx5HylPRzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uMWKgHAVOfub5jjRo9ldebeazJBCcLFSXcOXSTNu7Rk=;
	b=OXQ+HCxgzhbuAx1lb8TTQACiFVluZGzHFItdQpZNssxz41PqWDxuCT57sgkWdGfNu5Jz
	 C9F8CxEOkAanKZxf1KFWh0eyIv0y7ZgXM4RrB+uMxLIRwlOoj7GXOde909SveMXqFXw+Y
	 /ipVi8JwnV+peDrPvxefxUtXDnbTweu12eLI3MFJpRP8JP62AI1sDCZkCvOf+m1dkVZCE
	 2WY6AUXrhEDS+2VlI74kGpbXGYfMvBY0fiTVaxs4gdELTj6iES3pgBvm4TFk+trL87Pci
	 q57tuKYLSYoWEqMH+fzJeX9ySh2DWFv1o18ttNb+2hevn5YPWLVqlGqUICay5ZHCYYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNRK2ACt;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A34606A325
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A34606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNRK2ACt
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ddef424972so842434eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 07:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188743; x=1795793543; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMWKgHAVOfub5jjRo9ldebeazJBCcLFSXcOXSTNu7Rk=;
        b=dNRK2ACtDhl9lcee+bcurBvJZhjkKCrbfiCyy6F+/dpiMg3giShS+6J6nwFv+evGzc
         G2IehFeYLnWYSA1pPkrUz4/kblCIL8qME+8XaaIdWUh4DIk+5QLSDZVa5nDL80q8/ItQ
         MgNx/maiIZN82CuonknrDAgPTSrsXdkalY5qFQZXHh/pOq0YOilwjOmMAtA2PQeYIQeP
         qvs5Jyb66z83shMgMN+14JhQ9WQHc6FvtJfFXXgg8rFQWBBS52yr4vVGb9uv8HrD/l2G
         vNhj+qkw2Vi8L4NUdOS6F3eKClNBbvw13bbBj0lLHY0FCftCQS4WLY8myRRBkb8fNcjL
         DFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188743; x=1795793543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMWKgHAVOfub5jjRo9ldebeazJBCcLFSXcOXSTNu7Rk=;
        b=V+Vru1WryL7jtLbrzFDTc9ioj7s5O/zPicJ8zNL0oBORlp3g3TSTXJHsEkpPE8l7yf
         7BBa24A0EkC1fPFsaH+qqEcW2jQ7NC2yKfx/XZ/Be+m+dxjWfWldi3JYuhFqRyUqHnRA
         aIAR9OZp31DvSbSuF5d2xEb5QbnqVEuzj03xTgbfnaHjpncGG7s9+K6vRX3g85vte7W2
         O2EF2wcrHT2b3ClgcweJ27FDC9yqfcSmNiY5NJBsMGCSXfiCkhlIteJBCgiyT3knFpvL
         xVYwEo1ivuwXSA6LjjrE2RJIIi5gR3GNW/BAcyyQXsetZBDEuWCm6RPIUuBsQ7k7F1aw
         S3zQ==
X-Forwarded-Encrypted: i=1; AL+hErERUOJSKzlB7k4BK88rUB4v+IGGN6f+v2o5TyGGCAajIPPBkfMndazo1zGYS4ZnNtXwrE7+Qs3R8ZIJYw==@lists.linux.dev
X-Gm-Message-State: APuU4Z99fvqeRcnZk1X/R2y6nm5jWHNsO4zwDVIe1krUOS6SFA87XIqB
	WS3I8tFqU+kZTEhpzKPJrAPjTF7l5FZHc13k7tBnSbynMb1vNAc1OJ+R
X-Gm-Gg: AYBFou0FliM+2cUmjCicFi2dShXEBio/aGtYzzNDzkkb4Z9W776gDRFqFKzps2ek9g4
	ogJcY6dZ4jTGJqIQ//fqJGzT+mKoIoQaMXbgNx5pjRWFBdcv6OYBNHoj8QohLYD8Z3lBLRcM2le
	Pyiwceqsz7zlWzHQBSg8sDs1wzoGXPKvCoQOJxsRNCzfWwpyeOL6IZ0Dmu+nA2V+QVDlhDHBxLl
	vdDbK9BYbg4aHkaEKDLgmlZto6ENEt+PyyfEq8MyuAv48pZEG7Gqlhp7cGfipu2qqEHBh0dSe6s
	aTVlQuSlnUcCzGuFJEBxz37BNOo6zD+GLcQnPA/mZSMdxvdxnEMMyFkrh0c056zXKG4mOm4klAD
	U2TGs5XCtCPWbmqTlyENCeMFwbhfMZ2IzPwpoexR1ss+5a2RM9EwuhgWrPR6qkmC4HWb1Z+uKRQ
	tEXvP14ZhUBLLhh6X9KK9HTE4PilU6/Iei9rYvVLbmVojggbHHU9AggihtMaZYFySnjHygNIQMa
	Teyuok+TY3zFPsDAPxikIwQ8RBebpMFYacuHN0IFJn8YFHUOL5nFQ6lL3vr1E4xswMbVSklBoVp
	FdFpIVUADy2Ab822nRPXCvdPeRKBkiXRoJ43GqYrqjH3mkLBVyHSetQavFFkosic6D/3gAyfk2q
	d76awzPla7Gg5uv5FIfFLJ71tngtBpsDCet6yBa+R0JEMmnksiX28844X7KIQ9xRrBh8KXgwXJ6
	Y+B232+xlZQYFWVRIZ6Fk4YChZEzqtN3gvxS+Z2A8NvEkS0Own31s=
X-Received: by 2002:a05:6820:f034:b0:71b:3fec:38a6 with SMTP id 006d021491bc7-71b3fec4b36mr1246949eaf.12.1795188743195;
        Fri, 20 Nov 2026 07:32:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2159605eaf.11.2026.11.20.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:32:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 08:32:06 -0700
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
Message-Id: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Packet captures on sun8i cannot currently inspect frames the driver
discards for Ethernet errors. Add opt-in rx-all support for complete
frames with a reported wire error and for runts the MAC can forward.

Set the runt-forwarding bit at hardware initialization and when rx-all
changes. Serialize live updates with the DMA controls in the same
register. Deliver these frames without claiming a verified checksum or
including them in the good-packet and good-byte totals. Keep counting
the wire errors even when the frames are delivered.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 73 +++++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 +++++++++++-----
 4 files changed, 80 insertions(+), 48 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 706feb7bcbed..ab959ee3a5dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -360,6 +360,8 @@ enum rx_frame_status {
 	llc_snap = 0x4,
 	dma_own = 0x8,
 	rx_not_ls = 0x10,
+	/* Complete frame with a wire error, deliverable only with RXALL. */
+	rx_error_frame = 0x20,
 };
 
 /* Tx status */
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
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 047d809b8b88..2cfadc686104 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -319,6 +319,7 @@ struct stmmac_ops {
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
 	int (*rx_ipc)(struct mac_device_info *hw);
+	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
 	/* Enable RX Queues */
 	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
 	/* RX Queues Priority */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2f33fc0126b1..0a893c2cea78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5655,10 +5655,12 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	skb_record_rx_queue(skb, queue);
 	napi_gro_receive(&ch->rxtx_napi, skb);
 
-	u64_stats_update_begin(&rxq_stats->napi_syncp);
-	u64_stats_inc(&rxq_stats->napi.rx_packets);
-	u64_stats_add(&rxq_stats->napi.rx_bytes, len);
-	u64_stats_update_end(&rxq_stats->napi_syncp);
+	if (likely(!(status & rx_error_frame))) {
+		u64_stats_update_begin(&rxq_stats->napi_syncp);
+		u64_stats_inc(&rxq_stats->napi.rx_packets);
+		u64_stats_add(&rxq_stats->napi.rx_bytes, len);
+		u64_stats_update_end(&rxq_stats->napi_syncp);
+	}
 }
 
 static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
@@ -5716,6 +5718,21 @@ static struct stmmac_xdp_buff *xsk_buff_to_stmmac_ctx(struct xdp_buff *xdp)
 	return (struct stmmac_xdp_buff *)xdp;
 }
 
+static bool stmmac_rx_discard(struct stmmac_priv *priv, int status, u32 *rx_errors)
+{
+	if (likely(!(status & (discard_frame | rx_error_frame))))
+		return false;
+
+	if (status & discard_frame) {
+		if (!priv->hwts_rx_en)
+			(*rx_errors)++;
+		return true;
+	}
+
+	(*rx_errors)++;
+	return !(READ_ONCE(priv->dev->features) & NETIF_F_RXALL);
+}
+
 static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
@@ -5806,11 +5823,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
-		if (unlikely(!error && (status & discard_frame))) {
-			error = 1;
-			if (!priv->hwts_rx_en)
-				rx_errors++;
-		}
+		if (!error)
+			error = stmmac_rx_discard(priv, status, &rx_errors);
 
 		if (unlikely(error)) {
 			xsk_buff_free(buf->xdp);
@@ -6004,11 +6018,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
-		if (unlikely(!error && (status & discard_frame))) {
-			error = 1;
-			if (!priv->hwts_rx_en)
-				rx_errors++;
-		}
+		if (!error)
+			error = stmmac_rx_discard(priv, status, &rx_errors);
 
 		/* We do not support SG in XDP mode */
 		if (unlikely(!error && (status & rx_not_ls) &&
@@ -6170,8 +6181,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		skb_record_rx_queue(skb, queue);
 		napi_gro_receive(&ch->rx_napi, skb);
-		rx_packets++;
-		rx_bytes += len;
+		if (likely(!(status & rx_error_frame))) {
+			rx_packets++;
+			rx_bytes += len;
+		}
 next:
 		in_progress = false;
 		skb = NULL;
@@ -6453,6 +6466,11 @@ static int stmmac_set_features(struct net_device *netdev,
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
 
+	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
+	    netif_running(netdev) && netif_device_present(netdev) &&
+	    priv->hw->mac->set_rx_all)
+		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
+
 	/* Keep the COE Type in case of csum is supporting */
 	if (features & NETIF_F_RXCSUM)
 		priv->hw->rx_csum = priv->plat->rx_coe;
@@ -8285,6 +8303,8 @@ static int __stmmac_dvr_probe(struct device *device,
 	}
 
 	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
+	if (priv->hw->mac->set_rx_all)
+		ndev->hw_features |= NETIF_F_RXALL;
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */

-- 
2.53.0

