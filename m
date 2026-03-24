Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AC43D47CD;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370643; cv=none; b=iu3b76PLVrsUXbVmKeTVzMxMXaTgUagiRrTl9laULo74BPlakq6FreiQK9cAK9J94ftHXxN3dwnVjop8+2OitQ2puRVxc/vw8BREHR4obl7erRx6FwYkBoz0JsCPuReaL+qv1SRyERmLwupp+cc12J2ghEpg/+LlF9JRWwn/ueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370643; c=relaxed/simple;
	bh=I7i185xsG5HSY32fnLRfMXM0qgCfYCSPudPDeTb/fKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+EKmvGnDaQ3Mz5NfKFTFkHmb1JHLIviK3oct48yVIn0H02pfbdbrA2skLT7uEEqhS2mWUwBMNmSHWHCALEnLFOJL0HauCqsofQPB1kDs9c9zKhHdgNVPDvT+10ygk/jG1EnbV+qDhVe3xupXxOaoeLb7MEgEnua+GpOcfb3L7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYta2nfm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYta2nfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A73C2BC9E;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370642;
	bh=I7i185xsG5HSY32fnLRfMXM0qgCfYCSPudPDeTb/fKA=;
	h=From:To:Cc:Subject:Date:From;
	b=dYta2nfmcNfL9xIoExJWOoUJuhCVz0l/xL1Wo/WM7Bh8ZCUs3f0srhFnQu13ruA5B
	 vopDRh/9tPHNbZ4DlF6tjRo+t1hH2ADyI2AxzB1AabAFTrmFRmvHllppvHlvG929wK
	 /2OZKFPDaM30R8FFw7LbZVydU4yXiutytlg8k4yJVTcjx3217KWA9wYbshsYjXFVAM
	 lKMxL0Lmn3KcM3uMZIGcS0fLH+tL4NSY3pJhlj0Nkkq1ORXpvY1hrX8t45xdub5Th+
	 eM2yta2pDJzmNSZVpv39/19DcSqaZbiShxzVbb7OzFNpUMqyrMcT7njPc03GpwQ8yj
	 Loi9CUaCJr5fg==
Received: by wens.tw (Postfix, from userid 1000)
	id 98AAA5FDD9; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] soc: sunxi: sram: Add H616 SRAM support
Date: Wed, 25 Mar 2026 00:43:48 +0800
Message-ID: <20260324164357.1607247-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The Allwinner H616 has two switchable peripheral SRAM regions:

- The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
  to this region is enabled by default. CPU access can be disabled,
  after which reads will show the same stale value for all addresses,
  while writes are ignored.

  The mux value for this region is different from previous generations.

- The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
  KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
  CPU access is disabled, the whole region reads as zero, while writes
  are ignored.

  The mux value for this region is the same as on the A64 and H6.

The driver needs to allow both the Video Engine and Display Engine to
claim the SRAM C region at the same time.

At the same time, since the Video Engine needs to claim both SRAM
regions, the Allwinner SRAM consumer interface needs to support claiming
multiple regions for one consumer.


Patch 1 adds a compatible for the new H616 VE SRAM to the common SRAM
binding.

Patch 2 adds a compatible for the new H616 VE SRAM to the Allwinner SRAM
binding.

Patch 3 is a minor cleanup that const-ifies the SRAM related hardware
description data in the driver.

Patch 4 implements support for multiple hardware block drivers to claim
the same SRAM region.

Patch 5 implements support for one consumer to claim multiple SRAM
regions.

Patch 6 adds support for the H616 VE SRAM region to the SRAM driver.

Patch 7 adds the SRAM regions to the H616 dtsi file. This was picked
from Jernej's tree and split into one patch for SRAM and one patch for
the video engine.


I think all the changes can go through the sunxi tree, unless the device
tree maintainers want to take the first patch separately?

The new users of this, support for the H616 video engine, will be sent
separately.


Thanks
ChenYu


Chen-Yu Tsai (6):
  dt-bindings: sram: Document Allwinner H616 VE SRAM
  dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
  soc: sunxi: sram: Const-ify sunxi_sram_func data and references
  soc: sunxi: sram: Allow SRAM to be claimed multiple times
  soc: sunxi: sram: Support claiming multiple regions per device
  soc: sunxi: sram: Add H616 SRAM regions

Jernej Skrabec (1):
  arm64: dts: allwinner: sun50i-h616: Add SRAM nodes

 .../allwinner,sun4i-a10-system-control.yaml   |   5 +-
 .../devicetree/bindings/sram/sram.yaml        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  28 ++-
 drivers/soc/sunxi/sunxi_sram.c                | 196 +++++++++++-------
 4 files changed, 151 insertions(+), 79 deletions(-)

-- 
2.47.3

