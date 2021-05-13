Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C0E70
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 23:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id 58AB1222543;
	Fri, 14 May 2021 01:28:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOs_WYWHEGdx; Fri, 14 May 2021 01:28:52 +0200 (CEST)
From: Tobias Schramm <t.schramm@manjaro.org>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH v2 0/7] Add missing peripherals to Allwinner V3s/V3 device trees
Date: Fri, 14 May 2021 01:30:17 +0200
Message-Id: <20210513233024.2076725-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner V3s/V3 SoCs feature quite a few peripherals that have good
driver support but yet are nowhere to be found in the SoCs dts.
This patchset adds the DMA controller, the relevant DMA properties for all
peripherals supporting DMA, the integrated analog codec and - for the
Allwinner V3 SoC - also the I2S interface.
I've included all of those changes in one patchset since they do all
depend on addition of the DMA controller.
All changes have been tested in a recent project of mine using a Sochip S3
(a rebranded Allwinner V3) and are confirmed working.

This is v2 of this patchset.

Cheers,
Tobias

Changelog:
  v2:
    - add v3/v3s specific compatible strings
    - fix v3s audio codec analog frontend compatible
    - fix an I2S -> I2C typo

Tobias Schramm (7):
  ARM: dts: sun8i: v3s: add DMA controller to v3s dts
  ARM: dts: sun8i: v3s: add DMA properties to peripherals supporting DMA
  ARM: dts: sun8i: v3s: add analog codec and frontend to v3s dts
  ASoC: dt-bindings: sun8i-a23-codec-analog: add compatible for
    Allwinner V3
  ARM: dts: sun8i: V3: add codec analog frontend to V3 dts
  dt-bindings: sound: sun4i-i2s: add Allwinner V3 I2S compatible
  ARM: dts: sun8i: V3: add I2S interface to V3 dts

 .../sound/allwinner,sun4i-a10-i2s.yaml        |  3 ++
 .../allwinner,sun8i-a23-codec-analog.yaml     |  9 +++--
 arch/arm/boot/dts/sun8i-v3.dtsi               | 31 +++++++++++++++
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 39 +++++++++++++++++++
 4 files changed, 79 insertions(+), 3 deletions(-)

-- 
2.31.1

