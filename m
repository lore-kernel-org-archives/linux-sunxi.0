Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE1399CEC
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734156; cv=none; b=p/c02Fwa41PpM5iQWO76bA03sCsNmw0CxCt9RScwLI8w8JtSGA1FvsNDG7sJ2glzTIg/nPTW9aoOVlKi3GieWKt1Mu6ZWHljtO4DiFPDLRHaB+mmExoZzcg+zBhYH4YX08ZipAh3dcdeVCoccppesC/eF/XRepL6mGklIUUGIGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734156; c=relaxed/simple;
	bh=ZUVZReuwX6u+VOoUVGjsuCMz/MOgQoewZH495TiPLJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFINpQeW5UNjIrbui5BF8v9Fa5nt//3DwdJFs3dw0h+4aQq7Y32rfN5sXNrYIIMs5w1ldGs2L0GAq8vn28BbF9rQreitLxE8qf70OFBP46Tgi8njhtSwMxlShqbeW/cn4bW5zKwGCf55u7zX03fRuI95VxocBD4xd0sH0CO8XD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQSRH865; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQSRH865"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb42a2f5feso1476478a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734154; x=1786338954; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJn8bgDlexj3pTLFD/TVKu44xwgcekcV50vMMBDdgSo=;
        b=pQSRH865BUdH5PAKOC6mPqTdKZsLkDpX3r+H2iMRLlH9Bxek8OCpqY+HCEc3v9wZxH
         Sc7ozwNwHP+wWg1zfLyAOirgOfLGgvWR5D2udNoQWT3cma6/1qZVx6uPhs4ZGMEr0Ok/
         o0etb8cJmYqyODGGn49+NMc4mrgKNPnTV4016cqtkROhAvguEgpAkBzIEU6KDMFHvOFp
         uV/Rj+htnQlOSe4xiIBVOOBEoTnU/TmX8IAch9tl9E/m82xZtnuV64AP9X+mci8xP7Tm
         HzaxMsHaLk/cKNqAv4YlnmFBEgLSm+ww49u/12WiFtxL/UNSFEzsCL7AYC1QutkQXMaD
         OYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734154; x=1786338954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJn8bgDlexj3pTLFD/TVKu44xwgcekcV50vMMBDdgSo=;
        b=D43y30iPSXW/OpQEXWTW1SK6HhdlCe5bCds9UMrBY87h3HxJocysUo6Iw998+WUVRT
         CQ/eZzeErVWQwcGJtmpakajsXOAxpipOTkp0bvOTNPUpzk7AoTwz1MdXNGYbNCHzPjEF
         Lns1kExtAJ/w8tH/zfPqxM1Okv5qAK9QDD1hD+j2B5anFe2qXAUCMOKDL7cmKF+kkjeE
         KHff60oWfzbZz0YnkXFdUeiYnIMNGBtWiHODtvtxo6IwNj2k1sf86o5iEpQXw84F7W0N
         hVF6JZ6PEcs36739xiwZF4l0iGiAIIQj8DmpVvQLlg1ln+YhEhTnM13vEYlH77Qm15pO
         3dBw==
X-Forwarded-Encrypted: i=1; AHgh+RpOkSNeuanCpNJZdj8uE4EsHfyBBDVttIU7JA5Urv/04AKUhjBd2G4ygN01lP33v/AReV+sFDNAWsJGjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOGCzUvOWynLjoFuNF6U3QkMO4OLHOAj+SWQEHyuS5Hm7X6+9h
	ZaYxJ2eQfiiUzjkSUyM1Uy+oj0rADZKChXNfYM+kf58rrzK9JIxuvuZL
X-Gm-Gg: AR+sD10a1BBHVFM6qJQeBvllSjn8zjfZ0blYazOLi+3mPS5GKrsm9QerKdy9PblprT1
	GZPqsGypSI0AsAeqmz09LEb7ifieC8tXHLXBRGAv7meQIB9fwOykvFA0qY3VevbNRJRLZznQfV9
	bXpDJF+3sZePRzqlKMr9FpecxPOo7DI8CYA3APhx72CqLFcSRrSbPrIM/1hjeCMR3SPfHLVsmas
	K/KuKn1OczNIO2dY1ylmmZ0cYsuBGClSSfs5QTJPIijekswjtxvJTbOOEMEF7hVbXOHXtIYX2MY
	wPIsYp8nmjjA1Y94olCz7mfJSJMnHmKnpzBSjaHCzx/HLLiNMz5IkxEov0OJ9+hDV17vw4D/2bo
	xMbl3n1puiRPuqjqcTRDtsQsRXO6IpD2Lj8gIfg3A99rBmGDSpY5M2g07b4P/MxkddOMXpVs7Dz
	URcDx8uFl3lyQaeCyE8Yn95gVVObgF2Vw44L9PYf3cGBh9YUl/uEonfy0dDZA7P6tKwHsQylLmC
	jJ5nbJTHPlWiIMiQygfsvOaCY2Uxo5+YRc0ut5ktHfe7cyJju8F6GcKJ4Oup8P3zoquW7DWMW/t
	UbkBeG/j/WUqSLy4ahVFH7pMZfNYUJsxNHcBywGgx9685v/80iqKyo63oJGT10u6iyCxyP8evdt
	d35PmIObowJrkFe5/
