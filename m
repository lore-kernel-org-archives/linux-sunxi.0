Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF43D6E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n1so15842974wrg.12
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A1yO+P1r84NYRYcFw/ZOtSs0+i9q2Gv8RY8Jy0yOWqY=;
        b=j2RQqZvh6APhdsK/EoTEu81N6Pul31dRgCB3yZd8hs5x1U3Wtqcpi2IyHAfCICffHg
         gRE46BYS28U7XDvZvtUKB6Bkt51LTKNLuZl3ptMzn6BQlBgLD2r3jh/R/AjmK32xBhB/
         0LpqqAVt8CRLw8siXXmzBnqgCtafznYB6s/GT5pjpaL3Ybu6ff4EmEAU0UeweWfDlu9D
         gOHJaQkTCVmjnZ/VC5kfoHwVeu8ak+VVcbBIvos7fbcasrp9o1zr3tS8GqZqPBD0EZVy
         6K+rt8doOLqgDBdCB8rSjJnqOboGjisOhkwGg2ROmQbfj+bRGDs7mmQs1WJsKO3Yyqid
         O2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A1yO+P1r84NYRYcFw/ZOtSs0+i9q2Gv8RY8Jy0yOWqY=;
        b=WVqqyHoZXkKXdEAG2wliDgMZh792rBLuHKLGycQolYAdhGP3PIl/X6BgF6mXH15NtX
         IKiXaplI5ZCCFvZo9XsgOK9ngtec2Yxp0ddZ26Tnfuh+e/eTn3tVFmbh9K6jRTac748c
         AqP37G1ROfOAntAnY4Eo8x9FQHfuzNQHpUVnonD7R8DxeNmYJigjeyqqDuSMB01h0s7H
         2wO75GRtwIfCUzVFvqHTbjY1G44Lz4JnGeiVntYsyBxbsWa+ajbud9wIsXUz+8XZcfTY
         dO9eXG6ioXC/Rbiup+UeTsUgBb6qTCV3MbOtrfs1Lo7xdp7Ux05CRWM6uaEabwgVd1qD
         80qA==
X-Gm-Message-State: AJIora9GVjXBOznPruxv69+B7Z1AjS8VJ7kxP210X5SYobIgcsc/4Nry
	nyopYo7FuB3kSjsbXs8WkMk=
X-Google-Smtp-Source: AGRyM1vhjUq4WlL+gX1y0tyZ4A5CURR86xjVYNDJLu6ZP96h77dZI91Uh7rAWnxqjmtwV7H8z5gWhg==
X-Received: by 2002:a5d:67c3:0:b0:21b:8cd4:ad60 with SMTP id n3-20020a5d67c3000000b0021b8cd4ad60mr8680011wrw.380.1655755600064;
        Mon, 20 Jun 2022 13:06:40 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d4201000000b0021a36955493sm14274307wrq.74.2022.06.20.13.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:39 -0700 (PDT)
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
Subject: [PATCH 16/49] regmap-irq: Rename regmap_irq_update_bits()
Date: Mon, 20 Jun 2022 21:06:11 +0100
Message-Id: <20220620200644.1961936-17-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function should only be used for updating mask bits, since
it checks the mask_writeonly flag. To avoid confusion, rename it
to regmap_irq_update_mask_bits().

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 4c0d7f7aa544..875415fc3133 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -79,9 +79,9 @@ static void regmap_irq_lock(struct irq_data *data)
 	mutex_lock(&d->lock);
 }
 
-static int regmap_irq_update_bits(struct regmap_irq_chip_data *d,
-				  unsigned int reg, unsigned int mask,
-				  unsigned int val)
+static int regmap_irq_update_mask_bits(struct regmap_irq_chip_data *d,
+				       unsigned int reg, unsigned int mask,
+				       unsigned int val)
 {
 	if (d->chip->mask_writeonly)
 		return regmap_write(d->map, reg, val & mask);
@@ -129,11 +129,11 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 
 		reg = sub_irq_reg(d, d->chip->mask_base, i);
 		if (d->chip->mask_invert) {
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					 d->mask_buf_def[i], ~d->mask_buf[i]);
 		} else if (d->chip->unmask_base) {
 			/* set mask with mask_base register */
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], ~d->mask_buf[i]);
 			if (ret < 0)
 				dev_err(d->map->dev,
@@ -142,12 +142,12 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 			unmask_offset = d->chip->unmask_base -
 							d->chip->mask_base;
 			/* clear mask with unmask_base register */
-			ret = regmap_irq_update_bits(d,
+			ret = regmap_irq_update_mask_bits(d,
 					reg + unmask_offset,
 					d->mask_buf_def[i],
 					d->mask_buf[i]);
 		} else {
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					 d->mask_buf_def[i], d->mask_buf[i]);
 		}
 		if (ret != 0)
@@ -761,17 +761,17 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		reg = sub_irq_reg(d, d->chip->mask_base, i);
 
 		if (chip->mask_invert)
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					 d->mask_buf[i], ~d->mask_buf[i]);
 		else if (d->chip->unmask_base) {
 			unmask_offset = d->chip->unmask_base -
 					d->chip->mask_base;
-			ret = regmap_irq_update_bits(d,
+			ret = regmap_irq_update_mask_bits(d,
 					reg + unmask_offset,
 					d->mask_buf[i],
 					d->mask_buf[i]);
 		} else
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					 d->mask_buf[i], d->mask_buf[i]);
 		if (ret != 0) {
 			dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
-- 
2.35.1

