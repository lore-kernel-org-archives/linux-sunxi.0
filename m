Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AC517C8
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Jan 2023 01:28:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8940413D5;
	Thu, 19 Jan 2023 17:28:51 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AAB23F71A;
	Thu, 19 Jan 2023 17:28:08 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: sun8i: a83t: bananapi-m3: describe SATA disk regulator
Date: Fri, 20 Jan 2023 01:26:16 +0000
Message-Id: <20230120012616.30960-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Bananapi-M3 has a SATA connector, driven by a USB-to-SATA bridge
soldered on the board. The power for the SATA device is provided by a
GPIO controlled regulator. Since the SATA device is behind USB, it has
no DT node, so we never described this regulator. Instead U-Boot was
turning this on in a rather hackish way, which we now want to get rid of.
On top of that it seems fragile to leave this GPIO undescribed, as
userland could claim it and turn the disk off.

Add a fixed regulator, controlled by the PD25 GPIO, and mark it as
always-on. This would mimic the current situation, but in a safer way,
and would allow U-Boot to drop the CONFIG_SATAPWR enable hack.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
index 5a7e1bd5f8258..8d56b103f0630 100644
--- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
@@ -105,6 +105,21 @@ wifi_pwrseq: wifi_pwrseq {
 		/* enables internal regulator and de-asserts reset */
 		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 WL-PMU-EN */
 	};
+
+	/*
+	 * Power supply for the SATA disk, behind a USB-SATA bridge.
+	 * Since it is a USB device, there is no consumer in the DT, so we
+	 * have to keep this always on.
+	 */
+	regulator-sata-disk-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "sata-disk-pwr";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		enable-active-high;
+		gpio = <&pio 3 25 GPIO_ACTIVE_HIGH>; /* PD25 */
+	};
 };
 
 &cpu0 {
-- 
2.35.5

