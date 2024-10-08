Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6A1C2306
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Oct 2024 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378025; cv=none; b=XmiGiXoKptLD/1oy0OF2MlxZHbkblyB2JMlGT1mHFcgkdW7KzxCyHeWTpIGJNPf2ji8CYrxtA7Vtyjuu+MeVMMQi6DyUv7K4PFYm1s3c5xYTGikpMD+7CBEfRzuIvI23kxEONFnLUkaXAUCUrlevMbOb3mPXx/p7NkqGLniYCD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378025; c=relaxed/simple;
	bh=r5aPI6Cjn0TQVJCWexA1Rya/HBg2dq+HlU8Qr2gItOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgzMWwvzcj2bf0bkboGjxjXR+ZpjI+xvYBdqnF8yR7MbrFuvzuGxI+6s8tO5ONMD4oRW85UoVkvtPNnMgK7LveA849suZn8WsXXXQ2McXf8I6mMbBfHFN977stdy//BvEZgRPQosmPMNpMzDbJp5Z0y0URzvfU9bT+2mz9lgY1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvD7Qzah; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvD7Qzah"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c8b1840cf9so911055a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Oct 2024 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378021; x=1728982821; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adCWIIzBDnCRS+ya+uwdE4DOJNV+C/EsMYDSwCJFffY=;
        b=zvD7Qzahd+COpg7YlTe+QPwqy0eYIUCo+Vsmb5lnqGIgY86iQEQAoN09MowPTbKNg3
         bAds0vrAmlKQmhL9WYgbDT0fi/MBiiMARXUXOOwsNe0zTTdmB7nk/b9mIN0PyWndRIHx
         L6yXHDuOql0H0m2BgxL0pjwW58JSBkTaZYTVOLet9vS1hzy64JVCLa2JJwcafiVYcglI
         FBlTwh/38FViuS64YkFmLlMSmkxuvPUHw2iixlfS4B9snHwXfQRiI0vEf8UZ1OEcV3sq
         Q7C3U7RmJQHDN2DxoSXrc/ui7GqRIlaWD7lB0dZMxDN5ljxXVM/Tby7LtnMo0R29gxsj
         2x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378021; x=1728982821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adCWIIzBDnCRS+ya+uwdE4DOJNV+C/EsMYDSwCJFffY=;
        b=kfOZePS+xjWgRSnfNz/w9ydfe3twB+RT/06WT6ukm/ZsNmzfjear97MdTG6PyVDteQ
         X3EkD0d8ObrsUjG5z2YMG8PLzm3lZy4Q2MVvHBVaimp7o7nP8EvwNofHDSrz6ZhKtOoE
         Gw/ssZ2zaSb5dr5DGMRvqITM4SCNTcAFq8hFkdoMbklMoz8Lff/SMRbx1pBVtDMEEoBg
         gAxF47uwzaAZAkJmV7HeZsfpDS2nJwQnJJY5NHVWLzj+CleTanyqaQPK3ilG4Wkzjolt
         oe7nmSsiNXmqgOGbQMCOD+CJDwt7ATPUWOTZlpVKLRY4wCiBVvoRRkUWOZ7D+1g69G/u
         tAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1buFcI00KRMubViS/CwmiKXPuwj9XIszDk8jaH+bUvzlXnAqejFk0LB2Tn675WPUu+tsT84I3TI3isA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJUP9qYqXaYupMS6qOEdfouA0eUIy0xekWsHnzQdj+tSoPPQ7L
	ML4g/2O2pbFutNYvJ1bKZpCjiqPg5aXBems6zCCamm/42vna/0w0T/gPqRTR9OA=
X-Google-Smtp-Source: AGHT+IFyV5YlbliLB9Sn5wjUH6COxSzrncdb5qLhEV2J0ae0yBBiwgw0xI+8Arc8blW6t7WRxnafRg==
X-Received: by 2002:a17:907:9443:b0:a99:482c:b2cf with SMTP id a640c23a62f3a-a99482cbc1emr374351766b.6.1728378021503;
        Tue, 08 Oct 2024 02:00:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Oct 2024 11:00:02 +0200
