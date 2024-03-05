Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359A385645
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Mar 2024 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709645263; cv=none; b=fXZezhHObY8K4OMl6XE0iffXGr4W2rX9sajABlRZzEixxhyUPlon83sEgBVikkZI3DjglteWpvPW8vMrHNx4if67/aBrt7DG+mdAQ2xz5K0EEkrnwPt58tVBCrkMF+WSngCsKfUpqs6TvQNavRo2dplkfi/H4NR/jUsPcnyc9zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709645263; c=relaxed/simple;
	bh=cbwL6bfJ4BqAiNjw9HGnYL+ke8aJUNSe9oH+HYKa0as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JF4LhaU7h9ysVobBfMp1B+CG5vD6wgZjWqhmxpKiQ2Y9hAzIsCqfFkElgl82PU/gChJmV0rxNfXm1uPGPMNvA5jsLynwP0tJXMYgJmygXH0rgyI0IKXkhn45JSl0AsvGofdE4HT67VuHHzhofhASn879qr17BSFz7tJFdot/iGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Tmuqz+43; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Tmuqz+43"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c1af1e8b7eso3036886b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Mar 2024 05:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1709645261; x=1710250061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezy9AzvHF5+C84tn+m9V5PlWfXsA1VYgsmlzzrvDtps=;
        b=Tmuqz+439K0xXciIKuq/NftydZomPaLgnoJFCTmb0xbIGnnLy1nU/mOpa4b8hVKBbL
         TZtoXxeo2c6ox/OwV26c50hx10yZl1zx/QYmIYdcXiYbULkfUz2t8Rto3PGSRBfiOHiO
         uoT/d/REcTJHUOFVEGfXJoZttO5ep+zKXuvYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709645261; x=1710250061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezy9AzvHF5+C84tn+m9V5PlWfXsA1VYgsmlzzrvDtps=;
        b=Hk6ubEzivH+aLUP9nYup7vCt+pfY+k1CTHqcE4OQXYuSf/mUl72ACSSO6J3r18rmKP
         mrNBi84MeKX8yvo8Oko6p66aVRKXOtNL4BOrTP0SpOaIXB1lNR8B/PfIznCOIbpwbe1a
         TzW8eICWUMOEVNIu2ES1D+yZylrYJu8meLxhpq3nTgeWjwcYm0JtVrUsyz+16jpSXSLd
         hYIZnXMw0wcm6Tv5coxjb6FTvqZW5sgClbE6h6Os/FYbopSFMbbEpPmY0AtS8nPrvhh5
         alC3jfjt1CUd+ra1wbR4EavjHN4r/jmBbcNuPtXGfGyS5Ovew+6OzqemJqTAtKBMSLuj
         UOFw==
X-Forwarded-Encrypted: i=1; AJvYcCWW60DgcG1pYaHO1Qrfg59w/PuLxd58jgQIm1VH+PrgsQ2WqEG8s0nTumr+5QzeBbT2tGmZfgICEyDBlVCtlJg+u7aBQ5tHEr/YIf4=
X-Gm-Message-State: AOJu0YyiEPJ0K3sVlEQdhml8V39EOkBJgVyKMS5j8DEJzlgsyiybBv4d
	7lRuE3eQz7JS/tLziJFKVQdmBcXAoTiDDsrRzGZBXAlNRtMe/lBpn0ZnHTEGoaY=
X-Google-Smtp-Source: AGHT+IHEri1aaguEVt+T71g4hwi5Ngt3g/M4GIG6OwKB5J3Dy0eiV/fkcIacVQH0OLEnG0Luvl50Tw==
X-Received: by 2002:a05:6808:7cf:b0:3c1:9ac3:bf2b with SMTP id f15-20020a05680807cf00b003c19ac3bf2bmr1819819oij.5.1709645261103;
        Tue, 05 Mar 2024 05:27:41 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-007f-0000-0000-0000-1000.res6.spectrum.com. [2603:6081:7b00:7f::1000])
        by smtp.gmail.com with ESMTPSA id x25-20020ac87319000000b0042f01e612bbsm494559qto.37.2024.03.05.05.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 05:27:40 -0800 (PST)
Date: Tue, 5 Mar 2024 08:27:38 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Philippe Coval <rzr@users.sf.net>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for v2024.04
Message-ID: <20240305132738.GA1523872@bill-the-cat>
References: <20240305111541.2369415-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9GJC/8RsugRDi4km"
Content-Disposition: inline
In-Reply-To: <20240305111541.2369415-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--9GJC/8RsugRDi4km
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 11:15:41AM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi/master branch, containing some fixes and smaller
> changes for 2024.04.
> One fix makes the reboot more robust on some older board, another one
> stabilises the initial clock setup on the A10/A20.
> Two patches make sure our DRAM init does not actually change the content
> of the DRAM array, which allows to use DRAM for Linux' pstore
> functionality.
> We get SPI support for U-Boot proper for one more SoC, that patch was
> lingering around for a while, and should not affect other SoCs, so I am
> merging this now.
> As an added bonus, we get the defconfig file for a new board, the DT was
> already synced from the kernel tree.
>=20
> The CI looked happy with changes, and I tested them on five different
> boards with different SoCs.
>=20
> Please pull!
>=20
> Cheers,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit eac52e4be4e234d563d6911737ee7ccdc0ada1=
f1:
>=20
>   Merge patch series "ARM: renesas: Rename R-Mobile to Renesas" (2024-03-=
02 14:30:25 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to f1e6a718ebab0682d80601db404e8d842767becf:
>=20
>   sunxi: restore modified memory (2024-03-05 01:16:56 +0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--9GJC/8RsugRDi4km
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmXnHccACgkQFHw5/5Y0
tyxiPQv8DcGbBRYVi8GS5swJMrR4QNt/v528coyfijWn5NNLlzkC1Bj9Ls9RA9C6
VDIjuiLZSIJXIouUROlOui63/qe1ZcsvjE0Ucgc3AZnzscJ5Nl7IS8edhK6cnT68
4snPwIrdSVFZ3lL0G3dv94wbqGlQU7PDTZmX21A3XWMWgOwFPp3k5nEslI0H4NHl
DrzpsfuUO7bZW9nFHJv9wlv/A0Yiue9gs7CbNUj3jbc2bDnxZZODin0x5dsqC5JA
0oDYc85l9JpPJj2eAZdzJD2xTBGX2dtdfG7Aeh+lccdohf1no/Sdnsm7alBCE/v0
IBDkumTI0pGTaDvwkoIp9+ACP4MXX+jXoJqKz+EqKZBoCdpSOTmdu7vYOfuAdahU
3eveQ6GD90S+YCu8dwsswtkEu4lpiwd8gK+bf9IcDLu1DSfBnXy2oTiKDo0v744l
noFyxKOwtuwJbzsfbITcXP2i6epJuQzY+CyslQB0fS1D86dyJ+ohwjL+qGc9J9P5
Irp2VEMu
=Pfjw
-----END PGP SIGNATURE-----

--9GJC/8RsugRDi4km--
