Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1BF273D75
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Oct 2025 04:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761366778; cv=none; b=NIVANlmXo+h+rbfz6H/OPGu7MG714dYcLi2sFlW27fytpqturDYsjGfSRAA+h3B+YiVE3+cx0SivzI7OvGA7QNGHGRg727xxlHsfP/SMXbgoxLRk3bi/7rxJLYnjCyo/mrhId6ZJTI4OFznVt/N/PQrnkDwmJL6y/dfpNDBRhkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761366778; c=relaxed/simple;
	bh=J/zzc1ja43MRTCgO8LF4bp6opHtC/iF4Lw9TqE0/ybQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HY9SsCwD/yqoRPBLeS6RPcFT3+NyAy/ghJt/j5abwTgqTMrLZ5KW4VdqjD6yxXZqCg+2bpNVIBMQvqRm3oNUcyj/lL5gJ/VVJwRGRsMj+1PMUQaAg21hrsKtdhNaUNnxEJYm8DDwCM0B/3VYtH6jc3hEJeOjfcbWOoM1O1aSSJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpVAiOu0; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpVAiOu0"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-592f5736693so2811847e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Oct 2025 21:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366775; x=1761971575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU3qD3/P4X3aGl+GxoTABgHAWYmZmNCs4mQEkZTLmtc=;
        b=BpVAiOu01kUDl5PBYhAc1oox1mfJRAR0mWzsJvErh7ey4I2C7vDxZG9O3xk+qqa6Af
         Kge6NLWv/RxxAl4VP8ZU9B3VC0EeGUofj9pgkx2yXYH+vIkezvCiRSnNeNbIwusQOo+s
         K8spbIAmg3vI2fYGMNSKm5WqvgXEUtFITwlD2OZjyfFIPJ926qqDefjGaCGisk+msayn
         gALR/kduqlY8rVj0lJYE5EdNRrsvWjCfVwtbvvtDhH40vA0seIB71hM7nhMgRhihHFkq
         Gh7w+IRTPN8tJwDiYpG7VPbizt2eI5QTg57qKDozvOp4xO7vI6cEhrxoCaprUa6pkOk8
         jdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366775; x=1761971575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU3qD3/P4X3aGl+GxoTABgHAWYmZmNCs4mQEkZTLmtc=;
        b=BVdXzOIoRQhSQEp70t6k7glMZqgxVJEmylGcPG8tWqemCixPGaCxA5BugxdTAoJdFR
         ixjh6ybIq5zJFD4ztt3/hv0J7M56Yztbp81UOucp3LdILKM3/9qjq1zjGYAD+Qx3+gt9
         hRmR5Jy7pmYpjx8YYS8CAFNe6vy9pshmv5qbVu4poyhD/lzRMlsKjxM0d0m2hWK/heaT
         Rx7QslnYLaCeTBL5EFTSrT7WaWR87d3WsC04qocElTLNCdI4pIe12Efl9krfJSKscGIO
         2yt1gEB6HbvdQBVsjiRfWUfehtBWkDPKmJAXy21gLSj9T0R7WHQL/E8y9X/bBN1n+9J7
         GfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA5ScmZgqnlU0m3AEolR90Dj6AZPSEZ3mW34hj/6ODzGfYY1yosSbCU8g9GBakoyN9BtltdaLCoHeOeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE+kUOYTZzKeKwaRXYjUPwxN+JZYyqpMRQ/Ev3yXFmgHTlBify
	j4QlDNzE/v/CprFaIvtKLweY/ccXqc3oYTacbIa7wJwr3+ivY1EzcQOY
X-Gm-Gg: ASbGncs/W5YbLUi+98xu22G9Rh32qhARrk5/xbDEYQ/BgzR9XQV1CgJwprN3kxhq/5O
	oPjp+W93wftNS6oXle06va84Xdl6d8yLmVQK/spfOGdXopDglpj5F3jAvM0MbYv3uC2QKT9w6SE
	PpqcHcuYNksXRyntAjqAU/i4FkG/uHmAaHbwRN3ZgPCDj6yOm7aoOwbU1yPyHp81z+EagC9s+43
	U6Cbngsi2YEprJIu2b5/p8OUj+1ZQW/e/QuAVlreSgyk5Is6ZFK3h5vzUqIDl5GpbBTMU7/8U8a
	lCfPbLBqDuXGFjygo0mJUxFI90VbS0QerxQ8UVVGIAxFZc9KvTC1ONxetubnXkEzql6dZJA2MUJ
	A3nL1kiiP8/PiZ9NsiadxeAXdhRkaaORqHsBiZS0Ofl8kho0UHO0/Dz94BgE9RTPwo6CZnv/LuY
	PL
X-Google-Smtp-Source: AGHT+IH/eF1EDfMQXoqCn1NhnMmPtXp6P1wcPRtuabMRfy3u2y12SFECgEV2LqHRoicJ+PYpOzbYLg==
X-Received: by 2002:a2e:a916:0:b0:376:4430:b545 with SMTP id 38308e7fff4ca-378e4648542mr13765001fa.49.1761366774636;
        Fri, 24 Oct 2025 21:32:54 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:32:54 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Sat, 25 Oct 2025 12:31:27 +0800
Message-ID: <20251025043129.160454-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has calibration data in two nvmem cell. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 77 ++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index aa496e1ba..d6d8e13e5 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -303,43 +303,70 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
-	struct nvmem_cell *calcell;
+	struct nvmem_cell *calcell = NULL;
 	struct device *dev = tmdev->dev;
-	u16 *caldata;
-	size_t callen;
+	struct device_node *np = dev_of_node(dev);
+	struct property *prop;
+	const char *cellname;
+	u8 *caldata = NULL;
+	size_t callen = 0;
 	int ret = 0;
 
-	calcell = nvmem_cell_get(dev, "calibration");
-	if (IS_ERR(calcell)) {
-		if (PTR_ERR(calcell) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/*
-		 * Even if the external calibration data stored in sid is
-		 * not accessible, the THS hardware can still work, although
-		 * the data won't be so accurate.
-		 *
-		 * The default value of calibration register is 0x800 for
-		 * every sensor, and the calibration value is usually 0x7xx
-		 * or 0x8xx, so they won't be away from the default value
-		 * for a lot.
-		 *
-		 * So here we do not return error if the calibration data is
-		 * not available, except the probe needs deferring.
-		 */
-		goto out;
+	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
+		size_t len;
+		u8 *caldatapart;
+
+		calcell = of_nvmem_cell_get(np, cellname);
+		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			 * Even if the external calibration data stored in sid is
+			 * not accessible, the THS hardware can still work, although
+			 * the data won't be so accurate.
+			 *
+			 * The default value of calibration register is 0x800 for
+			 * every sensor, and the calibration value is usually 0x7xx
+			 * or 0x8xx, so they won't be away from the default value
+			 * for a lot.
+			 *
+			 * So here we do not return error if the calibration data is
+			 * not available, except the probe needs deferring.
+			 */
+			goto out;
+		}
+
+		caldatapart = nvmem_cell_read(calcell, &len);
+		nvmem_cell_put(calcell);
+		calcell = NULL;
+		if (IS_ERR(caldatapart)) {
+			ret = PTR_ERR(caldatapart);
+			goto out;
+		}
+
+		caldata = devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
+		if (!caldata) {
+			kfree(caldatapart);
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	caldata = nvmem_cell_read(calcell, &callen);
 	if (IS_ERR(caldata)) {
 		ret = PTR_ERR(caldata);
 		goto out;
 	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (calcell && !IS_ERR(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.51.0

