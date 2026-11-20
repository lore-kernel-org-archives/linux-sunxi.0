Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200877;
	b=uQHozi/45ann8vmO7ht1hUF4hBXxMuZeGQmc8sdaLfY0JBQ/pOzldebTteLOoKNE7uar
	 r1rHCayTjJa5GTdqcYEpt8NkL+NyVYrpFHBxtSw+RQ5Vx61wSjoQ0aYkVabWJllQIFWkQ
	 kfiQvvwnrgvUwcWgXIpbFpiG5i6QT9wedlxdVEesQ/XxB6JXF1vQD7SbujkxOrzZHUzzX
	 V+zKn44k167LU0INmqW+5AlTBhYMXr+cWn9IwtYZki25Qp5RkB/Zocd85FI93AMel13mC
	 hnxP/sxwKyVAMFhl6zAqQ/unlyI/Q/52tuaXqrZdB1u4L5whRNAZpxcHU+A1lScULig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=qZ9jzXfe0GCatNSfKrBc0n0QBd0Pvv8QJi5/jcS/n8w=;
	b=Ee/Q4vbKlX3NzOQtI2F7jPCb25AYIMzvWxM3FCGSmHN27RRerm6OPD+mSeOz0H7IBcgE
	 +wrM29HI6/5Y+Zl5LVvGkk1+84QSyQrHeZ6H5RfxEj3V/8OSUoosUzvet93wtu5iyY+RY
	 Z4VKg/KxyVddxc1Ei4pusp4prAM6JzWvUf9giy9Kh2Gkkas3kJXLid/GDLiEVDaDNXex9
	 XVOutynsQ8xQRn3Y/XS8Unm2Tkp4CAEGeDSsNKlKLA6zGJVK+PbwEE/SyvK+iqwkgTyyU
	 VjPetwqz/5CDqPqADK4ZaqmLvzH4ympIvgEEkEE7sQ8snftnH7i1dXOV2twNrg9/CtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+rf4xI6;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8460A261D
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 18:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF8460A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+rf4xI6
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f84a55cc06so798479a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 10:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200873; x=1795805673; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qZ9jzXfe0GCatNSfKrBc0n0QBd0Pvv8QJi5/jcS/n8w=;
        b=E+rf4xI6Yp+j1afPWikurcW7BVl612l9n7p/7Q9cHP6MQEVlJ0yzgQyDroFuuzWvw8
         XpFjWdQ90SllqNNGbGipeNLz/lqrPUq6T0x7N8mEa/MZTFSj5+F6HJBX96yQmBxkrz6K
         bnBSDiVPBbqWiabnAkWHtzPCYGTzDu+0Jf2ePnoPvez6XOfoxNlzlxxgVsMBPpGSgTrq
         ye8QyRQDeTsFCKKIAXwT8AzmUlK4m7JrKH1OR5MbCt20jtR+D2wwRUeqftHQhUZcKS8K
         3VrHqXeoNp2SuTXtH8YnvcvMETj7sXJUO/C7JGmLq3Au57ZxepQcKejIP5TKnr8avw8b
         6gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200873; x=1795805673;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qZ9jzXfe0GCatNSfKrBc0n0QBd0Pvv8QJi5/jcS/n8w=;
        b=Rx6FVXerUkTxFQTUmlimxvC0h8pJtPKWHb/ad7QDs8AJibesGFEcZUbCxyityIveZb
         2ftDmY3R1qdU7pAfv/sRB9u3TLdfQ5ExKn+wCo/rKJqHbZLllVeyX92PX5+fEtLolvXc
         LwA/L98ahEeGJCW4YaDN8IZOihLKrmxbeUvj75TwKv0R4abdcdqxPE77Dh0W61KGgJ2I
         UfUP8JwxFUPJfCqiPOAbZBAqly5eBL7dFrbVCw6x2hFrXqM6J4xRUAfluWF75J2Cx/2/
         asdKmiiMPoH1G9ua1pBpL21gV7jsw7EMORzCRMGMOUo7Pu6cTv7Fsu7021IStcS0UYWL
         0g3g==
X-Forwarded-Encrypted: i=1; AL+hErE01yICo+9zlqu8ZsQcCrD+p8JKbnZjGimC55pdCBnepoAh0wdvel7jJG5xV56AjbSlGO/0xJTw1g0SKg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9uLJt2zf1f4jyixv94aqVHkr3YVbv2jkrrdqo5xL6Ns3q0gGhW
	cf2/0WI/AIJKIo5uQYBn+M6cH731U+6YqoHbP7YC6+F/EodSFbN14wRu
