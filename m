Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B013D77
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q9so16079871wrd.8
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gBD4FGBJfr7WfKu1UZU1bV8IB7E8/qXlLxTviEK1Akg=;
        b=n+dv2OHyeLcXNTmM5AoQ5y71hnTNJIpcERPeXRAZGzH3I/VENsQCVHYqLkDxbEjmN/
         TTkfawWz7sGx1fEvNmiL1zWs5fqtd8PmEYJ/uuxwTzmlN3TNWDIjfT7h7X2oiiCeJDJo
         G0D3xiO8ep0dRDPxWfA7mglV2rl0lfdiXs/NgfHf3uClxo2T0zSzKmcugT014uVsbBA4
         a8d72hUTWqP7aMSTkN4E6jMQH1AsJpvanWTcr/TzYICesUohxeYCLmlbHF8Or3sDiq5E
         ReozveZPFU1OGId9YBAanmpEq2oZ6/HDOKmehZPgromaOnVKCB0W7RktevOubR0I+UbT
         T3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gBD4FGBJfr7WfKu1UZU1bV8IB7E8/qXlLxTviEK1Akg=;
        b=Y6L35xHwfJ/ovryoB6b/5hJfMlI49ukRvfcQOBDS4LAaoudj0Ct1Jt8tNVb4BGzFGe
         hAMfbkcZZcfbrfdj7iTfXZXfwIUGU4kFBgbp7Jt3GeoPermfggzLmqKZ0M3sm2iBb2eL
         g2pxnn2ZfRnIG7hHmHPrYRt9M1BFfpjkiUw0oK/LhvRkEQIwa3sDEmsALC3FVM25t3LR
         MUsPKSlkcvxE8mpO2G2d8J3vSyoSkcfWPSxT0AxOqg6GqiyMrTRBmHBJPD9h+4OgoJiJ
         T2y0LHOiTuIU0whtQy5I1cnKc0bW2IoXuO6J77dME61zZbYpnLymXCvmpo6NhiimJF+0
         VUvA==
X-Gm-Message-State: AJIora+O2RVknnHnGZPqERqXHmhiNXDi8UmjQEG82pDuIj35UKUBpg8a
	OH88MZ5PJ5Xyxx8Um/JeYLw=
X-Google-Smtp-Source: AGRyM1ueeTVj4W+irPUqcFh4aibJZGRQv0luVUmTWKHSamp2328uXg/JWH281sGfd9zcwAAoGkXCMQ==
X-Received: by 2002:adf:ae09:0:b0:20e:e4f0:2133 with SMTP id x9-20020adfae09000000b0020ee4f02133mr24684442wrc.104.1655755608969;
        Mon, 20 Jun 2022 13:06:48 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c4f0900b0039db500714fsm16981828wmq.6.2022.06.20.13.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:48 -0700 (PDT)
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
Subject: [PATCH 22/49] mfd: sun4i-gpadc: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:17 +0100
Message-Id: <20220620200644.1961936-23-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/sun4i-gpadc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/sun4i-gpadc.c b/drivers/mfd/sun4i-gpadc.c
index cfe14d9bf6dc..edc180d83a4b 100644
--- a/drivers/mfd/sun4i-gpadc.c
+++ b/drivers/mfd/sun4i-gpadc.c
@@ -34,9 +34,8 @@ static const struct regmap_irq_chip sun4i_gpadc_regmap_irq_chip = {
 	.name = "sun4i_gpadc_irq_chip",
 	.status_base = SUN4I_GPADC_INT_FIFOS,
 	.ack_base = SUN4I_GPADC_INT_FIFOS,
-	.mask_base = SUN4I_GPADC_INT_FIFOC,
+	.unmask_base = SUN4I_GPADC_INT_FIFOC,
 	.init_ack_masked = true,
-	.mask_invert = true,
 	.irqs = sun4i_gpadc_regmap_irq,
 	.num_irqs = ARRAY_SIZE(sun4i_gpadc_regmap_irq),
 	.num_regs = 1,
-- 
2.35.1

