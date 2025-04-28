Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516F2949ED
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745867137; cv=none; b=R/foI+NuzdZYcIZJH1jZUmihM/Hcsm7VnfEBeFbVoDhpwKPP8MqKwhLipChfXsNRlsAQX7Bq6/LhLV2r2iPC8d26O+HcUqCRWGYoelxB0z2oht+6XHBnp+Qe0+3JefVfZKH2mG6VvrpgZSuBGIY7BSy2SM4p4v/2SdXlIJc8ydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745867137; c=relaxed/simple;
	bh=WteJzO/Z1DzRQW8fq91N8pv+4i0P5V6n3lJEseim6lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQlbcd6JyJtNBda4VoSsbf4HH3LlIMM/v2ifYTB3xIKgcBRUBaq3lmhofyyxfaoMYEwoQUfn9ZXw+L8MOs27bo4VEk2w5nWUwO6OkZ/fOuxNTa0XJwlm+mVbd2h1MYmm4NtaZTjtlwjozp4NQibrwVB5GzEDKOOw7skAYjBXzOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=p1Uqohh7; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="p1Uqohh7"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2c873231e7bso3466850fac.3
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745867135; x=1746471935; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iz5tHaDCtivElLxBv0r1K5Hvs5E1kpZaNW+5X33tlwo=;
        b=p1Uqohh7qVBN2MMTpKsuJUlg+RXwSFor4RB2ZWn0vpVqR8Y465Ew9VrvUrP0J6lzif
         UDcDoyVp+2wTC9lGbW+bnL4xPntv1Fy3uDUJtLzgT1JuJQa7yKV5Xsqk8EXCVlrswNOY
         DBN0NAJKO8Ur9XUnZx2mylq415QT+Cw2a9bgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745867135; x=1746471935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iz5tHaDCtivElLxBv0r1K5Hvs5E1kpZaNW+5X33tlwo=;
        b=b3Xb26kI2WSQ2qnesV5qpmUplS1gi2W5bOpHlGG3IbUbokaSIMoH5zqop9QLHTRv4v
         gQETv/dPfcpZDE66fqepN47ehAwclS0/GsAu2vGOpAWiUQ3F7LATB7sPPUIfdW7d6ZCp
         wtZlSwcb5GkwQn0D/0TeK841RIHYBQ7NIK4+mh8xCxH5kKtJLod8PMqp2Twaiusto1Is
         fBMHmYVCW9yhGkzcDM8L0BT0upmUhsaHpgi5piGKpPig7VUACcnCrPgX0Pmu61mKH2gA
         iAnNCsL0jk5wVp3s0t9ClhHrWYLrqeGNo30U6hJ1tXH8AFlxv8HeFhX7X5IQnLnBIrR2
         3OyA==
X-Forwarded-Encrypted: i=1; AJvYcCUTDz7YEGldZnjQTmBCWMYCOAgVmcgdm/3vAEdgX7zr2L9PbkZjuk10pIGir8ENbUZvXED2PFYZ1WYFlw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrqu4AmJPHa8v2NDREqizGa6ymU6/to2vf9KkVVqNCyS8OtR47
	th4lcC7SZCZuTsxeXGW7MYbzAm1bMvvnqKZqY8G5/hP8UkloTmOw3QPQA0Eqn+I=
X-Gm-Gg: ASbGnct2dnmrJcs+47OoFbrKWQ4F65+cCpXjW/ymC+SeL3vsn7F45unTTV1489KSSKB
	71ISmVRrqYb66eYeg1k7xrdFRy/Yt6EM162+S6zDJ7g6F8uBKLtmYMMtl6pagj1mO0tT2YpPZ8D
	Pntv5RpuzD1jrWiwCaCRa79HN11JtUtdIBvSgAbh+cTGP+VuopfkAK0jdZBkjjugfVdxcz7fxxw
	Vm9oFh+dxypHyZB2KLWmk++c4JkPwBySvgSLmWHsqRnGl0sCHpc4KzB/RwFdrU4ehoFduboNhXu
	h9WOuBOKyb5rea7h7AG5jHVXC5u9XtBC8TOxI2RhHhRADVGfBq6N2zR7XGruAvxzJykt4euQHTx
	6hg==
