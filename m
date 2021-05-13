Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF6F71
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 19:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id AD815221190;
	Thu, 13 May 2021 21:09:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwKRxNQN1rsI; Thu, 13 May 2021 21:09:06 +0200 (CEST)
From: Tobias Schramm <t.schramm@manjaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH 0/4] Add missing peripherals to Allwinner V3s/V3 device trees
Date: Thu, 13 May 2021 21:09:45 +0200
Message-Id: <20210513190949.2069235-1-t.schramm@manjaro.org>
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

Cheers,
Tobias

Tobias Schramm (4):
  ARM: dts: sun8i: v3s: add DMA controller to v3s dts
  ARM: dts: sun8i: v3s: add DMA properties to peripherals supporting DMA
  ARM: dts: sun8i: v3s: add analog codec and frontend to v3s dts
  ARM: dts: sun8i: V3: add I2S interface to V3 dts

 arch/arm/boot/dts/sun8i-v3.dtsi  | 25 ++++++++++++++++++++
 arch/arm/boot/dts/sun8i-v3s.dtsi | 39 ++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

-- 
2.30.1

