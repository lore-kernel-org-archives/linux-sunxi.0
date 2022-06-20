Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29BC3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:44 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m125-20020a1ca383000000b0039c63fe5f64so6210813wme.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yDbkoyglFzlD/is/5GkDF5bxT9ENs1AtX/zXNAcYF8s=;
        b=gdmCZ/lBOcInOC7Vpu1bY/iCkTRvuWC70p3sTpyPTGpiGjPvbOfn3qCcOS6TYvfax1
         3L11FjZaxXZKn19jySJpcCpWV+xtFrtQQCVooDpT2B76t5Yf89SzliwlOHigso1rDVLk
         oTKVebpiS712yjcf0kpN9r3uejsVQPOSwQQwOfRTaV3WxoLZf11oL8qGCQ6IIb3JKTvH
         Gd5oqTmwdqCLXQGfP9Un8n1q4CYFfIWgJvxX8PaS4jqeICZF2WLj79nuYT2SFdtS4Hri
         hh9xIXG5EB3E4bg9SOAm4e7Z9wjbeiNwP/00cDnzR6iUmi2i9i1qZqeOzh3rmmFV/C0Q
         vMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yDbkoyglFzlD/is/5GkDF5bxT9ENs1AtX/zXNAcYF8s=;
        b=AAcVA/p8TLfx5m1XqHCkdiSfPpj9FBDE7Y6RYyNiRrmuXfcz91TJ8UXI04vWazpijJ
         enRAYhbpxq2s2nvPvrrxeBoZRakcATqjpeVAZRxIbFvTTezr4C4DTb5/8YdxG8q7jKzI
         jsR2Pa5dk5Gph5r+hOYn6vQgQfoNSh2crJ70Ift87S3bClleuAqxg/ntvOAdV6MbUibA
         gOrlcS0e/lxfsI7MByJKilZSynXSVm+smDslFXM3rWkQY5DYvBgU29SphN1cVxsyfWh7
         AnIcX9egDk2DYkJpl1elxSw73bEzsHjza3CIVXYRKxSwCgVpbr1qKMjL/1c1XEurh3r8
         mbsQ==
X-Gm-Message-State: AOAM531zgFVPEg+3TeB+6ycmjBsZuC4UWcRfcv/CBAZpI5TUFmuUAii1
	iE7GR9kssu0S2a/vrzrhNDA=
X-Google-Smtp-Source: ABdhPJynux7C1eoNMlx+vUMO5VOj8q1wBlYfPuBT+ReLmKHLRHcj/n+Q7FNGG42F1xN9EMg0dcGAng==
X-Received: by 2002:a05:600c:601f:b0:39c:416c:4069 with SMTP id az31-20020a05600c601f00b0039c416c4069mr36844654wmb.85.1655755603037;
        Mon, 20 Jun 2022 13:06:43 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d4c4f000000b0021b966abc19sm300460wrt.19.2022.06.20.13.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:42 -0700 (PDT)
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
Subject: [PATCH 18/49] mfd: qcom-pm8008: Add broken_mask_unmask irq chip flag
Date: Mon, 20 Jun 2022 21:06:13 +0100
Message-Id: <20220620200644.1961936-19-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcom-pm8008 appears to use "1 to enable" convention for
enabling interrupts, with separate set and clear registers.
It's relying on masks and unmasks being inverted from their
intuitive meaning, so it needs the broken_mask_unmask flag.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index da16566f7883..18095e72714e 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -141,6 +141,7 @@ static struct regmap_irq_chip pm8008_irq_chip = {
 	.status_base		= PM8008_STATUS_BASE,
 	.mask_base		= PM8008_MASK_BASE,
 	.unmask_base		= PM8008_UNMASK_BASE,
+	.broken_mask_unmask	= true,
 	.ack_base		= PM8008_ACK_BASE,
 	.config_base		= pm8008_config_regs,
 	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
-- 
2.35.1

