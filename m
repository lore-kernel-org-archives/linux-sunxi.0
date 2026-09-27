Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F9F3CC7D3
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546422; cv=none; b=rSW5c+M+zWc3moepyteDOYWnbFJxB7DqDpjRlURWZahJ5sSA4fZSRve6byqRUnFijqUdwESMCzM9G+M6BiLohC1cGVlaIPcAQK8PpAU6LJNVvaSdwjbxUNIYV3QOas0TZ6FF3/KMxwpeI8LtGIMSMoaEZbNmgdbMtLEb3mp2ECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546422; c=relaxed/simple;
	bh=Wg9uOKO2uavAXfyYKzZQM2kSoq6T2GSD4zo7KjquxW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2ACiq/3LVX5j23uu2bxuXqmVIATWl1cbNopchQA6hjsVWU7MjuHcDukKrf8zu5Bvjncpo5IsBlLEYG8F3e7AYISsqp2rakbxLNs3lX6/9h1GSYiVDXNq0v6qD10gLBN9vAY2eyPBVX0d9s+UMMhRqVWQe3XGFeLKsagHYJIuSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJM4xsfU; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJM4xsfU"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-8144632e066so1346508a34.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546411; x=1791151211; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uF7xnPzdi03tjllE2GYzrJD/eEbjnznIoKovj7ZFXd4=;
        b=sJM4xsfU/+84psnVXoutp8KHUBqWp8dPByB/25Dz+juCWepeSuv8ZBbh48swq8D6KY
         XsrBR52+edKEgJPhE1hIAKis2YZwHIVghtjsp1qRYQrGpC1eJH485G6uH3lkGTU2+iIt
         8yieiKsaoVBPM4uj9locPH3GWvj0d1VZU4pZpsvoRSAoXjd7vmdYop7rHh9IjCTMFnft
         cNtwDPpzGAneIAchG4GGVj13hVrysRM5Obsa1n+8+Dz9jNxEW4Lb74L0OTx4ejXN4tg8
         RYCg+4aIqHCgVI+PRoQn4/KW+D/dkgNmOeBNr5T1rEyuH6cWcUUbCMWqvEvWkHAcP1Ac
         yQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546411; x=1791151211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uF7xnPzdi03tjllE2GYzrJD/eEbjnznIoKovj7ZFXd4=;
        b=Q6p7iCY4+FyoU4yGBE+LXXNnyp9UtbCsYz1W0RX0EZ2grTctU7j86JCWhaseAEVLzl
         Nnz/REhZ4AYR8MdoQEdLk1LsCmoN+/lOm/AkAZBHsLKGd4c2LoLysfLwRJq9j2RgGRa3
         IxloipSChkBQq73uiMMNOrgpUr2pd6jaheMlcpJLVipSz6mTQ6dYf5B/j7cV+jCP/5lx
         PbQBG9U6tL/E261ZcjuH6ZFIRXJHCLy1gmm6gt+29mWwfa5W5xexit1HGXEzzMNmrZGK
         BfCIuHLZrzetcxSZJpuk1Wa6345FTIdCag+QJ/R/GuHopl6DxomxLVMDw6L4sjU49AZR
         jmGw==
X-Forwarded-Encrypted: i=1; AKwUvBywcmjTo00XAFzf30HSNscl8Irq7ay8i36z3vcdTaiFr2DBCEPbV0GjvKe8x4oWmsaHQQXp/Ul4Ebb9fw==@lists.linux.dev
X-Gm-Message-State: AFuF++nghNDvYq3RePdz8yT190IAKW3YRdbxRWM6T2n6ufxPxInedOhF
	QVRI5I+WyIHEWbfRYYJOqK1OpiDT2nTZgwqRSNi3eeM27iuXpBZQoXqP
