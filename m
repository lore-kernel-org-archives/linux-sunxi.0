Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459242882AC
	for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 17:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368593; cv=none; b=jsgU3bFgtUBTzTR0PXfMqs+1Y3s7+iAD1HljCKjqOpyzisOLobMTcsMLDeTJT1QcW0CvNxy3cAN1BSMaJerEA+FXx7sshSeKmUWt6KlAvy0JHk/Xq7FNLZn0WU0eb7PIwmU+ZbLYFfOqdgjMHoh2PXjiPoI7Va7NXn78W0+TLFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368593; c=relaxed/simple;
	bh=ocL9xN3l5CZIkJMP4iIsK/bvcDmu7NvmAZRKme5JHYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BAbfv8Kfs8LUlwZsSEXQAjd56WIHCa5ilF/grbf+V+zyKd0+OX1UHt/CuNNU1GYRmQ66R4etbEBWPM3HmHXyBEV2g7+yR9PaS96DHbXaXfvggVLnlrtNi8iHDmZHF6kPcwiI+sDcBV/XC/MgJ72xLA5sBaxAtfzkBNNJAdY79vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dF2A8TDZ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dF2A8TDZ"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so38770516d6.1
        for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 10:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748368590; x=1748973390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=dF2A8TDZrbVMjIz7An05Tv1zmijDOjVAzm2YeTN/ex6uaD76/zVw6+3CkfpmBVU2xq
         acXX/Zep5T6sys3UxHlIjzrWK/SFIGn4SGoiOby4ex5JYV96KEE5eS+r4subOBpBqWQP
         qs2epJfKNiM9nOm5j3R+Kxmpg4EW0/gB/BPAiZCHH9ET8cU9Mih47vDtmobEtyQI/ZIm
         YR6J5F0sMkwq2S+k80k96bjzZs1Jh0+1LyYkQLR2A4ldpRbelTqLuB7+M2kRCsFdOTJ9
         qnS6SR5bwJ/MUDYzwUhatPkZ1CLC14lmu6OAs4HJ+av/u72SH5hNHfHIVU2nc7WzuVgC
         VEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368590; x=1748973390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=F+mf7oPXmZocmyJ18oycOYtQncn1Ibd+IkgTgE/OYkamSzfuTMxHZFN6V2OmcVlUua
         fS+sV0xPKTR1hBd/+BadUsYAv4PvOxs8XGF8nf2mFKaRe6B5rMzmX/vD+O0TiojspWKJ
         sGgFoTkgaYvt4T3N8zT3urYLq/KL1rv3ZXkMDSQp1ReDUWbCvhc+CYjsJpuf9M7n+rg0
         7+8r+4dO0woau+2fBsXc5iAEWMRCjW02xPY505SKwExCalGAQPUrybWkrJvXL7foXid0
         O+wZxF4KhwXZ2zlyq3fQvBWk9qyRb2sb1kMmMLAjt80Dvte8JLDaOzIHHah+9lGsJtYn
         HS3A==
X-Gm-Message-State: AOJu0YwRkc6Dfq36VC15YptoHZes4dFW0rsVIpq77DqFHy8bHHO5rYQY
	xb11j2JH4tjUWBlKP2SuEqUYM0d1z0vuLRek1N4n0VmGt9crEyQUEvY8sEekNwxMyKw=
X-Gm-Gg: ASbGncseoJSLzM7udJSHjXRRdpOuR6cRqjj5xhnU/A3zaPrvBzLzOEYGDMf8/gtDtLN
	Mb5vU8Jddh2XJFQT5wFVNVcPXbv9uIyBpgyewnw9y90G33H6sxLrOSZ75PLz4rbmLiaG5Ao282j
	k6jA2qy2YX9jpXkscKQRET0CI1TLa6oU6zR1VtkxvQcpEUs7MwsE/ndbexEpCBvsCay86Ose4Uw
	GD4DOC7ESZjr8C+w9yQsy3y5m+J7hwYyVvo24drL783tkIVsCG2rCEbPMfhLnmE7qQV0R8ZXdfQ
	hX96nPNECtX+hGUIid9vZHHmS24P7WxywV4SdblnrUWiOHBUVscrcF/egK2oZVRjw/UhX/loZUC
	gMApR8kcBmjXHo20RvG/FwJJQ0m3g3g==
X-Google-Smtp-Source: AGHT+IFLIO0D64jUevJ/lz7zQvSZw2ntrY7H7wTTGXZU+ByFDYJ39AXVKInapU4LgwZEqDykU4orhg==
X-Received: by 2002:a05:6e02:154e:b0:3dc:87c7:a5b5 with SMTP id e9e14a558f8ab-3dc9b67fdd9mr138337085ab.3.1748368579606;
        Tue, 27 May 2025 10:56:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc82e014f4sm38082275ab.40.2025.05.27.10.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 10:56:19 -0700 (PDT)
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
Subject: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select PHY device
Date: Tue, 27 May 2025 11:55:54 -0600
Message-Id: <20250527175558.2738342-1-james.hilliard1@gmail.com>
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

