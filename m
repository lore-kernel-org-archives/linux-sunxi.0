Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A4396B73
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 18:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784238; cv=none; b=f7oxeaG1FreN1cvq2BZ8N3qzgqlOgkGQ/V9YpXWRaAg3W8wu/IREgmzkGB0ZloqRfaZDUgJCim2ZZ9f21j/ZFVS1LA/xEgarYtMP0H0AmaVvNYsja7zXrElOFxwRzVlUdq9ntUZ+b/4o6Xq0Y4oyz5SQHOytjf4ldTwqPVAd7vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784238; c=relaxed/simple;
	bh=XnwkfHrzOrs9X7nM0zBTnTYJLLdmhOaSeO4rw4PEhsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zqs5lyX3fwNbG14AQ1PJsD5Rn2gx1/RC1xq8Ld0WZBOt6hHfBLA+TM+JROXMGvKEKN2YCi6iEUJ0K6VFSYPyt5v+71isjLiB26P3L9U+n6FDszw/+3ucGb9C64OwX1sy35HtypW4rGfaKCPMfgfXgjFjTeobn1xE+4AF4fgRdDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CI5jswdY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CI5jswdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9ABC2BCB3;
	Thu, 14 May 2026 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784236;
	bh=XnwkfHrzOrs9X7nM0zBTnTYJLLdmhOaSeO4rw4PEhsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CI5jswdYdTJCWCGDSgvQ/9VDwdhjb3o8WI3Vpt07vpw9ZFpDVcSWpkpuvok3FBVO6
	 SDTgA6pNgKHXP77P2FE8VxLMcfVWKmWJjj0MsaOWQxi2JmNPaHA1F3qXT9GN5Nouh7
	 ffMVl3Aa34iFyPl91aFsxChk14GgMw0oD/24sfYtSURmh/KXUe2dFjwjACkPRUstBP
	 RG0bLbXB/uN14dYufPlmz6p54wqzSiQgpn9sRkiLh41Z45OzhI26JLVZXDIM6Z05lv
	 SGrDFU1/X1rgymKbkcqDrPRKmUxGGqx0Wx/5dubalHa7kBM3RwxMMCWONj3wnlgWdg
	 CAkJUMCNu026w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260514113804.12596-1-arash.golgol@gmail.com>
References: <20260514113804.12596-1-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 18:43:56 +0000
Message-Id: <20260514184356.BC9ABC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Uninitialized `state` pointer and flawed error handling in `su=
n8i_a83t_mipi_csi2_s_stream` lead to guaranteed kernel crashes.
--

commit 0ebc430b2a12334ca2b95edeadb9cb2ca2b1588b
Author: Arash Golgol <arash.golgol@gmail.com>

media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state

This commit transitions the sun8i-a83t-mipi-csi2 driver to use the V4L2
subdev active state API. It stores the active format using this state API
and drops the bridge lock and mbus_format field.

> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c
> index dbc51daa4fe37..2383b0cd1a127 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c

[ ... ]

> @@ -205,7 +205,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
>  	struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_subdev;
>  	union phy_configure_opts dphy_opts =3D { 0 };
>  	struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi_dphy;
> -	struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus_forma=
t;
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *mbus_format;
>  	const struct sun8i_a83t_mipi_csi2_format *format;
>  	struct phy *dphy =3D csi2_dev->dphy;
>  	struct device *dev =3D csi2_dev->dev;
> @@ -215,8 +216,10 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2=
_subdev *subdev, int on)
>  	unsigned long pixel_rate;
>  	int ret;
> =20
> -	if (!source_subdev)
> -		return -ENODEV;
> +	if (!source_subdev) {
> +		ret =3D -ENODEV;
> +		goto unlock;
> +	}

Is the state pointer initialized before we jump to the unlock label here?
It looks like state is declared but never assigned before we attempt to
unlock it.

[ ... ]

> @@ -254,6 +257,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
>  		goto error_pm;
>  	}
> =20
> +	mbus_format =3D v4l2_subdev_state_get_format(
> +		state, SUN8I_A83T_MIPI_CSI2_PAD_SINK);

Are we passing an uninitialized state pointer to
v4l2_subdev_state_get_format() here? It doesn't appear that
v4l2_subdev_lock_and_get_active_state() was called anywhere earlier in this
function.

If state were to be locked at the top of the function, there is an error
path during pm_runtime_resume_and_get() that looks like:

	ret =3D pm_runtime_resume_and_get(dev);
	if (ret < 0)
		return ret;

Would this direct return bypass the unlock label and permanently leak the
subdev state lock?

[ ... ]

> @@ -318,6 +324,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
>  error_pm:
>  	pm_runtime_put(dev);
> =20
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514113804.1259=
6-1-arash.golgol@gmail.com?part=3D1
