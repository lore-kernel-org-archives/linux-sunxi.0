Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1527C3D6E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id g27so9434019wrb.10
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=drtbL6Ol3nSvJosEWn6BWyNAP++5ZasjbOfmzop3MZQ=;
        b=QjvV+I2LY/VPVY45eWYJLbt7si9DgUbUdBiK1tnDmgIOAGcJlPEfPEbz0xPv6PFG6C
         fqwpwN657JaXPxJXBP5AOwcKcjfbM0nFCo3ly+/TCctIcxL8Ez9srZzj3C6ZbVZaRiqz
         JbpxIf/a/wjakAyd7TsXsc3ArAii392QnIxa2RXb5I35fEt59JdMD+jqhaGkdRCDDnM/
         pAKKZGaQWk1j3re/9CnNYt5bHRviVWNWQz6tjo3Kf2EI4KjNuph2+cI7M7xbk0fkDW+c
         fBjVbekqWUfyD7IfdeqH1QuljKLVCEXC/+72mhEJsa01pPfOg9ygPXXe7cysaPnB7z2q
         C0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=drtbL6Ol3nSvJosEWn6BWyNAP++5ZasjbOfmzop3MZQ=;
        b=kdkOq5+kXnE5dT+94HlgSVk/k69RURKXkzd6RMh9y5r7wDNi6k/a/hNBFAQweJfGdg
         zfU5dfpB+gc09UPvDZnBL9lwmEp45ChELVFlqZLATtwIcWU06RC7XLqVVK1LSRxU7KY1
         ZMGqjJ4QOAG2f2N30c4JGGWQ8yrQOtg9BKO0JPNoKtnsjlTLKEHLSr2w+Lk19cy7eY6v
         2KUoPIwuChb3kEuBgaolErlhM+r2LohRB7p72mJyzmusvDDH/xsmZ2YpbKNhzdIfOCUz
         ErV+Sa8ThgZG22K4lInT1Iv2H9yejsRRb65fwQPIBEqd/hk2WYGWQHAmAJ6hmUndb4C/
         fUSw==
X-Gm-Message-State: AJIora+LLj7ZPSZQMrAzJoKitOtKHTuZ6KaEjctCZ+JpvhSjfh8mfECr
	YqOunH6DVABuV1poK5l49rk=
X-Google-Smtp-Source: AGRyM1upACNZTooDfHG9XrmiWJXxBNAesYYQbcORquUwOuEJ3OJEEk57wgHnkZp1ZcThb45MTPunjw==
X-Received: by 2002:a05:6000:1788:b0:219:e28f:dc98 with SMTP id e8-20020a056000178800b00219e28fdc98mr24527156wrg.144.1655755639378;
        Mon, 20 Jun 2022 13:07:19 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id c130-20020a1c3588000000b0039c798b2dc5sm19765399wma.8.2022.06.20.13.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:18 -0700 (PDT)
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
Subject: [PATCH 40/49] mfd: stpmic1: Fix broken mask/unmask in irq chip
Date: Mon, 20 Jun 2022 21:06:35 +0100
Message-Id: <20220620200644.1961936-41-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Swap mask_base and unmask_base, and drop the broken_mask_unmask
flag since we're now expecting the registers to have their usual
behavior.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/stpmic1.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/stpmic1.c b/drivers/mfd/stpmic1.c
index 2307d1b0269d..11f3d92acbc0 100644
--- a/drivers/mfd/stpmic1.c
+++ b/drivers/mfd/stpmic1.c
@@ -108,9 +108,8 @@ static const struct regmap_irq stpmic1_irqs[] = {
 static const struct regmap_irq_chip stpmic1_regmap_irq_chip = {
 	.name = "pmic_irq",
 	.status_base = INT_PENDING_R1,
-	.mask_base = INT_CLEAR_MASK_R1,
-	.unmask_base = INT_SET_MASK_R1,
-	.broken_mask_unmask = true,
+	.mask_base = INT_SET_MASK_R1,
+	.unmask_base = INT_CLEAR_MASK_R1,
 	.ack_base = INT_CLEAR_R1,
 	.num_regs = STPMIC1_PMIC_NUM_IRQ_REGS,
 	.irqs = stpmic1_irqs,
-- 
2.35.1

