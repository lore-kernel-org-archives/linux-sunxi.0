Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1661C14
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v7so4547568wmn.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUz+SizcgZSFJ75dUNQdXVQMx+0/9PCMdNqr8UxmHwU=;
        b=PdUigLlaopBa7TLq4xZ6IjRqvdU6RJ04DQIEmZAuJWErRJFEI436ovC/fpZyn7on3j
         P4Yw0uYEgThh6Kg04Xo/eRvIA+6Y1N5X/tf2mz2K12XQInc6WoOveYQae7TFbicRADm7
         0N0XWgg75I4ZRxZqGlHGFhPTU/kk+GJEO1zBeGnEmDGMfyWmxW+SKembCAu9nb3QG5Uo
         maW+Ou0n8RomHH1MZTmIwZBnq+e/iMv75WWrFDLyr436V2qAp13enst4BAQtK3RCW6S9
         lt/L84huLhe70Vbi/4B8G+13RgnCNavMJ/MHuvITwEbxccp9Vc1DeFmtCHEiFKWCIO3n
         16XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUz+SizcgZSFJ75dUNQdXVQMx+0/9PCMdNqr8UxmHwU=;
        b=m3Gju5mV8D9F6kel9+ypumUDT39fHsMaj4K5GgyY1NR9NJSYeSaIEDLOSrIojf/O8H
         SPGFXAzeRUWfz+mtSbSgFSnlJN/B07YKzNXqMaKvR7jMInNuXOirF66nVKCrs5/YazTL
         J+qi6fgk2oVGNPnDbVV8bSKx2NhcFeOMqWYdYftEHWeCf6rqrSPafTrFVLGnRbQahCv9
         2Ep22mHBy/GKNZcN5DRF0O9BOt3sJf11aNnnIwJVdXDPe20hd0Ag0GNLuLsI/ajNKzYl
         ZyY0FUmTAJ7gohxLoPOfDrSWmT5l7eNHoq3/bSsy+XwkmmuYc+mq2d0N6I8Wh7EZEjaQ
         Fgdg==
X-Gm-Message-State: ANoB5pldEYu6bJYx+Pr1tH1j99OoJASAl8DqEH/vZyXk42+exly08cfM
	E9FBDqDpXISVtKR+1flyhjE=
X-Google-Smtp-Source: AA0mqf7ZjnquLgnGnL3FmNwJh4HYfkrXS2M3yBUZQx2GFtzieRr8ne/NhZPZZZhMi5nHCAvoAftLeA==
X-Received: by 2002:a05:600c:6003:b0:3cf:9c1a:2fd0 with SMTP id az3-20020a05600c600300b003cf9c1a2fd0mr4066694wmb.3.1668266385210;
        Sat, 12 Nov 2022 07:19:45 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id r2-20020a5d6942000000b0022e47b57735sm4638008wrw.97.2022.11.12.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:44 -0800 (PST)
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
Subject: [PATCH 09/18] mfd: rn5t618: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:26 +0000
Message-Id: <20221112151835.39059-10-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/rn5t618.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index eb8005b4e58d..2f59230749cd 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -80,8 +80,7 @@ static const struct regmap_irq_chip rc5t619_irq_chip = {
 	.num_irqs = ARRAY_SIZE(rc5t619_irqs),
 	.num_regs = 1,
 	.status_base = RN5T618_INTMON,
-	.mask_base = RN5T618_INTEN,
-	.mask_invert = true,
+	.unmask_base = RN5T618_INTEN,
 };
 
 static struct i2c_client *rn5t618_pm_power_off;
-- 
2.38.1

