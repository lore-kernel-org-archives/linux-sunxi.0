Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036856472
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778331636; cv=none; b=KPBtUkQg/xKYV99KRBqI9ubCrwjEPM9q/JNdee3r5slmOirEgqz4C7OglLPjfsM2gK9NgvhZw3D8/NwsFIHNNh5GNlEZqnn8OEz04Wm6GgBD34BXBSwoNXb8jGkNb5gAL54NSswctekD8sD6JULx15ff4P2qy3AEwqvBV4iKcU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778331636; c=relaxed/simple;
	bh=B1Ds8r8GHGWBx++aRf0JywPTc8oRJZcsAR2eyRq7lnU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAoVhxHYOx9cWNmkmlkpHTUcCqIFc6yvKvOjju63jCSnPAun6b5JzGkR+JgAKWxRHwB3LOYP8H1MJE1uw2WyURvtMbOlqvWs5ad6hOIgAG9WFpgOqBSITkem7YqMqovA22T207icwsCd23MNfa6Pox6NkcGzux2jtp5YXnOMS+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpEcHJvi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpEcHJvi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so25737445e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778331631; x=1778936431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6OT+AHePGxzwfvQ45Ob6sxpwOIkH+2SDyW/P3F5OEk=;
        b=jpEcHJviykSdO2WJELvc86lY0feH7SLH6X4KcDprvZwlwzQFSdgJIoe0r0Fk6f5BOc
         8e3ggmeaAIECmJjrLbw3o4F+w+eIy7L3OIi8rkYzNVZpj9EUfXsqRiKAZJ83R7X7iBaj
         amiw2rjSPfh6Cv6dK6LTJVM50DVnsPsELMZXxD0MNflQSulMCID2ny1+6Pon4cdWw8Rm
         eUL3sat0R37g6TvCz5KjMaTQjogx9wBfCr5iLrMPS7Q2vefR2cCQ5Btlo1fHLsFUcv02
         c1VH/XJEt+FpBH+w1H7rwxRf3c4ihd18zU0BQnquexZ4ZIQ0Y35PHuP/dJMWUnqPuMyE
         YKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778331631; x=1778936431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z6OT+AHePGxzwfvQ45Ob6sxpwOIkH+2SDyW/P3F5OEk=;
        b=YSjBBWC1PaGQoIL+xZqJLutA5EBQbgqD5Yjh06d+NJteoDRERGRh1xDGLQS9mZqAH/
         h6Bl1RsDn3MKyzKre0sWOjr6KerD0N/VkfFOuc6xMV3Yfx4RvVROd+fcFLcQ1/9D2lUT
         rhc28CnIvvWEk/C0JHqFXAu4BP9Z0cJjYFUWyPwS4Ps/cpiPiywmHYMvMRIDqPHaxeB/
         KzycndDNBjG8il4kd3E44Sbb/dHqyY16DJBV/b4oxwQsJ7lJFnv7coOexHPRLZUAK7fE
         WLyoCOBwCJ48h3OvdOWyOP+M98E1/NpEAIOA7iiQlSjhQBFZ8TUhMmpTVnFj+V/mBC8R
         Zb9A==
X-Forwarded-Encrypted: i=1; AFNElJ8xgadm83tMVQ5e8YWfU/FXxl3qKdIiJPReG4gY3qpXctm9Z60EzZL+Wf/O3/18ph1IVWpoPzzcx2KvIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYW71UvRx3rQthNQ5bPhXmSD2x3U8zOcv+g/kNJKMTjsYG68hA
	s6wXY60F1HuNYWVTK2YEJSR5pGZhWFJ5RvRJWDwWhKYg+FkcRI1iiFDW
