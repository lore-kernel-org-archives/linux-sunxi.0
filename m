Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBA9405C21
	for <linux-sunxi@lists.linux.dev>; Fri, 15 May 2026 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888808; cv=none; b=XKylp5KhbDKcgObSjYg1XOnEIdxz5b/imX3yc/10nLcT6q3zmaBk0iJja6v3I+HZ5FpG20gF0s0gBtgGlBSVBsLqkWPnAPwBBjc4xc3LFuu4WQRTYavtD0HBegicf2XcUFhYoGdZyd8ZAaMmFdzXTYEIEcHFPdEEWv5nOk5Xw/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888808; c=relaxed/simple;
	bh=qJbLNzWPCdwHxNtUXqJJijh/yvowUElVKsBjBMpe18w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYhvvCZ5b9X9NkdSisn+ra6/rsIvle3b0xQNF3LYNH40fQjNX9hlzh/Lur0aJIjRfzArEtRw5ETsV6mKIeoWVq9SbZH/6XFU307pWW4r2UIDObOH+anYjpwduciqk0KZXN9txDCbtgbizam5QRZPUJGObu/K1CDELpRbBSWSJUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EoXtz3sE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EoXtz3sE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA15135EA;
	Fri, 15 May 2026 16:46:40 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90CEB3F85F;
	Fri, 15 May 2026 16:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778888805; bh=qJbLNzWPCdwHxNtUXqJJijh/yvowUElVKsBjBMpe18w=;
	h=From:To:Cc:Subject:Date:From;
	b=EoXtz3sE4+wtYReNGBvYo3lRbYzr+slZNi7LZIgxnfAYUOiStojCP2gQNoE/JrF2y
	 NXBtLq3R7HAkDAaD1t8b85IXV56BmRrt+KPj8LL1cBQBKd8HumLH6gOxqeg5WGe2z2
	 xyP4rsRV0JbwUnh9GMzrh9nCAinSehqM77Y1/GpA=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/5] sunxi: A523: Add SPI support
Date: Sat, 16 May 2026 01:45:56 +0200
Message-ID: <20260515234601.15431-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Version 2 of this SPI support series just fixes the pinmux refactoring to
sort the sun5i generation correctly, plus adding the tags thanks to the
diligent review from Jernej, many thanks for that!

======================
This series adds SPI support to the A523 family of SoCs. The SPI
controller is very similar to the previous generation, to a degree where
we don't need actual code changes, but just to add the new DT compatible
string to the driver (patch 1/5).
Patch 3/5 adds support for SPL SPI booting, again no real driver changes,
just adding the required pinmux settings for the A523. To make this
easier, patch 2/5 reworks the SPI pinmux setting. That doesn't look as
pretty as I hoped for, but is still better than what we have now.
The last two patches enable SPI and SPI booting on two boards with NOR
flash. 

I could successfully boot U-Boot from SPI on the Radxa A5E with that.
The OrangePi 4A also has a NOR SPI, but I couldn't test this, as I don't
have that board.

Please have a look and test!

Cheers,
Andre

Changelog v1 .. v2:
- fix sun5i pinmux assignment
- add Reviewed-by: tags

Andre Przywara (5):
  spi: sunxi: add support for A523 SPI controller
  sunxi: spl: spi: Clean up SPI0 pinmux setting
  sunxi: spl: spi: Add support for Allwinner A523
  sunxi: configs: Radxa Cubie A5E: enable SPI
  sunxi: configs: OrangePi 4A: enable SPI

 arch/arm/mach-sunxi/spl_spi_sunxi.c | 48 +++++++++++++----------------
 configs/orangepi_4a_defconfig       |  4 +++
 configs/radxa-cubie-a5e_defconfig   |  6 +++-
 drivers/spi/spi-sunxi.c             |  4 +++
 4 files changed, 35 insertions(+), 27 deletions(-)

-- 
2.46.4

