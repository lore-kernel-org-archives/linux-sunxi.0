Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2BA1C02
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p16so4520849wmc.3
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzfFarMWnyAPcL/j9BLrbh9/EDR9l6mYdqyx4d7GlDs=;
        b=i6Xha0IS/gQNLKfoEiaGh+pMe0XQk2nRYv1lnAVGxx5a44I7wnJClCJgg4n4nnVKhm
         AIG+wpTP1h9KaH1JGqdy7Fl3I+iD+hTPYO54epiDta9+c5Vyd7YaH8wI5BhuRP7AyuMZ
         g7uf6cyj/+YuLWOJXwjcfV3ZNXbiX3ho7mWJcvCLOFn81+Ki3+H9MWHa77Ite+4AUUUu
         o0wD7mAPe+hgNsIO1fM1E7Lu5zNpOFAcwo31x6n1lXbvomSAqK8VcLANOOTf8i+bWXhf
         89rF1XkweKVV11jgQZ6kyyLzRNbwp8UjBpoSF0dxk59UfCJdOObcbD0TOBMllXr5YXdX
         /mZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzfFarMWnyAPcL/j9BLrbh9/EDR9l6mYdqyx4d7GlDs=;
        b=CxA4rmBtIgwoVAb2lHTKbBWgXJcO5HUSw3mtpuoQ+Ku8IuqY6m9fFlGStniOJnsv4y
         Ngbpw6/SPp5CK6MzRJ0nGZosyC/cDWyXSYQDRohAc6lq/ZMjw4ud9r4ZiMqjrq2OjgDo
         onTKPW30Xv4t6z/KpeRQSXzq+ZHozALcXTuWGchKzwMSk3eLGfjBZIokE+rDLyz8gLT1
         tCMJUJxNdz8AAfg4Dp5mT3lXcBGxdztV7dNTHHXRZW7DH3tzQ2q3/rP8rVu1m49aJ8fu
         XEXCJeb2nwvTy9GajVOlWQXF/4aNy6IWauEcdhwPAxymv0J6pBs3rVEJ673lnCqCbfLM
         pyvg==
X-Gm-Message-State: ANoB5pmKn0X76h+4tBD8xNpfwJvsvrM6D265VEaeI7hH3gsms9GbxjaP
	4k+PUZY9bLGj/vlHPu2HIk4=
X-Google-Smtp-Source: AA0mqf6u/zKB/2p9kTSWrOrwAsEt55I6MIiZqlf8AeAZaZudZfPcjcZyqELSyK3BwfEOjNXME9+oQw==
X-Received: by 2002:a05:600c:2251:b0:3cf:a511:3217 with SMTP id a17-20020a05600c225100b003cfa5113217mr4098434wmm.205.1668266383299;
        Sat, 12 Nov 2022 07:19:43 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id z25-20020a05600c221900b003c6c5a5a651sm6568370wml.28.2022.11.12.07.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:43 -0800 (PST)
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
Subject: [PATCH 07/18] mfd: max77693: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:24 +0000
Message-Id: <20221112151835.39059-8-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/max77693.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 7088cb6f9174..7486acc84499 100644
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
2.38.1

