Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E762DF49
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 20:28:14 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-52c9f1bd05dso4313667a12.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Sep 2023 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693945693; x=1694550493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkISZcLaqCZxGzyRWxa4TPreNR4hA2Z9elkk0qMjrxE=;
        b=JoHI1N3cqG/fmdZTT7D8hK0o76FQG39X9OjxMd73Jhz7ofkRGvYddCSltWANknVvfw
         68SeVF2wUhCDVahPlMQDx/35Vv821aewtvEBGjgPHUSigeWhXq0Ek6VypDXYPYIdDe7F
         ELVd1L+VX5lTV4kZcVNi6nJ6fwV3xCkzXNrQtqcW4z1wE0FqtT7O0/Ys0RA2rZ2X4eif
         z/paB64BcTkO0WbLuM0KSuKK4lULO3PvevkzkDZX6F2zbH7t1rJw+1Xw0V119ldL7SGW
         I4IVx0YfU9Jnq6uhGJKLkpJSQ60y6+HDZa/unvGmUChrtjIxYcT8EYdE2wRg64hkMpzQ
         KBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945693; x=1694550493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkISZcLaqCZxGzyRWxa4TPreNR4hA2Z9elkk0qMjrxE=;
        b=S1LWfXa/rQtxFGTAGEPPv0ZLlXMJ5bSon3OEOau37PNzGM6VQpvmGm9bETZG59rd8e
         sGiYeVnuPgKJtTn5pUMb54SiYIbGoI31tfCwyopzcZbJv6nEBwwwYtxG1V2x2m6vmALR
         fgB0CN0rhp2zJ7O15GYIPeE/whXaY+drxbszjuW5TrFEmL75SVQFNvvOZ9mYj3REM7nU
         sKq7s8DBBAHHxWKlnTkKM+CtU+8311aOW1w9ohYkUXBcHUm7dG+w9XaiSX23enwS1zHX
         anxiZBxZn4rD4zLs8hr4GyiZebD8RNge7xs3HXdR4vvHel748elHFE3gLpLy02qYggaJ
         VEuw==
X-Gm-Message-State: AOJu0YwiPC8W1vjzEYRatj5GaH6FSlQ3rs28YhpPBUoMJLM50bIQ+ZZs
	4GxmjYka75fnR5u8TmB8Jr0FeX7wCVZmjw==
X-Google-Smtp-Source: AGHT+IF6SkBZrkt0MfXD24vq4uHSo5D0n0KrmybaRHQvRXQPwmcPTT2wuzyZqxKNPWedoaADhqDccQ==
X-Received: by 2002:a17:906:3153:b0:992:7295:61c9 with SMTP id e19-20020a170906315300b00992729561c9mr695139eje.69.1693945692504;
        Tue, 05 Sep 2023 13:28:12 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id j26-20020a1709064b5a00b00988be3c1d87sm8061384ejv.116.2023.09.05.13.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:28:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shengyu Qu <wiagn233@outlook.com>, Martin Botka <martin.botka1@gmail.com>,
 Matthew Croughan <matthew.croughan@nix.how>
