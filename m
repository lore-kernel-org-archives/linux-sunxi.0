Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9DA1C7B8A
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 20:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666691; cv=none; b=XOIb6OMgSRaM7Dlc3iApSmL0S1Z+QSLf6dw4jbsQue/aGC7+DaEcagns+jhT8vqGyhXntmoiw2mhaXxlBd2QHRpdYarqBGDsFgystOaxKSoX514IfiTJg6yr0UzLLeIPqVa8mE3muf/OsmbC9rlSU09WdKpowbr2IsQSV6mFxqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666691; c=relaxed/simple;
	bh=M6Xota0thM0mYn1zZ6Ux2xxXCKU4Y7eLR8l8l/rV8NM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daYCRIOCAc9JmvK81i+EHlV6t2WZxtTjfibyGhq0HagEwaHgBz5LkcGwFVTqYXV/g4t9aNkG6Aw4WP0M1JajPn/fJIfM3pTRhO9GMtjyqw5LmoULbb1COaixDRFE5sVR/MIgbQg9xUbRb/t13G9jZ0wlOEj3ioajj5pd2KWb1c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvnJzcDh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvnJzcDh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428f5c0833bso7449735e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666688; x=1724271488; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYAN8fXpIDX9+PSKUATbbwS0hbvD/LD3aOg31XZDMpo=;
        b=CvnJzcDhguzOS3kqZO+qvrdv3R9Mi5hm/IFg3a+ouYQJZweaZBzjtgXjbYkYHGYEu+
         eIp3MLnZ1bLSeT/EHJ7U4aZ9/pZy6nUQSCygf20nBQhgqrkyRg5W8yOqEXznMk0RMmyD
         wZDExHpDTxUIuTR3kkLCh2pbSB3V9VEJ6XQWIL1MkDhWGW/fnugn6LTJno4gNMATiJj2
         4iQJwcYCVFbip9xtEOP1WcoZHHuJSLGKDDtBPkKdrwacPifIaYjAq6I+e/aFBczwaC6l
         /H5JVt3G+9DeZtfbnMBn+JxrdReRS2i7X//4gIyw1/gbD7n4WnZHHBQ08zI5TiB3zjiS
         mnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666688; x=1724271488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYAN8fXpIDX9+PSKUATbbwS0hbvD/LD3aOg31XZDMpo=;
        b=s0mNP1ZX6O7pIsDRYQBS3/6qoERtjJ6lhAmHIm4830GJngwu5CaqrGKyUydhEfPrNK
         mMIU/82FXfs5KuJuV6C0VCsFvNsONiq8h6AWr4K9lj1FWvj7fdezoHJxa42oHNB8FiEY
         7JSSU5RK29ibeMsXnchYQ+6woT4vfEybABRf4v0ob7CmSAI46S8Fx6GB3Rhzdp0I1I3d
         yy86AEttDtyeOAt3d4FbAvqORRTbWU9ZwkFI0Wn/p4zqferUrfddEUM5usX+ioYJBpDo
         6iUsS6GPrZgwHAWPscwjlz0mEEGxMOKkB3QfoC/cfh+gXTRQyvRKx8+oKDJ01WKjK9TE
         qWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbD+omN5dM8Qct6vwwmbz/9hlYOc2RXvsikVkqP6HzoWtu6KV9rdB37NtSi70xWGIhElE+ixBqK8YGg0tupRkP7SKqBu6wCHWOvYU=
X-Gm-Message-State: AOJu0YxpD0Cczod3k2f1pc+paswm5u64EFxsEnetms4kfVw6k4hIsJyQ
	vPSac4E2HqxhBQC93JpDf0TEn+3x1EAPjlWL1JUNZPxZPCuJK2n3lx9qKbsWJf0=
X-Google-Smtp-Source: AGHT+IGmwY3kKAsbbIqdA1Qy/7Y86HNZhbTxTi95aWs5EkZQvNUDlulFUHDoGmkvah5120zCV84YGw==
X-Received: by 2002:a5d:6405:0:b0:366:f455:e7c1 with SMTP id ffacd0b85a97d-37186c16564mr443264f8f.27.1723666688344;
        Wed, 14 Aug 2024 13:18:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:18:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 22:17:50 +0200
Subject: [PATCH 4/7] thermal: of: Simplify
 thermal_of_for_each_cooling_maps() with scoped for each OF child loop
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-4-7a1381e1627e@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=M6Xota0thM0mYn1zZ6Ux2xxXCKU4Y7eLR8l8l/rV8NM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDzIdQaQJ8rUf7OgqZtPMHSf44hK/AD4TH4z
 9HLy982xDCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q8wAKCRDBN2bmhouD
 15CEEACH9zSrwPulXXxTiZk/Lc++xQoUbUrbSH83B4cknQVxa+LCM48SUEiW4GBIg1S/iEBT6/w
 a1dB468nxbZGX/EYemdV+u8JHk+2smNdmdxPeoyAStQxxfT5kHbjXz3hcBnWm0U6zCO1D6Xaa7H
 PYh8o3kq/rSVm67163yZlcm8uKq1C1BFHh8SzSo29rbTI7iUp6NlTTQ9slD9tS7q7dIWPnKtKxl
 CYhQVUe5uVx6abJavCp39qYant3rSvcrhwRvGLSmR6V3nofw543wFbRRkTS67CzCzPMr6zsoLAl
 8ut5Nl+lGcRMcJhBQ7Sz532SI1z8WkgjkGG2pAGMedOeheZfCyRblUjejNGbZ5wEmaT/7bBLRjH
 hj8zLmIJLBF0VHV9/drTre03SBL5lfQGQss4QC+8SX9+PCpunnHUyh+5kKb6nO9pFXC4LP2KkpY
 z/xWltIXUXWJL/PSthxrDEwfg8IJrZOtnYIAw1dMYHdi/yCReViWn7j2+SmRYVHW3vYIlKrqsNf
 fUPDZEr3gRPsn/tUkM2mCJ2f50PoHifBu7szVGKuFt9fplMx0PvQbc5jHts9l9Kw5jlAYMea6X1
 TUsfqajTEUkIWJs/J9rsoifr+hkFtcInxNRemFo1aLAf3qylMzUL/zjMsy+mpIWmwNfAAEDbzO1
 vLQoWPt6VIWhhJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index fb5472d6ffea..d277165746d5 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -375,7 +375,7 @@ static int thermal_of_for_each_cooling_maps(struct thermal_zone_device *tz,
 					    int (*action)(struct device_node *, int, int,
 							  struct thermal_zone_device *, struct thermal_cooling_device *))
 {
-	struct device_node *tz_np, *cm_np, *child;
+	struct device_node *tz_np, *cm_np;
 	int ret = 0;
 
 	tz_np = thermal_of_zone_get_by_name(tz);
@@ -388,12 +388,10 @@ static int thermal_of_for_each_cooling_maps(struct thermal_zone_device *tz,
 	if (!cm_np)
 		goto out;
 
-	for_each_child_of_node(cm_np, child) {
+	for_each_child_of_node_scoped(cm_np, child) {
 		ret = thermal_of_for_each_cooling_device(tz_np, child, tz, cdev, action);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			break;
-		}
 	}
 
 	of_node_put(cm_np);

-- 
2.43.0

