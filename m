Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594721;
	b=MAYE86/aXuW6IHpvCyli/o8EHXZ4JzpBvoHC0dj+DA8s8ow7zea/MlFO+gbdc/aisJ7b
	 O3251awd1ZqcTrVcq72EI/8cVQK5W3yJcf2LK3sZPzjRV9qymtlkAYiwjRUeOszU3ThXe
	 JjlKSjsLs16hM1D8SkiqH2h06Gfn/21F1KdxZaND4M0l08Xt+/wSpuQ+WEaFWZHRyvx+n
	 IH3VLhqIsoGmk+K+2XEWYKhxLoSoeb8JaYZgd0pW1wcQZyK1oGs9KtczIcjciiilr8IQc
	 pzlpFkK744BSpe9sgThrDMXMMgrChRQmkzdz6Tj1R+3uN3HGoT+eDJiY05cPgNyl47g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=;
	b=FOd72OLtl1/pZXuaxXq415lqGFNPntpLtdwIkns4ypSjnLl4R2RtDjz5FcYF1wP4NNS0
	 iAaRIEK1fEY7hnwzedj6T5FwwwUXhjC6Dn9pcnLyVbJDrzYAFMBLojt336CdKXM4Qd7+B
	 hAfrMaAlEFl1It00a9u1Ib/ApknGa5LCC3RA/Hk9/Jjmk+63EInpOgpeg8+cxDvLiEIld
	 fIbv3oqiBI3tlQ6wi4Y9SzsuSO2g3rfpPyCmnDaw8f7h6RSAgC3l0oK6vrF2dKwfc9Yd1
	 ygbXqn19umMaU+CIVmaWSYmSSSLmyXAfvVQUWWP4O6BpJTQ6CdRG7koPZ+PxcVw7vFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwcrVMUN;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9849C606A33A
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 08:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9849C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwcrVMUN
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-862aca1ed4dso2209050a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 00:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594719; x=1796199519; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=;
        b=RwcrVMUN6L7WaR9kuEED5+yYr8XxbEfMrnjP4FIAu+1RYmlQOJt7n0mQhbVL1Ib+uS
         /CmRourzDzFNfxeRGjPuMvZJ0Q7YqZ2NYVTQCpNAv+SeWhc8j9St9kcdAAoSxXc6qe3B
         zNUz8ojz1R+2T+GNWMRd2a3Fyq9QdWW55gHv/hE/kzyB7PezgQTIC7bXrs+pLAyXauI4
         Hpt4gvPcaKHC5zRb9+o8PvOUxqtVU7CwffgjKYvvioOYPRqhyqZ3c/VVYG0uQPzEuPnR
         qqAw8ro3T5KYzIBBLwLEMYpIXvXT0wnRjh6SuxZsCwuKVZ9mnD+IpZo7TgmQXV2ZZDgh
         7UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594719; x=1796199519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=;
        b=QGcx3rZFHCT2dBPI/yQA7vv4QQAxm5jyujmAdQ4YU1fsNwFPbmD/kY8Att5RQUdK+T
         E5legUVOCTsi+Ll5oA4bhn6KaLbeTgrCyqOhMFF81NLHnr0x509I9jXJtYiGyzf6MjLd
         xWQiJ/7QtKhmsy4R/G/ovLqXGyING+CEO/qMcLKry69KxfR8ngZwDiMQ+ruAFnuiYDKe
         HYin5pIfehAvkAwmmbdMQxbMN+l87OeBN0Pv88NJ6CN2kauT67bprpjridMbZOFPUIA1
         UcoIXB4kitLONclS4NMzkAAJ3rs8bv3ldGd3U2WAsf0eBRCIQgoN1tsy7s4Ydf7gAuOt
         k2yg==
X-Forwarded-Encrypted: i=1; AL+hErFuWeqNpD8Drqfzqhfbv/pqUkAqR4bvX5cYu3U6ez613pHZN2jPWPTg6HKzJva9Vf7U2heGKn0WZsZuVg==@lists.linux.dev
X-Gm-Message-State: APuU4Z//GbxQc2rKOutz8GKsdJ5ohtozfvxG3HwPbXvzgn+f/jmX0b8G
	9NFCm8suV/UYC9tremuqkcPwiVafMlrNSfz2nnmN4f1rFn7f9G2RK0bN
