Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8A035F8C5
	for <linux-sunxi@lists.linux.dev>; Thu,  7 May 2026 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155010; cv=none; b=EQqJNh1TostzQwzo7ERDYn69CPjszdpP8T4lUP6NGdG4ImhCdWQ8YX02UKemF6G2usWVgCbpGECiGKYPjqVPkfIXX0ZCrLPh4PKZjkmL78G5sL5WmUpubcm4UYt2Q1yWFiNUusEwE17DncKP2U9Dn6BgEOdCFlI1JS6ilx7rMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155010; c=relaxed/simple;
	bh=yGv6nvMeVYNDCO4QyOxTzMqf7elQ3rfiVJHCvYsH/hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVX/vX2bvUGNckcURBZtRPwALkZGBeiDj9hSh3GhTGfpzIeJHoFhZjktaiRpS3MSY+mI5gOgykpFiUUQb+yAOdlfrlAm0PZt2PulkKykmCbW0SRcZ/NVAy5FFgqYQEYGY2gMNLW4qLUrdoDUULl5CK22VZ/k9jfkDhZLhqExjSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E22E71F8004D
	for <linux-sunxi@lists.linux.dev>; Thu,  7 May 2026 11:56:45 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AB081B405F4; Thu,  7 May 2026 11:56:44 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 071A0B405F0;
	Thu,  7 May 2026 11:56:44 +0000 (UTC)
Date: Thu, 7 May 2026 13:56:41 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	laurent.pinchart@ideasonboard.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 2/3] media: sun6i-csi: capture: Implement
 vidioc_enum_framesizes
Message-ID: <afx9-VOhlqwbWM98@collins>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
 <20260217064050.18388-3-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ujZlaArqW+73YMqs"
Content-Disposition: inline
In-Reply-To: <20260217064050.18388-3-arash.golgol@gmail.com>


--ujZlaArqW+73YMqs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Tue 17 Feb 26, 10:10, Arash Golgol a =C3=A9crit :
> Report the stepwise frame size range supported by the CSI capture
> hardware for the pixel formats exposed by the driver.
>=20
> The hardware does not perform scaling and accepts any even width and
> height within the reported limits.
>=20
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

Looks good to me.

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index a21a146fb02a..dd06d4c116e0 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *f=
ile, void *priv,
>  	return 0;
>  }
> =20
> +static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
> +					     struct v4l2_frmsizeenum *fsize)
> +{
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	/* Only accept format in map table. */
> +	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
> +		return -EINVAL;
> +
> +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width =3D SUN6I_CSI_CAPTURE_WIDTH_MIN;
> +	fsize->stepwise.max_width =3D SUN6I_CSI_CAPTURE_WIDTH_MAX;
> +	fsize->stepwise.min_height =3D SUN6I_CSI_CAPTURE_HEIGHT_MIN;
> +	fsize->stepwise.max_height =3D SUN6I_CSI_CAPTURE_HEIGHT_MAX;
> +	fsize->stepwise.step_width =3D 2;
> +	fsize->stepwise.step_height =3D 2;
> +
> +	return 0;
> +}
> +
>  static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
>  				   struct v4l2_format *format)
>  {
> @@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_=
ioctl_ops =3D {
>  	.vidioc_querycap		=3D sun6i_csi_capture_querycap,
> =20
>  	.vidioc_enum_fmt_vid_cap	=3D sun6i_csi_capture_enum_fmt,
> +	.vidioc_enum_framesizes		=3D sun6i_csi_capture_enum_framesize,
>  	.vidioc_g_fmt_vid_cap		=3D sun6i_csi_capture_g_fmt,
>  	.vidioc_s_fmt_vid_cap		=3D sun6i_csi_capture_s_fmt,
>  	.vidioc_try_fmt_vid_cap		=3D sun6i_csi_capture_try_fmt,
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--ujZlaArqW+73YMqs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn8ffkACgkQhP3B6o/u
lQz3nA/+LW4/fo8zOQQNqmK/sFejacKxq8LvtWWW/lqe/0G6IGFtD7omxSHHqL2d
YZxykbKd01xMXP1+UH7m1H7frWuegINXI8gnm0EF3jgxEq/bCxuGQWsCuXhgthcg
WgUKt9INaXknw7L4RazBIWt7b0JWbjF+PV4IpdzT/Ue3vkvK7vyfJ0qzAPpE+N7X
NduMBRED5V3Rqmj48RsweXyotdMDfkj32NoCecGVqZB1nQQ9HD22UWuPYvUKd8QY
lXtTwcKEIGIqmMxIdggbIiFesNKkm/ZmHPdbLP26AcIegXoHupEc9bY0jFHWF2qg
YrhqRrfsr/mpv+EsvX0vIcpnXAPvPpsOEo+JDt+rDRne5EiDSm6eUJRXUo2e6g+Z
qUKyvcVtltK0nssC49MI99Cgdj9tVS7CmtGbkvPc5jHcJDFDskSMKaQTznOKiR3p
HyKhLX5kRzzpwK5fe8i1oDKTh/tH6NG7LVcc8DfOHT7fvmQlFRfUMMsWWgbCFLgk
DGFKI1TtOhQVAMaxjotgMc6coza0N0XXrxa8bGvSwFikUTr96JVMX0SbDGK5eFuK
x3s5WTuocG+GiSJThH2MzgZSHPhtvY5P/XrSq08EBev4368jOYzoXdrFFqSw88lX
AozTA92Oh3aN5wxpoJcgLnmwY+H38bsYJ7vv5+0k+t1cR7qG5to=
=iNpd
-----END PGP SIGNATURE-----

--ujZlaArqW+73YMqs--
