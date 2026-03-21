Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CFF36EAA8
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Mar 2026 06:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774074359; cv=none; b=A47kDmNetGUCd8S79IE0shGIffLW2QeGwYmROaX9GGcooxFMGm+eS2FULUedBBEMBWo32tijGf29kCjdTVwm/hKH4Lz664Utnl6vax+9sY5BuLaNKeeLTg6LItdbu3S7Z7mxVvghOTaXf7/WKcdnTSs87AVjDKjgzifABV3ZAj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774074359; c=relaxed/simple;
	bh=hP9KjRTOx51/rsABzXdt4bE317SW3ZEjY//9LNjWJUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npAY6djd+iUmNmbpIsVcx5XE3+drCakAyoNSG3xC5R1BqsHdyFI1unoTmweLpp/045GOTaRm0TeWZRgVSvyy+yiSSAK3CEoNTNPtLE1Rlen+pT7QbOy3MBWz2TSokl7pXvkVKaB7ErEEc39Nnrx+Tbown7jOoTFUVJK4S3l8d6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5SqqHEp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5SqqHEp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so19292305e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Mar 2026 23:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774074355; x=1774679155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86rxJ6I1HclXmsMsUSngqWJ6Y7ZulHBC1Vt2o/znntU=;
        b=H5SqqHEpXrGuKXbblkq7zEKlCnugoabAo6gz414oFfjwRGXiOJPiC2vnRKvpjAUfl0
         srmQObvVm6dmY2quDHb6lSt66e38/nGLWd84BqHfd/nRO1xhwnmwAWHgJUiX4SOB5J2D
         G5YVqqNSf/93CMoEAax/ZDZ0bHOHsO7r72lIRykTWqM06eaOS/YB0S0kXLcPrEsJQxht
         PBHHCFAUPkUjxrfwyU9SBhLjo6uJA+3swPQgy6W7HQRQwFWvopxs+xbTjXedlB+jzvsM
         sjGqMn/tRwWFB5Bhno8CleUAqWibU9LMwWYopacSGLieO2hdM/i5kzteWALrvd+9Zo13
         0Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774074355; x=1774679155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86rxJ6I1HclXmsMsUSngqWJ6Y7ZulHBC1Vt2o/znntU=;
        b=o1WPZSWJ4HNM5Vq8Sc/CaaTITSwVwyvDQ+Q/UB0kGfLeCl0RMyj9t9yzXhtglkjBmd
         EOQBkQ7oVUs73Pdzl5igoDp6b5X3BoY/g2cdmZPSCDOWGLGAT9LAqjS+PKibHgSa55po
         bAYKcEALbjlzUhhg8ekqbOwI2O+WTE+TQbVaaaeIlXplhkDSeH7XZDa4ol4skZbRPXOI
         iAm8ZtUc+uaLQAQvQHCxJF6AcG7hSP09o3UbjunOawsn181Dixdybb+GE2Sj52b7T+s4
         rDfym6bD3+kqIFgZuyyQvo48uwOC2PBHssjKYBJ7MbTS0K+dcNPRS6c2h9bfCR/H2HkK
         SwHg==
X-Gm-Message-State: AOJu0YwGZPsK0KMl0FKsVtJGW6dhnUKDGIVOYzD6yv7h/4j8FOGQlb+1
	lZXeU5b0oij8DZ2jF6/Jnmv49xkDIMBdrGebkh+DqRm0pTHz7d2PRKHvVmlmSJX5
X-Gm-Gg: ATEYQzw63Xy3wDZeLZzD7z9SHErWFpCznGRtWNWz3rQtMsXMSXqFqhdIXWwMdWzEWAY
	9IOAkitiT6zymOxjh8oD9TqqrqnhpxtWC3kOK6Dh75Iu0vNBfsb6wUN9mtQgTeTDJ8yx23CeCJK
	ENSxZQYK2r3d2j4M/AlTcJFCH/XF2+x5YpnP7cLYIGXmCvzVLG15q2XZUv/ZPY743qOYNrZ568L
	+kWtATBErHh1d1P25vRDI5sZim5F3X2fqgpA7R8J2vmwl8AwKISzYIVeJx0lN9VvlKh8wMVWIXk
	lVGehgdCJNDiz1cXBea6r7zZDcO6P/aQFqLOz0ANakP+6Bb6g73bMSpgzdPvhgSGPEod4dKk9LV
	1GMmcvfjWNBPzN73YcglaX7YsIptbMT8MRHg6iM6I91SxRwbzDurgeXIvRCys/p3qwk6mo9cBUD
	+HRtpsw3cMKsyRnSF2RCZZRjct/lZAzp87P5IVzUxmTet+
