Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332739;
	b=FPxYrdJ2wG6BRbQtouuZBJX0NG56uZzLMcw6bPVIH3jBO2JERVLaNmW3rbVlhbs6Dxob
	 rY47UJ3k6wgOrijnuxQ0v//qW7xNdODrLhNIRfHYbLGTcR/M3Vpe6MHMR4+q8DBvRxrq1
	 utCB6vG/+NEMBmLK8k1ZHG9HXnifB4Au0FJmqt96/sZk2gQQjMFpJm6avbDFirhwlH+Jh
	 LEfgh61LAITrxkEVt1IKUeFvNRa2FsCROBZKJwzPYILdNAVk9uJDhg9N3h+pbdWNw+MEq
	 3t769Ydw2goLdQk+2NmltepZWRCqPIwBxgdmbtbKrlewzCbkdfL1ZGHRkTayN5tuLgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BhkuuSJ1mFlPM3aPIeXwkot+O32f94nPrMa9UyizXDk=;
	b=oOC7weBtWIVVbe5+k8l/EeTgvMBLv2BeKJ3jwUYyjCwroXW6aJdDifwvLiowerNGpcHd
	 Q5078ORiHyUUDE/ObLRVLVQxl8Nr1k4fM2SePZvSe2LuUWE+WeKs+uYQq8Xmej5SxTVtY
	 Rb15TyDf8QPtZ2PmicQdvdZe4TL5T/HVcd2KukQpTqQ69gvVqMwsF08zFPvpF49fMWVY0
	 gZt4JGZPEnHBRysGByojwZG7EzBgIoNMZLFYexdH9DgDAKraOpgeF36JWMzGImkIb9szo
	 dJI3H4SCojRHiRYKQqQbMjpNvzfCjGd9p+Gxjj7JX4799EVLJ6h3KzUlcBbwjGXkgvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ov4wqeZJ;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C215606A32A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 07:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C215606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ov4wqeZJ
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-48e9476e26aso735624fac.3
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 23:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795332737; x=1795937537; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BhkuuSJ1mFlPM3aPIeXwkot+O32f94nPrMa9UyizXDk=;
        b=Ov4wqeZJIQuJGiunN5STsCCNux3bePIAxjxo1k8HxRKxtmxdFxnv3ralCrK6AO/cl+
         C6JQn0DpFmzZC4QFeyjILiCRRhKU9dxYCE7ykgLd1RJl70VXlFNsRFoEuz6ZEHflaKgL
         WmEtj+3Lwsk2mFBqhpEjcPZEqOMohLpcz9y526kw+XlEwuGJcXk5ntiVJcwA7ho2Maz4
         XDLory4YJ3kuYREMxmQF+Be0J1DvRJ33gFvPc3j+3GVAiG+tIY68s+6uD8T9G+1TwWj4
         b2mEcunQ7Ksd7VWseSHcdIEkrKbN4i2R75aAXTbkLUwhVhvdDYOrp3uOva1UQiM2EokM
         NPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795332737; x=1795937537;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BhkuuSJ1mFlPM3aPIeXwkot+O32f94nPrMa9UyizXDk=;
        b=T8zhOGyoz502QZhPr0KgACOyKQMUitG9NPQBZqzm9tRc2h+h5+YoRXL8omv9jzLAw7
         CHQ9sNdkuUUPYeq4XRiU8dY0PGW6Ma8TzM/UEOWns0V5BoPUAdA3xlJ01FKhUvaJQ0hH
         a/bGU2qtdwvK6U/PJToBS7mInKxTC/lxWYqDzupREkCnSH/0i6JeP89mLCXWM/k+hEie
         iJw0Nzr64Z1i4wYGajG3cBZBEZj1DFaoCHDAourp+r/7BB+eUpUUXS6gpS6yQcb6++cJ
         0NVmckyfKKobGf1xtf5lnIkEVjSpM+R/DbRhHy0pCd03LBPMLfGNN5VUO7eDFrLlKyJm
         mJUw==
