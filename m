Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAA137F8BD
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437791; cv=none; b=p6zn4QXonYMk97BwsVnTXQsp5kkIFpiI4O2KFliS1UDtc1agELiMeVsERgnMmw52SDGmASFUQdwlIY3r/a4SR6hTIfc1JoF2HOTMaUtvyOKbQi4VDC15r5sgdKOuCngV8PDEFN8tdwpZniQKOf1tseBxQOZDCxHuxd3jPnwjq5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437791; c=relaxed/simple;
	bh=D8q+JFl8ShBAwd8HatsVWk4ClB609jvEFQM0NLY9Qlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzHczUM0mCNEYNOSoeKTh74VSk/2fqeIBC0BKC5P2+MpJDfglhxTAOG7Yy6TkBZWB+nptDbgnXsMd3OY13f85LU1SqQYLQ4e/vkZXziACydTUgtuYNWrecB4w1uXKXxjHw+taT3303qen89PgmmsZj5+knZVYjtdRJ6kawqDAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiBxOx0T; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiBxOx0T"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0c89e34so1169913a34.1
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437785; x=1791042585; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5J6qvfoNxCIHw/hgiMJQWPeLhNGA42IA+QA8tl0rh4=;
        b=CiBxOx0T6ejdMHkkz8PWzFwjH628PFpDR71zJA/CM6G/G//MPgiSylVyEOlirXYM4w
         s9HPJ3s0enzWp0kkfzBI5gHWZvNSsnutDKHhA4mb3fa7B1IXJRULlbJDVpMubqdNnQoi
         qBdnEgDT6eZOtH6ZOn3VBht1lFz7f0n8N4CE3nd8/Ch5YhKDKI1MXgxHEYz6od33+H0l
         a15BAQ0tOFcxDHq+YOyDnda1gyTpisFckRxE5IBct3y0sfEkzHHqFTXkAKJU/F3Ahwvp
         7Yrq8i1sjkYa72sb+tclJeQJMmF9+nPXBSkd5dSf8hafMDoCQU1tRQJ9ag2nEjRefb5x
         u6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437785; x=1791042585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5J6qvfoNxCIHw/hgiMJQWPeLhNGA42IA+QA8tl0rh4=;
        b=cFNm6b/CIWJk6ooH9PDqjmMWuYhNhN/mO2l1rSryqCOj+qVoMTx4HA6K9wDYea8ovl
         VqAJVhlHrJ7hZodSXhVtrQ0BlODIz2WJ5CgDtLWWO1wOAWsPZyocvft6oIxgSunVWB3I
         3DPqU1FS7YoBI22X4GmUxszywT6hRJfLcJK3F4SSBI1Spic1Qz9nyZDEsRhdSVgmCw5T
         17xt5eLhzaKoNU/BPn5NPrNviSSBk6rqAb2IYPaq1x2aUb8pVr0iT40HdTcUdMG3isVz
         DMaz9zo3WQEnoXZvEZT8cu87VXFN3J43XUEf8lBdVFqZzfR2LKnAIDtWPUjC9I7lVVXy
         Ow8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxD9xSgmkZiUdejqIsmVQ5V0P1O6oqfbvDTM0Du3V7A4d5hkKkq+NBQKAoueJAHApNvn6DBvC8/1Ln5fA==@lists.linux.dev
X-Gm-Message-State: AFuF++kM30XDntvdw8AWryCyVSfQ3ByOdPJ0EoPcWSZ/Wp4jLqce6Vjc
	Y7hJVxh+1LlbYqyERObuXS5KenJu0M3QXFg69SFnBsXV2DOuuRnfqONE
