Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC83D77
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:47 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id k22so9641978wrd.6
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uoe8IKHiznCb2+08YYHq6Yn162+SdkatHT+ONYvtyvg=;
        b=VO5DAnqEeePAwi/axXTy4qE8A246zDDyLHKvfEeupMh4NJS9PKzy2HLbzv2HmLinOh
         sJDew7tvb/Du6JA9+pWT6wLYpZiUruBlDXuUNGniMiaSflxpZ999oM2RPoZbfWY8bM3s
         gls0xbSabfR+zndjmVVe2gZatWsAghFwtSJv7FWIrq2fOl5iZF4ORrEzRPpb9VagUUok
         bzn4DhZTxBTkt686Eof5bwsbZb+iffrPyGoKCrO/d9vttrGG2aS8UHirbaHGBHIZdzMU
         DZCNjjT5h1ru5g19uCfpQwoKH/YS5Rr49DFzT6RKpFmZ5PA1XwoUduGXijcI+1DBXDyM
         XTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uoe8IKHiznCb2+08YYHq6Yn162+SdkatHT+ONYvtyvg=;
        b=21uezqTDZkAzeIjOZtsCLjX6iLog8/IBMvVnFUWkCZJnf63DGmG7CSoxhT2TMjCXLP
         l2FKO7fk2TW/b4AKgNk8jIals76h/FNVKgj8jPOeTfTY7wq5Q0wucg7OAPQT/X58HVlC
         M+06DNv60VL/Fe1eSOsuamg20Yr/jIZ3141opzg10F19TI7Fc94NmisVMIjfW2L5Vv29
         H5WpO1fhcSVazIvO1CLn9LsTbvVzlf209l4eAYNewFs6PdZ9f/gq1pwSmMtLAYnJIQrI
         kRaWys3muj7gdCKMviR+qr+S7cAynRQS5xW3TihYXrPO3ljWGH3x1VFYJhvhWnepsNBP
         ELMA==
X-Gm-Message-State: AJIora/JK5R1Xs+pfjJ6LRTUUi2ndpbz4xPsLt8R/r6jw+/sFCuPf9Uj
	W/9yxDCQarNDVY29SyZVRok=
X-Google-Smtp-Source: AGRyM1uZONrpz0spvVCV2D/AIVMzkFz9w2tp1QWQa34Ft0vrEMdw9wgaS52AsbxHhGWZBMtjoEgiDw==
X-Received: by 2002:adf:fec2:0:b0:21a:6cff:a4f1 with SMTP id q2-20020adffec2000000b0021a6cffa4f1mr18316222wrs.139.1655755607554;
        Mon, 20 Jun 2022 13:06:47 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id j27-20020a05600c1c1b00b0039c1396b495sm16596378wms.9.2022.06.20.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:47 -0700 (PDT)
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
Subject: [PATCH 21/49] mfd: tps65090: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:16 +0100
Message-Id: <20220620200644.1961936-22-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/tps65090.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index bd6235308c6b..e474e1ca253a 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -127,8 +127,7 @@ static struct regmap_irq_chip tps65090_irq_chip = {
 	.num_irqs = ARRAY_SIZE(tps65090_irqs),
 	.num_regs = NUM_INT_REG,
 	.status_base = TPS65090_REG_INTR_STS,
-	.mask_base = TPS65090_REG_INTR_MASK,
-	.mask_invert = true,
+	.unmask_base = TPS65090_REG_INTR_MASK,
 };
 
 static bool is_volatile_reg(struct device *dev, unsigned int reg)
-- 
2.35.1

