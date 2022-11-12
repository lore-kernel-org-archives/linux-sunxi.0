Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88EA1858
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so6736522wmi.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok7HpRM+XtzDAgo3jwhMBdJyhpha2jg6F6Os6h21MVc=;
        b=gJ3Se3YJBcHCIsogJkRdhV9D/9OrVb/ee9dNAk80ZErZAgxIhhGkKsyEqbYPkiDw6D
         im3ckufSkCIrYHONHqeFAg8XvnQihlv6EQoPoDFCaHzjBEcsi8hWCpYRG7jvG1cW/l2J
         vngvQUhyY/Ay8hhc4RiXRT0utvvzlcwlcVjVbOGu74ht5cbnQq/6UBFKnPZb/bJacQ3Q
         GkZimPSbVGqigELup8lmT+Zo+3iQNuWQBTgkJm5hKwuTZZF5DAgRKXqpnOV6/2urK/Wc
         DMGVB6IlRxHNHChs7xR2eM/uxI7uvQmmqQq73ePH/+esLBbyPPxRWzVhppZwKZznxVA+
         71zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok7HpRM+XtzDAgo3jwhMBdJyhpha2jg6F6Os6h21MVc=;
        b=IAFarF+Mo/sDLyb7jB+Rn8xj3bSIunS7Tz5mT3mEBn5GpMSx/Gex4F+4vC33g7Dosf
         TDzy83JuDo9aekC92Spg7wJhvLhMzkocaBYh57lAPyuN3l9kXABYC/xlyy7C9FsNoBwg
         f953oPUhq2OafTUZLK5sW1KudUP7CIjESH2l+LgcihTTEw66ZyWyD79XuknmRWtAwB+4
         01QeVufZIMqfRaADQK4uBksExzLWgxxxMKkwCs0jSPmaoD6sOfxXdZUVVNT9Y91T9hZm
         xGjXU/lGZ7KEawMBCuEpZfSo+7m1jQisidYHSntTPymkl309YtjgOB39T90LOnEU1AQo
         pkcA==
X-Gm-Message-State: ANoB5pm5wxxmVg93qbXxQjG5SytyapE3h8xuxQe8UBEN/+M2EWzw54F1
	w4mFSxOtdBPjEOXeq8di+wY=
X-Google-Smtp-Source: AA0mqf7TWJmeBw/gK7xmmf6T7hKI7a8pcXblvBR5D7H29oAqBEY40zxyQHONWj4jNdNQirVSsJRTdw==
X-Received: by 2002:a05:600c:1e10:b0:3cf:8ebf:69b with SMTP id ay16-20020a05600c1e1000b003cf8ebf069bmr4226300wmb.86.1668266384285;
        Sat, 12 Nov 2022 07:19:44 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c2f0800b003c701c12a17sm12005218wmn.12.2022.11.12.07.19.43
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
Subject: [PATCH 08/18] mfd: max77843: Drop useless mask_invert flag on irqchip
Date: Sat, 12 Nov 2022 15:18:25 +0000
Message-Id: <20221112151835.39059-9-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/max77843.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 209ee24d9ce1..4da58eab1603 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -59,7 +59,6 @@ static const struct regmap_irq_chip max77843_irq_chip = {
 	.name		= "max77843",
 	.status_base	= MAX77843_SYS_REG_SYSINTSRC,
 	.mask_base	= MAX77843_SYS_REG_SYSINTMASK,
-	.mask_invert	= false,
 	.num_regs	= 1,
 	.irqs		= max77843_irqs,
 	.num_irqs	= ARRAY_SIZE(max77843_irqs),
-- 
2.38.1

