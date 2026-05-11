Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EA837F739
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 21:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535486; cv=none; b=Mad5VMJvHnGUiQ7nZZlIDTXhLYce12MT583dL+/A8ZvunkwwrkWmDnfZuMdduzZ/kv+USxqkgnTb2rq3ShCwxrpA063uGy7WODKp4I70nHdos1npbvgxW3ou5vu/shQUclAvy8SaUQhOPwxaKYYGXZesUT/hb/pSAwZASP0OYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535486; c=relaxed/simple;
	bh=ZuebneHLwwjWV2c6b/QFWASPVQ443WhMKbY6rAlQSdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0dDw1gkq8NbZ42GAyACo8aRk8orjOQtySsO8bQ91bMsutY05lVwjeQvXlM0RB+c2N6MlOEIL0zyIidSaKxiXGuczXe8YGlmslv9vM3nye2RgJcEcyxgzlCQ5V4CK+ZPpTZnd+UwgQOe/n/ModgylFIUuxb7FyLuLZ7uiq4+GSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZvNfaJBI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZvNfaJBI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A462C3A;
	Mon, 11 May 2026 14:37:59 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 283E63F85F;
	Mon, 11 May 2026 14:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778535484; bh=ZuebneHLwwjWV2c6b/QFWASPVQ443WhMKbY6rAlQSdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvNfaJBIhWMFOXsxc3e1P7BZIFzF/wlocnorJc+Abb1AfDNQ61ie1oTXBgnJemX/L
	 FYlcczzh5WqVKXbuoNoULpnTcWGQLKWl+2IUUFymm8GplWIgO//YCbXvcjlWvufQji
	 7syzQ2ATwARrbfSsg6OA/mWEzcbdKA4k4hxm37CM=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/5] sunxi: spl: spi: Add support for Allwinner A523
Date: Mon, 11 May 2026 23:37:11 +0200
Message-ID: <20260511213713.15943-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260511213713.15943-1-andre.przywara@arm.com>
References: <20260511213713.15943-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI IP in the Allwinner A523 is mostly compatible to the later
generation used in other Allwinner SoCs, at least as far as the SPL
driver is concerned.

Just add the pinmux configuration for SPI0 on PortC, as used by the
BROM. This enables SPI (NOR) boot on A523/A527/T527 boards.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/spl_spi_sunxi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/spl_spi_sunxi.c b/arch/arm/mach-sunxi/spl_spi_sunxi.c
index 905a7db2a77..25878026891 100644
--- a/arch/arm/mach-sunxi/spl_spi_sunxi.c
+++ b/arch/arm/mach-sunxi/spl_spi_sunxi.c
@@ -113,6 +113,8 @@ static void spi0_pinmux_setup(unsigned int pin_function)
 	const u16 spi0_pc_pins[4] = {
 #if IS_ENABLED(CONFIG_MACH_SUN8I_R528)
 		SUNXI_GPC(2), SUNXI_GPC(3), SUNXI_GPC(4), SUNXI_GPC(5)
+#elif IS_ENABLED(CONFIG_MACH_SUN55I_A523)
+		SUNXI_GPC(2), SUNXI_GPC(3), SUNXI_GPC(4), SUNXI_GPC(12)
 #elif IS_ENABLED(CONFIG_MACH_SUN50I_H616)
 		SUNXI_GPC(0), SUNXI_GPC(2), SUNXI_GPC(3), SUNXI_GPC(4)
 #elif IS_ENABLED(CONFIG_MACH_SUN50I_H6)
@@ -250,7 +252,8 @@ static void spi0_init(void)
 	unsigned int pin_function = SUNXI_GPC_SPI0;
 
 	if (IS_ENABLED(CONFIG_MACH_SUN50I) ||
-	    IS_ENABLED(CONFIG_SUN50I_GEN_H6))
+	    IS_ENABLED(CONFIG_SUN50I_GEN_H6) ||
+	    IS_ENABLED(CONFIG_MACH_SUN55I_A523))
 		pin_function = SUN50I_GPC_SPI0;
 	else if (IS_ENABLED(CONFIG_MACH_SUNIV) ||
 		 IS_ENABLED(CONFIG_MACH_SUN8I_R528))
-- 
2.46.4

