Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742801;
	b=Ds3lyOPS1SrOyjRaStD4qViG1hfDnsg0IQlSUQktGSNG/w0Hb089n0hApk/4YPlSfnj2
	 PeMqiXk/GHGAwloN9rwG4TyKS6cfvPndpbgLd+yN4MakPTM9xhm/yLLR1Lmd5rUjtib/R
	 pME1u1ynNChYgJB5h1Kp2GtBxp0Sc1elZBMkA0klK6Ree89Df+4LG7XnOoPQuXsAfdLEE
	 SYFyjh5olRCTs3/fbeC7HUIKbfwI/MO4TuFL5SzseynPCCD0YwKHd5q6f3JE5GyrTleke
	 NcIoIHdwo8/OvTrgD2azOqeUZ7aYSBy9bp37mH/Y+W3KJNrQxMxXT1y6mrdrjDRY7SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6xWdpHGsEDnnY/vu32Pb34b46nKTg/YwA60xJj7J8uQ=;
	b=fdDMZV1LWCbUFEyqIYC/MMXf218NxzcLTQ999UlEJYuJ7HjcIkJ6pCLTv15TP4JfExVx
	 4PVOQgjFsbkUUPD5/D0f3C2D2tctiyiWsoxqLr/aZB54ZfN9+tGydxsSGffBCsklsDh2T
	 +vVYE0DqpMBCQj9hyR+JYE4YSH5rZwWEX/Y7dXrEK4UaUYlc34ipdHOp7N1qko9efEPYM
	 Z82i/42eNpjn9abqfsTaq2etartisKaVYRGAXIsMYTh8r6dmx/X4sJv+BQ2mYi9wJzz+m
	 zz80g531aKvC6f/t8HoFTTYrJXWFLqfyycDjtzXpaQOYINy8wf+4K+qTFxM1goeO87w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svtr5BKI;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AFF606A32A
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 01:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AFF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svtr5BKI
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdebab6fdb3so840234a12.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742800; x=1796347600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xWdpHGsEDnnY/vu32Pb34b46nKTg/YwA60xJj7J8uQ=;
        b=svtr5BKI2VkfA9Pd2zhHfe62wyN9doFeKFBGtirXhHbTAUUNLGJD+1O0Wlca1rAodC
         qxvx/kPW11ZjBme0BfHxl49+qibj+3WTWkLSTyrDfSvihT1vZ5Am60SA0DVD7wCBWqOJ
         gdEb/xDk13jxdGchVqIbR2ftnehQF3oV8AjwpD8+VCSsTNvIzmdpMcoYY0PfruRQ4wok
         eRmB7rkEQAs8h3AoEBYqBOroXaS2R4zSu5gcIuwSVHlb7SRQBv0wcZYBmm15Dz5k0GNN
         +rnYrSfBChbgri/Cvzs7zyY+HPLGO1aFl5aNtYhhsxAao+TJtEFT9nuBwSnLyOiGd2MV
         nL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742800; x=1796347600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xWdpHGsEDnnY/vu32Pb34b46nKTg/YwA60xJj7J8uQ=;
        b=HXvos2irnydv5PdJAuGjnRVGPxqIAQtkG1I1SuIi6+S7W3imIWsz3pfYGLx5ES00Qj
         7mq8AoGj85Sdy7DTONW6v7e6NzcdPX4tPVwRoz5uWoSj0UlUYCF5uZCvrbvw6mTHdy7S
         XW3JCRAnksfgLiL6TV+QZJ5W2ViDRH7j5pYWAJssfz0R+qC2GEFoEDLUu9JgifTHEc81
         8lPWlNrKOLHZfuFz81wXZEf3r7uIgtdVD8AMtVOuyhNfUpN5+5vDvC9Q5sVHo4VnY4AV
         z69aqwdjesdSgLG5ncnTo7XYz/vL1N0ahLlQYA8QbVm+7/X18VR0rrC5LTgJgYNrN5mi
         jK7A==
