Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F211D555
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Oct 2024 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914546; cv=none; b=PRIOdiZGJTYXdWFLNWlOjDnNjq/DDeoa+LebMn5Z9peveuI0v7vt5xcbcD2/0woNLjk35XkOCIoEzVIhemb2QxlfHiW2F9rckKcXp46k8EMt0l9xK2ZuyCoTL15Rklz6GmdBe7paiKSZelFruLW3CHPbfOR1u1T8nfT0RUWQ2Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914546; c=relaxed/simple;
	bh=YdYcqPwCumiE4TgsNZWwHnEoZpR6e2uQCBZJ8MUQkyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8lVbNs6+yHNvxjFpLgGGRheuYJ5HNubQfcKfyH4oasI8+cxS8CQ9UQc87wpo44vNKHlUoGl8XBRfuLz0YKcWXNslmjV6DQuko1YKCeTyNSUkvIkwM/mRNCkQDBNlyHyDwUeDSScvRK0P8Yk5l/53c2kGyza9e/Ddn+qPb3KUB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=P/tZD5Wv; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="P/tZD5Wv"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-460407b421bso34760401cf.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Oct 2024 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728914544; x=1729519344; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CRg3px5Vm4PCD3AGLY3YI9272buzsF7rb9/f8u0K7ME=;
        b=P/tZD5WvbE1Be8UHywLLf9pLWWHA1sTjW2Qlt16No9dlwOAbLsTB/tbzTd1bhfUGa7
         ZHcY3kF6undH/FcFTgavI2V/n+UZOIycFpLaSwL04t9kqKvMbI7mw69TShqdgrW0Auy6
         Tr7mXPmUcTfTlbh+Oyj4z0It1X+IQKz2aZmVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728914544; x=1729519344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRg3px5Vm4PCD3AGLY3YI9272buzsF7rb9/f8u0K7ME=;
        b=HOETbIpAYEuxSqsDItUTPHLj5TsCYfZgRe6nfGkMVE/HDNHztAQzCBPiEqcsrppM4x
         QjANCZLV4QhO/nghIG8ZudVMPWTIVPstVQSSwm8itIOqzWEZTXH4bDQrs5PukKN6Ao24
         16SO+0uSanV8eCSKdViVl3f2crmhMqWX5ayn7K0zP3x/SsRaGLUpUNDia9JFPLOeBvtl
         qNJ/V9xdtrBVFoKT9Tx72bYVPDWR0RwT6xNHx8CWwdFzO2u0kDZ6szm/heXzY4gpsres
         zrQji5xg8XVD3eZfP+v+AQiFosnvAme0YM9g21ISfhsIxryNIJrY2B7VXS7GstVizRM7
         CQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCVsnbMWQC8sxELtph7GSy1X9zsDxLJaQSs2iBIS+Ur2kceYgZRzgkwe0jGocZXglkm3pr1l6BPlIQCXAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvjAQxXIOyQrtf9xewK4BEBNPViPgi4Bb3PfB67iVZU/odQI3C
	8krMpLsBehSLRD+Nvs+zRaHYA/MEo+/Z1MSxKZcen+Ns63eayuy4IRYPpZBG0fs=
X-Google-Smtp-Source: AGHT+IHK+kOTgWX0R2Y0tnK+9I1V3NhCOCv5wJELJdzKyItVQ+PvA8TIYd/VMKaPMUg7NfRm9GfOBw==
X-Received: by 2002:ac8:5708:0:b0:454:f384:41e7 with SMTP id d75a77b69052e-4604bb94ef0mr163044181cf.8.1728914543576;
        Mon, 14 Oct 2024 07:02:23 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4604288204csm44827061cf.61.2024.10.14.07.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:02:23 -0700 (PDT)
Date: Mon, 14 Oct 2024 08:02:19 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for 2025.01
Message-ID: <20241014140219.GG53053@bill-the-cat>
References: <20241013234531.9990-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="44WtwmuqlpcUvbQr"
Content-Disposition: inline
In-Reply-To: <20241013234531.9990-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--44WtwmuqlpcUvbQr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 12:45:31AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the first sunxi changes for this cycle:
>=20
> This switches all boards with the Allwinner H616/H618/H313/H700 SoCs over=
 to
> use OF_UPSTREAM. We are doing it for this SoC family only since the DTs
> between the U-Boot and the kernel repo are exactly identical, whereas oth=
er
> families have one compatibility fix in U-Boot to allow booting older kern=
els.
> Other will follow if this plays out well.
>=20
> The biggest chunk otherwise is adding support for an Anbernic game consol=
e,
> using the H700 SoC. For that we need to enhance the DRAM support code, and
> pick two DT commits from the mainline kernel/DT rebasing repo, followed
> by the defconfig patch.
>=20
> On top of that two small fixes for the old Allwinner A80.
>=20
> Gitlab CI passed, and I booted that briefly on some boards, including an
> H616 and an H618 one (with LPDDR4).
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit f8efc68b30e29360f7a419fe4968432179d736=
8b:
>=20
>   Merge patch series "spi-nor: Add parallel and stacked memories support"=
 (2024-10-09 09:02:22 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 2f7ab49644ed38b6e3fe5eb6cd3f7e3f683fc6a7:
>=20
>   sunxi: Add support for Anbernic RG35XX-2024 (2024-10-10 00:43:51 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--44WtwmuqlpcUvbQr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcNJGsACgkQFHw5/5Y0
tywZ0wv8DtDEROcCim1F8RhF11fDbOgU2pBqr7nLU/2iy7qGrEn0EWwSglkcdF1c
MnrVGwAro5X9OQ5VNyUdVcXH8cf+8X/R8NiJfaaLvuU81fSYfBwbmVMLNsXPi/w+
8lPQPwPS2teCDqKEq+zOLYJE+/38myNNt77SRzx9Hf/XZzCvNfMTKTP9XfPkICDa
mDmsf/It68C81RpS/hwaCxXrSlKEECjt6fh5R9CO4AJmnnsprqANQxoTP0+S2sJ1
zVfVaKwXb1YbZ0oA69zWsmOBag0kjQPHZ2yFEnbedyP5/StyCgnf3c8z5Aq0RlJk
srGKpK0y/nfyC9C1r2co+gMbB8U0E330P0/pvCQs2xwKMQtdsP7xuskl9VXGCoQU
ZSeJLf/1KPfH8jFVdPvfY0KU43r5AijjljrnymVRDxDB1lS9rfoDAHiDeUzo6Dov
4HO1HXH2Bss23p5eRxLitdJvZWAl5GAVOmq1lgCYbh/cSkhEpbx83huUOnZhCTQZ
Va0ceY12
=hXGb
-----END PGP SIGNATURE-----

--44WtwmuqlpcUvbQr--