X-Gm-Gg: AYBFou25Aw/tZMLivikzCa/KBPYHnLfGveWpJUuN2OasHqZxnIO5SE+dWBw54lzzXqg
	rb1Sx5B3jgdLh0eT0iue3A6tifLr1RVcKM5Eh3zQn0VgWCXglCorQkZ70uS1afjUDNiDizYrZju
	MKnGVpG6VurTviA2vIAQ/SPPif5H8cR8AyU9aq73m6u78N//HoIT87AJQeMbwXEVZ0GP7PYCIHN
	C5jLXRffgr+0STX6em2szp/4/IkGCJFvg6hXc8rbbD0VzDJrh6meII7Pjb9VKCs3gzhsMipCEDf
	+ye1TGTkYQxwL09wO1eRZtr7EdQbfbP2t4rByGa274GLn6KZCW1HIVoaATvFZ+YDvjFJ6EUfI+k
	LAkfq4HBzBRETwUOcH2A7wiOZANFVJcNKDugbPGhyO/Z09n1X9cWpg8IptVn1dYsGhrd+aEA2ab
	BuPRKr6znLoztOOzYTD8mkBs6heA4KAtFYlWn6M4M1K13hD1lxAo3hrs2KKGgnFZUCb3zuwerPo
	dTHosTK0XXxoryAIOgkLfrJp+X2/Ekj20dRqY1XvDTMC4xtmSblDDLi8gLz8RGIi0rkvKHf/IMW
	gMkBWcWucDjCxaOCMlt/rt0x5dv8A0vp9XdlmWAks/ZscMrGKz2sTrjqmB/UNRNdhiE8VGherUu
	s2n5q9Lr12iUulio3x9YF
X-Received: by 2002:a05:6820:8119:b0:6cd:3ffc:e338 with SMTP id 006d021491bc7-6d441996bcfmr10141053eaf.86.1790546411401;
        Sun, 27 Sep 2026 15:00:11 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.15.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:00:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:45 -0600
Subject: [PATCH net-next v5 10/19] net: stmmac: fix error path cleanup in
 DMA descriptor ring allocation
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-10-feec6c14dd06@gmail.com>
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
In-Reply-To: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Yao Zi <me@ziyao.cc>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, Linkui Xiao <xiaolinkui@kylinos.cn>, 
 Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Ding Hui <dinghui@lixiang.com>
X-Mailer: b4 0.15.2

From: Ding Hui <dinghui@lixiang.com>

__alloc_dma_rx_desc_resources() and __alloc_dma_tx_desc_resources()
allocate resources in multiple steps but return early on failure
without cleaning up what they have already allocated. The outer
error paths then call the free helpers on partially-initialized
queues, which dereference pointers that were never allocated:

  - dma_free_rx_skbufs() and dma_free_rx_xskbufs() dereference
    rx_q->buf_pool[i] via stmmac_free_rx_buffer(), but buf_pool
    may be NULL if its kzalloc_objs() failed.

  - dma_free_tx_skbufs() dereferences tx_q->tx_skbuff_dma[i] via
    stmmac_free_tx_buffer(), but tx_skbuff_dma may be NULL if its
    kzalloc_objs() failed.

  - stmmac_free_tx_buffer() dereferences tx_q->xdpf[i] and
    tx_q->tx_skbuff[i] (aliased through a union), but tx_skbuff
    may be NULL if its allocation failed while tx_skbuff_dma
    succeeded.

Fix this by making each allocation function responsible for undoing
its own allocations on error, following the standard kernel error
handling pattern of cleaning up in reverse order. Also add NULL
checks in the free helpers as a defensive measure, since they may
be called on partially-initialized queues.
Additionally, make __free_dma_rx_desc_resources() and
__free_dma_tx_desc_resources() clear the pointers they free, so that
the NULL guards in the free helpers hold reliably when the long-lived
priv->dma_conf is reused across XDP open/release cycles.

Signed-off-by: Ding Hui <dinghui@lixiang.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 70 +++++++++++++++++++----
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d9d676ae1c82..258de45d122c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1767,7 +1767,7 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 					 DMA_TO_DEVICE);
 	}
 
