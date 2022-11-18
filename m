Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77018F
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Nov 2022 20:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A191FC433D6;
	Fri, 18 Nov 2022 20:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668804103;
	bh=oDIk1XPIAo1ClWrYsDlxn22Dfb0h/UvIV8tTcQig9Bo=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=FzFVV673qokTgQZ/M/EoCR1fT7PgHJO3aDd8H+ioNatDVSBXxExIfIetpjTewE2cp
	 yN7QmsBTBex6pSQeBC/dtYd8+K2RFiQYTozoDxtXO6TCrxj4pb6Hh/3AFzYNuMd34g
	 YSZ3xY5mgfjS56i4pRhhnzp/WWUQ6euFsEOUcDPg+ub9IMXmRCUYcZYfV49ZwTMNBD
	 FQAhUcdEb7LNn4XjdPzYPhk3X+XU8zKKoyhoKqbA0PgSMOcxiBhFpZqZQOcG+RR7zh
	 FQ6x0JxZPWJPGCnF1iOT6DaRfbx8ayXWkhN6X58a+9EbSu6+VWVJYFDbWkhLdNysKy
	 Gr5G+DC8igWIQ==
Date: Fri, 18 Nov 2022 21:41:38 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.2
Message-ID: <Y3fuAosinWbrj+Dy@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following device tree changes for 6.2.

Best regards,
Jernej

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.2-1

for you to fetch changes up to b13d48408e9f0aa80f3d9f93960aa49bd0da7af8:

  ARM: dts: sunxi: H3/H5: Add phys property to USB HCI0 (2022-11-16 19:53:56 +0100)

----------------------------------------------------------------
- Added H616 USB node
- Enabled bluetooth on Pinebook A64
- Added f1c100s PWM, I2C, CIR and LRADC nodes
- Added USB HCI0 PHYs property to H3/H5

----------------------------------------------------------------
Andre Przywara (11):
      dt-bindings: usb: Add H616 compatible string
      arm64: dts: allwinner: h616: Add USB nodes
      arm64: dts: allwinner: h616: OrangePi Zero 2: Add USB nodes
      arm64: dts: allwinner: h616: X96 Mate: Add USB nodes
      dt-bindings: pwm: allwinner,sun4i-a10: Add F1C100s compatible
      ARM: dts: suniv: f1c100s: add PWM node
      ARM: dts: suniv: f1c100s: add I2C DT nodes
      dt-bindings: media: IR: Add F1C100s IR compatible string
      ARM: dts: suniv: f1c100s: add CIR DT node
      ARM: dts: suniv: f1c100s: add LRADC node
      ARM: dts: sunxi: H3/H5: Add phys property to USB HCI0

Samuel Holland (2):
      ARM: dts: axp803/axp81x: Drop GPIO LDO pinctrl nodes
      ARM: dts: axp22x/axp809: Add GPIO controller nodes

Vasily Khoruzhick (1):
      arm64: dts: allwinner: a64: enable Bluetooth on Pinebook

 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |   1 +
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      |   4 +-
 .../devicetree/bindings/usb/generic-ehci.yaml      |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |   1 +
 arch/arm/boot/dts/axp22x.dtsi                      |   6 +
 arch/arm/boot/dts/axp809.dtsi                      |   7 +
 arch/arm/boot/dts/axp81x.dtsi                      |  14 --
 arch/arm/boot/dts/suniv-f1c100s.dtsi               |  70 +++++++++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |   4 +
 arch/arm64/boot/dts/allwinner/axp803.dtsi          |  10 --
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |  14 ++
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts   |  41 ++++++
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts    |  25 ++++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 160 +++++++++++++++++++++
 14 files changed, 333 insertions(+), 25 deletions(-)
