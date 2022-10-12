Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2705328EA
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 16:35:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3557016F3;
	Wed, 12 Oct 2022 09:35:23 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8AB73F766;
	Wed, 12 Oct 2022 09:35:15 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Yifan Gu <me@yifangu.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 5/6] sunxi: f1c100: dtsi: add UART1 pins
Date: Wed, 12 Oct 2022 17:34:57 +0100
Message-Id: <20221012163458.1968900-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221012163458.1968900-1-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The F1Cx00 SoCs connect the first PortA pins to UART1.

Add this to the SoC .dtsi, so boards can reference UART1 pins.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/suniv-f1c100s.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/dts/suniv-f1c100s.dtsi b/arch/arm/dts/suniv-f1c100s.dtsi
index 0edc1724407..bc563c12e95 100644
--- a/arch/arm/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/dts/suniv-f1c100s.dtsi
@@ -175,6 +175,11 @@
 				pins = "PE0", "PE1";
 				function = "uart0";
 			};
+
+			uart1_pa_pins: uart1-pa-pins {
+				pins = "PA2", "PA3";
+				function = "uart1";
+			};
 		};
 
 		timer@1c20c00 {
-- 
2.25.1

