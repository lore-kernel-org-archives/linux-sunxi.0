Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE646C847
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162583; cv=pass; b=MUdmA16ykFfsDxvxahp3CzWWHFKjMXALGDP4qEgREtM5TmIxRKig1Plw9ozaRwwbf1QR7cCMOJYrpeLqOoLF6sb07j2LWVfRfUrEaurbx2R1jCBC4a7K2Q/t6R/mTra4t6AbZf0szNKQuhC6+T/EFPwGej6sqgjFQ8GqpLMU2O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162583; c=relaxed/simple;
	bh=0z1VCFZ2xuRyxqepe31PgaTDnQ5THZA+rjwWgzaliKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyTGHhVYjfPmDpAyA8aAb4EYcm1M0D2M63MoJp6qgxsba7rSVo8JP970P+tsH/0dACGzY2XJfC1yCe69cqHwNfLhv7hpXaQfA9Xkj+JcgdLGADVlzpXJ2y0q1Vg8S02xOnxfGRuDDckwxucONZFEvmQTerk2XKki4NsQfwCvO6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRdFgJ+p; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRdFgJ+p"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505824so10056337b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162580; cv=none;
        d=google.com; s=arc-20260327;
        b=HEE/hIV51Lni18fZ6o8GluMrgXb87ojhThg78PALv27my3K+r8uH81vHxjK9Hcsun2
         8Oeh7YUxMkuU5INpB9/ATplL7X/nI3v/SvZVwyBW4kFew58Oun1RnqBklEAYF8nNLE/p
         6XZ8of2GE91qsKb3wNh3CyGzx9eHdu4ITPmYwZwoVEBQTvm2HKzHwDJJJ5YU0rzlhW70
         KzqUlJGF0pmKt9CdIylgz8Qsfhm+maonHph1EIzDGmOW1A7nMrtGyryHO7biIPuk161L
         0ywxNDPbiIUZJ9NlqFsqeU/6DDQvzAWux8GvHhcRLMVJPsSRwo8fLf3Nvo86k9sZSXdY
         hBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gHFi7D8qOayJJzxbwOB5rCaAL3OuK0mkAkD2JKiUgRk=;
        fh=/+fLg8Z/QpPLbXMcBk8PIP6ADPx6kLRVHlVgho8p9Zk=;
        b=nbLy9es8Om3NJ9D/QWbZNNdYInHMlxwIXNDjJ2ia8rBLv31TvJcR8TCPXGsfkOCltv
         hZzI1U1gA/ZNiX5Qhox5U5GzUbh0CxrbN0PcGZsKsqwABxRDP5r7E8MZpzxxcetFuzDn
         DPTyIJF73l0Yap44g1uYm1QCqT8eMaD9+RyNMdRA3xN+/wsF8l4YWETia/6W4lAuajd6
         XdqkNfrHVlOIBl1vk8ORf8MDsckkBtYvUKIaan8Q34HrAierhazI+jZgykpS4jIkiOD6
         SgbxCXVVtge4e/4Hkzc4rwGgO2dWKNGUSRBo49YZVgVDB0G5GG+tkI3NpMto3RcJ36h1
         Sx0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162580; x=1790767380; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gHFi7D8qOayJJzxbwOB5rCaAL3OuK0mkAkD2JKiUgRk=;
        b=WRdFgJ+pAsK6N/LFQqgIJ+Yjg7kYSEZqGmblhHLvWTurtDA/r1pWiY5HiSPsbEBnqu
         Bqb3X7SoBGVALjtPtRf6AfZJFv+iOH0Z6rVrQRNKkohOOUBQuP6TWN4ksc4INFUpTffg
         7aCRyje3EZAglvq0X84bz9LeDOxkKsjaYZpJ4KUHrRGXvHvFTf5p0JbBeMGfKYtyyk59
         Hl4xX5hfjjCmY4irHoz8dor1MHBknxcQaQEKedz+VQLAOgCGCLJp2LbUoHz8aM39a92X
         SuJIWPsT28cfihm2ar4mAQHfQZXaX9ZcEAREd6dbPUieWn9J4x51qTzk7Z71ya1cF8rD
         EXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162580; x=1790767380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHFi7D8qOayJJzxbwOB5rCaAL3OuK0mkAkD2JKiUgRk=;
        b=YP7NJpGK8QZaf6EfqYIGirNrdQC9PCX1uvGkGgIOaz55eIuWVlDUc+BL+UL/LnALvB
         L2FN8UQTaJbnU85p5qXXlo5T8j2f/ztsKbrwjCHXagA7Alt94SHL5MlFRgxxLoF2cjs6
         KtyX7x8AZrp+dq4YIY8VrVNq36uiuuO/j4gLQBZZPC/W8a/9S8UCEr1EWNg5c/l4PMc9
         ILQ9zGbDku1wJ1swajRZWllSl3pJDC7wD0MdJJSejr4TeJvPlglPzTcrlVafT0K5uWWv
         RMfC3Kor1LPEc9Kot3Tk+b/ZkxUDxBxr27C/O8iSfrGzruG6qWm8p1K6/vNS5gsfNP+t
         VhXg==
