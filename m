Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FE93D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:23 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id o8so16101330wro.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dqZEE7XdviwRWITP3iO6UBVL417kMvPw/5cpdhOCnY0=;
        b=TIaLYM+7aLuuRlXrQlapwog96FVtU0ooWGOQ047CVxq6/eBhXYieIqxwCcMXfW3g6t
         f+HGuhXPfSxIelrPnYEN7OU7peoZLJxZnRXDaJcr5fL+fEf69btKbTF4tAUZNYQyHScv
         iwtpLeRs+BLtCQHpOHV5HTtcb+smm2n5XiEw9va+rWEPvmpRhr9uihWsn8c3AWaKo2tu
         ixhGNtLy3TSWF+J6E4waInzEuxA2ck3ipVwp4MrV2tbNe0NS3OQkYDrzOC8k9atTsxJT
         71CeVTVSDdBpYrNOzHBu5VTgwxnGKG7OS+jOMILWiKTmwhHwDvjmfpRNJ4UZ4pzCshkj
         2pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dqZEE7XdviwRWITP3iO6UBVL417kMvPw/5cpdhOCnY0=;
        b=aV3T8a/3jwmOXNdxb+wlhoTAOiDREORtFhLXCwwCmky/bcMIh30xFYXN9Lkuwty6Q/
         i+fthx0toRQTP0dSzTqiXFpfJsf2lALXizCe+U3JO6qfIDGcd5h9w/j9tNoX8DLiNmdT
         ZkZqFljxpjMvM7lZc7nf5WW7xDln7UqCtwRvLQzUbXZvGcw1TXPAbp9Q9+c8hDIB3ybe
         Jjg0Ot29qgNiPaXGjXjxFkxQGO7Nub4oSJL2z4Mq+ehXr5mhuqDt4s3NPBS49E1iEtS9
         s1LQxBv+asq1RR4SfbKErQMKKkpuPORULjkDcJ+wHTPGBir774BMf9qfyODb6ALiSUR3
         /YDw==
X-Gm-Message-State: AJIora9UKHUvkRM8pE0wO1bJJ4UVrcrHtYsl5C/jY3DzokWjGS3pMj8O
	x72wFvn61/kclkAgD3xyZ8g=
X-Google-Smtp-Source: AGRyM1t7fF9oWyoFMD4Gd1xha3GDwq5quNlzvF+7I8uqpwdkfaVZSf+y3kr/8cPcMtmBqNLfvwIwNg==
X-Received: by 2002:a5d:5885:0:b0:218:3d12:e0eb with SMTP id n5-20020a5d5885000000b002183d12e0ebmr24861338wrf.510.1655755642796;
        Mon, 20 Jun 2022 13:07:22 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c014a00b0039ee51fda45sm12789702wmm.2.2022.06.20.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:22 -0700 (PDT)
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
Subject: [PATCH 42/49] mfd: qcom-pm8008: Fix broken mask/unmask in irq chip
Date: Mon, 20 Jun 2022 21:06:37 +0100
Message-Id: <20220620200644.1961936-43-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Swap mask_base and unmask_base, and drop the broken_mask_unmask
flag since we're now expecting the registers to have their usual
behavior.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 18095e72714e..7bc6becfe7f4 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -45,8 +45,8 @@ enum {
 #define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 #define PM8008_STATUS_BASE	(PM8008_PERIPH_0_BASE | INT_LATCHED_STS_OFFSET)
-#define PM8008_MASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_SET_OFFSET)
-#define PM8008_UNMASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_CLR_OFFSET)
+#define PM8008_MASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_CLR_OFFSET)
+#define PM8008_UNMASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_SET_OFFSET)
 #define PM8008_TYPE_BASE	(PM8008_PERIPH_0_BASE | INT_SET_TYPE_OFFSET)
 #define PM8008_ACK_BASE		(PM8008_PERIPH_0_BASE | INT_LATCHED_CLR_OFFSET)
 #define PM8008_POLARITY_HI_BASE	(PM8008_PERIPH_0_BASE | INT_POL_HIGH_OFFSET)
@@ -141,7 +141,6 @@ static struct regmap_irq_chip pm8008_irq_chip = {
 	.status_base		= PM8008_STATUS_BASE,
 	.mask_base		= PM8008_MASK_BASE,
 	.unmask_base		= PM8008_UNMASK_BASE,
-	.broken_mask_unmask	= true,
 	.ack_base		= PM8008_ACK_BASE,
 	.config_base		= pm8008_config_regs,
 	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
-- 
2.35.1

