Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86553D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n1so15842974wrg.12
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RL0fwUpj3N31VObGflnvTdc3SYbFvbOFJTIucbQixBw=;
        b=Mlv4ZVoHQKH/diZ7wxwIL4K/NMJzc8U94Vgk4Cv6mLqtv2zUYMSW25mN9q0aL0QiaD
         ypWyVxkxCSP8wGvJCokCsjQ6tDA09v/ytF7zvcl648K7FlONHBR2wfNK3QShVbur16Ms
         Etfs+ATYrdsjBlliM9yYPEfiDP24lw5E53L/DQ+aFBEaoSuyH0FKKVlxJgKMAVEDu74C
         qNbf8xDFV/CcJqFhatQhPeGSPTWRTO55xPy2YKxC6vO/a5lLkP3E2xpOBkHescTgDCGf
         6sV5K6mdGgz67dpXL7CLkkp/9x203Hye1oIstypDYQK4gwAVULEnVqIxaa7ZmZAes0sL
         9TIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RL0fwUpj3N31VObGflnvTdc3SYbFvbOFJTIucbQixBw=;
        b=wMw1X42Phpw8tPHIpTq+BAj3/zk5ujoXqQPD0GoYOVi39bPVsG3yc94y4FPnDG3kVw
         ECFn0KKca1lpnip9heTuj2LM/249JPYHpLYSGg5mP7pLTN067JjpJildcMBdyAexLlwn
         Yzz6WwWRYLmuEREw9UuAK/MuLb058tXeas45VMMrATv1W/pTYymRobKEAR1VbyTU8LAn
         CaFzE36VoFfFyZgtapfaX4bYJ+jGIloYNm1n5ObFtkmoQx52eWtNxMHTAEX/EAi+Z2as
         pEylxjNpavUCGku4K+zjG0gkPWBL0fxuN2ibXR29sw7cWjldyUd4peHMDVRmeJsg8zUR
         e4uw==
X-Gm-Message-State: AJIora8nHepZPnxprLu6V7dY1cEzv+JSuM/nCswTrDlzzDNQqSbrK1nr
	nZmWAGFDnmVhd9ze3DR+xDI=
X-Google-Smtp-Source: AGRyM1sc2kxmFsNd28wLHl+sBWx8EhrjSubA+8EnJdnvaG1LPBATT/Oqb8jppvaI5mcfhWVI8YU61A==
X-Received: by 2002:a5d:47a8:0:b0:217:b5ea:bdfb with SMTP id 8-20020a5d47a8000000b00217b5eabdfbmr25488579wrb.492.1655755620510;
        Mon, 20 Jun 2022 13:07:00 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id n23-20020a05600c3b9700b0039c5224bfcbsm20985958wms.46.2022.06.20.13.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:00 -0700 (PDT)
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
Subject: [PATCH 29/49] mfd: atc260x: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:24 +0100
Message-Id: <20220620200644.1961936-30-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An inverted mask register can be described more directly
as an unmask register.

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
2.35.1

