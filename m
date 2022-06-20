Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300DB3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n1so15842974wrg.12
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DTY/U6s0Ls/Dtw06y3+h8JI8hTjwct+Am+4ddShNVBI=;
        b=YLV9HVC+AuiPiyFoS3kBS6rWy2Gjdbs/RM2nFfy9wTqwdZFX0UXlXKk5xti7k7/YfQ
         2P62pyaX41f81Mx4DSWuyjatSY+/7lA/G8nV48egrVJ2yaymGBYB2GNCkXpSY8BVwdPc
         UfIABhiWRF+9AghYCFIxPI5Zxc5kChjXJpHLRgpieDaKOWBp5sHc9iq/i8aKzPSn9tFm
         4gxgSzdozxH22+jMKs/x0dBZBgERtmU1igIsm48zLXwthMic+vhyTYQctNH5OkVynDcN
         7mpW0MeJmLgfC+VbxloiSMxT2IAuB2PsvQjFG1L99Vog+c+Ukv3qRMNVf6Kq/ifo+mKe
         7Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DTY/U6s0Ls/Dtw06y3+h8JI8hTjwct+Am+4ddShNVBI=;
        b=3Wfc4dq4jswLZ/DODiDM7E5PnewO6d9xrQJ3pzVXRqUsjJ/8izSGN/kayMUtb12S+K
         AdN3ZE4qsYI8IRrotg31emn+WzqbMMasO8PMCMzPpXwiCOcPZR4QA40qR0MTq26DgAjX
         TOXkuLVHWS4f0nbSHhG5nVZ4GPxUm/k4g9whWbu4g+M+ewpWX0zoT5JmDcmCJOsSmlf/
         nz/PpxIhMNZVkk+Q0VGkYMjgXFfjrRdToSd5gmOuT6d/cjdpcFghDhCOBpaespTkubXY
         ZrgFaqIdDN0Jbg3nPGEtKmaEyBs9Tv2k6sYg9GliHQMoonwX66e/4zoRSsKq0x7BUdkz
         S/jg==
X-Gm-Message-State: AJIora9gbJv+SiD1Q6iMYY88f+P1f7+59BlqdJj3Eqbc97LnsMDbcRk+
	u6gboqQnJlEqfBdcXFDXDA4=
X-Google-Smtp-Source: AGRyM1sDxyahRh5I6JQeiiGBQbk9ax/ShTfPCo/d3S6kQfwtlTUB/zSFPkFow3AhqZQhxwOVIp9FHQ==
X-Received: by 2002:a5d:64e9:0:b0:218:3fdb:bfd2 with SMTP id g9-20020a5d64e9000000b002183fdbbfd2mr25588725wri.717.1655755618712;
        Mon, 20 Jun 2022 13:06:58 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id d9-20020a056000114900b0021b8dd05f45sm4858105wrx.55.2022.06.20.13.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:58 -0700 (PDT)
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
Subject: [PATCH 28/49] mfd: axp20x: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:23 +0100
Message-Id: <20220620200644.1961936-29-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/axp20x.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 8161a5dc68e8..3be0d0aa8b34 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -506,8 +506,7 @@ static const struct regmap_irq_chip axp152_regmap_irq_chip = {
 	.name			= "axp152_irq_chip",
 	.status_base		= AXP152_IRQ1_STATE,
 	.ack_base		= AXP152_IRQ1_STATE,
-	.mask_base		= AXP152_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP152_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp152_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp152_regmap_irqs),
@@ -518,8 +517,7 @@ static const struct regmap_irq_chip axp20x_regmap_irq_chip = {
 	.name			= "axp20x_irq_chip",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp20x_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp20x_regmap_irqs),
@@ -531,8 +529,7 @@ static const struct regmap_irq_chip axp22x_regmap_irq_chip = {
 	.name			= "axp22x_irq_chip",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp22x_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp22x_regmap_irqs),
@@ -543,8 +540,7 @@ static const struct regmap_irq_chip axp288_regmap_irq_chip = {
 	.name			= "axp288_irq_chip",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp288_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp288_regmap_irqs),
@@ -556,8 +552,7 @@ static const struct regmap_irq_chip axp803_regmap_irq_chip = {
 	.name			= "axp803",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp803_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp803_regmap_irqs),
@@ -568,8 +563,7 @@ static const struct regmap_irq_chip axp806_regmap_irq_chip = {
 	.name			= "axp806",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp806_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp806_regmap_irqs),
@@ -580,8 +574,7 @@ static const struct regmap_irq_chip axp809_regmap_irq_chip = {
 	.name			= "axp809",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp809_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp809_regmap_irqs),
-- 
2.35.1

