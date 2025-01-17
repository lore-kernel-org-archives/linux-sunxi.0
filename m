Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581ED1E04AC
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 01:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737078435; cv=none; b=ZzwAevmcQN+iPUvNqeYDycWpHVklcqiRuR0pW0/nhChQLJ6GclbpIf5kf43HzDxSgyTDpAsDjxRweZh8jcYBbdfynRnYQ3Jw70QzwAXLb0ep/eFjv1R2hwReHJYU06cXIgt8z2gafL7HjLSLxZollFuZpPz5/LuIyAKo6ttwYFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737078435; c=relaxed/simple;
	bh=oYfH9FNqzDThmcnnaZ4AewokUskLPbnMKIhtPL7C6j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPsuFQUml7nJIVBlZNjlCfZG9ZBGVOHM6GXEX1aPB6aaUjwmgA3hhlOdbaNJjTXA5FJo7x/ACU4k0cAEt0oYr6C7pQQ8KUBqOzHoR+esK3dpGc49lFCd8xvs4+0orIRqZSMHutqnBBfF3MqDcFxlf0+dAg/4ZAiWttt2WafGJ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 081A111FB;
	Thu, 16 Jan 2025 17:47:42 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3491A3F673;
	Thu, 16 Jan 2025 17:47:12 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de,
	Lukasz Majewski <lukma@denx.de>,
	Sean Anderson <seanga2@gmail.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Simon Glass <sjg@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Parthiban <parthiban@linumiz.com>
Subject: [PATCH 5/8] pinctrl: sunxi: add Allwinner A100/A133 pinctrl description
Date: Fri, 17 Jan 2025 01:45:34 +0000
Message-ID: <20250117014537.22513-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20250117014537.22513-1-andre.przywara@arm.com>
References: <20250117014537.22513-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100 SoC has been around for a while, and has now seemingly
been replaced with its close sibling A133.

Add the required mapping between the pinmux group strings and their
respective mux value, as far as used by U-Boot proper. Linux has some
basic (clock and pinctrl) support for a while, so we can build on the
names already used there.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig         | 10 ++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 47 +++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index cbd61795986..65e8192a99a 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -124,6 +124,16 @@ config PINCTRL_SUN50I_H616_R
 	default MACH_SUN50I_H616
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN50I_A100
+	bool "Support for the Allwinner A100/A133 PIO"
+	default MACH_SUN50I_A133
+	select PINCTRL_SUNXI
+
+config PINCTRL_SUN50I_A100_R
+	bool "Support for the Allwinner A100/A133 R-PIO"
+	default MACH_SUN50I_A133
+	select PINCTRL_SUNXI
+
 config PINCTRL_SUN20I_D1
 	bool "Support for the Allwinner D1/R528 PIO"
 	default MACH_SUN8I_R528
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 37ea93715d1..c38edf7d4f5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -774,6 +774,41 @@ static const struct sunxi_pinctrl_desc __maybe_unused sun50i_h616_r_pinctrl_desc
 	.num_banks	= 1,
 };
 
+static const struct sunxi_pinctrl_function sun50i_a100_pinctrl_functions[] = {
+	{ "emac0",	5 },	/* PH0-PH16 */
+	{ "gpio_in",	0 },
+	{ "gpio_out",	1 },
+	{ "mmc0",	2 },	/* PF0-PF5 */
+	{ "mmc1",	2 },	/* PG0-PG5 */
+	{ "mmc2",	3 },	/* PC0-PC16 */
+	{ "spi0",	4 },	/* PC2-PC4, PC7, PC12, PC15-PC16 */
+#if IS_ENABLED(CONFIG_UART0_PORT_F)
+	{ "uart0",	3 },	/* PF2-PF4 */
+#else
+	{ "uart0",	2 },	/* PB9-PB10 */
+#endif
+};
+
+static const struct sunxi_pinctrl_desc __maybe_unused sun50i_a100_pinctrl_desc = {
+	.functions	= sun50i_a100_pinctrl_functions,
+	.num_functions	= ARRAY_SIZE(sun50i_a100_pinctrl_functions),
+	.first_bank	= SUNXI_GPIO_A,
+	.num_banks	= 8,
+};
+
+static const struct sunxi_pinctrl_function sun50i_a100_r_pinctrl_functions[] = {
+	{ "gpio_in",	0 },
+	{ "gpio_out",	1 },
+	{ "s_i2c0",	2 },
+};
+
+static const struct sunxi_pinctrl_desc __maybe_unused sun50i_a100_r_pinctrl_desc = {
+	.functions	= sun50i_a100_r_pinctrl_functions,
+	.num_functions	= ARRAY_SIZE(sun50i_a100_r_pinctrl_functions),
+	.first_bank	= SUNXI_GPIO_L,
+	.num_banks	= 1,
+};
+
 static const struct udevice_id sunxi_pinctrl_ids[] = {
 #ifdef CONFIG_PINCTRL_SUNIV_F1C100S
 	{
@@ -936,6 +971,18 @@ static const struct udevice_id sunxi_pinctrl_ids[] = {
 		.compatible = "allwinner,sun50i-h616-r-pinctrl",
 		.data = (ulong)&sun50i_h616_r_pinctrl_desc,
 	},
+#endif
+#ifdef CONFIG_PINCTRL_SUN50I_A100
+	{
+		.compatible = "allwinner,sun50i-a100-pinctrl",
+		.data = (ulong)&sun50i_a100_pinctrl_desc,
+	},
+#endif
+#ifdef CONFIG_PINCTRL_SUN50I_A100_R
+	{
+		.compatible = "allwinner,sun50i-a100-r-pinctrl",
+		.data = (ulong)&sun50i_a100_r_pinctrl_desc,
+	},
 #endif
 	{}
 };
-- 
2.46.2

