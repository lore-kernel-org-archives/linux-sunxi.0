Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEC6139F
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ABAA14BF;
	Tue,  2 Jan 2024 16:14:36 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 305DF3F5A1;
	Tue,  2 Jan 2024 16:13:49 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 19/19] sunxi: SPL pinmux: rewrite UART setup without #ifdefs
Date: Wed,  3 Jan 2024 00:12:39 +0000
Message-Id: <20240103001239.17482-20-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240103001239.17482-1-andre.przywara@arm.com>
References: <20240103001239.17482-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing SPL UART pinmux setup is using #ifdef's heavily, which
makes it hard to read and even harder to extend.

Replace the #ifdef's with proper C "if" statements, with the help of the
magic IS_ENABLED() macro.

To cover the non-configured case, which is currently handled by
an #error preprocessor directive, create a prototype for a non-existing
function. Replace that #error line with a call to that function, which
will be removed by the compiler and linker in the normal case, but will
cause a linker error otherwise.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/uart_pinmux.c | 240 ++++++++++++++++--------------
 1 file changed, 128 insertions(+), 112 deletions(-)

diff --git a/arch/arm/mach-sunxi/uart_pinmux.c b/arch/arm/mach-sunxi/uart_pinmux.c
index cb4b16f0e37..ba42352fbcf 100644
--- a/arch/arm/mach-sunxi/uart_pinmux.c
+++ b/arch/arm/mach-sunxi/uart_pinmux.c
@@ -15,128 +15,144 @@
 #include <config.h>
 #include <sunxi_gpio.h>
 
-void uart0_portf_pinmux_setup(void)
+/* Non-existing function to trigger speaking link error. */
+void Unsupported_console_number_Please_fix_UART_pin_mux_settings(void);
+
+static void uart0_portf_pinmux_setup(void)
 {
-#if defined(CONFIG_MACH_SUN4I) || \
-    defined(CONFIG_MACH_SUN7I) || \
-    defined(CONFIG_MACH_SUN8I_R40)
-	/* disable GPB22,23 as uart0 tx,rx to avoid conflict */
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(22), SUNXI_GPIO_INPUT);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(23), SUNXI_GPIO_INPUT);
-#endif
-#if defined(CONFIG_MACH_SUN4I) || defined(CONFIG_MACH_SUN5I) || \
-    defined(CONFIG_MACH_SUN7I) || defined(CONFIG_MACH_SUN8I_R40) || \
-    defined(CONFIG_MACH_SUN9I)
-	sunxi_gpio_set_cfgpin(SUNXI_GPF(2), SUNXI_GPF_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPF(4), SUNXI_GPF_UART0);
-#else
-	sunxi_gpio_set_cfgpin(SUNXI_GPF(2), SUN8I_GPF_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPF(4), SUN8I_GPF_UART0);
-#endif
+	if (IS_ENABLED(CONFIG_MACH_SUN4I) || IS_ENABLED(CONFIG_MACH_SUN7I) ||
+	    IS_ENABLED(CONFIG_MACH_SUN8I_R40)) {
+		/* disable GPB22,23 as uart0 tx,rx to avoid conflict */
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(22), SUNXI_GPIO_INPUT);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(23), SUNXI_GPIO_INPUT);
+	}
+
+	if (IS_ENABLED(CONFIG_MACH_SUN4I) || IS_ENABLED(CONFIG_MACH_SUN5I) ||
+	    IS_ENABLED(CONFIG_MACH_SUN7I) || IS_ENABLED(CONFIG_MACH_SUN8I_R40) ||
+	    IS_ENABLED(CONFIG_MACH_SUN9I)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPF(2), SUNXI_GPF_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPF(4), SUNXI_GPF_UART0);
+	} else {
+		sunxi_gpio_set_cfgpin(SUNXI_GPF(2), SUN8I_GPF_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPF(4), SUN8I_GPF_UART0);
+	}
 	sunxi_gpio_set_pull(SUNXI_GPF(4), SUNXI_GPIO_PULL_UP);
 }
 
