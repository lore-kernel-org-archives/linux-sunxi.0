Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADD1858
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:53 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id k8so10076811wrh.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vv/3HAucSDWmO8xwnh5HST4ssDGqCVQOTNcS90+6lU=;
        b=jpc9tN4KxBsfE2iBF/Kx5UM/PYB3RbWC0UUz8Pk77cr5NPWSGRNhLeCxpFdjsx6q0O
         o6n/eE8O5Whvr3WT+nUgB11/duZcUld4r/ERwLQLRKqmjHhEMP/znOH3x9ZRZ+3Sadyd
         DC09KWR7sCa7JNG+1duiRePnGOp4KbHUUVn4J+ttGNAODo2Cx3fOjbUSRBTBOGLu2Ym8
         6CWoYnn2kIsKd8U3/Yc60PH/zfe8I37piGYwWMbdm4FHS8y3D1z4gTKp9XShRQ211dEV
         QdEhxpfjBzjvu01ECYnHIZutt3SX38/KsAtylLD7FF2JiSlOOE1JEWLkiyMP1Z7JA/tC
         pL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vv/3HAucSDWmO8xwnh5HST4ssDGqCVQOTNcS90+6lU=;
        b=VUl7pNrctToaHaXexxPWI82kfGFBQnfeDXnVG688YSbj1wNIuaRxCOKII6srBFGf7y
         0a1RURjwZJChpuZkdc2m/XxUJErputlIKo7MCQXhGBm1WNj8i5FiqWugSpl+xS0AZjFV
         DXCmcXc0LjDJgZUIWgeQCvWFO6CCaRh0B5Md2Po++i3q0OfVgSDFKHo2WJ6qVwgldkPM
         knW2+V/J1e2C0DeRBASUiNReYGSF7HB6l9ZZkz142Jz5kYNLpl08jBvEeOnwZ0nYx+EO
         iOMSDhkraNr/CWXGmEtljnYGk3VPluMuzddrnYltxA09Gjbc4dmfMsxomO67ZNMR5zPL
         QyVw==
X-Gm-Message-State: ANoB5pnowsVbDcRQz/5fKNCakCA8ObdgvLbwqVXIGv906N726FxZiH3e
	E+uwO2O+AJauMg9CjhnBAYo=
X-Google-Smtp-Source: AA0mqf7yAFmkuF+GLTArtuzehjKb8KYcTqN5tQ+tXMTr65DKOBI2+7yP5rAXKMF4CkvvCod+EvEh5Q==
X-Received: by 2002:a05:6000:511:b0:236:64ce:2c0a with SMTP id a17-20020a056000051100b0023664ce2c0amr3671606wrf.230.1668266392072;
        Sat, 12 Nov 2022 07:19:52 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id h5-20020a1ccc05000000b003cf7292c553sm6509053wmb.13.2022.11.12.07.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:51 -0800 (PST)
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
Subject: [PATCH 16/18] mfd: sun4i-gpadc: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:33 +0000
Message-Id: <20221112151835.39059-17-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/sun4i-gpadc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/sun4i-gpadc.c b/drivers/mfd/sun4i-gpadc.c
index cfe14d9bf6dc..edc180d83a4b 100644
--- a/drivers/mfd/sun4i-gpadc.c
+++ b/drivers/mfd/sun4i-gpadc.c
@@ -34,9 +34,8 @@ static const struct regmap_irq_chip sun4i_gpadc_regmap_irq_chip = {
 	.name = "sun4i_gpadc_irq_chip",
 	.status_base = SUN4I_GPADC_INT_FIFOS,
 	.ack_base = SUN4I_GPADC_INT_FIFOS,
-	.mask_base = SUN4I_GPADC_INT_FIFOC,
+	.unmask_base = SUN4I_GPADC_INT_FIFOC,
 	.init_ack_masked = true,
-	.mask_invert = true,
 	.irqs = sun4i_gpadc_regmap_irq,
 	.num_irqs = ARRAY_SIZE(sun4i_gpadc_regmap_irq),
 	.num_regs = 1,
-- 
2.38.1