X-Forwarded-Encrypted: i=1; AKwUvBz27MBIOOq9Kni9DQVQZOCqFCvA+irAE6MItEAgCLCg/YJg73JmYQVSqpEUsMf0nf/ryYMvu5ulsD2nIQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n1ZE7rTU2FrMWdcQ20OTC2pyimpU406aYZQFgYCWa8OGX1E1ZI
	feNmvzAztQLdsbmlxv3yx1gT0PKt2Hd11TCI5bb9i2lQ1nyqOQzAWhIpIAVZ2qunKuDZrDWb+bF
	f0S2blmZPuDhP4O/MPQd2GDbUZEK28mE=
X-Gm-Gg: AYBFou0kgVbT4nsplHnI2VnBvHQW4KxtKMsA1VSN1jn08IM76e3hDqZtbZbr31jyXuI
	h/Qiunez8WrZtbhHRZkUoKVb1acOSV9RFaa5dfl3igfWcEVVJdN6C5qwJMLkvR30/XI4WNGBMZY
	Lh7Qq/GcuPZx6BhWK0qMliU3PR7CsFLItF0gdH1H74UHd4u85aPu1HsA5Fpg2uzJCegNVIdPjcD
	YltSxso1nh0uXZfW1+rmGiPaSGCU8TFjhoVM7UgTHioYOUIgkJHC7pPekSqLeNycCPzfXnbP0H2
	7UZRSKfnWhir2HtLcs7rbLq2CUxiNoqs3TTdBY4hXHTnPK3TMYfBV9f347+2JlC8LwXt
X-Received: by 2002:a05:690c:c6d2:b0:854:819:64c9 with SMTP id
 00721157ae682-8a459bfa9demr8916207b3.30.1790162580359; Wed, 23 Sep 2026
 04:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105215.1633-1-anykey196@gmail.com> <20260923110236.CA7FB1F000FF@smtp.kernel.org>
 <CANHPwASJBzich3-2QV3FNNdKX+GHQGe2FuFWu2CUXCYya=-1zA@mail.gmail.com>
In-Reply-To: <CANHPwASJBzich3-2QV3FNNdKX+GHQGe2FuFWu2CUXCYya=-1zA@mail.gmail.com>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:22:47 +0500
X-Gm-Features: AclHuK-oRbR1-Bis58IfnX-iX8wBDjxwU2mU1GEVQnmP7ClH7-r_aFOAl62yTEI
Message-ID: <CANHPwARAonpfi2qCC2iVka-nLjXx6kgLvGWTtMqjKOeh5CZEYQ@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - add AXP313a support
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. Correct: the AXP313a register map ends at AXP313A_IRQ_STATE
(0x21), so AXP20X_PEK_KEY (0x36) is unreachable and the
startup/shutdown sysfs files would always fail with -EIO.

