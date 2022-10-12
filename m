Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9DC28FD
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 16:35:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A80A2165C;
	Wed, 12 Oct 2022 09:35:21 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2836A3F766;
	Wed, 12 Oct 2022 09:35:14 -0700 (PDT)
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
Subject: [PATCH 4/6] sunxi: f1c100: add UART1 support
Date: Wed, 12 Oct 2022 17:34:56 +0100
Message-Id: <20221012163458.1968900-5-andre.przywara@arm.com>
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

Some boards use UART1 for its debug UART, so define the pins for the SPL
and the pinmux name and mux value for U-Boot proper.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/board.c           | 4 ++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 62bb40b8c89..77216157908 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -147,6 +147,10 @@ static int gpio_init(void)
 	sunxi_gpio_set_cfgpin(SUNXI_GPH(12), SUN9I_GPH_UART0);
 	sunxi_gpio_set_cfgpin(SUNXI_GPH(13), SUN9I_GPH_UART0);
 	sunxi_gpio_set_pull(SUNXI_GPH(13), SUNXI_GPIO_PULL_UP);
+#elif CONFIG_CONS_INDEX == 2 && defined(CONFIG_MACH_SUNIV)
+	sunxi_gpio_set_cfgpin(SUNXI_GPA(2), SUNIV_GPE_UART0);
+	sunxi_gpio_set_cfgpin(SUNXI_GPA(3), SUNIV_GPE_UART0);
+	sunxi_gpio_set_pull(SUNXI_GPA(3), SUNXI_GPIO_PULL_UP);
 #elif CONFIG_CONS_INDEX == 2 && defined(CONFIG_MACH_SUN5I)
 	sunxi_gpio_set_cfgpin(SUNXI_GPG(3), SUN5I_GPG_UART1);
 	sunxi_gpio_set_cfgpin(SUNXI_GPG(4), SUN5I_GPG_UART1);
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 9ce2bc1b3af..061104be056 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -245,6 +245,7 @@ static const struct sunxi_pinctrl_function suniv_f1c100s_pinctrl_functions[] = {
 #else
 	{ "uart0",	5 },	/* PE0-PE1 */
 #endif
+	{ "uart1",	5 },	/* PA0-PA3 */
 };
 
 static const struct sunxi_pinctrl_desc __maybe_unused suniv_f1c100s_pinctrl_desc = {
-- 
2.25.1

