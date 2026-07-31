Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE93264F7
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 23:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785541627; cv=none; b=Td7v6mEAkobW30+VREGUK/QTF6cLXMxYuyGD8BpyuuMxh7r1cu2c1h/0r+BOLI4geA1pEpymgg58QkMlPCV9fei2D1ka4DQHfh+ubdeYgkx/UJYmJefdkAYY3jKSkSTdzlWfLS155fJe0GRNhK6410CWOB8efJAz86e50JQnt/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785541627; c=relaxed/simple;
	bh=t+6K0G7pJ7w4rWQ6eSg4zWhw4mOEzy8/C2KVDkPcb2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H9ST9YlYkIJ8aMrcH2fZmQj2DCXVFa0n6k75/Z6EqONIoTSbROYcrd5EMWEyENx3Vonlp2guqITsvYk/LPH15aJWIKvuBJiD2t92mVSVvL6IC9m4pOECSvHv4CU75423D3jg6dM2GIt7ze26DywtkYCHKUG9T8/tZ1pOHtW7Ah4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inzbZr/Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inzbZr/Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FDA1F00AC4;
	Fri, 31 Jul 2026 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785541626;
	bh=oNXig1kPcHU+NdNkz+KRPha6XX0+j94Lo8nRLAzz8Tw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=inzbZr/Qz5yFqFfxqQliBiXXe1FAFkAaxxGrk9OJuo9shXiugGhRkfAYAkBo5+SK4
	 kSppqqYiBiR2Wgv5Wew2OEQDp5DGOE9dm4Gwdjh8GkNdQH2ewGjNwSZ0GwwYSkU+W/
	 62jqCHm7lbORs0tTRZseOe8GmvquaZMX8mgUHxZslJzoISTEuqNZmlGQwJkPaIwVZx
	 KVNXs3mGoHT+N1Auuy+tAKtqN+YlzRe8dU/GyooY+GHE/Uf8d9uGv6v9hgjpTmUzEd
	 VFKNv66AVP+1T+zIPNuffT2vz+AGFlsrKSmbG9yr4lbVWzPh8RnruGe/g0IL216HYL
	 13pva47yxWkZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 55/69] drm/sun4i: hdmi: Convert to
 drmm_connector_hdmi_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-55-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-55-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 23:47:05 +0000
Message-Id: <20260731234705.B3FDA1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] A comment originally describing the vendor and product strings was =
left behind after the strings were moved to a struct, making it confusing.
--

--- Patch [55]: [PATCH v10 55/69] drm/sun4i: hdmi: Convert to drmm_connecto=
r_hdmi_init() ---
commit b114fe117b3fdd374cdabeb7a675643189411792
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
drm/sun4i: hdmi: Convert to drmm_connector_hdmi_init()

This patch switches the sun4i HDMI driver to use the new
drmm_connector_hdmi_init() signature. The vendor, product, format
capabilities, and max bpc are moved into the drm_connector_hdmi_funcs
structure.

> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c

[ ... ]

> @@ -653,19 +654,16 @@ static int sun4i_hdmi_bind(struct device *dev, stru=
ct device *master,
> =20
>  	drm_connector_helper_add(&hdmi->connector,
>  				 &sun4i_hdmi_connector_helper_funcs);
> -	ret =3D drmm_connector_hdmi_ini2(drm, &hdmi->connector,
> +	ret =3D drmm_connector_hdmi_init(drm, &hdmi->connector,
>  				       /*
>  					* NOTE: Those are likely to be
>  					* wrong, but I couldn't find the
>  					* actual ones in the BSP.
>  					*/
> -				       "AW", "HDMI",
>  				       &sun4i_hdmi_connector_funcs,

[Severity: Low]
This isn't a bug, but should this comment be moved along with the "AW" and
"HDMI" strings to sun4i_hdmi_hdmi_connector_funcs? Leaving it here makes it
appear as if it refers to the sun4i_hdmi_connector_funcs argument.

>  				       &sun4i_hdmi_hdmi_connector_funcs,
>  				       DRM_MODE_CONNECTOR_HDMIA,
> -				       hdmi->ddc_i2c,
> -				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
> -				       8);
> +				       hdmi->ddc_i2c);
>  	if (ret) {
>  		dev_err(dev,
>  			"Couldn't initialise the HDMI connector\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D55
