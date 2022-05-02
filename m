Received: from devbox.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF2160
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 00:00:35 +0000 (UTC)
Received: from devbox.fabmicro.ru (localhost [127.0.0.1])
	by devbox.fabmicro.ru (8.15.2/8.15.2/Debian-10) with ESMTP id 242NwKAl017516;
	Mon, 2 May 2022 23:58:21 GMT
Received: (from rz@localhost)
	by devbox.fabmicro.ru (8.15.2/8.15.2/Submit) id 242NwJOQ017515;
	Mon, 2 May 2022 23:58:19 GMT
From: Ruslan Zalata <rz@fabmicro.ru>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ruslan Zalata <rz@fabmicro.ru>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v3] hwmon: (sun4i-lradc) Add driver for LRADC found on Allwinner A13/A20 SoC
Date: Mon,  2 May 2022 23:58:09 +0000
Message-Id: <20220502235813.17496-1-rz@fabmicro.ru>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Allwinner SoCs like A13, A20 or T2 are equipped with two-channel
low rate (6 bit) ADC that is often used for extra keys. There's a driver
for that already implementing standard input device, but it has these
limitations: 1) it cannot be used for general ADC data acquisition, and
2) it uses only one LRADC channel of two available.

This driver provides basic hwmon interface to both channels of LRADC on
such Allwinner SoCs.

Signed-off-by: Ruslan Zalata <rz@fabmicro.ru>
---
 Documentation/hwmon/index.rst             |   1 +
 Documentation/hwmon/sun4i-lradc-hwmon.rst |  36 +++
 MAINTAINERS                               |   6 +
 drivers/hwmon/Kconfig                     |  13 +
 drivers/hwmon/Makefile                    |   1 +
 drivers/hwmon/sun4i-lradc-hwmon.c         | 327 ++++++++++++++++++++++
 6 files changed, 384 insertions(+)
 create mode 100644 Documentation/hwmon/sun4i-lradc-hwmon.rst
 create mode 100644 drivers/hwmon/sun4i-lradc-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 863b7628915..a02d62261ae 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -189,6 +189,7 @@ Hardware Monitoring Kernel Drivers
    smsc47m1
    sparx5-temp
    stpddc60
+   sun4i-lradc-hwmon
    sy7636a-hwmon
    tc654
    tc74
diff --git a/Documentation/hwmon/sun4i-lradc-hwmon.rst b/Documentation/hwmon/sun4i-lradc-hwmon.rst
new file mode 100644
index 00000000000..7bf16dd9dea
--- /dev/null
+++ b/Documentation/hwmon/sun4i-lradc-hwmon.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver for sun4i LRADC
+=============================
+
+Supported chips:
+
+  * Allwinner A10/A13/A20
+
+    Prefix: 'sun4i-lradc'
+
+    Datasheet: https://raw.githubusercontent.com/allwinner-zh/documents/master/A20/A20_Datasheet_v1.5_20150510.pdf
+
+Author: Ruslan Zalata
+
+Description
+-----------
+
+This driver implements hwmon interface for low resolution ADC (LRADC) found
+in some Allwinner SoCs. LRADC has two channels with the resolution of 6 bits
+each and is mostly used in tables for extra keys. This driver allows to use
+LRADC as a general purpose ADC to measure input voltage from 0 to 2V.
+
+LRADC hardware does not provide conversion ready bit, but it can be configured
+to generate hardware interrupts continuously, raising a set of flags depending
+on configured events. It is possible to catch general data conversion ready
+event for both channels.
+
+LRADC can be configured to one of the four sampling rates: 31.25Hz, 62.5Hz,
+125.0Hz and 250Hz, which can be set using update_interval chip option (in ms).
+
+Voltage sensors (also known as IN sensors) report their values in milivolts.
+
+This driver is not compatible with drivers/input/keyboard/sun4i-lradc-keys
+which provides keyboard input interface based on this same LRADC hardware, so
+only one of the drivers must be enabled at a time.
diff --git a/MAINTAINERS b/MAINTAINERS
index 5e8c2f61176..d9c71e94133 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18861,6 +18861,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
 F:	drivers/input/keyboard/sun4i-lradc-keys.c
 
