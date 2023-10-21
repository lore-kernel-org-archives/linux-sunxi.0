Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4466A1C3A
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTfUMOR9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32d885e97e2so1065616f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 23:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697871071; x=1698475871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNbbxicLhmrQp2Ujgv6BQbhvDu442dRsiUErEzUy8GU=;
        b=WTfUMOR9RK031olM0fbp3ThEVKIsFmGW90x8SWRCPObTm1Ln1O9uIKCX82BNQUiPub
         /tIyhFao6mevyuTJAS3XVge+jUOLO5AA+RSaTT+qDUblQTI+/UV7c1RomLLIrxm3+O1r
         ZfnB6MeI6+/W/3eFV+NfpkxFF9pAsus2jzpjky2jYujQi9coXJHC2FG0dGFBS5ske4k6
         hExMnxYnfqIpT7i92/yIZhqqNF7KGLWQsvJ9r6CSuSfNgz1VXDEaHOid3VxMip5rOptL
         zuNVPLK7XNjJjL+5r4Tu8fT49eEYM0j4ZFRQPB8AazKC1Zrb4YtxSUduwn/si7P+eX5B
         tTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697871071; x=1698475871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNbbxicLhmrQp2Ujgv6BQbhvDu442dRsiUErEzUy8GU=;
        b=Nr/CBP9vPOXgsZGU0OG9ZubF6hXJQIFsY+FPZI0XlsKSdojPLsKc2mmfUK9tE1WQmY
         uHKamc/KX+5W0FqBUrvUerCtzFS/TEI1brP3EDGhe6VQh5nR/AVNx27UfvWTmH7PDQl0
         RKzqcYpoQysJxoAJjCcvy7dxbSJ38cZB+YBr4nIVAJ0vfvi+ejaEC1+tybwcSFPOLQqD
         XARuRo6rJakAfar28wZ5RIWC7PPs06v/lndyKg5pNfYIWXiNK5dYlpfw8T8PRsU2uBst
         wi2Aownl1Qms86GYMQ3FQwnX+CJ8eO/AQtNNDQzy//al86Qyr6XeCwkkzir4lHvRf9qx
         ZiUQ==
X-Gm-Message-State: AOJu0Ywloo6FD10YoYvNc3lG6pRIbxTz0Z0BthvB6p4RQG6Gjn9g1nUw
	yATWhR8JjEvtPRoT1dev/dPJRdjqA5gxtw==
X-Google-Smtp-Source: AGHT+IFvXFMXJpArVAiKAxq+174fGbLabxhRwXsBNNnCW9LMdYww78C1/Au0OBKvnsSaUFzdtG/I3g==
X-Received: by 2002:adf:ce0d:0:b0:32d:a469:a1b with SMTP id p13-20020adfce0d000000b0032da4690a1bmr3180073wrn.62.1697871071313;
        Fri, 20 Oct 2023 23:51:11 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d4587000000b0032db430fb9bsm3103146wrq.68.2023.10.20.23.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 23:51:11 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
 SASANO Takayoshi <uaa@mx5.nisiq.net>,
 Mikhail Kalashnikov <iuncuim@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] power: regulator: add AXP313 support
Date: Sat, 21 Oct 2023 08:51:09 +0200
Message-ID: <2168063.Mh6RI2rZIc@archlinux>
In-Reply-To: <20231018155014.383566-4-andre.przywara@arm.com>
References:
 <20231018155014.383566-1-andre.przywara@arm.com>
 <20231018155014.383566-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, October 18, 2023 5:50:14 PM CEST Andre Przywara wrote:
