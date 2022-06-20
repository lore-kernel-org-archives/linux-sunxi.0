Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421E63D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w17so16063541wrg.7
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcQuE9oGehOZto3hA/rTLb2fToN8VqZpboB1wSvVLeU=;
        b=e6An1+k7URA0wQXNcY2/BdRAilnccZF6A/hAv9jWNU7eSpvfOtHDfFPlFA9Tmj9tdP
         Q3jbhTK1VDeXWFItQMxcv0vZ7RCc5cmoO02hqrWFt1bNQVvSZ9vWPfkxDdj301roqukK
         VxcyBZNW8QGynfO8JWI+WWahEFDrUvnJXyIxMEVYx3RByt41ka89CAhjte2WBrFW5mhM
         TCXItN7+bBmjpnPbHtb5ce5F5Rk9ZgfpC/oo8VuyT8lEVZBE0Oo1B0D7mW2UL08mlg2l
         JQb9VPre/3jtmwZhYCFcXMZ3dZ9tQ6hqqgn0BUdmCk0DnRF2pxNugG3O1NbKVirJLc3k
         3CXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcQuE9oGehOZto3hA/rTLb2fToN8VqZpboB1wSvVLeU=;
        b=yy5UNGc20Z5VmfeWVuSxTOcAO/FMxfk9HP1XcNGtyTYtjDsojwLV3DWYapGnspiiFB
         tXxsGtBuSGqus2cgD+Q//IPYcD7C1EkyLRoPjw1D1HMN7W31aJgWQNXSM2OEejd1RoFO
         YTdkIZK3rk6sj5DPCWqF7xVx+qGD/T/B6gZt/EPikcIdwTNVXeR4VzbD5TqROUbWLCOt
         tTgFd61uB0UwLPQ2ToDSHCsSh7ywKUNPbj8luef+h1kzsCqvjL9xBTL1XBAWAiK1Gkl6
         E/SYgkrt8R7XxGrvmuWUQT9Q49px9FtgIeOoCNjszaJWxjFM3Ob77EZr5iwj/S/M880S
         KWRg==
X-Gm-Message-State: AJIora9agXtpmBLhPISWAGMSHF0SZXIFHUcxFvC2m0SErb3yq5zvCGUG
	HtwR8yef3h798krBLWjp9uQ=
X-Google-Smtp-Source: AGRyM1toV/6s8wRgMxmabtCAeVPKyocBr9a+nW1Hds3EtsXXFabw7Q99ucUCOTs0Oy4tAKumPVl4nQ==
X-Received: by 2002:a5d:64c7:0:b0:21b:9661:6aac with SMTP id f7-20020a5d64c7000000b0021b96616aacmr665641wri.496.1655755579596;
        Mon, 20 Jun 2022 13:06:19 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id c5-20020adffb45000000b0021b91d1ddbfsm2917554wrs.21.2022.06.20.13.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:19 -0700 (PDT)
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
Subject: [PATCH 03/49] regmap-irq: Remove an unnecessary restriction on type_in_mask
Date: Mon, 20 Jun 2022 21:05:58 +0100
Message-Id: <20220620200644.1961936-4-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check types_supported instead of checking type_rising/falling_val
when using type_in_mask interrupts. This makes the intent clearer
and allows a type_in_mask irq to support level or edge triggers,
rather than only edge triggers. Update the comment to reflect the
new behavior.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index a6db605707b0..59cfd4000e63 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -253,22 +253,19 @@ static void regmap_irq_enable(struct irq_data *data)
 	struct regmap *map = d->map;
 	const struct regmap_irq *irq_data = irq_to_regmap_irq(d, data->hwirq);
 	unsigned int reg = irq_data->reg_offset / map->reg_stride;
-	unsigned int mask, type;
-
-	type = irq_data->type.type_falling_val | irq_data->type.type_rising_val;
+	unsigned int mask;
 
 	/*
 	 * The type_in_mask flag means that the underlying hardware uses
-	 * separate mask bits for rising and falling edge interrupts, but
-	 * we want to make them into a single virtual interrupt with
-	 * configurable edge.
+	 * separate mask bits for each interrupt trigger type, but we want
+	 * to have a single logical interrupt with a configurable type.
 	 *
-	 * If the interrupt we're enabling defines the falling or rising
-	 * masks then instead of using the regular mask bits for this
-	 * interrupt, use the value previously written to the type buffer
-	 * at the corresponding offset in regmap_irq_set_type().
+	 * If the interrupt we're enabling defines any supported types
+	 * then instead of using the regular mask bits for this interrupt,
+	 * use the value previously written to the type buffer at the
+	 * corresponding offset in regmap_irq_set_type().
 	 */
-	if (d->chip->type_in_mask && type)
+	if (d->chip->type_in_mask && irq_data->type.types_supported)
 		mask = d->type_buf[reg] & irq_data->mask;
 	else
 		mask = irq_data->mask;
-- 
2.35.1

