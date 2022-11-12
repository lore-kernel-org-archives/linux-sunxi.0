Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BDE184E
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h9so10109305wrt.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74Exg7KddVXNG5OACBQCL3D7rKH5H5jEWAAQZrjSUes=;
        b=MEr0VMdo6LgqF2/UDeLPFeAhgBlaXGqOPj834RwpMRcd4AsPgXmzqVuVXdR0ccUDPl
         FEyfsOVcNhLCQ94HNdDVIzgPzDR72MpKXekWEDea1c0vAE18hqsjV7Df+U/O5ksph6/q
         aRVnA8FBfLy/Fb6RMKO0PbNVSINKQjS8lVK9z0nfKGA6T04oQO3XsKS+wu92U0IBMHSh
         inBINSnDaMEXhk6Zv9qmFq/D5M1hqjavWXbApmGAUH4eIw1HaVONH0venv5/3mSvlwox
         UTbCtTDgH3uIxUPK29RAsUmColKnkj6TXrSAJbAGZx3tM0riILitMyTNpNruXR2opl+7
         iBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74Exg7KddVXNG5OACBQCL3D7rKH5H5jEWAAQZrjSUes=;
        b=zecUxIn2saS5kifWxmzXSSkG0dz7vY2D0kxWG+86oQOhbpE5Q091ZVRCjVbxviWhSe
         lQh/H6s9aatRqPKdNrrKxCk51PJqW1Kwb+qys9NhgXVUpjvykrAqSAfBp65xNtJKkpDl
         CrPFJVATXOczexXR24kfNYReiKV62IA36+0YjmUei5IPreD0BL/SnskYQCcaNlxoQjkv
         xdxQ09teo65Ey2oAWfZcT7uLAvmIuaxSVcNUc0sFwXeVY9GUiUVCMfacYvITg/DwY9hu
         Tu/C5bFhmSDzi8lKnUYj3/7jJ0NGpDVWeXzSeeYaB3WbwBpCQb1bj3nm0Vpm/2iEWwW4
         1SDQ==
X-Gm-Message-State: ANoB5pnFFA++MNlHILzRpH3+0RuXKIodBkIbFiVo47ToYOXa8iM3+YiF
	u0mj2IcWOgXZ2zW+w2qB4RA=
X-Google-Smtp-Source: AA0mqf6+aF9rVvdrd8IQXlI2/qRsDWBeoBpq/BCXn5rEnK5jjDA7wKSd8BWWm1ea08LNgFoMDVM1Iw==
X-Received: by 2002:adf:f14a:0:b0:22e:3c66:bda1 with SMTP id y10-20020adff14a000000b0022e3c66bda1mr3740739wro.139.1668266389050;
        Sat, 12 Nov 2022 07:19:49 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id h11-20020a05600c314b00b003b4fe03c881sm13404048wmo.48.2022.11.12.07.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:48 -0800 (PST)
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
Subject: [PATCH 13/18] mfd: rt5120: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:30 +0000
Message-Id: <20221112151835.39059-14-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/rt5120.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/rt5120.c b/drivers/mfd/rt5120.c
index 8046e383bc92..829b7a0a0781 100644
--- a/drivers/mfd/rt5120.c
+++ b/drivers/mfd/rt5120.c
@@ -59,9 +59,8 @@ static const struct regmap_irq rt5120_irqs[] = {
 static const struct regmap_irq_chip rt5120_irq_chip = {
 	.name = "rt5120-pmic",
 	.status_base = RT5120_REG_INTSTAT,
-	.mask_base = RT5120_REG_INTENABLE,
+	.unmask_base = RT5120_REG_INTENABLE,
 	.ack_base = RT5120_REG_INTSTAT,
-	.mask_invert = true,
 	.use_ack = true,
 	.num_regs = 1,
 	.irqs = rt5120_irqs,
-- 
2.38.1

