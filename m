Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C36757E7
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713517450; cv=none; b=VFAUUmwtO9gjrdbr4KtKmzJRyJ9X1LgK80HQmC5uJ3Uxlj0kdkN++vf40UkkLi2QZiMkidXgDBZs1/XVFHR3gKASSefQ9aGV9B6P3wpGdQ08TNoQQlUuwQZPaRbv7vaT/ujTOPvrvYeh9uKrxhDel1Q6oIyCU0u/94mM/5Ao9vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713517450; c=relaxed/simple;
	bh=CqFOLW57OsSaPgqpmoP9GqLHbrWurxYyi2L/kr/r3Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJT+STw28RA1AoXWlsio0hSiY28YSt7jmK+aUzePJSYTddQ8+OYLk0S8WqYTwTlrmZToHNYx4sUnHy1bV4+RUvq9ZN/9febTfzuG7HFL7OpTTYIlqXYQSlRfYkVpfyTbI/gudckHQgoT/+cVUE6KIS9jgqCgRDl0gigsNYirX/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqXweK2w; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqXweK2w"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2db101c11feso12263671fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Apr 2024 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713517447; x=1714122247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+UxECjZ2bOznPZSMcj9cuChQ4TT4LhNaweaduToB00=;
        b=XqXweK2wEu4t19PTHVlp65hRCJ0Y1M0ogUt/OP6xc9WZEhJ4QHiNkQYw96H9/WwF7G
         xTvsvvYn5auccwtKgLqKJzbKBpfNJrNMnLQnJ2eVqsKnHY3O9oQ9nlvhGEEVRh6X70Qx
         XDuldNnsKDfcJnIhnRP6/hmZGtNaNcPfJQzy+APonDWChLhj1Fwj3zCfu0FvKXudHzbc
         8/ELlihlvdwwAa+enSK6sl1WJHsdA8wyj62SS6voFZ7VMjpLaroEbp52AfV1Pf13MLNk
         Z5YfFeMNCKxbbBZkg8UbHM5oiRaQo1Fl+JwwAg9AwmSd/f0fXcUHrCLyCjfCDgv9/3hb
         R86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713517447; x=1714122247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+UxECjZ2bOznPZSMcj9cuChQ4TT4LhNaweaduToB00=;
        b=cKFWIUzM/ThwR8fycCZGcL69NhKd/IsZBULzRSkETFmx1tCYWC6tQ5xK6fQXTd/u/D
         HHX3MwGAzYQ41t6nTm3Erx8aqivD8dGrVmWAUZM7hE9QuKulLuBeoKV57JAF2LPEMH+0
         49CC7KzGLdEKJs+Sy+bx1ur+6sjLx5nRkVtC99Hw5WVZHtZWm2oUhzCilaQBP7tWXST8
         IzJzcHtcDc/MHqEZvp+M89qlzWapDWVNwqDF8p+7VWjpLrpKhL67XKkqre8iZfY+ZjT8
         gpuFQkh3Hsu8ljkv4SrM2/AulaOBH1h1eMq6Sz4c+7xOu8riqxJJp+Kan+xquxiAM7uk
         38rA==
X-Forwarded-Encrypted: i=1; AJvYcCXqYizs17q6b2eAsoSq2kZmTgF/ll+/2TTzUTwqmHeMgecOAK/48h+vLnxdfxL9wAJG3Md1BAiC4l17VztFSBPfRW72bnmb1EvmZD4=
X-Gm-Message-State: AOJu0YzpiZEuV1O1YsS8jI/iivFahbVCsmU/6PWFs7yzIceJUrVvWAgV
	a2t966xUXLiEmiaQXrkXg+c0tAfdTaG7l/pI5dnen9497+j3QYqa
X-Google-Smtp-Source: AGHT+IFH89zQPQ3GixxrpiN7kS+j8bXFxn8wZiGxujO3H0oIWI/CEKmSLCc+cQUZORC9BEhMDNEbYw==
X-Received: by 2002:a2e:b94d:0:b0:2d8:606d:c797 with SMTP id 13-20020a2eb94d000000b002d8606dc797mr507570ljs.10.1713517446579;
        Fri, 19 Apr 2024 02:04:06 -0700 (PDT)
Received: from localhost (srv1.baikalchip.ru. [87.245.175.227])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e7002000000b002d9ff7ff007sm523884ljc.40.2024.04.19.02.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:04:06 -0700 (PDT)
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
Subject: [PATCH RESEND net-next v3 1/2] net: stmmac: Rename phylink_get_caps() callback to update_caps()
Date: Fri, 19 Apr 2024 12:03:05 +0300
Message-ID: <20240419090357.5547-2-fancer.lancer@gmail.com>
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

Since recent commits the stmmac_ops::phylink_get_caps() callback has no
longer been responsible for the phylink MAC capabilities getting, but
merely updates the MAC capabilities in the mac_device_info::link::caps
field. Rename the callback to comply with the what the method does now.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

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

