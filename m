Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851056;
	b=OCoa7HuPG/eUcXfeEFzXE7zRmQIRKSz+arwrfGeKJTdrliAeTIkqpwESfrH8iSFNIG8o
	 EAh8JkreTxVWbaO3CZRflmXwZVXr0C5plBFB4F6iK8iNcDVjstYoWyY4a582tSURR9qDx
	 9lbtB+gIKEsQzCfqw4S5zxFD6h3LY05YdJQ2O33veaKmH5nnKU1Gsx/yunSrAnoCceBTL
	 /ACtiOWuKnj6BQItcdkZ9vjBLCc76sYOk70qp52OGRePzB8CSirubgMEjW6k2CJo7hi08
	 43bY5ercHyNLoaCrpleoQ2GcQgd569ZHH3TLurYqqhqk3Zz94whQbS20mYJF5tktYrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851056;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=77L0zCZoOr1z13ZaKANU7WNCtV3LEiZYs/dClJg+u74=;
	b=rPtWdhKewFWWiAHWO1gc8eh+oxkfuE87vzCoD3eQRNA4IiWJFcOkg2XkSBEGgVYFsqnq
	 3Bvg4M7dzamtzIxVM1UqhsklsXJK8eNPoUD3ELRsk/jp2tR5NDFUkg++JlE0RYX2FvOtF
	 bRC3dLHYNjVeqQyqgmbPPFKOcCgscLw+KuJVMatsdE+O9fnPbg9/I768jf+UhKa3i/bka
	 Mx+ciLSgh4QVlVSKr3ydN1KlH2EXFCka6ErfnFgc180N4lb1UzbOCi/HxKeMebiBQ67EN
	 oyWoqrWW/rAyegYUVVz1Dk4fSzNQs9wtXGJhfXwq8kc8yIW4znfQHxj/4e0Bp3//qvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7PQAbc7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52337606A31F
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7PQAbc7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5C41F031EC
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792851055;
	bh=77L0zCZoOr1z13ZaKANU7WNCtV3LEiZYs/dClJg+u74=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=O7PQAbc765tV6BQe5z/Q+kEi4GBzWszlyJHrOqDa07Fb4O59K54EyqncHoVX0up7r
	 IBlIivdSRXqyGDMG48VdbfMuSUrKqAEbanFkQRYCfyGaHJV4B8l2lfPbd05zS2e0lP
	 jcYBxVKpflgZPtttF8g9qBukbEWcDmi9DFDGv0IHYR1ygtfoGcUNsGY+0uLk9yeqYb
	 E7JjTPrFlMw8xFKYCQmZsf4Ll7kJ+o3Quth4/PnCPmus0oYB98LkjK3dLZ/mjh9Sy8
	 Uen3Tt5MGuDOt6MdrZLSnPBqNa25HshtZ5IasyK4opT/VNwUwTMFnfXf0C6wf2PnvI
	 LZz8EGzT8MX7Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so10523921fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 07:10:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByHp6yUDEZHBHKypqOZELB1euuMTIMKKghS9aJ7otdySEN6YTTZPVpR0879C0TDBSHFswdy1YR1Ox++YQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIoTN6rwSN54WUv+xMWNR6xCFKg9072GTeFbY4iASTt2G1AsAew
	WJfYjDR9sODLf+W6lOicjN+s+4LZ2QvNR58BJVB9hYzyIb9Q/laWtcJNn05ypLB7+MBzIuV0mDC
	BpzFzyomuu8ILN2qPSxUVK8gYT/gXH1E=
X-Received: by 2002:a05:651c:b1f:b0:3a5:e792:2dc8 with SMTP id
 38308e7fff4ca-3ac6fd2b91fmr5065141fa.16.1792851053288; Sat, 24 Oct 2026
 07:10:53 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local> <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local>
In-Reply-To: <aty37_xHO-QRa7hQ@ashevche-desk.local>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 24 Oct 2026 23:10:40 +0900
X-Gmail-Original-Message-ID: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
X-Gm-Features: AclHuK8in-RebYr4WdGY52-xcg2ve7F2PHG1dtE5MpFbEAzuaEhl8yb8pdBRewE
Message-ID: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 10:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > > > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > > > <james.hilliard1@gmail.com> wrote:
> > > > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
>
> ...
>
> > > > > > >       /* Internal 8250 only */
> > > > > > >       UART_PORT_AIROHA                =3D 124,
> > > > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > > > >
> > > > > > Why? Besides the poorly chosen name, what prevents us from modi=
fying the
> > > > > > corresponding parameters at probe time by leaving the one of th=
e existing
> > > > > > types?
> > > > >
> > > > > The new type was primarily a way to reuse the core's FIFO configu=
ration
> > > > > table, including the RX trigger mapping. H616 uses thresholds of =
1, 64,
> > > > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to =
1, 4, 8
> > > > > and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> > > > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > > > >
> > > > > The core already has get_rxtrig/set_rxtrig callbacks, though. I'l=
l rework
> > > > > this to retain PORT_16550A, supply the H616 FIFO parameters durin=
g setup,
> > > > > and use those callbacks for the correct trigger mapping.
> > > >
> > > > Please consider just taking the FIFO size from the DT. On some chip=
s
> > > > not every UART has the same size FIFO, so we already need to deal w=
ith
> > > > it.
> > > >
> > > > Also, FIFO size is a standard UART DT property, though somehow not =
included
> > > > for dw-uart.
> > >
> > > FWIW, it supports all standard properties for UART.
> > > Check what uart_read_port_properties() does.
> >
> > Ah, that's nice. I hacked up something [1] in the past to get it to
> > work, but that was probably before you added the helper. I never got
> > around to splitting up the commits and sending it out.
>
> Hmm... The helper is in the kernel for the past 2.5 years.
> Maybe you rebased it and it lost original dates?

I had been carrying the changes locally without committing them. I only
committed them recently to back them up remotely. So yeah, the dates are
not accurate.

> But if it's not working, we need to address that, I believe it should wor=
k out
> of the box, because the same function is used across dozen of serial driv=
ers.

The new helper probably works fine. I can rework my code to use the values
given by the helpers and give it a try sometime next week.

> It might be an issue in 8250_dw.c, but I can't tell for sure.
>
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/comm=
it/?id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
