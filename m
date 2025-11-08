Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F29212548
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Nov 2025 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762624523; cv=none; b=tabXQuf7b7HMva++d/7sWbi94hsBTvoO6AAfSb3lIEwt3ObDTZt5IBl3Go7OEPKDZxT15v1vKF5SkWhEYV1YIuniStNJVb5qMTex81i13wXHatvVNKIkTMppn/gm8YjtfUnF1WZ5v9xlEnoDL+r7vRwMk/zJ+nRE9MsFt6DiOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762624523; c=relaxed/simple;
	bh=AbY63GC3AjHO1wuvaEg4Vt5sKwXTYLjdn2XK2t49b7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7OkJenlq6YOom99ZIL2ChVH1897AecFYARPSVq+sk1xtFdrcBMtQqDgTy0E6F7skO2KebuiCk/wb+6+3vUWV9aV5L+QMJVil2vhuVeVxial6Xp4xpp5Don0kfRaYXxl/QSP4RW2y+9bDDgiiwhCKF7v9+5mMEy0bM/fx8lCXMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=uIPtjmRt; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="uIPtjmRt"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=AbY63GC3AjHO1wuvaEg4Vt5sKwXTYLjdn2XK2t49b7k=;
	b=uIPtjmRtbncZV9ht9fCtHMNZQtacOYKOdDjpFbdaZ0v8+TQviXn9pAAkWHltSrA4juklIyymMUjSOXWa6cRwDQcOo6/E9Nk+yttoWgbn5GYCs3AkS/wjy6SYpR6ECC4q/7zLYBy0ns5LImpYgngqdFo+faz+IqiPC+kX2d27DG0=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sat, 8 Nov 2025 18:55:15 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Parthiban <parthiban@linumiz.com>
Cc: parthiban@linumiz.com, linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
Date: Sat, 08 Nov 2025 18:55:14 +0100
Message-ID: <3365142.e9J7NaK4W3@lukas-hpz440workstation>
In-Reply-To: <ef1596c2-d27b-4098-ae9b-168685799de7@linumiz.com>
References:
 <4693897.cEBGB3zze1@lukas-hpz440workstation>
 <2286928.tdWV9SEqCh@lukas-hpz440workstation>
 <ef1596c2-d27b-4098-ae9b-168685799de7@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3728784.aeNJFYEL58";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3728784.aeNJFYEL58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Parthiban <parthiban@linumiz.com>
Cc: parthiban@linumiz.com, linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
Date: Sat, 08 Nov 2025 18:55:14 +0100
Message-ID: <3365142.e9J7NaK4W3@lukas-hpz440workstation>
In-Reply-To: <ef1596c2-d27b-4098-ae9b-168685799de7@linumiz.com>
MIME-Version: 1.0

On Samstag, 8. November 2025 18:01:02 Mitteleurop=C3=A4ische Normalzeit Par=
thiban=20
wrote:
Hi Parthiban,
> Dear Lukas,
>=20
> On 11/8/25 5:56 PM, Lukas Schmid wrote:
> > On Freitag, 7. November 2025 18:13:13 Mitteleurop=C3=A4ische Normalzeit
> > Parthiban>=20
> > wrote:
> >> Hi Lukas,
> >=20
> > Hi Parthiban
> >=20
> >> On 8/1/25 10:33 PM, Lukas Schmid wrote:
> >>> I=E2=80=99m working on enabling secure boot on the Allwinner T113-S3 =
(as part of
> >>> preparing my SoM design for EU CRA compliance).
> >>>=20
> >>> I=E2=80=99ve successfully fused the SoC with secure boot enabled and =
burned the
> >>> ROTPK_HASH. The SoC correctly boots a TOC0-signed image from SD card,
> >>> and
> >>> U- Boot starts up and behaves as expected.
> >>=20
> >> Could you please share how this is done or may be with a document patch
> >> to
> >> u-boot? To add, am also in the initial analysis of adding secure boot =
for
> >> A133.
> >=20
> > I actually do have a document on how I fused and flashed my prototype
> > board
> > here:
> > https://nagami.readthedocs.io/en/latest/software/enable-secureboot-on-s=
oc
> > /
> Thanks for your response and link to the document. I will check that.
>=20
> > The required changes to U-Boot are already in a Patch, but I haven't he=
ard
> > anything back yet.
>=20
> I couldn't find that patch in upstream u-boot mainline list. Could you
> please point to the series / patch?

Actually it seems I did not send them yet as I was waiting on another patch=
 to=20
be sent.

My changes are available here however: https://gitlab.com/netcube-systems-a=
ustria/u-boot/-/commits/next?ref_type=3DHEADS

Best regards,
Lukas
>=20
> Thanks,
> Parthiban
>=20
> >> Thanks,
> >> Parthiban
> >=20
> > Best regards,
> > Lukas


--nextPart3728784.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmkPhAIACgkQJnN+drMV
RtijAwf/SVwXj+DjDHbS0P2HGWfyKCKg+obEdq5eItVm5xQlAlG4cvGNDupFT383
//0iam32OqSPV/4N64B6IaOSzGuppldkE8S9Z7nUJMbLh9oLT81FqwZisGmZom/z
SRLu7xQzO16RsGNhfbynByvIDGPGp7ls0W8LW8cf6ewPXA5DnCino1tluycEdxMM
E6nN9ey8gXotU9jGyJhXAM7u3HSB/H7Q0GH4Ouzh57v1PbWGVFkOKFaV/RPkWhoG
pVPeQjbMGpZWyH58UVT2a3b1EYUnGv69MrCwE+kB2CK5BGKhML4oMSIveAkdFbd0
s8PzUhgv+A6AHjn2Db1Ll1tfNsQ0Ww==
=YVrp
-----END PGP SIGNATURE-----

--nextPart3728784.aeNJFYEL58--




