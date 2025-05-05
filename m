Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2B620297D
	for <linux-sunxi@lists.linux.dev>; Mon,  5 May 2025 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746476685; cv=none; b=P3RuZxHz6lxlGNVVOHnPOtZzvg0fJhaP7D+9Wfcu1FqNp5C4OJvCD2jEN09RpXIB0/E5z5WwYJptZ9dXzjIohMvFI2dX+YOhg8Cw9t79UzMMrcRJ1xWtJ0LKNUSLXL0WRA5ElUoYG9Nrbs3/k9/JhuKWVgudf3iJYT/gd+Ml2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746476685; c=relaxed/simple;
	bh=LZ791ZeXfNg+rUEbjt6NyyA6acBDMIH05NFtfeDvWis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3ARVx62OQMf7b1+G4tyKOiq0S9Bgv4Pa/t8Woc60iy4+G3JxjirDc2uWicK1xae+UR7kYuyGfCDNX979Wq076aGyLA41d+MOJhZnpOhmfZ5HMSEw2UmYzYiWB31Stu+laPIUahN2orzJjgUPffNzhtFoaMLvgYY32UqHoEyXg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3C27339;
	Mon,  5 May 2025 13:24:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F9043F673;
	Mon,  5 May 2025 13:24:40 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Philippe Simons <simons.philippe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: allwinner: a100: set maximum MMC frequency
Date: Mon,  5 May 2025 21:24:16 +0100
Message-ID: <20250505202416.23753-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The manual for the Allwinner A133 SoC mentions that the maximum
supported MMC frequency is 150 MHz, for all of the MMC devices.

Describe that in the DT entry, to help drivers setting the right
interface frequency.

Fixes: fcfbb8d9ec58 ("arm64: allwinner: a100: Add MMC related nodes")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

the Linux and FreeBSD kernels limit the MMC bus frequency to 52 MHz,
unless explicitly told otherwise via this property. So this patch
increases the performance of HS-200 eMMC from ~44 MB/s to 129 MB/s.

Cheers,
Andre

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 597c2b82693b0..ecc04be243c01 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -267,6 +267,7 @@ mmc0: mmc@4020000 {
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc0_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -282,6 +283,7 @@ mmc1: mmc@4021000 {
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc1_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -297,6 +299,7 @@ mmc2: mmc@4022000 {
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc2_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.46.3

