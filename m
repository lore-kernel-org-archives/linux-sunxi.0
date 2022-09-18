Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40692468F
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Sep 2022 21:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FB6C433D6;
	Sun, 18 Sep 2022 21:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663536941;
	bh=Yq1M6TSUd2pa2XiQCvmC7kofNxGerXtGOkulb93geRU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=TkgiqRozJAIJi0SVPFBJFYfrk9OZ7UozWuUo2H/g6Sk6EVEzFSdABCT0sRzN7yQ3h
	 c+Dj2CTndsmmzoAuv4VU5TS0kCdFp8j54hhc7vRzDk1tmnsWTXReRWYHxlfraFj+1v
	 QEOM1DUpCN71J2dGGtDS4Opp12Ep4wBRqruGC8V2qW8FaHL7XvxYP8fdbRn2Nv5+mt
	 H9we34iLG9HdMF2mnMLKU0DZ/dkGGVDw0CBpkWaC80yNjYZat0WPxYaHZP8q8+olqF
	 X3Qd8hCShhpZkoac2sGOB5ZLrx/j5PQ2tCV6SFrjBcK//6ilroPHpMtUHQf2YGUh2o
	 uCdXtc5OgFVMA==
Date: Sun, 18 Sep 2022 23:35:36 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.1
Message-ID: <YyePKDnOeP8Tdt5n@kista.localdomain>
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

Please pull following device tree changes for 6.1.

Best regards,
Jernej

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.1-1

for you to fetch changes up to 35bd799307b26798033a387cd3235114f894e205:

  dt-bindings: sram: sunxi-sram: Add D1 compatible string (2022-09-18 22:56:04 +0200)

----------------------------------------------------------------
- Allwinner A100 DMA node
- Allwinner H6 GPU devfreq scaling
- sunxi sram bindings cleanup and D1 addition

----------------------------------------------------------------
Clément Péron (3):
      arm64: dts: allwinner: h6: Add cooling map for GPU
      arm64: dts: allwinner: h6: Add GPU OPP table
      arm64: dts: allwinner: beelink-gs1: Enable GPU OPP

Samuel Holland (3):
      arm64: dts: allwinner: a100: Add I2C DMA requests
      dt-bindings: sram: sunxi-sram: Clean up the compatible lists
      dt-bindings: sram: sunxi-sram: Add D1 compatible string

Yangtao Li (1):
      arm64: dts: allwinner: a100: Add device node for DMA controller

 .../sram/allwinner,sun4i-a10-system-control.yaml   | 86 +++++++++------------
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 24 ++++++
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |  1 +
 .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi      | 87 ++++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       | 51 ++++++++++++-
 5 files changed, 195 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
