Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305114EC4B
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794058; cv=none; b=S/f5FGM3du+hFe2j//8JCmk9/8H2LkXyd8yVHPuEd2FhN7X2KUhCp9biyLlA7njwCs1a27QYauwaOuEo4QWPq+hBele+9jlY0hYXqUdE6e04Cadpx2cFwcFThTxaNbqw+jDb7x5fFXRsV3e8MgvzwbZNzgZ9xR4wTI6OL3i+eWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794058; c=relaxed/simple;
	bh=IirK1kH8ZFaYK+Qd1HN3sx/SR5DeUZclZQLJnYIcqp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QB0cT9SP9ZlJUc/wzxtoNpyP6Eny9kUNKF79/PhVrflZcQZ2SKOabgrMPThI3UP5KRpmx0+DoKqj/xqPUfYUK0Wh0dkhrZJNihS43WGB5OzGS91yfnDGicu5KrNh5f/JuUJmi9+baJEVswlzMSA26PPi+XXTeddrDdW20xbCgps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHOPtkRe; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHOPtkRe"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-530e22878cfso1708809e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794055; x=1724398855; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOnuVPSEiv2AcMdh6RSWf26c7BxWtZXwLCBzhkW1eTQ=;
        b=HHOPtkReUzn03Hf+2T2OZDsCuNEXiAw+6ww+fjzOpDouHYhmBSlARkvJKqhRIRUpXm
         P6xdzK/ql0dIZK1QD0NbNFnrfmmPoQoWGHcqcGMDy0h3OQDamdu9JoR0xweL7YxtNded
         +tIxdOGq0GUzWxQYDPV1Z2dV68CTSZmZjIZBf3Vuj1EuccGpx4wm6qZKBskqIihq+W2n
         f6OFGtAepomCXyU3U+vUlIGbLJuaiw0fLA/reb6o18oF2bf5poLJV0300vwxe5j7lxJb
         F0KYKcbDJHco8p9uQArxuLkCFPu/13YZadm+9Wrp/AuIBtvlYLP8k4bUAYAfWkpUOmIm
         Y4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794055; x=1724398855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOnuVPSEiv2AcMdh6RSWf26c7BxWtZXwLCBzhkW1eTQ=;
        b=F720HNue6DEfIbsSbAvhNwjGBHFfj3eRyoeQtcFIvJ5Tr6b9NfJ0VcyOwl4FmD4Vhq
         6/lEyEUbTYuN6s7TdHU67HzoR+yk03oAEA6jRzkvn0fnmgGRdEQSUxIS1qZhNdoFOakn
         H0d/0+lSacELNBMV9RzWoU6VJcEV9dQpzfAKUG4l/TKz2Tb5aG0ceK0wsK8dKJc6bTCU
         XcKbtTqQFUKlsTkLj/tQQMF/kgkLf0sZiNI17VFZIfR7+t3WNkUJ2vVNj5jmxzYsXevO
         rRJMKEYaUx/bQBlWIqXLE2mO5N8NkOCd/oSY+yT2EUxTMTHE1FeAJ0ZXBS3CHUj8k60q
         xl4g==
X-Forwarded-Encrypted: i=1; AJvYcCWEYoVT7yzCEswCFfTtDSWUYcXXmvlMiBScEPeiYnWuziayWXd31TcDgHd5xquqQqpliisnXK2BTzlC8pYkhNGSJpT3UbGRUV75DjI=
X-Gm-Message-State: AOJu0Yy+8DW6IylNLHFJjzjGg8FL0/JxLte7uu03SH4S1M7bOc2SjhKQ
	L0IYHeaK8w1MVzgdTwsfXXCFpQQ3bhbYc5HFS8ohggcw4+gOyWc2l1eG7bLIneg=
X-Google-Smtp-Source: AGHT+IGm5wS69TxUWTKg0DzxkZwTJea1xUpbHE65rKz/zhe5yL4AjAz5VVHvzlDKSEanOGu6NzifNg==
X-Received: by 2002:a05:6512:2346:b0:52d:582e:4117 with SMTP id 2adb3069b0e04-5331c6e979dmr1102171e87.54.1723794055062;
        Fri, 16 Aug 2024 00:40:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:36 +0200
Subject: [PATCH v2 6/7] thermal: tegra: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-6-cee9fc490478@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IirK1kH8ZFaYK+Qd1HN3sx/SR5DeUZclZQLJnYIcqp8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ5VFTD7jL8T2C8EqxXgCoZt3AMXm79PgzLr
 sTjGUCyw1CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CeQAKCRDBN2bmhouD
 185yEACQBjW7Xgteb2o2laP/JQ0q3JXG2b2i0GZGwB62iEyDcJl4EGxBEYWTcrT46Hu2ROUiWQp
 w1q3LqVeSLyeTgJBHMJsSkkjhfuUxKQWw56DNwzQKUAyh4Fdvghc2CKYG+cwcEqTJQL7tSdDgZw
 KYLGFFrEkyk3wlvOtQakEetOfeo25JvN7cRrlsXV3PoH7YO17+UAPON1ou4KYLlykgmm/ppYxUd
 zfql28aKU4u9B2AymcC5MR22oqSwFYKHVjQee4HAkz8S8v3VxD+I3eOrdmsVTiEukprVNg1i6TZ
 xDhx4+YF1Js9VHiz2UVhiS1WNClUjtIuJRk+FxwL1cfiMLo43nZA2J326D9ZW5/QTY1wQDRshq8
 pYZv/BwvC3nqcvQ1L7hQdwtGEH/p3B6EqwVyNuTsVQIMWdU2WxbS9n9ema0tyKKRmhXFNiKERvg
 Jtbbz3Nn2TjOjTzxxSVJJESFTZ565vyBN4moKHimhY2oMLxrSrX7af74T4DSE8QQYtOuOPRhHaG
 YURgdAWhPOrQxyXTmWnTKOsanvyYzCnnmD4G+PoRKKH0ukZbLede20bOFqANr+ARvzEvAPEKL/0
 Ot1U/iyTkPXgGJFg9NJxZCHrGHulNvz47ruEPfYLGRTO/XsI7D2CInaZbbbJqzrSxTFMgr/2Tnl
 OIS185LIZoedfSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/tegra/soctherm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index a023c948afbd..ff4eedb553fb 100644
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

