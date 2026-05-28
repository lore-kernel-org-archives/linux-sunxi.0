Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088963403F5
	for <linux-sunxi@lists.linux.dev>; Thu, 28 May 2026 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954125; cv=none; b=gAh5xfgObKaLlQeTmGY5v8uSyGyi02DlS4mf3lutXbXc0ZmQ9pw72etzAjpu8k2XdPuVelJs7A54XyASCefOhu0Ik1zkNLm4hNNWshtDd9LiIVzMSrgeN+I8g+johsCimjVBOsow4GO4W/XBO9BObqcmh8FyXQFqxB0Vh8GUww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954125; c=relaxed/simple;
	bh=uAnADGrDbfL9vPfFUaKkzYIy96tZLcZrV9fdweefD5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmBE/3C472qQciuB/2twrwwypGy378G8hOhhYOQu4owotH2H+QFL7Pai2WxNuG6IPRFRT06kYQgoDACN0cp2N/DY9ZoprTh6peGo6Q3Ge+yWDjFzPoO5obZ7QWMt4u8itlr/nHyDEO08/m2ibrIsMVg9lqqqY47jmL4VdaOHlt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 29B9837002E0
	for <linux-sunxi@lists.linux.dev>; Thu, 28 May 2026 07:41:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 808D7B4093C; Thu, 28 May 2026 07:41:52 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [37.167.6.153])
	by laika.paulk.fr (Postfix) with ESMTPSA id 17379B40938;
	Thu, 28 May 2026 07:41:48 +0000 (UTC)
Date: Thu, 28 May 2026 09:41:38 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format
 entries
Message-ID: <ahfxskMC340jUtbQ@shepard>
References: <20260527124552.33815-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1y4O8A5/17eWGJgn"
Content-Disposition: inline
In-Reply-To: <20260527124552.33815-1-arash.golgol@gmail.com>


--1y4O8A5/17eWGJgn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

On Wed 27 May 26, 16:15, Arash Golgol wrote:
> The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
> MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
> codes.
>=20
> Remove the duplicated entries from sun6i_csi_bridge_formats[].

Looks good to me, thanks for taking care of this!

> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
>  1 file changed, 12 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index d006d9dd0170..0bec0cd7620e 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_cs=
i_bridge_formats[] =3D {
>  		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
>  		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
>  	},
> -	{
> -		.mbus_code		=3D MEDIA_BUS_FMT_UYVY8_2X8,
> -		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> -		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> -		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> -	},
>  	{
>  		.mbus_code		=3D MEDIA_BUS_FMT_VYUY8_2X8,
>  		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> @@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_cs=
i_bridge_formats[] =3D {
>  		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
>  		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
>  	},
> -	{
> -		.mbus_code		=3D MEDIA_BUS_FMT_UYVY8_1X16,
> -		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> -		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> -		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> -	},
>  	{
>  		.mbus_code		=3D MEDIA_BUS_FMT_VYUY8_1X16,
>  		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--1y4O8A5/17eWGJgn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoX8bIACgkQhP3B6o/u
lQzU2Q//f7QdVsQ1gypsibBCePiIiVDTE55KY5tR06XO8JzvYp2WUJML1pa1ui3J
b5hK2hHdAG1tyJpEk+1PUM0IUkCSO0JcrFN3eoSrveiIUQPQPW1W2wxqiiL3ObP/
ZA/Nos/uppyMmwy/8xNWOYU/vTqe4bcXhfVGsZGuQK2NhTl7xpBu94y3HfCIuYLZ
VCJwKqSuZlEmjj+TrAKf8beYKnIxKtnshcNTuPfg+HT9hKRZ8SAynzi2Cjes0sNX
byb/ugVmjCVHZkQ8frjSAO1OoTAJo3pEsUtjNSiZepBwHlyOrT45z2J7nIfJmf6n
F+lYRl3INteEVBxM2EBleo5Osj3Qx1dzixKx/F4KbTaALRVxFiBj+nPnnen2QBA4
HSU9YcSJ2oqKp5gw2c3z1xlG9w4nWmHOhHOcNEs2+6K5YrzOPgZ+bROfSvQKKOvV
eHGcWvauneSLhc5aXkMO3StdgiUDff4qySgIWu/ZC03DrJ33ydh3ISQKduA21Wao
tf7GbgpBePN0KxgEV4UePBDc9NHXxou9si1MEpl85Gfn8dI339t/XQTWePzNQTOE
6xdY2xXzBMcfmuCuk9vGdVdwfajxHGOk0WUbElDWHxPuYybA4/u3JOohdbk2AQ/9
i1c3+pCSHSTngKi9Jjn0avU+Ir/Oq6D/+gujAMkOgQCZy9jx3Ko=
=jm2v
-----END PGP SIGNATURE-----

--1y4O8A5/17eWGJgn--