X-Gm-Gg: AYBFou162BtcYmxvULE0A/c4iExqHYk69PcWkNLd6uXGS791W9aBEHYk6T1QnRd1S3J
	Snl+MV0ha4zUonK6ej9Lr8xdGopSIWfRYDS9KjcYO4ZhARuzYG5VCLdWVOQLqnkF8RsbWexWIpD
	kvJ0zfxxaB9VUhRFG9FcsOkknFblM86JOt4ErSa13L76altTeEbiemFNR54UZRqeCc2em+Pxs98
	WhZCBlSKtuiIX3K6VEHivQm6g6qgdrrB+OTfUd9FQFwy92nwAKlrBe07e8xxHgkfmbsajZkO+X6
	4VDhvKVVUdqGEoUQaqkbUpDu2YAiueHW7c4ll+7voo+k+ilz5fET6b94SQtTz0RKwPYwd4K3Mo7
	D4ECc9AD08YHy6zpAM8K3Wt2IAd/ibSHJi25Jfqkz0R1d2EbABMoq1rn16NirhLPj4zLxcSKlNa
	alsl6tq2YxgWOAUwjQQoHn1pMNlobsFN/ITuYuSwTTPn2b6ie20m3jCfbx7siCi2BhVUhssssTs
	6uMES2fD44upNZuOstdqOAXgxa5w9iK8VPM9xqhha9qC0p0jE29yi8N9Z8YyHuiwsq0JROrmHSN
	M90Soie+WB0WAVBldf7ZV2jOdrDJ1kNQX8lUg/vgw/N6FzI7LTGbDRuL4sTq+o7QArgnEbQThv9
	Mc4TiyUjVANux83hxVxutgp8MSj8UxBeSxxjP7lRpWK6qvbzMH6BwYXZSC/Jb5hyHsr21fF/dTR
	HU28upC+6Rr126vGPyIA90M0PCKl1qMN43VKPUXxkV5WH6ibsHMtI=
X-Received: by 2002:a05:6830:2709:b0:862:c9e8:576e with SMTP id 46e09a7af769-863158eca20mr4479904a34.21.1795200873213;
        Fri, 20 Nov 2026 10:54:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f6d9asm2812296a34.17.2026.11.20.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:54:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 11:54:28 -0700
Subject: [PATCH net v3] net: stmmac: preserve RX checksum capability when
 offload is disabled
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
Message-Id: <20261120-submit-stmmac-rx-checksum-capability-v1-v3-1-e9e1fd85f380@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6toYWKNSV9zAuSh1klAJpC4EQ7
 m7BDUtNZvN/ft6bhTiwCI5cooVYGNFh14aQnCKia9U+geIjZMJjLhhjGXVDadBT541RmtqJ6hr
 02w2GatWrEhv0Mx0ZhUqINMuLQkpOAq23UOG0m26kBU/u3zLwXqD95thmNTrf2Xn/Z2T7+G91u
 OBXXFQqEYUs4fo0Cpuz7sxuHfmRm//O5YEbZ7KSqZQ6KcSRu67rByFuJbRNAQAA
X-Change-ID: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Disabling RX checksum offload with ethtool and reopening the interface
can make it impossible to enable offload again. GMAC, GMAC4 and XGMAC
return the IPC enable bit after programming it. A clear bit is expected
on disable, but stmmac_hw_setup() treats it as a missing capability and
discards the detected checksum type.

Keep the detected type and pass the requested setting directly to the
MAC. Check the result of an enable before allowing RX to mark packets
CHECKSUM_UNNECESSARY, including when the checker is first enabled on a
running interface.

If the MAC fails to enable the checker, mask RXCSUM in feature
negotiation until the next MAC reset. This leaves unrelated changes,
such as VLAN stripping, available even when RXCSUM is still requested.
On open and resume, reconcile the active features before starting RX
so ethtool reports a failed enable as off and a reset can restore
offload if it is still wanted.

Found while investigating RX checksum offload on H616. Maxime
Chevallier reproduced the capability loss on AgileX5, CycloneV and
STM32MP1.

Fixes: d2afb5bdffde3 ("stmmac: fix the rx csum feature")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
The sun8i net-next series [0] overlaps here. When merging the two, keep
the enable argument on the renamed sun8i callback and apply RXALL only
after the RX checksum change succeeds.

[0] https://lore.kernel.org/r/20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com/

Changes in v3:
- Check a live enable before reporting hardware-verified checksums;
  defer requests made while down to hardware setup.
- Keep a failed enable from blocking unrelated feature changes and
  recheck the saved request before RX starts on open and resume.
- Pass the requested state directly to the MAC and document the
  callback's return value.
- Link to v2: https://patch.msgid.link/20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com

