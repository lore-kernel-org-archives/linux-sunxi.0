Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535136CDAB
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710408461; cv=none; b=aoHc2Iy8woAwjsgEp8NMo/SIaEMIkViDgQTqi7ezIVAXErG51urKEhwPsY/HOxa/6o7lCG2AgWnXUuv35mBp3yfT90GPV8WlS2TLsEFt8f7uY8kNPtlfrA2NJCTjUha0s91kNo2N+vMEnAQn+rcjW/xyh4ZIIDKLcVc/gA2xf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710408461; c=relaxed/simple;
	bh=f/Op71/HodaIe/ZXYbQm5hzh0Ck9AYk9S6c3uv7jZl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlNYE6UZ1RGDs22H+GUFl9/fx8T0upNdw4tkw5JOBzIjSS4PbkoHUSlgCSmHDp/QCyB262mOnQRZEglVinjS18a2roBBiQ0ZNcO0qdxlvA76gYa2MIdQJIhrrQ/jAwhehCbCbJuBUdj7FKjviENDxZVOn7Z3We67O56kOS2iK4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a0579a955so9383107b3.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 02:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710408457; x=1711013257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaLpKVgtNxjkHzGcUUabbJb9+dMavCQgVpAQ745YG6s=;
        b=X197qE/Our2+VBnJqaRmrn/9VyltELBEvy7cxKDGp2vA+KSGF2qBjlf93w03JKb7c2
         twt8DKH8C32pGXlK9Ci1brjFc9gmnNb2vbVkMEzelqBFHdPi5cr2l3EZUxm/GnlvG7eI
         oEEqSBUJYqrsOAoJAiktIYOluAFP8HUxF5jpFg8m51B/jPBuEwqBLi8gV5b/DaCeJnkX
         7e64HBW5Nzh2ujlEWVHVVXQqubLWmpVmEvLEjWoslLdMrFUOLcUR66nkg1enV39oVK/m
         gv333y2LFvOLQ3pj8WETXYbl5k5N1LG3Uhcjcs+O6TQKat0waHEPa407YZhMkqWdx2dF
         z89g==
X-Forwarded-Encrypted: i=1; AJvYcCXhJQRxtgposMfMEmaKXYyM8Z10F9exE+tpZkjq1Ok1neawN+hJ6uyAnSpB8np5gmJGixe611ASCBRku1UTFn5sQbYVeJZQtVvWmHs=
X-Gm-Message-State: AOJu0Yy9oejSOgQJVSorlal0DT+Tzjc+1mnSOmbUJ2bjSGG8mwK5jw8G
	mrFhzPpaGMMuBSXdXvZ7vZ4vWfKEoEGMcdAf5P5apuLQ8ThOztg0pwnSPabc9Hk=
X-Google-Smtp-Source: AGHT+IF1tdRkBz6/Ssx+0xXuQ1rAl8zaGmpoPw7zT1cSNS5nuhJyh7g61mcow+qfbk/n9BJRygd8HQ==
X-Received: by 2002:a81:5408:0:b0:60a:6c1a:bf6a with SMTP id i8-20020a815408000000b0060a6c1abf6amr1287644ywb.41.1710408457125;
        Thu, 14 Mar 2024 02:27:37 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id dy7-20020a05690c270700b00608cea2b96bsm196594ywb.53.2024.03.14.02.27.36
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 02:27:36 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-609f359b7b1so9368897b3.1
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 02:27:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5Vg2zOz18MgTcJGI994F7LgFCjiS5WYB0Yt7b+KMdUszQ4NHhgVQ1ZUAx36tXK6065pP96mqEofxIcrI2IULC1kmnWsra5Uuyz78=
X-Received: by 2002:a25:a264:0:b0:dcd:38f9:f78 with SMTP id
 b91-20020a25a264000000b00dcd38f90f78mr1053493ybi.29.1710408456666; Thu, 14
 Mar 2024 02:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com> <20240304-brawny-goshawk-of-sorcery-860cef@houat>
 <85b807289ff2400ea5887ced63655862@AcuMS.aculab.com>
In-Reply-To: <85b807289ff2400ea5887ced63655862@AcuMS.aculab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 10:27:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
Message-ID: <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
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

On Sat, Mar 9, 2024 at 3:34=E2=80=AFPM David Laight <David.Laight@aculab.co=
m> wrote:
> From: Maxime Ripard
> > Sent: 04 March 2024 11:46
> >
> > On Mon, Mar 04, 2024 at 12:11:36PM +0100, Arnd Bergmann wrote:
> > > On Mon, Mar 4, 2024, at 09:07, Naresh Kamboju wrote:
> > > > The arm defconfig builds failed on today's Linux next tag next-2024=
0304.
> > > >
> > > > Build log:
> > > > ---------
> > > > ERROR: modpost: "__aeabi_uldivmod"
> > > > [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
> > > >
> > >
> > > Apparently caused by the 64-bit division in 358e76fd613a
> > > ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid"):
> > >
> > >
> > > +static enum drm_mode_status
> > > +sun4i_hdmi_connector_clock_valid(const struct drm_connector *connect=
or,
> > > +                                const struct drm_display_mode *mode,
> > > +                                unsigned long long clock)
> > >  {
> > > -       struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder=
);
> > > -       unsigned long rate =3D mode->clock * 1000;
> > > -       unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDMI =
spec */
> > > +       const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi=
(connector);
> > > +       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HDMI=
 spec */
> > >         long rounded_rate;
> > >
> > > This used to be a 32-bit division. If the rate is never more than
> > > 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> > > the expensive div_u64().
> >
> > I sent a fix for it this morning:
> > https://lore.kernel.org/r/20240304091225.366325-1-mripard@kernel.org
> >
> > The framework will pass an unsigned long long because HDMI character
> > rates can go up to 5.9GHz.
>
> You could do:
>         /* The max clock is 5.9GHz, split the divide */
>         u32 diff =3D (u32)(clock / 8) / (200/8);

+1, as the issue is still present in current next, as per the recent
nagging from the build bots.

> The code should really use u32 and u64.
> Otherwise the sizes are different on 32bit.

The code is already using a variety of types (long, unsigned long long,
unsigned long) :-(

       max_t(unsigned long, rounded_rate, clock) -
       min_t(unsigned long, rounded_rate, clock) < diff)

At least u64 should make it very clear clock does not fit in 32-bit.

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
