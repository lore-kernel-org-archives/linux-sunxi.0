Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8727B3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c130-20020a1c3588000000b0039c6fd897b4so8271491wma.4
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jlVXT9wSLhbjTPX5ZR3Wmtb87jq29nLk3aAphr92sAg=;
        b=ebmJPjTeif3YqVHvTJpEhOnpA1LETt7fyC+dYjLX7rLJosvOzs1UQNRtfP7VlocI/M
         SwIjzmreM6vhiA8WP0nFyAlnvkcR1cph6p9w9CAsCH9xBR/BnJhAC1VOP2xg7dIrjnee
         +zaNjC6ZldbBdoFD98cx82VUpbinKwzYspMqw+aPPgXpt8M4kAHnWjx5TOKgR6frrIsg
         bXuvPeqxYG3zzsjOeJPJz1FR22BVk15SC32yeUV3YEF8h3u7ZygHhwDQwSNzGNcaPpgo
         N13v2bUVREQpLfKZ8qO6chIOpZWPy3oOCIUIt5sPYXlDIPpr/V0HH+XrX7eAvdFaGSwv
         Ar1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlVXT9wSLhbjTPX5ZR3Wmtb87jq29nLk3aAphr92sAg=;
        b=K3ALAd1ukY/ViXAzIdZ+lFFSKfuFLYHgANhuAchbZ8I/4dhlvLznAhGsUlfUzmhk3q
         Ops9Y2E29oP8LAXD6Jqd4uQwGEFBDCWQGxCCreESmwylbXX3dUQgugmA/Jq2F80e9Pj8
         zQZLmMQmMhcRiQ2DJSiTqOA6fUHE+6AnzbPZ2l2ONKn611qX/Ld+KuGOLHpZtVXOhhEr
         i7T1WMTmee8wDOkCvRkxXmj/gxIDhcdd0p8lSMbFmWnPaKl40KEAd89FSCPTOPKd0nHM
         sSYy0zV1D/O93ealH5AB/Jik8G63p7ZzX33ZgrjdfANS+qnfvc8oJZjBoSMGz+41nQ6v
         7TTw==
X-Gm-Message-State: AJIora9WM+/GeuZOcmYWbJvy3nNHQv+b9uJBawZGvzez3XWuALDZlUZp
	O95f+cLrQnd9tNimOOHVIH4=
X-Google-Smtp-Source: AGRyM1sc/mkNVW+Wf51Vzi8+T/JAUXCnQCm+ky6mXOwMd5kGL1382a4p9m8dOR+VJbmTp4xRJYVpMw==
X-Received: by 2002:a05:600c:19c9:b0:39c:72fc:9530 with SMTP id u9-20020a05600c19c900b0039c72fc9530mr25836673wmq.88.1655755641072;
        Mon, 20 Jun 2022 13:07:21 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id b9-20020adfe309000000b0020d0c9c95d3sm14556677wrj.77.2022.06.20.13.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:20 -0700 (PDT)
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
Subject: [PATCH 41/49] mfd: stpmic1: Enable mask_writeonly flag for irq chip
Date: Mon, 20 Jun 2022 21:06:36 +0100
Message-Id: <20220620200644.1961936-42-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The STPMIC1 has separate set and clear registers for controlling
its interrupt masks. These are volatile registers; writing a '1'
will set or clear the corresponding mask bit, and they read as 0.

Marking the registers volatile and using the mask_writeonly flag
should reduce bus traffic by avoiding a read-modify-write on the
mask set/clear registers.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/stpmic1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/stpmic1.c b/drivers/mfd/stpmic1.c
index 11f3d92acbc0..a99f7b45df57 100644
--- a/drivers/mfd/stpmic1.c
+++ b/drivers/mfd/stpmic1.c
@@ -42,6 +42,8 @@ static const struct regmap_range stpmic1_volatile_ranges[] = {
 	regmap_reg_range(WCHDG_CR, WCHDG_CR),
 	regmap_reg_range(INT_PENDING_R1, INT_PENDING_R4),
 	regmap_reg_range(INT_SRC_R1, INT_SRC_R4),
+	regmap_reg_range(INT_SET_MASK_R1, INT_SET_MASK_R4),
+	regmap_reg_range(INT_CLEAR_MASK_R1, INT_CLEAR_MASK_R4),
 };
 
 static const struct regmap_access_table stpmic1_readable_table = {
@@ -110,6 +112,7 @@ static const struct regmap_irq_chip stpmic1_regmap_irq_chip = {
 	.status_base = INT_PENDING_R1,
 	.mask_base = INT_SET_MASK_R1,
 	.unmask_base = INT_CLEAR_MASK_R1,
+	.mask_writeonly = true,
 	.ack_base = INT_CLEAR_R1,
 	.num_regs = STPMIC1_PMIC_NUM_IRQ_REGS,
 	.irqs = stpmic1_irqs,
-- 
2.35.1

