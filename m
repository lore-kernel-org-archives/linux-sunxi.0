Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6649415C0
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 00:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745541330; cv=none; b=Tcl1YTu0JE41hE9MOE7GP8l7rRgIA+5hF67Ozvk9UR66X2sB4wsFu3bmkMrko2iCSJmMkkAi21rsHQ4DXpXOZan/9vDAWTAo00WoDPQjYlsar9Zl4NZ8WZotqQzWHNwCGu3uzAuIFFSl52RJ9NpxWw3i8h9KFHE53GXccXRA2cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745541330; c=relaxed/simple;
	bh=AJkKi/LNWACRtZMEGqi0g3GzmMN6Bcomq9TUZ6Cj0n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BgpEukdD020zw0m4vGyQuXkGzmb5wBcODVFB3gw1AHWvL4EPrGB6LhrrBd0XneQBE+pU4vIoDit0TIsTDPc7/p/z08YSFjfwSW+F+6mixWt+Wycme7iRGeWkVglwCcuaxdw+cWhV8zFRR9l130KtMem2PcZrZg+WDGdJFRTx+MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83D8B1007;
	Thu, 24 Apr 2025 17:35:22 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 484183F5A1;
	Thu, 24 Apr 2025 17:35:26 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
Date: Fri, 25 Apr 2025 01:34:22 +0100
Message-ID: <20250425003422.3465-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trying to use the SD card on the Radxa board revealed that the card
detect wouldn't work as expected (insert not detected). Looking at the
schematic shows that the pull-up resistor is actually not populated
("NC"), and the transistor just pulls the GPIO pin to GND, but it's
floating otherwise.
So using the pull-down flag is definitely wrong, we need the internal
pull up to get a reliable signal. The same is true for the Avaota board
(there is no transistor there, but it's floating in the same way). There
is no schematic for the X96QPro+ board, but experiments show it's the
same behaviour.

So change the GPIO flag for the card detect GPIO property to activate
the pull-up resistor for that pin.

Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E support")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

please let me know if I should split this up into 3 patches, with proper
Fixes: tags, or if you can maybe squash this into the original commits
still?

Cheers,
Andre

 arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts  | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
index 03c9a9ef5adc2..2d2f3af91d05e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
@@ -56,7 +56,7 @@ &ehci1 {
 
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
-	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
 	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index c0bce3f4fa925..59db103546f65 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -56,7 +56,7 @@ &ehci1 {
 
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
-	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
 	bus-width = <4>;
 	disable-wp;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 85a546aecdbe1..dea2acc1849bb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -66,7 +66,7 @@ &ehci1 {
 
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
-	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
 	bus-width = <4>;
 	status = "okay";
 };

base-commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1
-- 
2.46.3

