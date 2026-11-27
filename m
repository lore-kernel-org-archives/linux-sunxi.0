Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775872;
	b=PkH0TtfkRUxyZ/JDvLe/v1BJ/R01PIRIT2Ls8KRD0VHm9UgwLkHFuaffsLEcpHuvhT50
	 QaYUuKjqI293hCT4VbGb24SFWiMhzLN068aMfigy+gGS4hscYzPzCTbvrxt0sAPEYocnv
	 610hQzMulqQLfjxv40KR2tIjW4FiFje1ZhL+mxCTJmECqSbmaIeriX1qKhHs9nTaKoL2G
	 RGLPmQ2e6DnXR6ypAv73Tu0tTbS+hM6rnM/hrhLP/Z87fQXzkSNOGCmpy9H6x19UOlaOo
	 fsI9tT4VDIoVlAbuqkSi7FWO9JF+dKAd4LwmIN/upI4506UtAtn5CbSoHJQLiiJqfuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
	b=a+AsKClIxsZGCja+XkulEA/tYWHo7wnP7cwtl2emILqu7GpfPfrw1bwG3stsYd8l6mtJ
	 JDDrTApPvCFGNkAG6WZvVE5gh/QhYIBkLTbpXb+2xNq7jJbpwMOR9JKz5q3eElMQofsk8
	 3Gg6915GPA8ZFQMyNA8CY1TDQG9P8umSM3eubh2FwrakzJh8ULziLF6JEKqoBctfYZR9h
	 KLVvnhsjoFbJ4gBKD51iL1xK70icp3e61qf76jta1OfcG9DfQgBUGGFx0s2+6b91svfWs
	 U+fOvgVtu1jJHX1TLn0OcoCIHUUhZgy3i9TMWsXLxiYHeuhaMTgW2gS5eSAl9sqJDvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WuiA7wHu;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E5C606A32D
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E5C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WuiA7wHu
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49a92144733so3977282f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 02:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775870; x=1796380670; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
        b=WuiA7wHutY0z5+O/7Jai4FpScMga5ZG+e7V6AtrZbIKMIRERRvbnoQfKFLyTq7S0oZ
         KmdyS/Yh+O+qRlKfWUGB69JJgLmLTqU5CXb2Vq/PhHppJfIPZjjgc8j3JCDLmIgoK407
         FgWUXCFtQBIDSl6GsrwPfh/DLi9TC47v/Blejku3rCLEX8z1VVi0st/ipLDoJ0nYAW0s
         WPpGfa2zIM5uSCgV4gSCtEGHz2720/gAuO6jL0WfMLx3lJfGqw15GjRFmN9EtFHwXxYg
         eSvaTtbTcxvuEamxuO207xRmqpQXTfIViZnG+xh26cPxebVgxyrpgoGY6DqxbgT2qMvD
         7t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775870; x=1796380670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
        b=Lo25NvCqXl1gyWn1oVjZga9sVH+dK70i76K53esYiARviZ/OhfsnYkhLdI/W2qJM9x
         p2coMMYWJBRGO+2I+Sj7NfHduNxVxkJ2uFk4INGwRe6ZZ+jSC8fsS0TQlIW08IiAMPzp
         RQC2ygMVmc1kjngJzNV5+PmrYBH+KGsxZn8LyjAXxmcVIL+hSzrUXVhKil0WfAwINziz
         uAmm3roEFnHoL5Zl+BGzsWtb69pws9R1OQTaen9wqzhveoMgDsSFKqhIgsR8XKo+LH7k
         bM8BVw0QkqVo8MIvAdXoIule/Q6LhPhVdYMz2fmf7B2bavXnQDHMkbNpdx7onFi70moC
         v2pw==
X-Forwarded-Encrypted: i=1; AL+hErHw19/57VJ/MLzDP5uMRxeLHVU6dgtyW9cQWxDoMSFTvhOB9aT1AXAbMN3zockRzR2RVMf6Q2NQgZlAUQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9V1xzJnYdrlrX2w/KP1JTa7SpYF/jD49quwM0iErSiK1q3AEXH
	6JzMyNwhUhAQihohrZwhzzix927ZDxUOWdaCkMJv5QuaKT2uNKNqkJSxY/tcf1570jE=
