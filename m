Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F93536D513
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Nov 2025 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764539194; cv=none; b=JS9tCagw37qu9d8MtWZ0C5/+hubFfuGBL+NfVWj4U4sDS4TtDkGcvmhnOfsdk+RDvU1RIfe4Jm2Crs9etsfM6s0XnrwU7gpoIyaOVHFCAqCbgivNsEPf4OhZSNXH/HbzHeYo20BiFhuvYBqHBLkA43CNRnpa5tuNkJYl+uKxcOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764539194; c=relaxed/simple;
	bh=Q0NLqzK/yUf6RX1BIT9SBtpK2a71noB013RWbqVMXI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6CxibBmR7fNTukFkvJqinT8THYUOHoQ4jIlcwCRTfOotNSSIXKWPtxU9hvKkIsk6HlK5efBmIMWBa8I+RhT1PWurSJnOw/GSg+uk+vAQgJk2Cd8di8vwPc8NmJHawkJ6wazV2VgF6+e4vWjrUPlYdKQifK3HEOXVn/EJwMbyKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5EF8B340E31;
	Sun, 30 Nov 2025 21:46:30 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 30 Nov 2025 21:45:18 +0000
Subject: [PATCH v2 09/10] power: pmic: sunxi: add SPL support for the
 AXP318W
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-01-a733-soc-support-v2-9-18bdd4376fad@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
In-Reply-To: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
To: u-boot@lists.denx.de
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Samuel Holland <samuel@sholland.org>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Q0NLqzK/yUf6RX1BIT9SBtpK2a71noB013RWbqVMXI0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBpLLsSM4KdDBJrfaaQogL3mQlyY9VqDEOR/XLPa
 WFxdZKcH0SJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaSy7El8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277VrWD/96o+k+/PUmdZaRhn
 0OBzI41ivEG73lVghMkIcB6NSr/nsrZsnr7WzV3aFyw+kChk3x5MVD4lmoW55hzZ5nNG+ASD1x6
 l1Upt7oQYyXwRuWPv4L5i7MvJ0z4FZ1QEUwiFkj/R0cN5HRXQ8+IfN88ugTFDlHQNGCGDHUb9H4
 s7YgZwVHBcX9vX4N9PvHugxbpaVcpU3nfwWRxjDR3cBmmlxIt0/LeCogD9Cw3dAFs8xoK3jxwpO
 vYvy8Id5a3OdqwydcNkNT3z1K8APXVGNArSsrNKxhhzu5sT3ySX/Jrrif2kH3+i2jfwTFLets2b
 B5WLF+RDbjowJKfKyuVI+E6vhhj2QCEoGf3tI9G9UjJHACf1IFdai7Qj4TT1kklEfIoUO/J4gDx
 Sp5d611naNlKW7NeviIa4LBAaADG6/rWEFdFm0XFTxdJHjKZ4igZkBl7KkSgPYICIsDAjn1uSpW
 LkVsfhMotRVJ6gsYv55lNCjkhZe3QtCX45gLG086TUFLYY/ozaEx+NLtC/YgXq6DCrzfNORo316
 TPeV4kz/6Eax+pdfCHAvoY+g9QaUqAr1LnC8EORMxR0W1iqKXHfGqMX1Zmfv3MG/gDccdjPjuJN
 sEO0upH425qF5d7Lfl1ondaN/g70qsiQxD7Y4TIu/UTaZ6DTTAXNwVGzuornQiWzA0dQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add the descriptions for the DC/DC regulators of the AXP318W, and enable
it when CONFIG_AXP318W_POWER is enabled.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/power/Makefile  |  1 +
 drivers/power/axp_spl.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index 3363191fdc8..1a54898c874 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_AXP152_POWER)	+= axp152.o
 obj-$(CONFIG_AXP209_POWER)	+= axp209.o
 obj-$(CONFIG_AXP305_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP313_POWER)	+= axp_spl.o
+obj-$(CONFIG_AXP318W_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP717_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP809_POWER)	+= axp809.o
 obj-$(CONFIG_AXP818_POWER)	+= axp818.o
diff --git a/drivers/power/axp_spl.c b/drivers/power/axp_spl.c
index 7c51a9b3dfb..790eab8e262 100644
--- a/drivers/power/axp_spl.c
+++ b/drivers/power/axp_spl.c
@@ -67,6 +67,26 @@ static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
 #define AXP_SHUTDOWN_REG	0x1a
 #define AXP_SHUTDOWN_MASK	BIT(7)
 
+#elif defined(CONFIG_AXP318W_POWER)				/* AXP318W */
+
+static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
+	{ 0x10, BIT(0), 0x12, 0x1f, 1000, 3400, 100,  0 },
+	{ 0x10, BIT(1), 0x13, 0x7f, 500,  1540,  10, 70 },
+	{ 0x10, BIT(2), 0x14, 0x7f, 500,  1540,  10, 70 },
+	{ 0x10, BIT(3), 0x15, 0x7f, 500,  1540,  10, 70 },
+	{ 0x10, BIT(4), 0x16, 0x7f, 500,  1540,  10, 70 },
+	{ 0x10, BIT(5), 0x17, 0x7f, 500,  1540,  10, 70 },
+	{ 0x10, BIT(6), 0x18, 0x7f, 500,  1840,  10, 70 },
+	{ 0x10, BIT(7), 0x19, 0x7f, 500,  1840,  10, 70 },
+	{ 0x11, BIT(0), 0x1a, 0x7f, 500,  1840,  10, 70 },
+};
+
+#define AXP_CHIP_VERSION	0
+#define AXP_CHIP_VERSION_MASK	0
+#define AXP_CHIP_ID		0
+#define AXP_SHUTDOWN_REG	0x55
+#define AXP_SHUTDOWN_MASK	BIT(7)
+
 #elif defined(CONFIG_AXP305_POWER)				/* AXP305 */
 
 static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {

-- 
2.51.2

