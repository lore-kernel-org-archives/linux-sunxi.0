Received: from dd20004.kasserver.com (dd20004.kasserver.com [85.13.150.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00812F80
	for <linux-sunxi@lists.linux.dev>; Sat,  1 May 2021 12:41:03 +0000 (UTC)
Received: from timo-desktop.lan.xusig.net (i59F4D773.versanet.de [89.244.215.115])
	by dd20004.kasserver.com (Postfix) with ESMTPSA id D30D5544DC00;
	Sat,  1 May 2021 14:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silentcreek.de;
	s=kas202012291009; t=1619872856;
	bh=OHjbJOgZC9lH9A5epG61N9yp14naYRxyoht5m0VTHWI=;
	h=From:To:Cc:Subject:Date:From;
	b=lIVpjwa8ThuKX8tZl5wayV9GigazbbnLffUUCuhtgTRFXrpUMvixVuHyRqy2XKXjj
	 TSpZyjDwjFzExrJjHHTofcF5ndn91CxYWYr5wMhMoBpTmaR8en4aFjZC8AGWUP4m3l
	 X8jSkpMneMEBXHtN5DTALbaDBY/k0LaWlm2NIMxPSRNGMXGspiyhl3VNR9v79D6frN
	 pV7rMIod0G6X2HS6N9FmzjtiPp+A7AozvrvJY4bNZ1ab/zbrSJgrjfERgquS6bgqny
	 LouM5+u5bP29CmTaWKCYxD0sOeCBvuUL0Gvd8ZYbwUVqYovfuNVqNs3no8BJT5UEg9
	 199OdQGW9aq7g==
From: Timo Sigurdsson <public_timo.s@silentcreek.de>
To: axboe@kernel.dk,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@siol.net,
	linux-ide@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: sergei.shtylyov@gmail.com,
	gregkh@linuxfoundation.org,
	oliver@schinagl.nl,
	Timo Sigurdsson <public_timo.s@silentcreek.de>
Subject: [PATCH v2] ata: ahci_sunxi: Disable DIPM
Date: Sat,  1 May 2021 14:40:26 +0200
Message-Id: <20210501124026.8016-1-public_timo.s@silentcreek.de>
X-Mailer: git-send-email 2.26.2
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DIPM is unsupported or broken on sunxi. Trying to enable the power
management policy med_power_with_dipm on an Allwinner A20 SoC based board
leads to immediate I/O errors and the attached SATA disk disappears from
the /dev filesystem. A reset (power cycle) is required to make the SATA
controller or disk work again. The A10 and A20 SoC data sheets and manuals
don't mention DIPM at all [1], so it's fair to assume that it's simply not
supported. But even if it was, it should be considered broken and best be
disabled in the ahci_sunxi driver.

[1] https://github.com/allwinner-zh/documents/tree/master/

Fixes: c5754b5220f0 ("ARM: sunxi: Add support for Allwinner SUNXi SoCs sata to ahci_platform")
Cc: stable@vger.kernel.org
Signed-off-by: Timo Sigurdsson <public_timo.s@silentcreek.de>
Tested-by: Timo Sigurdsson <public_timo.s@silentcreek.de>
---
Changes since v1:

- Formal changes to the commit message as suggested by Greg Kroah-Hartman
  and Sergei Shtylyov (Fixes and Cc lines). No changes to the patch
  itself.
---
 drivers/ata/ahci_sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_sunxi.c b/drivers/ata/ahci_sunxi.c
index cb69b737cb49..56b695136977 100644
--- a/drivers/ata/ahci_sunxi.c
+++ b/drivers/ata/ahci_sunxi.c
@@ -200,7 +200,7 @@ static void ahci_sunxi_start_engine(struct ata_port *ap)
 }
 
 static const struct ata_port_info ahci_sunxi_port_info = {
-	.flags		= AHCI_FLAG_COMMON | ATA_FLAG_NCQ,
+	.flags		= AHCI_FLAG_COMMON | ATA_FLAG_NCQ | ATA_FLAG_NO_DIPM,
 	.pio_mask	= ATA_PIO4,
 	.udma_mask	= ATA_UDMA6,
 	.port_ops	= &ahci_platform_ops,
-- 
2.26.2

