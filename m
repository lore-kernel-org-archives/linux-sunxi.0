Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599EB140E46
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713362421; cv=none; b=erA4j6/7+fXnQd4hYNO8HhpJxzlAEy5bwDANvOPtUWz0gOVtORir7508E7q9/CkXmxbVsG7NZjDWSxcHOoLxHa64e2NuYRDYKnh86Qhs53vtUKfKnRZBD0Lf0mQApNKb0EaonOos47JjpTXAWIiftaWkxfeyMeJd9hkb6gjNDfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713362421; c=relaxed/simple;
	bh=LMVQWGUTFa6R1Mmddy9P7trPn/rz+V8Mg0Tt5yij26E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITxPIcyX4m65jrkpVhUMpEvkMKbRJeCTS9Wf1a+XOP/uSlHl6vn2NgroUQnp8WQsYUQqhkKS/CMNy1ZFHuSoTrXeRkK+43UeCJQNaiXl37MOQLAH4moBF+bgHbJQ9ng2iMPH1+gHqiXgpFxD/m7BWIuR7WfLNRKVatQRk3aiLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAVoj8WD; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAVoj8WD"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d717603aa5so68642591fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713362417; x=1713967217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCuHkgJvG5roUfAj93LLXibybGnOYsen6TK2djTp+uM=;
        b=MAVoj8WDPBjnwDC18py1c9q7lLT3rR8kwC0FDngH+8xX1wasni3TYHEiiec6awpBoT
         q61gMZ73FuF7FythQkE1uRi+mspAXOQpHys4FzGp77cZ+bpfO+i6ypE8rZLuCr5h0Zvf
         qxhspGNvHBs5JTqq4c1RqyEAtJKeb8c/FCINwr/rtiK+rqKQXScLBR0icBTvj6BPrmvA
         UCskxwmqINjy7YGqrKyB3Yo/+nKxtCDS+SPv8IeBkh67ChCtIvhD2kh2uqg5X/EN8Zy9
         nx5Ksnf1LYgSh45IGxNAgRazCq0EQNC9/LfBoQce6GMjbkrEa6rKjDgiNweTsu83M5uD
         b/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713362417; x=1713967217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCuHkgJvG5roUfAj93LLXibybGnOYsen6TK2djTp+uM=;
        b=BkWgV/GcMOk5RJFaqbZSPJckUZmS9CKyl3uKHl/rRpaeWJxtJzZyJe0h0qemNNeEGt
         DKFAOSwuwi+XTJI9KXhnUPcXZ52RSKh0+NC2ciDdmtGH+6jfnKbTufWUxJH80d2wF06L
         XftAQi+Loq05ohI8/hZOMEAFolTG31yyXXW43jY6+pyb5vNVCR4bgkc9LkyA8Xoceq+9
         Mdqlw+l8v30QbgwWo0Ei+jQLOnzpKMyAazBD4OHUGy9Op2Y7IJRWg5pxsOCp+Ri7ep3k
         uYXK1xvY4IhnFdJHXYizrvT+vVlT3nyr2MWdsJ4f1H+PvCjAmN+PJnpjmngnSoF7Y2wR
         pGPw==
X-Forwarded-Encrypted: i=1; AJvYcCVOP5WYrwvOiDfwtYNveRSrgx8qT7LmKH8lbJNHeY+94pdOMobKgeQQufnnbVm3Og2BCeargEaIqLSVIEXEup6JFeSkk///rbj//Ws=
X-Gm-Message-State: AOJu0YyDooY6LMUcpaEL+nAbScO+vUapSDiN9wgU41AeakiSKlt7+fKu
	zjJbdWigfaWDiciYQfEooZPRx+87UGVhuQ46/yhV8sLN/nKFIwpM
X-Google-Smtp-Source: AGHT+IHZISTn2b4MdatLv09pVqgN8Rj/zh3VicITjG9ZAtAiCv8/i6AUH8xtyM+z/+qSzfgj1akGPQ==
X-Received: by 2002:a05:6512:1150:b0:516:ced5:3afa with SMTP id m16-20020a056512115000b00516ced53afamr14396995lfg.5.1713362417376;
        Wed, 17 Apr 2024 07:00:17 -0700 (PDT)