X-Received: by 2002:a05:600c:8483:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-486fedc0070mr78285625e9.14.1774074354821;
        Fri, 20 Mar 2026 23:25:54 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487031790fdsm56551135e9.3.2026.03.20.23.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 23:25:54 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, =?UTF-8?B?T25kxZllag==?= Jirman <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] mfd: axp20x: Change volatile ranges on axp803
Date: Sat, 21 Mar 2026 07:25:49 +0100
Message-ID: <5084920.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260315124932.3669260-1-megi@xff.cz>
References: <20260315124932.3669260-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. marec 2026 ob 13:49:31 Srednjeevropski standardni =C4=8Das=
 je Ond=C5=99ej Jirman napisal(a):
> From: Ondrej Jirman <megi@xff.cz>
>=20
> Regulator control registers can be cached. They don't update by
> themselves. Enable cache on them, to speed up voltage changes,
> particularly DCDC2 which needs to be handled quickly due to being used
> for CPUX cores and is changed very frequently by some cpufreq schedulers.

That's not really the case, DCDC2-DCDC6 registers have DVM finished status
bit, which is volatile and it is right to have them in volatile range.
However, it is true that other registers are non-volatile, so that range can
be considerably shrinked. It seems that AXP288 have same register layout
but I can't say for sure (I only found datasheet for AXP288C), so it's best
to leave it alone and apply changes only to AXP803.=20

Best regards,
Jernej

>=20
> This shrinks register access over RSB bus to one write per voltage
> change (down from 4 or so).
>=20
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
>  drivers/mfd/axp20x.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 0d0d40972eb8..2ea409029d2f 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -172,6 +172,18 @@ static const struct regmap_range axp288_volatile_ran=
ges[] =3D {
>  	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
>  };
> =20
> +static const struct regmap_range axp803_volatile_ranges[] =3D {
> +	regmap_reg_range(AXP20X_PWR_INPUT_STATUS, AXP288_POWER_REASON),
> +	regmap_reg_range(AXP288_BC_GLOBAL, AXP288_BC_GLOBAL),
> +	regmap_reg_range(AXP288_BC_DET_STAT, AXP20X_VBUS_IPSOUT_MGMT),
> +	regmap_reg_range(AXP20X_CHRG_BAK_CTRL, AXP20X_CHRG_BAK_CTRL),
> +	regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IPSOUT_V_HIGH_L),
> +	regmap_reg_range(AXP20X_TIMER_CTRL, AXP20X_TIMER_CTRL),
> +	regmap_reg_range(AXP20X_GPIO1_CTRL, AXP22X_GPIO_STATE),
> +	regmap_reg_range(AXP288_RT_BATT_V_H, AXP288_RT_BATT_V_L),
> +	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
> +};
> +
>  static const struct regmap_access_table axp288_writeable_table =3D {
>  	.yes_ranges	=3D axp288_writeable_ranges,
>  	.n_yes_ranges	=3D ARRAY_SIZE(axp288_writeable_ranges),
> @@ -182,6 +194,11 @@ static const struct regmap_access_table axp288_volat=
ile_table =3D {
>  	.n_yes_ranges	=3D ARRAY_SIZE(axp288_volatile_ranges),
>  };
> =20
> +static const struct regmap_access_table axp803_volatile_table =3D {
> +	.yes_ranges	=3D axp803_volatile_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp803_volatile_ranges),
> +};
> +
>  static const struct regmap_range axp806_writeable_ranges[] =3D {
>  	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_DATACACHE(3)),
>  	regmap_reg_range(AXP806_PWR_OUT_CTRL1, AXP806_CLDO3_V_CTRL),
> @@ -456,6 +473,15 @@ static const struct regmap_config axp22x_regmap_conf=
ig =3D {
>  	.cache_type	=3D REGCACHE_MAPLE,
>  };
> =20
> +static const struct regmap_config axp803_regmap_config =3D {
> +	.reg_bits	=3D 8,
> +	.val_bits	=3D 8,
> +	.wr_table	=3D &axp288_writeable_table,
> +	.volatile_table	=3D &axp803_volatile_table,
> +	.max_register	=3D AXP288_FG_TUNE5,
> +	.cache_type	=3D REGCACHE_MAPLE,
> +};
> +
>  static const struct regmap_config axp288_regmap_config =3D {
>  	.reg_bits	=3D 8,
>  	.val_bits	=3D 8,
> @@ -1368,7 +1394,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  	case AXP803_ID:
>  		axp20x->nr_cells =3D ARRAY_SIZE(axp803_cells);
>  		axp20x->cells =3D axp803_cells;
> -		axp20x->regmap_cfg =3D &axp288_regmap_config;
> +		axp20x->regmap_cfg =3D &axp803_regmap_config;
>  		axp20x->regmap_irq_chip =3D &axp803_regmap_irq_chip;
>  		break;
>  	case AXP806_ID:
>=20




