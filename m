Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6830F3BF66C
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Apr 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454922; cv=none; b=YzpEo6mR9yER55AOQ7lLt+/ePu3EAxNRz/o8VxQGR64dC2v41qVpHMvyrRnjUFWfUf04a+Id5RbL62g9OzeGjU9OSgR9RbHk6+zQ9yLwy+wsch00+pE1TWyEmM4quD8xywm6FFPjqWHf6zuvYN8k6NAuzAOEtgGwcs13+U244OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454922; c=relaxed/simple;
	bh=tie7LX03b0IXQXIfDtb71w6E+rOXUfln3CGLoQswnZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egmSfOZbirNs7JijRCDpDJIY+YfMFOq9r/wsYgFSyCZ2L2GjXxc0LWXXlTz+NlWwlCNi977RhBkcNqCBT7HvgX2cCvQeA+tJeiab+rml+DNlJvTKZiNbX2AcAsR7Y7QUbR4NAVoWnCNSFN5tyrXXapWB1nrjBysu5snIYOS5J00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=j51wMHaa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="j51wMHaa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B8C82574;
	Wed, 29 Apr 2026 02:28:32 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D2FE3F62B;
	Wed, 29 Apr 2026 02:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777454917; bh=tie7LX03b0IXQXIfDtb71w6E+rOXUfln3CGLoQswnZg=;
	h=From:To:Cc:Subject:Date:From;
	b=j51wMHaamggCCa0zEPG+u3SKS6mkylUPITWdJlLbRQ8Q+Z8A44388Bf7g3Gk76Vr/
	 Gqg8HsaDlsDqt08nWQGIRJhE0kKnZ9EPCB5ihsQ8wGCdBcXpBo1M5TMZbvnufVjX3q
	 E2FdxPBBxDG/vRedSxkZ5EV98W+pFbKadvg70pWM=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] Funxi: Fix and extend SPL power LED support
Date: Wed, 29 Apr 2026 11:28:25 +0200
Message-ID: <20260429092828.3076719-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

just an update after some discussion on the list (thanks to Paul and
Quentin for having a look!), changing the naming of the Kconfig symbols,
since their meaning wasn't clear. Changelog below.

================
With the demise of the legacy SPL LED framework a new, much simpler
version emerged for Allwinner SoCs: Just define the GPIO number in
Kconfig, and some simple code turns the LED on very early.

I was looking at using this feature for boards with a GPIO controlled
power LED, as having a sign of life very early can be very handy.
So I grep'ed all DTs for those LEDs, and added the respective symbols to
the board's defconfig file.
Doing so revealed a small bug in the code when using active low LEDs,
so patch 1/3 fixes this.
Patch 2/3 adds the power LEDs to 32-bit boards, patch 3/3 to 64-bit
boards - just some arbitrary splitup to simplify review.

Please have a look and test if you have any of the boards.

Cheers,
Andre

Changelog v1 ... v2:
- rename Kconfig symbols to better match their meaning
- default to ACTIVE_HIGH=y

Andre Przywara (3):
  sunxi: spl: fix SPL_SUNXI_LED active low configuration
  sunxi: configs: enable power LEDs on 32-bit boards
  sunxi: configs: enable power LEDs on 64-bit boards

 arch/arm/mach-sunxi/Kconfig              | 10 ++++++----
 board/sunxi/board.c                      |  4 ++--
 configs/A13-OLinuXinoM_defconfig         |  2 ++
 configs/Bananapi_M2_Ultra_defconfig      |  2 ++
 configs/Bananapi_m2m_defconfig           |  3 +++
 configs/Mele_A1000G_quad_defconfig       |  2 ++
 configs/Mele_A1000_defconfig             |  2 ++
 configs/Mele_M9_defconfig                |  2 ++
 configs/anbernic_rg35xx_h700_defconfig   |  2 ++
 configs/bananapi_m1_plus_defconfig       |  2 ++
 configs/bananapi_m2_berry_defconfig      |  2 ++
 configs/bananapi_m2_zero_defconfig       |  3 +++
 configs/bananapi_m64_defconfig           |  2 ++
 configs/beelink_gs1_defconfig            |  2 ++
 configs/beelink_x2_defconfig             |  2 ++
 configs/icnova-a20-adb4006_defconfig     |  2 ++
 configs/liontron-h-a133l_defconfig       |  3 +++
 configs/nanopi_duo2_defconfig            |  2 ++
 configs/nanopi_neo2_defconfig            |  2 ++
 configs/nanopi_neo_air_defconfig         |  2 ++
 configs/nanopi_neo_plus2_defconfig       |  2 ++
 configs/orangepi_2_defconfig             |  2 ++
 configs/orangepi_3_defconfig             |  2 ++
 configs/orangepi_lite2_defconfig         |  2 ++
 configs/orangepi_lite_defconfig          |  2 ++
 configs/orangepi_one_defconfig           |  2 ++
 configs/orangepi_pc2_defconfig           |  2 ++
 configs/orangepi_pc_defconfig            |  2 ++
 configs/orangepi_prime_defconfig         |  2 ++
 configs/orangepi_zero2_defconfig         |  2 ++
 configs/orangepi_zero_defconfig          |  2 ++
 configs/orangepi_zero_plus2_defconfig    |  2 ++
 configs/orangepi_zero_plus2_h3_defconfig |  2 ++
 configs/orangepi_zero_plus_defconfig     |  2 ++
 configs/pinephone_defconfig              |  3 +--
 configs/radxa-cubie-a5e_defconfig        |  3 +++
 configs/tanix_tx1_defconfig              |  2 ++
 37 files changed, 81 insertions(+), 8 deletions(-)

-- 
2.43.0

