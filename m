Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C038A714
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734129; cv=none; b=Nr3jEmGg5SQkvOwxeY5Z2dy2kNHACfE+VwLjCZgHynOgApoxEE1pkff79dqyBbYK9jPAUfJDb9YNOgvjuSS2I+Cs8fbhkggkKJ8NYj1SS8xNljbagU3zspyDgefI0YaLmmDwWbG3htCy7yDkrq/EW8+EhD5ZFq0HW9Ljxb80GWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734129; c=relaxed/simple;
	bh=APfgpJTVA4pOI91gbDaanL4SMg80qg6DwGibNA5NVGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sksvJ78MXQiwpyzpaiY2FuO8S5nAbAb/yv0voN/fzxFs9aL+Lcmp4UQdNS+OVWUPrsw7oxL5JZpwymo+OfaEYuYQSc73GHAWYD5iA1paUU6coRK/aRMdlIwbYoIaYSA+e6BoBZlewURjqN8pVUK3Cg7iVtcFal6IpGBnMdXA5bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEccS9VL; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEccS9VL"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so1586085a34.3
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734126; x=1786338926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=;
        b=JEccS9VLc/PlJD0Mo1D5Vg85nXMsC4fIaegbruqeTzwtCbS3a0cw1CV5vyp6toFPAR
         K9WfSZIDMIqoCDHEal3wePPURMoZFTs9Rhdv2hAHF1hh0jXEL3Q9aiAZ8o4yR6wxjozp
         2YYbPRmvKvJS+FHGskBeB28OMCTD0/Tv0W1fzV8UOpjVElkFI8zRB60ociILp3miC53D
         YgLbaJgjzeRLU3OZdq8Pw35bDNq35NWfe9BnaSLNoaC9As7zw1IQ+0iZ5Jrakctl4qTd
         UQUxNibqEyBRsd0IAlEnTOZPaUx9+ybry5TX5PACkOJMmcBQJsJp2eyMMDTTd+oLQkgj
         cq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734126; x=1786338926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=;
        b=izksQj6FBJsRRA/9TzFSKmkTAsxLBOMGLJwmL1If+NEPpR9ngD2jHpJ5yPbD491GtO
         TkhB1JrwfDdI7a4y6wXg6k1BsMG0hCO5y43gkMNuVgxuMQg8ox/0ApgUjwNZsr3bvz9p
         nj36tadtzSNDIMirWffpwl8r4t9FLbJbMkTAriC9EPv9FnSaS1TPfuTcrLQ2x4Za7+k5
         4Uy2tC85h5BhsFBQ24SMNQ434JeI4VhS33V9hRfdoiEDFR7z72HIXkbexgwJVkfTOBsv
         f0hxPTx5cprJTigv33bAQvMubTMGvW7mJoHE+fg5qDnJ3CI48rjPMlyUYEMKsijwO84Z
         3fqg==
X-Forwarded-Encrypted: i=1; AHgh+RqUuwf6qWtTuEuy2gbQVPPin/RYlXEW28in1VN8qXbu6h8YsZNqBQWLx3/A/k2TqE6FR0TmKqr5bvasGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvhCu+yP20kkjbi4P/voqWBZHmTobRmngIjg1RkXq9waBAJ/5U
	mw80DCF/k1qVoe9c08FtMnMEtEhAnYhBdNgb5e/lCFYxeSLMZbzP1Grh
X-Gm-Gg: AR+sD10Dz7k/6GQp03bbc4ovMbO8Kbd0dMDgtymyArCgAK8F7mjBUmD5uEQNqJQ0lxw
	pKeMoylIQlCOUVsRN405cjY+2o0QxZjzQuUx2Kkc8ujpNjJ0eCYyFl+zSgxFciuoMpFhju9znJo
	zMmBFEpRFOHAQCzCQDYHVi/B4yYSyZr5zq7hpjKLRPU5vz7jQqqq4UsiWa68he3YO3+TswpxyTM
	/jsOZHxAjNpWu7u/JRpylHy+ySF+aIohFSuBrvV/Hy+6H0XXLvQ/88CMOhjSI03szBIGv7fefCL
	5ThbvB6ya4vIEhG0p1l/RK98wMnd6P63KjH3JU+Aa6Z/ohKhcjDGbkNmKF5b2Y4E8MbPvx+qTTx
	cWLkUusEFdQWXpZXBFsZbg2jz/QOTXku6etH3Ze0aCOzl3+1JD6gOW+rkCUjGrTTS/sPZYOcuJ6
	nE5CGXCAo193xtqwvsH0r1sF95QBQ45Ho+bDhDNKfd4pDJyHDN6kXQalrY7a4aGbiUaWObRNmP1
	slHHBv7iOt7ln/ym60Rg29XPIhpVTMhvWrS3OzdL40FevRz6yQRCzZCmdFrOQ41WwrS+clDCLKC
	y1pmWx9zSOh/rNvlWLU3DySDyAceeq7M/IajNpRAz0iGgyvVI57LWeZ4HADgbXTEyEJliBMqwU5
	oMlZd1Brla2kO5pav4rd+eUHk9D2L0ssokJFJqg==