X-Forwarded-Encrypted: i=1; AL+hErFZSdPL5YHjL5djie20DRt1DDFYiknOq4PTKFB41HrZFuorZHiFg8RJ895n511DeiP8exF/RojiX+SUeg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Fpk+NMxnYbuHYt2ZNqOU96diNkuLUXrB487sLw5lZFQoZF0er
	WMUam5neMaG13lJ7fkgpIfjCW1Z3Vh9s9/t03uXtF2P0xwktltGWbSYE
X-Gm-Gg: AZFdTZfGbs3CiprqQ0bkoFOfD0zH1Y/Q0GxuhrHznbg3FcPM7/UGGxmhvk3/3u6rIef
	KsR9/b3eLzSBv1jIOLhHX/GsGech6vBK3SqK+kOpuCliKvvMOyadcdXnPu7Wp541bghIPGoqNWe
	RYqqhRjU+RDG5VLrSXFsREQe+D2GewPKBFskjrhzoeov5nMod62p7LKVBIW9mja9bLlRxa9ApI+
	utCMp4IqptNWn8xVV0dsSIYKK8bSxTHU53Z3PSN6nA6h1h3XKuf8Hl4as8Bt8iNS3ybXYNj12oH
	TvTDCVGyuGs3oO39kNrP4EzI/kgYoBAJviqS5T5mJlpiHpB1Y07rL5+cQ6K4hvih0xgfsYRS1Rp
	kRMhrxpSbME3RDq4G6yGZo8W51HsCKVa43ZpdaQwOOZcesm78Us16xpU03oxvn6Gsscipp70SCs
	v/VgpeM96L0+hbCGwsRQGWVza4tQzP369u92LV12Xh2qgFmT740uZcw0kpZel+Fu5+JaGAe4fEK
	AM67YokdF9k18PlYPdXzU6Ofb3Vh8JUZDAFRiDV5a+C/AMuOvdhDkezOJtYVx4jxhxZiLpMj05O
	ZO7XnJAAPM8w6sgxy/dhn1OupkPzOzwpvgUB7ExHqqmyTBnsElJSvyct5GZlyTh39Y4tIE7L8ax
	EG5aPkueuVNgi8dngOhwC+pefpep8IjxGGT+88Mmcy1rynA==
X-Received: by 2002:a17:90b:3f10:b0:3ac:af8b:6f3 with SMTP id 98e67ed59e1d1-3b41cb0caa7mr18094346a91.52.1795742800230;
        Thu, 26 Nov 2026 17:26:40 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:39 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:10 +0100
Message-ID: <20261127012612.1589039-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127012612.1589039-1-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Miyoo A30 handheld (Allwinner A33) reads its analog stick through a
microcontroller on uart0. From power-up it streams frames at 9600 baud,
about 67 per second:

  0xff <b0> <b1> <b2> <b3> 0xfe

b2 and b3 are the raw 8-bit readings of the X and Y potentiometers, the
ones the stock firmware uses. b0 and b1 also move with the stick, but
their meaning is unknown, so they are not exposed.

Add a serdev driver that exposes X and Y as two raw IIO channels. As
the MCU pushes its readings, each complete frame also goes to a software
IIO buffer (kfifo) with a timestamp: adc-joystick then takes the stick
from the buffer, without polling, both axes from the same frame. Direct
reads return the last complete frame, -EAGAIN before the first one.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 MAINTAINERS                       |   7 +
 drivers/iio/adc/Kconfig           |  13 ++
 drivers/iio/adc/Makefile          |   1 +
 drivers/iio/adc/miyoo-a30-stick.c | 204 ++++++++++++++++++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 drivers/iio/adc/miyoo-a30-stick.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 02015eaec312..253275882ab9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18746,6 +18746,13 @@ M:	Konrad Dybcio <konradybcio@kernel.org>
 F:	Documentation/devicetree/bindings/power/supply/mitsumi,mm8013.yaml
 F:	drivers/power/supply/mm8013.c
 
