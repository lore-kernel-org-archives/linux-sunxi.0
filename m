Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3745803
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 01:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 939B8C15;
	Wed, 13 Dec 2023 17:54:11 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5343E3F762;
	Wed, 13 Dec 2023 17:53:24 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] arm64: dts: allwinner: Add Transpeed 8K618-T TV box
Date: Thu, 14 Dec 2023 01:53:09 +0000
Message-Id: <20231214015312.17363-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A quick update, with the few fixes for issues that reviewers spotted.
See below for a changelog.
================================

The Transpeed 8K618-T is one example of various cheap Chinese TV boxes
using the Allwinner H618 SoC. It comes with up to 4GB DRAM and up to
128GB eMMC flash, plus the usual HDMI, 100Mbit Ethernet, WiFi/BT and
dual USB ports, not to forget the mandatory microSD card slot.
More details: https://linux-sunxi.org/Transpeed_8K618-T

Ethernet relies on the yet unsupported integrated PHY, and the HDMI
output is similarly not yet supported, but patches exist that await
polishing for mainline submission.
Meanwhile USB and eMMC plus SD card work, so you can hook up an USB
Ethernet or WiFi adapter to get things going.

This series is the usual trilogy of DT support patches: adding the vendor
name in patch 1, the board compatible name in patch 2, and the actual
.dts file in patch 3.

Please have a look!

Thanks,
Andre

Changelog v1 .. v2:
- fix alphabetical ordering in vendor-prefixes
- remove unneeded UART1 alias
- extend regulator names, drop now redundant comments

Andre Przywara (3):
  dt-bindings: vendor-prefixes: add Transpeed
  dt-bindings: arm: sunxi: document Transpeed 8K618-T board name
  arm64: dts: allwinner: h618: add Transpeed 8K618-T TV box

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-h618-transpeed-8k618-t.dts         | 161 ++++++++++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts

-- 
2.35.8

