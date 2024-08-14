Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B4A1C4633
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 20:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666687; cv=none; b=fKkaGJmG55TvVPzDiP9AlsWi3hlB4sXEOfJ1gYP8kprRqJZbuPZ0Nk3HtspwZS0Og/WPaUJRUuK+mHptgEeqPR3iJpB7PCnHdC/wnRAVHoCwputdfSzOiTQu6p+3TTkRc5Oe2b4Z7ubga/b4S+VvZb9p1s2sTt4aQp1G4FgiX2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666687; c=relaxed/simple;
	bh=ACTPT/WKeh8vPrxZG+9k9m7syH9ZC+yY+13QhJEgNj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WA020jLp4Y9vnwx393LX/BciYi4XykhhgYLWQaeC9W6DM8V+0tP1dbfT6I1MaaJvLH2I9qOBq/Ij9pe+Ardat9mSXouwIiGvKJThud51TkA3UkkuY8wXv7qn0FlegIRuYSm8dKrh8xQKYw1/A3J/DjNXnTAs3PDdIcKdDLmwvCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lv2vgEno; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lv2vgEno"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso1100375e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666685; x=1724271485; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++p+JxzQS5UPTkfx3ma3H7Ls6vAeOBS5jFyHbB6JISU=;
        b=lv2vgEnoSwIi34Fi0/J1UXmZHvSiwCpS4EMQBxTOzoiObFtRzaPWt+57kFT1KGReZ0
         7dwGc8IYqjTTNhOG1Km28NXa/lJzxhMJLmAuJc9uNhr6sEBvlbgPyIXrH0L4lnxjwp3r
         t2GI2iThylSXTJQKQQnjQgiToUU6oaFrh0rW5t6Lel1Lh1Mw9ZjMl8vt2PpBazUT7poC
         bANHepZdDX5R9fPXlRQCEyjfME+IyZYAEJih7dbh/YHc/9SpqJLp/xQ58rYOXrz1R1gK
         9aT7jRzxskst2EjirRSB45vnJ3AuaNAarJcfwNsftvY90PH1mM9AEqtQYA0sprUn/d+R
         VTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666685; x=1724271485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++p+JxzQS5UPTkfx3ma3H7Ls6vAeOBS5jFyHbB6JISU=;
        b=W/x/VnYI2S2mcAtdfWK0lDbhAynGDtbuaf03N1aJPyPjtaedN1rKL8fwSf5VZNpni3
         5zkIGwSFEnvmNb4zAXp+RRCuSTRjwr+Diwza1iedOkt66vTxQpbA3ijnRNgmXWX8PKn0
         PZZsQ0YQeqHmON617EeOu27sZJ/OFxClzwrkQvn1e2IGZ58+HQYaktayMoA6nOfRRTVg
         R7JisbrBn7/EMUWWr2k/IGDFAd+6Sj2W8aN2/jT3HX2sV93CUo8YZEpRuurMycniIGm5
         P2Bi0M0/LUw/+qLEa+q1NlIXMHo6ZM06dbU0U5cLk2JofJj0uZJDPiolnXLGB+F6amF4
         aW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfLbSa870SYowZNFA96wBU1TDYp8VNGIabuXWZeqDBV+JD5/P94RmFmqoJ8/z60GFfsjTKIa4VPg5KKfTutSAimHYjxKApfuv29/U=
X-Gm-Message-State: AOJu0YzYz7BRqdprPF7icoSJgH3pQp6maZfEbEumSmpkbtsM+x7xxIQT
	ilVBk3wD4xhA4oJygZ8BiwnCHF+VoW6tDrXTU4ZZC7HNzBc7Fhyqz6MrB1QrK3o=
X-Google-Smtp-Source: AGHT+IGZiGFg5LA2lGJLTze5FU5Hft61dd3QE0hb8QyXPgP+/VawCBj27w0F0jk2ArjxvKBIS0JR2w==
X-Received: by 2002:a05:600c:3c96:b0:426:6eae:6596 with SMTP id 5b1f17b1804b1-429dd264983mr25480435e9.25.1723666684504;
        Wed, 14 Aug 2024 13:18:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:18:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 22:17:48 +0200
Subject: [PATCH 2/7] thermal: of: Use scoped device node handling to
 simplify thermal_of_trips_init()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-2-7a1381e1627e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ACTPT/WKeh8vPrxZG+9k9m7syH9ZC+yY+13QhJEgNj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDx7NYdG6rXPPkRJrrDAHgRjoLKhzOmBCUbJ
 I8k1L+TZP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q8QAKCRDBN2bmhouD
 1wujEACJpmuU29GVP2zsxezI8prUfzlD7Dd1+Iqtv8zthOx8t2E5ZqFctpVVI+MKRT/R6mVKS//
 U4kJXFpNtgs4UEuc1kNVnl9nNX4jtvW24aQJmPkYMwlf9YBGuHWWYh/0LwjAla3bR7TQj3GpKGi
 cUKzjtiGHn/X/DsbY1vZNWYvLIxlf6liEtilmsZOJczvEQmxlyUrBaFhj4h7Etjgw6GvEiuBo6R
 +AUL0t1Ub4L+Da8vdWUd/DnOysxjTeDfAuY2gMpgRmfe4JFNF/BVhFc1ULBx9a373LNUvjlzI4v
 tzor1aruDD8jpccHc5jEEwsBifiYCavIf+/YwF4WYDV/JjoArEL0xavpKzdWaVsdEWBelvaFp2G
 Sz+7ZiUpDZQxiKiu5XYOPrUt/zBUb/Om88yNxspDCUFLpUB9tWapk2Bg5Dp1DjO7rtJxKrCwbKf
 FCU0iZo7E00Ibt8esX8i6IPfo96rrh2Uw43X3geCtY9zqA8hOWn/tZBiy0xxuNMOMR7MK7XYfK3
 1TEQ7WkvZi+ytUQEEREOvCBUIcf8GOou/ALd+O5SFD4yFWBnqpR+mEYDvfOMLFFnrG9FvU2EfI2
 ifFhHDDDczOFhS6oE3i1pHl7U3w1jzlco+CefAoXghMjvTE4xP3Pc9tGOmRp2XBFWnJVdizYn8r
 IJs7VOjqz7i23OA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index a2278d4ad886..c8ded4462bb8 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -117,10 +117,9 @@ static int thermal_of_populate_trip(struct device_node *np,
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
@@ -129,15 +128,12 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
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
 
@@ -155,8 +151,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 out_kfree:
 	kfree(tt);
 	*ntrips = 0;
-out_of_node_put:
-	of_node_put(trips);
 
 	return ERR_PTR(ret);
 }

-- 
2.43.0