+MIYOO A30 ANALOG STICK MCU DRIVER
+M:	Romain TISSERAND <romain.tisserand@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
+F:	drivers/iio/adc/miyoo-a30-stick.c
+
 MMP SUPPORT
 R:	Lubomir Rintel <lkundrak@v3.sk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 1d6ed49041ab..48a0c4a88731 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1346,6 +1346,19 @@ config MESON_SARADC
 	  To compile this driver as a module, choose M here: the
 	  module will be called meson_saradc.
 
+config MIYOO_A30_STICK
+	tristate "Miyoo A30 analog stick MCU"
+	depends on SERIAL_DEV_BUS
+	select IIO_BUFFER
+	select IIO_KFIFO_BUF
+	help
+	  Say yes here to support the analog stick microcontroller of the
+	  Miyoo A30 handheld, which streams the stick readings on a UART.
+	  The readings are exposed as IIO channels, for adc-joystick.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called miyoo-a30-stick.
+
 config MP2629_ADC
 	tristate "Monolithic MP2629 ADC driver"
 	depends on MFD_MP2629
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 769965295dcc..eba4d8eb716a 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_MEDIATEK_MT6397_AUXADC) += mt6397-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
 obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
 obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
+obj-$(CONFIG_MIYOO_A30_STICK) += miyoo-a30-stick.o
 obj-$(CONFIG_MP2629_ADC) += mp2629_adc.o
 obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
 obj-$(CONFIG_NAU7802) += nau7802.o
