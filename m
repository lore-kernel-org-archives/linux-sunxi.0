Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB355696
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 18:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E7BC433C7;
	Sun,  6 Aug 2023 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691345150;
	bh=qIxqAICGpKfnAqV7j1VEaT95XeAMT+WWsugf9Men4Dc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=bCTTek7nQC8ZID9Csgc7mR6HTMynXFXr83U3zmPs2klCgagM2xFvevBNIzB/WWHJD
	 RjmpLvoPZkhU3z0cW10hCsjnA3HHcuOc90ENNJcdJWc7+7tDSJqT5HeTMITMWY9hKL
	 AYKlskQG6X6VbuHWBY4PX8MY7Kgh9L3BZEbnbg27hyKHIl3xNndons05j4GV3g9K3g
	 srLLQM39DJw6jW9gSQ/phsB+Hu+q8mKN+3D06gk1mboOZFiG/GQDjI04LkJYH+1aQR
	 qpSa82ue5+ZmbeQmshNRANmhUrFeoPrYI0dVziNJNmzPhRxwvslzQhonHDWrhQ1cza
	 IGrLkACq7vg/g==
Date: Sun, 6 Aug 2023 20:05:46 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.6
Message-ID: <20230806180546.GA127039@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT changes for 6.6.

Best regards,
Jernej

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.6-1

for you to fetch changes up to 0801a3a9f35854c91f1f3ab8e879c3d14912d214:

  arm: dts: Enable device-tree overlay support for sun8i-h3 pi devices (2023-08-06 13:56:55 +0200)

----------------------------------------------------------------
- Add D1 GPADC node
- Introduce support for OrangePi Zero 3 SBC
- Enable DT overlay support for Allwinner H3 boards

----------------------------------------------------------------
Andre Przywara (3):
      arm64: dts: allwinner: h616: Split Orange Pi Zero 2 DT
      dt-bindings: arm: sunxi: document Orange Pi Zero 3 board name
      arm64: dts: allwinner: h616: Add OrangePi Zero 3 board support

Felix Moessbauer (1):
      arm: dts: Enable device-tree overlay support for sun8i-h3 pi devices

Maksim Kiselev (1):
      riscv: dts: allwinner: d1: Add GPADC node

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 arch/arm/boot/dts/allwinner/Makefile               |  19 +++
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi   | 134 +++++++++++++++++++++
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts   | 119 +-----------------
 .../dts/allwinner/sun50i-h618-orangepi-zero3.dts   |  94 +++++++++++++++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  10 ++
 7 files changed, 264 insertions(+), 118 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
