Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652BB1C3BE0
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 16:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275020; cv=none; b=NTUF9DzjtXr+euQNqktQUlKmeAcUZ+l9MfnOl+TCTYosPA7n2qvkXOKzr+N0EqIREKw07afjOFmQ4/tmgO42826AWr2UkE+FC6Yad8ANK+Y9p9ROhoLl8MFzoXXuZXkPuUOpqmAeUg6Fr1GswVpUtVMHKlKH+QI6yGio2jHKSxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275020; c=relaxed/simple;
	bh=eBpkPlO29A8M7ikSKjAPGZMl8dFPu0v4vf3XdWRDI7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQBbAY66OXtqT21MmrMEiqRmACK3KkD6eR8vQRQ6FOKcnPQgbn0thZgR5nz8UkotPMrdo28ghZjcGEja0pYfos/8i9jlrWZ3tIfNA0CjPbx7wqF00m9DI3BlsPKodcKEDeX/bgkXPI6nWTM0F1JkYr5WLMoDo1j10CVhUyhNugQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ck0QS2+d; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ck0QS2+d"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so3013033f8f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 08:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762275007; x=1762879807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdZgp8rFwisH6sL9hW06vie32Q/MJPgK1VmXTcKs3fA=;
        b=ck0QS2+dDQasqJusXUbwtPlGfrowmxAHn3sZejfkk9hD/+z+bzYNNyAs6x/rMKTPzu
         k7q+YN3F1QeZ940HMgkFFUAiRyiZ+pUO4EliYQT4v7Ii+SFQmcx1elvHsqvy/yIPQD6z
         +Gp6q7KO3JzpK+heq+Iaf4JoGknxPqsQessXIPAe+rOKo1YEGjetUJn4ToOe1fUHmZaW
         Defh6mDGHwNUoa2ykxlCjweDCjmj+BZwMhS6W5sA+ygsxAulUaSu8dqaX0xPLToIiEaN
         8bRbFHsHLQRZiTqDaQQj5rROqkNrDvLa6Q1fojQiN2sBwd1zGqbCP1JXd07wQejU2E1p
         DK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762275007; x=1762879807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdZgp8rFwisH6sL9hW06vie32Q/MJPgK1VmXTcKs3fA=;
        b=SpBoKI/W6hoq93Oi4Ek3uY/NIyixDKyjs2XcBmLSfymaKnoUf+WuhaW6PmluQ6y53P
         R2qKXZW48ZfLhWp6ufiMlCKFETShnjbWhDHcGp28xFIMJ6JhoDIesJCrC2AGzcw2XVia
         8nWQtxa6ULvgrSA+IL5GD/+T5+2IW9acHjGBQ/S55A8fvDnWWRg6zzUPlkke/97vSasA
         UlKUBsMh3DDRHH8yZOJj0uq92qUovHjG3lm4/3g+WfohV8sKN6EG87Lx035kAYbMG4k0
         YNUWHXOjfCvAwDJ/qFFEmAFVZw3xE/hgh0KdLoKJ3Kb/W4623rgYTJoFm4elnWKbtVPE
         to2g==
X-Forwarded-Encrypted: i=1; AJvYcCWomF2vjECo80j0TabNjG7kKdZuPI90O+x2w8VdFQt26FYFwAyvLKagxTkAXzgv1EfAdtdMigOpNEP7iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXHCT7AE6QkUwGxBKaZmMurLtfJw7Xap8FYnrCchLYNAWxMRdf
	VgAEGdo90gEnBFhlqs4pMV5WJ1MOXqcQxpFCVNeuats4eXBO3DS2AWnm
X-Gm-Gg: ASbGncv3OvpiMtYQ1EgSpC0vw4aWhAZAhSlDdqb+0rhU8aUCJK9l9EzXdzSabvUjKIB
	a848ZhePCbTdaewGeZkfbOW/0xDl8QLTVbpRRmxZjhQVINN16RFtJl733vWi2gA7LzTtr9RCTKV
	+3KoR1HXwY4nijLxincqwcWubPN6E6xxydiJL7mJCXAik+ykX7Pt1TxHMhfLdbu1qtfFp838ZLo
	c5Ep2yEebIrnq9pYELfCTHrtErTEYGt2iyVbYogmgDdPISrD1zgm7VYRGE1AzqqZXRexpKgn5FM
	JajWriL8OzucE7LKNBSuBEBHH7dx78B+PxL8Fferqu+ui9oDPl9tp84DgZYKzjpJBcKSBxR08bJ
	vFTTJbZveqiN8JNQTQ3Nt1yDHX6WC9AC4qsIg7kwnvNEsnOGoZWA1UOlfgnLuod3TkTVWwAaBBE
	4iEOPIM1raEB11FYYUGqkJ6mzwMbCkE/4hQCoauEXkjHsWIjEhrunLOeOuBjKg1oO5gRE=
