Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C661F4176
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 21:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054501; cv=none; b=ccOk6YY9hdOwieGDtzDBmXpd/BDB5dFgOr1VwQyNgmNWAqFuKTA+ZKtdlK0QbLwXLxTmui/R03L2vxEzveRzAHmCUTAIPWvafO8codxG7CvB/Z3+snzaCEnGqLTfqOIuVDE7ABd5Pvzd7XlnrEBbOORs2Cf21G9Gxilnepwr5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054501; c=relaxed/simple;
	bh=RdPEl6zewfd8ErLkXEfTyuQEy9D5/dHuwaY6TkDYow8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brNDWg7mi4x8MdAo0tqlnWjb40DEyXEIPF+vJVWwqC6+odfTQ5L8MoYtXrYfRml/Ti7O8v0MdROkLyPq0BuZlRJvtzz+4qLLhsJtfqFEv0g1wiyv3boRQGpLfmefxILCFPMFCIlynHs42nYbHmzYylMIrAr4M8rRXjjgtMh10Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 39DD21F8005A
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 21:48:14 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 740B3B407AA; Sun, 17 May 2026 21:48:12 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id A490AB4079E;
	Sun, 17 May 2026 21:48:10 +0000 (UTC)
Date: Sun, 17 May 2026 23:48:08 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3 3/3] media: sun6i-csi: capture: Support MC-centric
 format enumeration
Message-ID: <ago3mOxf1adhogFW@collins>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
 <20260509050921.22158-4-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yC5mSo+r2Ck9CJ8n"
Content-Disposition: inline
In-Reply-To: <20260509050921.22158-4-arash.golgol@gmail.com>


--yC5mSo+r2Ck9CJ8n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Sat 09 May 26, 08:39, Arash Golgol a =C3=A9crit :
> Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
> pixel formats based on the provided mbus code. Advertise MC I/O support
> on the video device to reflect its intended usage within a media graph.

There is one (important) thing I overlooked last time: the list of
direct matches between mbus code and pixelformat only covers some of the
formats that the driver supports, but not all of them.

This is reflected in sun6i_csi_capture_link_validate, where we check
that a given mbus format set on the bridge is compatible with the
pixelformat set on the capture side.

I think we essentially have to extract that validation logic into a new
helper and then use it against all supported pixel formats for a given
mbus code to find out if that pixel format should be returned or not.
So it also means that multiple pixel formats can be supported for a given
mbus format.

A typical example of this would be MEDIA_BUS_FMT_YUYV8_2X8 than can be
stored to either YUYV (raw mode), NV16/YUV422 (YUV mode, no resampling) or
NV12/YUV420 (YUV mode, 422 -> 420 resampling).

You're welcome to give it a try if you'd like or I could take a look at
this myself.

Also the first comment after the sun6i_csi_capture_format_matches
declaration should be "YUV422", not "YUV420" (would be good to fix it
while touching these parts).

All the best,

Paul

> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes in v3:
>  - No change
>  - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/202=
60508161721.94285-4-arash.golgol@gmail.com/
>=20
> Changes in v2:
>  - Return pixelformat directly instead of a pointer
>  - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/202=
60217064050.18388-4-arash.golgol@gmail.com/
>=20
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index f788b4234673..5737ebaa7297 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -327,6 +327,22 @@ static bool sun6i_csi_capture_format_match(u32 pixel=
format, u32 mbus_code)
>  	return false;
>  }
> =20
> +static u32 sun6i_csi_capture_pixelformat_find(u32 mbus_code)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
> +		const struct sun6i_csi_capture_format_match *match =3D
> +			&sun6i_csi_capture_format_matches[i];
> +
> +		if (match->mbus_code =3D=3D mbus_code)
> +			return match->pixelformat;
> +	}
> +
> +	/* Valid fourcc is non-zero. */
> +	return 0;
> +}
> +
>  /* Capture */
> =20
>  static void
> @@ -729,11 +745,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *=
file, void *priv,
>  				      struct v4l2_fmtdesc *fmtdesc)
>  {
>  	u32 index =3D fmtdesc->index;
> +	u32 mbus_code =3D fmtdesc->mbus_code;
> +	u32 pixelformat;
> +
> +	/* MC-centric or Video-node-centric */
> +	if (mbus_code) {
> +		/* There is only one pixelformat for a mbus_code. */
> +		if (index)
> +			return -EINVAL;
> +
> +		pixelformat =3D sun6i_csi_capture_pixelformat_find(mbus_code);
> +	} else {
> +		if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +			return -EINVAL;
> +
> +		pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> +	}
> =20
> -	if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +	if (!pixelformat)
>  		return -EINVAL;
> =20
> -	fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixelformat;
> +	fmtdesc->pixelformat =3D pixelformat;
> =20
>  	return 0;
>  }
> @@ -1065,7 +1097,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device=
 *csi_dev)
> =20
>  	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
>  		sizeof(video_dev->name));
> -	video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> +				 V4L2_CAP_IO_MC;
>  	video_dev->vfl_dir =3D VFL_DIR_RX;
>  	video_dev->release =3D video_device_release_empty;
>  	video_dev->fops =3D &sun6i_csi_capture_fops;
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--yC5mSo+r2Ck9CJ8n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoKN5gACgkQhP3B6o/u
lQxjFQ/9ElbgKI3F/VxE16ifDGEGHAuxRHku9cp2Mp9t9Vvc//lpAWOPDKwk+8nr
giitJevUYjpBW6EWcvre964byYHBI6Ep+GwHbryHbQ0Whhcfs7auaIXV0aGikY+w
NqZx7Uh5rd3ZCofFxa903cW3Oiz5aPYr9th5iVoXJum/bf7YRDsp3//nQOkHbPBr
i3ZIYVFCc/R9o8O1KGVd3GNGkYjduH9H5Jpxs210Ti0sxngQjYz4NHtzI9HQ+SO8
n1N7lxdchE9B6zROCvhPLTPnR680J9aDFsn39LLFRLG/r0iUbQmlmwby1MjDCxyY
7Xz6xZBKRcLXI6jg3gXVdnH7+q0SPHu4iScZE/55glACRR5ffDIJo1dE+Ons4t++
c1RW8DzzWkRLwLxA8rKxfDU1GYSHzzlKznl27jjIERAo8ZDFYYeVn3Iu/eKWhnKw
tD6OgnRP57iCDO0TkE/twbGkIrdxJlbADjiMYaWDhQ2uqDi+UBzQF0TA+SSOAJSF
GFDeyqkKt/yKdnwmiwNOwnmUICwGHtV7pH7ORyRp2kgYsL+9oV1N8QEeyPBLDeNV
7wnItI4HfPegIQBUzs7RHVev86QaACxuQFqOTgPGhCbWl24/K7BPg5B8bPOmotid
kb9ciJP+8S5Z0vRdm6b63p9RYd1kbQEIlVCB9ss1n3rd1DZCqw0=
=EjDr
-----END PGP SIGNATURE-----

--yC5mSo+r2Ck9CJ8n--
