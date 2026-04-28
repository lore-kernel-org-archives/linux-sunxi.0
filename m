Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077F3624C1
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Apr 2026 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370676; cv=none; b=pJN0y37R6KHz3NVv8jxyXZq59QsP4iAbZ6kU4yHFQgq4fCHTm7h/td3qKpLA93oMoi+2yAOGssc0DHYdnovCs+pzt3T/vdtbuQ4OFiu1Ec5KK44q0sDFRMjikZEG2gOvnAd1HPz8fJlKjIGpdApms21bC7R35a8HdU9NVZm9C4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370676; c=relaxed/simple;
	bh=PMqJ/+wWcJJZn9mR8L9bYnEwPNeaIL5e3Kx7BKaZcbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUcU/zgrEjnRnEsD8OM/5QUFaxsZbNEtimui50zpo1gj5VfIbjoMRq6grVnOJLz43yW7jTFWanT3wMRshSbUY2cENAlTNiwFUGlGRewQq6ZARySA291xuktrgJflsWcuZ3vq7h0kUmld2VBT60b19oIegoSljDhKeKyl4CE7avY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C62E71F80044
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Apr 2026 10:04:23 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A268EB40471; Tue, 28 Apr 2026 09:49:18 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id CA12FB40465;
	Tue, 28 Apr 2026 09:49:17 +0000 (UTC)
Date: Tue, 28 Apr 2026 11:49:15 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>
Subject: Re: [PATCH v3 2/2] sunxi: H616: dram: drop default TPR6 Kconfig value
Message-ID: <afCCmxMrYHnC9An9@collins>
References: <20260427135819.2577234-1-andre.przywara@arm.com>
 <20260427135819.2577234-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YkmeUbdSym1pkoRU"
Content-Disposition: inline
In-Reply-To: <20260427135819.2577234-3-andre.przywara@arm.com>


--YkmeUbdSym1pkoRU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Mon 27 Apr 26, 15:58, Andre Przywara a =C3=A9crit :
> CONFIG_DRAM_SUNXI_TPR6 is the only DRAM config parameter that has a
> non-zero default value. Since we need to provide a value for all the
> other parameters anyway, avoiding TPR6 makes no real difference.
> To make matters worse, TPR6 is a compound value covering multiple DRAM
> types, but also spans over three SoCs, which makes it hard to find one
> good default value.
>=20
> Drop the default from Kconfig, and put some explicit values in the
> defconfigs for the few boards that were relying on the default so far.
> The value is taken from one BSP, only the lower byte matters anyway for
> those boards, all using DDR3 DRAM.

It looks like this change is missing some boards that we support (e.g.
liontron-h-a133l). Is this intentional?

The TPR6 value is still used for all DRAM types, so I think we need to
define it for all the boards we currently support.

All the best,

Paul

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/Kconfig         | 1 -
>  configs/orangepi_zero2_defconfig    | 1 +
>  configs/transpeed-8k618-t_defconfig | 1 +
>  configs/x96_mate_defconfig          | 1 +
>  configs/x96q_defconfig              | 1 +
>  5 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 284458ad9a5..18123e685dc 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -151,7 +151,6 @@ config DRAM_SUNXI_TPR3
> =20
>  config DRAM_SUNXI_TPR6
>  	hex "DRAM TPR6 parameter"
> -	default 0x3300c080
>  	help
>  	  TPR6 value from vendor DRAM settings.
> =20
> diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_de=
fconfig
> index b387b4795ad..afd1535052d 100644
> --- a/configs/orangepi_zero2_defconfig
> +++ b/configs/orangepi_zero2_defconfig
> @@ -5,6 +5,7 @@ CONFIG_SPL=3Dy
>  CONFIG_DRAM_SUNXI_DX_ODT=3D0x08080808
>  CONFIG_DRAM_SUNXI_DX_DRI=3D0x0e0e0e0e
>  CONFIG_DRAM_SUNXI_CA_DRI=3D0x0e0e
> +CONFIG_DRAM_SUNXI_TPR6=3D0x33808080
>  CONFIG_DRAM_SUNXI_TPR10=3D0xf83438
>  CONFIG_MACH_SUN50I_H616=3Dy
>  CONFIG_SUNXI_DRAM_H616_DDR3_1333=3Dy
> diff --git a/configs/transpeed-8k618-t_defconfig b/configs/transpeed-8k61=
8-t_defconfig
> index e4bf5e8efd3..e672d8f8df9 100644
> --- a/configs/transpeed-8k618-t_defconfig
> +++ b/configs/transpeed-8k618-t_defconfig
> @@ -7,6 +7,7 @@ CONFIG_DRAM_SUNXI_DX_ODT=3D0x03030303
>  CONFIG_DRAM_SUNXI_DX_DRI=3D0x0e0e0e0e
>  CONFIG_DRAM_SUNXI_CA_DRI=3D0x1f12
>  CONFIG_DRAM_SUNXI_TPR0=3D0xc0001002
> +CONFIG_DRAM_SUNXI_TPR6=3D0x33808080
>  CONFIG_DRAM_SUNXI_TPR10=3D0x2f1107
>  CONFIG_DRAM_SUNXI_TPR11=3D0xddddcccc
>  CONFIG_DRAM_SUNXI_TPR12=3D0xeddc7665
> diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
> index c0628370df9..1b7d9338c02 100644
> --- a/configs/x96_mate_defconfig
> +++ b/configs/x96_mate_defconfig
> @@ -6,6 +6,7 @@ CONFIG_DRAM_SUNXI_DX_ODT=3D0x03030303
>  CONFIG_DRAM_SUNXI_DX_DRI=3D0x0e0e0e0e
>  CONFIG_DRAM_SUNXI_CA_DRI=3D0x1c12
>  CONFIG_DRAM_SUNXI_TPR0=3D0xc0000c05
> +CONFIG_DRAM_SUNXI_TPR6=3D0x33808080
>  CONFIG_DRAM_SUNXI_TPR10=3D0x2f0007
>  CONFIG_DRAM_SUNXI_TPR11=3D0xffffdddd
>  CONFIG_DRAM_SUNXI_TPR12=3D0xfedf7557
> diff --git a/configs/x96q_defconfig b/configs/x96q_defconfig
> index 59f01aae4eb..068aee3fd1e 100644
> --- a/configs/x96q_defconfig
> +++ b/configs/x96q_defconfig
> @@ -8,6 +8,7 @@ CONFIG_DRAM_SUNXI_DX_DRI=3D0x0e0e0e0e
>  CONFIG_DRAM_SUNXI_CA_DRI=3D0x1f12
>  CONFIG_DRAM_SUNXI_TPR0=3D0xc0001002
>  CONFIG_DRAM_SUNXI_TPR2=3D0x00000100
> +CONFIG_DRAM_SUNXI_TPR6=3D0x33808080
>  CONFIG_DRAM_SUNXI_TPR10=3D0x002f0107
>  CONFIG_DRAM_SUNXI_TPR11=3D0xddddcccc
>  CONFIG_DRAM_SUNXI_TPR12=3D0xeddc7665
> --=20
> 2.43.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--YkmeUbdSym1pkoRU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnwgpsACgkQhP3B6o/u
lQxLjBAAgrnDN8ARHPeIp94Ps59uhAWOaPaVr9G1U98WmrUrzIDYsYVn8Di59XTn
0YPT5RPzRy5ZDEsAVu7gnnIOVVG+QHqLEgQ8ltJXk3O8iQiQNjq8I3djNEScRKJE
29wW+2lPpi5A4NYIwCtSCbVY+iWkfq5Ls2cn7CX9LRPXL1jqbGcDYJK0usiD+wkJ
OiEvWgqsEng6CdCfI3pYi9vFCd4nHAT8sMAlEUZTQFQEXvBBH7ny/wEUkBqCD5AG
mP9PkZNqeKG2Z/d0nGEAO1tfLLIkXYRfqwX5pN7F+1UddVCY8Y3f/gotWdo2EzTO
xhFdkLNQpT5b9bW2QcLm5+t+PAgpOG5cPZjeXKv3JXTp2o3RoZDC5GXZ51u5PpKP
+UqxMFTyLpKbTxdfVt/BuD6A+6jRKIfQcpHf838n7rPSM5m0Y6dzfWcURqDbM5oz
0jQkvdeqU/IO5WXSWwVHGR+RbDozPO1wtcCDuLoMJd23bHEN9PdJUQisIVeLn0Ih
kRhZxWJnGxbsl64u/WXjBkvgYZUHyNhXDuP4HmNXR+8E7LTTCqixBno8MNNkLOCh
ivRg1bUwYYaAnVm3eixDeS3J7oMeOol6jM25V/s09ZW9tokjH9e0VV9AMfp/7Pdo
Zy0syOiCUeVRyvaafT+OrINbLLFKEzQpHRKcO3gWVhZ+8d+8RbQ=
=hZjm
-----END PGP SIGNATURE-----

--YkmeUbdSym1pkoRU--
