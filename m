Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D571411DF
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794053; cv=none; b=oykoSZukcm1chOi1nzy2aZe1XPaptN9QdkdNyEBVK1pgl5ofRPoj5S3gJzbVogQqEyK+UK+ftzEDUigTD36X8LnNnAipSFipFU/q9QIm36e35qHyplxEmGsxh3avrKkcDJyH4llWkme5stson67dTIgKB1i681lLI++pYVEaMrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794053; c=relaxed/simple;
	bh=6s2gwWxKV3mqwXT+dwK4AlJBQic8xfrisA4opFVm0UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdLakRhPIN53uyZsKDQ5XTRmwGh0LQ4jqm8HjZXTJaILmyoWFO5Gj/gLwBigWvFivCxjAlKt3QruwWgDsWVAzPKYn2Aeqwn82mkiNQjY1OixMpBVBPhNNA2+fxZ+nzOb8HgxRWUer7eiAVWRBauyx4dppkF9e9I06Dd73U7k71E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O0KN1pud; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0KN1pud"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso16861725e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794050; x=1724398850; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwBGzdvPQE1+PlP2CGFn94m3kIMhbJ1ppl7JVIwU/Xs=;
        b=O0KN1pudLPQPxCWpPXPBe4w+hv4FBqvTvruJjAu3iypEwbMSrJBNzbnHFKeMXBV/w4
         W9wExVtTkoEgvVYfWU/B7EJl46W/zL2oqqHh8Z7jUJQplfdOY0quG9gbcd4n4pgCyj6u
         pv6TA12m2sC+CggqBl4Wa0THCo1RuXsv1LAi+a5MKF4b7Zz1RVxPWL/jEE4O+SaNrT68
         iVq1KM3ILqPrltt3xc1IrlHJF+xPEgqbVckHciYswQo8S5dt5wiSf5Ah57T6FQlNG0OD
         kRuRTHvap1q3W9IOKfQjmdlj7js3FYlRs2WaPfTl7GzOfmmdjBO4DmgvrgAwOhKoCzVS
         Egng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794050; x=1724398850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwBGzdvPQE1+PlP2CGFn94m3kIMhbJ1ppl7JVIwU/Xs=;
        b=SHyPI3iRBIQaIxKlvnnfPyUooWen+Wv3L0BINxOUDitW20etdmoqur3qwVlvSp541O
         OdaSgPh5w2nXe26NF/GdHnURDTjuWZ0lmUafzhwy30bdl/NopFoVm0R1EUYA9tXPz37k
         vdAEiARiq1G2uKFNoxEkuDNrvE1ceZbUv373K6kq6doNBrvhY7N+giOB2gv3tz4JbYoG
         gaJgirOZNKP6alT6tyBcETFBQW2R6wmEWdC53lxO/MtbzL27/ceM7zr6takY0qEAHiWX
         aXnKHYR6G3728DxicwgZTp+Fzgba7WPWqPKQBpUQjcWE9zi5132MI/G9fJ86heJ5VsVF
         DoGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKCSr4f0NscsCtllnQTutAeRk3TCBaG2e76IPGRqyJkaa3n1jSOjnBIIQIdJ3h7Hscu3Uua+RoLq+HCgH1IN2dHYW2AP9pWVY23WY=
X-Gm-Message-State: AOJu0Ywe1hWUK1UdrfFiTsRuw14Lo96CoX4QYkhCdngOT1S0lNU68eTX
	giZK+mjlCz39uOlaNMwQSH96ffdfEw8r6UW70ynMuOPKRQhH/4N7Yf37jjLwqM0=
X-Google-Smtp-Source: AGHT+IHDNoBVC9DJTAN7nMWLgAJqFIpeUDbPlSUB2QVzC6f0vvEYmRzQmwtSF9FAc0KhjOO6gOsnCw==
X-Received: by 2002:a05:600c:314a:b0:429:a3e:c786 with SMTP id 5b1f17b1804b1-429ed7d63efmr16437415e9.24.1723794049913;
        Fri, 16 Aug 2024 00:40:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:33 +0200
Subject: [PATCH v2 3/7] thermal: of: Use scoped device node handling to
 simplify of_thermal_zone_find()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-3-cee9fc490478@linaro.org>
References: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
In-Reply-To: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6s2gwWxKV3mqwXT+dwK4AlJBQic8xfrisA4opFVm0UE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ2/xkGjrR2HLRRCkRnrdwrqzBDjdW9vwQDu
 1NHmeLLv4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CdgAKCRDBN2bmhouD
 14KYD/4j35A7vHJMVva9jFQ0cMzcZ6YdZMHe6OP0JJSb8mMlKA1s1B2BsZz+nMpVUWIY+2x0H3h
 sGzAoiG/OvTTlK7dxg73Z14uKEXLe/Nhcfpp31/tfPazE8Qt6Is9TEEwUcs1k9p6w2xsSnTnAi2
 splayRHNzbrKXwFOuZv3ZkT7j6pgxu0DClbPaZvmIx+gvOJUTX118gds8FK1oIP/ON2NfmOt6ni
 +x/AuGUdfVHzuk7xzuLIHLsAhAmhV/kj5IokJjSz5QZKCstDeoPDY5F9voMexvJinkW/I9znMq4
 YAfRZMm/g702PbGTzd8MGXn+Nit5dejzrm6DTn+k7RXZsCSStzsHL4KCHScpD/fxUkY0SzKRVPV
 +69zpM0F+mqxwlz4JPuCzUqQtfg5zvE2rHcQQrP0FitAQdciBV8jcPlJ68LpjClPOW6f711Kb0P
 pkUrptRVLQ02NqjvEhHsW4eGB3QBBX38GI4S8I45jHGFcw1XYgpinYeCq+SsyILyAM9ah0059VC
 QLPvv8lNHpqm4l66+odOdUugDwPSy3YGyfNn77ZpEdOOke7FGGNWRWFBFkofev2xJua7SqG4iy6
 cCcMy1kb+js5A6Y8XWzXLyZECp7oTRKQzg0whFvzwTBGjhWOTv9qlLW3ZhP1X/SWdF2fJ7z1CQv
 ImfcxuBeksGl/vQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

This depends on my earlier fixes:

https://lore.kernel.org/all/20240814195823.437597-1-krzysztof.kozlowski@linaro.org/
---
 drivers/thermal/thermal_of.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 2a50910f35d3..94cc077ab3a1 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -155,10 +155,9 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 static struct device_node *of_thermal_zone_find(struct device_node *sensor, int id)
 {
-	struct device_node *np, *tz;
 	struct of_phandle_args sensor_specs;
 
-	np = of_find_node_by_name(NULL, "thermal-zones");
+	struct device_node *np __free(device_node) = of_find_node_by_name(NULL, "thermal-zones");
 	if (!np) {
 		pr_debug("No thermal zones description\n");
 		return ERR_PTR(-ENODEV);
@@ -176,8 +175,7 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 						   "#thermal-sensor-cells");
 		if (count <= 0) {
 			pr_err("%pOFn: missing thermal sensor\n", child);
-			tz = ERR_PTR(-EINVAL);
-			goto out;
+			return ERR_PTR(-EINVAL);
 		}
 
 		for (i = 0; i < count; i++) {
@@ -189,22 +187,18 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
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

