Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C117997
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713083831; cv=none; b=UKAQ000qUl23YcXEoPDi8VuSBgCNJZuhFXZeJBg8cZZixU+OZHlJMQW/a4IQxZHZpyBQaH9qBi+cuBIAgFPDZ3N7TklUCilfM3SCMQXhPclUEeZOhizkk+l1F92PI87w4r4wbylesKi0VKNzzRV2Y9sqFc1ZF3oFSafzPApULF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713083831; c=relaxed/simple;
	bh=wtUCt/weVJfRLxtsbdc67IFIX+KUd5o+bINPnrjkwBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFKEYeJG02usJmF6yt7IWg//lml55PpiTfVhNWTZUpG90oIT+Q+StuxYJctjdqt6sWuVE4YokNt5st6xXQwDxG2fVvExib6At03lGxLPPiHNaSDXAz656+WfVuL8Z9x0iuhofDVwp0E6NjiZaTg+zzSUhGhAIzlgAjq1HsoiUx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=FI2LUBUy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eStXBEdj; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="FI2LUBUy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eStXBEdj"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D452D114011E;
	Sun, 14 Apr 2024 04:37:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 14 Apr 2024 04:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1713083827; x=
	1713170227; bh=tA8jAdMfLjeEwU5MzD6VPwwNXZKBpImUoZuX53S8mtI=; b=F
	I2LUBUy3mtjXfDWd4hob9FaWC6jiwTFyvAjEuTcCNJ1BS+VjabhIz9so3PVepUW7
	3F3qaXu+DyeUAKbMAKkznAmc4ZILAdvWD8zoiE7X7ZIPZ7dQjlNqpXdG4qfQQHg9
	LkOcxXrY9Utx9wDsX+S2UtmZ3JduJfxw+gJCNlk55xx3JeIQpGvzJzfnb8SnZzq+
	tUkAQDNSC6khEr9ZFF0lOBvPDDCvhZomIGID1UGSPqGwq/1aCZVla7ZM3M7rQOqk
	mBHuAD3vSm9zbO0C8MQRCN0TuDTY32nTloeT2Fa9doeYIgBRLa6czUYLarY1rQBd
	AotmwalkR6+IO6AuuSBzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713083827; x=
	1713170227; bh=tA8jAdMfLjeEwU5MzD6VPwwNXZKBpImUoZuX53S8mtI=; b=e
	StXBEdj7ez8iLuQ9lmD3Tqj96sCw95F//ApGi5rqIquDN0WOjAFf9OmBlj6qaAzo
	7HSuazCyuYenKw7InOCB4xykOJDcCwRoPkXdIxOMsI9l9vtD2o9g5+GzHttgXZ0g
	w80bYl8fUYpXMYzcCytDuu8ukxKAY2E6mW2DyYqLEMhvFNp5riCUfrbNa9Rho4CD
	VAPaTybDDTOjX2dzYxIDiclkntM/7fngLoTxPGzDDG40a04iv6XwuAJ3ds7bKp/3
	ojE22n8iWPrZYLA9gvYheCVkrlA60BmlT59E7WUfZ2Q55hBhiQOjgGM4pp5uNbPt
	yKWkC2MhEwgOgqL9EVvYg==
X-ME-Sender: <xms:s5UbZuodKGpv67x8uFb8WbB9fcRpii8hl94pK7AG_CNsMtHIOX7z3g>
    <xme:s5UbZsoUowWPHtMr5LnpH4SQ9gRDm5Uw5x9qstAQhYEkoHJWCyck4UeMfXN-YyiCQ
    Pc1oBjsnFraQWdEyw>
X-ME-Received: <xmr:s5UbZjOutTj0pm9Bqg_Kb6mDPxpbgsbHRjdT0tE_vrOwtgqP7YXprRr-GRRhuXG7ZmIsCKv51-AIns9iGZ-T6HC35XG-qsKey_HNAHl3m7C-Vshv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiledgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:s5UbZt5pxHV1IOoqufXARNT5dwvXVmZxM-5R-5kvpszolMTxPGqX7Q>
    <xmx:s5UbZt5LqvRvtZ3Yf2jWo6mYDMoRfYehwL94W-qp4xKM21R5FLlrng>
    <xmx:s5UbZthdOiKQrSf-qGco3UbhDZXG1I5Y2wUoO641WTqmklF5HufNrw>
    <xmx:s5UbZn6W50jPwynszs9pQ3XQTg56mLYa0mS8Mf4SbyrUF0FSkun_9A>
    <xmx:s5UbZpiWA-oSkU1AhtveQqAZNIRGRAVegNogs88eEUfX6HFKY74opIcy>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Apr 2024 04:37:04 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Date: Sun, 14 Apr 2024 20:33:46 +1200
Message-ID: <20240414083347.131724-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240414083347.131724-2-ryan@testtoast.com>
References: <20240414083347.131724-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ryan Walklin <ryan@testtoast.com>

The base model RG35XX (2024) is a handheld gaming device based on an Allwinner 
H700 chip.

The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31 GPU) 
which exposes RGB LCD and NMI pins.

