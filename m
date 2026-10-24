Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849332;
	b=aZO2BmDhbvRk1DK7wLSt7F02H9FnkSuL3TFq/zSh+iy0h+ol0Q5hg+6kMuYFMHN1iDjh
	 b4ofIYSvdSdLyC6vNGwISDATMqilxnOrZ9RI7u9jSwbR+erVbW6N+vaG9zB23UJ+tBKjf
	 8QhZl6kJtK/oOy4yygi9zbvQJxg1hCwMdAoP64BlNwjw7XNRXhcsOB8WBVwM6c06E7Trb
	 Gj028hcdAXusIpHrzT6OfbRatQehKg/Y87SHyBpesgWB2IVh2Y0Vulx2yKDgGUarY+pfI
	 o//Vvkx1cyLKfNDjgK7wd7BFceABITYb92yN4/dx7QkXMk6QIpPyVEoKYCBE3hx0tCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849332;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VR4wE0obqEETTnkvc1cZD7oRkkv5XdPKp0vhsRHmEPU=;
	b=IfrlhYqismgeNz/lK5i5sHyBhf8BEvxbpqnK0ow2FvICw/MQdtxZrxCfqP9Ri/skOMX5
	 KwLB27z3EU3Ma62sPkb46ZbsFLjPoSzbrE/cf/4Rv8hV1PYF3jY49sNM04v9io/EGfPyX
	 +/QijKVOORLGzccaftmbYS4fSVhXM841rU/3x4JNx+9Hh7lncxfHwnc9E8aO9k+HgxJqA
	 UOAh7e+ODy67TlpXRutzri5+I+bTT/9RIncwt6EMAyu9cSfzhGXVjmXM0U+erOCNwgBqB
	 7JPpTeAoV4BjYsntx+jEAEORGw5/Z8G9wM5uU428JbxENNluG4b8cN5QDCOSywpv63Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbwoWAdP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434D0606A31B
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbwoWAdP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8361F031EA
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792849330;
	bh=VR4wE0obqEETTnkvc1cZD7oRkkv5XdPKp0vhsRHmEPU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=VbwoWAdP1jav4AQginmjgRlN4qTSlFXGRM6SdLPbsAU1bILpiEGmgDAA9EGFrwGnL
	 TPXJUwpgI0xCf+xr7Qp7+F+xNrj5UyUDYwwSAbBvEoAHVpMbIYqZUGFz+W2ODLq4+Y
	 ocwGO0vgNkShOXPj/9k1UXzs/3GiW0zfZ2YqCZh1Iip2tbSiUfM1JzQu+Dl0jQllhs
	 ZufPdxQ9bFabAx9x7kOmGrCNcEE5X0F1DnBUR7Lhoq85/KhJ4rW0yvQXpuAbIOiKd4
	 g/lbt8NGys8TUM5zh3e1Dy6ChPxghStytGUPhrvoJIr0HpeHm7nRvf1QhvDICvH5WC
	 orDsUHTArXnsw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab3dd9681fso13734751fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 06:42:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwiG0S1vkIIhMolEOJHurx9WOINuHZ1JaVeANndQ8kb3vBPSzXu6nbI7NgpTdQCzxWCIgkQWQhSdiPeLQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYL54zkj/NGQL0IEwCmRMKVarxk/zmZ76dc3tAI8ERFw3ofW2ZOr
	9PETJQcqwmlrY3A18ckx0d445ptJYfHEB7Cd7mV51vYknrtyhEs8WHkc76njKIureMRRgZZFxBb
	3UuF2CkzKzLaECoIuaesWYU/Ewm/NjDE=
X-Received: by 2002:a05:651c:a11c:10b0:3aa:f94b:842e with SMTP id
 38308e7fff4ca-3ac758f2ab8mr1313291fa.23.1792849329124; Sat, 24 Oct 2026
 06:42:09 -0700 (PDT)
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
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com> <atywVnHU5NsP_gOP@ashevche-desk.local>
In-Reply-To: <atywVnHU5NsP_gOP@ashevche-desk.local>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 24 Oct 2026 22:41:55 +0900
X-Gmail-Original-Message-ID: <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
X-Gm-Features: AclHuK9FDF2lgZeM1hRUmkk4PVa4hWifzNBxVn4_Mwsx2Yyiyx2HnawGxsTc9R8
Message-ID: <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
>
> ...
>
> > > > >       /* Internal 8250 only */
> > > > >       UART_PORT_AIROHA                =3D 124,
> > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > >
> > > > Why? Besides the poorly chosen name, what prevents us from modifyin=
g the
> > > > corresponding parameters at probe time by leaving the one of the ex=
isting
> > > > types?
> > >
> > > The new type was primarily a way to reuse the core's FIFO configurati=
on
> > > table, including the RX trigger mapping. H616 uses thresholds of 1, 6=
4,
> > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4=
, 8
> > > and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > >
> > > The core already has get_rxtrig/set_rxtrig callbacks, though. I'll re=
work
> > > this to retain PORT_16550A, supply the H616 FIFO parameters during se=
tup,
> > > and use those callbacks for the correct trigger mapping.
> >
> > Please consider just taking the FIFO size from the DT. On some chips
> > not every UART has the same size FIFO, so we already need to deal with
> > it.
> >
> > Also, FIFO size is a standard UART DT property, though somehow not incl=
uded
> > for dw-uart.
>
> FWIW, it supports all standard properties for UART.
> Check what uart_read_port_properties() does.

Ah, that's nice. I hacked up something [1] in the past to get it to
work, but that was probably before you added the helper. I never got
around to splitting up the commits and sending it out.


ChenYu

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?=
id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
