Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0D14C5BF
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714149915; cv=none; b=TwEswSFT/hfA0tH2ImhD48aC3067eykDMeRTCstTLOj4Be+zOjdjA0BkAnq1Jz+KmMGOlkYKWKUStwIXPtUNMS7A3vRhmDmo0aH7iKbhrcv+tV1N0Dwk+h6SHn3MZQIpmRufY6p7ik7xX3FBEjnL4UM8Y6yjlOZ4m4zMhdUsIFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714149915; c=relaxed/simple;
	bh=q3knr22XA0+Xe2SWehIKNziVaC8/xBBweCwa0fTGsic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JfkZNT0aXRSJmAXf1svVohNMnbI6VB8oSYJpV99tskikvobsODf3RchBmOVkoa9WvKw2lB1HgpkvCd4qrao1+s9NQLwhtUtMIzaj5oXfACwT4yEcfHKxiUmWXfx2BQcvB49Nxgyjzcv0/lxoC3D9eS83KIbTi2yN9O3QpQLHRAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTVHnaxY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTVHnaxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A7DC113CD;
	Fri, 26 Apr 2024 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714149914;
	bh=q3knr22XA0+Xe2SWehIKNziVaC8/xBBweCwa0fTGsic=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=nTVHnaxYIghZ0Zja9qAu8sJuofIA7bwRSoADJUi5AHF3y0xebeysrvswcCIGmpKHE
	 UvU4lPgefLgrXSe03kMSfIk67VBWzbie2UdDrKId108iPdAv+UJQ1nd5MJrgAQv7RS
	 Z4JWUov+33zcUvWzK4/WISKq7d1nzRRH6NGcGWumbBYAWypobWol5AdSQfBjwj18y9
	 /z7KzgN3SCML9iSsvev8E3VgZtExeOCDTmDMeKP+9AfzY9ES6RTsxS+9XBtPoXr75N
	 pFBeJPyctS4+fkPCIxCJVnqMvIhuAYlaBX9i4jjyzhK2HavqQX/wIrPBVlhtFnKb9E
	 p5tG+jsVOerlA==
Date: Fri, 26 Apr 2024 18:45:10 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.10
Message-ID: <20240426164510.GA101219@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following device tree changes for 6.10.

Best regards,
Jernej

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.10-1

for you to fetch changes up to fd46e5e136a83f61c1746d5a08686c0c4f4c0706:

  arm64: dts: allwinner: h616: Add NMI device node (2024-04-26 17:50:16 +0200)

----------------------------------------------------------------
- added multicolor LED node for pinephone
- marked pinephone LEDs to retain status in suspend
- DT cleanups & fixes
- fixed A64 GPU frequency at 432 MHz
- added H616 NMI node
- new boards: PocketBook 614 Plus, Tanix TX1

----------------------------------------------------------------
Andre Przywara (3):
      arm64: dts: allwinner: h616: Fix I2C0 pins
      dt-bindings: arm: sunxi: document Tanix TX1 name
      arm64: dts: allwinner: Add Tanix TX1 support

Aren Moynihan (1):
      arm64: dts: allwinner: pinephone: add multicolor LED node

Chris Morgan (1):
      arm64: dts: allwinner: h616: Add NMI device node

Denis Burkov (2):
      dt-bindings: arm: sunxi: Add PocketBook 614 Plus
      ARM: dts: sun5i: Add PocketBook 614 Plus support

Frank Oltmanns (1):
      arm64: dts: allwinner: a64: Run GPU at 432 MHz

Krzysztof Kozlowski (4):
      arm64: dts: allwinner: Pine H64: correctly remove reg_gmac_3v3
      arm64: dts: allwinner: drop underscore in node names
      arm64: dts: allwinner: Orange Pi: delete node by phandle
      arm: dts: allwinner: drop underscore in node names

