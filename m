Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312C4C74
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788999; cv=none; b=FOphuuUrcOjHafUFoczq8LcUIY20d9HFN3DPYQLqK0Y2CxYAr8dWfp8ZlTKKG0MSN03TbQwT/gv6Ill5Q0qPOVUqWefRAIjkNXoHu4sRskziuUS1AFMDvoa3/Je41MJz9v22GtuyI7l3kZh9HtPahqOfxvrNjvlocRLMx7fjNoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788999; c=relaxed/simple;
	bh=E/uUePM7a46y0UkgtyPdkbBAs51qHEH/jq0OTlEoicI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKXRXT2iKe8+HDb8nEKeqYU/n+ZYz3u5Sf2xENBTQK2rWIVBIWVOcS1tvYxhwB3YtCy4q7TcMNt5Iij6Bn6E3OtGDL5dSqM9lbXGzS9RDqWee1Y6iZ2vAEx8ivgmqJmfLVXIVdYDAtwae9fPCAOFeezGK5RwBiJIL+MwHa6pUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MdMMyMvW; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MdMMyMvW"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso10889579a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 11:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750788995; x=1751393795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEjv4F6KSOcClNbcVqHshoCAEKi/vQAT9lN/7mgczII=;
        b=MdMMyMvW2QCwk0usG1ICM7wAzeBSxgu0apegSlmpcxwBk0vmvoaFy2iM0CYZiHLF3H
         1VFA9NHg6XOFHpjdczc8qn2t/NX4oH3FWHGWuoadC9ZOInLuQqMTM4RTbDesZSPepYly
         Tw2aC1Lv3hzU6kLd2w+X7pEQxbT5WF0RJwhV9g851u8DyKJbPVDgSr5Jo+iFbPRaJdPX
         hx3OwDA6sMApmIXNvqb72CDQQ/157tBp+F2bzEOoPbyR69Z3XfqmThCw1rPnPIhqp8+m
         YvVOfzBqOniNNocyQBLJygC3tBj2+bPZKcH3NKBWm8F5brpPQq0Oc0eFDHTX3TDiv2Aq
         QKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788995; x=1751393795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEjv4F6KSOcClNbcVqHshoCAEKi/vQAT9lN/7mgczII=;
        b=tOcfw1Hm8TnqzGzmhy6KV6bxfdDwL3botZ7mOlJFjdjY8c3Nbvvm5iAP+j0Eu5ZPAA
         YJkfFtHGRcJYr2hU/+BbHk1KEkPqSW2eRJsPqQkY5R34NrUZ+KD3m54TLOVcLN9OV1uA
         XjDf2EY5snpenZkg9iIAEbvx+kV8f6+FDvIM3D9CRmFS/2dY+p1Xd0bLUoW0tiuorjJC
         d+cxmevlkb0yI+4qf09K/EhhojxeMYHxhr1wEGVHdn0BRyQM0VU0iyb1A/G/1Cirdj2u
         hHeJwBiyqarGAMhtrMYShfQs1wN1l6HueWDDpJBpURtnQqNfJ8vYNd9NBr2yy4HB5c87
         bHQg==
X-Forwarded-Encrypted: i=1; AJvYcCXYi5NPFPEJI5saDKVdztND5X3zjTKARy7Gt+VA+NF8Bfuapj5PSLfPZ0UnT0wIfXlgqFGXJIqwRtKU2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ5Y55g1MszhVI/LKT9ytOV5O21oJ7GyCjgnd6jbsVFcq6RcdM
	cF60W5pBYoRecVw0de1zQ6UieY/LeNcu4C0eanVKiDuJme0C7UsggDyoB8TMy3Qzu8Q=
X-Gm-Gg: ASbGncttOcY1oX75ObKMSNoWp98QpajfZWU6DDdNm88+/J6M5jN15QppbTvfohLm5yO
	dYg06jKyqQMabMKsXgMtuRLTqf2I4748HJid2J5dkn7sQJIfl2/g2o/Y68CZx7zH+eMLOaL5r8M
	eGYZas/QlJomcuCcpdKnoJ0whA/BlrCN0kBbk8qoeFNoGtG03rxq6MlNqKIkxU1NHV1lKSrk/Gl
	p9D1bmy0TM1ws6eTx1kvqfxtp7Tgbq7SDYg2KeR16DrLdOEHA9x42KnMkwrMymCsUSA2UDgJjKw
	zpY9jiyvWDQ5fxOwZT2bkPjIhPBuj8XFaaLjPhsZ8Gh01fa68pJJ/ySTmx/HC7suzug=