-void uart0_pinmux_setup(void)
+static void uart0_pinmux_setup(void)
 {
-#if defined(CONFIG_MACH_SUNIV)
-	sunxi_gpio_set_cfgpin(SUNXI_GPE(0), SUNIV_GPE_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPE(1), SUNIV_GPE_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPE(1), SUNXI_GPIO_PULL_UP);
-#elif (defined(CONFIG_MACH_SUN4I) || \
-	 defined(CONFIG_MACH_SUN7I) || \
-	 defined(CONFIG_MACH_SUN8I_R40))
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(22), SUN4I_GPB_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(23), SUN4I_GPB_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPB(23), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN5I)
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(19), SUN5I_GPB_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(20), SUN5I_GPB_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPB(20), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN6I)
-	sunxi_gpio_set_cfgpin(SUNXI_GPH(20), SUN6I_GPH_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPH(21), SUN6I_GPH_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPH(21), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN8I_A33)
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(0), SUN8I_A33_GPB_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(1), SUN8I_A33_GPB_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPB(1), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUNXI_H3_H5)
-	sunxi_gpio_set_cfgpin(SUNXI_GPA(4), SUN8I_H3_GPA_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPA(5), SUN8I_H3_GPA_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPA(5), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN50I)
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(8), SUN50I_GPB_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN50I_GPB_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPB(9), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN50I_H6)
-	sunxi_gpio_set_cfgpin(SUNXI_GPH(0), SUN50I_H6_GPH_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPH(1), SUN50I_H6_GPH_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPH(1), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN50I_H616)
-	sunxi_gpio_set_cfgpin(SUNXI_GPH(0), SUN50I_H616_GPH_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPH(1), SUN50I_H616_GPH_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPH(1), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN8I_A83T)
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN8I_A83T_GPB_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(10), SUN8I_A83T_GPB_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPB(10), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN8I_V3S)
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(8), SUN8I_V3S_GPB_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN8I_V3S_GPB_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPB(9), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN9I)
-	sunxi_gpio_set_cfgpin(SUNXI_GPH(12), SUN9I_GPH_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPH(13), SUN9I_GPH_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPH(13), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN8I_R528)
-	sunxi_gpio_set_cfgpin(SUNXI_GPE(2), 6);
-	sunxi_gpio_set_cfgpin(SUNXI_GPE(3), 6);
-	sunxi_gpio_set_pull(SUNXI_GPE(3), SUNXI_GPIO_PULL_UP);
-#endif
+	if (IS_ENABLED(CONFIG_UART0_PORT_F)) {
+		uart0_portf_pinmux_setup();
+		return;
+	}
+
+	if (IS_ENABLED(CONFIG_MACH_SUNIV)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPE(0), SUNIV_GPE_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPE(1), SUNIV_GPE_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPE(1), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN4I) ||
+		   IS_ENABLED(CONFIG_MACH_SUN7I) ||
+		   IS_ENABLED(CONFIG_MACH_SUN8I_R40)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(22), SUN4I_GPB_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(23), SUN4I_GPB_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPB(23), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN5I)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(19), SUN5I_GPB_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(20), SUN5I_GPB_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPB(20), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN6I)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPH(20), SUN6I_GPH_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPH(21), SUN6I_GPH_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPH(21), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_A33)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(0), SUN8I_A33_GPB_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(1), SUN8I_A33_GPB_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPB(1), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUNXI_H3_H5)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPA(4), SUN8I_H3_GPA_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPA(5), SUN8I_H3_GPA_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPA(5), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN50I)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(8), SUN50I_GPB_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN50I_GPB_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPB(9), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN50I_H6)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPH(0), SUN50I_H6_GPH_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPH(1), SUN50I_H6_GPH_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPH(1), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN50I_H616)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPH(0), SUN50I_H616_GPH_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPH(1), SUN50I_H616_GPH_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPH(1), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_A83T)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN8I_A83T_GPB_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(10), SUN8I_A83T_GPB_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPB(10), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_V3S)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(8), SUN8I_V3S_GPB_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN8I_V3S_GPB_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPB(9), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN9I)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPH(12), SUN9I_GPH_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPH(13), SUN9I_GPH_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPH(13), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPE(2), 6);
+		sunxi_gpio_set_cfgpin(SUNXI_GPE(3), 6);
+		sunxi_gpio_set_pull(SUNXI_GPE(3), SUNXI_GPIO_PULL_UP);
+	} else {
+		Unsupported_console_number_Please_fix_UART_pin_mux_settings();
+	}
 }
 
