Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E11552E8
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 19:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713814570; cv=none; b=IDRWWhLEO+0e4NiwdS1w6scuA415j8ETcmuqX5NgIrK7/3CbFKXFm9nnJVZ2tK+gtZd8aNLNGTztoxykCAAHUCwz/FFcrUzjJsdTahYabN63HepTTOXbrxRP0GQWJbj8xBvGZIzfmYMMcas7jhvspDjU0fbKc71M27FS+gO75fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713814570; c=relaxed/simple;
	bh=9vCzfOIrtmy+XJEVb+v/cTogANQ41MM1vR8sl3rZsYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBtzLWNHTPSNm4W3CyDI2tYvxaRAIO/aVVbAKA7VpGNhSyP+yHCl2+8wJyi3SQBj/t43WA1DeQLBe1SAe0Y580gCia9LZYX2Sty/ISE6R9cMvRSfqqui8WVfpQxlJFMThpkh2vtC81m5E/ELwqdq0y9ANUsrJe01ssTOCjb54mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=J+Th5s6h; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="J+Th5s6h"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78efd0fcec4so313587485a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1713814567; x=1714419367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DF/I6quatRoc3ag0yaUOIEgEeEu6NMjECCT6xBETE5U=;
        b=J+Th5s6hLuKL3X6a8KWxsu3XP5InduolSewos4Vixfg3bvaC8z5It9amf7L6Zero41
         cEBiFEAhuV/kQCZyXgaJrGqs/5GvP5sOg3pE4X9CIrZ0VJmbAXm/1tCYqRjbTqLuTpop
         ZvRF8LDcqMNnBzXynDEZPKtxn0oqeCb6ekKV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713814567; x=1714419367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF/I6quatRoc3ag0yaUOIEgEeEu6NMjECCT6xBETE5U=;
        b=tTT0ITntwk385l11ByzdK2pWmJZ/FMxv1WDqLFK1v0kxhP55DDc3cyKglqYgMzpSzm
         cqEJPz/4Nh8ovDVTI53TE4NNjNa1UdiYF/qhgH1Ojkzf66QZsPlM/9G+J521GdA9CIH2
         qzZ79CkLpvWWmDNYq/wX0E3i/yaRcn8sgr2GVixi+dtr/vlidZEjdj3eguEmJUu3qi2y
         R0npdzza7qnSJwn034JAaAM0PkKoijTXSLrqshzkbszj95m+gnSfdEOrsXyTw1xiJxKu
         +RMkFAls+hrfcYUKYc796RdAQa9sfrWlDcwpn0uzThkBVHQcfxau/wG7gS69K9bOTF29
         BwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfncr31TyTz1dh2y0u+i7eFhOzy6IsAvcTepN7Ks15D+l8aEKK2mDG4O4eEL3KsTb/8cRtPiHjiaWWo6Tc6dFNk6zYppilJRpn+/0=
X-Gm-Message-State: AOJu0YyU5M7zuMPmBez7RtA5WnUquY+E0IA/HAgsEtesPV0IJw95kssA
	4+lvhe/ED+lfK66ictJTvh/IJFlaM+LPU8l6gOH7RJlJjLcWv2rJ2UqLishUIKT+x1PrqQmuTzl
	HmVN05g==
X-Google-Smtp-Source: AGHT+IGi2bLPK+imHcsb+ZRw/yqq6XzBaKYtO8+c5Q2s30wosf3S6gA9F7+JiNUtfeK9XojzPnSCGw==
X-Received: by 2002:a05:620a:13d7:b0:78e:d2e7:3e9e with SMTP id g23-20020a05620a13d700b0078ed2e73e9emr12818086qkl.68.1713814567423;
        Mon, 22 Apr 2024 12:36:07 -0700 (PDT)
Received: from bill-the-cat ([187.144.98.216])
        by smtp.gmail.com with ESMTPSA id t26-20020a05620a035a00b0078f04e04842sm4520931qkm.132.2024.04.22.12.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 12:36:06 -0700 (PDT)
Date: Mon, 22 Apr 2024 13:36:04 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Maksim Kiselev <bigunclemax@gmail.com>
Subject: Re: Pull request: u-boot-sunxi/master for v2024.07
Message-ID: <20240422193604.GW1054907@bill-the-cat>
References: <20240422162249.2479071-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WDRV1FOWGBTEcE9f"
Content-Disposition: inline
In-Reply-To: <20240422162249.2479071-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--WDRV1FOWGBTEcE9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 05:22:49PM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> as per the usual late ;-) please pull the sunxi/master branch, containing
> some 2024.07 changes for Allwinner. Not many and nothing really exciting
> this time: there are more patches in fly, but they are not ready yet.
> I will also send some DT updates and new board defconfig files later, once
> they have seen the list. I am aware of the USB rebasing repo efforts,
> but would like to see how this plays out, also we have one compatibility
> issue that I painstakingly work around in the U-Boot tree for the last th=
ree
> years or so. So for now I stick to the previous approach.
>=20
> So now just some easy changes: support for USB peripheral mode on the
> Allwinner F1C100s, T113-s3 SPI boot support, and some SPL cleanup patches.
>=20
> The branch passed the gitlab CI run, and brief boot testing on some boards
> didn't turn up any issues.
>=20
> Please pull!
>=20
> Cheers,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit c08685289171e68afd4bae2eb2e279cdc49a40=
7d:
>=20
>   Merge tag 'u-boot-imx-master-20240420' of https://gitlab.denx.de/u-boot=
/custodians/u-boot-imx (2024-04-20 15:16:17 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 192c5c9e51c1ef100c3d027d253ffad26ff75a68:
>=20
>   sunxi: sun9i: make more clock functions SPL only (2024-04-22 01:12:26 +=
0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--WDRV1FOWGBTEcE9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmYmvCEACgkQFHw5/5Y0
tyw37gv7B5nLpp2WPfUwWL0eb9wrRNjio+xj27GUSGBCxIaPKel2Tvde+VCNHEQY
BWT/wiq4EpOHkxQjrQp1LjpwTBoUfWwqalW47oxxtRl6UAxVVwUgYO9l0R3yN79I
9664nxwSmu1zcgwkVT/I4ZYq3npZkD3z0WtLKjNy18UN4QxUddzTlN/kN/kSi2zl
XAiC6wM+nrkilIO5IXmf9222dhCa3l9nqQxGw5JtyTZv5kPOA8LF05jZVlhTcHGV
FIv5XZEURHBBrIdkDSulPgyQL/iLcFdsqtRIPT4Ll1ucWsxGJUrEwWbdolIzAzc4
cHLwMVH5FvghhDfkFeLfBCB1QeN8ZvCGu3Oe7oHTHmvBmUR3x+MJvCQn8gRx89Ae
5b4y08C/PdzKuv3FkLZ/JWzVSywlfbCSGwK/fGkW8AzmOSK7jADLid/1O34k4s9I
9yMKkwqKacgaRBCLXaRKSWyl0lQbAdQYCDKAAtuDu+GaIOicuxT5mmT3A7r5++4S
UmjtfhIt
=Pifb
-----END PGP SIGNATURE-----

--WDRV1FOWGBTEcE9f--
