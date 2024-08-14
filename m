Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA791C3796
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 20:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666685; cv=none; b=q2Jji+j0tpi+wi3KA81P9PqROyteXb0dNMfCal0nlkWmYgffbJthJYiIuoJiM1RVTRB5XaItkBWkvyAd3XmmxuA+nqdwcqwTDsOvfxmjRR/0kk1VYvA8vuFnAzHvL+vi0bUKUsCu5inAZLUP7V3STxb4pMCi37wicpIEjxgBeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666685; c=relaxed/simple;
	bh=Jfl9CCDjoTMAykhligO10CdduRTjKmS0DGo6xlPScyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S05fSQfU6ZO640JqDaHffkUM2xyDoQBJ1CpYS0Ec1ZD41LFcAPGwbdSrYmpWHoSHIpEtZCfBEIUVYEoI4SWJ8wSJEoujlO8fQSgIrYtpNdySqeSsh158sb2UiKcTvnTTmQcSATHkWQ1KBmrlCQB+aVEUai14UoLqWoNqwgkeOK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uYXA8uB+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uYXA8uB+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so1157585e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 13:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666682; x=1724271482; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObSCoIKHR53RsBAjPImzvWTBDUOXW/cdZ+itJeFwmLI=;
        b=uYXA8uB+I+Qyt1ES6jmZGTJhSkRpaY7tw5fN0mCVjwYIIz014Wo3Dhwl4F9S34ujy1
         QY9oTNp5+BPN04wTNXjGmcDKZsD3GhbOvv4bDcINUhXI4wSN1872to/iK7lJPi/bVhov
         mb7c1l2aiPFojMpkBlcTVMUUhofFqCd39H1W00UHclR7BPH8sJzxzWga+RfdWbf1pBmx
         2YTkWA8Wulo4LEZFzf2teGgq8AAobb90/Dh1Hr0R5VBgFWorCbG/FTXwnQGnfVT6ZP0M
         knrBbLu9n8tnV03x2ZVpE54/caldpR+stb8wVwoXJ+0Yos4faS+0LZkV7eSCqbZf+ToB
         moVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666682; x=1724271482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObSCoIKHR53RsBAjPImzvWTBDUOXW/cdZ+itJeFwmLI=;
        b=vP/YWkTkNrkiAyCUwb7wsp0gnHSn97Yw24C9Phwmso7V0eHPQrnW9HPUqctJxkPzQg
         T+jG3Po26rMrQ/dPshti+2pe7uhiVjyXudaB98AbWaZY7txrtmczilIPYfPbDugWUkEI
         ZiDFYTXMLLZgp33Mz1pKHPSDW5gATS+ttM2E9BHAGHkN0hBAgJv/MdnvXadK6OGpyEaG
         zLVQfzgb1lfaFSQ6JYNolO9FWuqGxnndGZsa4rA//kEpjDikcGedSLnFZc1PC3gPPw7k
         18DzuDM6K9Naqo9XT/3clGM5K2+yfT9SZYaRVsMsgBOkXS6qX3dHohiTkrpzxTUotM1u
         I/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm6Dwafn72zcu7NUAvJuSa/EKEt/hhd5BRdi2HjKU1/GX9KYaV3TBBSArNVnoHEsvC7WvhhqBqWwikqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVqnM5qWcTydwevG2f82dmrXz5OdkHeW0nYHYaaLnYPV8QkAwv
	Q3NFQkYajdxF1f7VsloyhPCG/0gJef7dUMI3NvE/x1TDWUQryAynpVO68tldzFM=
X-Google-Smtp-Source: AGHT+IEjqXpjYet6ypGc802+q411OKw8d01xxmNltI0G2Yu9eqYwp/090Xmw263ZglHYyBOUSAWiig==
X-Received: by 2002:a05:600c:4e8f:b0:426:55c4:ff34 with SMTP id 5b1f17b1804b1-429dd23b7ebmr25874885e9.15.1723666682300;
        Wed, 14 Aug 2024 13:18:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:18:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 22:17:47 +0200
Subject: [PATCH 1/7] thermal: of: Use scoped device node handling to
 simplify of_find_trip_id()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-1-7a1381e1627e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Jfl9CCDjoTMAykhligO10CdduRTjKmS0DGo6xlPScyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDww327vaCGWSmCQ5rATkIm5TMFxxObspRAg
 BwE3OcKQ1+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q8AAKCRDBN2bmhouD
 10wNEACYQM02wcgcm6jW32tliH/1WiMeu85GF915kaNTEIw+b5lwNX8CD1OIwKt11RUVLIrxq2r
 fjTc4r7xwznphVHVZG0DtaMp4+nIxLeo7/odUs8f7rapwhtz+8PHbyAq5mEk6VTLjkq/5MQIChG
 9CVFWkmuMj+cZL9nTtPPVITIUmuQDnslBlS27/vm5Jb2azkaZcg5dmgMj3QxGM9JyOfSuLhtqaX
 uF1wJBOafwHjG46OU/QvVVNGc7uZlBVpjRSI9L/ZZePiTcx7GhtK/GUm4w4WQpybcaJjQlmyghZ
 w91qS+XkrupTPhyZxQ2p0QBv0WBHH3eoeyP/LJO6AN0sRb87Lfifq7GyyVO1FA0+jOh+iYuRMiH
 sFid4KKB9Ahclv+XJHdCuXsUAULeU2SK3jtEiAx9fCrzqwNp7qyhGV0QqLAFQancLX1ZEdj31lt
 yxYCp4ee6/kKpcB3RHmdWZQUZ6X01FVavPeZIrIdyQrMQO+bv0a6zO3VAvD7pt6PqDPcSCgDejf
 vufLcOV3IRMZnObwPiw3RhlwrwMk+3FWdOKv1FmQtiAu7lD2PqMKUQPn/IozQAgXC+spvP3+90u
 3+BjIpQ4YWpDdxbwdvZL+rXHD7KStxzwqih1EwGP5W7NYh27CP/zXW2AkupPw42+FWnuinaa5tq
 pIWUfWMRnZDMyEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h and use scoped
for_each_child_of_node_scoped() to reduce error handling in
of_find_trip_id() and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 1f252692815a..a2278d4ad886 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/of.h>
@@ -22,11 +23,9 @@
 
 static int of_find_trip_id(struct device_node *np, struct device_node *trip)
 {
-	struct device_node *trips;
-	struct device_node *t;
 	int i = 0;
 
-	trips = of_get_child_by_name(np, "trips");
+	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
 		pr_err("Failed to find 'trips' node\n");
 		return -EINVAL;
@@ -35,20 +34,13 @@ static int of_find_trip_id(struct device_node *np, struct device_node *trip)
 	/*
 	 * Find the trip id point associated with the cooling device map
 	 */
-	for_each_child_of_node(trips, t) {
-
-		if (t == trip) {
-			of_node_put(t);
-			goto out;
-		}
+	for_each_child_of_node_scoped(trips, t) {
+		if (t == trip)
+			return i;
 		i++;
 	}
 
-	i = -ENXIO;
-out:
-	of_node_put(trips);
-
-	return i;
+	return -ENXIO;
 }
 
 /*

-- 
2.43.0

