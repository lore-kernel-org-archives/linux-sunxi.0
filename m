Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C52FB2
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:05 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935450tu1vupnp
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:49 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: D3UHUp6hov6xQ4H0cwSdLLLtF5QTvs0CHg13CRJ1T2NyjUX9gkyuU83xnplTQ
	b+2WsTu16WX5uWvaTFDPR+vS70LnEhvZ3FdoHaIkLrAsIwFP4/6jmxDpCKghQxnWkl3Vk3d
	cyqBPEOa7MWZCb4VOEHvQjd2B55gq1gGhyNEyhZdB10iwctO7qfMVeopB3owDJghRhv+Pc0
	yNzh/3yrGHiOLljjv4tOtElZB4Y38heYhC23n2iWRCTlSBbhLTfcW/CYyH9pZdPJgJIRoM+
	Nr5wLXtOcPLZalc1cyPOEEKG5Njw3BkSJYaos60AT9xkRNs44zfxBMy833mZ0s8Lxf4X2GP
	MLtjOQfXjTH3lIu6WY=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 09/13] sunxi: sync R329 CCU binding headers from internal WIP kernel tree
Date: Thu, 22 Jul 2021 14:30:11 +0800
Message-Id: <20210722063015.421923-10-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam1

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 include/dt-bindings/clock/sun50i-r329-ccu.h   | 73 +++++++++++++++++++
 include/dt-bindings/clock/sun50i-r329-r-ccu.h | 32 ++++++++
 include/dt-bindings/reset/sun50i-r329-ccu.h   | 45 ++++++++++++
 include/dt-bindings/reset/sun50i-r329-r-ccu.h | 23 ++++++
 4 files changed, 173 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun50i-r329-ccu.h
 create mode 100644 include/dt-bindings/clock/sun50i-r329-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-r329-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-r329-r-ccu.h

