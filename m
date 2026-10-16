Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBA1EB1AA
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151260; cv=none; b=iBov4CzgBv0H48kuHAS/ffbjIJJ5GOFGo8lcGzM2g9VCZRwgx3/JaIlVWICjgtM7k+5wzJxB3ebSS+keWXbr7SbVXzEPZllcT+5oXNJQa7bS6wbaUAhyI7jbSYfS2pDBLuIcwNMDkrxPkj1j+TWxTNvCZchZp7T10fQwoBXjRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151260; c=relaxed/simple;
	bh=BYaSOzUomSuydhvlNihLqd+YPezWxkY82osHZM7wmrY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Oqb9kqVTOKqfuqlz5gJHBfv5Lqn5YZ7hKDbVrnkgXDPRlKPyLaY7ET41nPRULyZg1NiE1aok7WrXUSqeJ0WBYfitv83CmhZm/UvbY8eKILER6EsmzsYuk/8l7H1b7dbjS1iU+krVXpfN7AGTLwOSXl1c2cC2FGgeEoSK9koA/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3InK1bq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3InK1bq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E4C1F000C4;
	Fri, 16 Oct 2026 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792151259;
	bh=RSbmLgg4YfH5mF6pTMPPJd7h59XepvR4Zi+UMJU3DVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O3InK1bqSZdQ+YnoIIIh3KdpvLS8G85B36JwkQVEzqYZGuzgGxuei6UfuALGKOpP/
	 KO5/1BlGe/vKqlmz48TIePRpZAO6/4sX32YqscJUypTT12W6xklZvaSAMvYec/5aCu
	 cnCL+ty6/7vv2Tc5aBcvyAChLPEG/TTHVxVHcjLcj20+C9bAVjOR40Ks7usOyak1wa
	 nKO5DmQ+hjuFeRs58hjm6DE+w7HPAY26/MoBKzZUFu8g98XZNLuwnOXBE0uNCCzetJ
	 sMRCGabeV5yyfx7t8X+8HGzre4nnBDwZae7B/3AUGqjGsxCfWLQlI5Sj2LWIs+8vmt
	 cJnoe1gixBF2g==
Message-ID: <sashiko-outbox-174251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] media: sun6i-csi: capture: Align size to 16 for
 NV12_16L16
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>, linux-sunxi@lists.linux.dev
Cc: media-ci@linuxtv.org
In-Reply-To: <20261016113846.8602-2-arash.golgol@gmail.com>
References: <20261016113846.8602-1-arash.golgol@gmail.com>
 <20261016113846.8602-2-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 11:47:38 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: sun6i-csi: incorrect bytesperline for NV12_16L16 format
--

commit 476de016f26cd243aac004fdf752c97c70ae693b
Author: Arash Golgol <arash.golgol@gmail.com>

    media: sun6i-csi: capture: Align size to 16 for NV12_16L16

This commit introduces alignment handling specific to pixel formats in the
sun6i-csi capture driver. It sets the required alignment based on the format
and applies it during format preparation.

> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index d90abba213098..f55edfd0b174a 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c

[ ... ]

> @@ -665,17 +671,19 @@ static void sun6i_csi_capture_format_prepare(struct=
 v4l2_format *format)
>  {
>  	struct v4l2_pix_format *pix_format =3D &format->fmt.pix;
>  	const struct v4l2_format_info *info;
> -	unsigned int width, height;
> -
> -	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
> -			      SUN6I_CSI_CAPTURE_WIDTH_MAX, 1,
> -			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
> -			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, 1, 0);
> +	unsigned int width, height, align;
> =20
>  	if (!sun6i_csi_capture_format_find(pix_format->pixelformat))
>  		pix_format->pixelformat =3D
>  			sun6i_csi_capture_formats[0].pixelformat;
> =20
> +	align =3D sun6i_csi_capture_format_align(pix_format->pixelformat);
> +
> +	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
> +			      SUN6I_CSI_CAPTURE_WIDTH_MAX, align,
> +			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
> +			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, align, 0);
> +
>  	width =3D pix_format->width;
>  	height =3D pix_format->height;
>
> 	info =3D v4l2_format_info(pix_format->pixelformat);
>
> 	switch (pix_format->pixelformat) {
> 	case V4L2_PIX_FMT_NV12_16L16:
> 		pix_format->bytesperline =3D width * 12 / 8;

[Severity: Medium]
Does this code violate the V4L2 API contract by incorrectly hardcoding
bytesperline to 1.5x width as a shortcut to calculate the correct sizeimage?

The V4L2 specification requires bytesperline to reflect the stride of the
largest plane, which for NV12 is just width. By exposing a stride of
1.5 * width, userspace applications may compute out-of-bounds plane offsets,
potentially leading to memory corruption or crashes within the userspace
client.

This is supported by sun6i_csi_setup_format(), which configures the
hardware using the correct luma and chroma strides of width internally:

drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c:sun6i_csi_setup_=
format() {
	...
	switch (pixelformat) {
	...
	case V4L2_PIX_FMT_NV12_16L16:
		luma_line =3D width;
		chroma_line =3D width;
		break;
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016113846.8602=
-1-arash.golgol@gmail.com?part=3D1
