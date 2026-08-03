Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D2037BE83
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752121; cv=none; b=pykvhk83Dngb7dtb0qXhiMkaoxAjZBD2ATqvuqvTgOKCFTNUq94LfweRLnc+LWJx6NyqeBRo1X2O5Dw7+ek/r09DOoChkoKKROnQ/i32P3Sf1VymTLqqljcHW2pMCwUt0XEpMTEaB+ganPDuVgtkMGpz3Zf+SROXD16D2I689aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752121; c=relaxed/simple;
	bh=QOzvt9t/MIRWZBLs3wy9qmzt+LKR/lt21R4C8HB6byU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRIE32uln6n12W5rcPUXgsGR7Mca/KBrX/XTSh8v26NZZI7WUqV26j9JyCXUVs2cAeB8lBJ13UIhi6cKRooW4YrbuDuPUs2IREw0b40A7XKW2LMtdBSzVdbPdhA0DNPN9CrigQ5qNQvaNeDL6Z/Esvp3wNN/5Pl81YWZrK/IXl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GOmfoRQb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GOmfoRQb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A2A115A1;
	Mon,  3 Aug 2026 03:15:14 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901A83F632;
	Mon,  3 Aug 2026 03:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752118; bh=QOzvt9t/MIRWZBLs3wy9qmzt+LKR/lt21R4C8HB6byU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOmfoRQbY+zr8SjY5r3n9rMeI5Q7MMm+HUliKJZf5pZmLr4Si9fDOV/myP9Dvmiit
	 YmNcfVuGzl4znJ63ZvzGg+XzMuWnT7Vne6VZRhmWaUusehotNYa4ncOyfV2IUuqdXm
	 Bo/dsIJSuQq0t9nGHmFc8+7CJON0vCNpN8o5FUDE=
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Liu Changjie <liucj1228@outlook.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] net: phy: maxio: extend PHY ID matching
Date: Mon,  3 Aug 2026 12:14:50 +0200
Message-ID: <20260803101452.2993721-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101452.2993721-1-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the maxio Ethernet PHY driver expects a PHY matching exactly the
one ID provided: 0x7b744412. The Maxio MAE0621A-Q3C model used on
the Allwinner based X96QPro+ TV box uses a slightly different PHY ID:
0x7b744411.

Replace the "exact match" requirement with the more relaxed "model
match" version, which ignores the lowest 4 bits of the PHY ID. Both
PHYs should now be recognised by the driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/net/phy/maxio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/maxio.c b/drivers/net/phy/maxio.c
index 5fabf99fb90f..d97fb50cdbe1 100644
--- a/drivers/net/phy/maxio.c
+++ b/drivers/net/phy/maxio.c
@@ -87,7 +87,7 @@ static int maxio_mae0621a_config_init(struct phy_device *phydev)
 
 static struct phy_driver maxio_drivers[] = {
 	{
-		PHY_ID_MATCH_EXACT(MAXIO_MAE0621A_PHY_ID),
+		PHY_ID_MATCH_MODEL(MAXIO_MAE0621A_PHY_ID),
 		.name		= "Maxio MAE0621A",
 		.probe		= maxio_mae0621a_probe,
 		.config_init	= maxio_mae0621a_config_init,
@@ -100,7 +100,7 @@ static struct phy_driver maxio_drivers[] = {
 module_phy_driver(maxio_drivers);
 
 static const struct mdio_device_id __maybe_unused maxio_tbl[] = {
-	{ PHY_ID_MATCH_EXACT(MAXIO_MAE0621A_PHY_ID) },
+	{ PHY_ID_MATCH_MODEL(MAXIO_MAE0621A_PHY_ID) },
 	{ }
 };
 MODULE_DEVICE_TABLE(mdio, maxio_tbl);
-- 
2.43.0