diff --git a/include/dt-bindings/clock/sun50i-r329-ccu.h b/include/dt-bindings/clock/sun50i-r329-ccu.h
new file mode 100644
index 0000000000..769a40a175
--- /dev/null
+++ b/include/dt-bindings/clock/sun50i-r329-ccu.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Sipeed
+ */
+
+#ifndef _DT_BINDINGS_CLK_SUN50I_R329_CCU_H_
+#define _DT_BINDINGS_CLK_SUN50I_R329_CCU_H_
+
+#define CLK_CPUX		1
+
+#define CLK_APB1		5
+
+#define CLK_CE			7
+#define CLK_BUS_CE		8
+#define CLK_AIPU		9
+#define CLK_BUS_VE		10
+#define CLK_BUS_DMA		11
+#define CLK_BUS_MSGBOX		12
+#define CLK_BUS_SPINLOCK	13
+#define CLK_BUS_HSTIMER		14
+#define CLK_AVS			15
+#define CLK_BUS_DBG		16
+#define CLK_BUS_PWM		17
+
+#define CLK_MBUS_DMA		19
+#define CLK_MBUS_CE		20
+#define CLK_MBUS_NAND		21
+#define CLK_MBUS_CSI		22
+#define CLK_MBUS_ISP		23
+
+#define CLK_NAND0		25
+#define CLK_NAND1		26
+#define CLK_BUS_NAND		27
+#define CLK_MMC0		28
+#define CLK_MMC1		29
+#define CLK_BUS_MMC0		30
+#define CLK_BUS_MMC1		31
+#define CLK_BUS_UART0		32
+#define CLK_BUS_UART1		33
+#define CLK_BUS_UART2		34
+#define CLK_BUS_UART3		35
+#define CLK_BUS_I2C0		36
+#define CLK_BUS_I2C1		37
+#define CLK_BUS_SCR		38
+#define CLK_SPI0		39
+#define CLK_SPI1		40
+#define CLK_BUS_SPI0		41
+#define CLK_BUS_SPI1		42
+#define CLK_EMAC_25M_DIV	43
+#define CLK_EMAC_25M		44
+#define CLK_BUS_EMAC		45
+#define CLK_IR_RX		46
+#define CLK_BUS_IR_RX		47
+#define CLK_IR_TX		48
+#define CLK_BUS_IR_TX		49
+#define CLK_I2S0		50
+#define CLK_I2S1		51
+#define CLK_BUS_I2S0		52
+#define CLK_BUS_I2S1		53
+#define CLK_SPDIF		54
+#define CLK_BUS_SPDIF		55
+#define CLK_USB_OHCI0		56
+#define CLK_USB_PHY0		57
+#define CLK_USB_OHCI1		58
+#define CLK_USB_PHY1		59
+#define CLK_BUS_OHCI0		60
+#define CLK_BUS_OHCI1		61
+#define CLK_BUS_EHCI0		62
+#define CLK_BUS_OTG		63
+#define CLK_LEDC		64
+#define CLK_BUS_LEDC		65
+
+#endif /* _DT_BINDINGS_CLK_SUN50I_R329_CCU_H_ */
diff --git a/include/dt-bindings/clock/sun50i-r329-r-ccu.h b/include/dt-bindings/clock/sun50i-r329-r-ccu.h
new file mode 100644
index 0000000000..2044d25383
--- /dev/null
+++ b/include/dt-bindings/clock/sun50i-r329-r-ccu.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Sipeed
+ */
+
+#ifndef _DT_BINDINGS_CLK_SUN50I_R329_R_CCU_H_
+#define _DT_BINDINGS_CLK_SUN50I_R329_R_CCU_H_
+
+#define CLK_R_APB1		12
+
+#define CLK_R_BUS_GPADC		14
+#define CLK_R_BUS_THS		15
+#define CLK_R_PWM		16
+#define CLK_R_BUS_PWM		17
+#define CLK_R_CODEC_ADC		18
+#define CLK_R_CODEC_DAC		19
+#define CLK_R_BUS_CODEC		20
+#define CLK_R_DMIC		21
+#define CLK_R_BUS_DMIC		22
+#define CLK_R_BUS_LRADC		23
+#define CLK_R_I2S		24
+#define CLK_R_I2S_ASRC		25
+#define CLK_R_BUS_I2S		26
+#define CLK_R_BUS_UART		27
+#define CLK_R_BUS_I2C		28
+#define CLK_R_IR		29
+#define CLK_R_BUS_IR		30
+#define CLK_R_BUS_MSGBOX	31
+#define CLK_R_BUS_SPINLOCK	32
+#define CLK_R_BUS_RTC		33
+
+#endif /* _DT_BINDINGS_CLK_SUN50I_R329_R_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun50i-r329-ccu.h b/include/dt-bindings/reset/sun50i-r329-ccu.h
new file mode 100644
index 0000000000..bb704a8244
--- /dev/null
+++ b/include/dt-bindings/reset/sun50i-r329-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2021 Sipeed
+ */
+
+#ifndef _DT_BINDINGS_RST_SUN50I_R329_CCU_H_
+#define _DT_BINDINGS_RST_SUN50I_R329_CCU_H_
+
+#define RST_MBUS		0
+#define RST_BUS_CE		1
+#define RST_BUS_AIPU		2
+#define RST_BUS_DMA		3
+#define RST_BUS_MSGBOX		4
+#define RST_BUS_SPINLOCK	5
+#define RST_BUS_HSTIMER		6
+#define RST_BUS_DBG		7
+#define RST_BUS_PWM		8
+#define RST_BUS_DRAM		9
+#define RST_BUS_NAND		10
+#define RST_BUS_MMC0		11
+#define RST_BUS_MMC1		12
+#define RST_BUS_UART0		13
+#define RST_BUS_UART1		14
+#define RST_BUS_UART2		15
+#define RST_BUS_UART3		16
+#define RST_BUS_I2C0		17
+#define RST_BUS_I2C1		18
+#define RST_BUS_SCR		19
+#define RST_BUS_SPI0		20
+#define RST_BUS_SPI1		21
+#define RST_BUS_EMAC		22
+#define RST_BUS_IR_RX		23
+#define RST_BUS_IR_TX		24
+#define RST_BUS_I2S0		25
+#define RST_BUS_I2S1		26
+#define RST_BUS_SPDIF		27
+#define RST_USB_PHY0		28
+#define RST_USB_PHY1		29
+#define RST_BUS_OHCI0		30
+#define RST_BUS_OHCI1		31
+#define RST_BUS_EHCI0		32
+#define RST_BUS_OTG		33
+#define RST_BUS_LEDC		34
+
+#endif /* _DT_BINDINGS_RST_SUN50I_R329_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun50i-r329-r-ccu.h b/include/dt-bindings/reset/sun50i-r329-r-ccu.h
new file mode 100644
index 0000000000..e65a317afb
--- /dev/null
+++ b/include/dt-bindings/reset/sun50i-r329-r-ccu.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2021 Sipeed
+ */
+
+#ifndef _DT_BINDINGS_RST_SUN50I_R329_R_CCU_H_
+#define _DT_BINDINGS_RST_SUN50I_R329_R_CCU_H_
+
+#define RST_R_BUS_GPADC		0
+#define RST_R_BUS_THS		1
+#define RST_R_BUS_PWM		2
+#define RST_R_BUS_CODEC		3
+#define RST_R_BUS_DMIC		4
+#define RST_R_BUS_LRADC		5
+#define RST_R_BUS_I2S		6
+#define RST_R_BUS_UART		7
+#define RST_R_BUS_I2C		8
+#define RST_R_BUS_IR		9
+#define RST_R_BUS_MSGBOX	10
+#define RST_R_BUS_SPINLOCK	11
+#define RST_R_BUS_RTC		12
+
+#endif /* _DT_BINDINGS_RST_SUN50I_R329_R_CCU_H_ */
-- 
2.30.2