X-Google-Smtp-Source: AGHT+IHn/p1YAF7unHdWhSvQ4pt+yJIK+0dkJUyk2kaAP+WvNQKGn9Ni3/g8IX/XACswbmQU9YBW9g==
X-Received: by 2002:a05:6871:4d0:b0:2c2:5639:3a4d with SMTP id 586e51a60fabf-2d9be93a4bdmr5542427fac.38.1745867133551;
        Mon, 28 Apr 2025 12:05:33 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-205-42.totalplay.net. [187.190.205.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d9737e77aasm2442612fac.25.2025.04.28.12.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:05:32 -0700 (PDT)
Date: Mon, 28 Apr 2025 13:05:30 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: Pull request: u-boot-sunxi/master for v2025.07
Message-ID: <20250428190530.GF5495@bill-the-cat>
References: <20250428150907.206134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9CkmJfo5L3Qd/xge"
Content-Disposition: inline
In-Reply-To: <20250428150907.206134-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--9CkmJfo5L3Qd/xge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 04:09:07PM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi/master branch, containing changes for the second
> part of this cycle's sunxi updates.
>=20
> We have improvements to the reliability of H6 and H616 DRAM
> initialisation, hopefully avoiding those occasional size misdetections
> many people reported before.
> Also there is some modernisation of the USB PHY code, to use DT provided
> regulators and GPIOs, instead of relying on this being badly duplicated
> in Kconfig. This also happens to fix broken USB operations for older
> boards (using the A20 SoCs, for instance), which were clashing over
> grabbing some GPIOs, leading to a driver bailout.
> There is also some rework of the H6/H616 SPL clock code, to prepare it
> for being reused by the upcoming Allwinner A523 support. This drops the
> usage of C structs to model MMIO register frames, and replaces them by
> using an addition of the base address with a macro defined offset.
> Also in preparation for A523 there is one fix and one addition for the
> FEL code, to prepare for the GICv3 interrupt controller that the new SoC
> uses. And since this is a simple fix, and was ready, there is also the
> watchdog driver for that new SoC. Finally tossing in an easy fix to some
> H616 defconfig files to enable eMMC.
>=20
> I also use the opportunity to enable proper page table protection
> (observing read-only and no-execute attributes), support for which the
> arm64 port recently gained. I didn't spot any issues on my arm64 board
> tests, but it can be easily disabled or backed out again in case any
> issues arise.
>=20
> Full support for the two new SoC series (A133 and A523) we are working
> on is not quite ready yet, but might follow still a bit later if
> progress permits.
>=20
> CI passed, and boot-tested on at least one board with a H616, H6, A64,
> H3, A20, T113s.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 5a0a93a768487e55ebe50a34cc90d751bf99cc=
56:
>=20
>   Merge branch 'master' of https://source.denx.de/u-boot/custodians/u-boo=
t-riscv (2025-04-25 13:13:17 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to d5837bbed841889428379ffff3cc19c9dca4cb6d:
>=20
>   sunxi: clock: H6: remove struct sunxi_prcm_reg (2025-04-28 15:03:28 +01=
00)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--9CkmJfo5L3Qd/xge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmgP0XYACgkQFHw5/5Y0
tyyqmwwAmvyC03pAvAaqZzRpeEebVesdI5x0wn6tFk7CfBhZNHsdu2F8g+9OK1vK
npjs3gV/QjyPdZJTsAAlk281awIydokUNbnZPFbXKcFBZkfOD4chNm/8RJdT7ZDg
gc0R1Lw1MO5yfQBPcEmPIGdhDgWCHtdP+c21RFFnd5YWyaJzFQDv5bV+t5WWfvKX
1K6qOQGItsg3rwRKXaFnRpfKR5xv2kcomfwgWbDi2T+ktuZ8YiLUMHgCt8w2d1DL
U4+/HJGy/87FtkN12i5Wwb5pUc7jBSa/vhSGNn+kz+VunGAv/PxIMg+51jbaFHob
h6peWAa1uFlZKYpItvwG8YqQPYr7j2jyb5uF4jweIq6qlH+wnh3zLKf52v2+9fAz
z5a0m8B6RNWWiOsQtOoY5MfV8o0p+pEUHcl40Ja4W9rvoJ2mlj9ml3vxKbzPrCES
wZjpX5OF79EPltDygmWbuwb0PiEtEaesgxLm0W/WkqP0VNfPew4xkXb4rZQK9dnI
OEodPs0e
=tqNW
-----END PGP SIGNATURE-----

--9CkmJfo5L3Qd/xge--
