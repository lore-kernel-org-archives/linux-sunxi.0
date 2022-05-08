Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16011878
	for <linux-sunxi@lists.linux.dev>; Sun,  8 May 2022 20:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB14C385AC;
	Sun,  8 May 2022 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652043174;
	bh=zX630/IQ4n8rFF9LhVxWtWKtnLHgrQEsh7cp3IaBvOE=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=sy/mne9QeBVaI8wGU1QtfXhuVQZOYHrvQFVtaCVOhBkKI+PxtiB6ztvIIUdJtrEp0
	 jGDN3Y6jOx7qGiWiP4MAqmofqBEPb/m4Y+urHi2p/gr6eeQFLEEYdYNB2lSMwmXwyN
	 S59kmIY9Qo4e3XUB3gIp3+LzwpAJJxOwXoTVU5L3JVQD5tilbzhXd3ekT5lv1Mz2aJ
	 e4MnMpCgZ/5QItahktSDUfdUvpZKn5ul4alxw8N1w5iNwpuapDkU5qSsaSQVNL7dXE
	 jmI88uywcA6UhWCrXxiShmOb8dneiuKHhg/kdqzmNyFzX/663tbYOZq16bVkY6OQ+A
	 voqRqiJBmmTsA==
Date: Sun, 8 May 2022 22:52:50 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner DT changes for 5.19, take 2
Message-ID: <Yngton59OacOR2ht@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT changes for 5.19.

Best regards,
Jernej

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-5.19-2

for you to fetch changes up to 092b3ace58d9049bcd0381c32f2cd69302e199bc:

  ARM: dts: sunxi: nanopi: Remove input-name property (2022-05-08 22:47:35 +0200)

----------------------------------------------------------------
- F1C100 improvements (SPI, MMC, timer, cpu, watchdog)
- SPI flash node for licheepi-nano
- enabled analogue audio on olinuxino-a64
- GPIO port regulators on teres-i
- remove undocumented property from nanopi

----------------------------------------------------------------
Andre Przywara (9):
      dt-bindings: watchdog: sunxi: fix F1C100s compatible
      dt-bindings: watchdog: sunxi: clarify clock support
      ARM: dts: suniv: F1C100: fix watchdog compatible
      dt-bindings: arm: sunxi: document LicheePi Nano name
      ARM: dts: suniv: F1C100: fix CPU node
      ARM: dts: suniv: F1C100: fix timer node
      dt-bindings: spi: sunxi: document F1C100 controllers
      ARM: dts: suniv: F1C100: add SPI support
      ARM: dts: suniv: licheepi-nano: add SPI flash

Dang Huynh (1):
      ARM: dts: sunxi: nanopi: Remove input-name property

Harald Geyer (1):
      arm64: dts: allwinner: teres-i: Add GPIO port regulators

Jesse Taube (3):
      ARM: dts: suniv: F1C100: add clock and reset macros
      ARM: dts: suniv: F1C100: add MMC controllers
      ARM: dts: suniv: licheepi-nano: add microSD card

Philip Rinn (1):
      arm64: dts: allwinner: a64: olinuxino: Enable audio

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml      |   1 +
 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml |  24 ++---
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi             |   1 -
 arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  |  31 ++++++
 arch/arm/boot/dts/suniv-f1c100s.dtsi               | 104 +++++++++++++++++++--
 .../boot/dts/allwinner/sun50i-a64-olinuxino.dts    |  30 ++++++
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |   8 ++
 8 files changed, 178 insertions(+), 26 deletions(-)