-void uart1_pinmux_setup(void)
+static void uart1_pinmux_setup(void)
 {
-#if defined(CONFIG_MACH_SUNIV)
-	sunxi_gpio_set_cfgpin(SUNXI_GPA(2), SUNIV_GPE_UART0);
-	sunxi_gpio_set_cfgpin(SUNXI_GPA(3), SUNIV_GPE_UART0);
-	sunxi_gpio_set_pull(SUNXI_GPA(3), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN5I)
-	sunxi_gpio_set_cfgpin(SUNXI_GPG(3), SUN5I_GPG_UART1);
-	sunxi_gpio_set_cfgpin(SUNXI_GPG(4), SUN5I_GPG_UART1);
-	sunxi_gpio_set_pull(SUNXI_GPG(4), SUNXI_GPIO_PULL_UP);
-#elif defined(CONFIG_MACH_SUN8I) && !defined(CONFIG_MACH_SUN8I_R40)
-	sunxi_gpio_set_cfgpin(SUNXI_GPG(6), SUN8I_GPG_UART1);
-	sunxi_gpio_set_cfgpin(SUNXI_GPG(7), SUN8I_GPG_UART1);
-	sunxi_gpio_set_pull(SUNXI_GPG(7), SUNXI_GPIO_PULL_UP);
-#endif
+	if (IS_ENABLED(CONFIG_MACH_SUNIV)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPA(2), SUNIV_GPE_UART0);
+		sunxi_gpio_set_cfgpin(SUNXI_GPA(3), SUNIV_GPE_UART0);
+		sunxi_gpio_set_pull(SUNXI_GPA(3), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN5I)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPG(3), SUN5I_GPG_UART1);
+		sunxi_gpio_set_cfgpin(SUNXI_GPG(4), SUN5I_GPG_UART1);
+		sunxi_gpio_set_pull(SUNXI_GPG(4), SUNXI_GPIO_PULL_UP);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I) &&
+		   !IS_ENABLED(CONFIG_MACH_SUN8I_R40)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPG(6), SUN8I_GPG_UART1);
+		sunxi_gpio_set_cfgpin(SUNXI_GPG(7), SUN8I_GPG_UART1);
+		sunxi_gpio_set_pull(SUNXI_GPG(7), SUNXI_GPIO_PULL_UP);
+	} else {
+		Unsupported_console_number_Please_fix_UART_pin_mux_settings();
+	}
 }
 
 void uart_pinmux_setup(void)
 {
-#if CONFIG_CONS_INDEX == 1
-	uart0_pinmux_setup();
-	return;
-#elif CONFIG_CONS_INDEX == 2
-	uart1_pinmux_setup();
-	return;
-#elif CONFIG_CONS_INDEX == 3 && defined(CONFIG_MACH_SUN8I_H3)
-	sunxi_gpio_set_cfgpin(SUNXI_GPA(0), SUN8I_H3_GPA_UART2);
-	sunxi_gpio_set_cfgpin(SUNXI_GPA(1), SUN8I_H3_GPA_UART2);
-	sunxi_gpio_set_pull(SUNXI_GPA(1), SUNXI_GPIO_PULL_UP);
-#elif CONFIG_CONS_INDEX == 3 && defined(CONFIG_MACH_SUN8I)
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(0), SUN8I_GPB_UART2);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(1), SUN8I_GPB_UART2);
-	sunxi_gpio_set_pull(SUNXI_GPB(1), SUNXI_GPIO_PULL_UP);
-#elif CONFIG_CONS_INDEX == 4 && defined(CONFIG_MACH_SUN8I_R528)
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(6), 7);
-	sunxi_gpio_set_cfgpin(SUNXI_GPB(7), 7);
-	sunxi_gpio_set_pull(SUNXI_GPB(7), SUNXI_GPIO_PULL_UP);
-#elif CONFIG_CONS_INDEX == 5 && defined(CONFIG_MACH_SUN8I)
-	sunxi_gpio_set_cfgpin(SUNXI_GPL(2), SUN8I_GPL_R_UART);
-	sunxi_gpio_set_cfgpin(SUNXI_GPL(3), SUN8I_GPL_R_UART);
-	sunxi_gpio_set_pull(SUNXI_GPL(3), SUNXI_GPIO_PULL_UP);
-#else
-#error Unsupported console port number. Please fix pin mux settings in board.c
-#endif
+	if (CONFIG_CONS_INDEX == 1) {
+		uart0_pinmux_setup();
+		return;
+	}
+	if (CONFIG_CONS_INDEX == 2) {
+		uart1_pinmux_setup();
+		return;
+	}
+	if (CONFIG_CONS_INDEX == 3 && IS_ENABLED(CONFIG_MACH_SUN8I_H3)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPA(0), SUN8I_H3_GPA_UART2);
+		sunxi_gpio_set_cfgpin(SUNXI_GPA(1), SUN8I_H3_GPA_UART2);
+		sunxi_gpio_set_pull(SUNXI_GPA(1), SUNXI_GPIO_PULL_UP);
+	} else if (CONFIG_CONS_INDEX == 3 && IS_ENABLED(CONFIG_MACH_SUN8I)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(0), SUN8I_GPB_UART2);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(1), SUN8I_GPB_UART2);
+		sunxi_gpio_set_pull(SUNXI_GPB(1), SUNXI_GPIO_PULL_UP);
+	} else if (CONFIG_CONS_INDEX == 4 &&
+		   IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(6), 7);
+		sunxi_gpio_set_cfgpin(SUNXI_GPB(7), 7);
+		sunxi_gpio_set_pull(SUNXI_GPB(7), SUNXI_GPIO_PULL_UP);
+	} else if (CONFIG_CONS_INDEX == 5 && IS_ENABLED(CONFIG_MACH_SUN8I)) {
+		sunxi_gpio_set_cfgpin(SUNXI_GPL(2), SUN8I_GPL_R_UART);
+		sunxi_gpio_set_cfgpin(SUNXI_GPL(3), SUN8I_GPL_R_UART);
+		sunxi_gpio_set_pull(SUNXI_GPL(3), SUNXI_GPIO_PULL_UP);
+	} else {
+		Unsupported_console_number_Please_fix_UART_pin_mux_settings();
+	}
 }
-- 
2.35.8

