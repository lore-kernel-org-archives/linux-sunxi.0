Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0C181741
	for <linux-sunxi@lists.linux.dev>; Thu,  9 May 2024 23:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715298255; cv=none; b=QJM6PG5PkLLS9EYX0XO03oJZjLUHkRkTZNrv2rZ/677PlatH4r9T6gB3s1ddSfvtBNcxOQDAABRTlfnybiKfVGRiYK4jPRIxQq5jiYRmxZUw4BYdSd990HK9JZb2GvWnZziIrT9fAh1hYYUM3TesaA9jPL1ykfptT+HkGcn2dR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715298255; c=relaxed/simple;
	bh=YbMZ/SZLIk7cZDQGYBam+hrLcVMcs3W7MpI3XQY+z+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FqhG7tTBeL/SSrKPj49tib8/A3qYjnKKDlkFgcEIcvETuRUL2ZaG7WejQ1nq4b2PhGtNyy8wS4+VDgpWPn5E8v9JoFO9Uhh1Jl3Hyiv8A7B9lD8trC7ygGCSnPk86GXSCmk0gGPI6naPCt74MQNlFME/TkFa9R2e6AzF/IXb6rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DAF9106F;
	Thu,  9 May 2024 16:44:37 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A37D93F6A8;
	Thu,  9 May 2024 16:44:10 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jaehoon Chung <jh80.chung@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH 0/2] power: regulator: add AXP717 support
Date: Fri, 10 May 2024 00:43:17 +0100
Message-Id: <20240509234319.13104-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP717 is a PMIC chip, controlled via I2C or RSB. It
features four DC/DC converters and a number of linear regulators.
Also it contains some charger and USB-C detection circuitry, though we
don't use that in U-Boot. The PMIC is used on some newer Allwinner
devices, for instance the Anbernic handheld gaming devices.

Add AXP717 support to the DM driven AXP regulator driver, and also an SPL
version, as we need to program the DRAM voltage rail correctly before
attempting to initialise the DRAM controller.

Cheers,
Ander

Andre Przywara (2):
  power: pmic: sunxi: add AXP717 SPL driver
  power: regulator: add AXP717 support

 arch/arm/mach-sunxi/pmic_bus.c          |  3 +
 board/sunxi/board.c                     |  2 +-
 drivers/power/Kconfig                   | 17 +++--
 drivers/power/Makefile                  |  1 +
 drivers/power/axp717.c                  | 92 +++++++++++++++++++++++++
 drivers/power/pmic/axp.c                |  1 +
 drivers/power/regulator/axp_regulator.c | 28 ++++++++
 include/axp_pmic.h                      |  1 +
 8 files changed, 140 insertions(+), 5 deletions(-)
 create mode 100644 drivers/power/axp717.c

-- 
2.35.8