X-Gm-Gg: AZFdTZf35g7pmVD1ycGa2Fl/ZYo74f1Gi/TBDNqnsp5CcYtFEnI+IiDMOg64NSfDZ3G
	bSXbzugXPzqI4phgE3IMmhtd0ThI6UqrBI6xWr3zD2kpp/tt7mfOHvwEvhbX7iSDpqnn2Jo4Y5w
	zVz1a4puJx9H6TK7MnnYTSvS3Yql2TeEz2WiGRwLwhAudAHAOtU7Ks+wz2hJI8JfjvE7Dai1Y2T
	nNE14lkQ4ONpcJqyxy3YWDNI4Kok+Fh+SpaOXAQbcqaYfh/rH+opDyoLaU11AuzLpQWyYwSppNh
	r43wsRTvxynMp3w/qCcrmmvJUGFwdVw4AhI7cNY4f0tiE0E0lluzd7wKvSP7JcjvAwAtlPuIBm7
	tn8zcN7qSdNw/BV2QTto7yznqiQb6BylFv3Oplo0NLXtBlAxMJCem06ZI94TPS+C91f5jcv805Z
	k98w2+JahAliLl/+niri7flsWAiwZCTeR0AEKfDIPWYMIwpY58l4kryVrzsXOd6b/0/JUFYtnre
	O5TdX5d9cRdhi6jNtJpWd2oOdV056R+rOvmfBKJ1rkCAyoMbCxxWUb1faF4YuZQKfADgR7AfF8X
	aOZtj91RKN4jtpyUiiLKeTpXEbTAWIMDMDp58qhoTQVkPKwY
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr460358005e9.30.1795775870518;
        Fri, 27 Nov 2026 02:37:50 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm714014105e9.2.2026.11.27.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:36 +0100
Subject: [PATCH v9 2/5] mfd: axp20x-i2c: Fix i2c instantiation
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-axp318-regulator-v9-2-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=avi9IFPWiAVWFQGWnKZC1/X7ESTAnJfLwhLIKQW4SsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVVhMxhMbT/PLffc79DFJs35NFVq1YLVnuuebn1+5
 Hj3/ljHjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzEuIKR4XRDS7tcT3j0nqUL
 DoZpf2VVFhBW+DM5+vAiscvnzfeeU2f4nzKj7Ne6+M/bj72e8KFGMt3Ssts64egR05+lu+8LXXd
 YywQA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Apparently this device never really supported i2c instantiation via
sysfs, because the driver does not even look at the i2c device data,
which are not set. It would only probe if the device matched through DT.

Fix that for correctness, even-though it is probably useless.
Add the missing AXP323 while at it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
 drivers/mfd/axp20x-rsb.c   |  1 +
 drivers/mfd/axp20x.c       |  1 -
 include/linux/mfd/axp20x.h |  3 +--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 9ddc73b8af43..aac4fe03f7dd 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
 	axp20x->irq = i2c->irq;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
@@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp717" },
-	{ "axp803" },
-	{ "axp806" },
-	{ "axp15060" },
+	{ .name = "axp152",	.driver_data = AXP152_ID },
+	{ .name = "axp192",	.driver_data = AXP192_ID },
+	{ .name = "axp202",	.driver_data = AXP202_ID },
+	{ .name = "axp209",	.driver_data = AXP209_ID },
+	{ .name = "axp221",	.driver_data = AXP221_ID },
+	{ .name = "axp223",	.driver_data = AXP223_ID },
+	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp323",	.driver_data = AXP323_ID },
+	{ .name = "axp717",	.driver_data = AXP717_ID },
+	{ .name = "axp803",	.driver_data = AXP803_ID },
+	{ .name = "axp806",	.driver_data = AXP806_ID },
+	{ .name = "axp15060",	.driver_data = AXP15060_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
index dfc665f696bd..e48cae751fb1 100644
--- a/drivers/mfd/axp20x-rsb.c
+++ b/drivers/mfd/axp20x-rsb.c
@@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
 	axp20x->irq = rdev->irq;
 	dev_set_drvdata(&rdev->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4d770e718716..de6946d4bb13 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	const struct mfd_cell *cells_no_irq = NULL;
 	int nr_cells_no_irq = 0;
 
-	axp20x->variant = (long)device_get_match_data(dev);
 	switch (axp20x->variant) {
 	case AXP152_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index b352661d99a1..1badb4868d17 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
 /**
  * axp20x_match_device(): Setup axp20x variant related fields
  *
- * @axp20x: axp20x device to setup (.dev field must be set)
- * @dev: device associated with this axp20x device
+ * @axp20x: axp20x device to setup (.dev and variant fields must be set)
  *
  * This lets the axp20x core configure the mfd cells and register maps
  * for later use.

-- 
2.53.0

