Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44426A004
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Mar 2024 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711709165; cv=none; b=gc+bZDjY4Wox6L4L8RUb/A0Ni58oBweplVPZ5TvCdcpuMErPYb4ueU24JMfNMq6Y7//VqOA0zncc4WoyssVZb9w2m27Fu0/2Kol3axGBCIIAZzLdisCuDAPtTQ/cMSoD1IzDK29UxX4RICxEokNtXbi8+hpUvpEEc3Xfp0H+0Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711709165; c=relaxed/simple;
	bh=dcszHMnaracdhxvSBDfuI/wuKmQEO7HT5+w0cCoAl4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l+kFerfWfcxmyon3oMeK/aQtaeMkOitN6dIJPOEeyANKpEl3UxcBSymg/1hzs6hPzqTSUKk2nTgW8NEhGSgFDwm/EpSWTAh//x8h0FuMea3eFSxI+fCegbFSWITo5UHvpKr6+hPtQJesALQxY3E4BBifj9/UJer3Rkg6yLKxEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FDD612FC;
	Fri, 29 Mar 2024 03:39:12 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3C0D3F64C;
	Fri, 29 Mar 2024 03:38:37 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: h616: Fix I2C0 pins
Date: Fri, 29 Mar 2024 10:38:25 +0000
Message-Id: <20240329103825.25463-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we specify the pins for the I2C0 function as PI6 and PI7, even
though they are actually PI5 and PI6. Linux' pinctrl driver and the H616
user manual confirm this.

Fix the pin names in the pins property. None of the existing DTs in the
tree seems to use I2C0, which explains why this went unnoticed.

Fixes: 0d17c8651188 ("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index f756a396ea3da..95f09204337f0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -227,7 +227,7 @@ ext_rgmii_pins: rgmii-pins {
 			};
 
 			i2c0_pins: i2c0-pins {
-				pins = "PI6", "PI7";
+				pins = "PI5", "PI6";
 				function = "i2c0";
 			};
 
-- 
2.35.8

