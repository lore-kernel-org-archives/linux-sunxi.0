Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801FA1CD1FB
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Nov 2024 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731414757; cv=none; b=Rn0HYx5U3s7Gl3Qal9OKiiZR7BCbVJGyjSWRM/a0M8GIGb2Q3Rbaq6n3liRA8Jh1G2MhbMjGdhuU9aZYwD4q2jVDNQUXlBsr+nlnAdEJXcQMjrNs/iUO4dqLw7e8QavkVNe0rfsiDksdwHZozpCINEpHr04GfyQTFlzg3KgZ9+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731414757; c=relaxed/simple;
	bh=tBgqVT0kf3DnBE6rWOx3JIn1Zygy5++OjNbPdIAJLF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdO98UzGh407rfDAsUqhC6LhwVc3jDYWzRfezzB3NopXC624PRnSMndyMDq8cfvRrBrDGNE725PnL8jicffi/dS2ZoCCnjYpQOfCaa+OKPKQOJaW9zx7oLrgaljo3bzoagduMt+D0GgAIzWHXZmDlLdgyN0Zyg9olwfryd8fBpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBDEDc+b; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBDEDc+b"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so4424117a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Nov 2024 04:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731414754; x=1732019554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUb3nok/AqP7r33O+yPL3KeymIM3B7Unh2DohKMeZnI=;
        b=HBDEDc+bfso6FeZdR1d/Nim8RGhgXh4p0jtW4Os810ChArJXewHpwWJKgTYzvlsc65
         RXrgsAl1iAms+nE79WkRCWjHq2hERqyAi8VpI4IWDuJPaeNZWUg1UTmJmiA+YgN+P4Ch
         BJYVMs5vx6ns0MBY0GxfkOOH6SPe/DW8fdZGQX1bge1Ps9flUKnSv+9aayNh/qR2eGgZ
         VcZuVLl3reogJpC9YncCZBsOmdMYEgGscJ5wHKqPQR5CBsM+xAseFvu9IcK01Q8Rf9i7
         76ALPyG3Uje1lWnb4JNOkdobFWZkn06VMF0N32L2HUMOouQpsoCGRmqxR9Qsei2l7AtI
         JEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731414754; x=1732019554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUb3nok/AqP7r33O+yPL3KeymIM3B7Unh2DohKMeZnI=;
        b=O319kewyequdlm/cIxc/QrSYuP/0m8VQKxsOUYjqaBvWmD4tOo4B0iUxlYkR8nb3QV
         T5wIRiY/Q2MAG7RcH1BXrhUOpyDBPxjKsODqm3e3RSTaAYuOl4gmayAX8U1AoTL52qRF
         GcmK1Z8z61XIUFdC5bjknj233zR+66uDeneDLHioep3n7e9yWnQqS8YLsXS1dygWa+ZR
         m9KNuxT5hfVf41/kN6SSv/cWxG89B43mkJtakZqFTwCVE46CNF9cSeyCvqTHapjjgVqI
         R+dNYYY1hv7S7ZvrsI1Kenvm3O+h9hBwV3ARHgGsKO1OL4tnlm9sZeh3Av02WzZUPOja
         OgHA==
X-Forwarded-Encrypted: i=1; AJvYcCVcSD6k1Y5XtgWRmEREL8opbUdpNyvKujAgzAYrGLGWqeIluV9skEGrefpEomUfL32yGG8ecz15/UY4yg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9ZCZ3VTb4oapK+dMaLFwH9FnrWmSeuc0/AoA1f2V4/zRySn+h
	bwg636FMIfeOLm56mrg2UMCcg/iINN9xNqhc6EDDGo7v+wqUa/FgLYjOp76/qrW0hmHVKIjXkfm
	d+m7w5I456um56qn+sxFE0Xg4g04=
X-Google-Smtp-Source: AGHT+IHsekqXC8V0d+CZha3eqodR3E96t9ckKwPOB07f+j+M/7b8jWQS1qzjFRSvfRjwlg4Rl2gJoAnqrU5IZqFd6j0=
X-Received: by 2002:a17:907:9492:b0:a9a:1575:23e3 with SMTP id
 a640c23a62f3a-a9eefeecbf6mr1635915466b.19.1731414753506; Tue, 12 Nov 2024
 04:32:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org> <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
 <ZzEPACoblmcQD9yu@surfacebook.localdomain> <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
 <ZzHSE9Nrf4YySJrq@smile.fi.intel.com> <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
In-Reply-To: <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Nov 2024 14:31:57 +0200
Message-ID: <CAHp75Vfm_7Gq5a-v1+=WCq2w0Am0VF+z_NPenHbuvV-Mj+MX4A@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where possible
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Aren <aren@peacevolution.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 12:15=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Mon, Nov 11, 2024 at 11:44:51AM +0200, Andy Shevchenko wrote:
> > On Sun, Nov 10, 2024 at 04:34:30PM -0500, Aren wrote:
> > > On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote:
> > > > Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> >
> > You can do it differently
> >
> > #define STK3310_REGFIELD(name)                                         =
               \
> > do {                                                                   =
       \
> >       data->reg_##name =3D                                             =
         \
> >               devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_##=
name); \
> >       if (IS_ERR(data->reg_##name))                                    =
       \
> >               return dev_err_probe(dev, PTR_ERR(data->reg_##name),     =
       \
> >                                    "reg field alloc failed.\n");       =
       \
> > } while (0)
> >
> > > #define STK3310_REGFIELD(name) ({                                    =
       \
> > >     data->reg_##name =3D devm_regmap_field_alloc(dev, regmap,        =
         \
> > >                                                stk3310_reg_field_##na=
me);   \
> > >     if (IS_ERR(data->reg_##name))                                    =
       \
> > >             return dev_err_probe(dev, PTR_ERR(data->reg_##name),     =
       \
> > >                                  "reg field alloc failed\n");        =
       \
> > > })
> >
> > I am against unneeded use of GNU extensions.
> >
> > > > > replacing "do { } while (0)" with "({ })" and deindenting could m=
ake
> > > > > enough room to clean this up the formatting of this macro though.
> > > >
> > > > do {} while (0) is C standard, ({}) is not.
> > >
> > > ({ }) is used throughout the kernel, and is documented as such[1]. I
> > > don't see a reason to avoid it, if it helps readability.
> >
> > I don't see how it makes things better here, and not everybody is famil=
iar with
> > the concept even if it's used in the kernel here and there. Also if a t=
ool is
> > being used in one case it doesn't mean it's suitable for another.
>
> Just to throw in my subjective view here: I don't expect anyone with
> some base level knowledge of C will have doubts about the semantics of
> ({ ... }) and compared to that I find do { ... } while (0) less optimal,
> because it's more verbose and when spotting the "do {" part, the
> semantic only gets clear when you also see the "while (0)".

Seems we have to agree on a disagreement.

> Having said
> that I also dislike the "do" starting on column 0, IMHO the RHS of the
> #define should be intended.

This argument I kinda accept.

> So if you ask me, this is not an unneeded use of an extension. The
> extension is used to improve readabilty and I blame the C standard to
> not support this syntax.

Here I agree with you.

> While I'm in critics mode: I consider hiding a return in a macro bad
> style.

So, summarizing the discussion we have a split, hence Jonathan is our
arbiter here to judge.

--=20
With Best Regards,
Andy Shevchenko
