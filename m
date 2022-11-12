Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEB1858
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso6920012wmb.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYG0lELIkcRCGP8jsgHL4HQoIjFGIvh4hrSttLYXXSA=;
        b=eWLIQMsyzKlZKoLwyJYvo9XYbHuX9uT7yE0YZ+4Z7WOpbke8Up9yi/V2ZrY7P8yH0G
         t57zawvnFxzUA22VM0ORJC5vwC8SMdRfdJSDVnckgh0RiNPh92Of50bx0cQ25CEqkLtH
         nCgZ6/Um7+wVRZZ8DJcJaqyG7WMSyUkYqJekvswfC/p4Nnmy/RoHuLcTIKPEiCwrJONt
         2i53XZjfQND1gJLxyc0gHZ6vg6Wk5Cq1HykLJzLz4bRO+WpDtPxlxL74xNs8nSxdZWv+
         x3QS4cefmujEW/XmHabAmy79aWC/NYFtZP8adgDqVOzqAjH/7vLXbl0GlcJp+Bk/NhBR
         WssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYG0lELIkcRCGP8jsgHL4HQoIjFGIvh4hrSttLYXXSA=;
        b=fo0i9PoFiXwjy2Qz7G3ZCSJHKQAUE4U0oHCutU0S233M48TMvZb1zSt3hsf8jSTMMs
         Xe5biwkkHE9mEaDeKMPaZ//4uFhBKFFTSt74Xrr6HWONp9TItSqPFktqNFy64kxSKres
         N4vnkBQ9uKFxTxsp4h6fCnMaeVFcdQDPx6szzUje85xUNJGsVA+jL1WAwfGyEwIzaDVa
         CAhTyLqd7G0cGx69BeHp50XbnM4HpqKl7J0xlKA9OA7wM1nDEi4JHUyXfM/Y2LFOiW62
         Te9GzOtOKlwR/kgZ9BeTR139GQEHaQQmefD2BMypWq1gD6vTF2/H+TGFrRlbtiSJQGjr
         UgJA==
X-Gm-Message-State: ANoB5pl/jW5jYAJcNgyPRXDNmOKXW+2WqTFqI3wEGzc482j/+3BoiFJF
	twGb2dXNaijrtnA6tT3wwSQ=
X-Google-Smtp-Source: AA0mqf5pyQhsB6glqLw+Apubat3cd2yf2DirKVwq0lH6RY66Bdje8ktKyuC6RmSzQ35RxxP+TFqu0Q==
X-Received: by 2002:a05:600c:4fd0:b0:3cf:5bd9:68a1 with SMTP id o16-20020a05600c4fd000b003cf5bd968a1mr4325795wmq.113.1668266386084;
        Sat, 12 Nov 2022 07:19:46 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id bx32-20020a5d5b20000000b0023bb7e4b8b1sm4658536wrb.82.2022.11.12.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:45 -0800 (PST)
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
Subject: [PATCH 10/18] mfd: rohm-bd71828: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:27 +0000
Message-Id: <20221112151835.39059-11-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/rohm-bd71828.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 714d9fcbf07b..3c5c6c393650 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -413,9 +413,8 @@ static struct regmap_irq_chip bd71828_irq_chip = {
 	.irqs = &bd71828_irqs[0],
 	.num_irqs = ARRAY_SIZE(bd71828_irqs),
 	.status_base = BD71828_REG_INT_BUCK,
-	.mask_base = BD71828_REG_INT_MASK_BUCK,
+	.unmask_base = BD71828_REG_INT_MASK_BUCK,
 	.ack_base = BD71828_REG_INT_BUCK,
-	.mask_invert = true,
 	.init_ack_masked = true,
 	.num_regs = 12,
 	.num_main_regs = 1,
@@ -430,9 +429,8 @@ static struct regmap_irq_chip bd71815_irq_chip = {
 	.irqs = &bd71815_irqs[0],
 	.num_irqs = ARRAY_SIZE(bd71815_irqs),
 	.status_base = BD71815_REG_INT_STAT_01,
-	.mask_base = BD71815_REG_INT_EN_01,
+	.unmask_base = BD71815_REG_INT_EN_01,
 	.ack_base = BD71815_REG_INT_STAT_01,
-	.mask_invert = true,
 	.init_ack_masked = true,
 	.num_regs = 12,
 	.num_main_regs = 1,
-- 
2.38.1

