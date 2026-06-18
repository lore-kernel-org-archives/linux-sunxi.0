Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6023112A5
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791537; cv=none; b=n8CkXV4TYiLbMzcr9CD20fpybmpCDZpdOPsChDuLo9yTYPqI+LzitrQ/fMnNi8cNfI3jLWIhP58Hmpby3+xvD9E0SmGdjeQxbe8j1aPerjkZhAjxRzl5hjwqtWw8sPRqkwDUg6cS+H5/H+owNCHM0MnB1lSwM7TRgIulzOv0YSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791537; c=relaxed/simple;
	bh=49WYRvvdESNtfeki+abkxDaeGhwROzrKuo0qUHo97Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YP836Y9tdRNZMxO/fFUVcz+piWa9xffy+RPbZQSsc728pcObRcuNKynrPsGNBhtJkmvKm3ncXMD676JOLtHBqwQRXPnnT9WbeonZ6Cgz3fwBn0hfoAo+qXUm2g9naUWpYfZ5F19kIy6edku3CLHUkojUkCIw5Oi97CiNtGNyM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUWqx3Nz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUWqx3Nz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso518422a91.0
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 07:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781791535; x=1782396335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFQnNTOYhtvDC41BGM0bxTP54ugtmHtJK1nGpmbfAd8=;
        b=NUWqx3Nzc8XHPJpLWAwVEAHPxvanJim3fcY4Rq5Yd2/H+nMNohPsutLEs7H6z8Tp0K
         zLBkJg029IhUQu6t5jRvYE/SA93kjlUAIQZuADGA07HPiIB4REHp8H0H4vqIKBR9NbVR
         8VN5FjeValtWP/9NZk9FQ50vPLGGK9mQA96agZa6gTZvRaILukGIdjPuQ76W6gOZ+Ktg
         hAFFvjCDqiMWDmu0ZFYhQZetry4fD3J9sOSxF9gkGCoIXlJrn9I0r1YE5ulZEjqW9eXE
         lC8xmJKjTPpr71SaOUQXehytiy2+I/Z9zK2Ycp+oL3NR8KCYSMooDHLhVmFh94nvImwP
         tisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791535; x=1782396335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFQnNTOYhtvDC41BGM0bxTP54ugtmHtJK1nGpmbfAd8=;
        b=KX1hBlklYnQzyjoTsHemi/vjnZsPN7jMO6FtNeXvLOVEFLMz/JjEsrB+RQ5yh3JK9P
         F0JRWi0wzeZw9il/p1MqZfYWQc0T+t/s0SVs0YppvjXglPBFvFTLw1sSRtB7adn+MxEE
         7OO9PFlaAKZ7rOIkn7OzapknXlJ+Rf3J40l/Xc/iGRxA4k74ZNWHtpWD3oFDQJ5B0QYD
         CUielwRnehLs1vSZAZLxFnkVLSkqHKG6G/EULywWedUgQVQ/8YUgeRPAU7A+03gEzZIP
         34jdr6B7aYNU+J4Dar9SXMmiL+oPqCbpCMkez35BrMOAzTL5NN+9qs63CTKsH5aoJvrY
         tIWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+X8gwIJWc1Vkr1+9ibxSvsX0sfg309rxVth17GbNvG7uMEvLxpu5ky7IO5Dh2NN8LTuzeGuw/P2t2UkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv+L4UwcrSqUiMSTOErabaZHUpMTClqdlnLpVHcD1gPRgQzi8w
	c3GAGAaOfuwsnpBcQbnS+lMbCxbpfTQOmlXD76y3ARtzSoG7eOzYVoik
X-Gm-Gg: AfdE7cnal6jnZ3uw2sTIrMN1oovKyNyJUJvizq1clIwNwAlQfrRFk5EUWVBX5oboblY
	kSkmFhEXDADhnTyvB2CG8LmdUkbmnAd0LKvqUN6viYg9J+LBkcTX6mtC2CUwOEFeTWW8FPGqT/+
	zUhoibRgl5WMYqyLGKqdcpWkIsDBUUULv9Uz1khme/Xeyinay+wYAxKN4R4iEQhvECoDqdw4fAE
	4OyMkYGfDQ2VyVpoTGWyuFZXCWrI+qkncH7M9DCaBPs/FQPuwPFp5VEhIzZ4LB/vJmT1nVyuagi
	1OR9m0F6iLzKlD6gT5svOC2HNM8A0TJVcc7ZTPQb6EEoU/CxnnmaAUrPs1bBqs3s23SY6vXHHKY
	iSEJ8vQgub6RfVf2U5W3VPFzWJ6R2dwWwtXcfdvffrXdlFTYvVJb/YPrQ4ToUikzF5cskexvag4
	LR3YvRdy+XcCqZUEMA3Exy4+AgtJBUcCS+s1S3tUiV0Q==
X-Received: by 2002:a17:90b:28c4:b0:37c:b248:1a58 with SMTP id 98e67ed59e1d1-37ce48fcc3bmr3902993a91.24.1781791535352;
        Thu, 18 Jun 2026 07:05:35 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2409:40c4:35e:20d7:2ccf:7534:4b88:ba43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca980sm9961202a91.6.2026.06.18.07.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:05:34 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: wens@kernel.org,
	andi.shyti@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH v2] i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe
Date: Thu, 18 Jun 2026 19:35:25 +0530
Message-ID: <20260618140525.11526-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617194522.114984-1-udaykhare77@gmail.com>
References: <20260617194522.114984-1-udaykhare77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In p2wi_probe(), the device node reference obtained via
of_get_next_available_child() is stored in childnp. This reference is
never released, causing a device node reference leak.

Fix this by declaring childnp with the __free(device_node) cleanup
attribute, which automatically releases the device node reference
when childnp goes out of scope.

Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
v2:
- Use __free(device_node) and include <linux/cleanup.h> to automate the device
  node reference cleanup instead of manually calling of_node_put() on error and
  success paths (suggested by Chen-Yu Tsai).

 drivers/i2c/busses/i2c-sun6i-p2wi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index dffbe776a195..8469a0ea98d7 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -21,6 +21,7 @@
  * PMIC).
  *
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
@@ -184,7 +185,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -217,7 +217,9 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
-	childnp = of_get_next_available_child(np, NULL);
+	struct device_node *childnp __free(device_node) =
+		of_get_next_available_child(np, NULL);
+
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret)
-- 
2.54.0

