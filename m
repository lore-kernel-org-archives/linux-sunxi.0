Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CA9165EF6
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626577; cv=none; b=S1reffrGfhsQloNPxg9cGPgXfb/nQTW7/96hGPgJY/fs0I6UnJgPFfAEQN6DpAbSCwJ2+nBymFew8m01mwcrOF3mRsJKegEcj55OkBe6Q8Shelbfs+TC5J4L+YNGKZ1/mBmLYkrB4oOU+/P3cG2pAAFp+aFha9d5ki3gwhEDIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626577; c=relaxed/simple;
	bh=5a+ymo3BBR1upvcXnfIAo+PqatW4K0NQ636IZHuJqs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tz4uk8n4UZYg1/m1TjtokXwsPK5q3IZSqmmYby1nprnu8laSwm6B8rHzOjQivZn6Rh0mV9SA0JInrrDcdoTJbGEIHgJmhvSbgHsa1KWxF5PtEZ7uHGPH8mXu4CY1IGOp+CoMMQhXP4tE/bk/HA8r5eqsV6oiPon3Pn9wmAmnMPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=At/hnVow; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="At/hnVow"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3db14339fb0so5690035b6e.2
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626575; x=1723231375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW8pLbjHmp58tJfvrusMBZ0t6nfvqNtc57mmOOIaTIw=;
        b=At/hnVoww2LOfSBGZw5ZzHk88NBnssMDbtmNhYvfYbWUxcc9N1AWw+x8dVOKUxp7dW
         uWioCFkfPYdvmUekW9zjRmIWI03lR/CccPhKrJYzMJRIYFNx8cBYeXhzni9fDcDdohyo
         P8SMNS4/JL6FfoExpjPd5jlqT4ewAsHDH1d9VOeeTH4gTv+6E3L8zq/f/6G47nKUr2wO
         oUA9ztiBooVL3BKMhYmi8+7tYvwJrhriI6/vfOhWEQLfLxhTcF95xec9pKaXC+rOCKAO
         W9ObOtI4ZOAtrAGZBw2H6AID32TrftruLExvETn4kEpx5tPmcNNWo/Pi6cuBlU8OoU6u
         Hv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626575; x=1723231375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW8pLbjHmp58tJfvrusMBZ0t6nfvqNtc57mmOOIaTIw=;
        b=K7rt6/L7s8YyBMOiByVM6IG9nWNLgAjAXQrWpfK6gvZTm6XmNGcUzjuJd38OJ/jDNL
         TNlzEeY+w2tS80fPa+KGkYmdZ5cf+cUelGLHWfvjIWd6/umwsC8azthF5IPo7BXb1FHz
         bNYqkDDudVpX5qrQBvZ+zmCE4bpyEbgk2kf8/aIz4ZCQ2a9eHNajzmXlUBCdLrD5AOKj
         vM04coxHL2dyBT0fUuszIMJDdGwFDqUMtDC5jgAWSv+5WAtBPsJ9k3IDnnGZH21REvAf
         v8xkrFSaXK4857c33DTC2cHXNUkq1bT1kSKZ/jOQ/PrYoiwNlOYs3YcaUy/TXCF9j14a
         O3+A==
X-Gm-Message-State: AOJu0Yz9GZWCOxuZObezPzi5msNoH79MdAOr4s+/Jl4jpNZNxksckyUz
	xku7Z2xJ6kZKoD7tj2P2rln+DZWLjzmk9yIbvsRKGQW9Jm/asncgygvQTQ==
X-Google-Smtp-Source: AGHT+IGLrF7R/GoK7DvLxn2rE5wHYPa4hHdeD3olNUeNmJFauek8wLdUUrmSSS7uheaq9kYw3f4lNA==
X-Received: by 2002:a05:6808:f8a:b0:3d9:dfef:d7c8 with SMTP id 5614622812f47-3db55817bf8mr5537828b6e.27.1722626574804;
        Fri, 02 Aug 2024 12:22:54 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:54 -0700 (PDT)
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
Subject: [PATCH V2 06/15] power: supply: axp20x_usb_power: add input-current-limit-microamp
Date: Fri,  2 Aug 2024 14:20:17 -0500
Message-Id: <20240802192026.446344-7-macroalpha82@gmail.com>
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

