Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAECF14F11B
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713802976; cv=none; b=vGFfDo+Ei46r6xz/uN6EugwOoPowPmtlumlUsVM04Vp1w7FK8UmS5JrsrBYa68PJafgUwtsQHEzVV0rLnnKkA+NN9NrWVngk69OVLFwbVj7eY1+BCjR/HRysvb2amJjBfgq6nTtmx42NUx3KaErjO2SfMyRBbgjVMUpXRWmXWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713802976; c=relaxed/simple;
	bh=9LNX/GVg3mprqLQ3yhPce8FwkD+Nk/O9bMgdFPKders=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PNUZLEY7giRhPGAo/i12hHw8I8DF/LY/6mFivc4aytgr7wW/Q/S4U+sEr2QzavVCkiH5asbARj/XPqIaSEzloAgrlMdxI7sWe0EOAmhCo8dw+D3Bw4H9Hsh3cNjUozX6so5yNBFeMb483qhovHWy82wl9C88uk+KuVIurapoyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61D12339;
	Mon, 22 Apr 2024 09:23:22 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4A83F7BD;
	Mon, 22 Apr 2024 09:22:53 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Maksim Kiselev <bigunclemax@gmail.com>
Subject: Pull request: u-boot-sunxi/master for v2024.07
Date: Mon, 22 Apr 2024 17:22:49 +0100
Message-Id: <20240422162249.2479071-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

as per the usual late ;-) please pull the sunxi/master branch, containing
some 2024.07 changes for Allwinner. Not many and nothing really exciting
this time: there are more patches in fly, but they are not ready yet.
I will also send some DT updates and new board defconfig files later, once
they have seen the list. I am aware of the USB rebasing repo efforts,
but would like to see how this plays out, also we have one compatibility
issue that I painstakingly work around in the U-Boot tree for the last three
years or so. So for now I stick to the previous approach.

So now just some easy changes: support for USB peripheral mode on the
Allwinner F1C100s, T113-s3 SPI boot support, and some SPL cleanup patches.

The branch passed the gitlab CI run, and brief boot testing on some boards
didn't turn up any issues.

Please pull!

Cheers,
Andre

==================
The following changes since commit c08685289171e68afd4bae2eb2e279cdc49a407d:

  Merge tag 'u-boot-imx-master-20240420' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx (2024-04-20 15:16:17 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 192c5c9e51c1ef100c3d027d253ffad26ff75a68:

  sunxi: sun9i: make more clock functions SPL only (2024-04-22 01:12:26 +0100)

----------------------------------------------------------------
Andre Przywara (9):
      usb: musb-new: add Allwinner F1C100s support
      sunxi: move #ifdef guards around tzpc_init() to header file
      sunxi: remove unneeded i2c_init_board() call for U-Boot proper
      sunxi: compile clock.c for SPL only
      sunxi: sun4i: make more clock functions SPL only
      sunxi: sun6i: make more clock functions SPL only
      sunxi: sun50i_h6: make more clock functions SPL only
      sunxi: sun8i_a83t: make more clock functions SPL only
      sunxi: sun9i: make more clock functions SPL only

Maksim Kiselev (1):
      sunxi: SPL SPI: Add SPI boot support for the Allwinner R528/T113 SoCs

 arch/arm/include/asm/arch-sunxi/clock_sun9i.h |  3 -
 arch/arm/include/asm/arch-sunxi/tzpc.h        |  6 ++
 arch/arm/mach-sunxi/Kconfig                   |  2 +-
 arch/arm/mach-sunxi/Makefile                  |  2 +-
 arch/arm/mach-sunxi/board.c                   |  2 -
 arch/arm/mach-sunxi/clock.c                   |  2 -
 arch/arm/mach-sunxi/clock_sun4i.c             |  5 +-
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 57 ++++++++--------
 arch/arm/mach-sunxi/clock_sun6i.c             |  3 +-
 arch/arm/mach-sunxi/clock_sun8i_a83t.c        |  5 +-
 arch/arm/mach-sunxi/clock_sun9i.c             | 97 +++++++++++++--------------
 arch/arm/mach-sunxi/spl_spi_sunxi.c           | 78 +++++++++++++++------
 board/sunxi/board.c                           |  9 +--
 drivers/usb/musb-new/sunxi.c                  | 16 +++++
 14 files changed, 163 insertions(+), 124 deletions(-)