X-Gm-Gg: Acq92OEjMR9absPYbTP63NozeF6tmaQTUxQbGKVTb5Wo+FQllK73H4OyIhkiZrlKC4q
	Z8ZkgZBkPluGjEO51Y1msX5k8962J8swhvImF6t+GCR3SFcrbkAzCXCZfJNngPSKIVg8IAGG5sl
	NReIChTVgcYMPIKC1fyHZsYqQvEpz9+c7xbMHln6rk0Ytzr5TsMRDk0+9rl+s/VhyIouQ8oXEwt
	/I/qHSbLebbmCs0QWUJqL9TGnxLlobKMn9ySiirtafzO1l9gtCb5Z6bOZwOypPEdyI960OXT4z1
	sX+0cc42Ukj1vudyiA5wKWdUvSwOfotvHxU/xkIpRHuEHd+3DlBZ4HtIIVXJFf1aKUc9+lpTFaJ
	h8ThPMpwwcXCvbG+ZxaQkeKp+v81hOaXH1XLQL5uI1wrCMde2+hyoiQfQlbz1PYNQIdfOMrlGd7
	afbpntm7dRiZd8bjb8/myXp5yv4qvxQ+ERBgP0rzTyxeU9mmp6F7ZUBj4OEriZRpRxdeYJ3Iim/
	uMC2KtjdkiAvK2NQw==
X-Received: by 2002:a05:600c:354b:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-48e51f32a7amr259916605e9.17.1778331631212;
        Sat, 09 May 2026 06:00:31 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549130549bsm12104013f8f.18.2026.05.09.06.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 06:00:30 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:
 =?UTF-8?B?T25kxZllaiBKaXJtYW4gPG1lZ2lAeGZmLmN6PiwgSmVybmVqIMWga3JhYmVj?=
 <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] mfd: axp20x: Change volatile ranges on axp803
Date: Sat, 09 May 2026 15:00:29 +0200
Message-ID: <jyAUZJ-5S2y5bMIkjeKIeA@gmail.com>
In-Reply-To: <voxgbzeunk7doe64ej3eq22kgxw7y4x7wwqsm72t546qreonmi@ypnuw5esnddo>
References:
 <20260315124932.3669260-1-megi@xff.cz> <5084920.31r3eYUQgx@jernej-laptop>
 <voxgbzeunk7doe64ej3eq22kgxw7y4x7wwqsm72t546qreonmi@ypnuw5esnddo>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 21. marec 2026 ob 19:26:43 Srednjeevropski poletni =C4=8Das je =
Ond=C5=99ej Jirman napisal(a):
> On Sat, Mar 21, 2026 at 07:25:49AM +0100, Jernej =C5=A0krabec wrote:
> > Dne nedelja, 15. marec 2026 ob 13:49:31 Srednjeevropski standardni =C4=
=8Das je Ond=C5=99ej Jirman napisal(a):
> > > From: Ondrej Jirman <megi@xff.cz>
> > >=20
> > > Regulator control registers can be cached. They don't update by
> > > themselves. Enable cache on them, to speed up voltage changes,
> > > particularly DCDC2 which needs to be handled quickly due to being used
> > > for CPUX cores and is changed very frequently by some cpufreq schedul=
ers.
> >=20
> > That's not really the case, DCDC2-DCDC6 registers have DVM finished sta=
tus
> > bit, which is volatile and it is right to have them in volatile range.
> > However, it is true that other registers are non-volatile, so that rang=
e can
> > be considerably shrinked. It seems that AXP288 have same register layout
> > but I can't say for sure (I only found datasheet for AXP288C), so it's =
best
> > to leave it alone and apply changes only to AXP803.=20
>=20
> While true, it's not used by any kernel drivers, and having the whole reg=
ister
> marked volatile for a single unused bit is contributing 10s of % of perma=
nent
> CPU load just from cpufreq DVFS operations alone when using schedutil gov=
ernor,
> which is doing DVFS hundred or more times per second.
>=20
> If someone will want to use this bit in the regulator driver, they can us=
e eg.
> regmap_read_bypassed() to access the bit, while keepig the other parts of
> regulator implementation performant.

This sounds like a good compromise.

>=20
> But I guess it may deserve a comment in the code.

=46or sure.

BR Jernej

