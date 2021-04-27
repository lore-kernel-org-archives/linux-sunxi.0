Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59EE2F80
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Apr 2021 00:03:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3CCAD6E;
	Mon, 26 Apr 2021 17:03:58 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3C3F3F73B;
	Mon, 26 Apr 2021 17:03:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Marek Vasut <marex@denx.de>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] usb: musb-new: Extend Allwinner quirk to newer SoCs
Date: Tue, 27 Apr 2021 01:03:23 +0100
Message-Id: <20210427000323.18285-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

As the comment in musb_regs.h describes, Allwinner saves the
MUSB_CONFIGDATA register, which always return 0 on those SoCs.

This is also true for the H6 and H616, so extend the quirk to those
controllers as well.

This fixes USB peripheral mode on H6 and H616 boards.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/usb/musb-new/musb_regs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb-new/musb_regs.h b/drivers/usb/musb-new/musb_regs.h
index c4d7203b851..bee1b715a95 100644
--- a/drivers/usb/musb-new/musb_regs.h
+++ b/drivers/usb/musb-new/musb_regs.h
@@ -432,7 +432,8 @@ static inline u8 musb_read_ulpi_buscontrol(void __iomem *mbase)
 static inline u8 musb_read_configdata(void __iomem *mbase)
 {
 #if defined CONFIG_MACH_SUN8I_A33 || defined CONFIG_MACH_SUN8I_A83T || \
-		defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I
+	defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I || \
+	defined CONFIG_SUN50I_GEN_H6
 	/* <Sigh> allwinner saves a reg, and we need to hardcode this */
 	return 0xde;
 #else
-- 
2.17.5

