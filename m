Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592718;
	b=o8CJeCaELNJ/AfmAbz7cxRmQ0gNtBCYO/7GYFVIvO4EmL8heQWk6X3g3iuvqP4WqwGnH
	 0D5wcaavT+OFMJTt86/o+lNr48J+WALUBK8+o0XJfjVZCGCj5Zg+X7DG54BD0F6yp6P/2
	 v0yYaZdHioICdOJsjhyu2jmF9raLdP914G4oZLN+yGB4kwkhGvstfqQXfO0uH7Nnutfj1
	 09b3GfdJouF8wC6P1pn0VkOIDhFX5xf5cik5FaxvTakagYp3x2GoCJMcCgzrxpJ9W3OlT
	 GeYdRIW6rWJFoiYH4Lqf74GPCMjxc4eyrCyfR68H5mqvhL01rDQTEzQOkUjKivKRrvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=dV4BF6J45U2pVPcVBsCXGeaOfYJGsf58GzHV9B+rH6Y=;
	b=v16Nq6/0MUp4sEjMn9bbmnia0GkeF0TstkVG04lAUBj9+YcXPeOl1/FYzeN6XenseHhE
	 p7Ho57viyhrsT7JKIxJtNxsYGBcaC5vPxqnuliktHfhptsVoK0O182bU9Z+I7o2z1E8uW
	 oQsLL5FQumREZ1Q1QKuwbnH8P6RMI6TKxKclBVgJV6Om1wUdbDqk0/NUE20Gr/lXamtix
	 jPQO2Vzr36EYiHnu9WQVnZGFMTlzUm4Dd+3vaS2HCKjvVv7otKgWvnCvtMUAwatq8tTkW
	 9zf2CGmZMLICdsxXr5uA9KN/zSj5MtOqR8OCu/VT8uqBoWXTtTGSIgRyYOrb8h/zdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkPfTmVU;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF67606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 07:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF67606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkPfTmVU
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71ad1db7e31so4182599eaf.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 23:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592716; x=1796197516; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dV4BF6J45U2pVPcVBsCXGeaOfYJGsf58GzHV9B+rH6Y=;
        b=HkPfTmVU/U447OhMWL9FYiqg50b4mcgHA6ywuu1gZ5S3hOrKRMoo8CAuYF2u5mvM4v
         8r0MNn6upBGlvIrqzUQmlUTWn8OuDw5ROixsIFxn0D5/6zn1uN0WyHmykGje/NmLSOq5
         Y4GlpKz8Ituf8u+RRbx05LYYSv94tyimSuXigz6Nv1vdFjO3+l6L0ErLauu/y5uKmIx1
         /yYis/Ez0Y/9nhS6M0qIBIFSEpV0B1Rh1Sl2ZZX2QglQAnFg3sJQCEOCgK0a5nraKUwO
         ODQ8rTZHrr+/kH4oH8kZMmyIoH1HoDgXvzwfasGXEd99Z97pH0U4T8o3sNKRIgVWLqv7
         EYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592716; x=1796197516;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dV4BF6J45U2pVPcVBsCXGeaOfYJGsf58GzHV9B+rH6Y=;
        b=CbO/3KtiCf9Ad/3f7H3gWOQGjd4/4NRluxi9IgHUSzxPTKEGK03ua7PAxYUWmUBoBo
         wPaD4fRlsRj+dKMoyLLl2QimCnKIZWW1pdOj5W/BWqO85cYB99o0jazUdWN30rj/FcBn
         F26GSVm0PLzGOD0Pyo2ql/co60v69IgsH1YOhkOYDe4D7RUPGb7YJ6JeL360igJ8mZuX
         kxk81mxxUaJ4uqK3QQSPWR3ID6mOZEAdGFagBZx+bS40XeXUEurDs+dFXa432Pl07PqJ
         4sEM3ikjCoJgQMfZbX6qmpJe4aZBYF8r6Aa5I9NXLe3zAoyUpj3nDAxtOJBqFAByuA4W
         yI3g==
X-Forwarded-Encrypted: i=1; AL+hErGfiINu4+dnFocNeL+I8DqEIMv4fByXVFQiq0cA65/LtJnMMoDQKuLoi3twQDff70MNVryWXMI27Sqfwg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+3Bpa/9Wx37an/r/wmNE4F9MGLBdTT2b8imykb0N502ZhslHF0
	xv+zfXmq7Z+ZkABS8oNJ/sLAtDRPixSQiKkqTCyBhYPvP+bP8OOVVF/R