Subject: [PATCH v3 2/6] thermal: of: Use scoped device node handling to
 simplify thermal_of_trips_init()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-2-825122398f71@linaro.org>
References: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
In-Reply-To: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r5aPI6Cjn0TQVJCWexA1Rya/HBg2dq+HlU8Qr2gItOQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSceSnEJp2lwlWByHAa/bugTQ/6DRWAT9fJb
 uGRxYnCYsqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0nAAKCRDBN2bmhouD
 17qJD/oDEDMG+qPpZYnaeRaztl0WT4abQ4WaCF2e5zgAu1S4llK2iQRYU0KB6Ddesl0KwXgMASd
 lmhBMg7VnYj8ZVR1cKExnTlws7HzVniO1HtKucpHlVo/1w9q/4nF5qusN2cj5/1NRIWgPA+U4CM
 GixsfXrDqjN7X2TaZ1eD9alLmIWjLXzyCiC2Hv4/E87ml31QZI8BM61nDrC23BRD9QnYUqkJMcU
 +j0H+99j9zNVohXBZrjDt/Nv6e6R1/tw/vgZgsomtaoO1Q6K2XYkl03q0ceZQS4jjqEq0Gmi0xV
 v0u2ZQlDTkKdB0oCeTuBwOqRsI62HW2J8tSnS6be7Otj2SDBNKEMT+D5O/6Dn3x1U2U81G9kZ6T
 6EQQ8wQLExZprKqb89dkvyNw1gbBo5hKIaM+2PSXbxat3Jv+WpGq5mxrC2LfhzmFJmBqqjguyB/
 k5+i9d46I76NJz63ak0t2QV8I+zn+aC10/+1CPDRO3V1laC+Zj3uoelmnA3gvgPYv+oFFOR1VyN
 q27M4IGIzUPAAl2t3IKzEqO9qFpl/Ba7gIHqUVDEWXzxbhd2ylR+H1sPz57KliloCQZmRJR+Q0W
 1XqAaqaIAiFBXYKdSz/CZziyTsQTwHfi6k22ruGEkOWSbFJKBuyWMiQkDaWkCSH+YgwtHlvT2gw
 YynUKo3nC3wtIng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Drop left-over of_node_put in regular exit path (Chen-Yu)
---
 drivers/thermal/thermal_of.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index f0ffc0e335ba9406f4fd858d6c561f9d23f4b842..d7d6f62caa13d545e5f7fae4c8ac1e737bf4c4b1 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -96,10 +96,9 @@ static int thermal_of_populate_trip(struct device_node *np,
 static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *ntrips)
 {
 	struct thermal_trip *tt;
-	struct device_node *trips;
 	int ret, count;
 
-	trips = of_get_child_by_name(np, "trips");
+	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
 		pr_err("Failed to find 'trips' node\n");
 		return ERR_PTR(-EINVAL);
@@ -108,15 +107,12 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 	count = of_get_child_count(trips);
 	if (!count) {
 		pr_err("No trip point defined\n");
-		ret = -EINVAL;
-		goto out_of_node_put;
+		return ERR_PTR(-EINVAL);
 	}
 
 	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
-	if (!tt) {
-		ret = -ENOMEM;
-		goto out_of_node_put;
-	}
+	if (!tt)
+		return ERR_PTR(-ENOMEM);
 
 	*ntrips = count;
 
@@ -127,15 +123,11 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 			goto out_kfree;
 	}
 
-	of_node_put(trips);
-
 	return tt;
 
 out_kfree:
 	kfree(tt);
 	*ntrips = 0;
-out_of_node_put:
-	of_node_put(trips);
 
 	return ERR_PTR(ret);
 }

-- 
2.43.0

