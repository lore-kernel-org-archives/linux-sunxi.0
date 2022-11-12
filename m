Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE51C01
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso4867169wms.4
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD6PwOw6vjJScTTxUIfc/0eVLXeaWOT/pR+rswb6rJg=;
        b=Me8hdm6wyighrirkPUbw9VrQ6dfBl+1O/hpilRSfGYOHE72AVQF1TKd3bTlJ2uYUCB
         A3jEIRs9nskuxmEjbTdCZ4IXAS8k91jE+IJvKk8m7O2j8kPqCioC0v52kotBvRP/05FK
         4MJHdWMZu+rJEwjGoER64r+1nbEQjA5NjwFzYXR4op07cj6uxqGMOmTgss32WdA2zDav
         VE9oVv8zRZt0pIq9jYYJraH1vTTkHWzdZc82mxm9De0lOZwNo5ZKmpq23gHRokZk5Od5
         ccF1HaZbBLE+SYig33M2zUqa12pa4prerFA2OFXO63J2iYzV6gvOUyP1BF3Yem200QkB
         HtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD6PwOw6vjJScTTxUIfc/0eVLXeaWOT/pR+rswb6rJg=;
        b=SprihukbeL8q/pVj3WyhMmJ0rj+nXYzpHISSKktnKWAH1IGROiFCjXzFOqHq9fUcLS
         nqVcjh2FkKe7eGzz3tgEzhZ6XF95a4Fx0nK1o6NbO+GxBrrwsUFH1it6o+2DDuq7i+9g
         pOv+6BtIc3FxeXljT8F6zwdwiaPukHfNKG11YEQWYc8Bbh4cXvKYWTGtIW8+llowGZ0u
         BANOhHXq/3MIx1z7cAcWfy5B7pKFixg4tesBR6Z1rGQMHB4f53/j2voMzmNdH8Xc4wEj
         LP1xNq9BnJtN7cnasctEPLLZzfjoAqCkOrM9d0fLdiVivZu5Wdf2ZD4AaFCBlBoAZeMk
         5PSQ==
X-Gm-Message-State: ANoB5pkGut7ohWq/qNEB/he/KROloXx8S8LknwCuyOkC0/9vf0aeCqv+
	j3Jj6anxWcENT+S+KeACAnk=
X-Google-Smtp-Source: AA0mqf48o7lLpkMDzUxOkJUTi4WKlwN9mDAPsmAHUDd47sx4NrNb2/M9KnnO033o3lFPMXn+d2e5IA==
X-Received: by 2002:a05:600c:3b08:b0:3cf:8e62:f748 with SMTP id m8-20020a05600c3b0800b003cf8e62f748mr4000740wms.175.1668266379182;
        Sat, 12 Nov 2022 07:19:39 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id x10-20020adff64a000000b00236883f2f5csm4644777wrp.94.2022.11.12.07.19.38
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
Subject: [PATCH 03/18] mfd: axp20x: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:20 +0000
Message-Id: <20221112151835.39059-4-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/axp20x.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 88a212a8168c..6e6b5dbab098 100644
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
2.38.1