X-Google-Smtp-Source: AGHT+IHsOmcFgrKN0VFuIMGhIpJEUqqSZDIXndB9GVdXwqoNi1GsBka2e33KfnMwqvPBDWre8Hxpqw==
X-Received: by 2002:a05:6000:186b:b0:429:ce81:fe2b with SMTP id ffacd0b85a97d-429ce82013amr7678935f8f.23.1762275006529;
        Tue, 04 Nov 2025 08:50:06 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f5be4sm5345170f8f.31.2025.11.04.08.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:50:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Tue, 04 Nov 2025 17:50:04 +0100
Message-ID: <5959058.DvuYhMxLoT@jernej-laptop>
In-Reply-To:
 <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
References:
 <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-27-jernej.skrabec@gmail.com>
 <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Chen-Yu,

Dne ponedeljek, 3. november 2025 ob 18:11:07 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > On DE2 and DE3, UI scalers are located right after VI scalers. So in
> > order to calculate proper UI scaler base address, number of VI scalers
> > must be known. In practice, it is same as number of VI channels, but it
> > doesn't need to be.
> >
> > Let's make a quirk for this number. Code for configuring channels and
> > associated functions won't have access to vi_num quirk anymore after
> > rework for independent planes.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
> >  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
> >  3 files changed, 18 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index 78bbfbe62833..f9131396f22f 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -708,6 +708,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixe=
r0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -718,6 +719,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixe=
r1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -729,6 +731,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0=
_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -740,6 +743,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer=
0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -751,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer=
1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -761,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer=
_cfg =3D {
> >         .ui_num =3D 1,
> >         .scaler_mask =3D 0x3,
> >         .scanline_yuv =3D 2048,
> > +       .vi_scaler_num  =3D 2,
> >         .ccsc =3D CCSC_MIXER0_LAYOUT,
> >         .mod_rate =3D 150000000,
> >  };
> > @@ -772,6 +778,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer=
0_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -783,6 +790,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer=
1_cfg =3D {
> >         .scaler_mask    =3D 0x1,
> >         .scanline_yuv   =3D 1024,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 0,
> >         .vi_num         =3D 1,
> >  };
> > @@ -794,6 +802,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixe=
r0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 4096,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -805,6 +814,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixe=
r1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -814,6 +824,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer=
0_cfg =3D {
> >         .mod_rate       =3D 600000000,
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 4096,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4=
i/sun8i_mixer.h
> > index def07afd37e1..40b800022237 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > @@ -178,6 +178,7 @@ enum sun8i_mixer_type {
> >   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
> >   * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
> >   *     Most DE2 cores has FCC. If number of VI planes is one, enable t=
his.
> > + * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
> >   * @map: channel map for DE variants processing YUV separately (DE33)
> >   */
> >  struct sun8i_mixer_cfg {
> > @@ -189,6 +190,7 @@ struct sun8i_mixer_cfg {
> >         unsigned int    de_type;
> >         unsigned int    scanline_yuv;
> >         unsigned int    de2_fcc_alpha : 1;
> > +       unsigned int    vi_scaler_num;
>=20
> This could be a smaller type. Please do a sweep of the struct after the
> refactoring is done and see if any of the types could be shrunk.

A lot of things can be stored in smaller type. However, making things small=
er
may be contraproductive. Structs are usually aligned for performance reason=
s,
so it won't save any memory and accessing them will use extra asm instructi=
ons
for zeroing out parts of CPU registers since registers are larger than used
data type.

>=20
> And just a nitpick, but I would probably insert it above scaler_mask.
>=20

Will do.

>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Thanks.

Best regards,
Jernej


