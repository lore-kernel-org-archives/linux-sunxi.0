Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498D166F2F
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626583; cv=none; b=NqiHKYali+tz78QK+pI+28AMdeUokwa3jir6EuODYTGTkmjA4+hn9dvShiC7u6rzu8vzAwmnO9XG4TvTI8RWfH7LFftNJ5TfMEbR4aF5ricy+bc7ovfI8YjBnzkprtMAewcWILFfFV9uKvXyNWZluX0iwKWYN9iz6EfQy0+cGdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626583; c=relaxed/simple;
	bh=EglLLcCCfWNeQE5fG+ehCpGQI6yxub9EjEpJiPJqwuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q7wq6HtJr7oYSdb4ipOt82qy1iz2YuB2vJuxlSuGjJzNwuotKKeUuC7Qlb8SJqPYLnJ6Obo3JUwp1gkRUyIzWdrupb+lWWZvrJezkFg1ifWLml+1Hmc902ST/kFb5SPZMneUCetWSnFGrUBU30l+CKYttlJEUS8SCwBCjJshMHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEmRzNLb; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEmRzNLb"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d9e13ef9aaso5661340b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626580; x=1723231380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DmJlrlo5W6PZMQ18qIFzJEDAOKAjJgEZfZK5pVjCr0=;
        b=SEmRzNLb8/uwavU3xsdCJll/U6kDhOJq2EaeRQpvvErrFGjrmC3FgMnmY61OcBMR21
         o0SHfHXrRMdPT0aJ/OYzVL+jz9mVxtf6r/y2Wqf1CQ6oQEW7QK5q49HbtilTO2S/KeQ9
         x/ELHhcN1cHiIvZ/XiXG88WHLGS5vMI0H8ikGJHIrk5A4z24MbXcnWwNC4LjEid+g02M
         Qy1UM2Oqj2KU+G0dxNs6XnOnra7/KHSduvlqXsUiaQd0AsnPf6xnjGQdzS7RFC10lADr
         pF7UhQNKJEd+ltR7zWiXGv/ntlcPFR+Q5OxCyItMj6hJIc9Gfvk59Qkh31TdSq430P5c
         02ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626580; x=1723231380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DmJlrlo5W6PZMQ18qIFzJEDAOKAjJgEZfZK5pVjCr0=;
        b=BbIWdqem/wMW1YSQLRbgCn0rIVpFDnzzW5YZ7JhmwYm5OGwy8l5yxz2wdQLs46BckQ
         fy/6v8Unwf+w8c0VnaGER/MmCHPqMv8MozvFPMW7//r7cR9PGCXhGE4PDaYp5bTA0XLf
         GAP+ilKRoP20GylBSDyc1cpOUUGGxPVdDZkoANlzMU6e1I3qB+STs7WMgtvCos6pV/vL
         ar8qoJNepqGtfjjqFjUG4hL3gaxZztJFkuMFhLNuRzXEA30Ai1VPb/C60efwT2gRMQLi
         UwFZVmc6/aMJb+PRT4ga8yfZPrIs2yaZl8Z0ealPXQVhj1WNPAtoemb4Het57wa9mobu
         j8nQ==
X-Gm-Message-State: AOJu0YxG2Ae8sIST9iwWgpsJZZNpTl6VtFs/8CSQAUzOt5CGhecrS7PA
	6xS8iajDx0bTVRsxzyjYFy+hYSP8ditQ+j3XqjIMz+6t0s+CDyTYwO0Row==
X-Google-Smtp-Source: AGHT+IFIDZwYPFivrycIJrRjju9X720BtnnNLGrHnSLgQBJIoMKJJnmvSsVwesmBS++afiW66R3oNg==
X-Received: by 2002:a05:6808:138c:b0:3d5:64be:890c with SMTP id 5614622812f47-3db558023bcmr5004498b6e.17.1722626579780;
        Fri, 02 Aug 2024 12:22:59 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:59 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 12/15] iio: adc: axp20x_adc: add support for AXP717 ADC
