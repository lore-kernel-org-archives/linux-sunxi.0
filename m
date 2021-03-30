Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D372C71
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 13:01:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DF61101E;
	Tue, 30 Mar 2021 06:01:41 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D69573F694;
	Tue, 30 Mar 2021 06:01:39 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] sunxi: dts: H616: Drop reserved-memory node
Date: Tue, 30 Mar 2021 14:01:22 +0100
Message-Id: <20210330130122.3915-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210330130122.3915-1-andre.przywara@arm.com>
References: <20210330130122.3915-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Trusted Firmware now adds the /reserved-memory subnode to the DT at
runtime[1], putting in the right values.

Drop our hard-coded version, as this might clash with the actual values
(which have also changed), and rely on TF-A to add the node.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7770

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/sun50i-h616.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/dts/sun50i-h616.dtsi b/arch/arm/dts/sun50i-h616.dtsi
index 953e8fac20f..dd4d2f31111 100644
--- a/arch/arm/dts/sun50i-h616.dtsi
+++ b/arch/arm/dts/sun50i-h616.dtsi
@@ -51,18 +51,6 @@
 		};
 	};
 
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		/* 512KiB reserved for ARM Trusted Firmware (BL31) */
-		secmon_reserved: secmon@40000000 {
-			reg = <0x0 0x40000000 0x0 0x80000>;
-			no-map;
-		};
-	};
-
 	osc24M: osc24M_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
-- 
2.17.5

