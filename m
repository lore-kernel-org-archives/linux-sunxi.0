Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488553D6E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:06 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i10so12333818wrc.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcPkw+2A0TirCszPgnJO/5hF80h/wPfz0UaGX/pzVNI=;
        b=YUh2vwUeEXYDwtve+jVQfFl/6YVNWOAIVPUr1zYo+eBFnt9qJmC1h396Dttl7iu30W
         T72agxhnODuQPA8wHq5CHifcFd5EYVPC81+/j6s3ZgCRoDUYDCUbMpGVtQaRNLiaLhXU
         QS7EQhrRacil71DsUOvOaEFN+yfud+SolFp7Hf2wlPmira1TuVu6HCLacmYuzkt+UPQb
         bPCP9Nd0N9XVELIGM6wkT1GXzJBi+jeHMnmCZodJcOgIJ9vYksE0uAGXSIdYbQeh2PqF
         +cI6sb+kfTRmzuH9SSOuiNNkX6Hp5p/7pz3QkKp8eK0vNx1bCJy5JNTFMNDMA1rl8oN7
         47+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcPkw+2A0TirCszPgnJO/5hF80h/wPfz0UaGX/pzVNI=;
        b=nvSI4TXVhWt+K6RsyxcwRgDTLz+jtdJo778b/WgnzP3Fyxn/yfD3ljwrZnnie8pq0o
         4A8P9KhpiSbEO8UzQnfRvdE9MM92Yq3vBlPRmq8KdlTrw1rBbheY7mbqHGkMbw8Weo24
         r17Sez1SaJsa3CqMnmv1vK9rnlCb7XXkB9acsAn3hJ2i/XALfGqvf//0XljIhQJ8fldr
         pCiFe3mkl1x/Zn0ZwFiUrewucInwgq4D4JapS0jHHi49r9B7wcEBDx7j5gqzpjp8BIZM
         qmffjS3eGn64D+DEVOWtZJGpLSPgwEoPnJ7p8AXql4tGdhlo6ZtX+tFNgrKedSHCMn1i
         WXHA==
X-Gm-Message-State: AJIora/Ip5mzlwmSR2+n2d8U2f9FQY/S+YLVtXqTHuPBRAuUaoY/NeaO
	s6KyINrLJ3V1zKvpWq/KcT8=
X-Google-Smtp-Source: AGRyM1tZaUeEpnuzhwhw1Ih5MayJo7jRJMhj09tZrXjkTYjWA5UlXO8ZylD5FlAGiFfie+sPuTumpQ==
X-Received: by 2002:a5d:5a94:0:b0:218:531a:eea with SMTP id bp20-20020a5d5a94000000b00218531a0eeamr24344542wrb.703.1655755625880;
        Mon, 20 Jun 2022 13:07:05 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id z6-20020a5d4d06000000b0021a3dd1c5d5sm11711267wrt.96.2022.06.20.13.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:05 -0700 (PDT)
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
Subject: [PATCH 32/49] mfd: max77693: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:27 +0100
Message-Id: <20220620200644.1961936-33-aidanmacdonald.0x0@gmail.com>
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

Also drop useless mask_invert flag from other irq chips.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max77693.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 4e6244e17559..fadea37b97cc 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -66,7 +66,6 @@ static const struct regmap_irq_chip max77693_led_irq_chip = {
 	.name			= "max77693-led",
 	.status_base		= MAX77693_LED_REG_FLASH_INT,
 	.mask_base		= MAX77693_LED_REG_FLASH_INT_MASK,
-	.mask_invert		= false,
 	.num_regs		= 1,
 	.irqs			= max77693_led_irqs,
 	.num_irqs		= ARRAY_SIZE(max77693_led_irqs),
@@ -82,7 +81,6 @@ static const struct regmap_irq_chip max77693_topsys_irq_chip = {
 	.name			= "max77693-topsys",
 	.status_base		= MAX77693_PMIC_REG_TOPSYS_INT,
 	.mask_base		= MAX77693_PMIC_REG_TOPSYS_INT_MASK,
-	.mask_invert		= false,
 	.num_regs		= 1,
 	.irqs			= max77693_topsys_irqs,
 	.num_irqs		= ARRAY_SIZE(max77693_topsys_irqs),
@@ -100,7 +98,6 @@ static const struct regmap_irq_chip max77693_charger_irq_chip = {
 	.name			= "max77693-charger",
 	.status_base		= MAX77693_CHG_REG_CHG_INT,
 	.mask_base		= MAX77693_CHG_REG_CHG_INT_MASK,
-	.mask_invert		= false,
 	.num_regs		= 1,
 	.irqs			= max77693_charger_irqs,
 	.num_irqs		= ARRAY_SIZE(max77693_charger_irqs),
@@ -136,8 +133,7 @@ static const struct regmap_irq max77693_muic_irqs[] = {
 static const struct regmap_irq_chip max77693_muic_irq_chip = {
 	.name			= "max77693-muic",
 	.status_base		= MAX77693_MUIC_REG_INT1,
-	.mask_base		= MAX77693_MUIC_REG_INTMASK1,
-	.mask_invert		= true,
+	.unmask_base		= MAX77693_MUIC_REG_INTMASK1,
 	.num_regs		= 3,
 	.irqs			= max77693_muic_irqs,
 	.num_irqs		= ARRAY_SIZE(max77693_muic_irqs),
-- 
2.35.1