Changes in v2:
- Correct the Fixes tag to reference the mainline commit.
- Add Maxime Chevallier's Reviewed-by and Tested-by tags.
- Include the discovery and hardware confirmation context.
- Link to v1: https://patch.msgid.link/20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |   4 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 114 ++++++++++++++-------
 8 files changed, 86 insertions(+), 49 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..d7dd6c5d95d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -699,7 +699,7 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
 }
 
 /* caution this function must return non 0 to work */
-static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
+static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 v;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 66337cfd9824..767836e75a10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -77,12 +77,12 @@ static void dwmac1000_irq_modify(struct mac_device_info *hw, u32 disable,
 	spin_unlock_irqrestore(&hw->irq_ctrl_lock, flags);
 }
 
-static int dwmac1000_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac1000_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + GMAC_CONTROL);
 
-	if (hw->rx_csum)
+	if (enable)
 		value |= GMAC_CONTROL_IPC;
 	else
 		value &= ~GMAC_CONTROL_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 94d24d355d95..e9492a853c0d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -48,7 +48,7 @@ static void dwmac100_dump_mac_regs(struct mac_device_info *hw, u32 *reg_space)
 	reg_space[MAC_VLAN2 / 4] = readl(ioaddr + MAC_VLAN2);
 }
 
-static int dwmac100_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac100_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 259e2ebed8c1..87b25b3d9c3b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -329,12 +329,12 @@ static void dwmac4_dump_regs(struct mac_device_info *hw, u32 *reg_space)
 		reg_space[i] = readl(ioaddr + i * 4);
 }
 
-static int dwmac4_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac4_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + GMAC_CONFIG);
 
-	if (hw->rx_csum)
+	if (enable)
 		value |= GMAC_CONFIG_IPC;
 	else
 		value &= ~GMAC_CONFIG_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 6b2bfc241109..e76294120bbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -65,13 +65,13 @@ static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
 	writel(rx, ioaddr + XGMAC_RX_CONFIG);
 }
 
