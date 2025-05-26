Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD9E1C84D7
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284214; cv=none; b=nlt/UDZvWFgW75ohwzq/R2eH7OYWJLUWZArfQR9TssHcvhAUrI0tsBdncPX6jOV4jro3eAYQMtaYtWDnPicZPwQbyqOdd5ZyvKPpJqOdzS4HX2XusnGCzMFnBR6FS590ISMBHBlJJo8eKCo3HOk2c5Shdz5WF3JTniwLHMbp6VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284214; c=relaxed/simple;
	bh=ocL9xN3l5CZIkJMP4iIsK/bvcDmu7NvmAZRKme5JHYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WityYzORCdFDyDMnUmtz1VmYRzCv9elWBSeqCpECM7RpAhWHCBfkCXhG2VuyXmXBrIrdLIVvAnjukvY0/E/zun+JvprrP3yILlmzyY/LH/iiUOnnP1eBVRrc5j2YeVgi4W0P2GRz12l7k4xBH96uuqQc/kRgTmuXW5Lldba4FsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWI/QOOu; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWI/QOOu"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-864a071b44bso41583439f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748284211; x=1748889011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=bWI/QOOu9SZHNgqu0VhVCpTONJN9SSw6NCNT5PRImINUTIoEonVgF7esuTTwkjkrzz
         zJvPIi7KGKC9SmrXa4xFyiLFBeCpqkhu2WOFOJajL5TXPk8zgnc+GowXapnBWveTD3d+
         pxDYlMS6GZMcxAIeaAF0U06C+mQY6NRXvIeTf7CrjbJ9ibC7qFXH9TIaSr7GmP2p8gq8
         JR1hJB+P1cOVG7BLWFpKk17zftsnmJWuRfHLPxmYDGdRcwHvjsc40MHZU5huvJ4qeDry
         Gma7Orv6kbfbBCbhnr4q956Wr/9ohs0SlUVBoFctKzFpywiv1MYkIQdn9MHEjFeOJHuG
         i7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284211; x=1748889011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlxuW8EiAaobylr07WlFl9Wc9Vavh5mNNDPDEO1zHCA=;
        b=MJhMvG/Q1INl9W6kjrDc+xavZPKlJ19p9RzkK4popybemFMToQyuuJY41Yi+QpqC+F
         7oJ7T52H9Kfwk/TVKVTjoQw5Fy5bAAO82kohXK5nO9fJWn38/32zv4rroqHRK7LsYj3j
         Ut3JBId1V7bJ46rYYc9CF6C8BNwH84PULj8QNw8k5iYi84BpZSd/RaWzGllly5i5hUm4
         sDi3oil3GV6ZK1xja+J8vSkYyi36bDLE0sO50wQGMsjkHqji04F5/lartw7SLIxNomi7
         wjEBUVT2v2lcDnsqUctfUv1CSS1PGWn+0/ovThZtiuiHWw/6FjEzYUKb3VuEWbc+Phg8
         yitA==
X-Gm-Message-State: AOJu0Ywau8GnnKTRhw4tYzanKBA4pX2m/L/kp1QfeZmjY/mDWCxrp6Ez
	rL7tn3YabOaeDWcTXVFMLyGkOvHA1VyRx1oFjwWM4FxFzxKTJ606nnpD
X-Gm-Gg: ASbGncuPoRyAtqipnt7JJNul/1gF8vwr4AGjtu+e0/+w1NK1iu+52dsg2BPArzZMJ5r
	CQz3ja8GuhrQsQwZJG07QQkFFfWM9frYJD67Cs7xO0dwRf7HRNM6gISit2+bwIC2S2TSlkFauL9
	oT1UyDuP5Lnwli84dQRXLx0Plxz1sXFVluM9y1isAnSGH1f6vVD71iS19ECF8JXpTNOhQwNAX74
	PdD+m3sqfvWX8vomotVa9dKcHpED9ee0Qc7c63jgqUeWwDMJqa+EONkM82rtDM0cCqTa7nEbQtt
	zqduN6nkl4yIGfTwlSRnj7UEKCh4Gv2P6vfn+8dtSKtyExmWunizpXpI/d+6yTj7Rp+L9jbsFHt
	1famYlg6NgzPbl8Q59OypYuM39iPMeQ==
X-Google-Smtp-Source: AGHT+IF1vt1ugwCJCcgD8FLb9pLv6neLoJcOaXY12NIdGkKI+c6RUDeQIjiCz+L7fEf4ThkwNMlUxA==
X-Received: by 2002:a05:6602:474b:b0:864:48ec:c312 with SMTP id ca18e2360f4ac-86cbb7b86c3mr1087224339f.3.1748284211399;
        Mon, 26 May 2025 11:30:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235bff69sm477028639f.8.2025.05.26.11.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:30:10 -0700 (PDT)
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
Subject: [PATCH v1 1/3] net: stmmac: allow drivers to explicitly select PHY device
Date: Mon, 26 May 2025 12:29:34 -0600
Message-Id: <20250526182939.2593553-1-james.hilliard1@gmail.com>
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