>=20
> Kind regards,
> 	o.
>=20
> > Best regards,
> > Jernej
> >=20
> > >=20
> > > This shrinks register access over RSB bus to one write per voltage
> > > change (down from 4 or so).
> > >=20
> > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > ---
> > >  drivers/mfd/axp20x.c | 28 +++++++++++++++++++++++++++-
> > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > > index 0d0d40972eb8..2ea409029d2f 100644
> > > --- a/drivers/mfd/axp20x.c
> > > +++ b/drivers/mfd/axp20x.c
> > > @@ -172,6 +172,18 @@ static const struct regmap_range axp288_volatile=
_ranges[] =3D {
> > >  	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
> > >  };
> > > =20
> > > +static const struct regmap_range axp803_volatile_ranges[] =3D {
> > > +	regmap_reg_range(AXP20X_PWR_INPUT_STATUS, AXP288_POWER_REASON),
> > > +	regmap_reg_range(AXP288_BC_GLOBAL, AXP288_BC_GLOBAL),
> > > +	regmap_reg_range(AXP288_BC_DET_STAT, AXP20X_VBUS_IPSOUT_MGMT),
> > > +	regmap_reg_range(AXP20X_CHRG_BAK_CTRL, AXP20X_CHRG_BAK_CTRL),
> > > +	regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IPSOUT_V_HIGH_L),
> > > +	regmap_reg_range(AXP20X_TIMER_CTRL, AXP20X_TIMER_CTRL),
> > > +	regmap_reg_range(AXP20X_GPIO1_CTRL, AXP22X_GPIO_STATE),
> > > +	regmap_reg_range(AXP288_RT_BATT_V_H, AXP288_RT_BATT_V_L),
> > > +	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
> > > +};
> > > +
> > >  static const struct regmap_access_table axp288_writeable_table =3D {
> > >  	.yes_ranges	=3D axp288_writeable_ranges,
> > >  	.n_yes_ranges	=3D ARRAY_SIZE(axp288_writeable_ranges),
> > > @@ -182,6 +194,11 @@ static const struct regmap_access_table axp288_v=
olatile_table =3D {
> > >  	.n_yes_ranges	=3D ARRAY_SIZE(axp288_volatile_ranges),
> > >  };
> > > =20
> > > +static const struct regmap_access_table axp803_volatile_table =3D {
> > > +	.yes_ranges	=3D axp803_volatile_ranges,
> > > +	.n_yes_ranges	=3D ARRAY_SIZE(axp803_volatile_ranges),
> > > +};
> > > +
> > >  static const struct regmap_range axp806_writeable_ranges[] =3D {
> > >  	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_DATACACHE(3)),
> > >  	regmap_reg_range(AXP806_PWR_OUT_CTRL1, AXP806_CLDO3_V_CTRL),
> > > @@ -456,6 +473,15 @@ static const struct regmap_config axp22x_regmap_=
config =3D {
> > >  	.cache_type	=3D REGCACHE_MAPLE,
> > >  };
> > > =20
> > > +static const struct regmap_config axp803_regmap_config =3D {
> > > +	.reg_bits	=3D 8,
> > > +	.val_bits	=3D 8,
> > > +	.wr_table	=3D &axp288_writeable_table,
> > > +	.volatile_table	=3D &axp803_volatile_table,
> > > +	.max_register	=3D AXP288_FG_TUNE5,
> > > +	.cache_type	=3D REGCACHE_MAPLE,
> > > +};
> > > +
> > >  static const struct regmap_config axp288_regmap_config =3D {
> > >  	.reg_bits	=3D 8,
> > >  	.val_bits	=3D 8,
> > > @@ -1368,7 +1394,7 @@ int axp20x_match_device(struct axp20x_dev *axp2=
0x)
> > >  	case AXP803_ID:
> > >  		axp20x->nr_cells =3D ARRAY_SIZE(axp803_cells);
> > >  		axp20x->cells =3D axp803_cells;
> > > -		axp20x->regmap_cfg =3D &axp288_regmap_config;
> > > +		axp20x->regmap_cfg =3D &axp803_regmap_config;
> > >  		axp20x->regmap_irq_chip =3D &axp803_regmap_irq_chip;
> > >  		break;
> > >  	case AXP806_ID:
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20




