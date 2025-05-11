Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83535674E
	for <linux-sunxi@lists.linux.dev>; Sun, 11 May 2025 01:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746925820; cv=none; b=jc7+WdUQspB9A8ci7bOWa/1Kfl9MWR+s8AYUiCZZvfiIjWQZ0de+h7o1imq3wbutxnMKxW1ofSUyMBKUSVmbu3LxB1hPuL5msCmhTV6PfpeNH2788y4HwT2j1PwfsTAVxVR+8nB7/9J1vRj278dSf4dEXuHx5vTX7hZz2NSe0Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746925820; c=relaxed/simple;
	bh=SYhuDA8o1s1WmAh9WdONxoEVe1CM2jrjqs2Vx0vDcqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCcTouYCcF7oO1JLUBXwueiuqS0Oh3v7FRXo30z1FGMYDYpe2YjowGX/1Xr2Ehz8ffzG3idBmyjj+Ka5AfGegifpFrxYJplf5PFt8P8/u4zyFJiUNk8xyEQmog0nvIl9XMaXU8DIyS98NfaiKc0kg4pdbpPNw+vYG7plV8h3ThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C48A126A4;
	Sat, 10 May 2025 18:10:06 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D3353F58B;
	Sat, 10 May 2025 18:10:16 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Philippe Simons <simons.philippe@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 4/6] arm64: dts: allwinner: a100: set maximum MMC frequency
Date: Sun, 11 May 2025 02:10:01 +0100
Message-ID: <20250511011003.15654-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250511011003.15654-1-andre.przywara@arm.com>
References: <20250511011003.15654-1-andre.przywara@arm.com>
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
Link: https://patch.msgid.link/20250505202416.23753-1-andre.przywara@arm.com
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 dts/upstream/src/arm64/allwinner/sun50i-a100.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/dts/upstream/src/arm64/allwinner/sun50i-a100.dtsi b/dts/upstream/src/arm64/allwinner/sun50i-a100.dtsi
index f9f6fea03b7..bd366389b23 100644
--- a/dts/upstream/src/arm64/allwinner/sun50i-a100.dtsi
+++ b/dts/upstream/src/arm64/allwinner/sun50i-a100.dtsi
@@ -252,6 +252,7 @@
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc0_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -267,6 +268,7 @@
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc1_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -282,6 +284,7 @@
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc2_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.46.3

