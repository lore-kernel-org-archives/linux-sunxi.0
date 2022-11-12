Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6C8184E
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d9so5364367wrm.13
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8JtmDVGUNZLueBXNVQdf6legj2BoWLl/9Iq8NNieS4=;
        b=KgVCH/IFzLTIzv2PmfoezQS90DP/PkehCN9B1h+H4iFdbdWIoTM/r7Cwa50poXtFWw
         NGobU9+5fCU93t7rWyMWBVeXP3BWGb4qVZXku5GvCOk8CbtvwNjcx7znBvqXHjZZCuYi
         mzyflMozHYpDKR+R2CMCtOyvlK/HLu6kYLbfm3MKtJOadtucpLfIdjb7pjU81gWgNLD9
         ao6sjM22ue0h5CXip8Fs/1x/U3Zceh0J0m598S55uOJ+iMIhlHXZxNngz1rfNFU3FoVa
         FG1E9X+nZE89AU1VFg2MIojBWjLFwLgXY1jfRpe0KGf4JWDbghj/yF7kWMFERb9a957p
         +JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8JtmDVGUNZLueBXNVQdf6legj2BoWLl/9Iq8NNieS4=;
        b=e9R1W14UVFDTvN+O4xi9pHajUJKodzKo9NGRlfpq4BTBLqXm9uyaNFAr1F3AvnKLIU
         sFYHGsiUjJzHLCYIzZIV7vcr9QPQBDTz9WUFDsC8Y7ct/96z7KYAOGTVjgSce9/tth9l
         kULX7xioZtSbAuH0oqcenSHWlQg+4zBJUdibyymWdHzXqHMTPq0dC1LW9X6kbbSYkXzH
         /TMDUzCO5L2JwOgBoB3rbaif879cOggpJgIeHI0Ganr6c4J1Q5zmnesIEIBWUirhhUmO
         MgXGmgT4JiDn7o51u8ekFnO5MyByFUgZdKsBfBqGosDemrkQU4z42Tu+GJrhLMOf74Hb
         4K9Q==
X-Gm-Message-State: ANoB5pm8MQwvYXZHLBzNkQNnUM7hKYkfvxhrCaZ2HXn/UTYvk0ouwpqw
	6e96LUd030ypidPVQ5EadeM=
X-Google-Smtp-Source: AA0mqf65Zhyw4t2aHprnYTDPvoYRtVEFmQatzMZYXusOOb59557kwzoehqrtwp2Yr1oquLEdy9q4VA==
X-Received: by 2002:adf:f5c5:0:b0:22e:597:8541 with SMTP id k5-20020adff5c5000000b0022e05978541mr3792906wrp.612.1668266393046;
        Sat, 12 Nov 2022 07:19:53 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d54cb000000b002415dd45320sm4584152wrv.112.2022.11.12.07.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:52 -0800 (PST)
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
Subject: [PATCH 17/18] mfd: tps65090: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:34 +0000
Message-Id: <20221112151835.39059-18-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/tps65090.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index bd6235308c6b..e474e1ca253a 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -127,8 +127,7 @@ static struct regmap_irq_chip tps65090_irq_chip = {
 	.num_irqs = ARRAY_SIZE(tps65090_irqs),
 	.num_regs = NUM_INT_REG,
 	.status_base = TPS65090_REG_INTR_STS,
-	.mask_base = TPS65090_REG_INTR_MASK,
-	.mask_invert = true,
+	.unmask_base = TPS65090_REG_INTR_MASK,
 };
 
 static bool is_volatile_reg(struct device *dev, unsigned int reg)
-- 
2.38.1

