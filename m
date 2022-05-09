Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1221858
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 07:49:08 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v12so18146705wrv.10
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 00:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0WOritaX7TiJ2UopsHt1F9UHI9/f6Pz6lo2giHHHHfc=;
        b=vLRuZyi6JG45t+95C6Zta3+FYr+M/sDzl2IdgVFDJRasR/zCxX43dHJf6IvPLSvtqr
         tklZR3oTHy0zplc10ONoKpKCKy119QBEUcXrz1Oo6US9ejSe0sxQ6Vs+zLtR6kmLeO3i
         vHXOUL9q9mUqXk+bL2tcVuMHUhrZPP1KYRc3NROkD5kFaia7iEggoHtDUbiq9gSA8Y+J
         iap1VxxsVh2yRdaMG9hDRwZp/j7XRdaA9/AqTBLQ7QaM9NNAG8CzYhhoBTng+EwPHqU/
         tyeDLWFLZmElgocGQtR1jrB4ySjno+zMB+m2U/GkDTCt1t2NIE1e2YCxprZnmzodlgTM
         w1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0WOritaX7TiJ2UopsHt1F9UHI9/f6Pz6lo2giHHHHfc=;
        b=sbo8+8DWR2or4+FsJjbmPpgYhuB/AKokfUcNIerpU1A5c0PerWiPkQ70QrW88N0m7g
         UGEtMgKe/SBWMclzrDvJxp2HLYlDdDtB1tQ7yH1BapnVw85/PQUvbjoc29Q4PdM5HiWG
         WosPQr9kPWMbeGf/JLkLPJppXJKgtS22G7IkfJWpzLzBePG0my5Ekj8pX+aS1g1WFfB+
         G6RnEv8LFDKEU7EgGY9Mvggm5W/RMgS8gkmHUSR1VRD/xGCLabwK/HoymvIc0oM0RV/X
         k1Nht2eq6p2A3/MWI3VTe21kv3et7yqOW6AE3UHN5tmFMGk5kyJJBjcPBnTCQF94HI8S
         mxwQ==
X-Gm-Message-State: AOAM530QJCqm9mz8LpRj5ef7Lb+dyCdYVPtiLYQndYhYt1iC3dT22OkV
	SBqVfFvk6FqgQ5K+bCg4DE1rrA==
X-Google-Smtp-Source: ABdhPJzGdqYQa5SLHwgOMU9gEnMe0J8cSx5N3gasbEOGt8sIW3sW/mNltLBQn2gM6MAQ/S5AV3AtcQ==
X-Received: by 2002:a5d:42c8:0:b0:20a:d91f:87b5 with SMTP id t8-20020a5d42c8000000b0020ad91f87b5mr12678734wrr.301.1652082546379;
        Mon, 09 May 2022 00:49:06 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id bw22-20020a0560001f9600b0020c5253d8d8sm11784768wrb.36.2022.05.09.00.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 00:49:05 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: alexandre.torgue@foss.st.com,
	andrew@lunn.ch,
	broonie@kernel.org,
	calvin.johnson@oss.nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	jernej.skrabec@gmail.com,
	joabreu@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linux@armlinux.org.uk,
	pabeni@redhat.com,
	peppe.cavallaro@st.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 1/6] phy: handle optional regulator for PHY
Date: Mon,  9 May 2022 07:48:52 +0000
Message-Id: <20220509074857.195302-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509074857.195302-1-clabbe@baylibre.com>
References: <20220509074857.195302-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add handling of optional regulators for PHY.
Regulators need to be enabled before PHY scanning, so MDIO bus
initiate this task.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/net/mdio/fwnode_mdio.c | 32 ++++++++++++++++++++++++++++++++
 drivers/net/phy/phy_device.c   | 20 ++++++++++++++++++++
 include/linux/phy.h            |  3 +++
 3 files changed, 55 insertions(+)

