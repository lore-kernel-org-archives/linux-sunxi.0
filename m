Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1EA18D621
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Oct 2024 22:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728340202; cv=none; b=CfEC0xcm3G1A3eqk8FoeHMkYg71rTbkEHQNCwTFM3ljNGRSVsxF1FjOL0ADI70oE3CxvWLwM9WUPhDqOHQ/Jte++msaSwbYcqnrD5B760YhDavEPZSe/AyqOfTq0+owDpiBC8J4GSvE5fbRSmMmlSjvI6c3a5zH81dATKHCoGPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728340202; c=relaxed/simple;
	bh=AE1OkqHJAIOe8PZdqvr2gHLM4THaTDXFdvUbgVVT0Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/Zph+0MjByCm6dtQzRLZBG6aSbun4IUFbvkL9JhrQJdPaDfEIctYMQ11bFL/eOMWS845nWWz9aR6FqnC4f+PX8x/LObK3I3ZMjM6zKLG4PcwukKD9/nESOasUa74CbNb3kDhgEGPhztIqQ5znlVxWkeUMIMjQbtH5bOKj+VV/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D1B6DA7;
	Mon,  7 Oct 2024 15:30:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3E013F73F;
	Mon,  7 Oct 2024 15:29:58 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
Date: Mon,  7 Oct 2024 23:29:16 +0100
Message-ID: <20241007222916.19013-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DCDC5 voltage rail in the X-Powers AXP809 PMIC has a resolution of
50mV, so the currently enforced limits of 1.475 and 1.525 volts cannot
be set, when the existing regulator value is beyond this range.

This will lead to the whole regulator driver to give up and fail
probing, which in turn will hang the system, as essential devices depend
on the PMIC.
In this case a bug in U-Boot set the voltage to 1.75V (meant for DCDC4),
and the AXP driver's attempt to correct this lead to this error:
==================
[    4.447653] axp20x-rsb sunxi-rsb-3a3: AXP20X driver loaded
[    4.450066] vcc-dram: Bringing 1750000uV into 1575000-1575000uV
[    4.460272] vcc-dram: failed to apply 1575000-1575000uV constraint: -EINVAL
[    4.474788] axp20x-regulator axp20x-regulator.0: Failed to register dcdc5
[    4.482276] axp20x-regulator axp20x-regulator.0: probe with driver axp20x-regulator failed with error -22
==================

Set the limits to values that can be programmed, so any correction will
be successful.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
index c8ca8cb7f5c94..52ad95a2063aa 100644
--- a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
+++ b/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
@@ -280,8 +280,8 @@ reg_dcdc4: dcdc4 {
 
 			reg_dcdc5: dcdc5 {
 				regulator-always-on;
-				regulator-min-microvolt = <1425000>;
-				regulator-max-microvolt = <1575000>;
+				regulator-min-microvolt = <1450000>;
+				regulator-max-microvolt = <1550000>;
 				regulator-name = "vcc-dram";
 			};
 
-- 
2.46.2

