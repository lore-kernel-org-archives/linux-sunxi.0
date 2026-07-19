Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10705283142
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784448481; cv=none; b=KjSCdlsI7X3fGkURxwIzagjdLXa7kjhLFTtB+sw3EYeJhhDAjJ5E3hOGGR7UqcijQPJmT30YYH7um9+1b6iA26pmUBo1WPZbYETfvA+uPDHafK3AoWDce383Rj04PU+ahC6z5GfBLBqu3+0COy9eXPQ9CF6gBgF9QAObggdkKhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784448481; c=relaxed/simple;
	bh=ZnadcBjdm7eehoSg8IvCqxDUhXboUr4otE+USSD4jvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ls8wjl0f1nPvzukUAfXq1FPj1PMrLrqhJWNhJFdVuIuYKhMc65Noul3GR9eG/GwmN4tVclQT+02o101Zt1Ol95r1+p/WGSNzt3FyksqxBBypHh/hd2ZvQ1X6+Whod4XWnI5WupGIEZgKgQGUi6g/+cVymWGUAb245F7j8rZMJaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRTmeEqa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRTmeEqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD221F000E9;
	Sun, 19 Jul 2026 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784448479;
	bh=LkwhkGQ3lB4eV/qP1APbXVZabGpCQW1mHcmX3dXZI/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CRTmeEqaVcChpiZa0IwiK/4LnBfuD63g3kBrnsgdj2z3LzcFXSyrHY03BDS9itecQ
	 DsFo+2Zjwqb84z6RJ3pNmVNwp5AioxAbOExUsGeNgrzN9MtzeKGF/A/kddtyDrI9Y0
	 /PNIF8on1n/jdFzsW06SP89vBnYw5g/mVn6QG+sifORYx9ZrCIG4UTffqihWwOoJMF
	 O99FTlMN6kZp9CRIbJnC5ag0NI85kNv29yjX2gAtN4gA9Lq2QiKfDc4drBhnsY3P/W
	 eKHvpOiTfiaagioR6mtyy029d0i5g+/OrbdtGjyOjRNSViqzi9tG+GXCsk6hbJ/kYr
	 JfHhRdLbAqIaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: sun6i-csi: capture: Implement
 vidioc_enum_framesizes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260719112714.72802-3-arash.golgol@gmail.com>
References: <20260719112714.72802-1-arash.golgol@gmail.com>
 <20260719112714.72802-3-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 08:07:59 +0000
Message-Id: <20260719080759.7BD221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Inconsistent frame size constraints between `VIDIOC_ENUM_FRAMESI=
ZES` and `VIDIOC_TRY_FMT` / `VIDIOC_S_FMT` for `V4L2_PIX_FMT_NV12_16L16`.

Pre-existing issues:
- [High] `TRY_FMT` calculates `sizeimage` incorrectly for `NV12_16L16` with=
 unaligned dimensions, leading to potential DMA buffer overflows.
--

--- Patch [2]: [PATCH v5 2/2] media: sun6i-csi: capture: Implement vidioc_e=
num_framesizes ---
commit f5cc5843b18ce4fd2988ebb6c61247d1f5cd63a3
Author: Arash Golgol <arash.golgol@gmail.com>
media: sun6i-csi: capture: Implement vidioc_enum_framesizes

This commit reports the stepwise frame size range supported by the CSI
capture hardware for the pixel formats exposed by the driver.

> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index d90abba213098..e17c7f82ff478 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -738,6 +738,33 @@ static int sun6i_csi_capture_enum_fmt(struct file *f=
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
> +
> +	if (fsize->pixel_format =3D=3D V4L2_PIX_FMT_NV12_16L16) {
> +		fsize->stepwise.step_width =3D 16;
> +		fsize->stepwise.step_height =3D 16;
> +	} else {
> +		fsize->stepwise.step_width =3D 2;
> +		fsize->stepwise.step_height =3D 2;
> +	}

[Severity: Medium]
Will this lead to inconsistent frame size constraints?

While this reports a 16-pixel step width and height for
V4L2_PIX_FMT_NV12_16L16 via ENUM_FRAMESIZES,
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c:sun6i_csi_captur=
e_format_prepare()
(used by TRY_FMT and S_FMT) unconditionally uses v4l_bound_align_image()
with an alignment of 2:

	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
			      SUN6I_CSI_CAPTURE_WIDTH_MAX, 1,
			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, 1, 0);

Could this allow userspace to successfully request sizes via TRY_FMT that
ENUM_FRAMESIZES claims are unsupported, potentially leading to
v4l2-compliance test failures and contradictory format negotiation?

[Severity: High]
This isn't a bug introduced by this patch, but does TRY_FMT calculate
sizeimage incorrectly for NV12_16L16 with unaligned dimensions?

Since
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c:sun6i_csi_captur=
e_format_prepare()
allows width and height to be unaligned multiples of 2 and computes
sizeimage purely linearly:

	case V4L2_PIX_FMT_NV12_16L16:
		pix_format->bytesperline =3D width * 12 / 8;
		pix_format->sizeimage =3D pix_format->bytesperline * height;
		break;

Could this lead to a DMA buffer overflow?

The CSI DMA hardware natively writes in 16x16 tiles. If a user requests an
unaligned frame size (e.g., 34x34) for V4L2_PIX_FMT_NV12_16L16 via
VIDIOC_TRY_FMT, the allocated vb2 buffer will be smaller than what the
hardware DMA actually writes.

For example, a 34x34 image will be written as 3x3 tiles (48x48 pixels),
consuming 3456 bytes. However, the allocated buffer for 34x34 is only 1734
bytes (34 * 1.5 * 34), which would cause a buffer overflow when the DMA
writes the padded tiles past the end of the allocation.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719112714.7280=
2-1-arash.golgol@gmail.com?part=3D2
