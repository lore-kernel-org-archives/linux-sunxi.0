Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46CC405C21
	for <linux-sunxi@lists.linux.dev>; Fri, 15 May 2026 23:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888814; cv=none; b=V6c7tNLB6L4/HKMHr7Dfn99QJ8seVbqsofzjbSznWUBVWKWftyBtSVXLv7n6WdU/qnYn40lNv98p1s/3ApJagdGEUGwlj97PAS+qNVy8jkIM3gIjv9M0uAD/MhDnssrJccmnNo9lN+qUEkGOJ+QJVdwMJXMwF8yBxC9gC9p0lK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888814; c=relaxed/simple;
	bh=L7I0yEnYamMLFcfbXu88XCxYp9zDs5qhnpfq4ykAZwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcbjCId+URo/A+KFdbbdlh79mYNvTRNyMU6VA0xlpn6GIsOCPwE1VD/zhJraw4UuB6SPNOaZxe0RvxM3b8wHEbmf4FBHh/ZKAdtswNHWkvQ8OQEPgIbK3A/8F/zhjpqhkYijmpdtACKL+z/r45cn0HTpbdC8lgAisY/TW/L13Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Iuba++lm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Iuba++lm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BF1E35ED;
	Fri, 15 May 2026 16:46:47 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2287A3F85F;
	Fri, 15 May 2026 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778888812; bh=L7I0yEnYamMLFcfbXu88XCxYp9zDs5qhnpfq4ykAZwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iuba++lm5jB5/N7ZOV3Q4ANuKne5ZevKBDmN/nPGd8FX7cg7seqtLwUdLlPljL6wu
	 Ss0JMM2D5d9IlDBroVGlNIKqtD/5Vtbe8i7q1lqcL2pHV/umSEcDV/h/4IJQIKoAW5
	 dql57RP8gFqwwvIKFMD92Qv4SqYstLG1hfi6ODAo=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 4/5] sunxi: configs: Radxa Cubie A5E: enable SPI
Date: Sat, 16 May 2026 01:46:00 +0200
Message-ID: <20260515234601.15431-5-andre.przywara@arm.com>
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

The Radxa Cubie A5E ships with SPI NOR flash, so enable the SPI and
flash drivers, also the SPL version, for SPI booting.

Sync the defconfig file with the version from savedefconfig on the way.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 configs/radxa-cubie-a5e_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/radxa-cubie-a5e_defconfig b/configs/radxa-cubie-a5e_defconfig
index 84bc4e3d4a9..2a66d0e0866 100644
--- a/configs/radxa-cubie-a5e_defconfig
+++ b/configs/radxa-cubie-a5e_defconfig
@@ -15,6 +15,7 @@ CONFIG_DRAM_SUNXI_TPR12=0x3533302f
 CONFIG_MACH_SUN55I_A523=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SPI_SUNXI=y
 CONFIG_SPL_SUNXI_LED_STATUS=y
 CONFIG_SPL_SUNXI_LED_STATUS_GPIO=356
 # CONFIG_SPL_SUNXI_LED_STATUS_ACTIVE_HIGH is not set
@@ -25,11 +26,14 @@ CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
 CONFIG_SUPPORT_EMMC_BOOT=y
-CONFIG_PHY_REALTEK=y
+CONFIG_MTD=y
+CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
+CONFIG_PHY_REALTEK=y
 CONFIG_REGULATOR_AXP=y
 CONFIG_AXP717_POWER=y
 CONFIG_AXP_DCDC2_VOLT=920
 CONFIG_AXP_DCDC3_VOLT=1100
+CONFIG_SPI=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.46.4

