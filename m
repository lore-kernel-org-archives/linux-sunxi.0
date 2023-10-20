Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C450D199BE
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB948143D;
	Fri, 20 Oct 2023 07:57:52 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358DE3F762;
	Fri, 20 Oct 2023 07:57:10 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: allwinner: Add Orange Pi Zero 2W support
Date: Fri, 20 Oct 2023 15:57:04 +0100
Message-Id: <20231020145706.705420-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this adds support for the Orange Pi Zero 2W, a small board in the
Raspberry Pi Zero form factor, but with an Allwinner H618 Soc and up to
4 GB of DRAM.

This is just for the base board, created by looking at the schematics.
There is an FPC connector, which connects to a stackable expansion
board, that provides two additional USB-A sockets and an Ethernet jack,
among other connectors.
What is the recommended way to model this, via a DT overlay, applied
dynamically by the bootloader, or using a separate .dts file, that
includes this base board file?

Cheers,
Andre

Andre Przywara (2):
  dt-bindings: arm: sunxi: add Orange Pi Zero 2W
  arm64: dts: allwinner: h616: add Orange Pi Zero 2W support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 176 ++++++++++++++++++
 2 files changed, 181 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts

-- 
2.25.1

