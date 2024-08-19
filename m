Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92C1836D9
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086130; cv=none; b=iZ+9ln5gs6V8dWfrhCSpNMJCjO9CcKjZVYHJgj5nTjq61CRqMtId5VTOAEA0bVkDV5R2Pi3IlP3Ff32BKY++oI/q/+5K5YGu60E6iHuXAsBVhxe+mF/Ab1u09D5i3+eS44FW20glHtYnMYXEtYVMvUKw8jUWgjeoYK1DU9yUWrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086130; c=relaxed/simple;
	bh=5a+ymo3BBR1upvcXnfIAo+PqatW4K0NQ636IZHuJqs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r3LDvfQ5+mz6Nc0Qbc8ZadbkSyu/agYzkRnr0OxJjb9NHuLcaECM0Y+6kD2DGkv+uUUvNb7oOGIwvRF141my+IkTeG5iF1hTTx3jOh9r0hHJO8BeqvR+Swpvfs2iAyrMOammfQeYgMJr3sfWMuZaNohFB+6HotEtqgZDr2eW+1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCVUmkCp; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCVUmkCp"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7095bfd6346so2521902a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086127; x=1724690927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW8pLbjHmp58tJfvrusMBZ0t6nfvqNtc57mmOOIaTIw=;
        b=DCVUmkCp+oQXTv/909939Ac1ouOsLGOKbu9jZXcA5qe7HnotaBcjqZefoWGbOpT7jg
         pvlKp1lQCqu3sAawLtrdxqHZT3Gh7GY9pGTT2QQp++9XfWA7wDCtlu45vwOPkxjFLaC6
         BQ/DjfKNYxHM/G+qCOxH7X4NXR0v2cS/NQoyKx9rDdq7yk+ptVxwvqZ6R/UYwXaDyJ04
         RnjTzisxmIczjcVdwMglZWrjblqDRPD84X13lnRnPFRbEKZsrOkg9rN+3mL1o4q/6ojB
         SEYLjOCtaDt2/g02w/PMH9x6SV6BnH5xfOsZ0vj0MlpwVNjALho5s435k5IU7/IknPXc
         feKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086127; x=1724690927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW8pLbjHmp58tJfvrusMBZ0t6nfvqNtc57mmOOIaTIw=;
        b=DlljNDJCAcoRPpexSExtXK+nSvBuHmwjFsy4d2gIWtrV+aDxpTSpI5tXfl7gjEwvaC
         SF2UcsPhAkijVPmX4HmwV9UhObb4sVzYjUMF0NUacz5XSqvCGOP4b0JI/hLBOoOqvujL
         uQfwgX9jiWm2gDBK0325nMoKBYRjTB9bObo4SIRpUkrLRUOhQ8zu14uEwwixMZdgzlKz
         4ckK0Ql6hri5bxFHwbFuIKnyDfMonWR4TAsQFAwUxItWkKZ//7ePvGlLbmw1tJex2miz
         O7hplE1nYqluCeueEpUwhGScEkhMpWItbddMqAlwSlYxBmrlGQpltQLiewm6Wcv7ckKM
         Hwnw==
X-Gm-Message-State: AOJu0Yx5kvRZ3dPAgTJ54WQktpJ61nMJUM/38xh6GlfKJ1PyUoIMuboe
	6zoiCrbYH+oZL/Lw/gEZ6JiXS838C1NBmuY9z2RxbDS4vGviziX3EuHk5g==
X-Google-Smtp-Source: AGHT+IGLpyFYSUV+cBCNRptV8yxiewNZEx5HrXXFCUBc5RJlJY+ALXntzTpuvudFQsRUtsorOOSeSQ==
X-Received: by 2002:a05:6830:380d:b0:709:33ee:f578 with SMTP id 46e09a7af769-70cac84f622mr12959822a34.14.1724086127315;
        Mon, 19 Aug 2024 09:48:47 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:47 -0700 (PDT)
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
	jonathan.cameron@huawei.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 06/15] power: supply: axp20x_usb_power: add input-current-limit-microamp
Date: Mon, 19 Aug 2024 11:46:10 -0500
Message-Id: <20240819164619.556309-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819164619.556309-1-macroalpha82@gmail.com>
References: <20240819164619.556309-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Allow users to specify a maximum input current for the device. Some
devices allow up to 3.25A of input current (such as the AXP717), which
may be too much for some implementations.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/power/supply/axp20x_usb_power.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/power/supply/axp20x_usb_power.c b/drivers/power/supply/axp20x_usb_power.c
index cd9e92f2ce71..69fbb5861934 100644
--- a/drivers/power/supply/axp20x_usb_power.c
+++ b/drivers/power/supply/axp20x_usb_power.c
@@ -80,6 +80,7 @@ struct axp20x_usb_power {
 	struct iio_channel *vbus_v;
 	struct iio_channel *vbus_i;
 	struct delayed_work vbus_detect;
+	int max_input_cur;
 	unsigned int old_status;
 	unsigned int online;
 	unsigned int num_irqs;
@@ -323,6 +324,13 @@ static int axp20x_usb_power_set_input_current_limit(struct axp20x_usb_power *pow
 	if (intval == -1)
 		return -EINVAL;
 
+	if (power->max_input_cur && (intval > power->max_input_cur)) {
+		dev_warn(power->dev,
+			 "reqested current %d clamped to max current %d\n",
+			 intval, power->max_input_cur);
+		intval = power->max_input_cur;
+	}
+
 	/*
 	 * BC1.2 detection can cause a race condition if we try to set a current
 	 * limit while it's in progress. When it finishes it will overwrite the
@@ -661,6 +669,18 @@ static int axp20x_regmap_field_alloc_optional(struct device *dev,
 	return 0;
 }
 
+/* Optionally allow users to specify a maximum charging current. */
+static void axp20x_usb_power_parse_dt(struct device *dev,
+				      struct axp20x_usb_power *power)
+{
+	int ret;
+
+	ret = device_property_read_u32(dev, "input-current-limit-microamp",
+				       &power->max_input_cur);
+	if (ret)
+		dev_dbg(dev, "%s() no input-current-limit specified\n", __func__);
+}
+
 static int axp20x_usb_power_probe(struct platform_device *pdev)
 {
 	struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
@@ -697,6 +717,8 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 	if (IS_ERR(power->curr_lim_fld))
 		return PTR_ERR(power->curr_lim_fld);
 
+	axp20x_usb_power_parse_dt(&pdev->dev, power);
+
 	ret = axp20x_regmap_field_alloc_optional(&pdev->dev, power->regmap,
 						 axp_data->vbus_valid_bit,
 						 &power->vbus_valid_bit);
-- 
2.34.1