X-Forwarded-Encrypted: i=1; AL+hErGueGKMfdQP6vCJofiYZADoX7BPYNXWQcHFP5QBtxwWRqnuoMVQH33cDxhqvf2bBSezCk/xyUaNsoGyRA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/sKjdRTN9iHsxSIuY9eGNTQRVnKmc8WtqSBrjtoF1jf+5E/c09
	G3Kgak+NHg84QiPHDrCY1nkf1XJXuH9+VbejXUtIHmgSnhpQRN5HG4oq
X-Gm-Gg: AZFdTZeCPOI0MfJ7hOKRmbgewpPaQj1FldVx2fDc20KSyYDoPImkx1WOt3PpLupord5
	RZo1PY/DqZ3WWSFuGCljGJghmuUImM1OEJA3Z5ljMWmdo2FY69W8mpeYO+7tPDDG0m0aHD+gDYn
	5r219vAgV0n98mnYAlJJxU6WuZI4YzJzkaqt2Dljo9dvq97kb71IDdSkmgEmKxv9YdBOJrzWmMj
	t+fOL3kjmVey++eDK4ui896p2SGqwz3iFj7zhTb+kZAvLEARPxVHrbL0xzZaUicNltcDH1bqB1R
	KYFQzN2KTlTBeaIvm0orJ0riXezmd037WSfclHPr3hF1DSsv4caNStjMYTj6OWAeuvsIdSgbGh5
	hx9d5fCAPU1FZZn3oWt0zuqlVhh1Qh/LSL/vqpUpJV/wnIJWu3cYzN595KnZbvjQvn8aCsOGtXa
	Wlnv4MH5IbSyCQYYKvr0KujDB3pT1TFU1EY7W3deG313AacdwD8o5nKx8Su6+2+7tREN8MPDIKE
	WkYEdMGihDHvUQcBS6d9Ou1umwtpYNqtIUARPbu355QhGxhmBoBnMQGtRWp9mIR5tUwxZ8/7EfF
	43DT8P2b2jTSelRbMU9cQsCji7/PULwv1tRPRRT4lrghMFMAEdFzYDzL0sKazJzHVo9LWTOP8jN
	fZlslZSfdlKZ0aWHNhXjbO2m5qlEW9DfOzxSlNP3o5vNq7GWD7ClPFeKPjbliSgDGbTrr/90dkI
	1Tpqa8Xql8Thbiv6MaQOuI6foRRYqm+sRvycW7HsKuOEEdSXF8AXbEmgkbWE5qDo7DpnbArn3W
X-Received: by 2002:a05:6870:7012:b0:4bb:17cd:b97f with SMTP id 586e51a60fabf-4bc82e85cf5mr7584367fac.25.1795332735917;
        Sat, 21 Nov 2026 23:32:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm7292724fac.16.2026.11.21.23.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:32:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 00:32:07 -0700
Subject: [PATCH net v2] net: stmmac: dwmac-sun8i: deliver RX checksum
 errors to the stack
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
Message-Id: <20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwQqDMBBEf0X23JQkosae+h/FQ0xX3VKTkkSxi
 P/eqPfCwDLL8GZWCOgJA9yyFTzOFMjZZOQlAzNo2yOjZ/IguSyFEDULUztSTMcqYn5hHeo4eQx
 sFqwWVYUql6qoFSTCx2NHy0F/gMUIzflMjBeauHP32EAhOv89NsziCJ91kv+tS+Ks4IXq0LS6b
 PN7P2p6X40bodm27Qc1ZnaA3QAAAA==
X-Change-ID: 20261119-submit-sun8i-rx-features-v1-9177e8328598
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The sun8i MAC drops packets with a bad IP or transport checksum before
packet sockets or the protocol stack can see them, even with RX checksum
offload disabled. Its error-forwarding bit controls Ethernet and IP
errors together.

This was observed while testing an Allwinner H616 with an AC200 PHY:
the MAC dropped packets with a bad UDP checksum even with RX checksum
offload disabled.

Enable error forwarding and decode the sun8i RX status in both receive
paths. Give checksum failures and unchecked packets to the stack with
CHECKSUM_NONE. Continue to discard Ethernet errors, incomplete frames
and lengths that cannot fit in the receive buffer. Address filter and
VLAN indications are not checksum errors.