> The X-Powers AXP313a is a small PMIC with just three buck converters and
> three LDOs, one of which is actually fixed (so not modelled here).
> 
> Add the compatible string and the respective regulator ranges to allow
> drivers to adjust voltages.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/power/pmic/axp.c                |  1 +
>  drivers/power/regulator/axp_regulator.c | 17 +++++++++++++++++
>  include/axp_pmic.h                      |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/power/pmic/axp.c b/drivers/power/pmic/axp.c
> index 025dac24f28..0e1e45fba74 100644
> --- a/drivers/power/pmic/axp.c
> +++ b/drivers/power/pmic/axp.c
> @@ -87,6 +87,7 @@ static const struct udevice_id axp_pmic_ids[] = {
>  	{ .compatible = "x-powers,axp209", .data = AXP209_ID },
>  	{ .compatible = "x-powers,axp221", .data = AXP221_ID },
>  	{ .compatible = "x-powers,axp223", .data = AXP223_ID },
> +	{ .compatible = "x-powers,axp313a", .data = AXP313_ID },
>  	{ .compatible = "x-powers,axp803", .data = AXP803_ID },
>  	{ .compatible = "x-powers,axp806", .data = AXP806_ID },
>  	{ .compatible = "x-powers,axp809", .data = AXP809_ID },
> diff --git a/drivers/power/regulator/axp_regulator.c
> b/drivers/power/regulator/axp_regulator.c index 02f320eac1e..d27e09538e0
> 100644
> --- a/drivers/power/regulator/axp_regulator.c
> +++ b/drivers/power/regulator/axp_regulator.c
> @@ -173,6 +173,22 @@ static const struct axp_regulator_plat
> axp22x_regulators[] = { { }
>  };
> 
> +/*
> + * The "dcdc1" regulator has another range, beyond 1.54V up to 3.4V, in
> + * steps of 100mV. We cannot model this easily, but also don't need that,
> + * since it's typically only used for ~1.1V anyway, so just ignore it.

It can be modelled with look up table, as it's already done for some other 
regulators?

Best regards,
Jernej

> + * Also the DCDC3 regulator is described wrongly in the (available) manual,
> + * experiments show that the split point is at 1200mV, as for DCDC1/2. +
> */
> +static const struct axp_regulator_plat axp313_regulators[] = {
> +	{ "dcdc1", 0x10, BIT(0), 0x13, 0x7f,  500, 1540,  10, 70 },
> +	{ "dcdc2", 0x10, BIT(1), 0x14, 0x7f,  500, 1540,  10, 70 },
> +	{ "dcdc3", 0x10, BIT(2), 0x15, 0x7f,  500, 1840,  10, 70 },
> +	{ "aldo1", 0x10, BIT(3), 0x16, 0x1f,  500, 3500, 100, NA },
> +	{ "dldo1", 0x10, BIT(4), 0x17, 0x1f,  500, 3500, 100, NA },
> +	{ }
> +};
> +
>  static const struct axp_regulator_plat axp803_regulators[] = {
>  	{ "dcdc1", 0x10, BIT(0), 0x20, 0x1f, 1600, 3400, 100, NA },
>  	{ "dcdc2", 0x10, BIT(1), 0x21, 0x7f,  500, 1300,  10, 70 },
> @@ -274,6 +290,7 @@ static const struct axp_regulator_plat *const
> axp_regulators[] = { [AXP209_ID]	= axp20x_regulators,
>  	[AXP221_ID]	= axp22x_regulators,
>  	[AXP223_ID]	= axp22x_regulators,
> +	[AXP313_ID]	= axp313_regulators,
>  	[AXP803_ID]	= axp803_regulators,
>  	[AXP806_ID]	= axp806_regulators,
>  	[AXP809_ID]	= axp809_regulators,
> diff --git a/include/axp_pmic.h b/include/axp_pmic.h
> index 4ac64865831..aabafc8501b 100644
> --- a/include/axp_pmic.h
> +++ b/include/axp_pmic.h
> @@ -32,6 +32,7 @@ enum {
>  	AXP209_ID,
>  	AXP221_ID,
>  	AXP223_ID,
> +	AXP313_ID,
>  	AXP803_ID,
>  	AXP806_ID,
>  	AXP809_ID,




