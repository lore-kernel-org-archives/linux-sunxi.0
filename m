Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDBB6ABC
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Feb 2022 22:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF71C340E9;
	Thu, 24 Feb 2022 22:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645743148;
	bh=jFjzAyDU9RAqkrJmgIBbhHnbo0nB32DlkIyW/1JqGxQ=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=lnZddMNLpkU9UeDmJ0ZUbF8PNsPQZLLLx+fgn3ZOe9DrNSGmyTmI0Oj6aOXCS1+aS
	 QRMlMACgbvRsl88duAg4auKqBoxCO+mzrVTjQ822DthgdMJ76XVRGezN3myqwXk5s3
	 EDusgAPGNQrBljrdM5ZWUdBLKlUFSBpZoGtYCHeJbL/Na7pivKMnAP9d4YHBoPGq/v
	 jXwModwqb0qySiVOtL7eP+flXwDj0NCXkOUIZDBlrqh+K5x3Y6aznDx/aXLX1uzqJo
	 XFn1K03+JcuCbmIrB6luuQndd8GTIpK6NrE3K62ra5HKcwGfst4/4Y4tWoAr75HuBq
	 Y9xzM0KmHlXyA==
Date: Thu, 24 Feb 2022 23:52:23 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, wens@csie.org, jernej@kernel.org,
	samuel@sholland.org
Subject: [GIT PULL] Allwinner DT changes for 5.18
Message-ID: <YhgMJ0AqaHopzaW3@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

Please pull following changes for next release.

Best regards,
Jernej

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-5.18-1

for you to fetch changes up to ebdfc289a348fbc7fbc87c37b0cc156f78cc5f57:

  MAINTAINERS: Update Allwinner SoCs maintainers (2022-02-24 19:27:23 +0100)

----------------------------------------------------------------
Usual round of DT patches for the 5.18 merge window, with:
- DT fixes
- ethernet0 alias for Nanopi NEO
- r_uart node for H3/H5
- eMMC and bluetooth nodes for Nanopi NEO air
- updated maintainers for Allwinner SoCs
- new board: A20-Marsboard

----------------------------------------------------------------
Baltazár Radics (1):
      ARM: dts: sun8i: Add ethernet0 alias in Nanopi NEO's device tree

Conley Lee (2):
      ARM: dts: sun7i: Add A20-Marsboard
      dt-bindings: arm: sunxi: add haoyu,a20-marsboard

Jernej Skrabec (1):
      MAINTAINERS: Update Allwinner SoCs maintainers

Mans Rullgard (1):
      ARM: dts: sunxi: h3/h5: add r_uart node

Mikhail Rudenko (1):
      ARM: dts: nanopi-neo-air: Add eMMC and bluetooth

Paul Kocialkowski (1):
      ARM: dts: sun8i: v3s: Move the csi1 block to follow address order

Rob Herring (1):
      ARM: dts: sun8i-h3: Drop args in 'thermal-sensors'

 Documentation/devicetree/bindings/arm/sunxi.yaml |   5 +
 MAINTAINERS                                      |   4 +-
 arch/arm/boot/dts/Makefile                       |   1 +
 arch/arm/boot/dts/sun7i-a20-haoyu-marsboard.dts  | 182 +++++++++++++++++++++++
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts    |  28 ++++
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts        |   4 +
 arch/arm/boot/dts/sun8i-h3.dtsi                  |   2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi                 |  22 +--
 arch/arm/boot/dts/sunxi-h3-h5.dtsi               |  18 +++
 9 files changed, 252 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-haoyu-marsboard.dts
