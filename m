Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB37374A17
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784308672; cv=none; b=TQI+gTOIC4bGDChILB1aHMGGnIZ9gAqm3kNzEmxp3/nW4YPizuSFH6mUTn/nKmxER+0ZAdEiOS68WyVo/npqoTu1YCPIcaHiN4TnXgsLCfSbwC5GZlXv9U0E5WaIYiSVJxrflbUZQYCDpjLULlBfXeq2vk23QwwlhEAM3WSFXS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784308672; c=relaxed/simple;
	bh=o7zyPpphqbynpLnNqBT0m/XN2QWef8XD8VuTyi2NKkU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FEU1MdBm1znxAIgpE6FOWMEC4D63S7VKoX+/CKkSQDqdHUSEP//OTANHVuR1V1omfqkK09iBZJvU08MNqJTnADEUazsIp7e3B7A+ZlmptpkQOIcXMSjzxu23YYZoV5dl5twq3568Bg6sSQuoM2cB3d+MD73pTYe1u0sl8MzkYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFyD2Qqs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFyD2Qqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8301C1F000E9;
	Fri, 17 Jul 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784308667;
	bh=3P223FgbDQpIcyPChczJbiQXV2OyWOHwWpS5ikonNlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FFyD2QqssDq+phgh4TWe7e112sc2IXfw6O6D2/APvbFohhsjmBcGytIB6i3bjmwEM
	 39hHrh4qY4VuI+AxtWUeHWKMdjkgqPE5ALqLr2lxNiPwz0OWrPxyDZ0Dx28ZDrp3vI
	 vX43INcJJ2lEe/+VfCpWV41D9Q8LzuhVQvbXD3FpPmm9FtPenB1oU8zwRX3CSp9qTB
	 LODkC9hGrZtP3YfydDrQ/7ALsx5hjVjMZ52i2rbXFbU+rTdorqCaG6IPPMGhu8AJ89
	 e2dRnU5PgvqQCbysyyXXq9W4YsIXOxvMvleNRVWL7Q4b3kqskXZ9nVpzeo3KdN0a3T
	 kUsX7wnOiPYxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: sun6i-csi: capture: Implement
 vidioc_enum_framesizes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260717160547.44460-3-arash.golgol@gmail.com>
References: <20260717160547.44460-1-arash.golgol@gmail.com>
 <20260717160547.44460-3-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 17:17:47 +0000
Message-Id: <20260717171747.8301C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] `vidioc_enum_framesizes` incorrectly advertises a 2-pixel step siz=
e for `V4L2_PIX_FMT_NV12_16L16`, violating the format's strict 16-pixel ali=
gnment requirement.
--

--- Patch [2]: [PATCH v4 2/2] media: sun6i-csi: capture: Implement vidioc_e=
num_framesizes ---
commit c1eb6dcf0f09ace0fcc277bb3e50e12e234dce7b
Author: Arash Golgol <arash.golgol@gmail.com>

media: sun6i-csi: capture: Implement vidioc_enum_framesizes

This commit implements vidioc_enum_framesizes to report the stepwise
frame size range supported by the CSI capture hardware. It sets the
supported dimensions with a uniform step width and height of 2.

> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index d90abba213098..f788b42346739 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
[ ... ]
> @@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *f=
ile, void *priv,
>  	return 0;
>  }
> =20
> +static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
> +					    struct v4l2_frmsizeenum *fsize)
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

[Severity: High]
Does this hardcoded step size properly handle V4L2_PIX_FMT_NV12_16L16?

The V4L2 specification requires both the line stride and image height for
V4L2_PIX_FMT_NV12_16L16 to be a multiple of 16, as it is a 16x16 tiled
format. By setting step_width and step_height to 2 for all formats, this
advertises that arbitrary even dimensions are valid for the tiled format.

If userspace requests a non-16-aligned dimension, such as 18x18, the driver
may calculate an undersized buffer. Because the hardware operates on
complete 16x16 macroblocks, it will attempt to DMA at least a 32x32 block to
cover the 18x18 image, resulting in an out-of-bounds DMA memory write.

Should the step sizes be dynamically adjusted based on fsize->pixel_format
to enforce 16-pixel block alignment when necessary?

> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717160547.4446=
0-1-arash.golgol@gmail.com?part=3D2
