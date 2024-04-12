Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A52914E2F2
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945047; cv=none; b=tSkJF5nqWnkXVjH1sbvrHXU9dUMOI8JiSxY9L2sHZCRYT0260HjwDhOOwerPdyIio2saI1BXdAPzaRZl7N9Y3VnuY1cvxl4/QzurFa89ru8Z+WDWyetoa/7w/n373nD2E/i4Vr9YN4P4ePOuGjw9kBg1tRM2RP7VnH/2tp9clIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945047; c=relaxed/simple;
	bh=acuEN0Mam8ygiQBR73EoAgExddMuyxMA+FsHhdYx23Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ag84/2JrMGM1lQ7IfIIu01NHASfY++ZlbRAlGpal4DSUmNrOHppkipRdvTju+dZAhzvCRsKSq2QlhdOko3cpE4heBhXwS7+4c86TT/RhXc5V9WTffx7q3sBCUN7XIwyJjrUeHAinIlDliRRJ4DAt7A8DznVg0CUbKeFT9/X6xCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J23inWXE; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J23inWXE"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d895e2c6efso14363001fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712945043; x=1713549843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCp+O5zf1XAzEa7QvAx53sYKNLIL8eSplg5NSTorigk=;
        b=J23inWXEAs1CRsd8ARV61w/Q9fHnHk5IE6H6vQOBVV9Fy7+QgsVfCSCISrtH1DJPWy
         MeKuXOUjfKGwNDLUQbilyLVRH8+bPX0qFT5PDl79B74SqsG5HyXgfPGC3IHzWW/oXXwk
         avaBQhglbItYYeCdW2zXIuu3QWt9QqmTSwxAx196n3gElE/E77+jzIOXmvqyFEFvZikX
         IJF+YvEBYLVtynj/6tPapaJnkDWZEu6BmvCeMDxb4KO+iiuVBxuqMORcZXM5tYhaMqDG
         aqoXp00MH52mOPPm/KQvd3sr+XKyTYGO8aqCT31uK3MJo7qXjeYcUAooiBeH/x4meOrU
         EdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712945043; x=1713549843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCp+O5zf1XAzEa7QvAx53sYKNLIL8eSplg5NSTorigk=;
        b=S/y4pwwJv3UGxySy0lJOUQc38DyYn0ZAt14O1RwCvMMszsAUztRSRCuCVNL2YM4d3R
         ninr0iHR7T2MB/Ro+puTYIeZwc+mhsxfm7gNOarh2fZ2KKVXSOgMJoFkMS0RErSSdz5k
         Ha3NIzd38F24JsZ1XbEa4Z3gHRh/y1w/IFZEr6kLGqcmUZ88dbYh1o+9fYWjHWv6KSJs
         0EBuV+3N2gdPg/S2/t8MXlgAPK/4IzeMgIKJ95UpPOhzI1vhiqiOwWgBoAAXsaCZR3rE
         S56WZ1fg4LsN0lQgaQZBXbMOHLVjMoClp+W/WwdYcBLRt0gZoXWWH7vULEAmENYxnwdz
         H4bg==
X-Forwarded-Encrypted: i=1; AJvYcCUAv19uVevajeuUKeBEP7ig9BNwhk1wyiNDHeqe4BolZk92LA2sSpRAcf1qUxBcFCsfE+8X2wEnMG1Tm8mfVlrSUwLxi3K5+Wq8hBg=
X-Gm-Message-State: AOJu0Yx7QIK77WOw9MHpIO882G5rPbQReoZgmegH63XDwtBQ7gBw9hQy
	4kVjgkSjCPprH+22mTtLKKvdjr/DXihf9UEr02ArAhvt03KqRYJt
X-Google-Smtp-Source: AGHT+IHENBuTlxLf/6N97dtbn3xcV+Dq/EI4bigipZaf5nXjIl76R7vPSnhcP7MwSAR0x+L4seiNwQ==
X-Received: by 2002:a05:651c:33c:b0:2d9:fe84:a485 with SMTP id b28-20020a05651c033c00b002d9fe84a485mr2395294ljp.29.1712945043444;
        Fri, 12 Apr 2024 11:04:03 -0700 (PDT)
Received: from localhost ([95.79.241.172])
        by smtp.gmail.com with ESMTPSA id by43-20020a05651c1a2b00b002d88d978484sm547676ljb.132.2024.04.12.11.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:04:03 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <siyanteng@loongson.cn>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bhadram Varka <vbhadram@nvidia.com>
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
Subject: [PATCH net 1/4] net: stmmac: Apply half-duplex-less constraint for DW QoS Eth only
Date: Fri, 12 Apr 2024 21:03:14 +0300
Message-ID: <20240412180340.7965-2-fancer.lancer@gmail.com>
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

There are three DW MAC IP-cores which can have the multiple Tx/Rx queues
enabled:
DW GMAC v3.7+ with AV feature,
DW QoS Eth v4.x/v5.x,
DW XGMAC/XLGMAC
Based on the respective HW databooks, only the DW QoS Eth IP-core doesn't
support the half-duplex link mode in case if more than one queues enabled:

"In multiple queue/channel configurations, for half-duplex operation,
enable only the Q0/CH0 on Tx and Rx. For single queue/channel in
full-duplex operation, any queue/channel can be enabled."

The rest of the IP-cores don't have such constraint. Thus in order to have
the constraint applied for the DW QoS Eth MACs only, let's move the it'
implementation to the respective MAC-capabilities getter and make sure the
getter is called in the queues re-init procedure.

Fixes: b6cfffa7ad92 ("stmmac: fix DMA channel hang in half-duplex mode")
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  7 +++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index cef25efbdff9..ec6a13e644b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -71,6 +71,13 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 static void dwmac4_phylink_get_caps(struct stmmac_priv *priv)
 {
 	priv->phylink_config.mac_capabilities |= MAC_2500FD;
+
+	if (priv->plat->tx_queues_to_use > 1)
+		priv->phylink_config.mac_capabilities &=
+			~(MAC_10HD | MAC_100HD | MAC_1000HD);
+	else
+		priv->phylink_config.mac_capabilities |=
+			(MAC_10HD | MAC_100HD | MAC_1000HD);
 }
 
 static void dwmac4_rx_queue_enable(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24cd80490d19..dd58c21b53ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1198,17 +1198,6 @@ static int stmmac_init_phy(struct net_device *dev)
 	return ret;
 }
 
-static void stmmac_set_half_duplex(struct stmmac_priv *priv)
-{
-	/* Half-Duplex can only work with single tx queue */
-	if (priv->plat->tx_queues_to_use > 1)
-		priv->phylink_config.mac_capabilities &=
-			~(MAC_10HD | MAC_100HD | MAC_1000HD);
-	else
-		priv->phylink_config.mac_capabilities |=
-			(MAC_10HD | MAC_100HD | MAC_1000HD);
-}
-
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
@@ -1237,10 +1226,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 				    priv->phylink_config.supported_interfaces);
 
 	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-						MAC_10FD | MAC_100FD |
-						MAC_1000FD;
-
-	stmmac_set_half_duplex(priv);
+						MAC_10 | MAC_100 | MAC_1000;
 
 	/* Get the MAC specific capabilities */
 	stmmac_mac_phylink_get_caps(priv);
@@ -7355,7 +7341,8 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
 									rx_cnt);
 
-	stmmac_set_half_duplex(priv);
+	stmmac_mac_phylink_get_caps(priv);
+
 	stmmac_napi_add(dev);
 
 	if (netif_running(dev))
-- 
2.43.0

