Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C195F8472
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 00:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748219428; cv=none; b=k/AKz5Vy0PBZotNWcx3hRjgMHrrgIp7qFe1tDsSa5FeU7BzNnznkwW/TAJ+rQEU9e3ZL8R9LCDiN6Lk9aa3RIlLx34TIpu5LfrmFjPKHL2Jn+IDw2pVUhWiLimeF7BTqseFrqorzky1cr6u5YqQbUvlvXz3EF3i+iLfc+sHRwUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748219428; c=relaxed/simple;
	bh=ocL9xN3l5CZIkJMP4iIsK/bvcDmu7NvmAZRKme5JHYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNjjqyaj37LHXU9te/4seuNTpmYSdpejWClNsc0tDUm5twFBp5P/YPDYKBpu8ELTvIsKlNbYbsGCLGL9KV8AOAQMpXtlsWOzQmR+ddgTNXli7EKjmpLLiOsaKjg5hpXiHXXfpbpJfMROwmhg8/l9GMmuJs/rb4AzuPu7GFP1X1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbttAqKi; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbttAqKi"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86135af1045so163671639f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 25 May 2025 17:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748219426; x=1748824226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=WbttAqKisYyPDoFcDZcgrkkis+T2kB4y7S/2VS2UkzY2thATz86yn+jPuJ4pnbYTwH
         4ZrzcXj36md1eiixAWOjzKebX1FkYBbN1ZV+e5O+k6SxFlfwALAVR76LjSTMoGJJO5mb
         oJGgTJOxgQyHjlExrd2dSdq1bkcUrhpG4DsVdIA0RP1HP0yF3utq0kQjG3RT7bzbc6G9
         7R7HxRw8AJrj11w+uDvHUBUtMsOSUkFetv5PL64Tsk/EQo3AwRsk4vsMNwmnCXQKLFd+
         uIDP4DiTA3n48CqrVDbTbp8xPGos8TMtjNWJzH6zxV/xhJ7fU7Ws9ldNjXiZWiReLG1b
         HpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748219426; x=1748824226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=R3CHU210tGQYgyzTmGAGQ+PZ9ynQjUk10rCFESmwGsueIzRNRJjQO7oGhRB13Is1dY
         03sWdpAq7HSeU6S3ZD1NDmS1lAkLwGAzMJqmxLbrziBrQNA1jAC8wsNPqpzvk/tu7+YK
         ZR4Mm7P5xmPlM740q2gscVHz0WkMQ/G3MZoXu16vOaJx2/AiPdr1Qr/PoWEtRaqtpduc
         cpTgQ0LkSxMI/Faekde0Jov3wobgC7mfkAVT/GPqEpCWo95aT7y1egfBxJZJe6Wx+aaB
         rzVWel0CsN47T7Cmkal/XPNgwvrQ4h7kM9iqtWkKswtDtNH3nKOAcmPi7FEUu2QHnHzM
         sx/g==
X-Gm-Message-State: AOJu0YzA8nYBaa1kA4hkmervFlA+7kovKZiP9zTh634Kb0A8sdGWOUm2
	t+Y+2YJeni/GJlAhA+ZA+qx1n+4BF+qhTBDYOJUuG3sVxzF8+yrQc2Mr
X-Gm-Gg: ASbGncu8E1MM1rF0eYjVTYibnXjgPeZk7ruxH9mVtn3ubC1g7aGe8+PbwaZTpdKJLDX
	SyrDqUtfkcFOm/2fKouuwmMo5sdxk73Z5bHaI32heK7Qyzd8BNDYKd3Df7u/q585CNiXvsHQJVG
	bkBTO4O9k8DQ5N1KApux+x8k5ishWmiXv0OcS3HVcxwPGVfU20h5yJ5gEiL/bb52oTbkNBkrbdo
	COjk3CnqSa+wkMs8NLyoz9i9+vTskRIqOLZUj4DEHHSwwx0RxrDyX5RXCHTsLjlY8jJpHnOaASU
	7RDM90FIfJoBap1VqB4w0/pFRrc4qvKMPezCdmIV9HQkiW0FbHn+ibCqCfEMGHNiJvdhvW/QyJq
	rEWcYRnUYpW4H00EKvGDODf6qwetUjA==
X-Google-Smtp-Source: AGHT+IEUiP1VLM7hATU3uX+Sltx9XV9gv6KswEzefF313KmIFDOZCAlrrtUCSCIruHAM39yxFL/YfA==
X-Received: by 2002:a05:6e02:1988:b0:3dc:8c77:4d28 with SMTP id e9e14a558f8ab-3dc9b6aa09bmr58114665ab.1.1748219425742;
        Sun, 25 May 2025 17:30:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc85ef07dcsm25532785ab.36.2025.05.25.17.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 17:30:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	James Hilliard <james.hilliard1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] net: stmmac: allow drivers to explicitly select PHY device
Date: Sun, 25 May 2025 18:29:21 -0600
Message-Id: <20250526002924.2567843-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices like the Allwinner H616 need the ability to select a phy
in cases where multiple PHY's may be present in a device tree due to
needing the ability to support multiple SoC variants with runtime
PHY selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 59d07d0d3369..949c4a8a1456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1210,17 +1210,25 @@ static int stmmac_init_phy(struct net_device *dev)
 	 */
 	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
 		int addr = priv->plat->phy_addr;
-		struct phy_device *phydev;
+		struct phy_device *phydev = NULL;
 
-		if (addr < 0) {
-			netdev_err(priv->dev, "no phy found\n");
-			return -ENODEV;
+		if (priv->plat->phy_node) {
+			phy_fwnode = of_fwnode_handle(priv->plat->phy_node);
+			phydev = fwnode_phy_find_device(phy_fwnode);
+			fwnode_handle_put(phy_fwnode);
 		}
 
-		phydev = mdiobus_get_phy(priv->mii, addr);
 		if (!phydev) {
-			netdev_err(priv->dev, "no phy at addr %d\n", addr);
-			return -ENODEV;
+			if (addr < 0) {
+				netdev_err(priv->dev, "no phy found\n");
+				return -ENODEV;
+			}
+
+			phydev = mdiobus_get_phy(priv->mii, addr);
+			if (!phydev) {
+				netdev_err(priv->dev, "no phy at addr %d\n", addr);
+				return -ENODEV;
+			}
 		}
 
 		ret = phylink_connect_phy(priv->phylink, phydev);
-- 
2.34.1

