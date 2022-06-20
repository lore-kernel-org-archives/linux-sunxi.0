Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC93D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:36 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e25so12215574wrc.13
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NpYblgk0QSEipNVW12nK1FeMQGvN8soBnfpEkcmUf1I=;
        b=iAVKi4f8I7CLeg4ffvFzsvKkDzx2DfoiAbr47iYacvEU+s3bdgepP+twUMbdjqFjZN
         HP9GhewZ0kBzZGLj0hMJgiO7cc3Vd6E/UF8i8c0andQvvQgzYryRgJ2xWzPE8ISGsHKU
         3jAsd30KJ0Vgc2BjN5czd14edV+jCCHuBh/c8p0HdAHMup5HduI34U/Ox+duIKPJ+3ag
         kMTEimL4vWw+NINiHeamf6NkIE0VHr/u3/NsESG0RHXMSG5UD9ZPmUG7ASDj10MCe43O
         AkDOSBGlCU7xbJuDGODEpXltkmTY8pHt9UDDKC8kna2c/yvWdCAx6ck4c/uz1z2HYYQ6
         wUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NpYblgk0QSEipNVW12nK1FeMQGvN8soBnfpEkcmUf1I=;
        b=zAwklqB3SnI3YzRqw7cXmUs7sbdW4Yl1h2HQGipiDO865lvMzhRWgB7m72y+QXrPgF
         9qUnEolpM2ZqmxKEHQgNGNYLgXPGQD0OwU3qHf4PxlJRsIZg2Iw6/OI7xfyHDrLqUig7
         xom4TbcZF0JFDGS0upmskbtcL9yZWsNGa7PEJL9IPTNlX3/NvcPamHHJE/tFNZxdNN/H
         2MuwUO5qzrmIo6Miwd7XX/e7FbxfvXudc43PC5G/ab3P43TqAu1OTD39TVirDHfa/cF7
         U5WOvJgfqnSS9gYMfyHsq/xHVojiyDh5gfrwVLruMdNIm+l2ym4a+a83EEU3nIQXm87H
         wjFQ==
X-Gm-Message-State: AJIora8o+PYHm8Zn1pLzFPSmw6/LLczFruvZ9voxYtWO+MYuThfJgCz+
	3FJUIdiHuKj/waPS7o7t+Q4=
X-Google-Smtp-Source: AGRyM1uneR86manlptXeALcQUO9hJesML7Bpy1KKOUEomIro61DKoiDecYWOPz8k3Wd1mtwzsz07yA==
X-Received: by 2002:a05:6000:1052:b0:21b:927c:1559 with SMTP id c18-20020a056000105200b0021b927c1559mr4204605wrx.303.1655755595143;
        Mon, 20 Jun 2022 13:06:35 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id e16-20020adfdbd0000000b0021b91ec8f6esm2936708wrj.67.2022.06.20.13.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:34 -0700 (PDT)
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
Subject: [PATCH 13/49] regmap-irq: Remove unused type_invert flag
Date: Mon, 20 Jun 2022 21:06:08 +0100
Message-Id: <20220620200644.1961936-14-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No chip has ever required this flag except for the max77650 where
it didn't have any effect. Drop it. The code that checked for it
has already been removed.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 include/linux/regmap.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 1966ad4d0fa5..ee2567a0465c 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1466,7 +1466,6 @@ struct regmap_irq_sub_irq_map {
  * @ack_invert:  Inverted ack register: cleared bits for ack.
  * @clear_ack:  Use this to set 1 and 0 or vice-versa to clear interrupts.
  * @wake_invert: Inverted wake register: cleared bits are wake enabled.
- * @type_invert: Invert the type flags.
  * @type_in_mask: Use the mask registers for controlling irq type. For
  *                interrupts defining type_rising/falling_mask use mask_base
  *                for edge configuration and never update bits in type_base.
@@ -1520,7 +1519,6 @@ struct regmap_irq_chip {
 	bool clear_ack:1;
 	bool wake_invert:1;
 	bool runtime_pm:1;
-	bool type_invert:1;
 	bool type_in_mask:1;
 	bool clear_on_unmask:1;
 	bool not_fixed_stride:1;
-- 
2.35.1

