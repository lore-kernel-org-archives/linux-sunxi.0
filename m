Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1D3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:04 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id z17so6380494wmi.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oqx3v8Sb2M8GmsYA5Ky+XV9uouybbnIvgB5+4WCQaEA=;
        b=I9SWwmkbAS0twwPt8IX4E7bPDCP7aUbF2QrdWQqioO/YT8vPWDbo5jafFWHLiMIjc6
         1mw/0Uimpyz3cUcNIuL1gNMxnkzOwuSG3edxomlaxXv/3L99G0JTdAg4POHGrEyB2REH
         3lIDZKKJ3rfCVWbTQEoaG7JmB0gDKFGBeqb20JXEMuxvSMR5CHUbycRO4F8LKhZqPuhZ
         YEBHTx15YFCjU5hxF8mncOccOzTdEdvUtBMGeSXsVkIqDI9MxnDbvI8sGUw4c4kcM2YR
         yU4ZYgDnXaav8BMzDiccmgOUBiOIkEhH4tyXriDpDiHGnyleHXKRGyMCZfOTYeUkSsCw
         fC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oqx3v8Sb2M8GmsYA5Ky+XV9uouybbnIvgB5+4WCQaEA=;
        b=Vr0//Ozr26pp6/GFpjD3uVctITZgEY8lZWBO33c9TQ++aD70oxIyQISgqRHDUlxh30
         z/KPWRRl8ysCqCth2c2LJItuWVtoeLbXLqBgcP3SAgRdGMABRXWZ9PkjHJMQo7c9sfPs
         Nd0JDd015w4gPZcsy1B+XHmFknzY9dLHYYCoNZxKlVtrkKfkzTC4ADKiIQpgswHErQHV
         EfnXV7rxiN4ThLB9UpQKVI+4Iv1Yo2WHzXRiON1e+3cHiu2skeyWrverQS/iOg7spNWI
         IRC9BZKB/EEFht7vXTWxbHT2lSI/qS7Nl/btsK5kIM4xWaIePjSfgZ/x2ooCRgk+MUKl
         cVpg==
X-Gm-Message-State: AJIora9XC4BqMtaMz9dgzyRu5nIDzImIhf6WB51IijJS/o9oflHM7ndR
	Fa69HV7j/xw6BTUTyIt8Yvo=
X-Google-Smtp-Source: AGRyM1swymX/u49DBHMJPPyC7OgnYJ7zcAJGoTucjUXlwJwy4Cy1b+UW+TJYIq67rmm7OR5jau1T3g==
X-Received: by 2002:a05:600c:5112:b0:397:53f5:e15b with SMTP id o18-20020a05600c511200b0039753f5e15bmr26726456wms.93.1655755622524;
        Mon, 20 Jun 2022 13:07:02 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id a17-20020adffad1000000b0021b8749728dsm8178971wrs.73.2022.06.20.13.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:01 -0700 (PDT)
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
Subject: [PATCH 30/49] mfd: 88pm800: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:25 +0100
Message-Id: <20220620200644.1961936-31-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/88pm800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index eaf9845633b4..6d1192db13c1 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -398,9 +398,8 @@ static struct regmap_irq_chip pm800_irq_chip = {
 
 	.num_regs = 4,
 	.status_base = PM800_INT_STATUS1,
-	.mask_base = PM800_INT_ENA_1,
+	.unmask_base = PM800_INT_ENA_1,
 	.ack_base = PM800_INT_STATUS1,
-	.mask_invert = 1,
 };
 
 static int pm800_pages_init(struct pm80x_chip *chip)
-- 
2.35.1