diff --git a/drivers/iio/adc/miyoo-a30-stick.c b/drivers/iio/adc/miyoo-a30-stick.c
new file mode 100644
index 000000000000..d83761558ee7
--- /dev/null
+++ b/drivers/iio/adc/miyoo-a30-stick.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Miyoo A30 analog stick MCU
+ *
+ * The MCU samples the stick potentiometers and streams binary frames on a
+ * UART from power-up, at 9600 baud, about 67 per second:
+ *
+ *   0xff <b0> <b1> <b2> <b3> 0xfe
+ *
+ * b2 and b3 are the raw 8-bit readings of the X and Y potentiometers (the
+ * ones the stock firmware uses); b0 and b1 are not documented and are not
+ * exposed. The last good frame is exposed as two IIO channels, and each
+ * good frame is pushed to an IIO buffer as it arrives, so that adc-joystick
+ * can take the stick without polling it.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/kfifo_buf.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/serdev.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define A30_STICK_FRAME_LEN	6
+#define A30_STICK_START		0xff
+#define A30_STICK_END		0xfe
+#define A30_STICK_BAUD		9600
+
+struct a30_stick {
+	struct iio_dev *indio_dev;
+	spinlock_t lock;	/* protects val and valid */
+	u8 val[2];
+	bool valid;
+	u8 frame[A30_STICK_FRAME_LEN];
+	unsigned int len;
+};
+
+static size_t a30_stick_receive(struct serdev_device *serdev, const u8 *data,
+				size_t count)
+{
+	struct a30_stick *st = serdev_device_get_drvdata(serdev);
+	size_t i;
+
+	for (i = 0; i < count; i++) {
+		/* resynchronise on the start byte */
+		if (!st->len && data[i] != A30_STICK_START)
+			continue;
+
+		st->frame[st->len++] = data[i];
+		if (st->len < A30_STICK_FRAME_LEN)
+			continue;
+
+		st->len = 0;
+		if (st->frame[A30_STICK_FRAME_LEN - 1] != A30_STICK_END)
+			continue;
+
+		scoped_guard(spinlock, &st->lock) {
+			st->val[0] = st->frame[3];
+			st->val[1] = st->frame[4];
+			st->valid = true;
+		}
+
+		if (iio_buffer_enabled(st->indio_dev)) {
+			IIO_DECLARE_BUFFER_WITH_TS(u8, scan, 2) = { };
+
+			scan[0] = st->frame[3];
+			scan[1] = st->frame[4];
+			iio_push_to_buffers_with_ts(st->indio_dev, scan,
+						    sizeof(scan),
+						    iio_get_time_ns(st->indio_dev));
+		}
+	}
+
+	return count;
+}
+
+static const struct serdev_device_ops a30_stick_serdev_ops = {
+	.receive_buf = a30_stick_receive,
+};
+
+static int a30_stick_read_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan, int *val,
+			      int *val2, long mask)
+{
+	struct a30_stick *st = iio_priv(indio_dev);
+
+	if (mask != IIO_CHAN_INFO_RAW)
+		return -EINVAL;
+
+	guard(spinlock)(&st->lock);
+	if (!st->valid)
+		return -EAGAIN;
+
+	*val = st->val[chan->channel];
+	return IIO_VAL_INT;
+}
+
+static const struct iio_info a30_stick_info = {
+	.read_raw = a30_stick_read_raw,
+};
+
+#define A30_STICK_CHAN(ch) {					\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (ch),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+	.scan_index = (ch),					\
+	.scan_type = {						\
+		.sign = 'u',					\
+		.realbits = 8,					\
+		.storagebits = 8,				\
+	},							\
+}
+
+static const struct iio_chan_spec a30_stick_channels[] = {
+	A30_STICK_CHAN(0),
+	A30_STICK_CHAN(1),
+	IIO_CHAN_SOFT_TIMESTAMP(2),
+};
+
+/* every frame carries both axes: the IIO core extracts the enabled ones */
+static const unsigned long a30_stick_scan_masks[] = { BIT(0) | BIT(1), 0 };
+
+static int a30_stick_probe(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct iio_dev *indio_dev;
+	struct a30_stick *st;
+	unsigned int baud;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	st = iio_priv(indio_dev);
+	st->indio_dev = indio_dev;
+	spin_lock_init(&st->lock);
+
+	indio_dev->name = "miyoo-a30-stick";
+	indio_dev->info = &a30_stick_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = a30_stick_channels;
+	indio_dev->num_channels = ARRAY_SIZE(a30_stick_channels);
+	indio_dev->available_scan_masks = a30_stick_scan_masks;
+
+	ret = devm_iio_kfifo_buffer_setup(dev, indio_dev, NULL);
+	if (ret)
+		return ret;
+
+	ret = devm_iio_device_register(dev, indio_dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * Open the UART last, so that it is closed first on removal: no frame
+	 * is pushed to the buffer once the IIO device is going away. Reads
+	 * return -EAGAIN until the first frame.
+	 */
+	serdev_device_set_drvdata(serdev, st);
+	serdev_device_set_client_ops(serdev, &a30_stick_serdev_ops);
+
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot open the UART\n");
+
+	baud = serdev_device_set_baudrate(serdev, A30_STICK_BAUD);
+	if (baud != A30_STICK_BAUD)
+		return dev_err_probe(dev, -EINVAL, "cannot set %u baud (got %u)\n",
+				     A30_STICK_BAUD, baud);
+
+	serdev_device_set_flow_control(serdev, false);
+	ret = serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot set the parity\n");
+
+	return 0;
+}
+
+static const struct of_device_id a30_stick_of_match[] = {
+	{ .compatible = "miyoo,a30-stick" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, a30_stick_of_match);
+
+static struct serdev_device_driver a30_stick_driver = {
+	.driver = {
+		.name = "miyoo-a30-stick",
+		.of_match_table = a30_stick_of_match,
+	},
+	.probe = a30_stick_probe,
+};
+module_serdev_device_driver(a30_stick_driver);
+
+MODULE_AUTHOR("Romain TISSERAND <romain.tisserand@gmail.com>");
+MODULE_DESCRIPTION("Miyoo A30 analog stick MCU");
+MODULE_LICENSE("GPL");
-- 
2.43.0