Keep the hardware checker running whenever the receiver is enabled.
Turning RX checksum reporting back on can then use the result already
recorded in queued descriptors without flushing the ring.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Submit the checksum-delivery fix alone for net, following Maxime's
  review. The RXALL feature will be submitted separately for net-next.
- Link to v1: https://patch.msgid.link/20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 98 ++++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 +-
 4 files changed, 94 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a972bee66504..706feb7bcbed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -615,6 +615,8 @@ struct mii_regs {
 struct mac_device_info {
 	const struct stmmac_ops *mac;
 	const struct stmmac_desc_ops *desc;
+	/* Defaults to the descriptor format's decoder unless the MAC overrides it. */
+	int (*rx_status)(struct stmmac_extra_stats *x, struct dma_desc *p);
 	const struct stmmac_dma_ops *dma;
 	const struct stmmac_mode_ops *mode;
 	const struct stmmac_hwtimestamp *ptp;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..0ad2203f76c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -197,6 +198,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
 #define EMAC_RX_TH_64		(0x1 << 4)
@@ -644,6 +646,9 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 
 	v = (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
+
+	/* Forward checksum failures to software before starting RX. */
+	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -654,7 +659,7 @@ static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
 	r = readl(ioaddr + EMAC_RX_CTL0);
 	if (enable) {
 		t |= EMAC_TX_TRANSMITTER_EN;
-		r |= EMAC_RX_RECEIVER_EN;
+		r |= EMAC_RX_RECEIVER_EN | EMAC_RX_DO_CRC;
 	} else {
 		t &= ~EMAC_TX_TRANSMITTER_EN;
 		r &= ~EMAC_RX_RECEIVER_EN;
@@ -698,16 +703,9 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
 			    EMAC_MACADDR_LO(reg_n));
 }
 
-/* caution this function must return non 0 to work */
-static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
+static int sun8i_dwmac_rx_ipc(struct mac_device_info *hw)
 {
-	void __iomem *ioaddr = hw->pcsr;
-	u32 v;
-
-	v = readl(ioaddr + EMAC_RX_CTL0);
-	v |= EMAC_RX_DO_CRC;
-	writel(v, ioaddr + EMAC_RX_CTL0);
-
+	/* The receiver always records the checksum result, even with RXCSUM off. */
 	return 1;
 }
 
@@ -1053,7 +1051,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.core_init = sun8i_dwmac_core_init,
 	.set_mac = sun8i_dwmac_set_mac,
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
-	.rx_ipc = sun8i_dwmac_rx_ipc_enable,
+	.rx_ipc = sun8i_dwmac_rx_ipc,
 	.set_filter = sun8i_dwmac_set_filter,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
@@ -1061,6 +1059,83 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.set_mac_loopback = sun8i_dwmac_set_mac_loopback,
 };
 
+static void sun8i_dwmac_rx_error_stats(struct stmmac_extra_stats *x, u32 status)
+{
+	if (status & RDES0_DESCRIPTOR_ERROR)
+		x->rx_desc++;
+	if (status & RDES0_OVERFLOW_ERROR)
+		x->overflow_error++;
+	if (status & RDES0_RECEIVE_WATCHDOG)
+		x->rx_watchdog++;
+	if (status & RDES0_SA_FILTER_FAIL)
+		x->sa_filter_fail++;
+	if ((status & RDES0_FRAME_TYPE) && (status & RDES0_IPC_CSUM_ERROR))
+		x->ipc_csum_error++;
+	if (status & RDES0_COLLISION)
+		x->rx_collision++;
+	if (status & RDES0_CRC_ERROR)
+		x->rx_crc_errors++;
+	if (status & RDES0_MII_ERROR)
+		x->rx_mii++;
+	if (status & RDES0_LENGTH_ERROR)
+		x->rx_length++;
+}
+
+static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *p)
+{
+	const u32 csum_mask = RDES0_IPC_CSUM_ERROR | RDES0_PAYLOAD_CSUM_ERR;
+	const u32 dma_errors = RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR;
+	const u32 wire_errors = RDES0_CRC_ERROR | RDES0_MII_ERROR |
+				RDES0_RECEIVE_WATCHDOG | RDES0_COLLISION |
+				RDES0_LENGTH_ERROR;
+	u32 status = le32_to_cpu(READ_ONCE(p->des0));
+	u32 len = FIELD_GET(RDES0_FRAME_LEN_MASK, status);
+	bool runt = len < ETH_ZLEN + ETH_FCS_LEN;
+
+	if (unlikely(status & RDES0_OWN))
+		return dma_own;
+	if (unlikely(!(status & RDES0_LAST_DESCRIPTOR)))
+		return discard_frame | rx_not_ls;
+	if (unlikely(!(status & RDES0_FIRST_DESCRIPTOR))) {
+		x->rx_length++;
+		return discard_frame;
+	}
+
+#ifdef STMMAC_VLAN_TAG_USED
+	if (status & RDES0_VLAN_TAG)
+		x->vlan_tag++;
+#endif
+	if (unlikely(status & RDES0_DRIBBLING))
+		x->dribbling_bit++;
+	if (unlikely(status & (RDES0_ERROR_SUMMARY | wire_errors | dma_errors))) {
+		sun8i_dwmac_rx_error_stats(x, status);
+		if (status & dma_errors)
+			return discard_frame;
+		/* An unexplained error summary is not a checksum verdict. */
+		if (!(status & wire_errors) &&
+		    (!(status & RDES0_FRAME_TYPE) || !(status & csum_mask)))
+			return discard_frame;
+	}
+
+	/* One buffer per chain descriptor; the reported length includes FCS. */
+	if (unlikely(len < ETH_HLEN + ETH_FCS_LEN ||
+		     len > FIELD_GET(RDES1_BUFFER1_SIZE_MASK, le32_to_cpu(p->des1)))) {
+		x->rx_desc++;
+		return discard_frame;
+	}
+	if (unlikely(runt || (status & wire_errors))) {
+		if (runt && !(status & RDES0_LENGTH_ERROR))
+			x->rx_length++;
+		return discard_frame;
+	}
+
+	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */
+	if (!(status & RDES0_FRAME_TYPE) || (status & (csum_mask | RDES0_DRIBBLING)))
+		return csum_none;
+
+	return good_frame;
+}
+
 static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 {
 	struct stmmac_priv *priv = ppriv;
@@ -1068,6 +1143,7 @@ static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 	mac->pcsr = priv->ioaddr;
 	mac->mac = &sun8i_dwmac_ops;
 	mac->dma = &sun8i_dwmac_dma_ops;
+	mac->rx_status = sun8i_dwmac_rx_status;
 
 	priv->dev->priv_flags |= IFF_UNICAST_FLT;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..047d809b8b88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -125,8 +125,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, set_rx_owner, __args)
 #define stmmac_get_rx_frame_len(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, get_rx_frame_len, __args)
-#define stmmac_rx_status(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, rx_status, __args)
 #define stmmac_rx_extended_status(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, rx_extended_status, __args)
 #define stmmac_enable_tx_timestamp(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a685ce4638f6..20e9aa7b14f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5723,7 +5723,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
-		status = stmmac_rx_status(priv, &priv->xstats, p);
+		status = priv->hw->rx_status(&priv->xstats, p);
 		/* check if managed by the DMA otherwise go ahead */
 		if (unlikely(status & dma_own))
 			break;
@@ -5926,7 +5926,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
-		status = stmmac_rx_status(priv, &priv->xstats, p);
+		status = priv->hw->rx_status(&priv->xstats, p);
 		/* check if managed by the DMA otherwise go ahead */
 		if (unlikely(status & dma_own))
 			break;
@@ -7732,6 +7732,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			return ret;
 	}
 
+	if (!priv->hw->rx_status)
+		priv->hw->rx_status = priv->hw->desc->rx_status;
+
 	/* Set alternate descriptor size (which tells the hardware that
 	 * descriptors are 8 32-bit words) when using extended descriptors
 	 * with ring mode. Only applicable for pre-v4.0 cores. Platform glue

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

