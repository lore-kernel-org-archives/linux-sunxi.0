Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78313D6E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:12 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g4so16062081wrh.11
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EO+iuOKogLq1gEhCZXsb9WMdWtj7M6TVjC1w+kM7coQ=;
        b=YUDmW8ZJsJxu9mf+AG0DiMhcJc31kRVZ4ADkdSPk8W6VHXXqo4OhpTn+ltak91umjD
         t2+KAswtChyR/y4NqqTx+RmQR/8HLN00XtsNQ0e4xwfKxuZBByicexl2a5x5LBn3I0pk
         x8JO5FxRZt/KDQOCVtNQIKgDYlK/FvLijeVz2EHn2mzjXxfDjOvMwunXb8JB3OkGfefD
         6GNtm5l9fhoIdmSS9kdw/3MIBC2aqx27mxgbqN6E4qbJINN1Ul/S8xgw8SLML3o/B/QQ
         Kk8/5xYVjIsLkrwsviBZMNweB6p+q9qY5xoEECUP5iygiuGIb6cd2pLwlh4Zo+v28+Ho
         aKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EO+iuOKogLq1gEhCZXsb9WMdWtj7M6TVjC1w+kM7coQ=;
        b=z8aPmr5Jry3vpcRzGYW516O2H0iMv/WZQ/ZZS2jyIFh+bXTOtl4NOEdPYrQvdMFmSd
         J+CkNMtbqOVOM5SiDkdbfIuctB5eaI0ecIHw+Eic+VcvIsRK1jvssVFISz0X6nD3yEql
         QVch0h4n0DIW29t3iDZf4jUZfKht9Jg1rYAlDMIsjQT8pmnmiWxZR2UJ5T7MLT9PKRLW
         vadXl1hz1UctVI2DTrryaQkHv3UsP/2UUB7SvBtulGC3GzbS3RkjiYk8zMqOGNoj2z0O
         aTRxBT0L9IZUzGLSdZUGzLosaBlWbEYIZDBqo8OJ1xP5DRlGZ5fTb9Eki6LF6Lf3PD1F
         R4Tg==
X-Gm-Message-State: AJIora/KUMv1WHrGKjwAdxfu2vyr6ne6JYhowPEBhT/YG5qnl5RZWrnM
	Lm9Y+TW+szWNd5oLL3Btx8M=
X-Google-Smtp-Source: AGRyM1uQnJZI6JTSn/IXnIpbA1+48K9Xd0eSzXtkoL8kKSucoVse7cEUTXPmpKK2qI8vGS5EmgHfHA==
X-Received: by 2002:a5d:6a01:0:b0:21a:338c:4862 with SMTP id m1-20020a5d6a01000000b0021a338c4862mr23039009wru.631.1655755631108;
        Mon, 20 Jun 2022 13:07:11 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c3b0600b00397402ae674sm20063059wms.11.2022.06.20.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:10 -0700 (PDT)
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
Subject: [PATCH 35/49] extcon: max77843: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:30 +0100
Message-Id: <20220620200644.1961936-36-aidanmacdonald.0x0@gmail.com>
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
 drivers/extcon/extcon-max77843.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index 8e6e97ec65a8..1bc0426ce3f1 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -189,8 +189,7 @@ static const struct regmap_irq max77843_muic_irq[] = {
 static const struct regmap_irq_chip max77843_muic_irq_chip = {
 	.name           = "max77843-muic",
 	.status_base    = MAX77843_MUIC_REG_INT1,
-	.mask_base      = MAX77843_MUIC_REG_INTMASK1,
-	.mask_invert    = true,
+	.unmask_base    = MAX77843_MUIC_REG_INTMASK1,
 	.num_regs       = 3,
 	.irqs           = max77843_muic_irq,
 	.num_irqs       = ARRAY_SIZE(max77843_muic_irq),
-- 
2.35.1

