Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E894E770F3
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Aug 2024 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722969795; cv=none; b=BU/gQ+B3v4wvgvDKAoIcmoKT12UHSq4Q+nRtSqRcsRhfe1omLtSB5KgVmsyq7LNYPwffmGw91/OPqnGNT6RjYUbNreNr567u6iFTzXA+TBnXKL1ptWCy0R4mmIZmtp7MFd5jWYRmz3lM/PTgBHqYptpKgEsIhGANBuLNAxJWFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722969795; c=relaxed/simple;
	bh=9eNmcV41W+JpeA4hCwSJqcT2VlMToj6jLxgKZ2UIm88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7P6xHLgpEUyhnRII+YL6oDLOuPI8Af7+CjNPax0Ou6aw66cbh5RoZ9Hivm6773L/UB67wTFWB9dSp1nhKEhF6wptPYyFYTvqIRA/blKRZueBlfnfEqchLf3H2Smet4FA12ZiKz2cw7trbuBk29arQQnbgBTQ/PI9cOoZHTq2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=DQs425iC; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="DQs425iC"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3db14cc9066so585803b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Aug 2024 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722969793; x=1723574593; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JArR2yQOZWtc6vxUgeCrolCu9ejWxpad3Heh3R3wDjI=;
        b=DQs425iC72tbLjjxQ5HOElEcd3Vx5hjfvJBLE0AJM4nXVHbFJxaIO8DMwSCKoPqw9k
         genP2KI4/KF+OvfPONR962YzN6SOOsZ5leMkJzk4HZH1BUe2Raq9Yp2KIYIOBlP3L+b9
         TwNvwzR/nQAthrTNAU/xWokmFDESF6mZx61K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722969793; x=1723574593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JArR2yQOZWtc6vxUgeCrolCu9ejWxpad3Heh3R3wDjI=;
        b=EvlHtJ+YB2KOkAlKtnyCBMoZE75U7J1tf2wo5sH1BCk0RbGdgCrMwktDV0gw8enBan
         BupFC6kJeM3S349av38tbEpf6hCzCjusLhVAkuOMDQcHhzymSScgnQV772mHkAGyGo13
         nVS0WCE2VJpDQF1AnYq7X7BimFdbGMe3/6FQsxkmegwBgMIQi8jkscIOghQY24FgzPv/
         YTznjwPyqn6JrbCFm0r1i2LsC1vSWx8XS+pGz0j5NTbNUajeOm6JfLlBA7WeeGzN9VHV
         Fz0D3fd18ZiTHIny4bW5OCwN+UrFAXLCMMVQEjNjNQIGCunVKVXxCCXdFaXZRkmQq9eC
         AAvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcqQUtznYTh+iOGFXPvNZ2pIHaaM4ueGgrDH92E2u61h2fAYFrk2CK5w6Vkjia793agjmBtbLrJE/vpbUMkIxC9GmQLN816lmbCEk=
X-Gm-Message-State: AOJu0YzR1bjn6Ek06vESq+pV4UKtIZk+v3m8z+X7rtNg3+yZ1q5Cs91G
	nWGAntSVxUY6bNBXq0C20A0OzFwsF0V+jIKqqOxuyre6R4qVrkIt5quOBEG0RJc=
X-Google-Smtp-Source: AGHT+IGH4z1NFL+5pj35HuwxeXjCkiXtwaP8ZeBC5PcUbgMwr+Vk0UtWH6ALxKlaaEqbx5rNs+/40w==
X-Received: by 2002:a05:6808:18a5:b0:3da:b36c:c702 with SMTP id 5614622812f47-3db5583b1f1mr20397838b6e.46.1722969792904;
        Tue, 06 Aug 2024 11:43:12 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-103-190.totalplay.net. [189.203.103.190])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db56361a1esm3609750b6e.7.2024.08.06.11.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:43:12 -0700 (PDT)
Date: Tue, 6 Aug 2024 12:43:03 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Michael Walle <mwalle@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for v2024.10
Message-ID: <20240806184303.GB1626301@bill-the-cat>
References: <20240806143823.1438437-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmCHRswCGQ601//L"
Content-Disposition: inline
In-Reply-To: <20240806143823.1438437-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--nmCHRswCGQ601//L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 03:38:23PM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi/master branch, containing some more changes for
> 2024.10.
> This updates the "old style" DTs to that of Linux v6.10, matching what
> OF_UPSTREAM is at now. Hopefully we won't need to do this (manually)
> anymore. Since this brings in the DT for a new board (Tanix TX1), also
> add the defconfig for that, which has just been waiting for that sync.
> There are three more fixes: two for the SPI clock setup, which avoids
> too high frequencies in some cases, and one fix to avoid a build warning
> with GCC 14 for the sunxi TOC0 part of the mkimage tool.
>=20
> The gitlab CI passed, and I tested the SPI flash on the OrangePi Zero 3
> and also booted that into Linux.
>=20
> Please pull!
>=20
> Cheers,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 6becf9ba1ab82af6f4fcf9f4d0da38f9c75212=
d2:
>=20
>   Merge tag 'u-boot-imx-master-20240802' of https://gitlab.denx.de/u-boot=
/custodians/u-boot-imx (2024-08-02 14:40:59 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 541a1649e74787682902d820d0b79e16bad69a4f:
>=20
>   spi: sunxi: fix clock divider calculation for max frequency setting (20=
24-08-06 11:20:10 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--nmCHRswCGQ601//L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmaybrQACgkQFHw5/5Y0
tyx22QwAqbxB5nk3vf8GsIGlcujGfqOlUeEuDcjIDhgGuvMLKAiKIjAR6o60qXg7
uUL/mNQ9KOnQrTcvHtWB7vGQMA4hurHe7UtiSfu4L+AsCvboa7XdzTiYwGJtFauc
sUm4aCNl3ftPZ9BKuRtNPaWOchunniMHuTQf4XZCgFlLXmTcMTv925YsbNQ6UAoy
xYdq+X3NrK1RwqcMfbFck1s5MIAFs6KdFWcR+gVg9I2GeBFWRfDG+PeRobwl5aDE
7TZpIeiEtjcfnGlc5WqDRhhufwd5uvTAGzEJqLqGZVSUrfUQ5CBXdudgL1slSrSg
72FSQfM1+UE4wdMs8YWCa2pPG5RQf4C2y03krsiTlZ24hpz8ZkmEXwaX5NWv17zZ
FvZFCK0abgAbFUYhp+XU0AdlRVFut97avdPdDPQoCsUj8XhWLnEwaV8gZwRAQ66p
QpC+Tp6l+s0YfkYup4NEAys0YF0W5O+uQTq5309NpsdoIE3azKuvwfhcimm+W0y0
OyXEe+J9
=Gw/+
-----END PGP SIGNATURE-----

--nmCHRswCGQ601//L--
