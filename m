Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3015F72
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 11:07:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A6111042;
	Tue, 15 Jun 2021 04:07:02 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F0BC3F719;
	Tue, 15 Jun 2021 04:07:00 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ondrej Jirman <megous@megous.com>,
	devicetree@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v7 01/19] dt-bindings: mfd: axp20x: Add AXP305 compatible (plus optional IRQ)
Date: Tue, 15 Jun 2021 12:06:18 +0100
Message-Id: <20210615110636.23403-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210615110636.23403-1-andre.przywara@arm.com>
References: <20210615110636.23403-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The AXP305 PMIC used on many boards with the H616 SoC seems to be fully
compatible to the AXP805 PMIC, so add the proper chain of compatible
strings.

Also at least on one board (Orangepi Zero2) there is no interrupt line
connected to the CPU, so make the "interrupts" property optional.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 4991a6415796..2b53dcc0ea61 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -26,10 +26,10 @@ Required properties:
     * "x-powers,axp803"
     * "x-powers,axp806"
     * "x-powers,axp805", "x-powers,axp806"
+    * "x-powers,axp305", "x-powers,axp805", "x-powers,axp806"
     * "x-powers,axp809"
     * "x-powers,axp813"
 - reg: The I2C slave address or RSB hardware address for the AXP chip
-- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
 - interrupt-controller: The PMIC has its own internal IRQs
 - #interrupt-cells: Should be set to 1
 
@@ -43,6 +43,7 @@ more information:
 			AXP20x/LDO3: software-based implementation
 
 Optional properties:
+- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
 - x-powers,dcdc-freq: defines the work frequency of DC-DC in KHz
 		      AXP152/20X: range:  750-1875, Default: 1.5 MHz
 		      AXP22X/8XX: range: 1800-4050, Default: 3   MHz
-- 
2.17.5

