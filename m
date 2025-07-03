Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E462ED143
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555624; cv=none; b=pawMcuetWtpT1/nbr4x2Vkf5c6UTuTbnXLFJ9kBIz/ISXztSKt1V7wHQbo1V5kdSnXxK5VvFcPs3t3P8vm+bc7d1j0ZL+9bFON7ADcgqvC5rya5t8MTGAYYFz/Fgsbp2elHKdyRx7gGUagL/8kRxN9MD1Ckk6jSBnnGG5HI31a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555624; c=relaxed/simple;
	bh=tt5pibkTiOylBDZcb5XG/k6MGyyVGkm7PBa6bP2UNZM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDpst8GgY7Es05zLlM0pErNFknNV2yk9xSqx4Q4MHQPRaZOGnvhc6lDhRtagFQmTbCWSjYHyuXyn0y5QorL0IM0OKxEJ8LrdvdJBLEhvAhbMCvSgpbg6WjiIp2MEm1jHXs/eFhYmcxmfjbjAGnzSGBXF9iKn2oynmPvNH/h5NLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzaERl+W; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzaERl+W"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55502821bd2so18254e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555621; x=1752160421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTtCCKdSkgMTplzEICqTViHzDjQLzZrHGfmUBwRIypA=;
        b=OzaERl+WHWfRqDFKqvrNtBZKF/5/mqSf6ez3p52j+4mKizNknQ5UaEM2sMv7w9Y9w8
         BPRmhy1F9OcV8SoU+7lvFFo5PAyV/lFjm7Lz2Zj1+Wq0mkzMbw7f2sVZwiKC0P7Z1V4o
         dTd/A/q3VH0JLlPwS2RTjvI6sFTzr12WZW+r2aHjUyZSg7Xr2icHf1SA6t2C8CAnEVqv
         14i9T84tE9X6QnOJPzu7WyFFydEjAFbSbXA438KtwdnvTpHwh+KqGkugTZ1s9sOZp3Mo
         +pYOLamcjwPR/8kEQ1A4j7eif8lxbF6Gv8SXUNBJnOdsL8+ixWE4je5hq3o1zjqgmCP5
         XX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555621; x=1752160421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTtCCKdSkgMTplzEICqTViHzDjQLzZrHGfmUBwRIypA=;
        b=pzUC66b0g4Hlzo5jJfmnZI9mg3kttUcKdN1G8pvzCWbRp7YIMhYFk6S6PejzZDF9Vf
         Lmus7vTGxkeSk+TeZL0gnqR/NqFPq7pOEJ2JVihtnu0eoWWRJNB35jA3BUrvEIGgDq1F
         w+uT8AIFRoRxNzBHiOftjT4GHiQslPybsEBWJijiUI/R/YXLie97dh0yCYeSz4tOMxGh
         2ICFemYHXbRVbu6WbnLb+YE/ugQu0FTd5SbKv7n0Wj4l7PFoVfunedbOKRdC1fmz/Gw8
         KEue/STir8absyqTU02Hct5pFUO7iwRvIatTHIhtXPO/VRgmZNVKE5II6VrcSJ/V+ErW
         LlNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAkrMMAjiVfmjG1wAWcJzXKOZxz8LVGp2BT2cEZ6WjCimnztKyS2cWnsokgHZPGMbCMdSgLgdGhl7rUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIYLbBaz9zXF4yS0o0xtjXOQlxOLVJ4pxmKoSANTI2pGup4ZIT
	Ga+moQ8Jecot3PJGNRSzDD8v706Fsbuw4EyNV3gfDoCtw/PexwvEgSC7
X-Gm-Gg: ASbGncs5sAefpybLJ4Q0xDs6MvUPcu1xMbQV1NbsGatgtF+8QbTFQn6VpO3pMinhVwB
	mQMZPsNdpaauj45HHZYEUx4OeIJoX9idE5oQk7APRa36q+myiw1PqW0JaTLEbAxJZmS4XRdzzvy
	5BHRlFsArqOAYghhEyh/W68XdhyOqBhtw0WqYfWQ/GSn8Ab5hKPN+9Z5M5MWsKkYTje0i9suNKr
	pA/1cHHTHBGhrKTZpncAr4HEhO5VRiTioqFwol+Itk5HNuO2cZ8GkNUHQo3gJv/hp491v+8xzHy
	n1yRbuNT/R4zmwg9osLo+LvQsebtM8cd46+5GWxQQQXFvWXhDBi39VH+K+6k2UYnwio8sww=
X-Google-Smtp-Source: AGHT+IHEoQ3VBnGpUAKadTkkygNlVfx/f5KZwlHVuHvFboG/MKYSU/fiu0UHxdI8WmXTbNEBc9ufgw==
X-Received: by 2002:a05:6512:b12:b0:553:50f6:ebcd with SMTP id 2adb3069b0e04-5562ee80659mr1189950e87.10.1751555620488;
        Thu, 03 Jul 2025 08:13:40 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:40 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 5/8] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Thu,  3 Jul 2025 23:11:29 +0800
Message-ID: <20250703151132.2642378-6-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has calibration data in two nvmem cell. To be able to add
support, the ability to add data from two cells into one array must be added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 77 ++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index bdd15ee45..3f57f1a6b 100644
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
+  		calcell = of_nvmem_cell_get(np, cellname);
+  		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			* Even if the external calibration data stored in sid is
+			* not accessible, the THS hardware can still work, although
+			* the data won't be so accurate.
+			*
+			* The default value of calibration register is 0x800 for
+			* every sensor, and the calibration value is usually 0x7xx
+			* or 0x8xx, so they won't be away from the default value
+			* for a lot.
+			*
+			* So here we do not return error if the calibration data is
+			* not available, except the probe needs deferring.
+			*/
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
2.49.0

