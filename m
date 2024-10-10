Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D8D1CDA0E
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583602; cv=none; b=RvGCjkOfTuQHpMBTfNownfPHjHRylXoYPDtEqTnFokf0hwuk1rtA3g4qT1m3rX5nVJYE4n11ALIQCFwSIoLwl71zeqtEbhEO5ZW/OUbDhPiJxbBtNWGgluHDGBRKlMQ0tify7A+AfT4/ETLsxrIfY5kSg00UcwCGcMl6Ocrhm58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583602; c=relaxed/simple;
	bh=IKkYyEEUqBTCZShccEeitn/IT5/XA0WevxOw6lxgVCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEa+705no9HFtr3hG+PzGPVl0GY+LeIZ8TNFIAgTpnZW3BPFof6tlRWphiYyy9zstCfOy4nfvoV8b4kp8JYcrquyEw8Wh50YZv4WawDqv0rQJYTqVQbyFUJVSC6UVPSn9jK9g1l6WmhGlUiPBu5ednQcmZT7I3Ku6LfacHLTvb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7JMmfR+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7JMmfR+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c937982445so189473a12.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728583598; x=1729188398; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QMbawNbB2pemOrxGvjwG9oTD4DjBo2bQpJ4URqAkxc=;
        b=E7JMmfR+/krvWj6yRyOG26FcNqswBP0Ek6hSQURmnssMpKY6TTDc2101/MtEBLZX7+
         Y+iV2aNO4jqnlngTLpuoMHoGVy4QKQaJbkQ4d3rfczBAt9OD/PrEFjSF0kdzi8gZjfOE
         FEz87GsohnhV8w9yYR1VOxt+wQ6hj0gfKPpaTTlDKsar6HAEG8Lu81ZVvHI98wbNUu1S
         y1LzWbHjGq17FPDxSNCxO7bTyj0MS+NlkguCU/tztfLbwZVrVW304Yiq6NOVsQe9cEMq
         IG2d19/CpTTNs/AxRWTGPpYu/zqmeZ6p3oRfhUvpV1cQ0wm/SGmUiFhvJPnYKzgwGYZl
         CSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583598; x=1729188398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QMbawNbB2pemOrxGvjwG9oTD4DjBo2bQpJ4URqAkxc=;
        b=Y1ueuLuRa1ll4UJ2a5IPjh3mnDHlkd3pgF5JxDmt7Z9JXjbMGcDST8+AkOWDjBFSv3
         f4A5wLez7mdngZquERWjTfTziIGCdpQU8wWAr4Uk3TQb8YmsLLfsoIAB0itWS6zfwkZ8
         OP6XM1tOXlOJtZJk2xh9nfr8UEP6npAXiowDYa48dwoNOcReT0r+wpbe9UW2T3u2aj+F
         CtrERGKvUimwM6NzbTVv0y31++E+7mDoOVO5wrhOMznVpeCi+Bq+1zf6j247QlT8iIaK
         MiHitNmwU7aeoIdnXR5Ojp5Kju2b9GNu6TZ2PflXz6h0j70mk8iWdtiD88VBietsRSJW
         UpjA==
X-Forwarded-Encrypted: i=1; AJvYcCU57Zic8Ek2JWtoTTxn/PE7j8jl/OYcUQwwvdYLyaQ8lKob+5pou/zb6jVYbWOcA3vYmtm4CvGosqpcHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzG5lSynlqfWOqQr/F4OmgjGhq0I/F7kqiB5ypJsc/X0Xg96248
	PCEYRu1DjUnmBaOTYFqSf6mbRuvlDqjmeCk/kFT4wVCgHF4zoKDG2/HWk6h5MbuIZnsgZpC0C2O
	t
X-Google-Smtp-Source: AGHT+IGoLFle7c3swn9/rv3LyHsELE4XyheQpS1XJpGhNDCvGHEEviqlcrtkS1myk5GRLypn6mdLCQ==
X-Received: by 2002:a17:907:ea5:b0:a99:6036:900 with SMTP id a640c23a62f3a-a998d16a50emr323248866b.4.1728583598040;
        Thu, 10 Oct 2024 11:06:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c1b8asm119757966b.116.2024.10.10.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:06:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 10 Oct 2024 20:06:19 +0200