+SUN4I LOW RES ADC HWMON DRIVER
+M:	Ruslan Zalata <rz@fabmicro.ru>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/sun4i-lradc-hwmon.c
+
 SUNDANCE NETWORK DRIVER
 M:	Denis Kirjanov <kda@linux-powerpc.org>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 68a8a27ab3b..a44c4bf28ba 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1691,6 +1691,19 @@ config SENSORS_SIS5595
 	  This driver can also be built as a module. If so, the module
 	  will be called sis5595.
 
+config SENSORS_SUN4I_LRADC
+	tristate "Allwinner A13/A20 LRADC hwmon"
+	depends on ARCH_SUNXI && !KEYBOARD_SUN4I_LRADC
+	help
+	  Say y here to support the LRADC found in Allwinner A13/A20 SoCs.
+	  Both channels are supported.
+
+	  This driver can also be built as module. If so, the module
+	  will be called sun4i-lradc-hwmon.
+
+	  This option is not compatible with KEYBOARD_SUN4I_LRADC, only one
+	  of these must be used at a time.
+
 config SENSORS_SY7636A
 	tristate "Silergy SY7636A"
 	help
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 8a03289e2aa..3e5dc902acf 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
+obj-$(CONFIG_SENSORS_SUN4I_LRADC) += sun4i-lradc-hwmon.o
 obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
 obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
 obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
