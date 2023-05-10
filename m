Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908F2569C
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 10:13:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE051063;
	Wed, 10 May 2023 03:13:56 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 217DA3F5A1;
	Wed, 10 May 2023 03:13:09 -0700 (PDT)
Date: Wed, 10 May 2023 11:13:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Maxim Kiselev' <bigunclemax@gmail.com>, Icenowy Zheng
 <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Mark Brown
 <broonie@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner
 <heiko.stuebner@vrull.eu>, Maxime Ripard <mripard@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 2/5] spi: sun6i: change OF match data to a struct
Message-ID: <20230510111306.52e30f26@donnerap.cambridge.arm.com>
In-Reply-To: <1592f46b0f794b24a87a964d7208da68@AcuMS.aculab.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
	<20230506232616.1792109-3-bigunclemax@gmail.com>
	<702d085b3b814759a344886364c518f8@AcuMS.aculab.com>
	<CALHCpMh84Q8RAh2Y+cHzAvsm4h5zBZY=9fPF6OVmtLNvX+ePxQ@mail.gmail.com>
	<1592f46b0f794b24a87a964d7208da68@AcuMS.aculab.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 May 2023 08:55:27 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

Hi David,

> From: Maxim Kiselev
> > Sent: 10 May 2023 09:34
> >=20
> > Hi, David
> >  =20
> > > Is it worth doing a structure copy at this point?
> > > The 'cfg' data is short and constant and it would make

Sorry, I don't really get the reason for this. Since the data is constant,
wouldn't it make much more sense to keep it there in the const section,
which we need anyway? What would a second copy bring us?

> > > the code that uses it smaller and faster. =20

Smaller: Do you mean the generated code? Not sure that really matters, but
your sketch below hints that the C code would get larger, more error prone
(you mention yourself that you skipped over the error checking) and most
importantly harder to read.

Faster: Do you have numbers that back that up, or does that solve a
particular problem of yours?
This is programming a SPI controller transfer, which runs in the vicinity
of a few Mbits/s. I doubt that saving a few memory accesses (once
per transfer, not per word) matters even the slightest?
The actual MMIO access to program the controller registers already takes
a few dozen to a few hundred cycles, so I doubt that doing a struct copy
saves us anything here, in practice.

Besides: Copying the pointer is the most common pattern in the kernel, I
believe. I just sampled 21 SPI drivers in the tree, 17 out of them do
this. The other either copy the members of the struct into the driver data
(which would be an option for us, too), or immediately consume the data in
the probe() routine.

If you have some good reason to optimise this, please send a patch (on
top).

Cheers,
Andre.

> >=20
> > I'm sorry but I don't fully understand what you are suggesting.
> > In patch 3\5 we extend the sun6i_spi_cfg structure with the has_clk_ctl=
 field. =20
>=20
> You are still only adding a second integer.
>=20
> I'm suggesting that instead of sspi->cfg being a pointer to the
> config data it is a copy of the config data.
> So the assignment below becomes (ignoring error checks)
> 	memcpy(&sspi->cfg, of_device_get_match_data(&pdev->dev), sizeof sspi->cf=
g);
> and the code that needs the values is:
> 	sspi->cfg.fifo_depth
> (etc)
>=20
> 	David
>=20
> >=20
> > =D0=BF=D0=BD, 8 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 12:47, D=
avid Laight <David.Laight@aculab.com>: =20
> > >
> > > From: Maksim Kiselev =20
> > > > Sent: 07 May 2023 00:26
> > > >
> > > > As we're adding more properties to the OF match data, convert it to=
 a
> > > > struct now.
> > > > =20
> > > ... =20
> > > > -     sspi->fifo_depth =3D (unsigned long)of_device_get_match_data(=
&pdev->dev);
> > > > +     sspi->cfg =3D of_device_get_match_data(&pdev->dev); =20
> > >
> > > Is it worth doing a structure copy at this point?
> > > The 'cfg' data is short and constant and it would make
> > > the code that uses it smaller and faster.
> > >
> > >         David
> > >
> > > -
> > > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,=
 MK1 1PT, UK
> > > Registration No: 1397386 (Wales)
> > > =20
>=20
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)

