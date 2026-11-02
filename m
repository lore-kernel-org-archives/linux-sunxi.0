Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620062;
	b=5BDrSHyRHW0WdEt0y73piufv2YaCb9tSnmLlqWju7LJ+/1sCAsnZfPQBWcDk/TCiR83h
	 ebO2bNAGHokUZWpTtzfaHww79XaOycDNR7/8wT7D8Qo9nFCl0QYdT+6Dv6/OGSooANnDd
	 BqDyeriuxoKfhUTJgZmTsaZAwW4I9qkYppBYavOglexIycjpOU8U6zQdN/3VU+VFDJSl2
	 niw672gX++yokcjHatnE4h/NfoA9bHqcBqjs9cPTfX3fXRcVIpPBkPiFTT5PZoXN5n9v9
	 rM1sZu2tB/8sum1Hz8eXvZdBjvL9Pk/w4RAGnNVSyt8BFcib+B8jIFY2ZxKvqMr4VAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620062;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6jIrwCWfM/73IE1fRx3+JLPaGMWY04PIxkrFEWTBRis=;
	b=HAdEVg2B/h9OLIyT3Z34rjzGko3HOtGsjtJkOu0FJ4w83c5lNFdl76DcMWGUbqreP6+v
	 4sdNY7LTc0ggz5DCf0cXe2kXO/a6O/Bz4Lkcq70uQ9YZaEVTEBc0cVucMRKln38PWCwEv
	 hnA0EufJdoF7dtbtfXKG0y5jmKpmJm3O5YanY8Mwxpz95t2/yudzSSiM1ClV1dOcIbn6n
	 YBElQJ0Gs5RFnu0F3RF/SGDM6cWF1KIoLRerPj6pRu/qH1D+keR3ln4Qg/tVsFHn2hEjm
	 t/zAA/Q19r7TkxEnKl0qjCHAiZRI8wHyw25ftXgjamznyeABMbPKYr/DrWfmW8Nk6sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KAzr1lfx;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB95E606A324
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 11:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB95E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KAzr1lfx
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08AA01FC4;
	Mon,  2 Nov 2026 03:47:38 -0800 (PST)
Received: from e142021.arm.com (unknown [10.57.16.239])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3D9D3F632;
	Mon,  2 Nov 2026 03:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793620061; bh=nR/FSboM1kdNQcftReoViBrMkqqMLHor271rH3y7YwM=;
	h=From:To:Cc:Subject:Date:From;
	b=KAzr1lfxMR/CNdt0wXJrGoJswibAf5vrwYQ0UBN1egnzmbjyMPVR8AEMCpdYYt+mr
	 BL5kqmo4Ywg92DCZbxE3vhmiwkBHFPqbORAF0Sil2dvW2IToynDuzCkBoZypHkkpzv
	 NMw//kdFrAtdCSGyd0k44R/FQdNRMt38GnI3qfrQ=
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.u-boot-project.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Christian Ratzenhofer <christian.ratzenhofer@cdnm.at>
Subject: Pull request: u-boot-sunxi/master for 2027.01
Date: Mon,  2 Nov 2026 12:47:33 +0100
Message-ID: <20261102114733.3468703-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these sunxi changes into main. Please note that's the master
branch on the remote side, the main branch is immutable, so I couldn't
push a fix there again.

Not much to report here, some cleanup for some older V3 SoCs, also a PMIC
fix for some Olimex A20 board.
H6 boards with 3GB of DRAM now work again, and the A133 build process gets
adjusted to the now mainlined TF-A support.

There are bigger changes lined up, but they depend on DT bindings which
have not been merged to the kernel repo yet.

Gitlab CI timed out, but worked fine until then.

Thanks,
Andre
===========================================================
The following changes since commit ee9fc27f2a2a43f253a6fe18d7a6f7c4eb0cda3b:

  cmd: mdio: check argc for extended mode (2026-11-01 13:35:30 -0600)

are available in the Git repository at:

  https://git.u-boot-project.org/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 685b13ba1a3c3bac34761d9f4afbac3b05da9f1d:

  sunxi: Reduce inrush current on Olimex OLinuXino-A20-Lime (2026-11-02 01:38:11 +0100)

----------------------------------------------------------------
Andre Przywara (1):
      sunxi: a133: adjust TF-A load address

Christian Ratzenhofer (1):
      sunxi: Reduce inrush current on Olimex OLinuXino-A20-Lime

Jernej Skrabec (1):
      sunxi: dram: only probe DRAM inside the addressable range

Paul Kocialkowski (3):
      sunxi: disable secure SRAM on sun8i platforms missing it
      power: axp: Add default voltages for V3s/V3/S3
      sunxi: Add support for the Lichee Pi Zero with Dock

 arch/arm/cpu/armv7/Kconfig            | 14 ++++++++------
 arch/arm/mach-sunxi/Kconfig           |  2 +-
 arch/arm/mach-sunxi/dram_dw_helpers.c |  4 +++-
 board/sunxi/MAINTAINERS               |  5 +++++
 configs/A20-OLinuXino-Lime_defconfig  |  2 ++
 configs/Bananapi_M2_Ultra_defconfig   |  1 -
 configs/LicheePi_Zero_Dock_defconfig  |  6 ++++++
 configs/LicheePi_Zero_defconfig       |  1 -
 configs/bananapi_m2_berry_defconfig   |  1 -
 configs/netcube_kumquat_defconfig     |  1 -
 configs/pinecube_defconfig            |  3 ---
 drivers/power/Kconfig                 |  8 ++++++--
 12 files changed, 31 insertions(+), 17 deletions(-)
 create mode 100644 configs/LicheePi_Zero_Dock_defconfig
