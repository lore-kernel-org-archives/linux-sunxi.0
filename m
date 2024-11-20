Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7317836B
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Nov 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732097162; cv=none; b=laSFfuTl01rgHQ+Qh9aGsSSP4Q/qP5IW+nGnj8AfSweM3OiVHsDs9JaqOHz8D/oPIbgGY0sqhnhS/uBbTAYSq/UpgAQFveqMoPIMulGUOI4PZ+pElxiapIDVauiGBjm8gFb/YSmxZYviqOcKmcJ4TNehbLm3D6bkue4tGQKzXRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732097162; c=relaxed/simple;
	bh=dd428CXBDTjHrrnAJZKziNKjueoKbD3ItkypPONoNGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULlAxI9X0xNSCcgeEmtz09y/It0/b1fkO3u5GTS/Gj1wF7kLJdzJDsNmvZg3wJ/wY9O6Uo2wHFl5ku3DoedyFJYfKnlI1QarICl7/TE5A2DtF5A6otAQ0YrON5jyIwfd1nRsl47OWGfHOfUjv7VRh3xbg5nNuwQpKCk5jevJUa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 294511F00050
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Nov 2024 10:05:52 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8B9C3A472B5; Wed, 20 Nov 2024 10:05:50 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 18C00A472AD;
	Wed, 20 Nov 2024 10:05:49 +0000 (UTC)
Date: Wed, 20 Nov 2024 11:05:42 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <Zz20dquzl5_2_3TQ@collins>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <20241119-vivacious-optimistic-squirrel-a2f3c5@houat>
 <ZzzdT0wr0u1ApVgV@collins>
 <20241120-wild-stimulating-prawn-ffefb7@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ghTuBK8ae4AVwyp"
Content-Disposition: inline
In-Reply-To: <20241120-wild-stimulating-prawn-ffefb7@houat>


--6ghTuBK8ae4AVwyp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le Wed 20 Nov 24, 09:01, Maxime Ripard a =C3=A9crit :
> On Tue, Nov 19, 2024 at 07:47:43PM +0100, Paul Kocialkowski wrote:
> > > > In any case I don't think it makes sense for the platform code to i=
mpose
> > > > what a reasonable period for interrupts is (especially with such a =
large
> > > > period as default).
> > >=20
> > > So you don't think it makes sense for the platform code to impose a
> > > reasonable period, so you want to impose a (more, obviously) reasonab=
le
> > > period?
> >=20
> > Yes absolutely. Anything that brings us closer to "you get what is real=
ly
> > happening with the hardware". The sunxi controller doesn't allow disabl=
ing
> > debouncing entirely, so the next best thing is to have it with the smal=
lest
> > period.
>=20
> That's an opinion, not a fact.

Yes and I'm trying to explain why I believe this is the most sensible opini=
on
here. I'm not saying everyone *has to* agree with me.

> > > If anything, the status quo doesn't impose anything, it just rolls wi=
th
> > > the hardware default. Yours would impose one though.
> >=20
> > The result is that it puts a strong limitation and breaks many use case=
s by
> > default. I don't think we have to accept whatever register default was =
chosen
> > by hardware engineers as the most sensible default choice and pretend t=
hat this
> > is not a policy decision.
>=20
> You're making it much worse than it is. It doesn't "break many use
> cases" it broke one, by default, with a supported way to unbreak it, in
> 12 years.

I think this is exaggerated. Like I mentioned previously there are *many*
situations that are not covered by the default. The fact that I'm the first
person to bring it up in 12 years doesn't change that.

Sofar the downside you brought up boils down to: badly-designed hardware may
have relied on this mechanism to avoid interrupt storms that could prevent
the system from booting.

If that happens people can always increase the debouncing time with the
property as they need.

My point here is that the property should be used to accommodate for
broken hardware and that the default should work for most use cases,
including things as simple as an off-the-shelf sensor board.

That's all.

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Specialist in multimedia, graphics and embedded hardware support with Linux.

--6ghTuBK8ae4AVwyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmc9tHYACgkQhP3B6o/u
lQwTwQ//b5/fEXs5MceVNZECSEGGRsRCPeXKBJxJTKSzzU0G/5fYb7pOYwBALMUU
hNwu6/naY9STcTWXw7JcnwiLucbB+cUfdMM2E+9wIZjGX1SqDVi2AETX+tfDXSqz
/zenXv9tc0lNJdaF+eTp+zW4tNANIQIqtcUe8jn5EojzjBJNNBBulY5PeCqQxSpM
c+UZZDC2NGfy3wKkXw2uIbxBref4/qINz/QCkREUX9pX9nVJAPVl2an0lDgeHGu0
8VvQCMyVyaqjWcqhD8FvNoVCmP2r48Mg9suyyLiNyl94icWXCsLnqDgT380VeMuW
or/3YRfFNmyxc0UmKybEjiVyDv4EZNPnbgoTLzuNHeYs3k+jAQVxjH8SzEuKf/+Z
WO1ujWuv9nF/w7Q+sUiChNu+fqsVF7V+Zk0SyHsznUczy6OdND4dsIA8k+lv6Nhj
sOHl83QakOsLyFbQaSYfagfqVchkhChrLmYwpR++Je3zGBKJvP+1piLSq8LiBDQT
f6t6KScCJAqw7JN8dFbKuo51EUX5iW5niBe7Dwx5+CjumXQUFZHjRxqEiVUzGJ1e
d/iOHVO0eFV/HWrWOORE2GnhOcx2UPyudpfPQJoMoa+b2o0v4znCv3icaDwN0NaD
Kkr365Oez56+9DGeZiy5jTGd5PUEZCJrGaJdPjPMZ4JJL4/y/dg=
=PmWt
-----END PGP SIGNATURE-----

--6ghTuBK8ae4AVwyp--
