Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0833184E
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:48 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso7430866wma.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acztsJdrOe0moyQxGDWG+rNoagLS7dO0IEh5xXE8Q3w=;
        b=B72ZIoy/C8w6XAkRuWh0adz9TJE3c/ksIlbW6Oj7U4AMK8NTxd+7Wn3vOEY/mzQOLG
         +ynv2pC0M3mwdkgN/rmckB2dKlKo7UCGqFYjOvQ4HoC4bFXxECE0IinFVmBQH0gluraN
         P7rvFxWyVijo83yXcpNAV0LBv5SbD/gajjihlbTUevyQEG/fG6KtTXVuDCJZ36zzLq5T
         i+Ada1YLdg0QdX2GtWxxS5iI4VCErbN1lcCUEo/KtH2sYUXo2rTRuzU0peN3w5VA7iu2
         oAfEO+RGrzlQFwuUZsZgOihfqwdomcUDimOBHHJlTRj+02yYq2tlWO+E8ectt9p9csrb
         gZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acztsJdrOe0moyQxGDWG+rNoagLS7dO0IEh5xXE8Q3w=;
        b=ftjYwCUKEElsOApfuVrrP4xLvIzIXMCf/vG0id7V2UC+UYEj+dvlBcERB5yWGqXQ4s
         lrWaxXhriuLPqAZGR56AO3RJoTj9XqhIPP0J2RxxnXJJ31t7gWLyxtq2SI5F7G7OmPoY
         ZM+UsJqQxW7IHtOTTV9zN+lgqhFzOehkoNdY+sEw8lbC6WVclBE2JNuhcXWvqQSyHj7w
         tI1mh6OVzhpKNP7Up+oueLIcYLL6P9AeVW9P0Iuqa7YS6/eWH3cNof9Vlz6U79yzV2Ac
         V25hFSeHt25Jpz4bYDMEJ4bZfp7rgP3X6QuG0uq1e/+vd+9TteWwoDBO69QvfeiU+apf
         DL+g==
X-Gm-Message-State: ANoB5pnwcpyhvM2ae+UWkhK0k5TNIZIrmngFdLc+m2UnoiAzwQnb0i1a
	KZms0/R5tfz6lj7iQeuujNg=
X-Google-Smtp-Source: AA0mqf4SCQTPDxDXf2d4gtvfw8P2wB6YurYyc2Qxe8rrrZfXu1RR1QMWl0T37ZD31YJ10EMRECUrAw==
X-Received: by 2002:a05:600c:354d:b0:3cf:7514:a806 with SMTP id i13-20020a05600c354d00b003cf7514a806mr4190170wmq.116.1668266387219;
        Sat, 12 Nov 2022 07:19:47 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id z15-20020a056000110f00b0022a3a887ceasm4578267wrw.49.2022.11.12.07.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:46 -0800 (PST)
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
Subject: [PATCH 11/18] mfd: rohm-bd718x7: Drop useless mask_invert flag on irqchip
Date: Sat, 12 Nov 2022 15:18:28 +0000
Message-Id: <20221112151835.39059-12-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting mask_invert to false is pointless because that's the
default. The flag is also deprecated, so drop it.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/rohm-bd718x7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index bfd81f78beae..ad6c0971a997 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -70,7 +70,6 @@ static struct regmap_irq_chip bd718xx_irq_chip = {
 	.mask_base = BD718XX_REG_MIRQ,
 	.ack_base = BD718XX_REG_IRQ,
 	.init_ack_masked = true,
-	.mask_invert = false,
 };
 
 static const struct regmap_range pmic_status_range = {
-- 
2.38.1

