Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB71411FF
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713362422; cv=none; b=pyDf6pZB+vOa2nmXJQUPDFxOa6tw9a99MYpaJE72wKm4basTWnx6nG2OM1OtH82/tTOvWnnOMzQlSUWYDakSAb+kU2pGIfoAVbntN+d0wRbzoq6zEWPi+cuXArMV2WmgesqAeNprdlVALHhmSrAmkFTRV1sikJk2sZYeFhYlvq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713362422; c=relaxed/simple;
	bh=TWD2L2Zr8UYsDCfzmnyou73DVYZGAWwGKJBxOFNqDtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOiAb5tchxBsCN4dCjcwGH+nTVpAwUIQvzjp0iQJCSgAp4dn7iAAAaz2FLqd2L/C2TM3aXC6CsnrHUz7eaQSDVjiyYRslZ4rWasLZsvKBJ1Z0+V4ZCijB4JQaulOubjtu9iObEAaCmd86l6/Kj5OfSnW8tBgm+8ZV7eGgxjvUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYJZ1uK1; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYJZ1uK1"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-518a56cdc03so5127671e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 07:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713362419; x=1713967219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KnMWOMZl4OlIeWKfyhTeTgh6nDBj0ThrZdjCpvV0rs=;
        b=SYJZ1uK1nX35f1EDBa+z1R0nyVFbubDndnqK0/4Q8p0ffPO73+hZmPcdNzsXK1y6O4
         TmCJ8xg7Z4RdhUOe/rK4BhQeByYgscn2XHyz5mAX5fMKFkUseraZ679bOZhgS3usViSO
         DyMrYasKWMLECuBlThqjwal3V4DqiznJm3ESrJIoonBelseWp7D/GNt4woyVDjiSRalZ
         AU0AdIUChXP5BwOKeMq9IrozpKw059t5b7CuosEnJySuL4zNp3+/dn2Cm6hDPKg8zDn7
         H3ySCnSfrgRQgEr3e1jmZgs+s5eBmeE+0bTbZ4zGeCkRaBwXJbXDEHf693AxyhxFz/bN
         Qdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713362419; x=1713967219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KnMWOMZl4OlIeWKfyhTeTgh6nDBj0ThrZdjCpvV0rs=;
        b=MbKRPt/4D732IcQFci8mavXrI+ayNJwhpXRRUuLuWllAnyEXV9mGTlC2Wj1mAMfHIR
         PEzXh0sot+Mj0LJyUkgZQof/1KmWD05uQXJdceGmcKwGZcc0e2wvWwJhQT9t6szi0SWJ
         GMEWcIouGc/ydohdZk++NaKEqeJpqdUYuYB/S9AmEy96TQ3Q8XKiFWkfoaOIOrSyTR1c
         ET+Po+xTK9yJAd9ilAmFMOxZlSm5SfkY5qqdfJ+cbPTwYY18bpPqXQE7h/cCOmj0jZN3
         osknJVySZ/0DctejCA9YRbTsRLcrhKUBCUqfaZxYNv4ILSJT8CKCwmKShFPG0o8n+9V1
         o5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfJKmSPgQhJ5GyNoOd1QIYPlwHd4nQeD6XL8Bm9dBqqo4IvgNVQ26DVDJiojtTaDnH4v1DSDm1oG2KmmHPBnIvpveEtl6rleOQokI=
X-Gm-Message-State: AOJu0YwWMy06rFxLlOO6Pbdk29A34OjPC6mPhCQY9JA+uVygMU934pFk
	M188K/5B1AmU9ombFq+cK/b6UAp4zA3B3xKT1VB96yh+8sS/Y+m4
X-Google-Smtp-Source: AGHT+IEFwpS1qE+a87B7Ubcokq+jSyQu+NQX48mgWo7d9MJK3BT85N5w69dYy1tGNwmTeX2J7BN2jw==
X-Received: by 2002:ac2:4d9b:0:b0:516:d33a:7571 with SMTP id g27-20020ac24d9b000000b00516d33a7571mr10745339lfe.8.1713362418928;
        Wed, 17 Apr 2024 07:00:18 -0700 (PDT)
Received: from localhost ([94.125.187.42])
        by smtp.gmail.com with ESMTPSA id g20-20020a19ee14000000b00515b0706b95sm1971640lfb.17.2024.04.17.07.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 07:00:18 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <siyanteng@loongson.cn>,
	Romain Gantois <romain.gantois@bootlin.com>,
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
Subject: [PATCH net-next v2 2/2] net: stmmac: Move MAC caps init to phylink MAC caps getter
Date: Wed, 17 Apr 2024 17:00:08 +0300
Message-ID: <20240417140013.12575-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240417140013.12575-1-fancer.lancer@gmail.com>
References: <20240417140013.12575-1-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a set of recent fixes the stmmac_phy_setup() and
stmmac_reinit_queues() methods have turned to having some duplicated code.
Let's get rid from the duplication by moving the MAC-capabilities
initialization to the PHYLINK MAC-capabilities getter. The getter is
called during each network device interface open/close cycle. So the
MAC-capabilities will be initialized in generic device open procedure and
in case of the Tx/Rx queues re-initialization as the original code
semantics implies.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Link: https://lore.kernel.org/netdev/20240412180340.7965-5-fancer.lancer@gmail.com/
Changelog v2:
- Resubmit the patch to net-next separately from the main patchset (Paolo)
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b810f6b69bf5..0d6cd1704e6a 100644
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
+	/* Refresh the MAC-specific capabilities */
+	stmmac_mac_update_caps(priv);
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
 
-	/* Refresh the MAC-specific capabilities */
-	stmmac_mac_update_caps(priv);
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
 
-	stmmac_mac_update_caps(priv);
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