X-Received: by 2002:a05:6830:8389:b0:7e9:e709:44f6 with SMTP id 46e09a7af769-7f196ea3b40mr13694676a34.12.1785734125552;
        Sun, 02 Aug 2026 22:15:25 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:14 -0600
Subject: [PATCH 04/21] net: mdio: factor out OF child registration helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-4-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Live OF reconfiguration needs to create the same PHY and generic MDIO
devices as initial bus population, including legacy PHY nodes that need
address scanning.

Factor fixed-address child registration and PHY address scanning into
helpers. The old scan loop also visited every free address for a child
without a reg property even when the child was not a PHY. Reject that case
before scanning while preserving enumeration of valid PHY and generic MDIO
children.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/mdio/of_mdio.c | 66 ++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..051e449bbe7c 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -77,6 +77,15 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
 	return 0;
 }
 
+static int of_mdiobus_register_child(struct mii_bus *mdio,
+				     struct device_node *child, u32 addr)
+{
+	if (of_mdiobus_child_is_phy(child))
+		return of_mdiobus_register_phy(mdio, child, addr);
+
+	return of_mdiobus_register_device(mdio, child, addr);
+}
+
 /* The following is a list of PHY compatible strings which appear in
  * some DTBs. The compatible string is never matched against a PHY
  * driver, so is pointless. We only expect devices which are not PHYs
@@ -136,6 +145,32 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
 }
 EXPORT_SYMBOL(of_mdiobus_child_is_phy);
 
+static int of_mdiobus_scan_phy(struct mii_bus *mdio,
+			       struct device_node *child)
+{
+	int addr, rc;
+
+	if (!of_mdiobus_child_is_phy(child))
+		return -ENODEV;
+
+	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+		if (mdiobus_is_registered_device(mdio, addr))
+			continue;
+
+		dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
+			 child, addr);
+
+		/* -ENODEV means that scanning should continue. */
+		rc = of_mdiobus_register_child(mdio, child, addr);
+		if (!rc)
+			return 0;
+		if (rc != -ENODEV)
+			return rc;
+	}
+
+	return -ENODEV;
+}
+
 static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 				   bool *scanphys)
 {
@@ -164,10 +199,7 @@ static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 			continue;
 		}
 
-		if (of_mdiobus_child_is_phy(child))
-			rc = of_mdiobus_register_phy(mdio, child, addr);
-		else
-			rc = of_mdiobus_register_device(mdio, child, addr);
+		rc = of_mdiobus_register_child(mdio, child, addr);
 
 		if (rc == -ENODEV)
 			dev_err(&mdio->dev,
@@ -197,7 +229,7 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 {
 	struct device_node *child;
 	bool scanphys = false;
-	int addr, rc;
+	int rc;
 
 	if (!np)
 		return __mdiobus_register(mdio, owner);
@@ -238,27 +270,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		    of_node_name_eq(child, "ethernet-phy-package"))
 			continue;
 
-		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-			/* skip already registered PHYs */
-			if (mdiobus_is_registered_device(mdio, addr))
-				continue;
-
-			/* be noisy to encourage people to set reg property */
-			dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
-				 child, addr);
-
-			if (of_mdiobus_child_is_phy(child)) {
-				/* -ENODEV is the return code that PHYLIB has
-				 * standardized on to indicate that bus
-				 * scanning should continue.
-				 */
-				rc = of_mdiobus_register_phy(mdio, child, addr);
-				if (!rc)
-					break;
-				if (rc != -ENODEV)
-					goto put_unregister;
-			}
-		}
+		rc = of_mdiobus_scan_phy(mdio, child);
+		if (rc && rc != -ENODEV)
+			goto put_unregister;
 	}
 
 	return 0;

-- 
2.53.0