X-Google-Smtp-Source: AGHT+IEBuy6MlT6u62EQdRkXXyLoqvydf3fc2sW2sY8y/XmffxoA6g93x7kLpzH/nKHARpOTaVXeag==
X-Received: by 2002:a05:6402:2787:b0:60c:4782:e4e1 with SMTP id 4fb4d7f45d1cf-60c4782e825mr471973a12.27.1750788994579;
        Tue, 24 Jun 2025 11:16:34 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60c2f4682cfsm1357564a12.39.2025.06.24.11.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 7/8] pwm: sun4i: Drop driver local locking
Date: Tue, 24 Jun 2025 20:15:43 +0200
Message-ID:  <87b71c46b82b787959f0cea314d3010f16a50a29.1750788649.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=E/uUePM7a46y0UkgtyPdkbBAs51qHEH/jq0OTlEoicI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWuthUg2J6w2ChMNVvit4yXPA5cDRrT0c/S8gW 4HHQIQNG0aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFrrYQAKCRCPgPtYfRL+ TjNGB/wO0hqOPlv69u2jHFp28EXbuBIuakfzbJR6Kdu2hu2gfU/7Osac8aAdtKXPA98M/zP3KSD zMVYhpn+mGKi2Io57AJuIcfNYVQSZUT3CqXf6QAQmeXAOFxCi0g1nE+wSUIsN9NJyIC6n7+65Xq O27FjJEQrrhrNDzXNvGfWJn5O2hk0Hyfi/t5aENoWcy6sg88u3sPAsgzdHvG9UYOQc/9yjEaR6m /jPX9EWcS7ZewwKR/tZf4MgxzQr7/Ov/S41lh31r7KMi09KVWOV18l1iT0dQ5+UaphXTk4jvKAT yip0E/lVsUngTPdTR+cONqYKBxPOz+Rw07St5K7dzBdJMRtn
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The pwm core serializes calls to .apply(), so the driver lock doesn't
add any protection and can safely be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-sun4i.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index e60dc7d6b591..6c5591ca868b 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -21,7 +21,6 @@
 #include <linux/pwm.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/time.h>
 
 #define PWM_CTRL_REG		0x0
@@ -85,7 +84,6 @@ struct sun4i_pwm_chip {
 	struct clk *clk;
 	struct reset_control *rst;
 	void __iomem *base;
-	spinlock_t ctrl_lock;
 	const struct sun4i_pwm_data *data;
 };
 
@@ -258,7 +256,6 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 	}
 
-	spin_lock(&sun4ichip->ctrl_lock);
 	ctrl = sun4i_pwm_readl(sun4ichip, PWM_CTRL_REG);
 
 	if (sun4ichip->data->has_direct_mod_clk_output) {
@@ -266,7 +263,6 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			ctrl |= BIT_CH(PWM_BYPASS, pwm->hwpwm);
 			/* We can skip other parameter */
 			sun4i_pwm_writel(sun4ichip, ctrl, PWM_CTRL_REG);
-			spin_unlock(&sun4ichip->ctrl_lock);
 			return 0;
 		}
 
@@ -297,8 +293,6 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	sun4i_pwm_writel(sun4ichip, ctrl, PWM_CTRL_REG);
 
-	spin_unlock(&sun4ichip->ctrl_lock);
-
 	if (state->enabled)
 		return 0;
 
@@ -309,12 +303,10 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	else
 		usleep_range(delay_us, delay_us * 2);
 
-	spin_lock(&sun4ichip->ctrl_lock);
 	ctrl = sun4i_pwm_readl(sun4ichip, PWM_CTRL_REG);
 	ctrl &= ~BIT_CH(PWM_CLK_GATING, pwm->hwpwm);
 	ctrl &= ~BIT_CH(PWM_EN, pwm->hwpwm);
 	sun4i_pwm_writel(sun4ichip, ctrl, PWM_CTRL_REG);
-	spin_unlock(&sun4ichip->ctrl_lock);
 
 	clk_disable_unprepare(sun4ichip->clk);
 
@@ -456,8 +448,6 @@ static int sun4i_pwm_probe(struct platform_device *pdev)
 
 	chip->ops = &sun4i_pwm_ops;
 
-	spin_lock_init(&sun4ichip->ctrl_lock);
-
 	ret = pwmchip_add(chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to add PWM chip: %d\n", ret);
-- 
2.49.0

