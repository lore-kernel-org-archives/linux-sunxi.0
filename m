Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FF54D2EEE
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 21:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535483; cv=none; b=pAAGxLcwKSY768xPdfcFfdDUWF7cUicX77YE2wqNL+d1GIq4w+QFz+w2zOwHhx3xgYPB2hFobNCTin+l2q02NvYr+71Us4AtQSq+pI/2o/PEhZV40n7y+5K2q8o/SzgnQRPspsQMexMJzYX5mdxrM/Exxo3/gr7r9ynyZm3RG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535483; c=relaxed/simple;
	bh=T9YIFKJA++lxHku3R0ttvGnSvacEECDQhw4bpBMRqG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYLEjuIXReLnatoMnhYunprryuuKs5GLa0a3QUkD9SHrAGslV0Mw3gx0/dbvDtP/J0K6MBdpbLxEWtlSmsJupdIv5zgxIGavJqpxt+0y25erjHDHP20GQcInbwgHD9QAWBviH+uD3cl1iUYZgSnnp8ebcsiuWmKwV0RQf9Pehc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=n0ePgdS1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="n0ePgdS1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAFC0168F;
	Mon, 11 May 2026 14:37:53 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9213F85F;
	Mon, 11 May 2026 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778535478; bh=T9YIFKJA++lxHku3R0ttvGnSvacEECDQhw4bpBMRqG4=;
	h=From:To:Cc:Subject:Date:From;
	b=n0ePgdS1OR59H+DqKELmcdVIx8rwOrjDFaK/CXacR7D6Tk56s1bd4JovFddpZjx4d
	 +GnfbdyYF42Xew7n7rjvZrkOAsP+erW5a/nhM46beC0GRMn1xqAKAviSrcABo9qcK/
	 tPYSG01Uh+1zd68BiS6OeJNpKGb77j2ACyeIX6i4=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/5] sunxi: A523: Add SPI support
Date: Mon, 11 May 2026 23:37:08 +0200
Message-ID: <20260511213713.15943-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