v2 no longer reuses axp20x_info. The AXP313a gets its own axp313a_info
with no start-up/shutdown times, and those two attributes are hidden
via an is_visible() callback, so they are simply not created for this
variant.

Tested on: OrangePi Zero 2W (Allwinner H618 + AXP313a).

=D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 16:1=
4, =D0=92=D0=BB=D0=B0=D0=B4 =D0=A1=D0=92=D0=9D <anykey196@gmail.com>:
>
> Thanks. Correct: the AXP313a register map ends at AXP313A_IRQ_STATE (0x21=
), so AXP20X_PEK_KEY (0x36) is unreachable and the startup/shutdown sysfs f=
iles would always fail with -EIO.
>
> v2 no longer reuses axp20x_info. The AXP313a gets its own axp313a_info wi=
th no start-up/shutdown times, and those two attributes are hidden via an i=
s_visible() callback, so they are simply not created for this variant.
>
> Tested on: OrangePi Zero 2W (Allwinner H618 + AXP313a).
>
> =D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 16=
:02, <sashiko-bot@kernel.org>:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [Medium] sysfs: broken startup/shutdown attributes for axp313a
>> --
>>
>> commit 2573be3a312f98b032ff9523708d368661f8e004
>> Author: Vladnwx <vladnwx@users.noreply.github.com>
>>
>> Input: axp20x-pek - add AXP313a support
>>
>> The AXP313a MFD driver registers its power button cell as "axp313a-pek",
>> but the axp20x-pek platform id table only matches "axp20x-pek" and
>> "axp221-pek". The power button therefore never probes on boards using th=
e
>> AXP313a PMIC (e.g. the OrangePi Zero 2W).
>>
>> > diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp2=
0x-pek.c
>> > index 24f9e9d893de3..d4e2fc9a937ff 100644
>> > --- a/drivers/input/misc/axp20x-pek.c
>> > +++ b/drivers/input/misc/axp20x-pek.c
>> > @@ -393,6 +393,10 @@ static const struct platform_device_id axp_pek_id=
_match[] =3D {
>> >               .name =3D "axp221-pek",
>> >               .driver_data =3D (kernel_ulong_t)&axp221_info,
>> >       },
>> > +     {
>> > +             .name =3D "axp313a-pek",
>> > +             .driver_data =3D (kernel_ulong_t)&axp20x_info,
>> > +     },
>>
>> [Severity: Medium]
>> Will using axp20x_info result in broken sysfs attributes for AXP313a?
>>
>> The AXP313a platform binding unconditionally exposes startup and shutdow=
n
>> sysfs files because they are hardcoded in axp20x_groups. Reading or writ=
ing
>> these files attempts to access the AXP20X_PEK_KEY register (0x36) in
>> axp20x_show_attr() and axp20x_store_attr():
>>
>> drivers/input/misc/axp20x-pek.c:axp20x_show_attr() {
>>         ...
>>         ret =3D regmap_read(axp20x_pek->axp20x->regmap, AXP20X_PEK_KEY, =
&val);
>>         ...
>> }
>>
>> drivers/input/misc/axp20x-pek.c:axp20x_store_attr() {
>>         ...
>>         ret =3D regmap_update_bits(axp20x_pek->axp20x->regmap, AXP20X_PE=
K_KEY,
>>                                  mask, idx);
>>         ...
>> }
>>
>> However, the AXP313a regmap configuration restricts max_register to
>> AXP313A_IRQ_STATE (0x21). The regmap core blocks accesses to registers b=
eyond
>> max_register, meaning these sysfs accesses will definitively fail with -=
EIO.
>>
>> Could the axp313a-pek driver be updated to avoid exposing these broken s=
ysfs
>> attributes?
>>
>> >       { /* sentinel */ }
>> >  };
>> >  MODULE_DEVICE_TABLE(platform, axp_pek_id_match);
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923105215.1=
633-1-anykey196@gmail.com?part=3D1
