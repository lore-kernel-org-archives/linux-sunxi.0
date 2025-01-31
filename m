Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241021BBBE5
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 23:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738365446; cv=none; b=WCGxlPJIUESFYlu49uhbIRz1kBRqClzOegKmlqQRz1b4/WyG5bnw4gHJ1J8oeDAh1jqXpM7jsEQmdkuZE2ZgkpFrqzBaT5QQAVosratXQZVOqTxBzLGCb3tDebeUIy7wx812Hly+kRl90VxUoZPo2CdPD5XXwNbTMfw4jUekNbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738365446; c=relaxed/simple;
	bh=E/t/k6EfGTIeDC7lGiOVWu6BC0LxkfF4ArWRMg5BOrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRE+aqLEWFyIG4INj4aLuL2L7BSU5siRgFzfsrtj740xMf5bjfOrFDcldzArAdQDqG5S1VJZWCtv46vjhiJaqFzz0ERagOwsRlaGT7uBMocsrMlPG4/Dx/+3uMw4wguGKLYpnMJoWqOSjCjQNbfwT+c+oGyvn/fw9THGfMkr73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgkL0Ywb; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgkL0Ywb"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71ded02b779so1404742a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 15:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738365444; x=1738970244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z74CjKyGOGsBmIUznySLFrDCv0ADaabpNorixVGmQWw=;
        b=mgkL0Ywbj2IuixZ5h619cdHZkekmgmm86664RA1AvfHOADzERX5C5RiGIxOwzwymdI
         dZk7jJa+LHJeB70Ko/LZv9RZOYmVTnN3lWgvJfB/KH6ICm8U2bIGD6krV3j6yAgdmA30
         /Nu7pHSzuNXY1esaxkRPmSTa8P9ZdSIOGYDc9TXVVS7XHx7nCDhFilxYQdflpZ0CoRjc
         iqgu4v3KT2HhaVKIyFjVbv3xiw27yboJC5SkCQA+jfzviXz6DKXlae3NhdW7QuWVoIm0
         o/HL5MQ1yj5oZin2RyTV5MjZuWJoqSiKAxKReSwdWxQ/glq+skAIIjWs1VzkfRW48495
         3I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738365444; x=1738970244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z74CjKyGOGsBmIUznySLFrDCv0ADaabpNorixVGmQWw=;
        b=EyhMU6bUqaGQ5kco85XL+4sXFvkwoY94ORRBhj94vd8Mq8UiHiCTRI8VV+ZkJ+Q8ZS
         1oZOXt5MOx08ipfdWZ4cHFsVxWm8IwVkMWv/2MtzEKUb4PAF/DAFevz5XYHh+qDUvRB4
         HCjEPgNTKNH/mHb8OglkNdFyNU+Ok6Vr7pIb4MdZMaT5eT7Kx1l0trOAdhlXztvPu4By
         6VNY5TEsnuf9DUiEsY6TBRC0hziIZyFVW3gPCmnvAtTeJIjFSNzjj1Hn2luz36E7Fh9w
         kN3jeJ5ujCOk0u76SwHZKWC8hGIL56QTDcOxeQvkrmcERpaLa5AfCmjxX8aTwgs5lrza
         SSPA==
X-Gm-Message-State: AOJu0YzznotyXYvKDSwDIqML4OEtlvBplJjSBxF+0OsKBWqNCXRnsw4F
	UR5bw5Q4pN5AVwS/KrQ+KiLEZZd22IrVTczMGJLp83GYYiZ6ODSWxH1wrg==
X-Gm-Gg: ASbGncuAvJE6LexnPGFx2/C3qzCLGAi/Oy0uvp09LkzK1YRAJ8eoid1Xogx7m6mWBTD
	EKYWigz5Mf7TC6vAVuh6wKufSrfXS5foGEd7I4B4l6N3tfCTz+VyZYwVWY/yOoCTPIMXgfm95Ju
	WdPYiQiuIw+W3QrC4Cnm7CXNHaN9qLkrWJlkzPATkuTvzRcm0aV28VNM9u/AR7MiNEOQCcEESmB
	ZyCNNqPCUGzLChmgFYJZFE1qD8GCvjpSIHNpnEbg3oKc7IJaJCDhWzwTU1sHTs5AHz9bUK469nF
	dzjBdiDZYPHe/Zs0xXIzIvd4WkYy9b/G9ZA=
X-Google-Smtp-Source: AGHT+IGhsSOs3k11DfQOkk9ydz9xjmi+WCq+e89tyN+zDtdBn0uZu/QVaP4CDdiW4iSwL+L6Q1sR7g==
X-Received: by 2002:a05:6808:2015:b0:3eb:74ed:5a32 with SMTP id 5614622812f47-3f323a63fd6mr8828111b6e.22.1738365443945;
        Fri, 31 Jan 2025 15:17:23 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d061:e6e5:c6da:b514])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365bf31sm1099128b6e.34.2025.01.31.15.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 15:17:23 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/5] power: supply: axp20x_battery: Update temp sensor for AXP717 from device tree
Date: Fri, 31 Jan 2025 17:14:54 -0600
Message-ID: <20250131231455.153447-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250131231455.153447-1-macroalpha82@gmail.com>
References: <20250131231455.153447-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Allow a boolean property of "x-powers,no-thermistor" to specify devices
where the ts pin is not connected to anything. This works around an
issue found with some devices where the efuse is not programmed
correctly from the factory or when the register gets set erroneously.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/power/supply/axp20x_battery.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index 3c3158f31a48..345a1bbe50ad 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -89,6 +89,8 @@
 #define AXP717_BAT_CC_MIN_UA		0
 #define AXP717_BAT_CC_MAX_UA		3008000
 
+#define AXP717_TS_PIN_DISABLE		BIT(4)
+
 struct axp20x_batt_ps;
 
 struct axp_data {
@@ -117,6 +119,7 @@ struct axp20x_batt_ps {
 	/* Maximum constant charge current */
 	unsigned int max_ccc;
 	const struct axp_data	*data;
+	bool ts_disable;
 };
 
 static int axp20x_battery_get_max_voltage(struct axp20x_batt_ps *axp20x_batt,
@@ -984,6 +987,22 @@ static void axp717_set_battery_info(struct platform_device *pdev,
 	int ccc = info->constant_charge_current_max_ua;
 	int val;
 
+	axp_batt->ts_disable = (device_property_read_bool(axp_batt->dev,
+							  "x-powers,no-thermistor"));
+
+	/*
+	 * Under rare conditions an incorrectly programmed efuse for
+	 * the temp sensor on the PMIC may trigger a fault condition.
+	 * Allow users to hard-code if the ts pin is not used to work
+	 * around this problem.
+	 */
+	if (axp_batt->ts_disable) {
+		regmap_update_bits(axp_batt->regmap,
+				   AXP717_TS_PIN_CFG,
+				   AXP717_TS_PIN_DISABLE,
+				   AXP717_TS_PIN_DISABLE);
+	}
+
 	if (vmin > 0 && axp717_set_voltage_min_design(axp_batt, vmin))
 		dev_err(&pdev->dev,
 			"couldn't set voltage_min_design\n");
-- 
2.43.0

