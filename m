Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248192;
	b=0Ux+J/FeanFJ47lThl1QKiWbksFjwH8GYF04kZepgmPPrixCwYBhJmWLCBdCGywlJ0gl
	 MKkGWWAesC8y50mqL0oiDDV4UeRyQ2uAJ03h9KN0j+7q2+ImgKVut23nhENUPtxzVH7r1
	 uWsyto4uX5wl8tbkHkUi6dhBTZlG+QM5OgO3gK/oGEO5X5iqHZthhs0DfHLg7VQx5ARYi
	 khgkR6nBEQtZGHJgw/M0uPWXtwJX/mVECHFcvKpnKTECnOpFNrKqoIxQg3tgthclCeD5Z
	 NdixUK8zY5FyQIhJ+/6FsMwRxQeB9usRQjRfy7hDYnR0QMiKRU1+vYG9Ya0WCvXgUiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248192;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mRlUhUTY3LfryvluQX0Sluqg6TJinRrkrm+KId7LW4A=;
	b=VhHEWL+qWPkZ8dQ0riZnKop5RCvqgtk56paAOlZAOtNz+/CV+y+j+qmyOpa5OHOL8lEn
	 +mrL0k8N38PaDCdDhO6P/RtZHoSFiL7cycoLEwc/xDssyKEIodkzIq9KduSvkGLnWjUw4
	 ZIVZERfteZCvjIvBY0liDTYWuNnl2Oz0wNQ4/tralApEsyuIosjZVmfqnEFgrGU68CbyD
	 mFJCYPi5saQDcYD+vsrnjX84QoERirtTUEUZKX/fHk2xv+6sJIJcIyoRIR78t3qEk2mhw
	 6S0S2BLuaUKV6gO0aZnNIZlC93GSvPNM5HaQvcPIy+oGdb1vsr2c5TQzxUOiXKy2eYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5TEmtP1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477B606A331
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 18:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5TEmtP1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656EA1F0089F;
	Mon,  9 Nov 2026 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248191;
	bh=mRlUhUTY3LfryvluQX0Sluqg6TJinRrkrm+KId7LW4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5TEmtP1SZmfk58otqAtBWoJCbB+XgESJMkaiQS/pjJXdwFCuTfiEclVIuE6aqXHk
	 bCSe+mXyltPf8bRD389vyOeti5L+V9C9UdPKDssGTWF0V67O+padVWmciD+tIXRPBW
	 /GlpF9xgKfm7n/UUbh9qhoYMdruoyzJc+Uv9bg6py4G+vL337VgaphrTHPDsVO9Ty0
	 GaqcPo3GM6/LmZcHPOFkJ4QK3Hwf2nd3zcP9zNelPmrwB3k/4FIL2hKRqFCfNJjRfZ
	 Za8pPM/90tz7zvveUrdyBSNCLdm8lEwfI8cxJ2beke8rqVXTWQ0Akc6VuoIjjuK3J8
	 KM55B95Tus92A==
Message-ID: <sashiko-outbox-205387@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/11] staging: media: cedrus: reject too large
 H.264/HEVC SPS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20261109175016.42061-3-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
 <20261109175016.42061-3-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 18:16:31 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: cedrus: missing lower-bound check in
  cedrus_check_pic_size()
--

commit 2d66c4366bc66c197579905e0bf065bb7fd5088c
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

staging: media: cedrus: reject too large H.264/HEVC SPS

This commit checks H.264 and HEVC SPS picture dimensions against the
maximum hardware limits in cedrus_try_ctrl() and against the aligned
source format dimensions in the codec setup callbacks.

> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index 54f867949fbae..c2318521d7e5a 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -274,6 +274,40 @@ cedrus_is_capable(struct cedrus_ctx *ctx, unsigned i=
nt capabilities)
>  	return (ctx->dev->capabilities & capabilities) =3D=3D capabilities;
>  }
> =20
> +/*
> + * The decoders take the picture size, or the position of the slices, fr=
om
> + * the bitstream headers. Check that the picture fits the buffers, which=
 are
> + * sized from the OUTPUT format and padded to at least 16 pixels in both
> + * directions, so that the hardware doesn't overrun them and hang.
> + */
> +static inline int cedrus_check_pic_size(struct cedrus_ctx *ctx,
> +					unsigned int width, unsigned int height)
> +{
> +	if (width > ALIGN(ctx->src_fmt.width, 16) ||
> +	    height > ALIGN(ctx->src_fmt.height, 16))
> +		return -EINVAL;
> +
> +	return 0;
> +}

[Severity: High]
Should cedrus_check_pic_size() and cedrus_pic_size_supported() also
reject zero dimensions or sizes below the 16x16 minimum?

Unlike H.264 where cedrus_h264_sps_width() and cedrus_h264_sps_height()
are always at least 16, v4l2_ctrl_hevc_sps stores raw sample counts in
pic_width_in_luma_samples and pic_height_in_luma_samples.  Those fields
default to 0 in std_init_compound() and are not rejected when 0 by
std_validate_compound().  If userspace submits an HEVC decode request
without setting the SPS control, or sets pic_width_in_luma_samples to 0,
both checks pass and cedrus_h265_setup() divides by zero when computing
ctb_addr_x and ctb_addr_y:

drivers/staging/media/sunxi/cedrus/cedrus_h265.c:cedrus_h265_setup() {
    ...
	width_in_ctb_luma =3D
		DIV_ROUND_UP(sps->pic_width_in_luma_samples, ctb_size_luma);
    ...
	ctb_addr_x =3D slice_params->slice_segment_addr % width_in_ctb_luma;
	ctb_addr_y =3D slice_params->slice_segment_addr / width_in_ctb_luma;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109175016.4206=
1-1-jernej.skrabec@gmail.com?part=3D2
