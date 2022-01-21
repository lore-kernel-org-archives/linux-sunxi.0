Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEDC2C9C
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jan 2022 13:37:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AFEA113E;
	Fri, 21 Jan 2022 05:37:39 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55F013F766;
	Fri, 21 Jan 2022 05:37:38 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chris Morgan <macromorgan@hotmail.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 1/2] pmic: axp: define ALDO_IN startup bit
Date: Fri, 21 Jan 2022 13:37:31 +0000
Message-Id: <20220121133732.2397273-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121133732.2397273-1-andre.przywara@arm.com>
References: <20220121133732.2397273-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most AXP PMICs feature a "startup source" register, which keeps
information about how the PMIC started operation. Bit 0 in there means
it has been started by "plugging in the power cable".

Define a symbol in each PMIC's header file to be able to use that
register and bit later on.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 include/axp152.h | 2 ++
 include/axp209.h | 3 ++-
 include/axp221.h | 3 ++-
 include/axp305.h | 3 +++
 include/axp809.h | 3 ++-
 include/axp818.h | 3 ++-
 6 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/axp152.h b/include/axp152.h
index 10d845fec4..bac6526a36 100644
--- a/include/axp152.h
+++ b/include/axp152.h
@@ -16,6 +16,8 @@ enum axp152_reg {
 
 /* For axp_gpio.c */
 #ifdef CONFIG_AXP152_POWER
+#define AXP_POWER_STATUS		0x00
+#define AXP_POWER_STATUS_ALDO_IN		BIT(0)
 #define AXP_GPIO0_CTRL			0x90
 #define AXP_GPIO1_CTRL			0x91
 #define AXP_GPIO2_CTRL			0x92
diff --git a/include/axp209.h b/include/axp209.h
index 30399a8d62..414f88a32c 100644
--- a/include/axp209.h
+++ b/include/axp209.h
@@ -76,7 +76,8 @@ enum axp209_reg {
 /* For axp_gpio.c */
 #ifdef CONFIG_AXP209_POWER
 #define AXP_POWER_STATUS		0x00
-#define AXP_POWER_STATUS_VBUS_PRESENT	BIT(5)
+#define AXP_POWER_STATUS_ALDO_IN		BIT(0)
+#define AXP_POWER_STATUS_VBUS_PRESENT		BIT(5)
 #define AXP_GPIO0_CTRL			0x90
 #define AXP_GPIO1_CTRL			0x92
 #define AXP_GPIO2_CTRL			0x93
diff --git a/include/axp221.h b/include/axp221.h
index a02e9b4f64..8dfcc5b5a2 100644
--- a/include/axp221.h
+++ b/include/axp221.h
@@ -52,7 +52,8 @@
 /* For axp_gpio.c */
 #ifdef CONFIG_AXP221_POWER
 #define AXP_POWER_STATUS		0x00
-#define AXP_POWER_STATUS_VBUS_PRESENT		(1 << 5)
+#define AXP_POWER_STATUS_ALDO_IN		BIT(0)
+#define AXP_POWER_STATUS_VBUS_PRESENT		BIT(5)
 #define AXP_VBUS_IPSOUT			0x30
 #define AXP_VBUS_IPSOUT_DRIVEBUS		(1 << 2)
 #define AXP_MISC_CTRL			0x8f
diff --git a/include/axp305.h b/include/axp305.h
index 225c5040a3..0a42bc6804 100644
--- a/include/axp305.h
+++ b/include/axp305.h
@@ -15,3 +15,6 @@ enum axp305_reg {
 #define AXP305_OUTPUT_CTRL1_DCDCD_EN	(1 << 3)
 
 #define AXP305_POWEROFF			(1 << 7)
+
+#define AXP_POWER_STATUS		0x00
+#define AXP_POWER_STATUS_ALDO_IN		BIT(0)
diff --git a/include/axp809.h b/include/axp809.h
index 430dbef622..8082e402e2 100644
--- a/include/axp809.h
+++ b/include/axp809.h
@@ -46,7 +46,8 @@
 /* For axp_gpio.c */
 #ifdef CONFIG_AXP809_POWER
 #define AXP_POWER_STATUS		0x00
-#define AXP_POWER_STATUS_VBUS_PRESENT		(1 << 5)
+#define AXP_POWER_STATUS_ALDO_IN		BIT(0)
+#define AXP_POWER_STATUS_VBUS_PRESENT		BIT(5)
 #define AXP_VBUS_IPSOUT			0x30
 #define AXP_VBUS_IPSOUT_DRIVEBUS		(1 << 2)
 #define AXP_MISC_CTRL			0x8f
diff --git a/include/axp818.h b/include/axp818.h
index 8bac6b67ca..8ac517a2bf 100644
--- a/include/axp818.h
+++ b/include/axp818.h
@@ -60,7 +60,8 @@
 /* For axp_gpio.c */
 #ifdef CONFIG_AXP818_POWER
 #define AXP_POWER_STATUS		0x00
-#define AXP_POWER_STATUS_VBUS_PRESENT		(1 << 5)
+#define AXP_POWER_STATUS_ALDO_IN		BIT(0)
+#define AXP_POWER_STATUS_VBUS_PRESENT		BIT(5)
 #define AXP_VBUS_IPSOUT			0x30
 #define AXP_VBUS_IPSOUT_DRIVEBUS		(1 << 2)
 #define AXP_MISC_CTRL			0x8f
-- 
2.25.1