Device features:
- Allwinner H700 @ 1.5GHz
- 1GB LPDDR4 DRAM
- X-Powers AXP717 PMIC
- 3.5" 640x480 RGB LCD
- Two microSD slots
- Mini-HDMI out
- GPIO keypad
- 3.5mm headphone jack

Enabled in this DTS:
- AXP717 PMIC with regulators (interrupt controller TBC/TBD)
- Power LED (charge LED on device controlled directly by PMIC)
- Serial UART (accessible from PIN headers on the board)
- MMC slots

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 405 ++++++++++++++++++
 1 file changed, 405 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
new file mode 100644
index 000000000000..b4140d450687
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Andre Przywara <andre.przywara@arm.com>.
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+    model = "Anbernic RG35XX 2024";
+    compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
+
+    aliases {
+        mmc0 = &mmc0;
+        mmc1 = &mmc2;
+        mmc2 = &mmc1;
+        serial0 = &uart0;
+    };
+
+    chosen {
+        stdout-path = "serial0:115200n8";
+    };
+
+    leds {
+        compatible = "gpio-leds";
+
+        led-0 {
+            function = LED_FUNCTION_POWER;
+            color = <LED_COLOR_ID_GREEN>;
+            gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
+            default-state = "on";
+        };
+    };
+
+    gpio-keys {
+       compatible = "gpio-keys";
+
+       keyUp {
+           label = "D-Pad Up";
+           gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
+           linux,input-type = <EV_KEY>;
+           linux,code = <BTN_DPAD_UP>;
+        };
+
+        keyDown {
+            label = "D-Pad Down";
+            gpios = <&pio 4 0 GPIO_ACTIVE_LOW>; /* PE0 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_DPAD_DOWN>;
+        };
+
+        keyLeft {
+            label = "D-Pad left";
+            gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_DPAD_LEFT>;
+        };
+
+        keyRight {
+            label = "D-Pad Right";
+            gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_DPAD_RIGHT>;
+        };
+
+        keyA {
+            label = "Action-Pad A";
+            gpios = <&pio 0 0 GPIO_ACTIVE_LOW>; /* PA0 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_EAST>;
+        };
+
+        keyB {
+            label = "Action-Pad B";
+            gpios = <&pio 0 1 GPIO_ACTIVE_LOW>; /* PA1 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_SOUTH>;
+        };
+
+        keyX {
+            label = "Action-Pad X";
+            gpios = <&pio 0 3 GPIO_ACTIVE_LOW>; /* PA3 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_NORTH>;
+        };
+
+        keyY {
+            label = "Action Pad Y";
+            gpios = <&pio 0 2 GPIO_ACTIVE_LOW>; /* PA2 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_WEST>;
+        };
+
+        keyStart {
+            label = "Key Start";
+            gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_START>;
+        };
+
+        keySel {
+            label = "Key Select";
+            gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_SELECT>;
+        };
+
+        keyL1 {
+            label = "Key L1";
+            gpios = <&pio 0 10 GPIO_ACTIVE_LOW>; /* PA10 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_TL>;
+        };
+
+        keyL2 {
+            label = "Key L2";
+            gpios = <&pio 0 11 GPIO_ACTIVE_LOW>; /* PA11 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_TL2>;
+        };
+
+        keyR1 {
+            label = "Key R1";
+            gpios = <&pio 0 12 GPIO_ACTIVE_LOW>; /* PA12 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_TR>;
+        };
+
+        keyR2 {
+            label = "Key R2";
+            gpios = <&pio 0 7 GPIO_ACTIVE_LOW>; /* PA7 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_TR2>;
+        };
+
+        keyMenu {
+            label = "Key Menu";
+            gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <BTN_MODE>;
+        };
+
+        keyVol+ {
+            label = "Key Volume Up";
+            gpios = <&pio 4 1 GPIO_ACTIVE_LOW>; /* PE1 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <KEY_VOLUMEUP>;
+        };
+
+        keyVol- {
+            label = "Key Volume Down";
+            gpios = <&pio 4 2 GPIO_ACTIVE_LOW>; /* PE2 */
+            linux,input-type = <EV_KEY>;
+            linux,code = <KEY_VOLUMEDOWN>;
+        };
+    };
+
+    reg_vcc5v: vcc5v {
+        compatible = "regulator-fixed";
+        regulator-name = "vcc-5v";
+        regulator-always-on;
+        regulator-boot-on;
+        regulator-min-microvolt = <5000000>;
+        regulator-max-microvolt = <5000000>;
+    };
+
+    vcc_5v0_usb: vcc-5v0-usb { /* needs gpios */
+            compatible = "regulator-fixed";
+            regulator-name = "vcc_5v0_usb";
+            regulator-min-microvolt = <5000000>;
+            regulator-max-microvolt = <5000000>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+    reg_vcc3v3: vcc3v3 {
+        gpio = <&pio 4 4 GPIO_ACTIVE_HIGH>;
+        compatible = "regulator-fixed";
+        regulator-name = "vcc-3v3";
+        regulator-always-on;
+        regulator-boot-on;
+        regulator-min-microvolt = <3300000>;
+        regulator-max-microvolt = <3300000>;
+
+    };
+
+    reg_vcc1v8: vcc1v8 {
+        compatible = "regulator-fixed";
+        regulator-name = "vcc-1v8";
+        regulator-always-on;
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+    };
+};
+
+&cpu0 {
+    cpu-supply = <&reg_dcdc1>;
+};
+
+&mmc0 {
+    vmmc-supply = <&reg_vcc3v3>;
+    disable-wp;
+    cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
+    bus-width = <4>;
+    status = "okay";
+};
+
+&mmc2 {
+    vmmc-supply = <&reg_vcc3v3>;
+    vqmmc-supply = <&reg_aldo1>;
+    cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE 22 */
+    //cd-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>;  /* PE16 */
+    bus-width = <4>;
+    status = "okay";
+};
+
+&ohci0 {
+    status = "okay";
+};
+
+&ehci1 {
+    status = "okay";
+};
+
+&i2c3 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&i2c3_ph_pins>;
+    status = "okay";
+};
+
+&r_rsb {
+   status = "okay";
+
+   axp717: pmic@3a3 {
+       compatible = "x-powers,axp717";
+       //interrupt-controller;
+       //#interrupt-cells = <1>;
+       reg = <0x3a3>;
+       //interrupt-parent = <&r_intc>; /* test */
+       //interrupts = <0 IRQ_TYPE_LEVEL_LOW>; /* test */
+
+       vin1-supply = <&reg_vcc5v>;
+       vin2-supply = <&reg_vcc5v>;
+       vin3-supply = <&reg_vcc5v>;
+       vin4-supply = <&reg_vcc5v>;
+
+       regulators {
+            reg_dcdc1: dcdc1 {
+                regulator-always-on;
+                regulator-boot-on;
+                regulator-min-microvolt = <810000>;
+                regulator-max-microvolt = <1100000>;
+                regulator-name = "vdd-cpu";
+            };
+
+            reg_dcdc2: dcdc2 {
+                regulator-always-on;
+                regulator-boot-on;
+                regulator-min-microvolt = <940000>;
+                regulator-max-microvolt = <940000>;
+                regulator-name = "vdd-sys";
+            };
+
+            reg_dcdc3: dcdc3 {
+                regulator-always-on;
+                regulator-boot-on;/* test */
+                regulator-min-microvolt = <1100000>;
+                regulator-max-microvolt = <1100000>;
+                regulator-name = "vdd-dram";
+            };
+
+            reg_aldo1: aldo1 {
+                regulator-always-on;
+                regulator-boot-on;/* test */
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-name = "vcc-sd2";
+            };
+
+            reg_aldo2: aldo2 {
+                regulator-always-on;/* test */
+                regulator-boot-on;/* test */
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-aldo2";
+            };
+
+            reg_aldo3: aldo3 {
+                regulator-always-on;
+                regulator-boot-on;
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-aldo3";
+            };
+
+            reg_aldo4: aldo4 {
+                regulator-always-on;
+                regulator-boot-on;
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-aldo4";
+            };
+
+            reg_bldo1: bldo1 {
+                regulator-always-on;/* test */
+                regulator-boot-on;/* test */
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-bldo1";
+            };
+
+            reg_bldo2: bldo2 {
+                regulator-always-on;
+                regulator-boot-on;
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+                regulator-name = "vcc-1v8";
+            };
+
+            reg_bldo3: bldo3 {
+                regulator-always-on;/* test */
+                regulator-boot-on;/* test */
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-bldo3";
+            };
+
+            reg_bldo4: bldo4 {
+                regulator-always-on;/* test */
+                regulator-boot-on;/* test */
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-bldo4";
+            };
+
+            reg_cldo1: cldo1 {
+                regulator-always-on;/* test */
+                regulator-boot-on;/* test */
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-cldo1";
+            };
+
+            reg_cldo2: cldo2 {
+                regulator-always-on;/* test */
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-cldo2";
+            };
+
+            reg_cldo3: cldo3 {
+                regulator-always-on;
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <3500000>;
+                regulator-name = "axp717-cldo3";
+            };
+
+            reg_cldo4: cldo4 {
+                regulator-always-on;/* test */
+                regulator-min-microvolt = <3300000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-name = "vcc-wifi";
+            };
+
+            reg_boost: reg-boost {
+                regulator-always-on;/* test */
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+                regulator-name = "boost";
+            };
+
+            reg_cpusldo: cpusldo {
+                regulator-always-on;
+                regulator-boot-on;
+                regulator-min-microvolt = <500000>;
+                regulator-max-microvolt = <1400000>;
+                regulator-name = "cpusldo";
+            };
+       };
+   };
+};
+
+&uart0 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&uart0_ph_pins>;
+    status = "okay";
+};
+
+/* the AXP717 has USB type-C role switch functionality, to be implemented */
+&usbotg {
+    dr_mode = "host";   /* USB type-C receptable */
+    status = "okay";
+};
+
+&usbphy {
+    status = "okay";
+};
-- 
2.44.0

