Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002FC184E
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r186-20020a1c44c3000000b003cfa97c05cdso1514146wma.4
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCwNwFi1NVNoGWWQ49+Xrvxf1vh+Xjt7SdulWDQIb4A=;
        b=B/HvwmPsGkSnjtfwlckHWXZvgWjeyWeZzNVsSyNzHw4lprRmfExC84HS7HK1TEs1XQ
         3IcOEI59Pk28qpVLH8AqgK1YXT2fOncHblPMHn0Vr3ddcHu0ArHZn2mRejG8d7Dpf70h
         nsJ3JvsIACNTljJoOVCRapXToeppckE51LXQVqYQHX5w1GuNHwX51P49n7f2tCPmicT4
         6gQ/qOFYPyr0HUp411gwLCXZehfHvOMBuyzjdj0ZaHg4leBbUmZhp+TPyWNNQi+NwR6Y
         l1vqJtbLqm3s73sKVBZggXUh3TwgnGvxRwkzgxbOkA9zwcx79sqotewnVKab4xsNXpNP
         fpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCwNwFi1NVNoGWWQ49+Xrvxf1vh+Xjt7SdulWDQIb4A=;
        b=zsNsuwE6KW3//FGKqTrGYOkSNHZRi7/rkRJd0SpcwYQT8W8DSxHy2Sw/6K0H8P6yoN
         zusoQ/3MGhjGqDXpL/jTZyVGLIWxfClXy7G7Xu5wELt3AQiwByawZgvSxY+3ugwPOewM
         MwcgOPrEYL8pPUJ+6HdVIeUk4Cp6tZJYAo9PpeHJq4EjOvDaAs5UxH3wQxCFAPokLekF
         Miyj0mfrWCpq4ceeOjR1h4mwP/vgRWpFiqXZzsfL6Erm+a//0Gi4ns4zYCemSXrKwORO
         p3c6nhWQHJeXB4ZlaIyYGcmwjnRVNQrmNGS89B2scec9wJunNw4HUmcxON8GlMQuVN/h
         teAQ==
X-Gm-Message-State: ANoB5plQzrJdPcY/WaD7bRnCGInCulowZOTZkIPS4/PcQaNcQ5BMXMxK
	YmVOnvm/AbfP+Mn/LQDDEDE=
X-Google-Smtp-Source: AA0mqf5ZXkKC+OyB9EvDIptXxPDLWKjljn0+kI0bJieJ8EwpcylfK8gT3QVXJAnn7NAQhRT8fsTOZw==
X-Received: by 2002:a1c:7713:0:b0:3cf:670e:63cc with SMTP id t19-20020a1c7713000000b003cf670e63ccmr4265878wmi.150.1668266378287;
        Sat, 12 Nov 2022 07:19:38 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003c70191f267sm13377329wmn.39.2022.11.12.07.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:38 -0800 (PST)
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
Subject: [PATCH 02/18] mfd: atc260x: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:19 +0000
Message-Id: <20221112151835.39059-3-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/atc260x-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/atc260x-core.c b/drivers/mfd/atc260x-core.c
index 7148ff5b05b1..7c5de3ae776e 100644
--- a/drivers/mfd/atc260x-core.c
+++ b/drivers/mfd/atc260x-core.c
@@ -100,8 +100,7 @@ static const struct regmap_irq_chip atc2603c_regmap_irq_chip = {
 	.num_irqs = ARRAY_SIZE(atc2603c_regmap_irqs),
 	.num_regs = 1,
 	.status_base = ATC2603C_INTS_PD,
-	.mask_base = ATC2603C_INTS_MSK,
-	.mask_invert = true,
+	.unmask_base = ATC2603C_INTS_MSK,
 };
 
 static const struct regmap_irq_chip atc2609a_regmap_irq_chip = {
@@ -110,8 +109,7 @@ static const struct regmap_irq_chip atc2609a_regmap_irq_chip = {
 	.num_irqs = ARRAY_SIZE(atc2609a_regmap_irqs),
 	.num_regs = 1,
 	.status_base = ATC2609A_INTS_PD,
-	.mask_base = ATC2609A_INTS_MSK,
-	.mask_invert = true,
+	.unmask_base = ATC2609A_INTS_MSK,
 };
 
 static const struct resource atc2603c_onkey_resources[] = {
-- 
2.38.1