Subject: Re: [PATCH v2] mfd: axp20x: Generalise handling without interrupt
Date: Tue, 05 Sep 2023 22:28:10 +0200
Message-ID: <22003475.EfDdHjke4D@archlinux>
In-Reply-To: <20230828213229.20332-1-andre.przywara@arm.com>
References: <20230828213229.20332-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 28, 2023 11:32:29 PM CEST Andre Przywara wrote:
> At the moment we allow the AXP15060 and the AXP806 PMICs to omit the
> interrupt line to the SoC, and we skip registering the PEK (power key)
> driver in this case, since that crashes when no IRQ is described in the
> DT node.
> The IRQ pin potentially not being connected to anything does affect more
> PMICs, though, and the PEK driver is not the only one requiring an
> interrupt: at least the AC power supply driver crashes in a similar
> fashion.
> 
> Generalise the handling of AXP MFD devices when the platform tables
> describe no interrupt, by allowing each device to specify an alternative
> MFD list for this case. If no specific alternative is specified, we go
> with the safe default of "just the regulators", which matches the current
> situation.
> 
> This enables new devices using the AXP313a PMIC, but not connecting the
> IRQ pin.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Changelog v2 .. v1:
> - drop reordering approach, use separate cell lists
> 
>  drivers/mfd/axp20x.c | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index c03bc5cda080a..239e7f18956ae 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1133,6 +1133,8 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  	struct device *dev = axp20x->dev;
>  	const struct acpi_device_id *acpi_id;
>  	const struct of_device_id *of_id;
> +	const struct mfd_cell *cells_no_irq = NULL;
> +	int nr_cells_no_irq = 0;
> 
>  	if (dev->of_node) {
>  		of_id = of_match_device(dev->driver->of_match_table, 
dev);
> @@ -1207,14 +1209,15 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		 * if there is no interrupt line.
>  		 */
>  		if (of_property_read_bool(axp20x->dev->of_node,
> -					  "x-powers,self-
working-mode") &&
> -		    axp20x->irq > 0) {
> +					  "x-powers,self-
working-mode")) {
>  			axp20x->nr_cells = 
ARRAY_SIZE(axp806_self_working_cells);
>  			axp20x->cells = axp806_self_working_cells;
>  		} else {
>  			axp20x->nr_cells = ARRAY_SIZE(axp806_cells);
>  			axp20x->cells = axp806_cells;
>  		}
> +		nr_cells_no_irq = ARRAY_SIZE(axp806_cells);
> +		cells_no_irq = axp806_cells;
>  		axp20x->regmap_cfg = &axp806_regmap_config;
>  		axp20x->regmap_irq_chip = &axp806_regmap_irq_chip;
>  		break;
> @@ -1238,24 +1241,8 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		axp20x->regmap_irq_chip = &axp803_regmap_irq_chip;
>  		break;
>  	case AXP15060_ID:
> -		/*
> -		 * Don't register the power key part if there is no 
interrupt
> -		 * line.
> -		 *
> -		 * Since most use cases of AXP PMICs are Allwinner 
SOCs, board
> -		 * designers follow Allwinner's reference design and 
connects
> -		 * IRQ line to SOC, there's no need for those variants 
to deal
> -		 * with cases that IRQ isn't connected. However, 
AXP15660 is
> -		 * used by some other vendors' SOCs that didn't connect 
IRQ
> -		 * line, we need to deal with this case.
> -		 */
> -		if (axp20x->irq > 0) {
> -			axp20x->nr_cells = 
ARRAY_SIZE(axp15060_cells);
> -			axp20x->cells = axp15060_cells;
> -		} else {
> -			axp20x->nr_cells = 
ARRAY_SIZE(axp_regulator_only_cells);
> -			axp20x->cells = axp_regulator_only_cells;
> -		}
> +		axp20x->nr_cells = ARRAY_SIZE(axp15060_cells);
> +		axp20x->cells = axp15060_cells;
>  		axp20x->regmap_cfg = &axp15060_regmap_config;
>  		axp20x->regmap_irq_chip = &axp15060_regmap_irq_chip;
>  		break;
> @@ -1263,6 +1250,23 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		dev_err(dev, "unsupported AXP20X ID %lu\n", axp20x-
>variant);
>  		return -EINVAL;
>  	}
> +
> +	/*
> +	 * Use an alternative cell array when no interrupt line is 
connected,
> +	 * since IRQs are required by some drivers.
> +	 * The default is the safe "regulator-only", as this works fine 
without
> +	 * an interrupt specified.
> +	 */
> +	if (axp20x->irq <= 0) {
> +		if (cells_no_irq) {
> +			axp20x->nr_cells = nr_cells_no_irq;
> +			axp20x->cells = cells_no_irq;
> +		} else {
> +			axp20x->nr_cells = 
ARRAY_SIZE(axp_regulator_only_cells);
> +			axp20x->cells = axp_regulator_only_cells;

axp806_cells (old value for AXP806_ID without irq) and 
axp_regulator_only_cells differs in id field. Is that an issue?

Best regards,
Jernej

> +		}
> +	}
> +
>  	dev_info(dev, "AXP20x variant %s found\n",
>  		 axp20x_model_names[axp20x->variant]);