diff --git a/drivers/hwmon/sun4i-lradc-hwmon.c b/drivers/hwmon/sun4i-lradc-hwmon.c
new file mode 100644
index 00000000000..9337eaf3474
--- /dev/null
+++ b/drivers/hwmon/sun4i-lradc-hwmon.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Allwinner sun4i (A13/A20) LRADC hwmon driver
+ *
+ * Copyright (C) 2022 Fabmicro, LLC., Tyumen, Russia.
+ * Copyright (C) 2022 Ruslan Zalata <rz@fabmicro.ru>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/util_macros.h>
+
+#define LRADC_CTRL	0x00
+#define LRADC_INTC	0x04
+#define LRADC_INTS	0x08
+#define LRADC_DATA0	0x0c
+#define LRADC_DATA1	0x10
+
+/* LRADC_CTRL bits */
+#define FIRST_CONVERT_DLY(x)	((x) << 24) /* 8 bits */
+#define CHAN_SELECT(x)		((x) << 22) /* 2 bits */
+#define CONTINUE_TIME_SEL(x)	((x) << 16) /* 4 bits */
+#define KEY_MODE_SEL(x)		((x) << 12) /* 2 bits */
+#define LEVELA_B_CNT(x)		((x) << 8)  /* 4 bits */
+#define HOLD_KEY_EN(x)		((x) << 7)
+#define HOLD_EN(x)		((x) << 6)
+#define LEVELB_VOL(x)		((x) << 4)  /* 2 bits */
+#define SAMPLE_RATE(x)		((x) << 2)  /* 2 bits */
+#define ENABLE(x)		((x) << 0)
+
+/* LRADC_INTC and LRADC_INTS bits */
+#define CHAN1_KEYUP_IRQ		BIT(12)
+#define CHAN1_ALRDY_HOLD_IRQ	BIT(11)
+#define CHAN1_HOLD_IRQ		BIT(10)
+#define CHAN1_KEYDOWN_IRQ	BIT(9)
+#define CHAN1_DATA_IRQ		BIT(8)
+#define CHAN0_KEYUP_IRQ		BIT(4)
+#define CHAN0_ALRDY_HOLD_IRQ	BIT(3)
+#define CHAN0_HOLD_IRQ		BIT(2)
+#define CHAN0_KEYDOWN_IRQ	BIT(1)
+#define CHAN0_DATA_IRQ		BIT(0)
+
+#define	LRADC_DEFAULT_RATE	3 /* 31.25 samples/sec */
+
+static const struct hwmon_chip_info sun4i_a10_lradc_chip_info;
+static const struct hwmon_chip_info sun8i_a83t_lradc_chip_info;
+
+struct lradc_variant {
+	u32 bits;
+	u32 resolution;
+	u32 vref;
+	u32 num_sample_times;
+	u32 *sample_times;
+	const struct hwmon_chip_info *chip_info;
+};
+
+struct sun4i_lradc_data {
+	void __iomem *base;
+	const struct lradc_variant *variant;
+	u32 in[2];
+	u32 rate;	/* current sample rate index */
+};
+
+static const struct hwmon_channel_info *sun4i_a10_lradc_chan_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT, HWMON_I_INPUT),
+	NULL
+};
+
+static const struct hwmon_channel_info *sun8i_a83t_lradc_chan_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT),
+	NULL
+};
+
+static u32 sun4i_a10_lradc_sample_times[] = {4, 8, 16, 32}; /* in ms */
+
+struct lradc_variant sun4i_a10_lradc_variant = {
+	.bits = 0x3f,
+	.resolution = 63,
+	.vref = 2000000, /* Vref = 2.0V from SoC datasheet */
+	.sample_times = sun4i_a10_lradc_sample_times,
+	.num_sample_times = ARRAY_SIZE(sun4i_a10_lradc_sample_times),
+	.chip_info = &sun4i_a10_lradc_chip_info,
+};
+
+struct lradc_variant sun8i_a83t_lradc_variant = {
+	.bits = 0x3f,
+	.resolution = 63,
+	.vref = 1350000, /* Vref = 1.35V from SoC datasheet */
+	.sample_times = sun4i_a10_lradc_sample_times,
+	.num_sample_times = ARRAY_SIZE(sun4i_a10_lradc_sample_times),
+	.chip_info = &sun8i_a83t_lradc_chip_info,
+};
+
+static int sun4i_lradc_start(struct sun4i_lradc_data *lradc)
+{
+	writel(FIRST_CONVERT_DLY(2) | CHAN_SELECT(3) | LEVELA_B_CNT(1) |
+		HOLD_EN(1) | KEY_MODE_SEL(2) | SAMPLE_RATE(lradc->rate) | ENABLE(1),
+		lradc->base + LRADC_CTRL);
+
+	writel(CHAN0_DATA_IRQ | CHAN1_DATA_IRQ, lradc->base + LRADC_INTC);
+
+	return 0;
+}
+
+static void sun4i_lradc_stop(void *data)
+{
+	struct sun4i_lradc_data *lradc = (struct sun4i_lradc_data *)data;
+
+	writel(FIRST_CONVERT_DLY(2) | LEVELA_B_CNT(1) | HOLD_EN(1),
+	       lradc->base + LRADC_CTRL);
+	writel(0, lradc->base + LRADC_INTC);
+}
+
+static int sun4i_lradc_update_interval(struct device *dev, long val)
+{
+	struct sun4i_lradc_data *lradc = dev_get_drvdata(dev);
+
+	sun4i_lradc_stop(lradc);
+
+	lradc->rate = find_closest(val, lradc->variant->sample_times,
+				   (int)lradc->variant->num_sample_times);
+
+	return sun4i_lradc_start(lradc);
+}
+
+static int sun4i_lradc_write(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return sun4i_lradc_update_interval(dev, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int sun4i_lradc_read(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long *val)
+{
+	struct sun4i_lradc_data *lradc = dev_get_drvdata(dev);
+	u8 rate;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			rate = (readl(lradc->base + LRADC_CTRL) >> 2) & 0x3;
+			*val = lradc->variant->sample_times[rate];
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			*val = lradc->in[channel];
+			break;
+
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+umode_t sun4i_lradc_is_visible(const void *data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		return 0444;
+	case hwmon_chip:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static irqreturn_t sun4i_lradc_irq(int irq, void *dev_id)
+{
+	struct sun4i_lradc_data *lradc = dev_id;
+	u32 ints = readl(lradc->base + LRADC_INTS);
+
+	if (ints & CHAN0_DATA_IRQ)
+		lradc->in[0] = (readl(lradc->base + LRADC_DATA0) & lradc->variant->bits) *
+			lradc->variant->vref / lradc->variant->resolution / 1000; /* to mV */
+
+	if (ints & CHAN1_DATA_IRQ)
+		lradc->in[1] = (readl(lradc->base + LRADC_DATA1) & lradc->variant->bits) *
+			lradc->variant->vref / lradc->variant->resolution / 1000; /* to mV */
+
+	writel(ints, lradc->base + LRADC_INTS);
+
+	return IRQ_HANDLED;
+}
+
+static int sun4i_lradc_probe(struct platform_device *pdev)
+{
+	struct sun4i_lradc_data *lradc;
+	struct device *dev = &pdev->dev;
+	struct device *hwmon_dev;
+	struct resource *res;
+	int hwmon_irq, error;
+
+	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), GFP_KERNEL);
+	if (!lradc)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, lradc);
+
+	lradc->variant = of_device_get_match_data(&pdev->dev);
+	if (!lradc->variant)
+		return -EINVAL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR(res))
+		return PTR_ERR(res);
+
+	lradc->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(lradc->base))
+		return PTR_ERR(lradc->base);
+
+	hwmon_irq = platform_get_irq(pdev, 0);
+	if (hwmon_irq < 0)
+		return hwmon_irq;
+
+	error = devm_request_irq(dev, hwmon_irq, sun4i_lradc_irq, 0, "sun4i-lradc-hwmon", lradc);
+	if (error) {
+		dev_err(dev, "sun4i-lradc-hwmon IRQ failed err=%d\n", error);
+		return error;
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "lradc-hwmon", lradc,
+							 lradc->variant->chip_info, NULL);
+
+	if (IS_ERR(hwmon_dev)) {
+		error = PTR_ERR(hwmon_dev);
+		return error;
+	}
+
+	error = devm_add_action_or_reset(dev, sun4i_lradc_stop, lradc);
+	if (error)
+		return error;
+
+	lradc->rate = LRADC_DEFAULT_RATE;
+
+	error = sun4i_lradc_start(lradc);
+
+	return error;
+}
+
+static int sun4i_lradc_resume(struct device *dev)
+{
+	struct sun4i_lradc_data *lradc = dev_get_drvdata(dev);
+
+	return sun4i_lradc_start(lradc);
+}
+
+static int sun4i_lradc_suspend(struct device *dev)
+{
+	struct sun4i_lradc_data *lradc = dev_get_drvdata(dev);
+
+	sun4i_lradc_stop(lradc);
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(sun4i_lradc_dev_pm_ops, sun4i_lradc_suspend,
+				sun4i_lradc_resume);
+
+static const struct hwmon_ops sun4i_lradc_hwmon_ops = {
+	.is_visible = sun4i_lradc_is_visible,
+	.read = sun4i_lradc_read,
+	.write = sun4i_lradc_write,
+};
+
+static const struct hwmon_chip_info sun4i_a10_lradc_chip_info = {
+	.ops = &sun4i_lradc_hwmon_ops,
+	.info = sun4i_a10_lradc_chan_info,
+};
+
+static const struct hwmon_chip_info sun8i_a83t_lradc_chip_info = {
+	.ops = &sun4i_lradc_hwmon_ops,
+	.info = sun8i_a83t_lradc_chan_info,
+};
+
+static const struct of_device_id sun4i_lradc_of_match[] = {
+	{ .compatible = "allwinner,sun4i-a10-lradc-keys", .data = &sun4i_a10_lradc_variant},
+	{ .compatible = "allwinner,sun8i-a83t-r-lradc", .data = &sun8i_a83t_lradc_variant},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sun4i_lradc_of_match);
+
+static struct platform_driver sun4i_lradc_driver = {
+	.driver = {
+		.name	= "sun4i-lradc-hwmon",
+		.of_match_table = of_match_ptr(sun4i_lradc_of_match),
+		.pm = pm_sleep_ptr(&sun4i_lradc_dev_pm_ops),
+	},
+	.probe	= sun4i_lradc_probe,
+};
+
+module_platform_driver(sun4i_lradc_driver);
+
+MODULE_DESCRIPTION("Allwinner A13/A20 LRADC hwmon driver");
+MODULE_AUTHOR("Ruslan Zalata <rz@fabmicro.ru>");
+MODULE_LICENSE("GPL");
+
-- 
2.36.0

