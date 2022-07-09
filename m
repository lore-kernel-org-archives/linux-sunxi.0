Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E041C08
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Jul 2022 18:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CCFC3411C;
	Sat,  9 Jul 2022 18:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657390585;
	bh=se8frCnsFxeLIYGKdeWSwhvcOngONRyCg/WBWgwYgM0=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=SyykrdrflDXEYskkRcQW0a6dRmxMbqfsuKP7n+jXZ7MuNlL2WYXxefUL9KTiQ5brK
	 HEEsmwhLwm14MxhTI8354AehD+EBK3qXN/bde0yX5UWufgKQo+0e4kBdSviTDuhVYe
	 oBelvCB6cZ4VgDGIVCT+eyQtl7X5q/19AN3b2kSKMlD61Yf+0QZwBEGZEhjaJkucHk
	 u4I1TdyVzZLAFIQPk9pCVJdZVemRX68N9i8yautxjUtqqU/+9+5VIrium4v+CR2zjl
	 /ybt1nmFnsZtmnBJr/QUwI4Z2SNUhN5FasuzbdX4tKAEP1KX3SjJvK9U2hUFVJu0Ap
	 3+tTAzdTv3cLg==
Date: Sat, 9 Jul 2022 20:16:21 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 5.20, part 2
Message-ID: <YsnF9cm/qniIOklj@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT changes for 5.20. This was almost ready to be
sent in first PR, but it needed one small adjustment, so I'm sending
this as second pull request.

Best regards,
Jernej

The following changes since commit aab941b8c3cfb020baf2218e9e39706e05bf4877:

  arm64: dts: allwinner: pinephone: Enable internal HMIC bias (2022-07-08 18:52:08 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-5.20-2

for you to fetch changes up to 2c1e62992981c4d8fe7bc183877aec2a189bd387:

  arm64: dts: allwinner: h616: Add X96 Mate TV box support (2022-07-09 20:08:53 +0200)

----------------------------------------------------------------
- added H616 EMAC compatible
- make pinctrl interrupts optionals in DT binding
- initial H616 DTSI
- added OrangePi Zero 2 board
- added X96 Mate TV box
- add VCC PI supply in pinctrl DT binding

----------------------------------------------------------------
Andre Przywara (7):
      dt-bindings: arm: sunxi: Add H616 EMAC0 compatible
      dt-bindings: pinctrl: sunxi: Make interrupts optional
      arm64: dts: allwinner: Add Allwinner H616 .dtsi file
      dt-bindings: pinctrl: sunxi: allow vcc-pi-supply
      dt-bindings: arm: sunxi: Add two H616 board compatible strings
      arm64: dts: allwinner: h616: Add OrangePi Zero 2 board support
      arm64: dts: allwinner: h616: Add X96 Mate TV box support

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  10 +
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |   1 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       |  18 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/allwinner/Makefile             |   2 +
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts   | 213 ++++++++
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts    | 177 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 591 +++++++++++++++++++++
 8 files changed, 1010 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