Miles Alan (1):
      arm64: dts: allwinner: pinephone: Retain LEDs state in suspend

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  10 +
 arch/arm/boot/dts/allwinner/Makefile               |   1 +
 .../allwinner/sun5i-a13-pocketbook-614-plus.dts    | 218 +++++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun5i-a13.dtsi         |   4 +-
 arch/arm/boot/dts/allwinner/sun5i-gr8-chip-pro.dts |   2 +-
 arch/arm/boot/dts/allwinner/sun5i-r8-chip.dts      |   2 +-
 .../boot/dts/allwinner/sun6i-a31-hummingbird.dts   |   4 +-
 arch/arm/boot/dts/allwinner/sun6i-a31.dtsi         |  16 +-
 .../dts/allwinner/sun6i-a31s-sinovoip-bpi-m2.dts   |   2 +-
 .../dts/allwinner/sun7i-a20-bananapi-m1-plus.dts   |   2 +-
 .../boot/dts/allwinner/sun7i-a20-cubietruck.dts    |   2 +-
 .../boot/dts/allwinner/sun7i-a20-hummingbird.dts   |   4 +-
 .../allwinner/sun7i-a20-olimex-som-evb-emmc.dts    |   2 +-
 .../allwinner/sun7i-a20-olimex-som204-evb-emmc.dts |   2 +-
 .../dts/allwinner/sun7i-a20-olimex-som204-evb.dts  |   4 +-
 .../dts/allwinner/sun7i-a20-olinuxino-lime2.dts    |   2 +-
 .../dts/allwinner/sun7i-a20-wits-pro-a20-dkt.dts   |   2 +-
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi         |   4 +-
 arch/arm/boot/dts/allwinner/sun8i-a23-a33.dtsi     |  14 +-
 .../allwinner/sun8i-a23-polaroid-mid2407pxe03.dts  |   4 +-
 .../allwinner/sun8i-a23-polaroid-mid2809pxe04.dts  |   4 +-
 .../boot/dts/allwinner/sun8i-a33-ga10h-v1.1.dts    |   2 +-
 .../dts/allwinner/sun8i-a33-inet-d978-rev2.dts     |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-a33.dtsi         |  10 +-
 .../boot/dts/allwinner/sun8i-a83t-bananapi-m3.dts  |   2 +-
 .../dts/allwinner/sun8i-a83t-cubietruck-plus.dts   |   2 +-
 .../arm/boot/dts/allwinner/sun8i-a83t-tbs-a711.dts |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi        |   8 +-
 .../allwinner/sun8i-h2-plus-bananapi-m2-zero.dts   |   2 +-
 .../dts/allwinner/sun8i-h2-plus-orangepi-r1.dts    |   5 +-
 .../dts/allwinner/sun8i-h2-plus-orangepi-zero.dts  |   6 +-
 .../arm/boot/dts/allwinner/sun8i-h3-beelink-x2.dts |   4 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts    |   4 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-m1-plus.dts |   4 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-r1.dts |   2 +-
 .../arm/boot/dts/allwinner/sun8i-h3-orangepi-2.dts |   4 +-
 .../boot/dts/allwinner/sun8i-h3-orangepi-lite.dts  |   2 +-
 .../dts/allwinner/sun8i-h3-orangepi-pc-plus.dts    |   2 +-
 .../dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi   |   4 +-
 .../boot/dts/allwinner/sun8i-r16-bananapi-m2m.dts  |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-r16-parrot.dts   |   2 +-
 .../dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts  |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40-oka40i-c.dts |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-s3-pinecube.dts  |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         |   4 +-
 .../dts/allwinner/sun8i-v40-bananapi-m2-berry.dts  |   2 +-
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi         |   4 +-
 .../boot/dts/allwinner/sunxi-bananapi-m2-plus.dtsi |   2 +-
 .../dts/allwinner/sunxi-h3-h5-emlid-neutis.dtsi    |   2 +-
 arch/arm/boot/dts/allwinner/sunxi-h3-h5.dtsi       |   4 +-
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts |   2 +-
 .../boot/dts/allwinner/sun50i-a64-nanopi-a64.dts   |   2 +-
 .../boot/dts/allwinner/sun50i-a64-olinuxino.dts    |   2 +-
 .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts |   2 +-
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |   2 +-
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |  16 +-
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts      |   2 +-
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  18 +-
 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts   | 183 +++++++++++++++++
 .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   |   2 +-
 .../boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts |   4 +-
 .../dts/allwinner/sun50i-h5-orangepi-prime.dts     |   2 +-
 .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts |   2 +-
 .../allwinner/sun50i-h5-orangepi-zero-plus2.dts    |   2 +-
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |   2 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |   2 +-
 .../dts/allwinner/sun50i-h6-orangepi-lite2.dts     |   2 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi     |   2 +-
 .../dts/allwinner/sun50i-h6-pine-h64-model-b.dts   |   6 +-
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  11 +-
 .../allwinner/sun50i-h618-transpeed-8k618-t.dts    |   2 +-
 .../dts/allwinner/sun50i-h64-remix-mini-pc.dts     |   2 +-
 78 files changed, 553 insertions(+), 128 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-614-plus.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
