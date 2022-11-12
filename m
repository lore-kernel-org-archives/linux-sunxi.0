Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFD8184E
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:32:48 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so6748657wmi.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=Lbz4g2YMYSuPD799i5WJED461h5UyiK8NmeMAuncHWI=;
        b=pLUuOI271qJDl6toNpbkD/sakufpMWz0Z1f6FUcNur+DNeXti+ouc0g2L8VvnDO8nQ
         uPgCPmENfqW+lVSkFzffR1WMnJkhDi3xx9CZlz+XVX3UyLX6IhimQ3tSyFK4q85V8vCM
         hpvfAT85kXOtJIJP49Dd87UrV33KnD3Q7AZkrJVmMAY+Gz5/vlbunaobuOv0PLbREMGj
         ABmR9C8h565egWw7Wn/X2J/QGfOn1yv1siwHC2xdn2Dif+8pNgPxiPCg8ohB2c4yu/8P
         uQZ7cw+hiDyOpvEob0yKHA/kfyZ7ntqsOp3zPQjpqYCQAcT+R19MEWtPqHY+U62ZyaSj
         D8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lbz4g2YMYSuPD799i5WJED461h5UyiK8NmeMAuncHWI=;
        b=pmHV5h7RZwJnXf/QLv3vi2P98V+zh3pmE/8FjD5o/6Jihf3HDu/fgAkYR3G1k+g8/x
         MO+TbHU9v6mKxopI1Jw7cgLZEytCNmjrANDTlRkpId98cC3bk4mUmQwqW03A+rZWaMeo
         cgs34hCEl3garEbzaXkprpReyv05/z3Y7Zb/+DHlQr0wPhXmS11R5qoottW0DDy88Fw1
         1Bxy7PxmmBUJXk89OnM6nvdH2cszJwodAkp84rIkX69TZNKPAzoYt5XdlwqLceXiTu3o
         HjRm09zyj07nNjQclPYGRyN8S/HrD8HvkwQqv9jpFKgb3xrFLDLgedjlqdGKiKfE/paM
         iUBA==
X-Gm-Message-State: ANoB5pk/Td09jb/qB0lUN9R/GRGtIgeaR/YzGROFKA8gM91q8/pLHeDi
	JHF8ijPdWHTwfpnVfWs3KpA=
X-Google-Smtp-Source: AA0mqf52EnHFOEUA2r77lvJdUiGNdzE6jW6sJtL+eE1gnyV9rLtfZCgkbIORYBL8FsiWF1jou2n/7Q==
X-Received: by 2002:a05:600c:448a:b0:3cf:894b:fe6a with SMTP id e10-20020a05600c448a00b003cf894bfe6amr4213547wmo.198.1668267166645;
        Sat, 12 Nov 2022 07:32:46 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id r11-20020a5d694b000000b0023691d62cffsm4563556wrw.70.2022.11.12.07.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:32:46 -0800 (PST)
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-19-aidanmacdonald.0x0@gmail.com>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lee@kernel.org
Cc: mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
 tharvey@gateworks.com, cw00.choi@samsung.com,
 krzysztof.kozlowski@linaro.org, brgl@bgdev.pl, mazziesaccount@gmail.com,
 orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 18/18] mfd: wcd934x: Convert irq chip to config regs
Date: Sat, 12 Nov 2022 15:31:14 +0000
In-reply-to: <20221112151835.39059-19-aidanmacdonald.0x0@gmail.com>
Message-ID: <UBSpHjAymEtEPXHSLtDdpGuf2PsKck57@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


> Type registers are deprecated and will eventually be removed from
> regmap-irq. The same functionality can be replicated with config
> registers.
>
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/wcd934x.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Forgot to include this here:--

One issue with WCD934x - after applying the patch, a bug in regmap-irq
will cause a null pointer deref when setting the IRQ type, but a fix is
already in the regmap tree.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?id=84498d1fb35de6ab71bdfdb6270a464fb4a0951b

> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> index 68e2fa2fda99..07e884087f2c 100644
> --- a/drivers/mfd/wcd934x.c
> +++ b/drivers/mfd/wcd934x.c
> @@ -55,17 +55,22 @@ static const struct regmap_irq wcd934x_irqs[] = {
>  	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_SOUNDWIRE, 2, BIT(4)),
>  };
>
> +static const unsigned int wcd934x_config_regs[] = {
> +	WCD934X_INTR_LEVEL0,
> +};
> +
>  static const struct regmap_irq_chip wcd934x_regmap_irq_chip = {
>  	.name = "wcd934x_irq",
>  	.status_base = WCD934X_INTR_PIN1_STATUS0,
>  	.mask_base = WCD934X_INTR_PIN1_MASK0,
>  	.ack_base = WCD934X_INTR_PIN1_CLEAR0,
> -	.type_base = WCD934X_INTR_LEVEL0,
> -	.num_type_reg = 4,
> -	.type_in_mask = false,
>  	.num_regs = 4,
>  	.irqs = wcd934x_irqs,
>  	.num_irqs = ARRAY_SIZE(wcd934x_irqs),
> +	.config_base = wcd934x_config_regs,
> +	.num_config_bases = ARRAY_SIZE(wcd934x_config_regs),
> +	.num_config_regs = 4,
> +	.set_type_config = regmap_irq_set_type_config_simple,
>  };
>
>  static bool wcd934x_is_volatile_register(struct device *dev, unsigned int reg)