X-Gm-Gg: AYBFou2xJehTfqm3Zw6G6/FAKU87J997Z2VuHMmxsJ3TTqfyXrrVb2mfsXkmBJxDEFf
	WVSkAb/Rrat8haeu149utq/belJ1wqUPOAz4Fok9VteMAIZH/uN9Mi/XkKBnwRWgqp7DLN8+CD3
	bZ9yxQ1AAEesabJGAs+MQNJRao6hyW0DbFPF7Ks876DinGwT0mxIib+Ge/E/FkUUaisZPiGzALQ
	XpRuJRs4cYDZvTJFnp6H1/dQKJlHrZWtxsVSg2Ie7X3FJyU+R40K9zpum4OdMAzr+orItZKyZJJ
	4PVzaa0ShgyaDd3rq6buqf07s7RviK3Ka+jknn1v3Y9NFbI5h3Z8IckajN9J0LNsAiepgdtPRmI
	xyZmW7AGesLNwHPDq9L1DY3v1y9MH2bmM/2vHpxH5PU+q1nN5goP31Y1jsfB7prxJsSO+0ToMnr
	tc3n+NFVjyjbBA1MURCnM1oeT+ITXBKMuKQQw+ogvCwIb4O+27rOaGiXwqPPyMJuZMmnhS+ATR8
	Kk2D6tmj60jdvgI9OhpFB5CfxW8T14EmQX5m2WRdKdMf8KmlrJiTQlL9nYwJ6D+Ks1t2dtRrdwv
	rWEzIHNgwjMqt8h+UFeDWNxRC/nzffjJRF8nK48YTGU8EAEO584fcM+9e6CdHSCpd0nEs1+X7MQ
	m1CR/ItEsDAOhJeX/qpqA
X-Received: by 2002:a05:6830:6686:b0:7f4:eb76:881d with SMTP id 46e09a7af769-81780693ca6mr10527443a34.5.1790437785355;
        Sat, 26 Sep 2026 08:49:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:49:07 -0600
Subject: [PATCH net v4 12/15] xsk: allow drivers to retain DMA mappings
 independently of pools
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-12-ec1c0250b3c9@gmail.com>
References: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
In-Reply-To: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
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
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>, 
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2

An unsuccessful device shutdown does not make its DMA memory safe to
unmap. AF_XDP pool removal must nevertheless complete: the last socket
release invokes the driver detach callback and then destroys the pool,
regardless of the callback's return value.

Provide an independent reference to the existing DMA mapping and its
UMEM pages. A driver can take it while installing rings and release it
after DMA has actually stopped. It does not retain pool metadata, fill
or completion rings, or the pool users reference which triggers
teardown.

Keep the DMA device and the mapping's netdev lookup key allocated,
without taking a netdev usage reference that would prevent unregister.
Save the mapping attributes and unmap before dropping the last retained
UMEM reference. Mapping reference operations are serialized by RTNL,
like the existing mapping list operations.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/net/xdp_sock_drv.h  | 23 ++++++++++++++++++++++
 include/net/xsk_buff_pool.h |  4 ++++
 net/xdp/xsk_buff_pool.c     | 48 +++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
index d94aeb506379..819410797db3 100644
--- a/include/net/xdp_sock_drv.h
+++ b/include/net/xdp_sock_drv.h
@@ -95,6 +95,20 @@ static inline void xsk_pool_dma_unmap(struct xsk_buff_pool *pool,
 	xp_dma_unmap(pool, attrs);
 }
 
