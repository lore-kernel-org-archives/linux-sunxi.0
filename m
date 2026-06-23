Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A183ACF02
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249818; cv=none; b=cjhhH2PXSH/A49EU8mGeNu3lKKaIntIwROKWnmVzVjj4x0A+r+wXe+vNBjtGDjB9NNPTtIsj1h1o1DnC9ibT5Nl7dZ7onXkkYlmcHXqFTpDiasLCPJAId6fMoHJDmflVQ8QtRgJrmU23X3Q8EmfjgBFfPo15OhxKOyv6uyH5RJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249818; c=relaxed/simple;
	bh=ullt+oAQ3yGA+ITanNbFLJXALyyrZhysIh5/lqqNY1U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=leAxAC5/LOqLyWzmcPJr896RBXM+wfP3o8cGZDrwOFQJBnuEBKbMx9ANxlDyQdjIDLilHNpm9RSgsg2wBpaL/uJLEwfvnaDuNiqTnMUmeRuvI/5aia6n/QkqHD6AHjuVileVRz6dw6EMfKNiLMyf1+W0q7HcsrqJjApg27ORCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGY6sfw5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGY6sfw5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8551F000E9;
	Tue, 23 Jun 2026 21:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782249817;
	bh=Tvhg2kY0H+iKIFTYKV19SNvDFo+7/lgJR6skeW8oRK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cGY6sfw5o9iAGvBe+MnXJoN5hccuOcXfPspUXE5VQqtdeJfmLo5f/BXXAaDErAD1o
	 uX1R+xloIorpKk+wSaDIc+0genUwC7smf/b2V9IZzLZlFSNbj2AizKG8IOZuwViqN7
	 RcBZAH4vGTS9+nQJYIOmAo2ieY0JE5I9G58ExeelC+1UfAXB0/2md9D0u1D8mfmnPb
	 jQug6gf2O4FP4duMgFqZlXOm/dtJhTNboS749uCipsCkSNgixs47vgQzsooUMPxQzr
	 8OJsJE2FOhVErCKnK4mPq0GCpZqxsV+ew8JOIUVEd51xHEguRZ5AXRlY9HEUT44NwH
	 HC5Z1seve1wHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
References: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 21:23:36 +0000
Message-Id: <20260623212337.4E8551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the return value=
 of `drm_encoder_init()` is ignored in `sun8i_dw_hdmi_bind()`, which leads =
to a potential kernel panic on the error path.
--

commit 2d6b8f73fd3be1e78f02ca32197b62b5da0fb174
Author: Diogo Silva <diogompaissilva@gmail.com>

drm/sun4i: Remove dependency on DRM simple helpers

Simple KMS helper are deprecated since they only add an intermediate layer
between drivers and the atomic modesetting. This patch removes the dependen=
cy
on drm simple helpers from sun4i DRM drivers.

> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4=
i/sun8i_dw_hdmi.c
> index 96532709c2a7e..9694ad142a7de 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
[ ... ]
> @@ -180,7 +183,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, str=
uct device *master,
>  		goto err_disable_clk_tmds;
> =20
>  	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
> -	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> +	drm_encoder_init(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
> +			 DRM_MODE_ENCODER_TMDS, NULL);

[Severity: High]
This isn't a bug introduced by this patch, but the return value of
drm_encoder_init() is ignored here in sun8i_dw_hdmi_bind().

If drm_encoder_init() fails, the encoder remains uninitialized. If a
subsequent initialization step like dw_hdmi_bind() then fails, the
execution jumps to the cleanup_encoder error path:

    cleanup_encoder:
            drm_encoder_cleanup(encoder);

Could calling drm_encoder_cleanup() on an uninitialized encoder cause a
kernel panic due to dereferencing NULL pointers (such as encoder->dev or a
zero-initialized list_head)? Should the return code of drm_encoder_init()
be checked and handled here?

> =20
>  	plat_data->mode_valid =3D hdmi->quirks->mode_valid;
>  	plat_data->use_drm_infoframe =3D hdmi->quirks->use_drm_infoframe;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-sun4i_simp=
le-v1-1-fa6696df1fad@gmail.com?part=3D1
