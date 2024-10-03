Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847091A0BDB
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Oct 2024 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727968878; cv=none; b=ijhWimcm5QVU9IyKx12GH8v08ix1YY+5oeKQPD+ks1jrNya3s+Rhwa7hS199spzgbGckj5bg4T7WyguNfa2YB56BWn/3AWwCTxgU9sQOvZH87iL94R8s5SInQDpss/g3NmrEKPDkXBmeYQ8og3Ri/KiRslFPAjuVNg1JGZGzcHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727968878; c=relaxed/simple;
	bh=DDQ+PSlc/KTYGIbHad+/LM11N1DWg4popkbpIAz8l/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTFgik1tsdeO6nh0G/JOqT3FIUo6XWEG0T839cZhslvC4U9bLsEvOgk3KXIPazDi8dU8YViqY9c4zrccZltOwMdyG/3KSsCpw09usZYx9ADYQFzLBvjGcuXQRnFEnpO9xY9syTIPlc6XEHT5mILFy9sQ0E/RT/hhJL/7ikaDTyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398a26b64fso1117768e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727968874; x=1728573674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PS0oK8lHaTH+dL4v+mceS/ll5BSP4UtwYbCaVuDE/9E=;
        b=bg6sDONZpRt1O8lf5bO1PajTB/q1Iftvnp4UXqGtkn9pMEFa6QHXmalpMllzaNLIPg
         5B1D0sy/x7ptsl/zeDAoX5BTrXTJtRYX9g5pajRVDc3kpbS3oGkvUuLFXRGwSf5oM9KA
         gLTSUyPjjalVyQVLvMu8AUjGE863Y5DlfNMoJK2w1lT+m7hO06+aj0LxiBlXCvaBA4wd
         iJKAEV0xr3il3GWvA+S4GqyKvo2F2wDaaem1H6VCE636wga+vLMDgQBLfFD6ViMjmJ8m
         agF9f3b9tExZxwEc9R7gL8uSW3EpB+CbVjTDPvcnZ4RMjBYGUqeso1xA8gjR4u1UdvtD
         Ae/A==
X-Forwarded-Encrypted: i=1; AJvYcCWknu149mF9XtaiR9KzcPZ+MynyMvSCcmuYX52FlgFdSSC5JYzOCy6QCjFCkabFl/fMkXdfnAxMuFIf/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyW1P7ivev2djNINexggxWxIG+VlHB+l33fnQTfI0qepkBK4slH
	Oe/SAahgjyd+RDtnqcQI6n/NYwK+NqOH/hUomTqoYBffnsYbfEjh6nOZDXMyiTs=
X-Google-Smtp-Source: AGHT+IHWCM3FBxK2FuWMwB9SMunX6bgfy21Q9xKrxiE/iQ1zqjr2VBBusYVRQvX3PP0GNsmJFiMHaw==
X-Received: by 2002:a05:6512:138b:b0:536:a50a:3c25 with SMTP id 2adb3069b0e04-539a065c529mr4496571e87.12.1727968873267;
        Thu, 03 Oct 2024 08:21:13 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82ab327sm202458e87.256.2024.10.03.08.21.13
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 08:21:13 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2facf40737eso14271571fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:21:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXazfoWgfKfRkQK6ShWvdCzRF725n6RfrCKeDIC3EqsrWXqWdaTyJv3wsQW+yZRBwrTzRzYWLfjNNyU0w==@lists.linux.dev
X-Received: by 2002:a05:651c:2225:b0:2fa:d723:efba with SMTP id
 38308e7fff4ca-2fae1024579mr48127331fa.8.1727968872256; Thu, 03 Oct 2024
 08:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241003111444.543964-1-andre.przywara@arm.com> <20241003111444.543964-5-andre.przywara@arm.com>
