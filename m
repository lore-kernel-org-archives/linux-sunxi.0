Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207053D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so2062237wmb.5
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F4wATPKotQB5JDuhaBZ5Jb5Nh8kCkmxeR4cD85ob0jA=;
        b=e+BrKFyUAEKrBpsdiTI0hXdQRnQfzScB8duoVAuFg+GJ0Jh4zZD5Q/yH5NsPA1D9fK
         uaNwGLpdVywtGRLROPl5tTxFT7A8jPHaWbjaPAMdsjcQoj2Fxm0OgNstaADl0insuEPU
         P50NDcoj6V57762q+5c86res9ZHtgVjfYyuGy0xSGWhhHkfr1HpoVpzrKy1Z/3zFEUFZ
         67Fh85T75VnGSm9kPme9xBV7w8ac712S9ul2GLnNaWtQDEdomD1S1aBv1jYpvYeu5a7r
         MGwYhNujO4gNlNbVwu8A+bWELyeb6pNXvwP3xhw3JTzKit4mY+kzcbb6HrnaUC5RjRIY
         8xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F4wATPKotQB5JDuhaBZ5Jb5Nh8kCkmxeR4cD85ob0jA=;
        b=Wav4vf3o3r045CA51o3toqfrHvvZZrXCNWMEPKYfdoECoHr8R93cDXt/MPJMji+Iva
         8vJz+ipY08r40bpBc5d0qCpuXhQVRATy3aq9c+KSussXT5JtJbm4+KkzI/sb+xnuuDyr
         +nrTd+4RxrDf1M6sqKCrgy/C5hrTc35GB96Yfyml3K1b7NjHCM44RgCEgpsJQxdY4Yo7
         Kry4/byUSrCJfbWiQWZdzZB1D178MSIAK5VESZJfe04/4lN+UTBHlkBF++YZrlEY/m5j
         lN6aidPNTVmhtgTDV2vYPzLLszOiVY1ji+AsNo10teH1751lgUxDyUvYkILlm+xz3p4v
         aSGA==
X-Gm-Message-State: AJIora9Mve9eA+6x36SCq/EAtPItkU7hjg76BhltMdzfW/ehHK3onhJf
	lmNjSTxfwxrdZL6TckOHcZ4=
X-Google-Smtp-Source: AGRyM1viZL39dZzsNTWFK1Nii5H/dfYG1kHfbnLLGc84T/J91auGii4XODLgdHEKlU2wd9OGVZncsg==
X-Received: by 2002:a7b:cc8e:0:b0:39c:829d:609b with SMTP id p14-20020a7bcc8e000000b0039c829d609bmr27634897wma.160.1655755604433;
        Mon, 20 Jun 2022 13:06:44 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id y16-20020a5d6150000000b0021b932de5d6sm2486492wrt.39.2022.06.20.13.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:44 -0700 (PDT)
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
Subject: [PATCH 19/49] mfd: stpmic1: Add broken_mask_unmask irq chip flag
Date: Mon, 20 Jun 2022 21:06:14 +0100
Message-Id: <20220620200644.1961936-20-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The STPMIC1 has a normal "1 to disable" mask register with
separate set and clear registers. It's relying on masks and
unmasks being inverted from their intuitive meaning, so it
needs the broken_mask_unmask flag.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/stpmic1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/stpmic1.c b/drivers/mfd/stpmic1.c
index eb3da558c3fb..2307d1b0269d 100644
--- a/drivers/mfd/stpmic1.c
+++ b/drivers/mfd/stpmic1.c
@@ -110,6 +110,7 @@ static const struct regmap_irq_chip stpmic1_regmap_irq_chip = {
 	.status_base = INT_PENDING_R1,
 	.mask_base = INT_CLEAR_MASK_R1,
 	.unmask_base = INT_SET_MASK_R1,
+	.broken_mask_unmask = true,
 	.ack_base = INT_CLEAR_R1,
 	.num_regs = STPMIC1_PMIC_NUM_IRQ_REGS,
 	.irqs = stpmic1_irqs,
-- 
2.35.1

