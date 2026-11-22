Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333590;
	b=rYMK5xKwLV9NaIOcxPGb/NsrO6TqmJ/3JgGQ8wYIJWRfv66MYWi6/UGey9L5Vi0vDOiZ
	 lBjyZyyOQ6VbuicmZ/wH01WsOrA+kfwY/pEGCQgFvnVtTdkkEbu4nMabJXlcKwn1z9EZN
	 ijbgYS1/izdU3EvDRSfibCQP3Kcuxd2737z6nhxCANRxCImlzWLE3JaAE6TP77BJrVreZ
	 ZyhWH+or7D4unssAlbkrOc0OYnS7l6JQkkg7gqzrD2Z98gTrnGbN9ITfhcrR7zWhvuDAe
	 TzFRozKXi0FGjeFMXrCVrgXiO88IR+OfvR6+CjViVyVAJo2OlL+Ix9PKSIrQHL7REow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=;
	b=cV06CEe5G86EEiDsFMoJnTiE/vwqebKfYwqY7rAZY7Eu224Xym3WSllWA23S+hLoYp/o
	 j6SI2E+qo5B5p/heSe7vd0MEKap49H+/zD2jpDOw2XDM0QNvO1RAoes12aY4BRFfCgKpM
	 Ml1frqAbZzA3tcvvh6l4JGagP+0SBhvhDXMxpiQ4x9Mbwwt/naOtY+d7g1UGHz6MzcwXE
	 /8ve87DxUTDljLyJtAJtAiWx/ZhGv6PC5tlnq5U7SQJovBUYclxe3j4hskgxVfbroNzgf
	 I0oQv8CxIEcBQCSMt4L0lroK6j1nEePwv5P58eQ9dfWpyaGwPHdvenu9cILH3Wbf+Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCMrsBjR;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A848606A337
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 07:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A848606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCMrsBjR
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b28d7c729fso1914970b6e.0
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 23:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333588; x=1795938388; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=;
        b=zCMrsBjRluGplpvM99V8xAn//DswU9qdlcG8Qibhbl8cdV3EvlKlb0Wk7+FxXhrD+M
         KyL059q34ayiPcjp8JK4lB/pnzJKFKoD/h4m9lEihnIBAFQo0tDN9WyEGVfpl676uPAB
         zG3sU+RZi5vifS/3OdQXFUJble6vQc35hoMMk/kPCugzkt0+DzsYfpeWPaINjOjazSdr
         mYd3RJJXw6SxwZT4OvtqVCAPf+idj0tV+gmB2IWKHZfF3j6bIkncC8K98FlhEe3o82LK
         kPPUhslOzQ+xfmb62W+1cYgtq1N6BWAvWyulwQqftU+r8YvJHLfBbMS/Dx7060yet3Y4
         fWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333588; x=1795938388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=;
        b=H7ca73lJyRiYhg/YkoCuD5PmtmLLLyaoazUB5QT9Y+WMkgN+S/rLSyh5HakWabC+JA
         RFPjcah3bUQZnZbeytFOJVqBDVROxdr8KmDccOx+83RRvmyDr3EoM+u6qvszKZ64m37M
         Ice6mCFDFGOpq4mY1pEPZCCJ/Il6AeKiUXy4+Jlf0j3HoRVy34RxgXU/pmTfEdCfJjuM
         UlVXM4uJ11KdpBIEryXnPSVCMJpclmNMUEmW9szC4ZfM/ysdOK5pGECLWqDs1p1RmyPd
         qKNQKCYAXQqXrqsLQGsuD/CCRrDsW0X8Fcy5zM0nqqC99CeprfQry5qp9F5jXuOQxtsU
         TZFA==
X-Forwarded-Encrypted: i=1; AL+hErGxbE2DVCh3HEO70rS2ZqH+yf0PNAR1Ye+Yxbac4BeRN93I3++wsLC5hc7Z4C5nEvYPfbWCsp3r87DRUg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9B0K+tsCOiDvvGihiGpDzOqVwQclOaNNqWzrH6LIjxTHu9RS+J
	B6UDC4GtN9KlKZBrKlPkmYJxgCrBxmbQvQ9e6z+InbxQdc9hSyWCPiaG
X-Gm-Gg: AZFdTZdEsmXdF9O/53sMcrGmtBoiindLmTPqf/yHivVf2b4F4D6yyUCZ9mRzn3hivx0
	hX1/H5hS6LNT2sbuEQGctePRzfmvAuzezqdSlk3jnr9m5ibMxRMr9NAQedmSGH4LFr4TSGd5TY6
	xwUYcg9SpL8c2hvFiniFtoNdGSAiFoKdyB0gpbh+K/iiSzK1WPDDrKVxNcT4YI+XDtezEZFjDXs
	0j7YdUbQrVZELlfC7T+1E+phbLlLMzeXCMLZqn070lesAsUBqpVh2KNhfxNibLaCmjfLWAAwOIU
	ZOXgs2hUo6Hv4iTPyHxqlHLYMYz4Exb3M2sWUmdazbakHDI8SI/EThwMdC+duSyVu8KpNLqvKBW
	jDktYNnJC0hZJF+mNPYgQo2kDua3QV8KhVsmSyrBYOf3DVSuDYgLfFiPkCbeTLQ/K58zQRPp6Jk
	l7GUKfIVZW9kHdeoGAj9vWvbcUDsvj+bejLf4xfSFz4Go/cyaciEzjlNCemHkJFznPB2PGQX+EJ
	4QanIMDl8IHQ5Z/G48NTOTSV2fwZ4mqd8Sxf0GBS9nlmXU/QthCwbiNqGP1qYEUCunbNouNrQt7
	eZEC+Nzi8Vhj+F6wstyU3uVQZpuV7gNxcEu9t6Px2Cygka8GJoqUb5uXGIPvppnCU77W40QNr1Y
	ylj1Ov3tVgDUgcwXBa6Xi6StJNB4h9/ZJ3YL5+xXU1e1wK09JXJgWmjLldaF0IfRfaac4nD+VRU
	e2r1uOGsnzWjnRz21zmV6aENcdcXDw/FXQYp4DQyvCISAZ/oCzFLh0
X-Received: by 2002:a05:6808:309f:b0:573:3cbc:9775 with SMTP id 5614622812f47-57a0900b93amr8494959b6e.27.1795333587934;
        Sat, 21 Nov 2026 23:46:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 00:45:46 -0700
Subject: [PATCH net-next 1/2] net: stmmac: add common RXALL handling
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
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-1-607789772c56@gmail.com>
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
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 3 files changed, 39 insertions(+), 16 deletions(-)

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
index 9ea76de030e4..c20babf8cb45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -321,6 +321,7 @@ struct stmmac_ops {
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
 	int (*rx_ipc)(struct mac_device_info *hw);
+	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
 	/* Enable RX Queues */
 	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
 	/* RX Queues Priority */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 70157efc2255..32e7906522a0 100644
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
@@ -6444,6 +6457,11 @@ static int stmmac_set_features(struct net_device *netdev,
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