In-Reply-To: <20241003111444.543964-5-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 3 Oct 2024 23:20:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v64jPk64Y-Aef1YPWkjCfp0eq6EasE2xszu8+WoX+Epv-A@mail.gmail.com>
Message-ID: <CAGb2v64jPk64Y-Aef1YPWkjCfp0eq6EasE2xszu8+WoX+Epv-A@mail.gmail.com>
Subject: Re: [PATCH 4/5] mfd: axp20x: Add support for AXP323
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Martin Botka <martin.botka@somainline.org>, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 7:15=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> The X-Powers AXP323 is a very close sibling of the AXP313A. The only
> difference seems to be the ability to dual-phase the first two DC/DC
> converter, which adds another register.
>
> Add the required boilerplate to introduce a new PMIC to the AXP MFD
> driver. Where possible, this just maps into the existing structs defined
> for the AXP313A, only deviating where needed.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mfd/axp20x-i2c.c   |  1 +
>  drivers/mfd/axp20x.c       | 26 ++++++++++++++++++++++++++
>  include/linux/mfd/axp20x.h |  2 ++
>  3 files changed, 29 insertions(+)
>
> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> index 791a0b4cb64b..5c93136f977e 100644
> --- a/drivers/mfd/axp20x-i2c.c
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -65,6 +65,7 @@ static const struct of_device_id axp20x_i2c_of_match[] =
=3D {
>         { .compatible =3D "x-powers,axp221", .data =3D (void *)AXP221_ID =
},
>         { .compatible =3D "x-powers,axp223", .data =3D (void *)AXP223_ID =
},
>         { .compatible =3D "x-powers,axp313a", .data =3D (void *)AXP313A_I=
D },
> +       { .compatible =3D "x-powers,axp323", .data =3D (void *)AXP323_ID =
},
>         { .compatible =3D "x-powers,axp717", .data =3D (void *)AXP717_ID =
},
>         { .compatible =3D "x-powers,axp803", .data =3D (void *)AXP803_ID =
},
>         { .compatible =3D "x-powers,axp806", .data =3D (void *)AXP806_ID =
},
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index bc08ae433260..8d90962b56d9 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -42,6 +42,7 @@ static const char * const axp20x_model_names[] =3D {
>         [AXP223_ID] =3D "AXP223",
>         [AXP288_ID] =3D "AXP288",
>         [AXP313A_ID] =3D "AXP313a",
> +       [AXP323_ID] =3D "AXP323",
>         [AXP717_ID] =3D "AXP717",
>         [AXP803_ID] =3D "AXP803",
>         [AXP806_ID] =3D "AXP806",
> @@ -193,6 +194,10 @@ static const struct regmap_range axp313a_writeable_r=
anges[] =3D {
>         regmap_reg_range(AXP313A_ON_INDICATE, AXP313A_IRQ_STATE),
>  };
>
> +static const struct regmap_range axp323_writeable_ranges[] =3D {
> +       regmap_reg_range(AXP313A_ON_INDICATE, AXP323_DCDC_MODE_CTRL2),
> +};
> +
>  static const struct regmap_range axp313a_volatile_ranges[] =3D {
>         regmap_reg_range(AXP313A_SHUTDOWN_CTRL, AXP313A_SHUTDOWN_CTRL),
>         regmap_reg_range(AXP313A_IRQ_STATE, AXP313A_IRQ_STATE),
> @@ -203,6 +208,11 @@ static const struct regmap_access_table axp313a_writ=
eable_table =3D {
>         .n_yes_ranges =3D ARRAY_SIZE(axp313a_writeable_ranges),
>  };
>
> +static const struct regmap_access_table axp323_writeable_table =3D {
> +       .yes_ranges =3D axp323_writeable_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(axp323_writeable_ranges),
> +};
> +
>  static const struct regmap_access_table axp313a_volatile_table =3D {
>         .yes_ranges =3D axp313a_volatile_ranges,
>         .n_yes_ranges =3D ARRAY_SIZE(axp313a_volatile_ranges),
> @@ -433,6 +443,15 @@ static const struct regmap_config axp313a_regmap_con=
fig =3D {
>         .cache_type =3D REGCACHE_MAPLE,
>  };
>
> +static const struct regmap_config axp323_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .wr_table =3D &axp323_writeable_table,
> +       .volatile_table =3D &axp313a_volatile_table,
> +       .max_register =3D AXP323_DCDC_MODE_CTRL2,
> +       .cache_type =3D REGCACHE_RBTREE,

Maple tree instead?

The rest looks fine, so once fixed,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> +};
> +
>  static const struct regmap_config axp717_regmap_config =3D {
>         .reg_bits =3D 8,
>         .val_bits =3D 8,
> @@ -1221,6 +1240,7 @@ static int axp20x_power_off(struct sys_off_data *da=
ta)
>         unsigned int shutdown_reg;
>
>         switch (axp20x->variant) {
> +       case AXP323_ID:
>         case AXP313A_ID:
>                 shutdown_reg =3D AXP313A_SHUTDOWN_CTRL;
>                 break;
> @@ -1289,6 +1309,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>                 axp20x->regmap_cfg =3D &axp313a_regmap_config;
>                 axp20x->regmap_irq_chip =3D &axp313a_regmap_irq_chip;
>                 break;
> +       case AXP323_ID:
> +               axp20x->nr_cells =3D ARRAY_SIZE(axp313a_cells);
> +               axp20x->cells =3D axp313a_cells;
> +               axp20x->regmap_cfg =3D &axp323_regmap_config;
> +               axp20x->regmap_irq_chip =3D &axp313a_regmap_irq_chip;
> +               break;
>         case AXP717_ID:
>                 axp20x->nr_cells =3D ARRAY_SIZE(axp717_cells);
>                 axp20x->cells =3D axp717_cells;
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 79ecaaaa2070..c3df0e615fbf 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -19,6 +19,7 @@ enum axp20x_variants {
>         AXP223_ID,
>         AXP288_ID,
>         AXP313A_ID,
> +       AXP323_ID,
>         AXP717_ID,
>         AXP803_ID,
>         AXP806_ID,
> @@ -113,6 +114,7 @@ enum axp20x_variants {
>  #define AXP313A_SHUTDOWN_CTRL          0x1a
>  #define AXP313A_IRQ_EN                 0x20
>  #define AXP313A_IRQ_STATE              0x21
> +#define AXP323_DCDC_MODE_CTRL2         0x22
>
>  #define AXP717_ON_INDICATE             0x00
>  #define AXP717_PMU_STATUS_2            0x01
> --
> 2.25.1
>
