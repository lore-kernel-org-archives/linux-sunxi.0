Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA16246771
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907320; cv=none; b=VXxfrtZo5qD7MMXY/9tsXIbqF4ezojw2/4wPH6ZDZhDaxsePXDdeE6v+SYQ7tJJDJ5I0oxxadQToYy50WFi+ph7CqFegly656+O7dxhOexRod2L9vavZxLFpKbPPDWorRXfxEJ7AKcNXOk7X5/hhDI9K4iygc9hZIv+NxSP2Pr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907320; c=relaxed/simple;
	bh=fmYsyqOj7xyzuv9dYNoPWOc7xZpihZk5OLNjpTm9Yjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ooWRmrmBRHc/fWxFIjvOJO19nblH6Chg67PiK6nwFaG7EQIRB5IFZLNa3WRi6k2fVSwL/FSiUfIaaSBjoHH1IeAkSkjm3E2fO5OvKcG+1h2VvEwS3vTay+TmAxpbpkFsYFdFGezSI51+P1nyOA5kizq519Wmo4OnjYnjgijVojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4DB451F00036
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 16:55:15 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D29EEACAEFE; Mon,  7 Jul 2025 16:55:14 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id C1D24ACAEE5;
	Mon,  7 Jul 2025 16:52:09 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
Date: Mon,  7 Jul 2025 18:51:55 +0200
Message-ID: <20250707165155.581579-5-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Liontron H-A133L board features an Ethernet controller with a
JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.

Note that the reset pin must be handled as a bus-wide reset GPIO in
order to let the MDIO core properly reset it before trying to read
its identification registers. There's no other device on the MDIO bus.

The datasheet of the PHY mentions that the reset signal must be held
for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
be on the safe side without wasting too much time during boot.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
index fe77178d3e33..90a50910f07b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -65,6 +65,25 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii0_pins>;
+	phy-handle = <&rmii_phy>;
+	phy-mode = "rmii";
+	status = "okay";
+};
+
+&mdio0 {
+	reset-gpios = <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
+	reset-delay-us = <2000>;
+	reset-post-delay-us = <2000>;
+
+	rmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdc1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
-- 
2.49.0

