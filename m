Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3F3C4B79
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 22:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546415; cv=none; b=ouWfnVqyI8I4lEzcl3r12YgfFuSLpP4M9//MmCDE6IFs2g9c1VkXKOQxWAFIS7JPCHfkyF8lqhVSudxTjG6FZ96EvqDXqps2s/h0PtSLTW3oBivk4YK9aoQ48V0nBCkQJjgTtB59iBGJIn4opt7LLj8ajU836APtBOIoDEzTqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546415; c=relaxed/simple;
	bh=gVk5Yp0fa5DC+JmIN7hJNs0tuRiH76TK6U/e7s2AWcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DznnN/BFmQpBh1AknMO9IKCZWr2j/i13A3Lp0oM7wr7BLBhdUNfm+4I3DYT5jASuLsmFsyxfT1Wsv1wpZquYvIzXNq1f81Tyg9ypaY9wnkxVdkdRXhnQdeJ5y/14AWTs4V93azQ79xRBMZ/nhvG+ktfo1zBdDgQj5/BzUnjsT+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfv22OZe; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfv22OZe"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81adacb0f81so649050a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546409; x=1791151209; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cINQWWverkhRH4suCO77K0cLfNkdgj2lkVHlOLl+dU=;
        b=kfv22OZesmEGXSiqXWcO0Gyo4HJFCCLJV8H0rAn48qQqr53unGGJSk0Lo8IYKqG1jC
         nDa2zTGI/i6Kf/Cjk4KhCz9oCM3gbsbmqH6cwztJ4ZUaQK087R6CqDcPc8jrjHtdiaYB
         nO7AaW9LjJIUnxDXzxU3O6bTo4IdJlqcBQfFJLW9HqESbG1fzUH2f3a90jA1be8nhaJw
         Bv9dz+E6/2f65yHFyEeQo5QyHdjgLXlzvnLGe9LvWMHQiN5vnVWpUmpMFWEFuo/jCvjM
         FesPuqNGt0UsxzNPiV0M2HSY4M3VYQm1NdztWP5qRJWNwVweJrnZ2lgX6aQoyPVO0ldA
         np9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546409; x=1791151209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cINQWWverkhRH4suCO77K0cLfNkdgj2lkVHlOLl+dU=;
        b=PU78tJblGBQYiNbcw87DHB7EaYQHYbemhsg6m4+Kc/1wxwdJPcqeAmwfJeIIzoI4pT
         L/qIq+/N+PMTw1zSxrmox9WfmER5HIrw/4/zLRcQ5J7bfx8to5bDBj+6xAERNX7bOy3R
         Fl6Y7Cx78X+VouWthWMmzdmK27qTb++yqIcq04SnjOHzUiG7k3fYzb94UWjvKnkDFCYW
         u0T0k4i3OOSx7/Sr6LKiTMfndRL99QmQW2vAN/drM2221J8YdpZwo35q00aD54HaMjw+
         A3O+w10dxl0euYe4a68AeNWjjE4sqOykQLiIf0cODKy7057G+wzlHxkt7SCl01EAjo78
         VwHg==
X-Forwarded-Encrypted: i=1; AKwUvBy/ZlYbjGEI1MSlUkINyinVIsAhPmFHvYEVkECiX1KwdtG64mdJiEUEquU5uP6T/xBAYA6uEcXmv/0cGQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mW/Ue/PLt8Ox/xvFDpSvkxd2+Cj8FpZajO6uj5aKCDamG/YzW2
	nIjY+a8Gktw/5OYO9dDHOjlH8QNc6vIH5A6ZGI+d1XFPbOAJEMgSVRoX
X-Gm-Gg: AYBFou1xlXwKWrb0h1ttprNY/PHiJ9Xy0mHmnQIEmtlOR3blhbwyeE5TfDD+l2pAdd6
	F++WUNmxhgUvLmHu3ghgoSZICgYFDfEmviZn1kFNGcjui5zLqMXfuMmgt9GpJ8AdTgtpZvpxBrR
	zni/9pYv400HKki06N1ziFgRRZzRi7/2ic54x6G8FDjEAP7MgulhCIo9RQl9JkpriS4H7/GbHyo
	sEtfcG2h31beHl3dNYM1U6+7L0ALUuccNQM6OyA/5eLWyFL+nvRfzAFaU/BAxXm+Te4D2De8X1f
	M5zvqtWL8vmERFsvBAy45+6CUNJcE7D9yknHLZ56iRWwXPBsgs4RwFfnbLuJN4L0Xq+33hpoD8w
	79+YxBTKhW0Z67X1zDH5J1TK+N8X20dnUGK50L2foB5EkaDcNKtqvtL+ri4N3jAuQPIYrk3sl4H
	M9A9pJ0JIoSa8/tppLvUWyR5KPdi6EI+iAFsTVQfjlh5XSqQoR7sO9Nn8iYiU2TdQaRjVZuD3ZA
	IZIxeheRibN55ujsWVlPZxMASH3q7PjMKagWejcQP3mcn61bTi5+70fW5xwYhs34pEDagwn7ICU
	oPEv2aEJCYUBjIZbpjLt08tCwX1T8hfRId+ofLem1yZuFhOac0UGm60Z88HxvAeF8PIWERecn2n
	1mWmWRxaYuupEGIy6S3hw
X-Received: by 2002:a05:6830:6d11:b0:81c:a8c5:6380 with SMTP id 46e09a7af769-81ca8c566f2mr813463a34.5.1790546408844;
        Sun, 27 Sep 2026 15:00:08 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.15.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:00:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:44 -0600
Subject: [PATCH net-next v5 09/19] net: stmmac: leave the datapath running
 for normal-size MTU changes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-9-feec6c14dd06@gmail.com>
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
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Changing an MTU at or below ETH_DATA_LEN does not change the receive
buffer size or the MAC receive limit when the previous MTU was also in
that range. Do not release and reopen the datapath for those changes.

Besides avoiding unnecessary hardware resets and their failure paths,
this keeps live AF_XDP pool bindings intact. Preparing replacement rings
before stopping the old rings otherwise binds the pool to a temporary
RXQ and consumes fill-ring entries while its current RXQ is still
active. XDP already rejects jumbo MTUs, so all supported live XDP MTU
changes can use this path without preparing replacement rings.

Keep jumbo transitions on the existing reinitialization path for now.
The later ownership and rollback changes address that path separately.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a8e5e86e0ead..d9d676ae1c82 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6212,7 +6212,12 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	if (netif_running(dev)) {
+	/* Normal-size frames use the same buffers and MAC receive limits.
+	 * In particular, do not disturb a live AF_XDP pool: XDP does not
+	 * support jumbo frames, so it never needs the ring replacement below.
+	 */
+	if (netif_running(dev) &&
+	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
 		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
 		/* Try to allocate the new DMA conf with the new mtu */
 		dma_conf = stmmac_setup_dma_desc(priv, mtu);

-- 
2.53.0

