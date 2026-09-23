Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E1486629
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162609; cv=pass; b=rasaQBEP6Qp/dAbXgZwYYhMLcreia7fGDUHax+97EUsIeymTDfZq+m81rG4DpArv96wcke9n2BSKJoihtHRtny9BQ+4QuDXGF3hX4EPlUKkVmVz5OhFXeRCWOSRsGWlgnJQzmj8SSdWs3xAS/2FYj922FkbyTTvmSxKoHxobPeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162609; c=relaxed/simple;
	bh=XhxSI0UVdEQV9nwQDMNyEd97c+q+OPCqI1wpOJhsgB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmlCyZgjvyINzkif3h2oox3vr6jUDi1zUt4wSQItdOslhhJ1PNk1KxkDgvcq21eP6sfN4ClnfFuNOvVJ73jFlMwVBA1eACR2vPwOytFWHIlqRwIgvmFh0gXw43MT+EE8Di8IFmBLwja5k01+amO6WeiHDajViOnCdNPUZAWPeRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmjTBxYv; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmjTBxYv"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104649a5dcso8446676d6.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162606; cv=none;
        d=google.com; s=arc-20260327;
        b=Vc3Uo2pv9DPi5SPbbkExodBXGgCBt21mmHJjHxebNqBwJPDL3+CFRX5QuK7bfaIiYq
         5wfGjekVCredi+TfZkIySxFZwFcOO70tT7PhR9Wk+SShL5AtD7xGxDeLVnYNs46OswqN
         xFCd6ru2dQxFio5yTxNC37srALjoR8ptpYETE8jf9RjVKwXGv0d8cBwGNZuWqSJyl96h
         n5jn01ebjmHq/kssP27aa2gPkHczAEMXSYfQcSF+hC3vlOi0p/iU73M74HuWAczEREj8
         Qeu4VhIUd8RELF9RB5ko2pFaM/4XKlIGMuRhuz0rg6/kO4eLNvS1VG3qL94L2Bq2a3A8
         CIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bN6kbYIJdb6YSfYW9P/+epswRe2d9jKi28WuqxpTfyQ=;
        fh=jw+MrsKXVKKFkE9i3hPcBKjS70lxrMq2i+if+dSExkY=;
        b=MX9vdzqyBmB2ZaqnuyoN3uJ9Z1vpVJ+CakiIGyGMOBHk8qAJzORE1DojOqfx2N+ZIk
         8CaUny6BA3U9oXvbjnf8+ewAErQ86p+VMOHa3GrZkKpLbUgKRlyHwF2e1qilrc8x3G+K
         KwXOmlP60Swn5SOvVcE3q1qmHt8ANszq/rvDjcNpqFaGER9EkOwii+2EpRsYPCrpz1x/
         6+bfQXAoJVczbcBQZx4zTVmLI34WG+RPw1Ns2wmKAA+s25CiAj+TH3hT7mJBNb/KuHT1
         1mDBTMsss6LkPuCkPtMf8p3QKwU+ItI6ppU4aT40E+jYAfLBH0OJISDBRJrt6LYKYRQa
         /L1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162606; x=1790767406; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bN6kbYIJdb6YSfYW9P/+epswRe2d9jKi28WuqxpTfyQ=;
        b=SmjTBxYvxb0pdYfoLC6IuTaf2y4dqDjK9ZCu/xBrYsvTg3GjmdGkGN9KGjrdsI2vHP
         KbrByBzNcar1Y5foVmf5R2ccU8c5gsAMEzDmgf0LLm5LXeIinblWCBQujJvcrnUOqm0v
         bETECDLpjDME/4AghY+ZwREH1CsZjmtAmfLOw5Wlpue8pUqODG3UDCFIr+ZQHmBD4Z4m
         8gcLX7CsA1RW/7rXX5eo7TmMTSABB/gpOIAYqKzj46PzI6xVBnvOQPbVD7rQObqkxTmK
         ofDe9f+2lzSxgg5cIE2yvoMA4Ja/LS2uokCPUHwsyqS08Vnp1IDPE6bo4X2/xc9Ba8Q8
         PxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162606; x=1790767406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bN6kbYIJdb6YSfYW9P/+epswRe2d9jKi28WuqxpTfyQ=;
        b=NWwDRmQLvsagvT9M2Yo4o7To2dx/EQFPCZzOBFfoLj0a47hAxdc40bq8hWDNOhoVn/
         XPrlbVH6rrzJTv7hUj2+D2UbKa/pdobzz3DVlqu1XI4f6rTqwwRLpLhVeKYnW6Mk+Xi1
         iIPaZre+aRR8FR6FjeLgLdDHfcBefk8dMuzgvVd/ZQfB3HvfqqrvJmfVyeBFuYEwpb4w
         aoHD+KHKcW2C08Vsg7yQw+4mj/cjkYPm0sVyYYfQlv7u08SatDwLo+TISPq3igTqvw7N
         5Z38cj9Lu8b/Yi0fjKP1qn1Xr9ewiAAZBSjcpDuDH6LXn+jKgyKuoX1m8zoNU4G7fw5V
         zZYg==
