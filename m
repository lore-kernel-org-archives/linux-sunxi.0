Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760692E84D
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707479896; cv=none; b=cjmSRHNVmIFBtzU4f813EW1/6bg9vexz1iNVQFjdGr2dP8DhJTvWqN7sK7R1M7KjKBu04Iwlz/Jc4tirR+UKiveYc8Lw9o6S7Sl7dEaVcnluZRQoy3lwl+ZyuDppJ2Q3NiCfjsiTwS5hQGexcsMHRU6pcoNkEupv409n0/4UOCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707479896; c=relaxed/simple;
	bh=gQ+nLYfpUu5s6lbge5aHLYTd2c0WbXCHewWOLFl37vo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QpqQeX23mvtteKreGO432msnLw4ybIHyQ+c8EbBneWa1rgK9R7Dc2jZ2pefF+Kj3E/7e4Otp26xan0YSqWJAbOb5+MjNtbmH/hhAa3SB09RD49uADeJSy+KTNBTB4qVsWOAugVsk4gwbxjWrs58KATt+3RIEeuisq+p2Y+DjCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 243F21570;
	Fri,  9 Feb 2024 03:58:50 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AEAC3F5A1;
	Fri,  9 Feb 2024 03:58:06 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Alilovic <nickalilovic@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes
Date: Fri,  9 Feb 2024 11:57:59 +0000
Message-Id: <20240209115759.3582869-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240209115759.3582869-1-andre.przywara@arm.com>
References: <20240209115759.3582869-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In contrast to other devices using Allwinner SoCs, the Transpeed 8K618-T
TV box uses a mainline supported WiFi chip: it's Broadcom 4335 compatible,
packaged by Murata.

Add the required DT nodes to let DT users know about the SDIO device.
There is an otherwise empty MMC device node, to receive the MAC address,
that firmware might want to write in there.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index 8ea1fd41aebaa..7ec4098e707bf 100644
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

