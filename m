Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0966118E14
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Feb 2024 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707039195; cv=none; b=Fy3MYY/Wps4Lff7aXvKR/Udmbr7eZeK4xWipLd7TSXIt9u4h5ZxMxGVLWtkWpEyE7TuMZ1quLCryIijRMJCisFQQRV5/Vtkdl6uHm7ZJ1jCGT5KkQ82vvmvJ5NYGw7i+xRmimXi5G3YuTs7V1sIVTHteAo/JBRl6nmbsfNyYAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707039195; c=relaxed/simple;
	bh=+BGZ3f/1JDK+HMAeBLUm/2ID9Bp5DnPK9JpR1FqymRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QG12ZkXHMBlxgqENgMQ62SkwJ+FvthbUc0m4uo3qWiRkl4SxDnkRyTuVfYZ8RK3yI5aH6yGubm67Gbh6uHeMPkzL+UhEtQNxfs4rdTK7WxqTTkuQgVAmgMiUBfki5tFwjmP+lkyf3F6Fc76i7NBdf0izTvvbmy6xFvzx0InDl/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88BFE113E;
	Sun,  4 Feb 2024 01:33:54 -0800 (PST)
Received: from e110479.fosdem.net (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B8153F738;
	Sun,  4 Feb 2024 01:33:09 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Alilovic <nickalilovic@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes
Date: Sun,  4 Feb 2024 10:32:55 +0100
Message-Id: <20240204093255.148972-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240204093255.148972-1-andre.przywara@arm.com>
References: <20240204093255.148972-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In contrast to other devices using Allwinner SoCs, the Transpeed 8K618-T
TV box uses a mainline supported WiFi chip: it's a Broadcom 4335
compatible, packaged by a company called Murata.
It works nicely with the Linux driver, when providing the respective
firmware files.

Add the required DT nodes to let the kernel find the SDIO device.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index 8ea1fd41aeba..7ec4098e707b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -16,6 +16,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet1 = &sdio_wifi;
 	};
 
 	chosen {
@@ -39,6 +40,15 @@ reg_vcc3v3: vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		pinctrl-0 = <&x32clk_fanout_pin>;
+		pinctrl-names = "default";
+		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
+	};
 };
 
 &ehci0 {
@@ -60,6 +70,19 @@ &mmc0 {
 	status = "okay";
 };
 
+&mmc1 {
+	vmmc-supply = <&reg_dldo1>;
+	vqmmc-supply = <&reg_aldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	sdio_wifi: wifi@1 {
+		reg = <1>;
+	};
+};
+
 &mmc2 {
 	vmmc-supply = <&reg_dldo1>;
 	vqmmc-supply = <&reg_aldo1>;
-- 
2.25.1