-static int dwxgmac2_rx_ipc(struct mac_device_info *hw)
+static int dwxgmac2_rx_ipc(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value;
 
 	value = readl(ioaddr + XGMAC_RX_CONFIG);
-	if (hw->rx_csum)
+	if (enable)
 		value |= XGMAC_CONFIG_IPC;
 	else
 		value &= ~XGMAC_CONFIG_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..e7eeaa83acfb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -319,8 +319,8 @@ struct stmmac_ops {
 	void (*irq_modify)(struct mac_device_info *hw, u32 disable, u32 enable);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
-	/* Enable and verify that the IPC module is supported */
-	int (*rx_ipc)(struct mac_device_info *hw);
+	/* Configure RX checksum offload and return whether the checker is enabled. */
+	int (*rx_ipc)(struct mac_device_info *hw, bool enable);
 	/* Enable RX Queues */
 	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
 	/* RX Queues Priority */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b76acfe0d958..042a78ebbee4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -269,6 +269,7 @@ struct stmmac_priv {
 	bool tx_path_in_lpi_mode;
 	bool sph_active;
 	bool sph_capable;
+	bool rx_csum_failed;
 	u32 sarc_type;
 	u32 rx_riwt[MTL_MAX_RX_QUEUES];
 	u32 tx_threshold[MTL_MAX_TX_QUEUES];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a685ce4638f6..786eb089dc2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3675,25 +3675,51 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
 	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
 }
 
+static int stmmac_set_rx_csum(struct stmmac_priv *priv, unsigned int rx_csum)
+{
+	int ret;
+
+	if (!rx_csum) {
+		WRITE_ONCE(priv->hw->rx_csum, 0);
+		stmmac_rx_ipc(priv, priv->hw, false);
+		return 0;
+	}
+
+	ret = stmmac_rx_ipc(priv, priv->hw, true);
+	if (ret <= 0) {
+		WRITE_ONCE(priv->hw->rx_csum, 0);
+		priv->rx_csum_failed = true;
+		return ret ?: -EIO;
+	}
+
+	WRITE_ONCE(priv->hw->rx_csum, rx_csum);
+	return 0;
+}
+
+/* Recheck the wanted features if this reset clears or uncovers a failure. */
+static bool stmmac_init_rx_csum(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	bool was_failed = priv->rx_csum_failed;
+	unsigned int rx_csum;
+
+	priv->rx_csum_failed = false;
+	rx_csum = dev->features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
+	if (stmmac_set_rx_csum(priv, rx_csum))
+		netdev_warn(dev, "RX IPC Checksum Offload disabled\n");
+
+	return was_failed || priv->rx_csum_failed;
+}
+
 /**
- * stmmac_hw_setup - setup mac in a usable state.
- *  @dev : pointer to the device structure.
- *  Description:
- *  this is the main function to setup the HW in a usable state because the
- *  dma engine is reset, the core registers are configured (e.g. AXI,
- *  Checksum features, timers). The DMA is ready to start receiving and
- *  transmitting.
- *  Return value:
- *  0 on success and an appropriate (-)ve integer as defined in errno.h
- *  file on failure.
+ * stmmac_hw_setup - reset and configure the MAC before starting RX/TX
+ * @dev: network device
+ *
+ * Return: 0 on success or a negative error on failure.
  */
 static int stmmac_hw_setup(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u8 rx_cnt = priv->plat->rx_queues_to_use;
-	u8 tx_cnt = priv->plat->tx_queues_to_use;
-	bool sph_en;
-	u8 chan;
 	int ret;
 
 	/* Make sure RX clock is enabled */
@@ -3738,12 +3764,16 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Initialize Safety Features */
 	stmmac_safety_feat_configuration(priv);
 
-	ret = stmmac_rx_ipc(priv, priv->hw);
-	if (!ret) {
-		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
-		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
-		priv->hw->rx_csum = 0;
-	}
+	return 0;
+}
+
+static void stmmac_hw_start(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	bool sph_en;
+	u8 chan;
 
 	/* Enable the MAC Rx/Tx */
 	stmmac_mac_set(priv, priv->ioaddr, true);
@@ -3806,8 +3836,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
-
-	return 0;
 }
 
 static void stmmac_free_irq(struct net_device *dev,
@@ -4216,6 +4244,9 @@ static int __stmmac_open(struct net_device *dev,
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		return ret;
 	}
+	if (stmmac_init_rx_csum(dev))
+		netdev_update_features(dev);
+	stmmac_hw_start(dev);
 
 	ret = stmmac_setup_ptp(priv);
 	if (ret)
@@ -5233,7 +5264,7 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 				       int status, unsigned int len)
 {
 	unsigned int plen = 0, hlen = 0;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 
 	/* Not first descriptor, SPH enabled: buffer1 only carries the
 	 * split header of the first descriptor, so it is zero here.
@@ -5264,7 +5295,7 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 				       struct dma_desc *p,
 				       int status, unsigned int len)
 {
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	unsigned int plen = 0;
 
 	if (!stmmac_rx_check_buf2_cap(priv))
@@ -5569,7 +5600,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned int len = xdp->data_end - xdp->data;
 	enum pkt_hash_types hash_type;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	struct sk_buff *skb;
 	u32 hash;
 
@@ -5872,7 +5903,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int next_entry = rx_q->cur_rx;
 	bool in_progress = rx_q->state_saved;
 	enum dma_data_direction dma_dir;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
@@ -6372,7 +6403,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (priv->plat->rx_coe == STMMAC_RX_COE_NONE)
+	if (!priv->plat->rx_coe || priv->rx_csum_failed)
 		features &= ~NETIF_F_RXCSUM;
 
 	if (!priv->plat->tx_coe)
@@ -6400,18 +6431,18 @@ static int stmmac_set_features(struct net_device *netdev,
 			       netdev_features_t features)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
+	bool running = netif_running(netdev);
+	unsigned int rx_csum;
+	int ret;
 
-	/* Keep the COE Type in case of csum is supporting */
-	if (features & NETIF_F_RXCSUM)
-		priv->hw->rx_csum = priv->plat->rx_coe;
-	else
-		priv->hw->rx_csum = 0;
-	/* No check needed because rx_coe has been set before and it will be
-	 * fixed in case of issue.
-	 */
-	stmmac_rx_ipc(priv, priv->hw);
+	rx_csum = features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
+	if (running && rx_csum != priv->hw->rx_csum) {
+		ret = stmmac_set_rx_csum(priv, rx_csum);
+		if (ret)
+			return ret;
+	}
 
-	if (priv->sph_capable) {
+	if (running && priv->sph_capable) {
 		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 		u8 chan;
 
@@ -7650,10 +7681,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	}
 
 	if (priv->plat->rx_coe) {
-		priv->hw->rx_csum = priv->plat->rx_coe;
 		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
 		if (priv->synopsys_id < DWMAC_CORE_4_00)
-			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
+			dev_info(priv->device, "COE Type %d\n", priv->plat->rx_coe);
 	}
 	if (priv->plat->tx_coe)
 		dev_info(priv->device, "TX Checksum insertion supported\n");
@@ -8575,6 +8605,12 @@ int stmmac_resume(struct device *dev)
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto error_unlock;
 	}
+	if (stmmac_init_rx_csum(ndev)) {
+		mutex_unlock(&priv->lock);
+		netdev_update_features(ndev);
+		mutex_lock(&priv->lock);
+	}
+	stmmac_hw_start(ndev);
 
 	if (priv->ptp_enabled) {
 		if (stmmac_init_ptp_clk_freq(priv))

---
base-commit: d7f2d9b6c7d0ff0af7d19d889810d35dfe07da90
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

