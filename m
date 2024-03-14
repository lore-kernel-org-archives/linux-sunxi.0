Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B596E616
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710414908; cv=none; b=OuusaKGt5MTUaEvX14JJkLzPZ23+LOveU3Bd/l1zsEC/Qy8vHqew02JxNRnBWo30I69tkZLfaaXAFI73h1NzocoQICK1MQhQmzK6qeJJ9IWnFt5L/XzbgDbMvVQ050/ALKqMwwSA8DIdr59Dm6h4AqOdA40uSQFLZ09MOZFVdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710414908; c=relaxed/simple;
	bh=MHPwaGe+JEy2PghaKynwl1tJuqHfhafULXPHJzyP8ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzOd+l7ZafHaLaSPYMHMovRRBuqHz1Jn7VGGZSoH3Qx8eHMpUnx58zAF1JW+iLd2+Vk+uHf9y4FYR02SoC63DWItKGMlnlN4q8gjoeX99dNgGvNy6UxV1AsbGzRlZSff7HJwoSDRQavgpIHyEbIO6NHRGUSWwc9klTEWst06Cac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a0579a955so10358287b3.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 04:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710414905; x=1711019705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaxQeb/LOGJ+tXY7ROrISTEEvDtokZCLzq0Vp5ELGOY=;
        b=j3iAzdmNSqxJHZ80hDB+vgOopdcEsKLS2ik/l0XNsACN61ebSW5Pk7h1z/9aHIyQQ6
         i5Qk0Tkj6lMkMrm57xGn8u6PMM8cloGE513QmNktdqeit5sbJ4UCO/epApqUG1/JY9rl
         tvjRwke9Ac/rxc9n5SBGbTPsDxWnJGTkfzfif9rHl5Dy/ZI0xifsTR2HPvjJJpxQZ0Qc
         raj8AU+PnsvsFmnDzuGu3O5oSqQ7/G1jP0AbPEVZD1cGMq7YXusgsMkvH81u7FvtPosF
         Yzu9KtrfBJAkfPH+LdefpqRZSIPfW/XnuBIOZvVlFpuJGjl47CT+xMUXKSJB5I4bH71M
         eDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbEY78jcnHPy3ZWe36mLvN7Y196uKoc4KFcGWkxtrKYKzCb4tzQenW2WAwnMDnWM3eWHPKXYDrVwVBhqOVvXYIUh6rvuJrQd9++XU=
X-Gm-Message-State: AOJu0YwhRS+q2JlGBxDu4N7/ncUyszam4t51DCs/N1RMe6PmZCP/vhMT
	lZdTXAeY03Vmyb+rYEoBWaa/vR2j8JeM1/zHnvMvPOBbd0gUyMXV6xYATUjsJ10=
X-Google-Smtp-Source: AGHT+IGC7/KzBUz0o3DIcvqb3bbPRppdYzl6oo6GXcBr8aFnmnNyNAoL8DpwIEMhxaYt6wRtLB1S3g==
X-Received: by 2002:a05:690c:2904:b0:60c:c993:7871 with SMTP id eg4-20020a05690c290400b0060cc9937871mr1090195ywb.8.1710414905367;
        Thu, 14 Mar 2024 04:15:05 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id x193-20020a81a0ca000000b00609eb9472a7sm234048ywg.41.2024.03.14.04.15.04
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 04:15:04 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-609f359b7b1so10470397b3.1
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 04:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXz04BW9U2qvPolkQbVhdFNt6DWUXRwt4Kss2EjGVehP+OnClSZVMZk98BkF08KGNeEwRmHWzdteUF5EBEGHoveW4qCZWuHswvUjl8=
X-Received: by 2002:a0d:e782:0:b0:609:fdf7:b443 with SMTP id
 q124-20020a0de782000000b00609fdf7b443mr1440372ywe.52.1710414904384; Thu, 14
 Mar 2024 04:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com> <20240304-brawny-goshawk-of-sorcery-860cef@houat>
 <85b807289ff2400ea5887ced63655862@AcuMS.aculab.com> <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
In-Reply-To: <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 12:14:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbmZyiy_Ca8eVQtwAhJ-_JsKEOpjrGehirWziPKbd=7g@mail.gmail.com>
Message-ID: <CAMuHMdXbmZyiy_Ca8eVQtwAhJ-_JsKEOpjrGehirWziPKbd=7g@mail.gmail.com>
Subject: Re: arm: ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko]
 undefined!
To: David Laight <David.Laight@aculab.com>
Cc: Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, Dave Airlie <airlied@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 10:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Mar 9, 2024 at 3:34=E2=80=AFPM David Laight <David.Laight@aculab.=
com> wrote:
> > From: Maxime Ripard
> > > Sent: 04 March 2024 11:46
> > >
> > > On Mon, Mar 04, 2024 at 12:11:36PM +0100, Arnd Bergmann wrote:
> > > > On Mon, Mar 4, 2024, at 09:07, Naresh Kamboju wrote:
> > > > > The arm defconfig builds failed on today's Linux next tag next-20=
240304.
> > > > >
> > > > > Build log:
> > > > > ---------
> > > > > ERROR: modpost: "__aeabi_uldivmod"
> > > > > [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
> > > > >
> > > >
> > > > Apparently caused by the 64-bit division in 358e76fd613a
> > > > ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid"):
> > > >
> > > >
> > > > +static enum drm_mode_status
> > > > +sun4i_hdmi_connector_clock_valid(const struct drm_connector *conne=
ctor,
> > > > +                                const struct drm_display_mode *mod=
e,
> > > > +                                unsigned long long clock)
> > > >  {
> > > > -       struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encod=
er);
> > > > -       unsigned long rate =3D mode->clock * 1000;
> > > > -       unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDM=
I spec */
> > > > +       const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hd=
mi(connector);
> > > > +       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HD=
MI spec */
> > > >         long rounded_rate;
> > > >
> > > > This used to be a 32-bit division. If the rate is never more than
> > > > 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> > > > the expensive div_u64().
> > >
> > > I sent a fix for it this morning:
> > > https://lore.kernel.org/r/20240304091225.366325-1-mripard@kernel.org
> > >
> > > The framework will pass an unsigned long long because HDMI character
> > > rates can go up to 5.9GHz.
> >
> > You could do:
> >         /* The max clock is 5.9GHz, split the divide */
> >         u32 diff =3D (u32)(clock / 8) / (200/8);
>
> +1, as the issue is still present in current next, as per the recent
> nagging from the build bots.

Oops, s/next/upstream/.
Well, less 32-bit build testing for the next few days :-(

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
