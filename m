Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5840846B99
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 20:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyEYdxUF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d3352b525so1152105e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 12:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703104571; x=1703709371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIdMcgR1xN4ns0nq94SPlX3IQrW5ygmTO1oJeanhn+I=;
        b=cyEYdxUFfSMNYhSzx+1dgyapIxREZlVNAq+XJT2EYa1uGgqiLpgCz+sNo+g4Y6vN4V
         F/QQPH5HXE+SwbNB8r1q9s160OFHkw7cqIOceRm9HDPbca4AzBm3OxbSX2vQy3ofGYH9
         ITkEA0iyWLmDTEPzSAgt5EoqueMpshUMUXW4lVu9WqgOl8THSBCojZ+tQITlR4+uBWnX
         EszenLwHysehSmFufhTkEZ71zZYH5m7W9TV4lHVXWLRWU7xZE9V2KS0xSBnCyEL9mhmK
         cwKk/lOnRtOwQhEBmXI9Ks5ThmjOfrqoZxNGyOxepudY1OFAr5DrfjPcmu/Qd4PjpPgs
         lQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703104571; x=1703709371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIdMcgR1xN4ns0nq94SPlX3IQrW5ygmTO1oJeanhn+I=;
        b=CTeDxVxFsB42ZioMWfTfqYB8xVQbGsgHiccUtZXeAPcBfyLpjC0nYM/k+LJhHM/j7H
         tJiq40UP9W+j21q/T5P/j0CQnim7b5QSlOWR9OwMCtzmfNPIoW09NZoSNK0vP0Hy0es3
         0E/uO7VYUgarNP18ejaAJiDzN3txD/XlfR47pSw1Zmvk6ftXwb4Vhqd7BGwZcnmNXSus
         B3DWWAGZ6DccjNu5svO7l2bGHktGRbmdgRIB622Qkoz8PdZEF2QKobJ1bjxC+Mc+heCm
         ntu0c9ErcDoRUq/YmGxrPsVZ+F8lCNjx6ltHZsYRdhlqZYmEoL1fTQEa1COWnekK3i/J
         PXHA==
X-Gm-Message-State: AOJu0Yz1uPRe68bB0rXmbv7SR4i3VtOvcLLp9yVuUl3Dm27RlZVXOLnj
	zBBIgRUrIUAlcjhLDsF/gOk=
X-Google-Smtp-Source: AGHT+IG/D8jv7xHts+zKw5KVQe0+21x1UOh0v3cWgYMqZaEVHW2LEgli3e1cqjEXDZ7JCD+2QIyOzQ==
X-Received: by 2002:a05:600c:63c8:b0:40c:5528:b482 with SMTP id dx8-20020a05600c63c800b0040c5528b482mr160077wmb.11.1703104571397;
        Wed, 20 Dec 2023 12:36:11 -0800 (PST)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c444e00b0040c58e410a3sm8703224wmn.14.2023.12.20.12.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 12:36:11 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	wens@csie.org,
	samuel@sholland.org,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v5 1/3] phy: handle optional regulator for PHY
Date: Wed, 20 Dec 2023 21:35:35 +0100
Message-ID: <20231220203537.83479-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220203537.83479-1-jernej.skrabec@gmail.com>
References: <20231220203537.83479-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corentin Labbe <clabbe.montjoie@gmail.com>

Add handling of optional regulators for PHY.

Regulators need to be enabled before PHY scanning, so MDIO bus
initiate this task.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/net/mdio/fwnode_mdio.c | 53 ++++++++++++++++++++++++++++++++--
 drivers/net/phy/phy_device.c   |  6 ++++
 include/linux/phy.h            |  3 ++
 3 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/net/mdio/fwnode_mdio.c b/drivers/net/mdio/fwnode_mdio.c
index fd02f5cbc853..bd5a27eaf40c 100644
--- a/drivers/net/mdio/fwnode_mdio.c
+++ b/drivers/net/mdio/fwnode_mdio.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/pse-pd/pse.h>
+#include <linux/regulator/consumer.h>
 
 MODULE_AUTHOR("Calvin Johnson <calvin.johnson@oss.nxp.com>");
 MODULE_LICENSE("GPL");
