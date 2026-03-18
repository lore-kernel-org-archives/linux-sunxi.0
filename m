Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DBE3D3CE2
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835032; cv=none; b=JBdfmIBq2VTV7jVDNuy1g9Y/Fd8HpcSIH2s8xyRQK5CKWDwcPWiyTo1vrFIRensWdEALYmEdVvLOSc+tq7vz4HVLaTJIAKak/KNWlo60aQhUbB2oZSv7Ot5nJhcw9on3K9DyHdEVd/MHsP36o6TmTbjy9WGJHqohp5GSS38hck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835032; c=relaxed/simple;
	bh=ZTheSby4LG8z5lzMcJH/iJNMRx/Kt4YpN0V7url0T54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJN6C90ExxLlWeXxE3jpzSn+E4p0Rr9eo5TeP1A3g7rHBUyRsacHNF+o3mT32YPMxNCVxcv6hL2eKjvV60iwH2xbHUR2yxbrv6HoHEJ0KEuMvhynsw3HAERjGWSOixzKE+c8i8ttRofADV2/t1jWqzhLp+vux2vIYUfoWjAWnak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92D571E2F;
	Wed, 18 Mar 2026 04:57:04 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A16A3F73B;
	Wed, 18 Mar 2026 04:57:08 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <contact@paulk.fr>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Pull request: u-boot-sunxi/master for next
Date: Wed, 18 Mar 2026 12:57:02 +0100
Message-ID: <20260318115702.1637000-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these sunxi changes into next:
For once, replacing the legacy LED API with a more lean alternative,
just for sunxi's SPL. IIUC, this would be one step closer to dropping
this deprecated subsystem altogether.
Also adding two DRAM cleanups for the A133 SoC. There is a third patch
which requires some changes, will care about that later.

Gitlab CI passed, and I booted that briefly on an A133 board and some
board with a GPIO controlled power LED.

Thanks,
Andre

===========================================================
The following changes since commit a27980786cfb3c430aa1c05da8e79180c584d221:

  kbuild: strip sub_make_done from test-script environment (2026-03-16 10:41:40 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git sunxi/master

for you to fetch changes up to 98429b7be6f45d393cc905b2cf9844eed7b09b8a:

  sunxi: a133: dram: Align parameters terminology with Allwinner (2026-03-17 23:27:24 +0100)

----------------------------------------------------------------
Paul Kocialkowski (2):
      sunxi: a133: dram: Fix PHY dx delays offsets and add dmb
      sunxi: a133: dram: Align parameters terminology with Allwinner

Quentin Schulz (1):
      sunxi: remove usage of legacy LED API

 arch/arm/include/asm/arch-sunxi/dram_sun50i_a133.h |  2 +
 arch/arm/mach-sunxi/Kconfig                        | 25 ++++++++
 arch/arm/mach-sunxi/dram_sun50i_a133.c             | 67 ++++++++++++++--------
 board/sunxi/board.c                                | 16 ++++--
 configs/liontron-h-a133l_defconfig                 |  6 +-
 configs/pinephone_defconfig                        |  9 +--
 6 files changed, 89 insertions(+), 36 deletions(-)