Date: Fri,  2 Aug 2024 14:20:23 -0500
Message-Id: <20240802192026.446344-13-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802192026.446344-1-macroalpha82@gmail.com>
References: <20240802192026.446344-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the AXP717 ADC. The AXP717 differs from other ADCs
in this series by utilizing a 14 bit ADC for all channels (a full 16
bits with the first 2 digits reserved). It also differs by lacking a
battery discharge current channel.

Note that while the current charge channel itself is included in this
driver for the AXP717 and listed in the datasheet, no scale or offset
was given for this channel. For now no scale or offset is provided in
this driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/iio/adc/axp20x_adc.c | 160 +++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/iio/adc/axp20x_adc.c b/drivers/iio/adc/axp20x_adc.c
index 368ba6ee7a80..d43c8d124a0c 100644
--- a/drivers/iio/adc/axp20x_adc.c
+++ b/drivers/iio/adc/axp20x_adc.c
@@ -5,6 +5,7 @@
  *	Quentin Schulz <quentin.schulz@free-electrons.com>
  */
 
+#include <asm/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
@@ -30,6 +31,8 @@
 
 #define AXP22X_ADC_EN1_MASK			(GENMASK(7, 5) | BIT(0))
 
+#define AXP717_ADC_EN1_MASK			GENMASK(7, 0)
+
 #define AXP192_GPIO30_IN_RANGE_GPIO0		BIT(0)
 #define AXP192_GPIO30_IN_RANGE_GPIO1		BIT(1)
 #define AXP192_GPIO30_IN_RANGE_GPIO2		BIT(2)
@@ -43,6 +46,13 @@
 
 #define AXP22X_ADC_RATE_HZ(x)			((ilog2((x) / 100) << 6) & AXP20X_ADC_RATE_MASK)
 
+#define AXP717_ADC_DATA_TS			0x00
+#define AXP717_ADC_DATA_TEMP			0x01
+#define AXP717_ADC_DATA_VMID			0x02
+#define AXP717_ADC_DATA_BKUP_BATT		0x03
+
+#define AXP717_ADC_DATA_MASK			GENMASK(13, 0)
+
 #define AXP813_V_I_ADC_RATE_MASK		GENMASK(5, 4)
 #define AXP813_ADC_RATE_MASK			(AXP20X_ADC_RATE_MASK | AXP813_V_I_ADC_RATE_MASK)
 #define AXP813_TS_GPIO0_ADC_RATE_HZ(x)		AXP20X_ADC_RATE_HZ(x)
@@ -125,6 +135,20 @@ enum axp22x_adc_channel_i {
 	AXP22X_BATT_DISCHRG_I,
 };
 
+enum axp717_adc_channel_v {
+	AXP717_BATT_V = 0,
+	AXP717_TS_IN,
+	AXP717_VBUS_V,
+	AXP717_VSYS_V,
+	AXP717_DIE_TEMP_V,
+	AXP717_VMID_V = 6,
+	AXP717_BKUP_BATT_V,
+};
+
+enum axp717_adc_channel_i {
+	AXP717_BATT_CHRG_I = 5,
+};
+
 enum axp813_adc_channel_v {
 	AXP813_TS_IN = 0,
 	AXP813_GPIO0_V,
@@ -179,6 +203,22 @@ static struct iio_map axp22x_maps[] = {
 	}, { /* sentinel */ }
 };
 
