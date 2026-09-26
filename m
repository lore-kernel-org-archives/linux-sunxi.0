Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C73451C1
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437774; cv=none; b=j6M0biS0hvIcDZGNihsi55g3KVVz0C+CP2teNW4GgmvoLNjdzxLDVDTjUBEtdqEcTDYVXlY2nxoov8p/eIOHyiiWJzVDvkakisX4tG89rkyGyAnd1mnxEFz97UDeT6fGUnTLeIuIM9J6R30Nb7W2Api+zBlQERJ0kgsU0egyz/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437774; c=relaxed/simple;
	bh=U0usEgD6eBVSyAl+4wuE0PhgO7aYIcSIWGg7AGP8BEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REFQcx1+ga3y0A27AgnSDYz+a9BLaxECfvQKeUVPpfZ79aJpbd5qUcQT/d6tIrG5jSPw1eKGvvM8/5GFJNM2rRUze415FrbqPHs5x1cyL57oS2IJL+u3kUxmmvpTAMNmoqrfgiiy5ciMjMZL6t7siy08Pq7uoihUmML2oN0WWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+NFjYTo; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+NFjYTo"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d77b3455bbso209411eaf.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437763; x=1791042563; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0ScVIX3sPn/yQi4OeJT/F76Vd8VPP2euaNmJMN8ERw=;
        b=Y+NFjYToQ8FUXSLrtY6k56IV5OdHwPHMUAAVpAfZsnx1LMY6jpx/SG6k0HDIe1UZpP
         u/1sKpn90KcbNaiuBSPpSnqvknfDwoOr48FUK8SUEn1GgNkzmyrMKD9SRMbu9B8nKsuM
         VO+aLbitoIGqciAG25ag8mpux8o4z0LZqDhH/vofwITpUG26mZuE0Xazzusy9PmadeiM
         HUg7WTyKQNKLj2tetF8RaIYlkJokSp8qvt0HmEIooIjBws7U+bCtNvmVFfMK2K+5DA3D
         G63IuEHZToTJvmooFRhoQjb+f5Cjr1XggNJnZZnXtj0Dp0RhxjebsdVRd+ruz1TU3mWa
         IfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437763; x=1791042563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0ScVIX3sPn/yQi4OeJT/F76Vd8VPP2euaNmJMN8ERw=;
        b=IYVGZHeKx3SrYkq5M4egBeii3FCIPZrV4X67M0NoEXJ1UOMHisbo4szQMiSaberKjR
         3XdwccwAJB2D6O5+jl2DOJ8jtqfQHCra4En9BvN3CJO1Chfsv+Te2sksS9yBCcRuN+9j
         sHc7jAsshJ0p+gXJjYRFhFYd8sgQMRaaYvFbtO1vp6Pq28tJ7fyKx9nYkhvdF7Fi5JHv
         MWP0DXBgae0f/taK8chaGB6Upst2gSk1SMb6bfRcEY/u8wo3fWqlTYLRgBo67IztLYT7
         ZBSv3MFS9e+WAYLYaNZlUVv9Ztz5+lI7zIFEG+szFvUlE4LkBhJAwj1ph6xePaZN92ER
         uLKA==
X-Forwarded-Encrypted: i=1; AKwUvBxiSkzqhgbNETC8jVrjaeTWqGF+42S5F7kgcsQOr4NEFR5dAnpIJQ4mj9MZ4CHCd6nS+YFqWLf3daN9vw==@lists.linux.dev
X-Gm-Message-State: AFuF++kNyRO3eHDqPD4590UjCb7s8NGpRvSB6QtViDqvmWc+bxgG3KxZ
	LYxPCZ4cC7W54Hyc7L5arUBJWk7sgAzbTvQC9rPvHfvDEhHckuMKnZtz
X-Gm-Gg: AYBFou3otFf5t9KcuHjhCkXxFqQy/ltSbaTn6oR7VSKJhkRpS0b4ihfvxbW3gyrfcmX
	3+2Q62f9BOA5ugoOfsWKgv33un4nJ7LiKuhC6xbyKrIqIH2ZJ5RYlB0W9S5TzM5ReDkd6LOsbLQ
	khNQzvfiTEnrRvNHQTZirwu5EBBIjtEFW075fo81Vv4+UjApxqjoW/wbPyllp7tgymV+3CVf+Sh
	lH1zzY2+rVhzywe1n6kWBTMQGm6EHwxXsXhmRs5gM1xGCbTPeWHh9uYccfpxXfC3JSKDyLi9yvy
	H/IK+qMIvOXTqDHDO5Lto169ypKxpC4akK0RTxW36+vAHtguZjLT0Run4gU5hTWcgu9FuZrwbnz
	2gtH9vF8KFNNksACdilRm2azeOAf7DvaTBpDdQyrFcmtJszLBcjPm549TEq0tp8skIoVaiNnSxj
	GLSmeITz9be2DnYHelJCwt4hYTBaj0JbKGc/jZoKnEXVyArsW+yKbv7LU4ixEnutQzQFPzAcmaU
	QcgIeGOYclZ10aO2m1ooLr3a/LN3UDj6LmDxjK3dEx+DRCl9MgLfjJZ8IraWoZ8ikJH830z1XVY
	bvL4nxRMhh5F2D2eId3CtE4A+TV0mPI4lXTrNzvsL/5qCEVbqCn/DaabtrDe4T96iYVksOlgelX
	HFjQN9RyslYlrwqRcdFyg
X-Received: by 2002:a05:6820:1ca6:b0:6d3:402e:1fca with SMTP id 006d021491bc7-6d43ebf0448mr8754440eaf.9.1790437762887;
        Sat, 26 Sep 2026 08:49:22 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:48:57 -0600
Subject: [PATCH net v4 02/15] net: stmmac: reuse the MDIO reset GPIO on
 resume
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-2-ec1c0250b3c9@gmail.com>
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

MDIO bus registration acquires the optional snps,reset GPIO through
devres. A later bus reset must reuse that descriptor: requesting the
same exclusive GPIO again returns -EBUSY while devres still owns it.
Cache the successfully acquired descriptor for subsequent resets.
Propagate acquisition errors without caching an error pointer.

Fixes: 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in stmmac_mdio_reset")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..c7c876408d85 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -287,6 +287,7 @@ struct stmmac_priv {
 
 	unsigned int pause_time;
 	struct mii_bus *mii;
+	struct gpio_desc *mdio_reset_gpio;
 
 	struct stmmac_pcs *integrated_pcs;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb..07d5eab05996 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -386,14 +386,20 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 #ifdef CONFIG_OF
 	if (priv->device->of_node) {
-		struct gpio_desc *reset_gpio;
+		struct gpio_desc *reset_gpio = priv->mdio_reset_gpio;
 		u32 delays[3] = { 0, 0, 0 };
 
-		reset_gpio = devm_gpiod_get_optional(priv->device,
-						     "snps,reset",
-						     GPIOD_OUT_LOW);
-		if (IS_ERR(reset_gpio))
-			return PTR_ERR(reset_gpio);
+		/* The bus reset also runs on resume. Devres retains the GPIO
+		 * until unbind, so do not request an already owned line again.
+		 */
+		if (!reset_gpio) {
+			reset_gpio = devm_gpiod_get_optional(priv->device,
+							     "snps,reset",
+							     GPIOD_OUT_LOW);
+			if (IS_ERR(reset_gpio))
+				return PTR_ERR(reset_gpio);
+			priv->mdio_reset_gpio = reset_gpio;
+		}
 
 		device_property_read_u32_array(priv->device,
 					       "snps,reset-delays-us",

-- 
2.53.0