X-Gm-Gg: AZFdTZehdQiUooI5Ohqvdz15kwDGcSCtYPCNmby0CsMN8FV3gL4T1x9ypfnYtgmncZ7
	7q046BoEEcmmoqWljpDmyDGb+yfQDv8mQMx4U6h8VzCZPMnjz0gftIXdVMtIuYzB8UbpgwqpeCB
	5/DN0iLW5lmkcXewutJmd5GsocCViiALmchzpuH7OpGBhfP8GhZr8ISEBcOVvnUv2V2ZSBLHeF1
	JOQ2dwTkxSh1U2jGiIq0xT/WsMHwjcPW0gqZOGmROBwsMnk1lHVS9h2o1/1ZmIUBXi9GbcE3WJx
	/cFBUyugiLReWAUDG60ZpZs1EZOcoseehcUBNAeC6pdVXjwEW7+jHp2kicTaAZU9n1znWC+LYRa
	2Xmvk0dY2F6yNivlAkXRGVe3kBkTeooLn6iAFCS5JrzVK2kftThDcXNwrbe7qYhXd22lhHsKEpr
	YypSUa5eDhQyA7pgLWecwpkBSoFsSk2OAx/yQXv6gId4QMhstW52XtVW5haBuICil8ZlZNVlwnW
	4phsMXqzTHcbJWyRI5Bqb7Bm9FHWH79KKWxa5dudbBEpvrU1OXriiI4G4vOVV2oQwfy+0NaSS2f
	ZO3SHql30dn/L+nKtxBThyUrIQR56jZ4uflbi7Xx2VLACl4H2rAhHKeCXBEvGdE8C39ougBk5lX
	1faHr1QDgGy8cZfGopmywwbIU3uNaGbxX/Ed8zXeddv2/Xhsp+0kDbSxBSgU/k2Ah3uNMhaF7ZZ
	GW/is8q/v+GALPeCab79fotqbop1SBNToN64vWchqIEkYzKtJ4JYtW
X-Received: by 2002:a05:6809:3cd:10b0:57e:3c4f:4b60 with SMTP id 5614622812f47-57e3c4f5310mr4622821b6e.58.1795594719588;
        Wed, 25 Nov 2026 00:18:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:31 -0700
Subject: [PATCH net-next v2 2/3] net: stmmac: add common RXALL handling
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
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-2-4de03fbde087@gmail.com>
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

Allow a MAC to distinguish complete frames with wire errors from
descriptors that must always be discarded. When rx-all is enabled,
deliver the former without trusting their checksum or counting them
as good packets. Keep counting the errors in either mode.

Apply the same policy to page-pool and zero-copy RX. Advertise rx-all
only when the MAC supplies the receive-mode callback; leave it off by
default.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 3 files changed, 40 insertions(+), 16 deletions(-)

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
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 9ea76de030e4..81c8ac3756a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -354,6 +354,8 @@ struct stmmac_ops {
 				   struct mac_device_info *hw, u32 chan);
 	/* Multicast filter setting */
 	void (*set_filter)(struct mac_device_info *hw, struct net_device *dev);
+	/* Program the MAC receive mode for NETIF_F_RXALL. */
+	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
 	/* Flow control setting */
 	void (*flow_ctrl)(struct mac_device_info *hw, unsigned int duplex,
 			  unsigned int fc, unsigned int pause_time, u8 tx_cnt);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 70157efc2255..8102a72c52c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5646,10 +5646,12 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
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
@@ -5707,6 +5709,21 @@ static struct stmmac_xdp_buff *xsk_buff_to_stmmac_ctx(struct xdp_buff *xdp)
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
@@ -5797,11 +5814,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5995,11 +6009,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -6161,8 +6172,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -6462,6 +6475,11 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
+	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
+	    netif_running(netdev) && netif_device_present(netdev) &&
+	    priv->hw->mac->set_rx_all)
+		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
+
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;
 	else
@@ -8276,6 +8294,8 @@ static int __stmmac_dvr_probe(struct device *device,
 	}
 
 	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
+	if (priv->hw->mac->set_rx_all)
+		ndev->hw_features |= NETIF_F_RXALL;
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */

-- 
2.53.0

