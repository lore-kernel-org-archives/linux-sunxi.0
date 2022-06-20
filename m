Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890C03D6E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so2062237wmb.5
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rzfzyKEVoJaKFIv88YU1vTCrVQJBpK7ii1ptmDvGvSE=;
        b=qBJcC0LrxQSAdxyKj5Dt7HUFUmjMISoYgjBHUUClNbIz3vAp9h4I6Lqto2o/8nRZZx
         +mUtIMCKQ+xDXPL3Fzv7A9LsfxQhVJy+J3jisVRnKW/heO0ptBVZJfGA10gsSJrLxZO+
         MObbJW6hGStsGnZRd48uGh/4qGcgNShaBsFXlaMlKP83cLUJ5mnOfQscQbtReaFC3JVv
         djWshs0XGTygSwTV7AEfyGWiz4kJ7raOzjYloQWDqDDB2Jm1I+3fzts9p4jEUGs+ylCU
         BlkyfP5HaSiXqAYXZ7zggOUoAuRHWYspwGWZ2TzWqacHn9MVYPY2Vzt3RKPNhtN644ir
         H1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzfzyKEVoJaKFIv88YU1vTCrVQJBpK7ii1ptmDvGvSE=;
        b=tF22Qwu59iZh2cSLYU0v89M+Im84I/AmImfHdoQKmIXKC/Lps2rIvckwfDRWJTOeoe
         WeEFmI84w5maX1Il3MKyr2brb2QG6+24WXt2b+swhObNPvM0sTzIshwNBbe52P+Tx4/Z
         3yP/O4sTv92QgOmz+ATkNCWPbwR7gBCu675udM3BcKk67q3/knbhZNh3Mt3S/pi77hBq
         p3UTCB0Qeq6BrIn7UfMVilwSJOm81/zxG0o7b/85N2r0WQXO1P6fRpdziyN8OPkprjLu
         xIJew+pRfRVg1JzKoWH7aJ3kuOufDcRnFCQ/6XwGYATy5A+idoiUYY4LRvANC1ht5rht
         5nJg==
X-Gm-Message-State: AOAM530ngommHTNZ6Ht2wi0JL9i8wbdXnfJ3TOtQbADi+aJEXHVM4qVa
	4JjZiYJZbgvF8i3TtcWrS9w=
X-Google-Smtp-Source: ABdhPJyInyenW+OvDrbjpJKIaFUgNOigofr86k1OtUqbh4EqGuM90WNh58WAi7KJRkr+4OM3pXCRPQ==
X-Received: by 2002:a1c:4c13:0:b0:39c:5a6b:8540 with SMTP id z19-20020a1c4c13000000b0039c5a6b8540mr36262410wmf.106.1655755624155;
        Mon, 20 Jun 2022 13:07:04 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b0039c5645c60fsm28045293wms.3.2022.06.20.13.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:03 -0700 (PDT)
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
Subject: [PATCH 31/49] mfd: max14577: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:26 +0100
Message-Id: <20220620200644.1961936-32-aidanmacdonald.0x0@gmail.com>
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

Also drop useless mask_invert flag from the pmic irq chip.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max14577.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 6c487fa14e9c..7a501dcc48f6 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -209,8 +209,7 @@ static const struct regmap_irq max14577_irqs[] = {
 static const struct regmap_irq_chip max14577_irq_chip = {
 	.name			= "max14577",
 	.status_base		= MAX14577_REG_INT1,
-	.mask_base		= MAX14577_REG_INTMASK1,
-	.mask_invert		= true,
+	.unmask_base		= MAX14577_REG_INTMASK1,
 	.num_regs		= 3,
 	.irqs			= max14577_irqs,
 	.num_irqs		= ARRAY_SIZE(max14577_irqs),
@@ -239,8 +238,7 @@ static const struct regmap_irq max77836_muic_irqs[] = {
 static const struct regmap_irq_chip max77836_muic_irq_chip = {
 	.name			= "max77836-muic",
 	.status_base		= MAX14577_REG_INT1,
-	.mask_base		= MAX14577_REG_INTMASK1,
-	.mask_invert		= true,
+	.unmask_base		= MAX14577_REG_INTMASK1,
 	.num_regs		= 3,
 	.irqs			= max77836_muic_irqs,
 	.num_irqs		= ARRAY_SIZE(max77836_muic_irqs),
@@ -255,7 +253,6 @@ static const struct regmap_irq_chip max77836_pmic_irq_chip = {
 	.name			= "max77836-pmic",
 	.status_base		= MAX77836_PMIC_REG_TOPSYS_INT,
 	.mask_base		= MAX77836_PMIC_REG_TOPSYS_INT_MASK,
-	.mask_invert		= false,
 	.num_regs		= 1,
 	.irqs			= max77836_pmic_irqs,
 	.num_irqs		= ARRAY_SIZE(max77836_pmic_irqs),
-- 
2.35.1

