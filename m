Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BCB1CF7B7
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583605; cv=none; b=kmwRZXX+VkIjp1eGQlOLSSnZCFo2yOpNmiJ2SkDmuGNiDhaB8CNbf0uUxLQpFjETlYS9ORysguxYsgYWRTKBGoFZJIBeNsGvMb49lFBXQQUUTnUxJc/kcyFtFpD8D1gkn4FZKO2eZo2euN4lAhDvsGHug3bdq/Uxp44M529LSF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583605; c=relaxed/simple;
	bh=BdGrjkiZQWh1WcuBimpPZ6XtKP2yiGuNF+kzNxp4Gjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdKPGfeSogF3mwfHfEOl66PWJa2etatMjOScAmcNLwMvvP0hfO1n/UbOMvvfz/yI0ST15cEbv490jghxW4w+WDTiJfNE/lbysCuJW3ADyGSUbOSUscsGeqJqCRV7CyxXWcQkJ/bm3ZXqmRV5SfX6WGzJHYwXYtZzaNKo8ToqF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMzW8PNG; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMzW8PNG"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c940512711so115964a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 11:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728583602; x=1729188402; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMe5HePhBUeYRfUt+t783COcyrs/YnND8+jdMLpIJ/Q=;
        b=zMzW8PNGfT86PpCBnMnHIuwW9LrX0ljf0M+p9jkK0vnOK3hwch/qT+czu1PWJ3bB5L
         0dt2i7JtJNPKJ4OnyeN9NrjDdsiJkxg0u7qJnhtMvOi6G/VSahjDdwCFa8caDNIcVsei
         +p0JQdlFktjENvOV8UweQYtD9vjpvUq2MCdeKtyk9naPDyi3kiw533+fqKOMWRPHPock
         RwGiOizOm7UGtgPTkO/W+ns5R/q7Wno++w42soWfl3CZLvA+KmbLcVd/PJFsNtA8IXXb
         SRoXZW4B5/lCB8hbAoNJoIkDTkgyu7+KtI93PLl8zgnn8ueKpoOQVF0NPbcraa+XzYOV
         +mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583602; x=1729188402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMe5HePhBUeYRfUt+t783COcyrs/YnND8+jdMLpIJ/Q=;
        b=qB5ni+JG5Y0cB+iF749T3fr4+b4A/sXAdQo6Ys/QGySERwPPLU1YMkURBzWlP9xoZ4
         tz8yIcDLVda6lGbvVhWTiXPETmMK+iKDQ7GpXnXQ6RSLWGvpQjpT4oamsH6JOI75BWPd
         OjfS5J7bvaJW7vMhSB4R35vbIlDx/o3lhiiFPjk/8NJrfRc/Msoit2+Vh5KXVoUtXJlZ
         gEBIsht3qwGD3L796SJDlTJ8/jDNWcVYBEjGl7DhkrH/fUn6zOgKd1erm83f+o7hMjUf
         KHqK4bOYIiF3lnThLUlLcxLj3xyJ/p/OKBXSzXVMIQPUmbaA3+aF3zrBrTnlMNFlHVhY
         x6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwymVtwZr7/oY613E51l2uXqeUSCvDXZQlju+krwUD4pS+LovBQQdJKwolZjvt+CEJ5lGhf9dE5e+Myg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBDktfJNrCiCrYuWiqth9tcyc48re1kb4m4ry/EwiLVGhhChOd
	luWsDQnNDQY3IuF0yg72vVHgXABQr9p4V/75RoS/+PLfxZoJB0J1QH+n6EfpLoV2rq26SMUs/TO
	X
X-Google-Smtp-Source: AGHT+IFjB63/jfrBk0eN6WcJADeEZxL3im8HrhNr5oZenhrqyJbL9Yal33sIcZCX4teS9nhkZm9GTw==
X-Received: by 2002:a17:907:940f:b0:a99:6ca0:30cf with SMTP id a640c23a62f3a-a998d117c8amr324118866b.2.1728583602014;
        Thu, 10 Oct 2024 11:06:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c1b8asm119757966b.116.2024.10.10.11.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:06:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 10 Oct 2024 20:06:21 +0200
Subject: [PATCH v4 5/6] thermal: tegra: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-b4-cleanup-h-of-node-put-thermal-v4-5-bfbe29ad81f4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BdGrjkiZQWh1WcuBimpPZ6XtKP2yiGuNF+kzNxp4Gjs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCBejWV/QRORUzTaED875a/UAIUxkqjmo8EOWT
 kMOrdM0W7WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwgXowAKCRDBN2bmhouD
 18Z+D/9J0c7qqVdhn8oGOHhT50RX0ZxNnG/KK59zCeLsNgdpi8PtrKyaLDCkg5tnoYFYe+s2Rtq
 4/ULr0gtVWSYjewjs+JwL2DenODGLK393X9djFuOVFYTJAkZjKwOp9u9vm+VeyEPWcl2fjZ2BC6
 9Yy4YtoH4iqpiwqsocJlCzguxZL7//bURxaHbhk+LbqnHbrwH9cKk+TecI3Ia6MATdkjt90b4OE
 ve40c/G5MAJOjcKCqgXJQkNiC1W9dQ+s5iQ1g1Y885Al3kHUKGi6A/cjqg5Q+JsfNJ73Q+k6rT9
 C08DY7x5GWlpVRdkNKEl/K0+oGhZUGhxZFwvgBAl91HlIgRn8LvMjQw7EaWng2SlLOwMQYrtlS4
 JxNaMGKbccQo2rWiSA7trOUY0dGMQOxTaYDh/n858DvzIKFgtQw8IxU+F2Kl01ljhF+j83Kg267
 pQuqO8JhZg1tvBE/XFQknST/+ga35RiHIZWgTusHM1fK2mgaqs7c6/Zon6sOLf1uDfsi5Zy0NEw
 y/LQdfnWOvr1EmDljXe2YZSAedCiMpEA3OiuuI8UU6eiSjto324tSJdfNyps3kLwZ/hL2OylK51
 XD74I51ro7VBUjK01Ou8JUDTG1qj9D/zbvX6BFPja9bPg6Hl9vRQP9yYKJqsV3Y7dWuWFsxpzKG
 GhkctaLnxk2P4hA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/tegra/soctherm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index a023c948afbddd6d9fc1a00b2fe310c71147bda9..ff4eedb553fb6e78c94b714dd179193c244b6589 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1651,7 +1651,7 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra_soctherm *ts = dev_get_drvdata(dev);
-	struct device_node *np_stc, *np_stcc;
+	struct device_node *np_stc;
 	const char *name;
 	int i;
 
@@ -1668,7 +1668,7 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 		return;
 	}
 
-	for_each_child_of_node(np_stc, np_stcc) {
+	for_each_child_of_node_scoped(np_stc, np_stcc) {
 		struct soctherm_throt_cfg *stc;
 		struct thermal_cooling_device *tcd;
 		int err;
@@ -1683,7 +1683,6 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 
 		if (stc->init) {
 			dev_err(dev, "throttle-cfg: %s: redefined!\n", name);
-			of_node_put(np_stcc);
 			break;
 		}
 

-- 
2.43.0

