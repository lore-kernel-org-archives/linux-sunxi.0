Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BFD3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id z9so6373598wmf.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wkuS+j3EIennvsLgZYGM7vfpABGRVV/MeAPfOizAshw=;
        b=M57wXO9iRmAgu6U0WPasocwyW6YC4HvS/IJuioNN538vnmyv29ll0KmRtJRGqY4itN
         I5gbLCbLPlKHq7ZNuKC0QkXblcjbrochyZFlSuHnjjhoHPPr1Vg/TNn/mngewPIWO169
         E27kNJdVJV3Q769UkEnpR1Oh4c69WClUwfdfkWm6pR4le2OgBRbLQJrUBMFotv/eASj1
         YU0JLn4khTyo1PQcOGGFf4AknS/GI3pTm1R4xxZ86sjh87yWudtYtwnb4CMZDPW1zXwd
         CLfvknNTNJG/K6TH6GcO0gCA7f0ytehD0u7KI3rLDYx1D5YiPv3fyPkopDKkyw4YaySB
         j/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wkuS+j3EIennvsLgZYGM7vfpABGRVV/MeAPfOizAshw=;
        b=S2yFzDBtu4o5Wfy+MF8m8NQIh7CeXUdxc7x2EEd3er3MQJ4D3TfAwVWJ4KuZoORb2w
         asyxtJMMXI5ksAnlYCn4qoAtO3Qzqjidz9qi6nowlagQWJEdkm4uZoQoWrJjFjmEkEva
         abgDpDA+tfh8bsPrpxbkF81oSJTQZRohq6QVIDqHnsWO3I2/E0UEHNFxAiGluFvzsWX7
         azn6ev74x4USAeUxecjWq2N28oZPhTJqPH+lfKjPiRLtWtdDxycWOqDWWOTFLN9CJlqS
         bBccAR3cuv2SjNsqp3/hiDowdhHdbD7ifOUE9D8O1/EbZ1ZhZ9N3xxGxWGGoBC4ZMp/D
         dF/A==
X-Gm-Message-State: AJIora8Qj6iVluvZEWPfYwFNPOjHrKdXbbjvkZiI6n5bHnLHCjSSX3WF
	fAq69Rx4QQ83vFZBb+lonhA=
X-Google-Smtp-Source: AGRyM1uEEMAc+8FJxLc/mlb8t301IgpWCnjiYLUqgY6m1IDXCYaAeszmfVIolkVxg0Mtj7p66FG3gQ==
X-Received: by 2002:a05:600c:5112:b0:397:53f5:e15b with SMTP id o18-20020a05600c511200b0039753f5e15bmr26724095wms.93.1655755584181;
        Mon, 20 Jun 2022 13:06:24 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id t22-20020a05600c41d600b0039db7f1a3f5sm15482666wmh.45.2022.06.20.13.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:23 -0700 (PDT)
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
Subject: [PATCH 06/49] mfd: wcd934x: Convert irq chip to config regs
Date: Mon, 20 Jun 2022 21:06:01 +0100
Message-Id: <20220620200644.1961936-7-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the driver to config registers. This will allow the old
type register code in regmap-irq to be removed.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/wcd934x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index 68e2fa2fda99..07e884087f2c 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -55,17 +55,22 @@ static const struct regmap_irq wcd934x_irqs[] = {
 	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_SOUNDWIRE, 2, BIT(4)),
 };
 
+static const unsigned int wcd934x_config_regs[] = {
+	WCD934X_INTR_LEVEL0,
+};
+
 static const struct regmap_irq_chip wcd934x_regmap_irq_chip = {
 	.name = "wcd934x_irq",
 	.status_base = WCD934X_INTR_PIN1_STATUS0,
 	.mask_base = WCD934X_INTR_PIN1_MASK0,
 	.ack_base = WCD934X_INTR_PIN1_CLEAR0,
-	.type_base = WCD934X_INTR_LEVEL0,
-	.num_type_reg = 4,
-	.type_in_mask = false,
 	.num_regs = 4,
 	.irqs = wcd934x_irqs,
 	.num_irqs = ARRAY_SIZE(wcd934x_irqs),
+	.config_base = wcd934x_config_regs,
+	.num_config_bases = ARRAY_SIZE(wcd934x_config_regs),
+	.num_config_regs = 4,
+	.set_type_config = regmap_irq_set_type_config_simple,
 };
 
 static bool wcd934x_is_volatile_register(struct device *dev, unsigned int reg)
-- 
2.35.1