X-Gm-Gg: AZFdTZfTJHrEdeTolwVyL7xJsEeQNnfmCbrXRrvLR5k8z3MPmq0jCJREVteEqFrRx3S
	r9dRP9OyibwoNnOJ4X8vX2nIgv+Ekeek5I2thV4IgIfPUHgQU9/QcwCf4aH4J+GQC8peI3NyXiD
	jXdT5O6oUuP++73CNfMYNgXvNM5RBbRzMYIhxzsxODa+Q8X9Z1JK8whcaFXsx3rM5nuvzomR0h7
	ICuqF4QkA9Fwd71fWCcD1OaxfZBW1JRqhkYbp+QJTfrdiftityaIszfKKVVNGivbiA6CvEMOyCG
	Ld5Y+EZpcO5f5pZ9sFb6GJC3eHTv6x/sdlsDhREtpO6/mKSEWX8Zono38+cD8LO/lztqrJ2h+1O
	VqjJHK8qdNNqrlTh9P07Jc/A96pPV33mt/F3GpwE26mTcUrhbOCT261UNRNCmKodsF3fHbVfY4A
	IjfjqFR448ODhW2Uoaa1iQ7GnVJETreDDtEaKpA3MyNXAARwBZy3Z8va5jurZd7b8MI/sYyXmk6
	P8feXhnRiQyu0kZTaQAAz6oKHHOmVrIezGmw1Q2Yr60Ma1Wz5a7AOodDVsp6nMyxBf1i/3D1ply
	KysUhxcE0UQQ9vTW1GADBm7ca4qLNWtWXqB72Rov0eXPLivWu6YJt6kelzS4c4eWEtI7ZXgEDCB
	GksWXjKpQbWuq51gQdvtWmSde7M2ZaTilh8T6OtDMdTh86djfnoltnR+w6omdxLoBXwM/Nf+qW7
	abGqb+AtHUEkaFyZr/bCnHZOJwcwdYMbD59T1QO6C5D9eAc+3Bt+4=
X-Received: by 2002:a4a:ec49:0:b0:703:ad5d:e673 with SMTP id 006d021491bc7-71b326d0891mr12600232eaf.30.1795592716413;
        Tue, 24 Nov 2026 23:45:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fc97bb2sm15715251fac.9.2026.11.24.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:45:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 00:45:02 -0700
Subject: [PATCH net v3] net: stmmac: dwmac-sun8i: deliver RX checksum
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
Message-Id: <20261125-submit-sun8i-rx-features-v1-v3-1-79273f18a028@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwQ6CMAyGX8XsbM1WYA5PvofxMKDTGgGzTYIhv
 LsDL5xMmjR/8+f7OolAnimI024SngYO3HcpZPudqO+2uxFwk7JAiVopVUJ4Vy3HtDrD4EdwZOP
 bU4BBQamORzIZmqI0IhFenhyPK/0iOori+jsmxoPquHCX2p1D7P1n/WFQa/mnQ/lXl0ZCIQvjq
 K6srrLzrbX8PNR9u5oG3LLwPwtBAeYWC507TY3bsuZ5/gI6s22YKQEAAA==
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
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The sun8i MAC drops packets with a bad IP or transport checksum before
packet sockets or the protocol stack can see them, even with RX checksum
offload disabled. This was observed with a bad UDP checksum on an
Allwinner H616 with an AC200 PHY. The same hardware bit controls
forwarding of link-layer errors and checksum failures.

Enable error forwarding and decode the sun8i RX status in software.
Give checksum failures and unchecked packets to the stack with
CHECKSUM_NONE. Continue to discard Ethernet errors, incomplete frames
and lengths that cannot fit in the receive buffer. Address filter and
VLAN indications are not checksum errors.

Have both stmmac_rx() and stmmac_rx_zc() call a per-MAC RX status
decoder. Only sun8i overrides it. For other MACs, install the descriptor
format's existing decoder after hwif_quirks runs: the DWMAC100 and
DWMAC1000 quirks select the normal or enhanced descriptor ops there.

Set EMAC_RX_DO_CRC when enabling the receiver instead of setting it in
the rx_ipc callback. As before, the checker stays on when RXCSUM is
disabled, so turning reporting back on can use the result already
recorded in queued descriptors.

Backports need commit ee0aace5f844 ("net: stmmac: Correctly handle Rx
checksum offload errors") or its equivalent in stmmac_rx(). Trees with
AF_XDP zero-copy RX also need commit fcfc52fcf89a ("net: stmmac: honour
Rx checksum errors in the AF_XDP zero-copy path") or its equivalent for
XDP_PASS. Otherwise a forwarded packet with a bad checksum can be
marked CHECKSUM_UNNECESSARY when RXCSUM is enabled.

Backports also need commit 834ec9530832 ("net: stmmac: drop split frames
on AF_XDP zero-copy RX") or equivalent handling. The sun8i decoder
returns discard_frame | rx_not_ls for a non-last descriptor. Both RX
paths must test the discard bit and drop the remaining descriptors
through the end of the frame.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Cc: stable@vger.kernel.org # see backport prerequisites above
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Explain how both RX paths select their decoder and why the default
  is installed after descriptor selection.
- Clarify that moving the checker enable preserves its behavior.
- Document the checksum-status requirements for stable backports.
- Link to v2: https://patch.msgid.link/20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf@gmail.com

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
base-commit: cc7fe6e741730fef549e484379281736d32746f0
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

