Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E287B1858
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso4873182wmp.5
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ap2jtLcVXjGUxCK1ExvNFdVQ5+yTHfCLRbLs7VE5qzs=;
        b=Wa8gR8dxTsB9aBeo9EOvBSB5wnOpwbFnbNSss0twylMwCRJaAwPuJ1R3wlev5GGayg
         uEscH1BofmP9pBKc8TpaqOpzhH9s6WaboIaDyo39go3TA/YxQX3QYOIhfi9Eelbiczjk
         aY0n1WJsAClc815GTEMdEwcXcqvx/jvK1qIvugA3z4G5qMFm62qnRFfivfxeyPiPr7uq
         iwSkSCVMZ2Ur7eOUgAwEA7XJFp8OnIKSnhbryoOwwUjXhFQIU8ZvOVY6BR8zQ0Xgs0mH
         aDQzSImPREnYZrdAl//hKp+fDv80EIxl+PpC/+BY/BgKB2YzqMLhaVhlfIAmMCtqLqXL
         gXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap2jtLcVXjGUxCK1ExvNFdVQ5+yTHfCLRbLs7VE5qzs=;
        b=ABbnoPl2Xj6Y3rmVa7XF+DeOv8pxI0kK/+cOwGR8TZznKiKYAmIvCjFgUQVKr3Wje/
         ckzk44M/xqc1AgYWx804sBQZq8O/vZ7Afn7dclNH9ojFm5cOceJdsqtEus0U8kXmT7pZ
         s4EfeAFqV98Lh+kv7tyDDqlSOkr8Khz2pc7NFRuIGAPWTpQE2e5tpMTdRVIJbdAvccA5
         9hWXeH/CSbNGEQgWUPY5O4xYTlHNBGGTAx6tB5UURAS6qbcI63eLAKRnDhXLuBUSavkC
         euUmIorxKbIyfkfj85QKoGeC0u4HOvgieRyRtwyHAxaRZUK1ezEsF8DzgC5L3BBSAUDo
         ckRQ==
X-Gm-Message-State: ANoB5pmb8h80UYVMCeSwuexm8BisnqcGREcMNMYB1RNVt+12UZNuYO9V
	nAenWxQbObgaUb2UmALEPtE=
X-Google-Smtp-Source: AA0mqf5bOBbPUFnCu5eXhAwvqF7hO0snkQhVP3/uHN9qaP+T9rxZMK0RDxSiWVqGV2ASkQvUOSNcgQ==
X-Received: by 2002:a05:600c:44ca:b0:3cf:89c5:c241 with SMTP id f10-20020a05600c44ca00b003cf89c5c241mr3954405wmo.204.1668266390188;
        Sat, 12 Nov 2022 07:19:50 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id n10-20020adff08a000000b002368f6b56desm5460994wro.18.2022.11.12.07.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:49 -0800 (PST)
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
Subject: [PATCH 14/18] mfd: sprd-sc27xx-spi: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:31 +0000
Message-Id: <20221112151835.39059-15-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/sprd-sc27xx-spi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index d05a47c5187f..a4a9b81a952b 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -181,11 +181,10 @@ static int sprd_pmic_probe(struct spi_device *spi)
 	ddata->irq_chip.name = dev_name(&spi->dev);
 	ddata->irq_chip.status_base =
 		pdata->irq_base + SPRD_PMIC_INT_MASK_STATUS;
-	ddata->irq_chip.mask_base = pdata->irq_base + SPRD_PMIC_INT_EN;
+	ddata->irq_chip.unmask_base = pdata->irq_base + SPRD_PMIC_INT_EN;
 	ddata->irq_chip.ack_base = 0;
 	ddata->irq_chip.num_regs = 1;
 	ddata->irq_chip.num_irqs = pdata->num_irqs;
-	ddata->irq_chip.mask_invert = true;
 
 	ddata->irqs = devm_kcalloc(&spi->dev,
 				   pdata->num_irqs, sizeof(struct regmap_irq),
-- 
2.38.1