-	if (tx_q->xdpf[i] &&
+	if (tx_q->xdpf && tx_q->xdpf[i] &&
 	    (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XDP_TX ||
 	     tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XDP_NDO)) {
 		xdp_return_frame(tx_q->xdpf[i]);
@@ -1777,7 +1777,7 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 	if (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XSK_TX)
 		tx_q->xsk_frames_done++;
 
-	if (tx_q->tx_skbuff[i] &&
+	if (tx_q->tx_skbuff && tx_q->tx_skbuff[i] &&
 	    tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_SKB) {
 		dev_kfree_skb_any(tx_q->tx_skbuff[i]);
 		tx_q->tx_skbuff[i] = NULL;
@@ -1800,6 +1800,10 @@ static void dma_free_rx_skbufs(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	/* buf_pool may not be allocated if alloc failed early */
+	if (!rx_q->buf_pool)
+		return;
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++)
 		stmmac_free_rx_buffer(priv, rx_q, i);
 }
@@ -1841,6 +1845,10 @@ static void dma_free_rx_xskbufs(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	/* buf_pool may not be allocated if alloc failed early */
+	if (!rx_q->buf_pool)
+		return;
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
 
@@ -2136,6 +2144,10 @@ static void dma_free_tx_skbufs(struct stmmac_priv *priv,
 	struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[queue];
 	int i;
 
+	/* tx_skbuff_dma may not be allocated if alloc failed early */
+	if (!tx_q->tx_skbuff_dma)
+		return;
+
 	tx_q->xsk_frames_done = 0;
 
 	for (i = 0; i < dma_conf->dma_tx_size; i++)
@@ -2193,13 +2205,20 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
 	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	rx_q->dma_erx = NULL;
+	rx_q->dma_rx = NULL;
+	rx_q->dma_rx_phy = 0;
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
 
 	kfree(rx_q->buf_pool);
-	if (rx_q->page_pool)
+	rx_q->buf_pool = NULL;
+
+	if (rx_q->page_pool) {
 		page_pool_destroy(rx_q->page_pool);
+		rx_q->page_pool = NULL;
+	}
 }
 
 static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
@@ -2241,9 +2260,16 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	tx_q->dma_etx = NULL;
+	tx_q->dma_entx = NULL;
+	tx_q->dma_tx = NULL;
+	tx_q->dma_tx_phy = 0;
 
 	kfree(tx_q->tx_skbuff_dma);
+	tx_q->tx_skbuff_dma = NULL;
+
 	kfree(tx_q->tx_skbuff);
+	tx_q->tx_skbuff = NULL;
 }
 
 static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
@@ -2311,15 +2337,19 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	}
 
 	rx_q->buf_pool = kzalloc_objs(*rx_q->buf_pool, dma_conf->dma_rx_size);
-	if (!rx_q->buf_pool)
-		return -ENOMEM;
+	if (!rx_q->buf_pool) {
+		ret = -ENOMEM;
+		goto err_destroy_pool;
+	}
 
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
 	addr = dma_alloc_coherent(priv->device, size, &rx_q->dma_rx_phy,
 				  GFP_KERNEL);
-	if (!addr)
-		return -ENOMEM;
+	if (!addr) {
+		ret = -ENOMEM;
+		goto err_free_buf_pool;
+	}
 
 	if (priv->extend_desc)
 		rx_q->dma_erx = addr;
@@ -2335,10 +2365,22 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
-		return -EINVAL;
+		goto err_free_dma;
 	}
 
 	return 0;
+
+err_free_dma:
+	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	rx_q->dma_erx = NULL;
+	rx_q->dma_rx = NULL;
+err_free_buf_pool:
+	kfree(rx_q->buf_pool);
+	rx_q->buf_pool = NULL;
+err_destroy_pool:
+	page_pool_destroy(rx_q->page_pool);
+	rx_q->page_pool = NULL;
+	return ret;
 }
 
 static int alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
@@ -2391,14 +2433,14 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	tx_q->tx_skbuff = kzalloc_objs(struct sk_buff *, dma_conf->dma_tx_size);
 	if (!tx_q->tx_skbuff)
-		return -ENOMEM;
+		goto err_free_skbuff_dma;
 
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	addr = dma_alloc_coherent(priv->device, size,
 				  &tx_q->dma_tx_phy, GFP_KERNEL);
 	if (!addr)
-		return -ENOMEM;
+		goto err_free_skbuff;
 
 	if (priv->extend_desc)
 		tx_q->dma_etx = addr;
@@ -2408,6 +2450,14 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 		tx_q->dma_tx = addr;
 
 	return 0;
+
+err_free_skbuff:
+	kfree(tx_q->tx_skbuff);
+	tx_q->tx_skbuff = NULL;
+err_free_skbuff_dma:
+	kfree(tx_q->tx_skbuff_dma);
+	tx_q->tx_skbuff_dma = NULL;
+	return -ENOMEM;
 }
 
 static int alloc_dma_tx_desc_resources(struct stmmac_priv *priv,

-- 
2.53.0

