Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DD814F9EB
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 18:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945053; cv=none; b=Ri2GqvyR1TBT0V48QlQb/TCprVr75HNd0Bh9ZUknKUI1CcGQjuHVvr422SxA66Kw4gPAf2woQyw+4VvZQ6UnE2p5dTpn1eJjx/RebAzuYTp8TAtSYEEQtu3s+K3ME4IHV8qHxZwj5PYlr47NTyvf/T5RpU8wBia75mnOV/aXPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945053; c=relaxed/simple;
	bh=tbHO/TE0urFDQY0QRj9ooUJURLBzp9JI1C+6T25mPjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVDufH72bPflAoA5ARj47NLn5KN6qTI/bucNN6MVaryEbNr/+XTk7TIpDhLmQkv2iXomsy/5tHIpj0SW7eviGPfkV1T12g7625fqCC9TGchIwb8oh1/GHWkZJAKcTHjpQQBcWp6yP/1Z/tz6soM2xDgsgCKqfSGoGDe1mayjn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUIor409; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUIor409"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2da0b3f7ad2so13591391fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 11:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712945050; x=1713549850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVOumlgGtBlZ85ugSU3wCdejk77Ru/Jzabc/ZwR7GtA=;
        b=CUIor409BcnIUlryLxVeXwysIM5eW5Bu+9qSfhlIlGbt83EYRScdI/99n5d2S7U+pq
         0C2wpkZxf8Ol8s6Dyo4rspmO//lUpGHQ2ShHyS/prqMNl540S0VoCSFGHKPSCzl87ih0
         xHK+Z1mEIXCDFU3DdxHjOLsNOafe5h8XRAaCsZ2Mk+o4RfvMSgfwf8g/OvLUv6gfUdQJ
         //yqQUzkzgPbYexh1rgHyOxaNi/wvERbRd0V9ic5CzpJC7/52/FFgmsfhxrVpEXRrgc0
         K42J3sYvF0B91zdV4Ep/cskmr852iaHLUgKotAsNbu139uMlW/88CTTeb6XOlKFEUUSZ
         NSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712945050; x=1713549850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVOumlgGtBlZ85ugSU3wCdejk77Ru/Jzabc/ZwR7GtA=;
        b=J+YTnENsAMaiFQ3oki5zVsONMFom5HPKLbzTJwChxwJ19YxXhzwDdJ2CXOc/LNI5JF
         NSr8sI3D9rVCaMqjj3287/38rne8K8TI4vAgOquaUueKqG9JFzUJA12P3Varv8Iyg9ww
         wh4orbsRigS/4FGnAsOSdtlc8dTTiSBg/AoBpFo4yJLf7+GzrGi+F/KCb1Cp8oLRgYCT
         JfhWqnY2DE2y5nPn9yR93Xu3urivP4XftEJ2YZwSXzrQsP/cBAJt/YCsqNz2Ypj8/K/Q
         Jroxq9vXdoF0bS+phP2IhomGmTl4NLJju9WalQ3gBdc/SiApQhU17q+oJdfabzhJ5D2h
         ZkQw==
X-Forwarded-Encrypted: i=1; AJvYcCVgYq5MDQczHhDiqxJSN1UDNO30IwNtCZY7FsACrK2Q9QC5gr4M+ynlkjWNZ4BM9bWXlUPHmZYv8wRYbTv/gCHKks+LL7upU/VNUmI=
X-Gm-Message-State: AOJu0YweCU7/dpdMtPAGEgHdlJaTJRqLrIYBFQQrkBia+wsAQYE1wwuY
	JmddJQXmIFtx2COqF39Omf9TKLOfP5HxcQQACbjywDuZlN3tPrgA
X-Google-Smtp-Source: AGHT+IErtp2nV7mcKdqRo+jq1OWZkiMk/4riy2CBgl5T4ICW2MsRDn+iJIiWgWyWac4RMpk9UBQ8Xg==
X-Received: by 2002:a05:651c:33a:b0:2d8:6561:72ca with SMTP id b26-20020a05651c033a00b002d8656172camr2074103ljp.19.1712945049992;
        Fri, 12 Apr 2024 11:04:09 -0700 (PDT)
Received: from localhost ([95.79.241.172])
        by smtp.gmail.com with ESMTPSA id g20-20020a05651c079400b002d86998c8f6sm570047lje.88.2024.04.12.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:04:09 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <siyanteng@loongson.cn>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/4] net: stmmac: Move MAC caps init to phylink MAC caps getter
Date: Fri, 12 Apr 2024 21:03:17 +0300
Message-ID: <20240412180340.7965-5-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240412180340.7965-1-fancer.lancer@gmail.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a set of fixes the stmmac_phy_setup() and stmmac_reinit_queues()
method have turned to having some duplicated code. Let's get rid from the
duplication by moving the MAC-capabilities initialization to the PHYLINK
MAC-capabilities getter. The getter is called during each network device
interface open/close cycle. So the MAC-capabilities will be initialized in
normal device functioning and in case of the Tx/Rx queues
re-initialization as the original code semantics implies.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7c6fb14b5555..cb72dd93191e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -936,6 +936,22 @@ static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
 			priv->pause, tx_cnt);
 }
 
+static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
+					 phy_interface_t interface)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+
+	/* Get the MAC-specific capabilities */
+	stmmac_mac_phylink_get_caps(priv);
+
+	config->mac_capabilities = priv->hw->link.caps;
+
+	if (priv->plat->max_speed)
+		phylink_limit_mac_speed(config, priv->plat->max_speed);
+
+	return config->mac_capabilities;
+}
+
 static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 						 phy_interface_t interface)
 {
@@ -1105,6 +1121,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
+	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
 	.mac_link_down = stmmac_mac_link_down,
@@ -1204,7 +1221,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *fwnode;
 	struct phylink *phylink;
-	int max_speed;
 
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
@@ -1225,15 +1241,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		xpcs_get_interfaces(priv->hw->xpcs,
 				    priv->phylink_config.supported_interfaces);
 
-	/* Get the MAC specific capabilities */
-	stmmac_mac_phylink_get_caps(priv);
-
-	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
-
-	max_speed = priv->plat->max_speed;
-	if (max_speed)
-		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
-
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
@@ -7327,7 +7334,6 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int ret = 0, i;
-	int max_speed;
 
 	if (netif_running(dev))
 		stmmac_release(dev);
@@ -7341,14 +7347,6 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
 									rx_cnt);
 
-	stmmac_mac_phylink_get_caps(priv);
-
-	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
-
-	max_speed = priv->plat->max_speed;
-	if (max_speed)
-		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
-
 	stmmac_napi_add(dev);
 
 	if (netif_running(dev))
-- 
2.43.0

