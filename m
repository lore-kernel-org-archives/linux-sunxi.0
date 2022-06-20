Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F13D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id k22so9641978wrd.6
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RxzMqxj/eXn7w9NNf93GCQveT2W3i+9cnq4DwR+RJyE=;
        b=o76wuo0xPC/x3J+fSzV08PvTJNEDSkggAXYsoR9+fouiAFePVvNZxWHKb6V2vQ92OA
         SE+0Tgogz4/JpWBQo32vpyKXLh2Katf4rLXy/5aiL3oY3i7H+xTu8fBXo9Kmwm+1LdJN
         n17o06/gfXQXFoYWk4+a7o5AXR1yv4WDcHzYxk5Bo6GjGCsBM4jzZLPAZskoHBAppBrr
         O0akQIZhIrT1LlNKwQ0GBml8Y9QIufqmcfQWayZorKoyOzzGnKmI65dWbbANUzud/obW
         h52Jbwhvf8dXR/t08i55bKKmJaWPIdWVSrVoX8K6QhSQSAGB7kcnC01lTkvgx2dqq/2U
         cwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RxzMqxj/eXn7w9NNf93GCQveT2W3i+9cnq4DwR+RJyE=;
        b=lOEjBDRmwZQoDlym4q2euSF6+8lHqinZFw2F9EV/YMeKiZlQ+XA4tGn1bxjoLgqtEq
         ZWExsjauQDNuCjeieC6/kvtz+v62yOyLmF+qRi2ezpVlkKRLebd841NyeuoaKpSFvPqh
         8yAxlHyV/sBabXR1qzUehhmQoocX6yosaOzMo8J2Ke6f+kz+8u5/ZmyqKSRi5xj/FeVq
         YRR5apbAPfIsUCX9vPn8G1veKV0BNBE8mCaY4bNN+Rtcf59bmcP+AhaWr2YmrDAULz8l
         V3NweGdamX3aqE0gDymGFPY/PWfJztDkAGOSd0kmBvyG6gTzgKSzmn9q8eJIMDLhITZk
         QugQ==
X-Gm-Message-State: AJIora8uI45SS/RcTx24TDFnu6yBCPEpAooY8/FvgeIIiaODLdcMdXhy
	GndPoEo0OF0hiN7EZRQGh0o=
X-Google-Smtp-Source: AGRyM1uQHejr8zASwoWiI73KhsStma0zb82PJc1yA+xXQ76Hdedooq3WaNWKMgmFn77ar+BE+OUVCQ==
X-Received: by 2002:a5d:4592:0:b0:21b:8e50:7fb9 with SMTP id p18-20020a5d4592000000b0021b8e507fb9mr7563688wrq.428.1655755613935;
        Mon, 20 Jun 2022 13:06:53 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d452d000000b0021a3d94c7bdsm11884838wra.28.2022.06.20.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:53 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Cc: agross@kernel.org,
	bjorn.andersson@linaro.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@codeaurora.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	b.zolnierkie@samsung.com,
	myungjoo.ham@samsung.com,
	michael@walle.cc,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	tglx@linutronix.de,
	maz@kernel.org,
	lee.jones@linaro.org,
	mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	rjones@gateworks.com,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang7@gmail.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [PATCH 25/49] mfd: rohm-bd71828: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:20 +0100
Message-Id: <20220620200644.1961936-26-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An inverted mask register can be described more directly
as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/rohm-bd71828.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 714d9fcbf07b..3c5c6c393650 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -413,9 +413,8 @@ static struct regmap_irq_chip bd71828_irq_chip = {
 	.irqs = &bd71828_irqs[0],
 	.num_irqs = ARRAY_SIZE(bd71828_irqs),
 	.status_base = BD71828_REG_INT_BUCK,
-	.mask_base = BD71828_REG_INT_MASK_BUCK,
+	.unmask_base = BD71828_REG_INT_MASK_BUCK,
 	.ack_base = BD71828_REG_INT_BUCK,
-	.mask_invert = true,
 	.init_ack_masked = true,
 	.num_regs = 12,
 	.num_main_regs = 1,
@@ -430,9 +429,8 @@ static struct regmap_irq_chip bd71815_irq_chip = {
 	.irqs = &bd71815_irqs[0],
 	.num_irqs = ARRAY_SIZE(bd71815_irqs),
 	.status_base = BD71815_REG_INT_STAT_01,
-	.mask_base = BD71815_REG_INT_EN_01,
+	.unmask_base = BD71815_REG_INT_EN_01,
 	.ack_base = BD71815_REG_INT_STAT_01,
-	.mask_invert = true,
 	.init_ack_masked = true,
 	.num_regs = 12,
 	.num_main_regs = 1,
-- 
2.35.1

