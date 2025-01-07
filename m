Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1DF1DFE1D
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736251453; cv=none; b=lm340//piDoGpvoeOrW8jACxWHGysAVDRjK/Oah+yxXiQ9nSIemna7xeYbnD064PgnOuGq44/LI+z3QLvoytZEhG+y/nzy/gPe3bTUcnwklRUZWabRFoR4NalIYfR9VEX0XCIpA+YjBJAVLY1b65cN1hn0Z6GbMpI/5jWhcXk1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736251453; c=relaxed/simple;
	bh=+s84Mxs/ltywI/AN6NGNeB5Lu6hsMHgJe9TMhknhmjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxnuQGhZynE0Ap4SRdx1CV96g6SZX01DdAS/3m5b3JefH6a0LsmcgBZ4dwyDEcOAjBj/ZsbcyT5zhX62xuvUCXkNFKfH9ziRcNbKpt6c0MtyFEUcgDlq1zDxovJ4Nj2OBZzFlAz1tmLsjBbaQlw9Hy2H99l9ZHNzP0jTaOnQaco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 95A0D1F0004F
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 11:54:01 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 31C79AA1107; Tue,  7 Jan 2025 11:54:00 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 6670CAA10EA;
	Tue,  7 Jan 2025 11:53:58 +0000 (UTC)
Date: Tue, 7 Jan 2025 12:53:56 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <Z30V1KzhqY2drhmm@collins>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <CACRpkdbqufNVq4Ai6GQpgK2OY0rxLnp1wLQNmRoCv44T0xmFkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xRZh+3L9eSSC0byD"
Content-Disposition: inline
In-Reply-To: <CACRpkdbqufNVq4Ai6GQpgK2OY0rxLnp1wLQNmRoCv44T0xmFkQ@mail.gmail.com>


--xRZh+3L9eSSC0byD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Le Tue 17 Dec 24, 14:39, Linus Walleij a =C3=A9crit :
> Some discussion here, and some emotions involved.
>=20
> I can't seem to follow the technical matter because of all the
> social matters :/

Thanks for looking into this. It's a bit of a heated discussion but nothing
personal, really. The context is that Maxime and I often disagree on what
constitutes ABI breakage or not. To be fair he has already proven me wrong
in the past and I'm still learning.

The debate here is about what the default behavior should be.

> On Tue, Nov 19, 2024 at 4:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base=
=2Eio> wrote:
> > My use-case here was hooking up a sparkfun sensor board by the way,
> > not some very advanced corner-case.
>=20
> Are you adding this as a DT overlay or by modifying an existing device
> tree?

The answer would be an overlay. There's no device that I know of that has t=
his
sensor built-in.

> Does this sensor have an established device tree binding?

It is underway. You can find it at:
https://patchwork.kernel.org/project/linux-iio/patch/20241130174212.3298371=
-1-paulk@sys-base.io/

Nothing really stands out and the short interrupt time is mentionned there.

> Are you using that sparkfun sensor by a kernel driver or from userspace
> using the GPIO character device?

With a dedicated IIO driver currently under review.

> I noticed that the sunxi GPIO driver is implementing the
> .set_config() callback calling gpiochip_generic_config,
> which makes it call down to the pin control driver to set up
> the pin config.
>=20
> which would in turn make it eligible to use
> the gpiod_set_debounce() callback to push down the debounce
> period.
>=20
> But pinctrl-sunxi.c's sunxi_pconf_set() does *NOT* implement
> support for setting up the debounce, because it is (as I understand
> it) not part of the pin config hardware, but part of the interrupt
> generator hardware, correct?

Yes I believe this is correct. Debouncing is said (according to scarce
documentation) to be tied to the interrupt part, not GPIO in general.

> In that case I think we the gpiochip .set_config() callback should
> be modified something like this (pseudo code):
>=20
> sunxi_pinctrl_gpio_set_config()
> {
>     if (irq_is_in_use && param_is_debounce) {
>         modify_irq_debounce_according_to_param()
>         return 0;
>     }
>     gpiochip_generic_config()
> }
>=20
> pctl->chip->set_config =3D sunxi_pinctrl_gpio_set_config()

