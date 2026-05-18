Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E062481246
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113686; cv=none; b=DKA1B+Z5RbxowI0pmo8HysaqA1Y5ThL3UQOYXYN2VjILSFoNfJSCtdx/DmpXQhy3JmZJK/L2F2FT9AzJ8xOIduFjEXIhlQl5mS196Ii7JIKaCfm/99lwq8u1WFk08alL/z/PFzyGHPU01GZVkAx0pfWsDd9RNV5crUTJUZwlQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113686; c=relaxed/simple;
	bh=ZgPHNxFeYLuFZ/hmvF0vBYpJj99fq4Y1mXbnP9/ld0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cbf6JrHakehszbyAsO9FSfxojBP3s4f80nq6L5Kw9HFp/71e/qXaItOFPlOzskovJLeEBZ/EMDDrHObpIfAMFGOJtockrbzUVR7fmRnBbPvJtM1teBRh/Mg0P53XG4JelZvUk9Q0cYbHiDA/TinFfaGDeYeg+Uy8G0zjyqPwL2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 659C41F8004D
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 14:14:43 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 32C1FB407F3; Mon, 18 May 2026 14:14:42 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 74C9EB407F3;
	Mon, 18 May 2026 14:14:41 +0000 (UTC)
Date: Mon, 18 May 2026 16:14:39 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <agsezxcxjQlBmesm@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
 <agr9m_tidBr6Cu2h@collins>
 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="13+JjIMW89tJHa3E"
Content-Disposition: inline
In-Reply-To: <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>


--13+JjIMW89tJHa3E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Le Mon 18 May 26, 14:09, Alexander Sverdlin a =C3=A9crit :
> Hi Paul,
>=20
> On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> > Just in case you missed it, there was a previous submission for this
> > board which wasn't followed up on.
> >=20
> > I also have one of this board and wanted to respin support, but it looks
> > like you beat me to it :)
>=20
> thanks for the hint!
> Do you mean this series:
> https://lore.kernel.org/all/20241227-a133-display-support-v1-0-13b52f71fb=
14@linumiz.com/
> ?
>=20
> I've missed it indeed! I'll look into it!

Yes that's the one! But I don't think there are features that your
series is missing, as long as you apply the suggestions I made earlier.

I also have a U-Boot config ready for it, which I could send once the
device-trees are merged on the kernel side. I could send it to you if
you're interested.

I will also get back to you about your TF-A series so we can move all of
this forward!

By the way it's good to wait a few days before sending new versions of
patch series, to avoid overwhelmind the developers.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--13+JjIMW89tJHa3E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoLHs8ACgkQhP3B6o/u
lQzxQxAAj+POVozr8ILWTwBBo8K+9u6fOAhaIvVBK9Gh6e6QwQNxajiypvE+Ycbv
dsdYblGjo71iJlVVK/zbnzKA/1ISAjszLEMeKA5klCl74P8l7ev3rWtetQECbg91
8Ntww4kc9uDVuIDRpgRfkR2RFch1TMnPHfOPKY3k4jGJMIfLaOAhxCpcrclEmhov
Pl/IvFc8R3z8EpdAhrsa9yEcrboK/NpUH2Ja6SlYZ2KNceoTfnMl0kBFKJ/njt6k
XKe4nglJ5u6nHlnScCZDc/4w8tiOkBPAhV+IaEQ5qgSn9Y6At6d6NG0+/e7IETGr
0EN5Xv/CWoEjFpKNSiC59ar0zRm9nF028wficzJsM5+dLuoHDXxwrl6zoObEzu13
1VihUwQmzPWDZb00ZBSq6FPlmfLXzNqMz93hPe9RHqdyg1v61N6aDSl9+UQS6v4i
sSblUNGlnoIvWf5FaFmEksVxutLGVZstQBoxzVYQqOA5Ck67c/ImuUCzdF1iAn0n
x2BfCz37xh3IcvHUYYVcKmpO40OAYSypvYQDHz8WCacmnSBEUJVfgaLoqmRdOBxe
c6d7pCjgFsIP0EysryqtUX/PSot2BdsqdHvmO5ckiRGf9juZCPWEcoHNhu2geEI6
rho/+QfaS4RVA4E8SXUgqzqj5f0q5P4vWmcrDst3NLfj/EHQA3o=
=1xn4
-----END PGP SIGNATURE-----

--13+JjIMW89tJHa3E--