+static struct iio_map axp717_maps[] = {
+	{
+		.consumer_dev_name = "axp20x-usb-power-supply",
+		.consumer_channel = "vbus_v",
+		.adc_channel_label = "vbus_v",
+	}, {
+		.consumer_dev_name = "axp20x-battery-power-supply",
+		.consumer_channel = "batt_v",
+		.adc_channel_label = "batt_v",
+	}, {
+		.consumer_dev_name = "axp20x-battery-power-supply",
+		.consumer_channel = "batt_chrg_i",
+		.adc_channel_label = "batt_chrg_i",
+	},
+};
+
 /*
  * Channels are mapped by physical system. Their channels share the same index.
  * i.e. acin_i is in_current0_raw and acin_v is in_voltage0_raw.
@@ -274,6 +314,29 @@ static const struct iio_chan_spec axp22x_adc_channels[] = {
 			   AXP22X_TS_ADC_H),
 };
 
+/*
+ * Scale and offset is unknown for temp, ts, batt_chrg_i, vmid_v, and
+ * bkup_batt_v channels. Leaving scale and offset undefined for now.
+ */
+static const struct iio_chan_spec axp717_adc_channels[] = {
+	AXP20X_ADC_CHANNEL(AXP717_BATT_V, "batt_v", IIO_VOLTAGE,
+			   AXP717_BATT_V_H),
+	AXP20X_ADC_CHANNEL(AXP717_TS_IN, "ts_v", IIO_VOLTAGE,
+			   AXP717_ADC_DATA_H),
+	AXP20X_ADC_CHANNEL(AXP717_VBUS_V, "vbus_v", IIO_VOLTAGE,
+			   AXP717_VBUS_V_H),
+	AXP20X_ADC_CHANNEL(AXP717_VSYS_V, "vsys_v", IIO_VOLTAGE,
+			   AXP717_VSYS_V_H),
+	AXP20X_ADC_CHANNEL(AXP717_DIE_TEMP_V, "pmic_temp", IIO_TEMP,
+			   AXP717_ADC_DATA_H),
+	AXP20X_ADC_CHANNEL(AXP717_BATT_CHRG_I, "batt_chrg_i", IIO_CURRENT,
+			   AXP717_BATT_CHRG_I_H),
+	AXP20X_ADC_CHANNEL(AXP717_VMID_V, "vmid_v", IIO_VOLTAGE,
+			   AXP717_ADC_DATA_H),
+	AXP20X_ADC_CHANNEL(AXP717_BKUP_BATT_V, "bkup_batt_v", IIO_VOLTAGE,
+			   AXP717_ADC_DATA_H),
+};
+
 static const struct iio_chan_spec axp813_adc_channels[] = {
 	{
 		.type = IIO_TEMP,
@@ -354,6 +417,51 @@ static int axp22x_adc_raw(struct iio_dev *indio_dev,
 	return IIO_VAL_INT;
 }
 
+static int axp717_adc_raw(struct iio_dev *indio_dev,
+			  struct iio_chan_spec const *chan, int *val)
+{
+	struct axp20x_adc_iio *info = iio_priv(indio_dev);
+	u8 bulk_reg[2];
+	int ret;
+
+	/*
+	 * A generic "ADC data" channel is used for TS, tdie, vmid,
+	 * and vbackup. This channel must both first be enabled and
+	 * also selected before it can be read.
+	 */
+	switch (chan->channel) {
+	case AXP717_TS_IN:
+		regmap_write(info->regmap, AXP717_ADC_DATA_SEL,
+			     AXP717_ADC_DATA_TS);
+		break;
+	case AXP717_DIE_TEMP_V:
+		regmap_write(info->regmap, AXP717_ADC_DATA_SEL,
+			     AXP717_ADC_DATA_TEMP);
+		break;
+	case AXP717_VMID_V:
+		regmap_write(info->regmap, AXP717_ADC_DATA_SEL,
+			     AXP717_ADC_DATA_VMID);
+		break;
+	case AXP717_BKUP_BATT_V:
+		regmap_write(info->regmap, AXP717_ADC_DATA_SEL,
+			     AXP717_ADC_DATA_BKUP_BATT);
+		break;
+	default:
+		break;
+	}
+
+	/*
+	 * All channels are 14 bits, with the first 2 bits on the high
+	 * register reserved and the remaining bits as the ADC value.
+	 */
+	ret = regmap_bulk_read(info->regmap, chan->address, bulk_reg, 2);
+	if (ret < 0)
+		return ret;
+
+	*val = FIELD_GET(AXP717_ADC_DATA_MASK, get_unaligned_be16(bulk_reg));
+	return IIO_VAL_INT;
+}
+
 static int axp813_adc_raw(struct iio_dev *indio_dev,
 			  struct iio_chan_spec const *chan, int *val)
 {
@@ -571,6 +679,27 @@ static int axp22x_adc_scale(struct iio_chan_spec const *chan, int *val,
 	}
 }
 
+static int axp717_adc_scale(struct iio_chan_spec const *chan, int *val,
+			    int *val2)
+{
+	switch (chan->type) {
+	case IIO_VOLTAGE:
+		*val = 1;
+		return IIO_VAL_INT;
+
+	case IIO_CURRENT:
+		*val = 1;
+		return IIO_VAL_INT;
+
+	case IIO_TEMP:
+		*val = 100;
+		return IIO_VAL_INT;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static int axp813_adc_scale(struct iio_chan_spec const *chan, int *val,
 			    int *val2)
 {
@@ -746,6 +875,22 @@ static int axp22x_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+static int axp717_read_raw(struct iio_dev *indio_dev,
+			   struct iio_chan_spec const *chan, int *val,
+			   int *val2, long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		return axp717_adc_scale(chan, val, val2);
+
+	case IIO_CHAN_INFO_RAW:
+		return axp717_adc_raw(indio_dev, chan, val);
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static int axp813_read_raw(struct iio_dev *indio_dev,
 			   struct iio_chan_spec const *chan, int *val,
 			   int *val2, long mask)
@@ -860,6 +1005,10 @@ static const struct iio_info axp22x_adc_iio_info = {
 	.read_raw = axp22x_read_raw,
 };
 
+static const struct iio_info axp717_adc_iio_info = {
+	.read_raw = axp717_read_raw,
+};
+
 static const struct iio_info axp813_adc_iio_info = {
 	.read_raw = axp813_read_raw,
 };
@@ -930,6 +1079,15 @@ static const struct axp_data axp22x_data = {
 	.maps = axp22x_maps,
 };
 
+static const struct axp_data axp717_data = {
+	.iio_info = &axp717_adc_iio_info,
+	.num_channels = ARRAY_SIZE(axp717_adc_channels),
+	.channels = axp717_adc_channels,
+	.adc_en1 = AXP717_ADC_CH_EN_CONTROL,
+	.adc_en1_mask = AXP717_ADC_EN1_MASK,
+	.maps = axp717_maps,
+};
+
 static const struct axp_data axp813_data = {
 	.iio_info = &axp813_adc_iio_info,
 	.num_channels = ARRAY_SIZE(axp813_adc_channels),
@@ -944,6 +1102,7 @@ static const struct of_device_id axp20x_adc_of_match[] = {
 	{ .compatible = "x-powers,axp192-adc", .data = (void *)&axp192_data, },
 	{ .compatible = "x-powers,axp209-adc", .data = (void *)&axp20x_data, },
 	{ .compatible = "x-powers,axp221-adc", .data = (void *)&axp22x_data, },
+	{ .compatible = "x-powers,axp717-adc", .data = (void *)&axp717_data, },
 	{ .compatible = "x-powers,axp813-adc", .data = (void *)&axp813_data, },
 	{ /* sentinel */ }
 };
@@ -953,6 +1112,7 @@ static const struct platform_device_id axp20x_adc_id_match[] = {
 	{ .name = "axp192-adc", .driver_data = (kernel_ulong_t)&axp192_data, },
 	{ .name = "axp20x-adc", .driver_data = (kernel_ulong_t)&axp20x_data, },
 	{ .name = "axp22x-adc", .driver_data = (kernel_ulong_t)&axp22x_data, },
+	{ .name = "axp717-adc", .driver_data = (kernel_ulong_t)&axp717_data, },
 	{ .name = "axp813-adc", .driver_data = (kernel_ulong_t)&axp813_data, },
 	{ /* sentinel */ },
 };
-- 
2.34.1