I didn't even know the gpio API supported this, thanks!
Then it would make sense for the driver to specify this.

> Maybe the debounce can also be set even if the line is not used
> for IRQ? I'm not sure.

My guess would be that it can't.

> In either case the latter would give the GPIO driver a handle
> on the debounce, which is good because the irqchip
> generally does not.
>=20
> There is a way it is possible to use the interrupt with desired debounce
> setting by first getting the GPIO descriptor and modify the debounce
> setting and then getting the interrupt from the GPIO descriptor:

However I see the debounce time is specified in microseconds, which is long=
er
that the minimum achievable and probably too close to the limit for the sen=
sor
board, that generates the interrupt for 1 us only.

Is it specified that a value of 0 to gpiod_set_debounce would select the
lowest debouncing time?

> struct gpio_desc *g;
> int irq;
>=20
> g =3D gpiod_get(dev, "dataready", GPIOD_IN);
> gpiod_set_debounce(g, 1);
> irq =3D gpiod_to_irq(g);
> ...request irq...
>=20
> Here I assume the line out from the sensor is named "dataready"
> the actual component likely has a name like that for the line.
>=20
> This requires changes in the device tree as well, so that a GPIO
> line is assigned to the sensor instead of "just" an interrupt:
>=20
> sensor {
>   dataready-gpios =3D <&gpio 14>;
>   ...
> };
>=20
> instead of:
>=20
> sensor {
>   interrupt-parent =3D <&gpio>;
>   interrupts =3D <14 IRQ_TYPE_EDGE_RISING>;
> };
>=20
> Unfortunately this is one of the areas where DT bindings are
> a bit ambiguous. Some just assign the GPIO line as an interrupt
> as both APIs are available, sometimes a proper GPIO line is
> preferred for the above reasons.

I can see how that would be confusing indeed. And the same change would be
required for pretty much any driver that could have the same problem.
I'm not sure this is desirable.

Would there be a way to do the opposite and grab the gpio handle from the
irq line, as to leave the dt binding unchanged?

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--xRZh+3L9eSSC0byD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmd9FdQACgkQhP3B6o/u
lQwcQg/+Ndmwb8VrccY6tawNQpK5eGLmJmz1NgNtHOo4qcVATn/0LmykSL/URVDT
fuGWhuw3kUW63a4GM10bENrBK4aNGYQXr9wSAvAael9BKN8C2M0WFrA+ReJF/MsC
YQ+99dsrxro0ll+pvznyF3LnknuZvETSsf71VAd0/58Lurf5rm4bPHWfCGnOrbA2
hkhD+amOJ3oQFOePPfbPeaXYXY5HtWXWAXXIeDxiEuDTi0WROqhkNiDJBStxxvfP
libWE/sZ/kApI4UFaDMB/4o5/F6keLBSnfmWaxZjWvjNVPXhiR85RNNV7miScjed
ag8qRoJs2EZDXqzOdmkgaC6CfD8KWmNtEf8G4ApZLHlICiT9Xgto3VQxCTKQzGLG
g9lv8l5T1E3GG9+dTS6b0vLX+u9a9f+YUZJKXShbSbV02Svpka5NhUf16lhZgDVk
VRyWB6xHYU487ax1Xqvyz4gyjFcaBBylJd0HNMKiTg8ONJKG67zRkEZjSkTsY18+
E3VsqcfhaWeQZ7Q1RUqDHf/n0M5iiG3l7Pyuf42CIlHKRiKL6LA4hc/iSToJMgda
RTTr0p43M98uGlmJr5inA/1jgisGFATiKMAo9ScW59CwwS9lSE1QpLXphNzkRQvb
AwydKynKkgc16BB6YOhTsTcH/3/HWb6380JF+rXfeC0r0W1UiXM=
=/RiD
-----END PGP SIGNATURE-----

--xRZh+3L9eSSC0byD--
