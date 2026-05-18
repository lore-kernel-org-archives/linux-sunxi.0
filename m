Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81C53F6C25
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104695; cv=none; b=FWxbGffbScmfn+lRo+Dx5lEOOQgWvA/Wx/IhOYf5Gw9/PgV36dfbep/SXmiOkNRVn8Juhd7Y7iC7L5WcnSL4OhOA9KxqvnyiohYleFkz/mKNG4DHhaL0hI99bpi879PoJdItw8TNg/6K7WJ2olMCKPvXDN9sZHUFH9T6rF3OTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104695; c=relaxed/simple;
	bh=KURKeFBeooua0tQy/H02bmAC1cwLsGFTE1LUPGy25Ww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eQ9LxIFkQdONsZ+aknCS4MbOH2NaC/0AK9C2vg+5+zQOUYBEyECc4EeEcWWB+DaCe3Eyz5CUoNtdOWl7GQsl40Gcu6a7ipag+Wmw7eOAVal/Jrrm366XjuRQin8/MvMrajfzYM1BVY9fODxtYF9LXylx2jO/ca6w2tWEENfXLhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPJrSLgQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPJrSLgQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2D1C2BCB7;
	Mon, 18 May 2026 11:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779104695;
	bh=KURKeFBeooua0tQy/H02bmAC1cwLsGFTE1LUPGy25Ww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YPJrSLgQvQxPOZ7XkSevES7xJGKXIh/E1Pf0qn4xXs12uRu3+CEzJiQnTx47RkTZI
	 rB81ibmJnq0aHZF9TB1/adppxuzIzbX+9PWFOsTMUeI2f/34L1IgCY2t/0q6zUeiu6
	 QdpdDyjsYCCh30B8revNtmdTUp42jC8oocgFku7VJenvHI/Qo4usJ8Bmv9HU/mSuG3
	 36of/eBRso1IocvffhhpXJgeXw3q+SO9xBlN6fuR5k/OAFymnEdqpUv4y4EJqoT7UM
	 qQtA61z+9ZszoPe8C0RDyuXAflk1FXzDF4viSnV14W82vadscVCuxCdZNZqnJQGSbb
	 jz+vKu3sHtEyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260518102451.417971-15-paulk@sys-base.io>
References: <20260518102451.417971-15-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:44:54 +0000
Message-Id: <20260518114455.5A2D1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The format for SUN6I_ISP_PROC_PAD_SINK_PARAMS is left uninitiali=
zed (zeroed) in sun6i_isp_proc_init_state, which will cause v4l2-compliance=
 failures.
--

commit a1aac013cb6f860e3fef00fefa14f9e439c4e03c
Author: Paul Kocialkowski <paulk@sys-base.io>

media: sun6i-isp: Use V4L2 subdev active state

This commit converts the driver to store the active format using the common
V4L2 subdev active state instead of maintaining a local copy.

> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/dri=
vers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> index 46a334b602f19..9073a7f3f8c8c 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c

[ ... ]

> @@ -259,21 +262,22 @@ sun6i_isp_proc_mbus_format_prepare(struct v4l2_mbus=
_framefmt *mbus_format)
>  static int sun6i_isp_proc_init_state(struct v4l2_subdev *subdev,
>  				     struct v4l2_subdev_state *state)
>  {
> -	struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -	unsigned int pad =3D SUN6I_ISP_PROC_PAD_SINK_CSI;
> -	struct v4l2_mbus_framefmt *mbus_format =3D
> -		v4l2_subdev_state_get_format(state, pad);
> -	struct mutex *lock =3D &isp_dev->proc.lock;
> +	unsigned int pad;
> =20
> -	mutex_lock(lock);
> +	for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> +		struct v4l2_mbus_framefmt *mbus_format;
> =20
> -	mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code;
> -	mbus_format->width =3D 1280;
> -	mbus_format->height =3D 720;
> +		if (pad =3D=3D SUN6I_ISP_PROC_PAD_SINK_PARAMS)
> +			continue;

Does skipping the initialization for SUN6I_ISP_PROC_PAD_SINK_PARAMS here
leave its format completely zeroed out?

Because v4l2_subdev_init_finalize() allocates the active state memory using
kzalloc(), skipping this pad means its format will be left with a media bus
code of 0, as well as 0 for width and height.

With the get_fmt operation now pointing to the generic v4l2_subdev_get_fmt()
helper, calling VIDIOC_SUBDEV_G_FMT on the parameters pad will return this
zeroed format.

Since a media bus code of 0 is invalid in V4L2, could this result in
v4l2-compliance testing failures?

> =20
> -	sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +		mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> =20
> -	mutex_unlock(lock);
> +		mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code;
> +		mbus_format->width =3D 1280;
> +		mbus_format->height =3D 720;
> +
> +		sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518102451.4179=
71-1-paulk@sys-base.io?part=3D14
