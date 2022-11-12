Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91481858
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id cl5so10037708wrb.9
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rX7cCKuVYb8T0bIdtXYMmu42sGmoqadgzkdHQD0y+QY=;
        b=eMyqe5Ay3U0wx77cQ/2gz16NxyYV5gWp8dMGPLYd9UsNDB518c0JqQ/QtTZpKnI31X
         IoAI34NvLVvN0KI1CfpoSXv6729k7RN2VeXlJL13E7LN/6svqM5aclRuyq//KTwFH2CD
         aS9bLX11utnhq6bBz61ASU9LGuLxhL9cDNEh6l0Yfu/03oaJ6wV6UYXq23xZ3kYBw6va
         a79VzdA/bVZ0+2iBTrrm9Sb2suzAVwbzMTup7FNFaDNuZTqIBI6mKHUarjKm/zbgJIBQ
         GxNlxqo0BmWEyZ/VrBOgGGrBVigZ730ESoor8AKfy9uZCGziypR5dRZXXOCS7P6LawR1
         vTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rX7cCKuVYb8T0bIdtXYMmu42sGmoqadgzkdHQD0y+QY=;
        b=JQdf8wZHu46y8ua/yYxiJdCESlkoXbrK8YUXCr53rtq4F+fZdRCOjH00PIarblHTJo
         pK2FjSYhdsL9k/FxBoJdJZ3KdUwmVo/t3gadhKZ0mNoWBqsqpYBqLBzhEwoJQ2AwKkun
         mZYDat8T8wLn9ubIRcqLUrwiyrey8X6ft4GIujNLpRMyskpPABKQg1N0n8fMIaeLNZ/Y
         nGUbm92dYtt8w5AstANKDU7EcFKHwJhwr8ih9uHZFh5aaB2nYHARBazwlyG1wWQxJoNL
         2jhu1n+fUKWhb9qdHb+7JCFG386lFi8ze9OuAoFTqacHkIQm2tgVWp4tPr5JvGs2+PYW
         JG+Q==
X-Gm-Message-State: ANoB5pn/ABniOzR4d7l3zLxXXBmGbO90pqvRUUqTwRsKEtwNf16/kvy8
	5TDpoYiE0nPX0H36DFcy7qA=
X-Google-Smtp-Source: AA0mqf6DGdBLmjCdoPNIF+QK2rhnA4Ir3Q2CgoggBEI6nhnn/MHKp3Dwjc6/isBGSN4KhmU5r3eSyg==
X-Received: by 2002:adf:fd41:0:b0:236:6de4:27b6 with SMTP id h1-20020adffd41000000b002366de427b6mr3453371wrs.601.1668266388127;
        Sat, 12 Nov 2022 07:19:48 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id co19-20020a0560000a1300b0022e66749437sm4675867wrb.93.2022.11.12.07.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:47 -0800 (PST)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lee@kernel.org
Cc: mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	brgl@bgdev.pl,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-kernel@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 12/18] mfd: rt5033: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:29 +0000
Message-Id: <20221112151835.39059-13-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove use of the deprecated mask_invert flag. Inverted mask
registers (where a '1' bit enables an IRQ) can be described more
directly as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/rt5033.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
index f1236a9acf30..dc9bf4057a09 100644
--- a/drivers/mfd/rt5033.c
+++ b/drivers/mfd/rt5033.c
@@ -29,8 +29,7 @@ static const struct regmap_irq rt5033_irqs[] = {
 static const struct regmap_irq_chip rt5033_irq_chip = {
 	.name		= "rt5033",
 	.status_base	= RT5033_REG_PMIC_IRQ_STAT,
-	.mask_base	= RT5033_REG_PMIC_IRQ_CTRL,
-	.mask_invert	= true,
+	.unmask_base	= RT5033_REG_PMIC_IRQ_CTRL,
 	.num_regs	= 1,
 	.irqs		= rt5033_irqs,
 	.num_irqs	= ARRAY_SIZE(rt5033_irqs),
-- 
2.38.1

