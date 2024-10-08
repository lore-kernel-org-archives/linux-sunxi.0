Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465641D1E64
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Oct 2024 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378029; cv=none; b=buvaD78UnaLtE219VJUc5oNkI8385fwiB0Ltv8ycHXzb2Ekoo/dsiZDL6u38WTI95fgK2/html+Z3//8RjI8aXKh6oUJ+nfXLJMuwAN4MtmhLa8xNhPNYukQbVGhFKWuc/c2djKFrsSZhMBiD0y4VMVhEiaXSYHzct3xE+r7N8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378029; c=relaxed/simple;
	bh=fMDVmrSNIlAN6mKgDdvZqzHHbI0RRw3DAu9CnirmtAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAQWnhIBtO7iqzH83tQrLTVLjFXZm/nJtX5UFhNNf30ntJ5tXuf0BGdEkG5F6AW+s4UoJgVLNn7+0cXudpH8tamfDNQMeZ27tBSR+Svtre4+L5AjA1Ko34UGklUtmpZJFB5AIuux8VeK3NIANKSF59Pf8FguJHaJkPtuuCieSqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQKoez4z; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQKoez4z"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a994df6bf42so18428466b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Oct 2024 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378025; x=1728982825; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hI3WMX3UyIZgodODIkEfxJvby1HaOS571OBh/jtnnQ=;
        b=ZQKoez4zYRn5ujiJbbqNSbv+cceOLab/uNRBN2Qr8o1RJPD6VlQQy54CM7lbEm0sJs
         7BaLJG4vfOKkPxdz4U8RaLxdr9otuVHF5dqQKH3KZ8pNV9JcqN1r4Ki9CpLvU5/6FEEn
         vT9xx9sEEsFOGR1+GrCVZjE9xIlHZKtYUJbguzkEcDBDMDhJyZf2GN6yVVwtgkIln391
         kJWW3C5TG5Ei9KYefzMTCTJipSkNfhr1jXW4ntSyeT2ZbAwcQdfQO2vCeZI5BmltdFlt
         QkmaLEmNfY/Y/IJ1lNF8GrZLs3N/uUMFKCjh30dzCvZGXzbkMwsQpeZkwjh2TPs2T3jT
         TFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378025; x=1728982825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hI3WMX3UyIZgodODIkEfxJvby1HaOS571OBh/jtnnQ=;
        b=c+5yTQ9vDddeJYP4c3jSWWoqVY1YUxsa1HDyVy5FMjiO2/tAKJTjxBxK8Vne95pQP9
         XRlaGRuXm0ShveSI/vcq71YaW4NdtJnxxIdtVHZFS+1uBCh2Fy19MvJGCTq6SKguGSzM
         0PMiRrGfCUn02zSjhDyAdiTmBZBqXp4FFq9gTikM4gbFUDrKAsM3xuHrU4ozyJ3Za235
         8eXUwWmDwi2v2w7F4wq3QDpEaeEE4tMwvqKpt6QKnSjiRbX+nu0yFYHi9wOCKaELI9FC
         a1dBiVNk4xix/6V+tPmBRnAbl6xd2DMX+Qkqk82IAAAHFlG3A0WPffnxpuD4cgL5mUBN
         qBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0abDZ8WkgGVWUbam8L4rTp3p2e/3361KiIjVUpdKlfm+3YoBk05IP6Ag+Ah4hYt5c3UHIK9VvL8bD7A==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa+pushuzVEaezWgQPWixOJaIUBfHKQLV/7c4yJaVjBKxHDOEC
	+RjHVpnPQ+89FO+3OU3YI/+7/VFeoVEwgYkZjLA+pqXOz1TgJzZBSNM+Ml5l9B4=
X-Google-Smtp-Source: AGHT+IGn3CxuMTqoQCh13mz4jC9JwZZSlRHEULhxnYn2dzYEgwR+mm0SUFPiPolkk77R3YOE5iHsbg==
X-Received: by 2002:a17:907:980c:b0:a99:55e7:9736 with SMTP id a640c23a62f3a-a9955e79ec7mr244229366b.0.1728378025394;
        Tue, 08 Oct 2024 02:00:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Oct 2024 11:00:04 +0200
Subject: [PATCH v3 4/6] thermal: qcom-spmi-adc-tm5: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-4-825122398f71@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fMDVmrSNIlAN6mKgDdvZqzHHbI0RRw3DAu9CnirmtAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSd09eIsYVkCYVYCFtZlxLflDGibJpZer6/c
 cwqxX/AN7CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0nQAKCRDBN2bmhouD
 1/IWD/9fe/DMRWMYbu4UcWX2DGRdX/wQYi2rD7n8B+VkDmq0wfAQZ0HLkkbappU3ISFcb+qEqEo
 ukgaKzu1lpDWZXDdGsUfbinrxufa5/xftAt2khQWgmWq5QwdtwBIF5jm4dGHvc+yQEBaoJ3ZGeq
 aMXoaSTCMCAogUZc0ic+SdX/plf+qg7gs4nimuwtpndONT+hq3qYHvk3hC5x0nhAMJ0gSmKS840
 6g6ySO1Ji/wqZp81AifDouypuz7xj3vm2mKT+SWOOcYmnlx8gwHCXXvCgaIs1ulUwxMXkB11p7Y
 R6k4dVvZqTb8HSOB0Ez5JVkEJZ1w2HxF+rt/doKnG0Rw9faIlqf2eJ7B6DoujNofmCvqSrK5cax
 vCo+kx1rVHqwH0LZZdbgmYNZ7GrLR1yTM0gBfm0b0QQCHSgIw5EPAKT4ntW41iySAt9VWiWbP2U
 leE0F/Ffqbjg33IoY9O636bHq081Srro9eR1vdQmzDJK97cx2tBueTKltT6mLhZhz3PtgQpZSib
 x96MJXhDmBFG6meZHxPTkJXkFoc5punDftyolCJsk7u9nyxVx9BjzZ0mM5SfsX84ulV/e9OYOyg
 GE4vXrRlnSLyDllpDe7PngXzY8YE8XgxqOeDEEilgxx30OoFYTxCjzQYBJ/2YzVE4ieyMkl991V
 AD3UH91yTwkEzmQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 5e94a45eba3eef65e436a01b3aa58aabf5f706c2..d7f2e6ca92c2c9fb532ca5d4bcc22b6c2cddbdb0 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -938,7 +938,6 @@ static const struct adc_tm5_data adc_tm5_gen2_data_pmic = {
 static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *node)
 {
 	struct adc_tm5_channel *channels;
-	struct device_node *child;
 	u32 value;
 	int ret;
 	struct device *dev = adc_tm->dev;
@@ -982,12 +981,10 @@ static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *
 		adc_tm->avg_samples = VADC_DEF_AVG_SAMPLES;
 	}
 
-	for_each_available_child_of_node(node, child) {
+	for_each_available_child_of_node_scoped(node, child) {
 		ret = adc_tm5_get_dt_channel_data(adc_tm, channels, child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		channels++;
 	}

-- 
2.43.0

