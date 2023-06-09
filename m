Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65245408E0
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 21:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364B3C433D2;
	Fri,  9 Jun 2023 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686344696;
	bh=vQ/vYwo1cHkuBXg95nGuvGxoT7yx40Wmpwo7/FiKopM=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Y9CKb9GbLKkhquGM4B+v1RfnbqaQYGha1TSoWUX732gNPWjjUAL+dJzX0/tOg3VK5
	 0i/TB95D/87mKjavm5Z7KFzfGujD5nWYJcMrckVFTz2BjghwBB2AhisTwvQqi5jSAT
	 cq/pMhA/TAitmuI8qSZZ0RSiDPt8TXYdWG9TAccTUwyBNPc73jbvkGVduG0igqSDT4
	 D3R1YkQNqOIC+vxYppgZiyoVCqmbnlcmW/MnN3LEne8x7ECxLJvjOGkxunW3skmeXm
	 3OQyRyj+oTRQ9AYUS91RjygcNyRiZyF5fdnk/NqvkKntvheJuvPmKkt8jryEEtIzm5
	 94z7SHWuKtSiw==
Date: Fri, 9 Jun 2023 23:04:52 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.5
Message-ID: <20230609210452.GA17638@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT changes for 6.5.

Best regards,
Jernej

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.5-1

for you to fetch changes up to 09d199b6dcb6bd94a1f00cfbfa1ee7d3841444b0:

  ARM: dts: axp209: Add iio-hwmon node for internal temperature (2023-05-31 23:15:24 +0200)

----------------------------------------------------------------
- fix DCLK clock names
- new board ICnova A20 ADB4006
- add D1 SPI node
- add bluetooth node for chip board
- add extra mmc2 pinmux to sun5i
- add axp209 iio-hwmon node

----------------------------------------------------------------
Jonathan McDowell (3):
      ARM: dts: sun5i: chip: Enable bluetooth
      ARM: dts: sun5i: Add port E pinmux settings for mmc2
      ARM: dts: axp209: Add iio-hwmon node for internal temperature

Ludwig Kormann (2):
      dt-bindings: arm: sunxi: add ICnova A20 ADB4006 binding
      arm: dts: sunxi: Add ICnova A20 ADB4006 board

Maksim Kiselev (1):
      riscv: dts: allwinner: d1: Add SPI controllers node

Roman Beranek (1):
      ARM: dts: sunxi: rename tcon's clock output

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   6 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/axp209.dtsi                      |   7 ++
 arch/arm/boot/dts/sun5i-r8-chip.dts                |   6 +
 arch/arm/boot/dts/sun5i.dtsi                       |  11 +-
 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 +++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi        |  62 ++++++++++
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |   2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |   2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   2 +-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  37 ++++++
 12 files changed, 270 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
 create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi
