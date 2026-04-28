Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128E3DA5B6
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Apr 2026 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370674; cv=none; b=NGj3oZWqyYRg8tDv1aVsS7E2ycHZWDrGns6DrpdrEyE64yHqmerMpy/7O2kgebUUcnstkw4gbllOX27pyT+NpF9eyhPeF064WlSRvKTLCeKH4mWGviRBGY/UKMtnqNVT5hTMm1IopnWkZLBwI8Kmlzhfk8zmZDKYbgIH0WShgRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370674; c=relaxed/simple;
	bh=HNJZEnJcR2/emLWmlI4Bjiv219pPFgJ1xnVbA3cGpuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qv32lD/fXH5ZZYk3WpwBmHnBiIv2hjsSoo91/s49Dmm2iIECJ8jrFlVb9v1SzxWV7bAWUwI73l0Uwd5pqThk/+5dEMD/jd2mw7ch37NQwbu2nRzfdNrRX/mAHeLCKZXKIibX3ifaMXX5HIaYrCBsq70WDd1zaiIxD9f0GIOq+j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E08111F8005C
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Apr 2026 10:04:22 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3F7ECB4046E; Tue, 28 Apr 2026 09:41:54 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 25C1CB4046A;
	Tue, 28 Apr 2026 09:41:53 +0000 (UTC)
Date: Tue, 28 Apr 2026 11:41:50 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>
Subject: Re: [PATCH v3 1/2] sunxi: H616: dram: fix LPDDR3 TPR6 parsing
Message-ID: <afCA3l0VxAYfsYut@collins>
References: <20260427135819.2577234-1-andre.przywara@arm.com>
 <20260427135819.2577234-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1duiVBc+9tOnM3O+"
Content-Disposition: inline
In-Reply-To: <20260427135819.2577234-2-andre.przywara@arm.com>


--1duiVBc+9tOnM3O+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Mon 27 Apr 26, 15:58, Andre Przywara a =C3=A9crit :
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Allwinner's DRAM initialisation code defines a parameter named TPR6,
> presumably containing some "Vref" parameter, but containing values for
> *all* DRAM types. The runtime code selects one byte based on the DRAM
> type used.
> This selection code was wrong for LPDDR3, the value is encoded in
> bits [23:16], not [15:8]. Fix that in the code, which also aligns it
> with the very similar code for the A133 and A523.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reported-by: Philippe Simons <simons.philippe@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

Thanks!

> ---
>  arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi=
/dram_sun50i_h616.c
> index 3345c9b8e82..42a0550e015 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -975,7 +975,7 @@ static bool mctl_phy_init(const struct dram_para *par=
a,
>  		val =3D para->tpr6 & 0xff;
>  		break;
>  	case SUNXI_DRAM_TYPE_LPDDR3:
> -		val =3D para->tpr6 >> 8 & 0xff;
> +		val =3D para->tpr6 >> 16 & 0xff;
>  		break;
>  	case SUNXI_DRAM_TYPE_LPDDR4:
>  		val =3D para->tpr6 >> 24 & 0xff;
> --=20
> 2.43.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--1duiVBc+9tOnM3O+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnwgN4ACgkQhP3B6o/u
lQwqahAAiaxU7V9Lk+AOKvZxP+5zTtyGhuxTrPVvJhJQoXsIJxJFZfaoNi/WaWJ3
WTjDUi1KF4uCExwsN3VT6YKRoByAqcqoN+iiuXekURNgho3qyynbCAHbuyRftXSX
0/he2+PWalIyXKSVYTDsQMsIzTSN75PRd4xwIUtBqKVnlbvoODgbjrUQTy7lRem2
Bb0Yx1BlVkhhe6mjK3BnSW7tYeOgSu3pl9w1tzVFagV2psyOJLNwUDlxisMJut44
BM7qMV8AmaGMCwl05A+sWrGp9/N4gsNSW/nCqLQ6Ng88zihNl+pHG6oggX0X7ztx
wIqGgcaDDEDO2bwI5MR716efnc0HcO8D0bAPXs8KD9toJjWx6mhUXx+NpQCm02ii
DxyHNq4PGHZiGxrVFcqvwOeWZaA42AscyvoxhxfW/Ss5ydoNuLoRZuBuEXA3fflR
yCH6QUKOcceV8bKIqKV3Y2CwGCG/4TQpcU2hTyA7GIuvW4PDUTzYMjeXevj83xMk
aO9SYh+hCffQXYppAml/5eMfqYNsfPQ223SQUWTm68/PY7ndlVgxYaiO7UFLm9mK
9rBtDJZ0LioCHdiH/VPnxXnAlENLuifXFI0r4Jvl8+sI21yEJjjKMZ2GQ0/M4jc4
0FV7x9xSfejkf3QGIQlyLP0V37y/08n4iNHSj5fKFopiVzU64XY=
=cPKA
-----END PGP SIGNATURE-----

--1duiVBc+9tOnM3O+--