diff --git a/drivers/net/mdio/fwnode_mdio.c b/drivers/net/mdio/fwnode_mdio.c
index 1c1584fca632..c377cadc14c3 100644
--- a/drivers/net/mdio/fwnode_mdio.c
+++ b/drivers/net/mdio/fwnode_mdio.c
@@ -10,6 +10,7 @@
 #include <linux/fwnode_mdio.h>
 #include <linux/of.h>
 #include <linux/phy.h>
+#include <linux/regulator/consumer.h>
 
 MODULE_AUTHOR("Calvin Johnson <calvin.johnson@oss.nxp.com>");
 MODULE_LICENSE("GPL");
@@ -95,6 +96,8 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 	bool is_c45 = false;
 	u32 phy_id;
 	int rc;
+	struct regulator *regulator_phy;
+	struct regulator *regulator_phy_io;
 
 	mii_ts = fwnode_find_mii_timestamper(child);
 	if (IS_ERR(mii_ts))
@@ -104,6 +107,32 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 					  "ethernet-phy-ieee802.3-c45");
 	if (rc >= 0)
 		is_c45 = true;
+	regulator_phy_io = devm_regulator_get_optional(&bus->dev, "phy-io");
+	if (IS_ERR(regulator_phy_io)) {
+		rc = PTR_ERR(regulator_phy_io);
+		if (rc == -ENODEV)
+			regulator_phy_io = NULL;
+		else
+			return rc;
+	}
+	regulator_phy = devm_regulator_get_optional(&bus->dev, "phy");
+	if (IS_ERR(regulator_phy)) {
+		rc = PTR_ERR(regulator_phy);
+		if (rc == -ENODEV)
+			regulator_phy = NULL;
+		else
+			return rc;
+	}
+	if (regulator_phy_io) {
+		rc = regulator_enable(regulator_phy_io);
+		if (rc)
+			return rc;
+	}
+	if (regulator_phy) {
+		rc = regulator_enable(regulator_phy);
+		if (rc)
+			return rc;
+	}
 
 	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
 		phy = get_phy_device(bus, addr, is_c45);
@@ -114,6 +143,9 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 		return PTR_ERR(phy);
 	}
 
+	phy->regulator_phy = regulator_phy;
+	phy->regulator_phy_io = regulator_phy_io;
+
 	if (is_acpi_node(child)) {
 		phy->irq = bus->irq[addr];
 
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 431a8719c635..ce64df596580 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -27,6 +27,7 @@
 #include <linux/phy.h>
 #include <linux/phy_led_triggers.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 #include <linux/sfp.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
@@ -1785,6 +1786,11 @@ int phy_suspend(struct phy_device *phydev)
 	if (!ret)
 		phydev->suspended = true;
 
+	if (phydev->regulator_phy)
+		regulator_disable(phydev->regulator_phy);
+	if (phydev->regulator_phy_io)
+		regulator_disable(phydev->regulator_phy_io);
+
 	return ret;
 }
 EXPORT_SYMBOL(phy_suspend);
@@ -1811,6 +1817,20 @@ int phy_resume(struct phy_device *phydev)
 {
 	int ret;
 
+	if (phydev->regulator_phy_io) {
+		ret = regulator_enable(phydev->regulator_phy_io);
+		if (ret)
+			return ret;
+	}
+	if (phydev->regulator_phy) {
+		ret = regulator_enable(phydev->regulator_phy);
+		if (ret) {
+			if (phydev->regulator_phy_io)
+				regulator_disable(phydev->regulator_phy_io);
+			return ret;
+		}
+	}
+
 	mutex_lock(&phydev->lock);
 	ret = __phy_resume(phydev);
 	mutex_unlock(&phydev->lock);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 2d12054932ba..c29f45668d94 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -704,6 +704,9 @@ struct phy_device {
 	void (*phy_link_change)(struct phy_device *phydev, bool up);
 	void (*adjust_link)(struct net_device *dev);
 
+	struct regulator *regulator_phy;
+	struct regulator *regulator_phy_io;
+
 #if IS_ENABLED(CONFIG_MACSEC)
 	/* MACsec management functions */
 	const struct macsec_ops *macsec_ops;
-- 
2.35.1

