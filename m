Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7901CAB9
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Jul 2024 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721155534; cv=none; b=rYu5LRSRqX+3KJ3fSSs+Joq3wBg2+f5JETgROKWfZjQeJ+hkgbAIc4yI66HlSjcBYw6YltDTY6I3snw83SiI1H/ry+HBfJKpAOFhay9dhchcHXufDsV1HTiXIXVCCCEyOUpATRBu1CNe09t4d3KANvTtUfqabUkBMHpteBmsJoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721155534; c=relaxed/simple;
	bh=9ECS4fcyyA+zKb1MLbpL38yiHu/bFR+FT5mq4ef7LGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiOvvq0+fuOutBIeAWnYmYMFZLvOKLCp2HF32yUM2X6pXZOH8kfhbk29hNMa8OdyxZEoEkGwEMDH9rvZx3r7GBw/jJOoH2hJCRDl51ARiNycRwlKSU2VDE3F0jNEj5twqqB/rOXi5zR/22m4OL8rlFqvdWt9ZRX8eNWSin2cnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=GOYixRs2; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="GOYixRs2"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-25e00f348e6so3219115fac.1
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Jul 2024 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1721155532; x=1721760332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=egmncopyTsHQ/w5X+HEIqFZyngHARi1ikY0nG6xtZE8=;
        b=GOYixRs2IR5AddmwxuQ0ymWS8TlUYLrQE7/qCeD50MZCyA8h6uv5B38CYyk3NI2A1m
         ptfLoAb8XmZhavl494pDDBSxDJJC7m86j60VoPsm+nLy26tvPTjjqob/chVfnLFxkh7Q
         i2LH8//IXu5Bekz0bYwutWjVN52eUjtmOSPYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721155532; x=1721760332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egmncopyTsHQ/w5X+HEIqFZyngHARi1ikY0nG6xtZE8=;
        b=AyZQ1SR5I2fY8kmjeahswMhkccojmkHgtLDL2zthmkIeYI3ODaKMhymxic4wu6OX0W
         qTl5jHBTPvMJWJVTUVUa/IwftNahpcDSzFE1IQF8JgAKKppZw9gdSD93w68FBs0UR8vY
         qNLXIel2y5xWJV+b9du4ZNZbP1UsJgoLD5deb6W5HgYhg4QplKk40sUvLqgM+MjseNEG
         8VNo36HGssHwIRQrW1qnLq0J0+mt0YQmHh/Fmaq5aHMSDIjwEls6T4NuCZD0AyVCdd2D
         MeHuAUGUAxhtJSN354gWlID5ll0vCC9qp2WnWcBgPxKvYnqGMDexOQmm+nLiTvxsmg1P
         U86w==
X-Forwarded-Encrypted: i=1; AJvYcCVK12QS7ACYboloj3zQpJh33mFj8BU6YRPGuUh3GYK8vDd4alubtR3d2ukeUaC9KXDjmdOXcna+6K2LEJp8mUTkVnSBd8m5iutskHM=
X-Gm-Message-State: AOJu0YzIQooLC1vp89vaTwE3sF5r0+D4yjVDCZObusoLrc2EPAo3BNac
	q8G7TEQ5AcP2rt1AL4v3Na2Wf460wg3Jmo6oZQTxw4Yg24kKLztHCuJ4DDlJEh4=
X-Google-Smtp-Source: AGHT+IHy+uCpgjbk1cp3geEm45Y1XvWbVTF8V96NY3XvlwNrEdahdHOfkYsv77mUgI4L6FPjHN5BYg==
X-Received: by 2002:a05:6870:e40a:b0:25e:660:104a with SMTP id 586e51a60fabf-260bdf87673mr2724928fac.37.1721155531978;
        Tue, 16 Jul 2024 11:45:31 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-103-45.totalplay.net. [189.203.103.45])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2607512f564sm1430444fac.14.2024.07.16.11.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 11:45:31 -0700 (PDT)
Date: Tue, 16 Jul 2024 12:45:29 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
	Michael Walle <mwalle@kernel.org>, linux-sunxi@lists.linux.dev,
	Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: Pull request: u-boot-sunxi/master for v2024.10
Message-ID: <20240716184410.GI561963@bill-the-cat>
References: <20240716122405.78613-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KcOV5shS6T72FihI"
Content-Disposition: inline
In-Reply-To: <20240716122405.78613-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--KcOV5shS6T72FihI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 01:24:05PM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi/master branch, containing the first part of the
> 2024.10 changes.
> Nothing really major here, some rework of the SPL PMIC drivers, adding
> support for the AXP717 on the way, which is showing up on newer boards
> now, most prominently some Anbernic handheld gaming devices.
> The rest is enabling Ethernet and SPI boot on the Allwinner V3s SoC,
> plus two fixes.
> This also updates the "traditional U-Boot" DTs to that of kernel v6.9.
> I will look into upgrading some SoCs to dts/upstream in the coming cycle,
> though this will not cover all SoCs for now, as we carry some non-mainline
> fix to improve compatibility with older kernels. Will see how it goes,
> but for now we stick with the "old way".
>=20
> The branch survived the gitlab CI run, and Linux boot testing on some
> selected boards.
>=20
> Please pull!
>=20
> Cheers,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit b182816c1fb436916661949213c543bf4d4225=
0b:
>=20
>   turris_1x: Normalize Kconfig usage (2024-07-13 10:42:15 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 674e4f994f5da537cab62ad86bc8bdf5acaae88c:
>=20
>   spi: sunxi: drop max_hz handling (2024-07-16 01:40:40 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--KcOV5shS6T72FihI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmaWv8gACgkQFHw5/5Y0
tywMXgv/VYFJ3AuDPSxvXOW6Qw/EsCkwYJn17vertA6imDHtXjLGLMgSxHkTdLGI
GGR5it2+XrpG91pKYZmbCXmJnOEIjIfjoD7JJzynOSW1+ZCRsiPuPgE7Y+Xv3/MA
NNdpmuiR21MIf2A4x2BHQLSG9wo5Je9WgUPdbw/9ZNpZkeCcTJ4/r9DwgHS1Eo5z
XRYKzjDq+apReTSPUelVd6o46wld6yuWiK0+E8eXn+ebq3ia5c9GlLI+B1VFmWZj
1t+Ag0Wsd8cgEqei/Xo7Zdbp2Ki8bYyLNrlTX0w77SvTKq+jnqXPV4ggH5ZkY1N0
jB2sW9sOqS83JX4uA96Yd150nM2dPGIN5/rR0hinEOBjZEy3CtzJTa7ypLTCQNpw
M8Iw61LohXIiQ+WIXMZZLs8ea7i80uqqh3qjgcvQUWk9/1G2u0J+Bej/XAWrZ+oS
4KoP56+RovqZvN0LWPHgWuBZa515fE4w/kEFLdDI2ux59FWL1hMXss0VMdHv6DPf
gJMITna4
=8Hwy
-----END PGP SIGNATURE-----

--KcOV5shS6T72FihI--
