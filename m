Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E9E35947
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729788; cv=none; b=Yk5JDPN5aQiAdY63pF5P4azcBbcmliDHeOkNx0t2tPg2OVPSL2kDm24IJaWdG6fg680WBYABlc0ICtxwsa0LDmXB3MRb/PWJHW/Ijw5r7FIlPVUQYRX6VhRjivU3tyuxla6zwC5qIz8KvgEfMpahHbEP8Y6+6Uqd6Tl08JG23VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729788; c=relaxed/simple;
	bh=uzh475OME+Qy3ELqmjXaYhTQe/C5IZMtRkTUu0Bt8fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDMQkYKP+ATr7icswkDd5r5HMeDzjPlDSy0KZM8mcmuZBbTf/jhAe/zuqSUVIJYDy0/fdPHRPy3Dyv9GiF4IW54PZNlnF4vJP5neQrsfvEOQlpBRni6h/xXxUBsU/hxpzTwjJ6fD2ECurcr5Ups+MhYeGW7HVR1uhm15yzmFjEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F6D7339;
	Sun, 23 Mar 2025 04:36:33 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E64EB3F694;
	Sun, 23 Mar 2025 04:36:25 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 13/34] sunxi: spl: add support for Allwinner A523 watchdog
Date: Sun, 23 Mar 2025 11:35:23 +0000
Message-ID: <20250323113544.7933-14-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250323113544.7933-1-andre.przywara@arm.com>
References: <20250323113544.7933-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The watchdog in the Allwinner A523 SoC differs a bit from the one in the
previous SoCs: it lives in a separate register frame, so no longer
inside some timer device, and it manages to shuffle around some
registers a bit.

Provide a new struct describing the register layout, and adjust the
address calculation in the SPL code accoringly. This is guarded by the
MACH_SUN55I_A523 Kconfig variable.
---
 arch/arm/include/asm/arch-sunxi/watchdog.h | 12 ++++++++++++
 arch/arm/mach-sunxi/board.c                |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/include/asm/arch-sunxi/watchdog.h b/arch/arm/include/asm/arch-sunxi/watchdog.h
index 38e2ef2aca3..96d5725141e 100644
--- a/arch/arm/include/asm/arch-sunxi/watchdog.h
+++ b/arch/arm/include/asm/arch-sunxi/watchdog.h
@@ -26,6 +26,18 @@ struct sunxi_wdog {
 	u32 res[2];
 };
 
+#elif defined(CONFIG_MACH_SUN55I_A523)
+
+struct sunxi_wdog {
+	u32 irq_en;		/* 0x00 */
+	u32 irq_sta;		/* 0x04 */
+	u32 srst;		/* 0x08 */
+	u32 ctl;		/* 0x0c */
+	u32 cfg;		/* 0x10 */
+	u32 mode;		/* 0x14 */
+	u32 ocfg;		/* 0x18 */
+};
+
 #else
 
 #define WDT_CFG_RESET		(0x1)
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 701899ee4b2..89aea61e8e8 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -495,6 +495,12 @@ void reset_cpu(void)
 		/* sun5i sometimes gets stuck without this */
 		writel(WDT_MODE_RESET_EN | WDT_MODE_EN, &wdog->mode);
 	}
+#elif defined(CONFIG_MACH_SUN55I_A523)
+	static const struct sunxi_wdog *wdog =
+		(struct sunxi_wdog *)SUNXI_TIMER_BASE;
+
+	writel(WDT_CTRL_KEY | WDT_CTRL_RESTART, &wdog->srst);
+	while (1) { }
 #elif defined(CONFIG_SUNXI_GEN_SUN6I) || defined(CONFIG_SUN50I_GEN_H6) || defined(CONFIG_SUNXI_GEN_NCAT2)
 #if defined(CONFIG_MACH_SUN50I_H6)
 	/* WDOG is broken for some H6 rev. use the R_WDOG instead */
-- 
2.46.3

