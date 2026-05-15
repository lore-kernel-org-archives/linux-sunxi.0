Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8D7405C21
	for <linux-sunxi@lists.linux.dev>; Fri, 15 May 2026 23:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888812; cv=none; b=CJjJsLjMLLSNyQq3ayUszrQEpc/qefQT702pPulU6ua+7CzTFifdxxKTjMwuy357+WYlrIrs9WlwxtLkjJ6ckIHL1UGwRRr5EoPQRnl88HEdvoa+IFCAwJEckPCFjPAM4UhT+JB1iO3X4bMAdPX9ErEGh9LJkaMrxf6a7E4d+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888812; c=relaxed/simple;
	bh=/NquZCMpDtl2WHUGjub+KUXRUFIT5Xv4Qr8cMNgBzUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRtqVy6JKFXImoPYWtKRv6zDr7NOvQ3ZCLEOAXoEvjI/O/O5ZOFyaq8XuG143hdBcOsD39iA1QYOkOxvPJ08vucruQL8ETX+t2+nqu2uiZtNSBD/YYf5wY5BCMgag1Tn9jet42qVXeSPzjrMwtlkhAHTefLWcXBgDX7H7yNNa7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qjjC6OCC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qjjC6OCC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D6E535EA;
	Fri, 15 May 2026 16:46:45 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BBF43F85F;
	Fri, 15 May 2026 16:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778888810; bh=/NquZCMpDtl2WHUGjub+KUXRUFIT5Xv4Qr8cMNgBzUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qjjC6OCCG+OKETa9Pgfa+gsDR9+gKhH3c5/raYpCfYuxQNQzfpe8z7nFaXWoLi6Wj
	 49/IqbxXfHNnh4s/auRF58qbpL6WU68NSWerv7WxDN1yOYWeu7f75iTDUbTaSe8JtQ
	 jU2tCMhw47fKsc01O+5H745lH5UALuuMXDyqabgw=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/5] sunxi: spl: spi: Add support for Allwinner A523
Date: Sat, 16 May 2026 01:45:59 +0200
Message-ID: <20260515234601.15431-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260515234601.15431-1-andre.przywara@arm.com>
References: <20260515234601.15431-1-andre.przywara@arm.com>
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
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/spl_spi_sunxi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/spl_spi_sunxi.c b/arch/arm/mach-sunxi/spl_spi_sunxi.c
index 5cdf155d76a..6c9937128b9 100644
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