Subject: [PATCH v4 3/6] thermal: of: Use scoped device node handling to
 simplify of_thermal_zone_find()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-b4-cleanup-h-of-node-put-thermal-v4-3-bfbe29ad81f4@linaro.org>
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IKkYyEEUqBTCZShccEeitn/IT5/XA0WevxOw6lxgVCI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCBehPUvBEauTEbyosFo9Xwu1uK9auHaT6zB9A
 VFMj1hVK7qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwgXoQAKCRDBN2bmhouD
 1zQqD/4qvqH3gUy07CdQwQksDO1VwmECOuVXL8ucYoDSkfJ7iXfUWjIwVueTMozOgXG5ffgbbdh
 n0/UPMG13ETnJ8NHsDtPuqB08OQnf4G2RzZuTzqYvEOD/3aDQjpNLXYneuw3oWDhiIJ1po/jPoH
 hl65pj944m0cx7/B9hEHLRirR5BFuBvs6US40buZ1Dn60LcaLXb7OIWt6A+d8V+Ad2HOUC5rzjA
 YcVdtW8FmRcIy/6Tj8sqP0h3IBzAkFNE8rVCh0avCTYWFxLqd0FsrmlGKgqmSo3Z6ix7rH4hwNG
 JNq1kXjmrLBghMxb0m2IXA+XGhd9czJnH+CQypj/AHN0VLz49eMxBxelC+PoWRbbnhmB8oGhZZ7
 YTad7W1uGdR+kgHTfRpUwCzwSp70/AuyL5LzEo6YEX/UUCWqkivt6jvLTdL9vZKAKyyhxewh9JI
 XYkw8CYFFCp6ByuF4P5C86814J7wEX3x4faqcWIIo+KjUwC/2TZzdZJwrgcUJKOZy478DnqSEzp
 Jtm31R4QnRfz6xzkEfDlChFJDlWZiM4qibx9q+b90Cm5K1erObf+JEX5Aiavwv3FHio103gxUk2
 DMgQUXr9gpJMNcDQeXjTC93WlJUwttKVw02K0N0HYMu+KfwMaQBCtzU5XtDtNcuIb0W6Q0SQi3o
 6WsRYwn/NCW/aOw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 37db435b54b124abf25b1d75d6cc4fb75f1c1e5c..66514120f460940ed7cfba791140c958b99e056e 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -127,10 +127,9 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 static struct device_node *of_thermal_zone_find(struct device_node *sensor, int id)
 {
-	struct device_node *np, *tz;
 	struct of_phandle_args sensor_specs;
 
-	np = of_find_node_by_name(NULL, "thermal-zones");
+	struct device_node *np __free(device_node) = of_find_node_by_name(NULL, "thermal-zones");
 	if (!np) {
 		pr_debug("No thermal zones description\n");
 		return ERR_PTR(-ENODEV);
@@ -148,8 +147,7 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 						   "#thermal-sensor-cells");
 		if (count <= 0) {
 			pr_err("%pOFn: missing thermal sensor\n", child);
-			tz = ERR_PTR(-EINVAL);
-			goto out;
+			return ERR_PTR(-EINVAL);
 		}
 
 		for (i = 0; i < count; i++) {
@@ -161,22 +159,18 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 							 i, &sensor_specs);
 			if (ret < 0) {
 				pr_err("%pOFn: Failed to read thermal-sensors cells: %d\n", child, ret);
-				tz = ERR_PTR(ret);
-				goto out;
+				return ERR_PTR(ret);
 			}
 
 			if ((sensor == sensor_specs.np) && id == (sensor_specs.args_count ?
 								  sensor_specs.args[0] : 0)) {
 				pr_debug("sensor %pOFn id=%d belongs to %pOFn\n", sensor, id, child);
-				tz = no_free_ptr(child);
-				goto out;
+				return no_free_ptr(child);
 			}
 		}
 	}
-	tz = ERR_PTR(-ENODEV);
-out:
-	of_node_put(np);
-	return tz;
+
+	return ERR_PTR(-ENODEV);
 }
 
 static int thermal_of_monitor_init(struct device_node *np, int *delay, int *pdelay)

-- 
2.43.0

