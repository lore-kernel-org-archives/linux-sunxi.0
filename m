Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB367154449
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794061; cv=none; b=VH6/ksBE7IzHA3ZH5pci3y7GL+LUh3iBIh8Qlrf9EigeF8DnTLurtFydfsBsIObUbl5l4jdbLy9ACBN//IgJi/TPLuSMwaHiCZJRhqPS916tlXu0X3K36KHbDuCUs0/hlAsWMrNsmX3zvwqLLvHEiuGDLVxvxcGW3s9pp5igtWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794061; c=relaxed/simple;
	bh=7lYxEsVb/qq30tr2DD3cTPV+RMRQzHM7Fgim2MXKpBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRatjrR1vJQow4GEjcbnxjGl4KhTrfWyqyfnScCiMTuCNEJvxrjv1J0tLUqyc9U9eogGehf78DR85Dnj3xg1VXLdxuIsX6uJY+QFeJgQfY0YD4cuYjWb5WHPWlFtl5g904Q8hzkDFx1RqKzmeaATl51CzxHF7irQsos91ou5T6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3h27gUq; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3h27gUq"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f0271b0ae9so21727851fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794057; x=1724398857; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JdqhQJg9tqO70Am2MfrLJH9G5/c61L2bJdKSagfTBo=;
        b=g3h27gUqMenS6ab3r/G6bpRrS+ZfS+Fvl/ifrrYtc1WfWv2oPjK2edhHoNXASVRoIk
         CMpuEujS4XqbywS7tXHSYaiWc5MBUyrXR4HtfzZPByIfs9an+GAExMebqJNgz1BQzJSa
         RJY6UQCoa7na2RkJ8epLj40wOdRoEuqrd4AUrNfTSd5X073kfNCO/jPOMLvn4NzhYoy3
         6ayJMmMPjNQtASNiJxqxTyRZ18cBtdIWrMGVQGqTjyYjYbYxsgDHlfG/aMWdtQ1A64wJ
         OAfFSQkEwEtlAABScFomBagzn/Ph+Vq++xDyQf+XZCo+2+6KH40m38l48L5gp86es/su
         A3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794057; x=1724398857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JdqhQJg9tqO70Am2MfrLJH9G5/c61L2bJdKSagfTBo=;
        b=BPbtYkVOTd5ZQHmC0KdJib+QOVmCkqTc9FZ+ntN0wRtARO/2avWYmYhXlVzFwGPvBP
         IDmU3j5cM0oDgkW1l7inlaf9OwIEFGrq7e3mmAB21XiC+iWAjXt5ePUzhRVolfhUNFOS
         +/p49dcYcos+Te8bNKbze7+iWatljAREE8MXBEi5ZJB4ukAfW1tr5uSm4qnEYQ5SzA3S
         u1CArrMwkNckZT8sQPuEU1TvBL7EJgM1jDIx+K5YiEJeCxw6FZbXhrq8MbBpV2eDfsqR
         HiAT9CGoE/9i6jWuvKEulIrqneP/iisX3vWQCAnA5ONMuHhk2AbT3ji+TA6cHVLWoQp5
         MfEA==
X-Forwarded-Encrypted: i=1; AJvYcCUKzgleP6+/WMpHK0sCEv7L0SzX9iI4DZaMClJMnqtgxel7c8g4AjRKvrmzw/U632fkxbhFMpiWMjbaKunOEg+WbDAsBC7Ah7MISrQ=
X-Gm-Message-State: AOJu0YyxrhC93LdyiBhN7yXIX1TYVuG0SP1QDnYZcLtpWPBnb+bnZcl1
	1kbzh7puTICkq0MvUs9RPuVhjKHp9i98xDs0EB8UOE4aki0j7Di3TPge9+OAwrI=
X-Google-Smtp-Source: AGHT+IFng46YGuFdeI8Nsjr6y894x3z2p9eM8ib37Z+84ygXNOpNmPnx5CY2gqlXge3dOuzGltuT+A==
X-Received: by 2002:a05:651c:2209:b0:2f3:bfcc:245f with SMTP id 38308e7fff4ca-2f3bfcc27dfmr11018411fa.32.1723794056695;
        Fri, 16 Aug 2024 00:40:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:37 +0200
Subject: [PATCH v2 7/7] thermal: sun8i: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-7-cee9fc490478@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7lYxEsVb/qq30tr2DD3cTPV+RMRQzHM7Fgim2MXKpBA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ6UNfnp0tie7SEZ/wP0iNL7BdNyio7hvR8O
 v0rrbnESNqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CegAKCRDBN2bmhouD
 1yXCD/0ZSANIEvytztUy7N1aKygpEA0W+OtaWAfHgzje8/nrrw37Vj7R9F5U4d8bCnca1YbpaBR
 0hFoPL1ztdLpO+arwSdcLIm311bsrZFi0M9FMTULTEztYtIcWnFgUn2JgDkDr7NYbxliR1um32t
 CX+ZZl4YyROsC+sNKqeOFUr0vA/lAJPsSi4n8v8rKWyGSUwS/FvP/UMgMQy3KsdUhkNIBWAl5Td
 eZTf1Jso13H9hy4vqqQfK4vs0Yjg37f27NjIbisRXtmR2luP7BynqijMS4wz2YQhOREaepvqCT9
 sSpeHUc7reUrQg/QXq4/pXWUKc8JVdwkpi0GyQK0PLugPhp1zGJ27xHJknJ+8MDBPDUs9AmScrk
 SGiE5WS3faW4kayaCtidnEqTo6ziq3t8BlrDsIrvV4DOTcSTb7kZLJKoHJoVuOyGi8Uj/qTR3iS
 h4x0pRufI2cFbUgxeowOeRl2/j44xA8p7+TP9nP2cZDj0M8nKL06pS2z+GXlFbVicA9y7kgVGyM
 P1ep9T1Aoea+3RWm0ayHrKqsQQhtpWXvAKLpXyOLkOJikfRXvnIEXW+9l2HuynHGpvunkK4qMr6
 9JOC9JzZPWD7NctDtgPUhzxqK8O/Q9eSJXA/oXGJqSXUG1zXmcFlXCrv8WeoPh3Lla/ePLSskyU
 q2P213hlz5q6OXQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/sun8i_thermal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 3203d8bd13a8..22674790629a 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bitmap.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
@@ -348,19 +349,18 @@ static void sun8i_ths_reset_control_assert(void *data)
 
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
-	struct device_node *sram_node;
 	struct platform_device *sram_pdev;
 	struct regmap *regmap = NULL;
 
-	sram_node = of_parse_phandle(node, "allwinner,sram", 0);
+	struct device_node *sram_node __free(device_node) =
+		of_parse_phandle(node, "allwinner,sram", 0);
 	if (!sram_node)
 		return ERR_PTR(-ENODEV);
 
 	sram_pdev = of_find_device_by_node(sram_node);
 	if (!sram_pdev) {
 		/* platform device might not be probed yet */
-		regmap = ERR_PTR(-EPROBE_DEFER);
-		goto out_put_node;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	/* If no regmap is found then the other device driver is at fault */
@@ -369,8 +369,7 @@ static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 		regmap = ERR_PTR(-EINVAL);
 
 	platform_device_put(sram_pdev);
-out_put_node:
-	of_node_put(sram_node);
+
 	return regmap;
 }
 

-- 
2.43.0