@@ -58,6 +59,40 @@ fwnode_find_mii_timestamper(struct fwnode_handle *fwnode)
 	return register_mii_timestamper(arg.np, arg.args[0]);
 }
 
+static int
+fwnode_regulator_get_bulk_enabled(struct device *dev,
+				  struct fwnode_handle *fwnode,
+				  struct regulator_bulk_data **consumers)
+{
+	struct device_node *np;
+	int ret, reg_cnt;
+
+	np = to_of_node(fwnode);
+	if (!np)
+		return 0;
+
+	reg_cnt = of_regulator_bulk_get_all(dev, np, consumers);
+	if (reg_cnt < 0) {
+		ret = reg_cnt;
+		goto clean_consumers;
+	}
+
+	if (reg_cnt == 0)
+		return 0;
+
+	ret = regulator_bulk_enable(reg_cnt, *consumers);
+	if (ret)
+		goto clean_consumers;
+
+	return reg_cnt;
+
+clean_consumers:
+	kfree(*consumers);
+	*consumers = NULL;
+
+	return ret;
+}
+
 int fwnode_mdiobus_phy_device_register(struct mii_bus *mdio,
 				       struct phy_device *phy,
 				       struct fwnode_handle *child, u32 addr)
@@ -113,12 +148,13 @@ EXPORT_SYMBOL(fwnode_mdiobus_phy_device_register);
 int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 				struct fwnode_handle *child, u32 addr)
 {
+	struct regulator_bulk_data *consumers = NULL;
 	struct mii_timestamper *mii_ts = NULL;
 	struct pse_control *psec = NULL;
 	struct phy_device *phy;
+	int rc, reg_cnt;
 	bool is_c45;
 	u32 phy_id;
-	int rc;
 
 	psec = fwnode_find_pse_control(child);
 	if (IS_ERR(psec))
@@ -130,6 +166,12 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 		goto clean_pse;
 	}
 
+	reg_cnt = fwnode_regulator_get_bulk_enabled(&bus->dev, child, &consumers);
+	if (reg_cnt < 0) {
+		rc = reg_cnt;
+		goto clean_mii_ts;
+	}
+
 	is_c45 = fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45");
 	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
 		phy = get_phy_device(bus, addr, is_c45);
@@ -137,9 +179,12 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 		phy = phy_device_create(bus, addr, phy_id, 0, NULL);
 	if (IS_ERR(phy)) {
 		rc = PTR_ERR(phy);
-		goto clean_mii_ts;
+		goto clean_regulators;
 	}
 
+	phy->regulator_cnt = reg_cnt;
+	phy->consumers = consumers;
+
 	if (is_acpi_node(child)) {
 		phy->irq = bus->irq[addr];
 
@@ -174,6 +219,10 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 
 clean_phy:
 	phy_device_free(phy);
+clean_regulators:
+	if (reg_cnt > 0)
+		regulator_bulk_disable(reg_cnt, consumers);
+	kfree(consumers);
 clean_mii_ts:
 	unregister_mii_timestamper(mii_ts);
 clean_pse:
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 2ce74593d6e4..31b6913ceed1 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -31,6 +31,7 @@
 #include <linux/phy_led_triggers.h>
 #include <linux/pse-pd/pse.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 #include <linux/rtnetlink.h>
 #include <linux/sfp.h>
 #include <linux/skbuff.h>
@@ -3400,6 +3401,11 @@ static int phy_remove(struct device *dev)
 
 	phydev->drv = NULL;
 
+	if (phydev->regulator_cnt > 0)
+		regulator_bulk_disable(phydev->regulator_cnt, phydev->consumers);
+
+	kfree(phydev->consumers);
+
 	return 0;
 }
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3cc52826f18e..832cb2d4f76a 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -757,6 +757,9 @@ struct phy_device {
 	void (*phy_link_change)(struct phy_device *phydev, bool up);
 	void (*adjust_link)(struct net_device *dev);
 
+	int regulator_cnt;
+	struct regulator_bulk_data *consumers;
+
 #if IS_ENABLED(CONFIG_MACSEC)
 	/* MACsec management functions */
 	const struct macsec_ops *macsec_ops;
-- 
2.43.0