X-Forwarded-Encrypted: i=1; AKwUvBwfZC3hpc7fdpmmUNY31CGUfX5kGH8FFz+PK5TBkKUzJmq9TAFYPhH9uTtWBLwzjb5hFb/lSWa7ZNd70Q==@lists.linux.dev
X-Gm-Message-State: AFuF++n6NrLOAj10U75xuJtcMh2yryYvTso1pUGDNeRrdm34TcyCHRvw
	bsGb68B7bNhihZjAfCNJFbFAN1tbmEk1LMT0Bg5dbE66j8KeVPSL1pngGVAqYGLNBlWOxOEVU4o
	zGeai2MKOBcJFu7ZeALqIjbBGhzDApcQ=
X-Gm-Gg: AYBFou2lLV+riXfXNtzF3ZAn/mkmia/osjo9FGvwwMexWlxKZNw/2KIUhUKSNjccFXb
	KBcWYgkUlMx8t6lRaoZsVU9C4JxOFvPcoa3OskVLBSnE1Sn8mplHby8G0+6lrnp1cZWPD30JcKO
	n9husNduLAaqc6ORvzChiQRq506Zw4SUHOHtGxtbzFNBCfObw1pqKMGFOiydSTOQCkpg4IyRPW5
	IvdWCafWnga4uwGZn5RSvFOrzIcbWunf9OZ9ZrDlC4EWeqtKD9LDfXBtkxiAxufSOYAbkCaD7Qm
	HbVM1xfkBqthAhy6siFhcZ5FNzSAXh8yJqHIzO9H0RrH4/4SgwnyCH770w==
X-Received: by 2002:ad4:4eaf:0:b0:912:517b:7bcd with SMTP id
 6a1803df08f44-9140c45e16amr36513256d6.44.1790162606203; Wed, 23 Sep 2026
 04:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105757.260-1-anykey196@gmail.com> <20260923110700.C331F1F00898@smtp.kernel.org>
In-Reply-To: <20260923110700.C331F1F00898@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:23:13 +0500
X-Gm-Features: AclHuK80bwmJZdOYxmF8iAKdw-NUD9G5_eoeZNJ35MH2NPLmCB-oxTRJeWQWiiA
Message-ID: <CANHPwAQOPvcQvDLNpKLNL+jQg23sJMbhVSvNWqswFDm7iH6TEg@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - add AXP313a support
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is already addressed in v2 [1]: the AXP313a no longer reuses
axp20x_info. It has its own axp313a_info without start-up/shutdown
times, and the startup/shutdown attributes are hidden through
is_visible(), so they are not created and no out-of-range access to
AXP20X_PEK_KEY happens.

=D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 16:0=
7, <sashiko-bot@kernel.org>:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] input: broken AXP313a sysfs attributes due to out-of-bounds re=
gmap access
> --
>
> commit fbaeccab4996537ab99d0c8423e2cf36610e4b34
> Author: Vladimir <anykey196@gmail.com>
>
> Input: axp20x-pek - add AXP313a support
>
> This commit adds the AXP313a PMIC platform ID to the axp20x-pek driver to
> enable the power button. It uses the axp20x_info generic register layout.
>
> > diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20=
x-pek.c
> > index 24f9e9d893de3..d4e2fc9a937ff 100644
> > --- a/drivers/input/misc/axp20x-pek.c
> > +++ b/drivers/input/misc/axp20x-pek.c
> > @@ -393,6 +393,10 @@ static const struct platform_device_id axp_pek_id_=
match[] =3D {
> >               .name =3D "axp221-pek",
> >               .driver_data =3D (kernel_ulong_t)&axp221_info,
> >       },
> > +     {
> > +             .name =3D "axp313a-pek",
> > +             .driver_data =3D (kernel_ulong_t)&axp20x_info,
> [Severity: Medium]
> Will reusing axp20x_info break the sysfs attributes startup and shutdown =
for
> the AXP313a?
>
> When these sysfs attributes are accessed, the driver calls:
>
> axp20x_show_attr()
>   regmap_read(axp20x_pek->axp20x->regmap, AXP20X_PEK_KEY, &val);
>
> axp20x_store_attr()
>   regmap_update_bits(axp20x_pek->axp20x->regmap, AXP20X_PEK_KEY, mask, id=
x);
>
> Since AXP20X_PEK_KEY is 0x36, but the AXP313a regmap defines max_register
> as 0x21, won't the regmap core block this out-of-bounds access and return
> an error?
>
> > +     },
> >       { /* sentinel */ }
> >  };
> MODULE_DEVICE_TABLE(platform, axp_pek_id_match);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923105757.26=
0-1-anykey196@gmail.com?part=3D1