Received: from localhost ([94.125.187.42])
        by smtp.gmail.com with ESMTPSA id g11-20020a0565123b8b00b00518f53da2dfsm890439lfv.291.2024.04.17.07.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 07:00:17 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/2] net: stmmac: Rename phylink_get_caps() callback to update_caps()
Date: Wed, 17 Apr 2024 17:00:07 +0300
Message-ID: <20240417140013.12575-2-fancer.lancer@gmail.com>
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

Since recent commits the stmmac_ops::phylink_get_caps() callback has no
longer been responsible for the phylink MAC capabilities getting, but
merely updates the MAC capabilities in the mac_device_info::link::caps
field. Rename the callback to comply with the what the method does now.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Link: https://lore.kernel.org/netdev/20240412180340.7965-5-fancer.lancer@gmail.com/
Changelog v2:
- This is a new patch created based on the discussion around patch #4 in
  the series above.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index a38226d7cc6a..b25774d69195 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -68,7 +68,7 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 		init_waitqueue_head(&priv->tstamp_busy_wait);
 }
 
-static void dwmac4_phylink_get_caps(struct stmmac_priv *priv)
+static void dwmac4_update_caps(struct stmmac_priv *priv)
 {
 	if (priv->plat->tx_queues_to_use > 1)
 		priv->hw->link.caps &= ~(MAC_10HD | MAC_100HD | MAC_1000HD);
@@ -1190,7 +1190,7 @@ static void dwmac4_set_hw_vlan_mode(struct mac_device_info *hw)
 
 const struct stmmac_ops dwmac4_ops = {
 	.core_init = dwmac4_core_init,
-	.phylink_get_caps = dwmac4_phylink_get_caps,
+	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
@@ -1235,7 +1235,7 @@ const struct stmmac_ops dwmac4_ops = {
 
 const struct stmmac_ops dwmac410_ops = {
 	.core_init = dwmac4_core_init,
-	.phylink_get_caps = dwmac4_phylink_get_caps,
+	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
@@ -1284,7 +1284,7 @@ const struct stmmac_ops dwmac410_ops = {
 
 const struct stmmac_ops dwmac510_ops = {
 	.core_init = dwmac4_core_init,
-	.phylink_get_caps = dwmac4_phylink_get_caps,
+	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7be04b54738b..90384db228b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -308,8 +308,8 @@ struct stmmac_est;
 struct stmmac_ops {
 	/* MAC core initialization */
 	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
-	/* Get phylink capabilities */
-	void (*phylink_get_caps)(struct stmmac_priv *priv);
+	/* Update MAC capabilities */
+	void (*update_caps)(struct stmmac_priv *priv);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
@@ -430,8 +430,8 @@ struct stmmac_ops {
 
 #define stmmac_core_init(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, core_init, __args)
-#define stmmac_mac_phylink_get_caps(__priv) \
-	stmmac_do_void_callback(__priv, mac, phylink_get_caps, __priv)
+#define stmmac_mac_update_caps(__priv) \
+	stmmac_do_void_callback(__priv, mac, update_caps, __priv)
 #define stmmac_mac_set(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_mac, __args)
 #define stmmac_rx_ipc(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7c6fb14b5555..b810f6b69bf5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1225,8 +1225,8 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		xpcs_get_interfaces(priv->hw->xpcs,
 				    priv->phylink_config.supported_interfaces);
 
-	/* Get the MAC specific capabilities */
-	stmmac_mac_phylink_get_caps(priv);
+	/* Refresh the MAC-specific capabilities */
+	stmmac_mac_update_caps(priv);
 
 	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
 
@@ -7341,7 +7341,7 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
 									rx_cnt);
 
-	stmmac_mac_phylink_get_caps(priv);
+	stmmac_mac_update_caps(priv);
 
 	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
 
-- 
2.43.0

