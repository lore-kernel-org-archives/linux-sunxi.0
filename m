Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93433F3
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748792825; cv=none; b=MRh+aDEkvGV/VSwlhKgko8sSxBhClncwODDbKJsm1imzjt9gYIGZgQS1qxtrjEZq3NjInWfOl/do3HBnSoC2zW2zU+HiqaMiMqJtPDnnio+/4GSuAfB30TOKfKnIZk3BptzUDxR/ddUZu3rFiqd9jQ9VnHCUbiDjQ+yJtl9b8IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748792825; c=relaxed/simple;
	bh=VXFqk/yvuEXeUxaobysqliMV6KbV3FLkxHI8zEGsd9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=auREKl06Sf//oP30s3U81mfxLkypb/FTd8ooEXHE3wP2WsWx9XkOQEybb+AsuPMDWoRI4WYnxMFUr9ducnf9hfMITeX/l8FAdaLjhWVdIFwQmiBXSKpb5SsxB80VIIM1SMdPLzYGXncnG9G7gyK/0Sxh13+X0XTscYwuGQbXfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr; spf=pass smtp.mailfrom=paulk.fr; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paulk.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paulk.fr
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1E46A1F0003D
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jun 2025 15:40:33 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 63B37AC329F; Sun,  1 Jun 2025 15:40:32 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id C708EAC329F;
	Sun,  1 Jun 2025 15:39:58 +0000 (UTC)
From: Paul Kocialkowski <contact@paulk.fr>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 0/6] Various V3/S3/V3s fixes and improvements
Date: Sun,  1 Jun 2025 17:39:37 +0200
Message-ID: <20250601153943.2690123-1-contact@paulk.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Paul Kocialkowski (6):
  sunxi: Kconfig: Fix default order for V3s DRAM clock
  sunxi: Add support for the Lichee Pi Zero with Dock
  sunxi: Split V3/S3 support from V3s
  sunxi: pinecube: Enable EMAC and network support
  power: axp: Fixup default voltages for V3/S3
  net: sun8i-emac: Add support for active-low leds with internal PHY

 arch/arm/dts/Makefile                       |  8 +++---
 arch/arm/include/asm/arch-sunxi/cpu_sun4i.h |  1 +
 arch/arm/mach-sunxi/Kconfig                 | 29 ++++++++++++++++-----
 arch/arm/mach-sunxi/board.c                 |  3 ++-
 arch/arm/mach-sunxi/cpu_info.c              |  2 ++
 arch/arm/mach-sunxi/dram_sunxi_dw.c         |  4 +--
 arch/arm/mach-sunxi/spl_spi_sunxi.c         |  1 +
 board/sunxi/board.c                         |  2 +-
 configs/LicheePi_Zero_Dock_defconfig        |  7 +++++
 configs/LicheePi_Zero_defconfig             |  1 -
 configs/pinecube_defconfig                  |  9 ++-----
 drivers/clk/sunxi/Kconfig                   |  2 +-
 drivers/net/sun8i_emac.c                    | 14 ++++++++--
 drivers/phy/allwinner/Kconfig               |  2 +-
 drivers/pinctrl/sunxi/Kconfig               |  2 +-
 drivers/power/Kconfig                       | 12 ++++++---
 16 files changed, 68 insertions(+), 31 deletions(-)
 create mode 100644 configs/LicheePi_Zero_Dock_defconfig

-- 
2.49.0

