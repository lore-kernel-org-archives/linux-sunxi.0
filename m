Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0569C3D6E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id k22so9641978wrd.6
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NcUaD1/hetXoR1Hr3zOaIrV5ibqb80WKTQCzVE8bVrc=;
        b=JYv78xaECQZTaj29SjmNHnhs4gfEEratnCgfJZagJJiK+EVif7vCkcuTP1QF0wfouK
         JhOxz5Q0vETS+bhO7JLSkwPttvHYnqkEyX3HWyCMGYjjskRlAQvkUsr5XtoBlAJVGwhM
         Gw+0xCBp9YPW230YKLPHGegCcK1UoKqqxF+q0NM7n1ss/f9b2tA03ELnh9lj8wNVqRiD
         p3oWRBH9z/0ejlWRohZ3vCWr/VL+wIvmrnrFxL5IVwRiWT8mfm+mPnriC/8/NBkGAEQT
         cw5lNfhGyRNeY0VAdg2EvhXglVeSK8bk4eq65rFbOML/1pGcXaRo+6lWO3/nbDyuiy/y
         5z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NcUaD1/hetXoR1Hr3zOaIrV5ibqb80WKTQCzVE8bVrc=;
        b=yWPYN21ZEMbDK824dc2brrtP0zW5aamOLkF9M1SCjxRiQowkn3gelIHlcd3knOb3nK
         PYdD6OML8SVrAXNYIVSOyjeyg8k0cfCSANEhplkLAEEnCJbS+9x4t9ZMwXD6ffPTh+iG
         82lZ+1hNWcxbuLvjAF8OasyT7yCB369pcpOv9f2yR4MJ4kUwFhuW4nSqMdZ64oWQpjAE
         TaBlPHOH4ZCqKBg+EVphKfV29GkVID/RPXzLVPiFeYMHQzHPGEjsP5CvQFo4vxGZv/sS
         j1ll8RSt/OhXx+fqQ1yJmDdETYSIXeKLa1NTaM8lhCQq9LDL4KgS05inhcbTqoPy8vvb
         kbCQ==
X-Gm-Message-State: AJIora9fbNXscgpTpo7Ec6vhmxTxFTi/7ZY5YJ0MW2k49xf7xGNHNm7i
	W7F5U9l6Y/5w6l1h7JR0IQU=
X-Google-Smtp-Source: AGRyM1t6EjGq1Ksd7MyVDLpDLClD84TIjP3RmrRekqAiittfXcb8Cp1PUoN9E0quIHfglyDXxzFsVA==
X-Received: by 2002:a5d:4601:0:b0:21b:9035:d295 with SMTP id t1-20020a5d4601000000b0021b9035d295mr6103622wrq.63.1655755637616;
        Mon, 20 Jun 2022 13:07:17 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id m42-20020a05600c3b2a00b003973435c517sm16572141wms.0.2022.06.20.13.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:17 -0700 (PDT)
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
Subject: [PATCH 39/49] gpio: sl28cpld: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:34 +0100
Message-Id: <20220620200644.1961936-40-aidanmacdonald.0x0@gmail.com>
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
 drivers/gpio/gpio-sl28cpld.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
index 52404736ac86..2195f88c2048 100644
--- a/drivers/gpio/gpio-sl28cpld.c
+++ b/drivers/gpio/gpio-sl28cpld.c
@@ -70,8 +70,7 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 	irq_chip->num_irqs = ARRAY_SIZE(sl28cpld_gpio_irqs);
 	irq_chip->num_regs = 1;
 	irq_chip->status_base = base + GPIO_REG_IP;
-	irq_chip->mask_base = base + GPIO_REG_IE;
-	irq_chip->mask_invert = true;
+	irq_chip->unmask_base = base + GPIO_REG_IE;
 	irq_chip->ack_base = base + GPIO_REG_IP;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
-- 
2.35.1

