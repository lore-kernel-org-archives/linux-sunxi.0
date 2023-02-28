Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBEC2CA2
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Feb 2023 11:41:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 236A6FEC;
	Tue, 28 Feb 2023 03:42:02 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB2E03F881;
	Tue, 28 Feb 2023 03:41:17 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: h5: OrangePi PC2: add OPP table to enable DVFS
Date: Tue, 28 Feb 2023 11:41:12 +0000
Message-Id: <20230228114112.3340715-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far the OrangePi PC2 board was running at a fixed frequency, set by
U-Boot to 816 MHz, which is the best achievable frequency at the 1.1V
CPU voltage provided by the PMIC at reset.

We already describe the CPU voltage regulator in the DT, but were
missing the OPP table. Just include the default H5 OPP table, as used
by other boards. My OrangePi PC2 runs just fine with those values, and
now goes up to 1.15 GHz.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index b5c1ff19b4c41..ce3ae19e72dbd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -3,6 +3,7 @@
 
 /dts-v1/;
 #include "sun50i-h5.dtsi"
+#include "sun50i-h5-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
-- 
2.25.1

