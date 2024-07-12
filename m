Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A05117625F
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Jul 2024 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720803241; cv=none; b=JI8Atp5dDp9fEy6x0/wmBzGC97OoFA18Z190ygYFkxhQ1Ratorc/BIAkEfW2hyHe1003ydSw4vKgeAUVpWbjq838FBZpMr1P0p3zcs9wQIZIeUGlcUqbLuvhtvZnGwqKMUSw/Tashdyvvv39RLdn0k5aFJ5U4SJTIkCb8n9untg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720803241; c=relaxed/simple;
	bh=YHRCJTVPsihKnjnceWhYVQRzV9MAYGwuzDa7YYleXM8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YWcnWQtD6v5Mxa8zxXcX+jy4WYlpzQmn52P1CX78lzAL7xogI78a2//jibroiSph4re8QYTX4rVndvlrDWh2fh+ttHyFZ1pV6hlsWtwWTSDXnpaKmCaiUImA44bU+nlVOthpLj01dEl0vbUjck7DHAoz6Hf8Z4PBZ95To3+VnII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BF2E1007;
	Fri, 12 Jul 2024 09:54:23 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7A3F3F766;
	Fri, 12 Jul 2024 09:53:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/6] power: pmic: sunxi: consolidate AXP SPL drivers
Date: Fri, 12 Jul 2024 17:53:46 +0100
Message-Id: <20240712165352.3767166-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

v2 of this series merges the AXP717 support patches in, as they didn't
make it into the tree yet. As there is little point in creating a
separate AXP717 SPL driver file, just to delete it again two patches
later, this series skips the separate file altogether. I put in the
related AXP717 U-Boot proper driver here. The code itself is mostly
unchanged from v1, it's just a rebase and re-arrangement of the patches.

=========================
This is the first series in an attempt to clean up the X-Powers AXP PMIC
drivers used by the SPL for sunxi boards. So far we have a separate
driver file for each AXP variant, but the code was largely the same,
just differing by the regulator ranges.

This adds a new generic driver, which reads the regulator description
from an array of structs. This is similar to how the DM AXP driver used
for U-Boot proper works, but is simplified, since we won't need the full
feature set for the SPL, and we want to keep the code size small.

To help bisect-ability, and to simplify review, each of the simpler AXP
drivers covered by this approach is handled in a separate patch.

We just add the AXP717 support first, then convert over the AXP313 and
AXP305.
The other AXP SPL drivers are more complex, and support more regulators,
but my hunch is that we really just need the DC/DC converters in the
SPL. However I need to prove and test this, so I will convert the other
AXP chips later.

Please have a look and comment whether the approach in general is a good
idea.

Cheers,
Andre

Changelog v1 .. v2:
- rebase against latest master
- merge originally separate AXP717 SPL driver into patch 4/6
- include AXP717 U-Boot proper support patch
- drop AXP707 support for now

Andre Przywara (6):
  power: regulator: add AXP717 support
  power: pmic: sunxi: only build AXP drivers for SPL
  power: pmic: sunxi: introduce generic SPL AXP DC/DC driver
  power: pmic: sunxi: add AXP717 SPL support
  power: pmic: sunxi: use generic AXP SPL driver for AXP313
  power: pmic: sunxi: use generic AXP SPL driver for AXP305

 arch/arm/mach-sunxi/pmic_bus.c          |   3 +
 board/sunxi/board.c                     |   2 +-
 drivers/power/Kconfig                   |  17 ++-
 drivers/power/Makefile                  |   7 +-
 drivers/power/axp305.c                  |  82 -----------
 drivers/power/axp313.c                  | 133 ------------------
 drivers/power/axp_spl.c                 | 173 ++++++++++++++++++++++++
 drivers/power/pmic/axp.c                |   1 +
 drivers/power/regulator/axp_regulator.c |  28 ++++
 include/axp_pmic.h                      |   1 +
 10 files changed, 225 insertions(+), 222 deletions(-)
 delete mode 100644 drivers/power/axp305.c
 delete mode 100644 drivers/power/axp313.c
 create mode 100644 drivers/power/axp_spl.c

-- 
2.25.1

