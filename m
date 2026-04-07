Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3303859F5
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Apr 2026 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775601302; cv=none; b=bqYrj3Kdkfc9zA5qgkzF90jTsJu0vq7g59SP36arlvq0MwmsjzoBQQtrEO+MqMuhz96B8rZI7zENBEv+jovB7iCrqYxubddOeGemAOL3uav7czLbxp9gPI0zw9BFKwG6/dg2jlVjLlq6oDz3KoYu88hiKnaUcplvVBr+E3qvwrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775601302; c=relaxed/simple;
	bh=o0Yg5z5YRcuGWCMAH6ZXS6k8wuflYcWQ/bsT/nRA9xU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KblOKYbbTQvKBw6MSppKUOM4MLtrqpE2n5ry6MsJsN0dxywxUVdywYKifTF0p3ipmAKMONRet2tiIDUnNPN5tDmcpiQ1d5Zh4PO13Rejq/kgnEHETfISmE9rb9iqXOkRZVx23KDidPQaUFDvH+JhJ8TtcxLRV+eR3zdn8WzKMFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CXLSC6+k; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CXLSC6+k"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD647351C;
	Tue,  7 Apr 2026 15:34:52 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 370C83F632;
	Tue,  7 Apr 2026 15:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775601298; bh=o0Yg5z5YRcuGWCMAH6ZXS6k8wuflYcWQ/bsT/nRA9xU=;
	h=From:To:Cc:Subject:Date:From;
	b=CXLSC6+k++5U4k/y5N8sRYVFk44SPPwmu15Jn2cy6cSu6P0ggeyYkQn2QIIiZgN9o
	 vOqcxJLu/OD9fiMjDfPMMfAaIvGEdU1CC2hhN3gOYiMFW4stHy+AoIaRkVwMK92DEv
	 WLVMnO4Zaby9jELBNyFqG97nWRKOykX6lgcN3zOo=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] sunxi: Fix and extend SPL power LED support
Date: Wed,  8 Apr 2026 00:34:44 +0200
Message-ID: <20260407223447.4956-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Andre Przywara (3):
  sunxi: spl: fix SPL_SUNXI_LED active low configuration
  sunxi: configs: enable power LEDs on 32-bit boards
  sunxi: configs: enable power LEDs on 64-bit boards

 board/sunxi/board.c                      | 2 +-
 configs/A13-OLinuXinoM_defconfig         | 3 +++
 configs/Bananapi_M2_Ultra_defconfig      | 3 +++
 configs/Bananapi_m2m_defconfig           | 3 +++
 configs/Mele_A1000G_quad_defconfig       | 3 +++
 configs/Mele_A1000_defconfig             | 3 +++
 configs/Mele_M9_defconfig                | 3 +++
 configs/anbernic_rg35xx_h700_defconfig   | 3 +++
 configs/bananapi_m1_plus_defconfig       | 3 +++
 configs/bananapi_m2_berry_defconfig      | 3 +++
 configs/bananapi_m2_zero_defconfig       | 3 +++
 configs/bananapi_m64_defconfig           | 3 +++
 configs/beelink_gs1_defconfig            | 3 +++
 configs/beelink_x2_defconfig             | 3 +++
 configs/icnova-a20-adb4006_defconfig     | 3 +++
 configs/liontron-h-a133l_defconfig       | 3 +++
 configs/nanopi_duo2_defconfig            | 3 +++
 configs/nanopi_neo2_defconfig            | 3 +++
 configs/nanopi_neo_air_defconfig         | 3 +++
 configs/nanopi_neo_plus2_defconfig       | 3 +++
 configs/orangepi_2_defconfig             | 3 +++
 configs/orangepi_3_defconfig             | 3 +++
 configs/orangepi_lite2_defconfig         | 3 +++
 configs/orangepi_lite_defconfig          | 3 +++
 configs/orangepi_one_defconfig           | 3 +++
 configs/orangepi_pc2_defconfig           | 3 +++
 configs/orangepi_pc_defconfig            | 3 +++
 configs/orangepi_prime_defconfig         | 3 +++
 configs/orangepi_zero2_defconfig         | 3 +++
 configs/orangepi_zero_defconfig          | 3 +++
 configs/orangepi_zero_plus2_defconfig    | 3 +++
 configs/orangepi_zero_plus2_h3_defconfig | 3 +++
 configs/orangepi_zero_plus_defconfig     | 3 +++
 configs/radxa-cubie-a5e_defconfig        | 3 +++
 configs/tanix_tx1_defconfig              | 3 +++
 35 files changed, 103 insertions(+), 1 deletion(-)

-- 
2.46.4