X-Received: by 2002:a05:6830:82eb:b0:7eb:c933:eff7 with SMTP id 46e09a7af769-7f196f0d0e1mr13285248a34.9.1785734150243;
        Sun, 02 Aug 2026 22:15:50 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:28 -0600
Subject: [PATCH 18/21] arm64: dts: allwinner: orangepi-zero2w: enable
 Ethernet expansion
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-18-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The optional Orange Pi Zero 2W expansion board exposes H618 EMAC1 through
a 100 Mbit Ethernet jack.

Add a reusable H616-family description of the AC200/AC300 EPHY wiring
alongside its first board user. The forced-ID link PHY selects the
populated control path and AC300 tuning range from the logical SID
configuration field. Keep the AC200 I2C controller and AC300 MDIO control
node at status fail-needs-probe so only the selected path claims its pins.

Enable EMAC1 and its PWM clock provider through the common include,
provide the board's 3.3 V rail to either companion variant, and make EMAC1
the board Ethernet alias.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi | 61 ++++++++++++++++++++++
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  | 13 +++++
 2 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi
new file mode 100644
index 000000000000..26521429957a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common X-Powers AC200/AC300 Ethernet PHY support for H616-family SoCs
+ *
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+&emac1 {
+	phy-handle = <&acx00_ephy>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pa_pins>;
+	status = "fail-needs-probe";
+
+	ac200: mixed-signal@10 {
+		compatible = "x-powers,ac200";
+		reg = <0x10>;
+		clocks = <&pwm 5>;
+		nvmem-cells = <&ac200_bandgap>;
+		nvmem-cell-names = "bandgap";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm5_pin>;
+
+		ac200_ephy_ctl: ethernet-phy-control {
+			compatible = "x-powers,ac200-ephy-ctl";
+			nvmem-cells = <&ephy_calibration>;
+			nvmem-cell-names = "calibration";
+			phy-mode = "rmii";
+		};
+	};
+};
+
+&mdio1 {
+	ac300_ephy_ctl: ethernet-phy-control@10 {
+		compatible = "x-powers,ac300-ephy-ctl";
+		reg = <0x10>;
+		clocks = <&pwm 5>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "calibration";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm5_pin>;
+		phy-mode = "rmii";
+		status = "fail-needs-probe";
+	};
+
+	acx00_ephy: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0044.1400";
+		reg = <0>;
+		nvmem-cells = <&ephy_config>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200-control = <&ac200_ephy_ctl>;
+		x-powers,ac300-control = <&ac300_ephy_ctl>;
+	};
+};
+
+&pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index b340bbcb710d..e833ee267c83 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sun50i-h616.dtsi"
+#include "sun50i-h616-acx00-ephy.dtsi"
 #include "sun50i-h616-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -17,6 +18,7 @@ / {
 	compatible = "xunlong,orangepi-zero2w", "allwinner,sun50i-h618";
 
 	aliases {
+		ethernet0 = &emac1;
 		serial0 = &uart0;
 	};
 
@@ -54,6 +56,17 @@ reg_vcc3v3: vcc3v3 {
 	};
 };
 
+&ac200 {
+	ac-ldoin-supply = <&reg_vcc3v3>;
+	ephy-vcc-supply = <&reg_vcc3v3>;
+	rtc-vcc-supply = <&reg_vcc3v3>;
+	tv-vcc-supply = <&reg_vcc3v3>;
+};
+
+&ac300_ephy_ctl {
+	vcc1-supply = <&reg_vcc3v3>;
+};
+
 &codec {
 	allwinner,audio-routing = "Line Out", "LINEOUT";
 	status = "okay";

-- 
2.53.0

