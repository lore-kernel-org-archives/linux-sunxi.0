Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9687622258E
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796624; cv=none; b=S/DFe6T5v3hcApNurW8ylqqe+QrWgJMyMjz6gsP14Ae7O5Gor3OqsFG6B0J19BPktBDeAxreDw/LpnphwVAEDnPZLdBny69HBGu5BICv0+H8XJNncSuVhI94quD6uqcVdhDbBm08rXCYpdl9yVRGwhjVxrAo7AMtZt+IRDaVIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796624; c=relaxed/simple;
	bh=0647fBcTLTekn8ivIcNk2hkhaiIHhuo+fOPixkHnxmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXmf+QC28YFNEiBuAxRDQ/yJX6uCGW2WWRttASqS7+50BeRz3rze9Dr1BrlZZvZuNHDgCJOvpRlQuOXozkWrGgIhp1MZrfhytnjEGGjS5Z6Wti6BU6WjIqTTLVsgJ9UgNgg3q7gGg3tMhd+Jl7hMVUcZDosMbNDBjqGOLcBejFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDB01596;
	Thu, 17 Jul 2025 16:56:54 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 302203F694;
	Thu, 17 Jul 2025 16:57:01 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 08/20] pinctrl: sunxi: add Allwinner A523 pinctrl description
Date: Fri, 18 Jul 2025 00:54:43 +0100
Message-ID: <20250717235455.32528-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250717235455.32528-1-andre.przywara@arm.com>
References: <20250717235455.32528-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new DT pinctrl binding would allow us to read the pinmux values from
the DT, but it is actually easier to just continue with hardcoding the
mux values in the driver, and matching them against the "function" name.

Add the values for the primary and secondary pin controller on the A523.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig         | 10 ++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 50 +++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 65e8192a99a..54314992299 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -139,4 +139,14 @@ config PINCTRL_SUN20I_D1
 	default MACH_SUN8I_R528
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN55I_A523
+	bool "Support for the Allwinner A523 PIO"
+	default MACH_SUN55I_A523
+	select PINCTRL_SUNXI
+
+config PINCTRL_SUN55I_A523_R
+	bool "Support for the Allwinner A523 R-PIO"
+	default MACH_SUN55I_A523
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index c38edf7d4f5..03cfe23aaf8 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -759,6 +759,29 @@ static const struct sunxi_pinctrl_desc __maybe_unused sun50i_h616_pinctrl_desc =
 	.num_banks	= 9,
 };
 
+static const struct sunxi_pinctrl_function sun55i_a523_pinctrl_functions[] = {
+	{ "emac0",	5 },	/* PI0-PI16 */
+	{ "gpio_in",	0 },
+	{ "gpio_out",	1 },
+	{ "mmc0",	2 },	/* PF0-PF5 */
+	{ "mmc1",	2 },	/* PG0-PG5 */
+	{ "mmc2",	3 },	/* PC0-PC16 */
+	{ "spi0",	4 },	/* PC0-PC7, PC15-PC16 */
+#if IS_ENABLED(CONFIG_UART0_PORT_F)
+	{ "uart0",	3 },	/* PF2-PF4 */
+#else
+	{ "uart0",	2 },	/* PH0-PH1 */
+#endif
+	{ "uart1",	2 },	/* PG6-PG7 */
+};
+
+static const struct sunxi_pinctrl_desc __maybe_unused sun55i_a523_pinctrl_desc = {
+	.functions	= sun55i_a523_pinctrl_functions,
+	.num_functions	= ARRAY_SIZE(sun55i_a523_pinctrl_functions),
+	.first_bank	= SUNXI_GPIO_A,
+	.num_banks	= 11,
+};
+
 static const struct sunxi_pinctrl_function sun50i_h616_r_pinctrl_functions[] = {
 	{ "gpio_in",	0 },
 	{ "gpio_out",	1 },
@@ -809,6 +832,21 @@ static const struct sunxi_pinctrl_desc __maybe_unused sun50i_a100_r_pinctrl_desc
 	.num_banks	= 1,
 };
 
+static const struct sunxi_pinctrl_function sun55i_a523_r_pinctrl_functions[] = {
+	{ "gpio_in",	0 },
+	{ "gpio_out",	1 },
+	{ "r_i2c0",	2 },	/* PL0-PL1 */
+	{ "r_spi",	6 },	/* PL10-PL13 */
+	{ "r_uart",	2 },	/* PL2-PL3 */
+};
+
+static const struct sunxi_pinctrl_desc __maybe_unused sun55i_a523_r_pinctrl_desc = {
+	.functions	= sun55i_a523_r_pinctrl_functions,
+	.num_functions	= ARRAY_SIZE(sun55i_a523_r_pinctrl_functions),
+	.first_bank	= SUNXI_GPIO_L,
+	.num_banks	= 2,
+};
+
 static const struct udevice_id sunxi_pinctrl_ids[] = {
 #ifdef CONFIG_PINCTRL_SUNIV_F1C100S
 	{
@@ -983,6 +1021,18 @@ static const struct udevice_id sunxi_pinctrl_ids[] = {
 		.compatible = "allwinner,sun50i-a100-r-pinctrl",
 		.data = (ulong)&sun50i_a100_r_pinctrl_desc,
 	},
+#endif
+#ifdef CONFIG_PINCTRL_SUN55I_A523
+	{
+		.compatible = "allwinner,sun55i-a523-pinctrl",
+		.data = (ulong)&sun55i_a523_pinctrl_desc,
+	},
+#endif
+#ifdef CONFIG_PINCTRL_SUN55I_A523_R
+	{
+		.compatible = "allwinner,sun55i-a523-r-pinctrl",
+		.data = (ulong)&sun55i_a523_r_pinctrl_desc,
+	},
 #endif
 	{}
 };
-- 
2.46.3

