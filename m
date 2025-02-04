Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FD215058
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Feb 2025 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684864; cv=none; b=tzmzPfTUWohswnFipDwas6/CLASW536APQWU7v3vK4oEVvGqQu6UWzkCglDOp7u3/L6MwxSesp5zeA/dAJ5i8xbz34vy6Zq3mqR3RDesfp7Na2OK2vd+JGs2pylVoaEK6TlES+Wfd8oUBIRPFR9QNesl58CPmIIFVmd6PQcMsv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684864; c=relaxed/simple;
	bh=KF1RI0pWVfFg5Lp0NhxhVbEfbY0U8P5jbD5u3v6nUfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aix/KQWlQNSxbyEZxAx3/jwJgC1PCw7g7el2rcWXkW4beGJScqpsSdC0G4B0qyTap0gtWzXReZuTklRRdp506c8YrjFnYN4jypS4vjQg6CID3WCwrpjgOPrF/pKFSTi8PIUIlVp6IeDlmKhv2MYb9aqdv/D5yD8m2Gt/M6xbyYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnYrLn/a; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnYrLn/a"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3eb6b16f1a0so1763891b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Feb 2025 08:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738684861; x=1739289661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EreKa/glmB4TstqqkbwQwKQ5lTDJJhw97SZDxkdhrLc=;
        b=JnYrLn/aCG0ElybfMh65JFADb82Syxl+46Hf0RymaL7CQnvgGZ0JscpnpaMpv32HvU
         5qXhZlYU53bK52dAgv7HpXEERGijZTx3BCVPeDUFi7hqMaMnNLLrcSOiKasXaLYd7s34
         rN/SRrKiv7ClxwJST1KjtdLnQhDer0HKwKTs62YmBRh72vYEfAlkjyiy3bOf+I1iaA1p
         jEINYrOjUGaik624vXTfwSzb8/xJYY/GoQds67Wh60R62tdWsTbvKAKQ2cYK7ddLy4H8
         Gr5hfZ9kXnrb6sHak02NvVv9nIr6BsrSW7SwcDVumcS7uS72VQq4fdQqHEdRsxUCAX5S
         gFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684861; x=1739289661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EreKa/glmB4TstqqkbwQwKQ5lTDJJhw97SZDxkdhrLc=;
        b=E8hP9F95z1kWXDw84mHc2bRkH121B8s7bV7iQGPvVToltHw/NMKQpfemiAdYTuLpgn
         FBapYkqCbHEu9pUgEZg2HRXQaf5nKVa+TGlI09Aj3vyGPg2HneJxHHWmBxT2gy3m9R7z
         R+aXutpihiqb+EY1KXRhIxKSuHRulT5XKJ0e5gImCdnifyW7wi+WuHxvq02AiBbXj/MT
         9OojZDKjthnEQ8BHON4ReRhaMzegiarXXzlLs19Q/Aou8Rx+48EMw7WuNtd3pyP6HEi0
         zP03gapWmr6CMfyCDJOHOx1c2PqiPQSKEzhCgt2DECMmNRsidEJhEnIa5MHngi6ibs6B
         4WwA==
X-Gm-Message-State: AOJu0YwCT7dRIqq/fN1sTX7yxVDMMij7x1z/2nfqW0SFR1RRWn0YCha0
	RKfRPAzZKT9J3Ql1ufSb7kEdDIUH+urgj023oJect/an6c1ci1Rj8DViEw==
X-Gm-Gg: ASbGncva2BcFoHLJoQRZhUKDxWej7uKREebpovalgrKQOA6mrE6qebtSjLFJdDOOF+h
	pTrnzvjSew853ILkMFP9uPPbctehqk0Im1HqqnVSBfmeXsr0GXqbghY0BYpOKxgx4pgrl++pnW9
	yXD/EeCCgQdsX1GsUEZ3ie6S5CtiBptEz1HMNudKNDIVLAdrqz5oPI13NiQe/IXtHmcawQ+j1Wg
	DY4ej7Sp4nvJJsfnt/wtQKlAOhiY2TGPVkZ+Qz1lnMYpthiW1H+wxVm/JdDoNsv+kg16TEMTemJ
	Jquo+skJePpFl8M5FQFdsJH+hAHvdb41BRI=
X-Google-Smtp-Source: AGHT+IGeGnwNAQQbAZ7tdK5UNnD+KvjhU24dSFYNW9jKpCCzvwyJZPwS0UtSP1LLuECg7rLx0xGjMA==
X-Received: by 2002:a05:6808:3c8a:b0:3eb:512e:24e5 with SMTP id 5614622812f47-3f3237fc128mr18821605b6e.0.1738684861490;
        Tue, 04 Feb 2025 08:01:01 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:f8ca:b029:fcc5:5836])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365be86sm3039570b6e.31.2025.02.04.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:01:01 -0800 (PST)
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
Subject: [PATCH V2 3/4] power: supply: axp20x_battery: Update temp sensor for  AXP717 from device tree
Date: Tue,  4 Feb 2025 09:58:33 -0600
Message-ID: <20250204155835.161973-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204155835.161973-1-macroalpha82@gmail.com>
References: <20250204155835.161973-1-macroalpha82@gmail.com>
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
 drivers/power/supply/axp20x_battery.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index 3c3158f31a48..f4cf129a0b68 100644
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
@@ -984,6 +987,24 @@ static void axp717_set_battery_info(struct platform_device *pdev,
 	int ccc = info->constant_charge_current_max_ua;
 	int val;
 
+	axp_batt->ts_disable = (device_property_read_bool(axp_batt->dev,
+							  "x-powers,no-thermistor"));
+
+	/*
+	 * Under rare conditions an incorrectly programmed efuse for
+	 * the temp sensor on the PMIC may trigger a fault condition.
+	 * Allow users to hard-code if the ts pin is not used to work
+	 * around this problem. Note that this requires the battery
+	 * be correctly defined in the device tree with a monitored
+	 * battery node.
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

