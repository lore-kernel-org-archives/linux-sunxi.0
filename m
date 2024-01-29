Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4094F3F9CF
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jan 2024 17:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550906; cv=none; b=FaOiVB33e0ulnLnm7unfvYWYfdsk6zTzY1uS3J3snIY24XLcneae5abreFgsr+2dqjXC4rsSG8nWLen9w8O3dzAnW5jaU7dbKEX1bLtimFgJ+WjBiprg2j7iRpC0s2nZ7Q4fZbSUuwe2bcWKF6gMQRmPpzDIR2cTBAc7fhrDNEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550906; c=relaxed/simple;
	bh=8DW6YD4EBWPB2OFu8vCOHxjwHy9nZqE7p/0jeWc4Dwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQH9uKoPgcspoi3Fc9kq6NQGzpElBPIUXw7GRrqFd0k9R556IULn0o00AsDoZpgbAFJ2QLGqGIROoGJ29iK0krvxjyfGm+TaqHXeUtousKMtyYLnQb2NSdh0FvdVnAB8n5XO/koLQN14CXktbleL4SO6gM8hX0FckLhae4rHqG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=VD/L+a92; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="VD/L+a92"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ff7ec8772dso32328627b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jan 2024 09:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1706550904; x=1707155704; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3hiTplZddOKmpjLV5j9nl0SOpqDow8qwf3PIsuL02Q=;
        b=VD/L+a92Be8nC+g8z7PUkODr7wgX+EARvzkmEUv3YTxCbBSMmJZTRCwsuVcC37WneA
         OF1hhFpnJFEYIl83MCYRc+BmWO+mB2brOkldWT2lyjC8UlajGW7KqcOC+kWNfZ/Me6Gw
         pPp1AEqJJRghF/u1fnY+hWLAcYf44H939asck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550904; x=1707155704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3hiTplZddOKmpjLV5j9nl0SOpqDow8qwf3PIsuL02Q=;
        b=jG1eJgV328RbmVIRJryoz6hA7tiU164IKlVM9RoGLz4brdE4r1ovd0FtxsfPrF9AOZ
         JckmyIrPMapr0Dba0hAoRKwVlc3VfMmJejENy1gpI4N12OCOROnDWdE4KhBXgj2f6qJQ
         CeNN1E5ssrCHx9Uh9IYbYWZiIxVw7bSAJzEXqhmVVqz+N9CTinwOTeYJlLzUlV0gzcYB
         S9wY6k3ScRi/AJaOa6ICb/7/1zlN2sJNv+p95Fch53V06mUSFlv09K2H18ZGVF4tEzCv
         0dnxEFLfRmMlVeW3S2qjaRgNDihj2RI2RwBiR67NDoKnZekWeAQrAqD0jPBCV031mWf3
         YdvQ==
X-Gm-Message-State: AOJu0YwMtNifQ+9P109l+pXC2VYwV3X0P555wp2WvGyRqcyMd3XSxcEr
	Z7z9fNWgnmf06I3Kmozo4NVbHbZ68h1KNoUMvLFlAo/44gpKcId/l2fQzdy3zMY=
X-Google-Smtp-Source: AGHT+IGUmddxwgLJwGdZu+IbyV5787nf+nzO2Vb6zfQVOm+x6jADk/ppgn3gtaAUwqiicFXlUJLp3g==
X-Received: by 2002:a81:7e08:0:b0:600:2492:e323 with SMTP id o8-20020a817e08000000b006002492e323mr4296152ywn.96.1706550904079;
        Mon, 29 Jan 2024 09:55:04 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-3119-0000-0000-0000-1001.res6.spectrum.com. [2603:6081:7b00:3119::1001])
        by smtp.gmail.com with ESMTPSA id w69-20020a0dd448000000b005f66a83db14sm2607920ywd.131.2024.01.29.09.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:55:03 -0800 (PST)
Date: Mon, 29 Jan 2024 12:55:01 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Nick Alilovic <nickalilovic@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>, linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: Re: Pull request: u-boot-sunxi/master for v2024.04
Message-ID: <20240129175501.GD1152441@bill-the-cat>
References: <20240129155543.2439451-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h2wZSMKrzrqd1yAk"
Content-Disposition: inline
In-Reply-To: <20240129155543.2439451-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--h2wZSMKrzrqd1yAk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 03:55:43PM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi/master branch, containing the first part of the
> 2024.04 changes. I had some more (USB regulator) changes queued, but
> found regressions during the final testing, so had to drop some. If I
> can find reasons and simple fixes for those, I would send them later.
>=20
> So for now these are some rather easy changes:
> - Some cleanups in header files: those do not affect the generated
> binaries at all.
> - The usual update of DT files from the kernel repo, mostly adding new
> board files this time. On the wake of this there is one defconfig to
> enable a new board, some H618 TV box branded as "Transpeed".
> - Samuel's series to support SPL FIT image loading for 32-bit SoCs as
> well, so far this was restricted to ARM64 boards. I refrained from
> automatically enabling this everywhere, instead this requires user
> intervention during board configuration. This allows to ship the "crust"
> management processor firmware on H3 boards, which enables better power
> saving.
> - One defconfig for an older H3 board. There was a close-by defconfig for
> a related board, but there are some differences which deserve a separate
> file.
> - Support for the EMAC driver to work with fixed-link PHYs, which allows
> to directly wire the MAC to a switch IC.
>=20
> The branch survived build testing for all 167 sunxi boards, and Linux
> boot testing on some selected boards.
>
> Please pull!
>=20
> Cheers,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 526a865fe4fea59fb2638726c26e39557eb97f=
dd:
>=20
>   Merge branch 'master-cleanup' of https://source.denx.de/u-boot/custodia=
ns/u-boot-sh (2024-01-27 20:43:20 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 539612e27690a8df7f197cd1e9f4c2cf6ee1ac64:
>=20
>   sunxi: Consider SPL size limitations for FIT loading (2024-01-29 14:31:=
00 +0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--h2wZSMKrzrqd1yAk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmW35nUACgkQFHw5/5Y0
tyz68wwAtHtwkHWVq7eILUQqj2eBMzr8cuKsFf8MtlsoOPRILDVLE08/ftC/7L01
FVjVtwiqW9JSs8z16cksZvX8peTnGsuzsTW0+SOmMWBFZb2L5/s2eqaXQbUR57Oi
fnhIQ0xfwdDASh2yBu921UNiTLyO4k+lJyhfS4ltq0gyRxHvl7cSfFCsY3wkaLYJ
EFn9je20MdxRF5MFLtm2UApyOG+ivD+CJebpFZptCGlmxqG+mEdoFb1jx34g1YRO
DEsRMn0SI5aPvfYIKQZ4aRGjg+VjqoZqU3yHbNDQYshEdjeVd4Pz37Mcuh+7buXc
KCkc+Kz1B8+OfuNM9zdZgPl1Gm7fiKevhe8PqzxVbAyzveGVa+s6Nd9CEixEA/AY
bV082HdICV8leTQm0Xviv0QiIPZ9fSfMcbfdfrRWgY4IhCGk2UWWW+WQisjOmoNO
SW1NyQLgE4ANbsn1Hzi9QtfwCKJYuGU4d8cvAVRWblYsxmixfUHlJYVBzSspQXEn
MadX8vH/
=BTHU
-----END PGP SIGNATURE-----

--h2wZSMKrzrqd1yAk--
