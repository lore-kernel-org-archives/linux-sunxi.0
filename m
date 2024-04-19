Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382C379DC5
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713517451; cv=none; b=XzrG9ctbEBk+YRCXMCbEK35j36XDTEg01JG8FS9rPoS4Txdtbw5eH3atANyIkGRAsJrZTRD/hcEtXBZgR2j0ArguJG7PmkVKeGXc6gZl7ly02E4uIoynu2rtlt9oTXY4qGw5mnYZGd5oJBHxH8RkRb3xXm9upJpptKYToo6syVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713517451; c=relaxed/simple;
	bh=yYoDQShDvmrOZ9K2+7B7afIlK5+dkxlsEVPcBywafew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Grs+LnMfkUckmP3gBGEo72evk+4qagvCCimbBZr7VGRBN2Qxj/P/rLXfovudsbfMm2vwoxfxwE3eCmHVVMN/x51c/oZPj3LXwo7GBf8r0OEKLhD2el3xuJFWpYgT2EIc4AZGEovV+Ia+wiJ0sMxXvnC80OCxTY5Nebmw4TbAEx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLlp5d/8; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLlp5d/8"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2da01cb187cso31191751fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713517448; x=1714122248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgMQYr4oV4JNndEuD2biU5vQV/pnebRAnRkbrVejXaA=;
        b=WLlp5d/8yzpD/C1vnA1U25EnsAImDJIZ4ijqRR3yp1uHOjol3dSkdKQm2L+UfNOUYC
         VlHBnANVDwfJFFjFzf06+2lroO2k3scg+HNznijfN4pYoTQ4wRFoghqUxDzxDAbKtt7w
         ltMFq3vxcdTCpD2w3PmTiGuttlFKE7AV4e1pP1fT67fc1zaNe1oOQZROhR9ScbY5CIXz
         KsVK8hc0pZVxf4AKbS2qocfRbEZcw+GKjlifMbC0S9VXxKN26ndHwOSBx1gbuCe0w+tB
         SW2MvzKVVOFFpeMiv+Qq5UFMQC2b+qRjxg4oRzlpMhD/RCo9ZYYyCs06k+TqD9U7/I/k
         +chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713517448; x=1714122248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgMQYr4oV4JNndEuD2biU5vQV/pnebRAnRkbrVejXaA=;
        b=X4Lh5twZcCwq1PlCXVbVCibXNBdUB4zoGXNt9gN6FGtWGogbD0jnNRFnr972kGaA3H
         4AWVmKugKcIOieVwm2ecBBvN7nHgsZanSCswCA5LtGsPbfStoB0xzol1E+O4g6jOS41P
         I1yFT+lobKnSCrTtsHnk4Wr7h4T2KZHzaNIXkcJNLqo6M/9cjqz8rDuyrlF+rNUkTgC4
         9AkmY/uMWforDBO0OJ4FZWCw1EkQKAODKKbfSGNnNfCR5bn+r8TF83Lz+PiltrRLLG6a
         kvcPY5hRZyFHGsbG4OwsoKn6NX3ptxUhVy7ShjUnO2iK3Fh2rNW6BOxUTj1e1XO7n9S9
         8HwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeOqOndg2KPeTn0worSYktODhV9KB9zt9qqbG+QfM02exHu0rEMR7xFRlk+6ZpgAFDR6/Dgdh+ciJw9nFljCbeu8Z9+3ttw6rsYQU=
X-Gm-Message-State: AOJu0YzCA3tVihBs72YZJ+vGFTDbDp9oFMv5GAPSZ1FdMH/s8lx5hvQM
	E5eQ+IB5EwPPwExOj6rNHx2y8LB4umW4eHQ41PBPJMaOxDNb0rX8
X-Google-Smtp-Source: AGHT+IHQi06xeUbRVNwJPi1rGkVQYXntNtrD89Vy0P8/uMlqN9zH9EDGdcfcGdRrkx/08kp0eZERLQ==
X-Received: by 2002:a2e:2a46:0:b0:2d4:7455:89f6 with SMTP id q67-20020a2e2a46000000b002d4745589f6mr1137769ljq.40.1713517448297;
        Fri, 19 Apr 2024 02:04:08 -0700 (PDT)
Received: from localhost (srv1.baikalchip.ru. [87.245.175.227])
        by smtp.gmail.com with ESMTPSA id h25-20020a2e3a19000000b002da968f03f9sm520526lja.89.2024.04.19.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:04:07 -0700 (PDT)
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
Subject: [PATCH RESEND net-next v3 2/2] net: stmmac: Move MAC caps init to phylink MAC caps getter
Date: Fri, 19 Apr 2024 12:03:06 +0300
Message-ID: <20240419090357.5547-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240419090357.5547-1-fancer.lancer@gmail.com>
References: <20240419090357.5547-1-fancer.lancer@gmail.com>
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
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

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

