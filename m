Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104BF3B51
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Mar 2022 14:34:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 999D5ED1;
	Mon,  7 Mar 2022 06:34:40 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2A863F66F;
	Mon,  7 Mar 2022 06:34:38 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 06/14] ARM: dts: suniv: F1C100: fix timer node
Date: Mon,  7 Mar 2022 14:34:13 +0000
Message-Id: <20220307143421.1106209-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307143421.1106209-1-andre.przywara@arm.com>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner F1C100s has three timer instances, each with their own
interrupt line.

Add the missing two interrupts to the DT node, to match the DT binding.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 43d342eaf661..57f8932ef898 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -105,7 +105,7 @@ uart0_pe_pins: uart0-pe-pins {
 		timer@1c20c00 {
 			compatible = "allwinner,suniv-f1c100s-timer";
 			reg = <0x01c20c00 0x90>;
-			interrupts = <13>;
+			interrupts = <13>, <14>, <15>;
 			clocks = <&osc24M>;
 		};
 
-- 
2.25.1

