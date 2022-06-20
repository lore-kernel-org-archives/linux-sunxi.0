Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7283D6E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:11 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id i81-20020a1c3b54000000b0039c76434147so8282893wma.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FJAftx/p0C7OJqXldJ+ksCvuM2Jz1/dLJXnCMlN2VIw=;
        b=SqSwnGBcriuBOSFplaryTgzwQV9etoBhh79kFYweRlmDdxQeRvrcZhZxeGzYrNQvjK
         69NE66snB8AAFxosGQi32hwg8wAh/0UlVrRlylnlYpF3UP2foQigCMMdDJ2hf1VoUcQw
         IGJhoucIfU9bShmNTRIW7SeERFLMl9SzWwa/gkuyhaNnZGAegN5/b8AD7xgZbr+q96V3
         wIZE74xoK0opWS9DO77kd+xhhjv05vYGMC2P4dGUBy6pWp5QiJg6JRI3NjoqvsL5Fuv7
         /rYrzhVG+vkyLBPngH5EcdERxjCI3qHqaUK8MI70z8mDb7VK4k5Utxh9mIEOvpvvGk/6
         VkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FJAftx/p0C7OJqXldJ+ksCvuM2Jz1/dLJXnCMlN2VIw=;
        b=eS0JbT28ViwgafLHeogQNwa6eFZqE1wfQiGieXvJMj9vzgWtIKk96R8Y/DVT5KEbWO
         MbL2X9NnoyOIdT38x9uuQRNfy7Daz7+rotxoo7AyvCro+dfVzpj+Ikl9WLItsEs4OtMp
         YVwVSKqonjnVbqa+1r+18ImFgrSStAnSkVly/YXgfABwFdjiqRspLAe0n/se9q3qZ6pE
         3wCDbGnlQ55gks6t6q/k1lFah9VXsxeMezCHGmHwixlgoN/b6Ewnb8/fTRxLOzuTUNP8
         ePTNZwRCvRYpf2EU+fecjn1Swcm+EEqNPVXVVYu1csMRboiEwTO/U2NeOq5JERPl4CA/
         UZaQ==
X-Gm-Message-State: AJIora/myzYtsE41PuDl322tFh4kaE6uVCeBc1rfJOc2waBbbMwDcJdP
	YypWKYI5UyB26TYrV5AgigI=
X-Google-Smtp-Source: AGRyM1uYqQE7GmYoWseO34ZpgDLrPdxmQJYvkYR87njx8ZglDl7MI8oKPbgMJxyF1RluTFoj9tUheA==
X-Received: by 2002:a1c:c909:0:b0:3a0:1725:619d with SMTP id f9-20020a1cc909000000b003a01725619dmr5451578wmb.19.1655755629537;
        Mon, 20 Jun 2022 13:07:09 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id q7-20020adf9dc7000000b0020cdcb0efa2sm7500229wre.34.2022.06.20.13.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:09 -0700 (PDT)
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
Subject: [PATCH 34/49] mfd: max77843: drop useless mask_invert flag on irqchip
Date: Mon, 20 Jun 2022 21:06:29 +0100
Message-Id: <20220620200644.1961936-35-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to set the flag explicitly to false, since that
is the default value from zero initialization.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max77843.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 209ee24d9ce1..4da58eab1603 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -59,7 +59,6 @@ static const struct regmap_irq_chip max77843_irq_chip = {
 	.name		= "max77843",
 	.status_base	= MAX77843_SYS_REG_SYSINTSRC,
 	.mask_base	= MAX77843_SYS_REG_SYSINTMASK,
-	.mask_invert	= false,
 	.num_regs	= 1,
 	.irqs		= max77843_irqs,
 	.num_irqs	= ARRAY_SIZE(max77843_irqs),
-- 
2.35.1

