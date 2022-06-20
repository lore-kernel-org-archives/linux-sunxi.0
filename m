Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0110D3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:29 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id i81-20020a1c3b54000000b0039c76434147so8282893wma.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E0jLkqilWpvnbTcSo4wfjkJhQqF1reP5Ib9ezCHoYWc=;
        b=U/u1eI8XG0RLSewZC9yH0TEBjAQ2QVQeFgi9rzCUa/S/IXH9PHYw0gdakIKNDT90kV
         hMuwVJCliXAFt+/OKjfOJGf07gA2TRZWRFVa9nvnR7w8MWysPG76mxgNw9ukyrADHZ5N
         ALr37IiaH9saP7DoyArHAIbUsX5KFRzx8Uw6meqm+M15MdeUmVUAWTmMi15JWu+Wq07m
         itZyiVgoqQZkvIT6ra3IIfQvQJZJo5C0Y+CD2t4yxMPenkkULdYZFq6Wwj6TJ4CoenZF
         dRCH3mEbVAzCd1YjOvUgfQGm1TEKpTWU8WSRmJwdw9G0Be/ybY4XqRUVEJ0I0EIJYNRr
         FSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E0jLkqilWpvnbTcSo4wfjkJhQqF1reP5Ib9ezCHoYWc=;
        b=OIvAdk061dMImzRA5IcfIzoUH7OgfaWaAXoTQx/q3PX2wmAZBLSSQJ4D3vVu+Th7Nh
         uGFhmmi/4sUDX7La23Rg33cM7zonMlgs29E89cT+fD8kCqaa1c3wf+6+nfOvtRkCRpEx
         8fWqMJMXeLUzVtczIoPhKT8SxjvkeKTnQycCRnDhM5p4UKmDGnrfPG8aJVErARwNLTjS
         BdGeDuLLv2Ec8ctgy/9SOpXWN+VriqIwFpdtmmt1oNWlZVx/wgcBt+FjXWT7ZMsfUOqq
         kZjlOWdhmXLjsdXrraHOIL/vn15cFou/H6tfCRcV7zsaNHQTUtyovEZPNlXMBDv7HWbG
         BK1g==
X-Gm-Message-State: AJIora+Q8zBs5HjHkZSiJ9QHG38Lfx+0PKig4rPG9sQ4OajyXS+JSUrA
	ZUcM6E4QyN428e8bD/2qVtg=
X-Google-Smtp-Source: AGRyM1uhXBLM2mCEhpF1oCgYeIG722Adlji+SZHE2C7bZquQV7GS0wP1KfS6UMHZPFYNwRmyV3niBQ==
X-Received: by 2002:a05:600c:1c10:b0:39c:4708:648d with SMTP id j16-20020a05600c1c1000b0039c4708648dmr26590108wms.85.1655755649580;
        Mon, 20 Jun 2022 13:07:29 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b0039c5328ad92sm22754411wmq.41.2022.06.20.13.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:29 -0700 (PDT)
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
Subject: [PATCH 46/49] regmap-irq: Refactor checks for status bulk read support
Date: Mon, 20 Jun 2022 21:06:41 +0100
Message-Id: <20220620200644.1961936-47-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are several conditions that must be satisfied to support
bulk read of status registers. Move the check into a function
to avoid duplicating it in two places.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 0a8edaee064a..7b5bd1d45fc0 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -72,6 +72,14 @@ struct regmap_irq *irq_to_regmap_irq(struct regmap_irq_chip_data *data,
 	return &data->chip->irqs[irq];
 }
 
+static bool regmap_irq_can_bulk_read_status(struct regmap_irq_chip_data *data)
+{
+	struct regmap *map = data->map;
+
+	return !map->use_single_read && map->reg_stride == 1 &&
+		data->irq_reg_stride == 1;
+}
+
 static void regmap_irq_lock(struct irq_data *data)
 {
 	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
@@ -413,8 +421,7 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 			}
 
 		}
-	} else if (!map->use_single_read && map->reg_stride == 1 &&
-		   data->irq_reg_stride == 1) {
+	} else if (regmap_irq_can_bulk_read_status(data)) {
 
 		u8 *buf8 = data->status_reg_buf;
 		u16 *buf16 = data->status_reg_buf;
@@ -723,8 +730,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	else
 		d->irq_reg_stride = 1;
 
-	if (!map->use_single_read && map->reg_stride == 1 &&
-	    d->irq_reg_stride == 1) {
+	if (regmap_irq_can_bulk_read_status(d)) {
 		d->status_reg_buf = kmalloc_array(chip->num_regs,
 						  map->format.val_bytes,
 						  GFP_KERNEL);
-- 
2.35.1