+/* RTNL must be held. Keep DMA mappings and pinned pages independently of
+ * the socket/pool lifetime, for rings whose DMA shutdown can fail.
+ * This does not keep pool metadata alive or postpone the detach callback.
+ */
+static inline struct xsk_dma_map *xsk_pool_dma_get(struct xsk_buff_pool *pool)
+{
+	return xp_dma_get(pool);
+}
+
+static inline void xsk_pool_dma_put(struct xsk_dma_map *dma_map)
+{
+	xp_dma_put(dma_map);
+}
+
 static inline int xsk_pool_dma_map(struct xsk_buff_pool *pool,
 				   struct device *dev, unsigned long attrs)
 {
@@ -432,6 +446,15 @@ static inline void xsk_pool_dma_unmap(struct xsk_buff_pool *pool,
 {
 }
 
+static inline struct xsk_dma_map *xsk_pool_dma_get(struct xsk_buff_pool *pool)
+{
+	return NULL;
+}
+
+static inline void xsk_pool_dma_put(struct xsk_dma_map *dma_map)
+{
+}
+
 static inline int xsk_pool_dma_map(struct xsk_buff_pool *pool,
 				   struct device *dev, unsigned long attrs)
 {
diff --git a/include/net/xsk_buff_pool.h b/include/net/xsk_buff_pool.h
index a7df573784fd..25a09b098703 100644
--- a/include/net/xsk_buff_pool.h
+++ b/include/net/xsk_buff_pool.h
@@ -38,6 +38,8 @@ struct xsk_dma_map {
 	dma_addr_t *dma_pages;
 	struct device *dev;
 	struct net_device *netdev;
+	struct xdp_umem *umem;
+	unsigned long attrs;
 	refcount_t users;
 	struct list_head list; /* Protected by the RTNL_LOCK */
 	u32 dma_pages_cnt;
@@ -143,6 +145,8 @@ void xp_fill_cb(struct xsk_buff_pool *pool, struct xsk_cb_desc *desc);
 int xp_dma_map(struct xsk_buff_pool *pool, struct device *dev,
 	       unsigned long attrs, struct page **pages, u32 nr_pages);
 void xp_dma_unmap(struct xsk_buff_pool *pool, unsigned long attrs);
+struct xsk_dma_map *xp_dma_get(struct xsk_buff_pool *pool);
+void xp_dma_put(struct xsk_dma_map *dma_map);
 struct xdp_buff *xp_alloc(struct xsk_buff_pool *pool);
 u32 xp_alloc_batch(struct xsk_buff_pool *pool, struct xdp_buff **xdp, u32 max);
 bool xp_can_alloc(struct xsk_buff_pool *pool, u32 count);
diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index c58f56f24a9c..8f95eddc91fc 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -360,7 +360,8 @@ static struct xsk_dma_map *xp_find_dma_map(struct xsk_buff_pool *pool)
 }
 
 static struct xsk_dma_map *xp_create_dma_map(struct device *dev, struct net_device *netdev,
-					     u32 nr_pages, struct xdp_umem *umem)
+					     u32 nr_pages, struct xdp_umem *umem,
+					     unsigned long attrs)
 {
 	struct xsk_dma_map *dma_map;
 
@@ -376,6 +377,8 @@ static struct xsk_dma_map *xp_create_dma_map(struct device *dev, struct net_devi
 
 	dma_map->netdev = netdev;
 	dma_map->dev = dev;
+	dma_map->umem = umem;
+	dma_map->attrs = attrs;
 	dma_map->dma_pages_cnt = nr_pages;
 	refcount_set(&dma_map->users, 1);
 	list_add(&dma_map->list, &umem->xsk_dma_list);
@@ -430,6 +433,47 @@ void xp_dma_unmap(struct xsk_buff_pool *pool, unsigned long attrs)
 }
 EXPORT_SYMBOL(xp_dma_unmap);
 
+struct xsk_dma_map *xp_dma_get(struct xsk_buff_pool *pool)
+{
+	struct xsk_dma_map *dma_map;
+
+	ASSERT_RTNL();
+	if (!pool->dma_pages)
+		return NULL;
+	dma_map = xp_find_dma_map(pool);
+	if (WARN_ON_ONCE(!dma_map))
+		return NULL;
+
+	refcount_inc(&dma_map->users);
+	xdp_get_umem(dma_map->umem);
+	get_device(dma_map->dev);
+	/* Keep the mapping's lookup key alive without preventing unregister. */
+	get_device(&dma_map->netdev->dev);
+	return dma_map;
+}
+EXPORT_SYMBOL_GPL(xp_dma_get);
+
+void xp_dma_put(struct xsk_dma_map *dma_map)
+{
+	struct net_device *netdev;
+	struct xdp_umem *umem;
+	struct device *dev;
+
+	ASSERT_RTNL();
+	if (!dma_map)
+		return;
+	dev = dma_map->dev;
+	netdev = dma_map->netdev;
+	umem = dma_map->umem;
+	if (refcount_dec_and_test(&dma_map->users))
+		__xp_dma_unmap(dma_map, dma_map->attrs);
+	/* Unmap before the final reference can unpin the UMEM pages. */
+	xdp_put_umem(umem, false);
+	put_device(&netdev->dev);
+	put_device(dev);
+}
+EXPORT_SYMBOL_GPL(xp_dma_put);
+
 static void xp_check_dma_contiguity(struct xsk_dma_map *dma_map)
 {
 	u32 i;
@@ -487,7 +531,7 @@ int xp_dma_map(struct xsk_buff_pool *pool, struct device *dev,
 		return 0;
 	}
 
-	dma_map = xp_create_dma_map(dev, pool->netdev, nr_pages, pool->umem);
+	dma_map = xp_create_dma_map(dev, pool->netdev, nr_pages, pool->umem, attrs);
 	if (!dma_map)
 		return -ENOMEM;
 

-- 
2.53.0

