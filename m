Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640416;
	b=dMQNU5ugALX/nOJNS63LOAfMn3aHbkNu5y+CZU+lMvpySRGJX/x+Je8Q7wpsu/Ag/QFv
	 udDeopfsPFIkbD1TRXjufaCioS54dq4Xtdu3Wxdz2zBaq3TCHv1ZBJtFmHlt1RaJa2ZbZ
	 Ku3GrugADih5aBXTKfMzBRhkDKdllQe0WXJibu4vx2pClb6BYbAGND018KsfeHCfoWxdM
	 /z/zcM3KlPXxwUUMjJOD8DbB1K/R5cWQc5JYqQkEQNb6sewu2p7R8WTH2H8rD++OaKzgu
	 eIflWfmTdBb0bS9LTxOIDi/Ttv+rxoDp4LsIOVIIfARa1MjKE6IGgBRmfOqrNfjYI2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640416;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vEGJEGxLB3p5i8hlqs0c7rof3xID92Xp+Mma3lJrE/g=;
	b=uIP0lFfhuRhnD+nOzrXZfH0BWWoPrf+N2SjwX4L3N8LswdaTHySmX2vWRHqbHKCsdW6N
	 9MKj515Z0fuSAsTfQU2VtYXZZZxp5ENMnqpyfvLk+syjYaKstv7ns0HzeNcZmNMsvq7H/
	 gBdwSrVLezQnP16dDnHKT3QgANo217ogngQAW3LYI4vlUSBAGa0X/XlxYPGrsXpMpOwHu
	 hki9uDDh70RX1phQEleQ+/UZy6NyGPJ4usYkGQRGfUqN9K/3mHQ/bl/1CjFzw70g5IebJ
	 fZmf0lPON3xQtTeNfR/8psl9ch/KkdML5wDUPhK2Fr5i8c7cNPZlWQayYvDwgerD5GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpISyzG2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2366B606A329
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpISyzG2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCCF1F00A16;
	Mon,  2 Nov 2026 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793640415;
	bh=vEGJEGxLB3p5i8hlqs0c7rof3xID92Xp+Mma3lJrE/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BpISyzG2L5drpdxoQOFnCslHBE+ctvorenouEKRjNGxdoZDwjWAJGhm0X2haF7rT9
	 QxFhtbokXg+zNfW6SVfuXkEyIFw2Z67Z/g3BMV4OTFUPi36P64LrCCoNNMV3gzk3zZ
	 nHAcPvJBvtQKlOBJzvoTUvUb4GrllIGVA87O39ZSoxuf+0SV7iGL22A4OVzLzVdukM
	 vx+j79kz3EVogH7bIAp1bvaE6bDkwse0erfRJgorIKstGd/HJSuvKEUvtzen78zqSV
	 4/iEL6T0viMBVAad6eUjSajSmbn667SkWHWRh//ZjwgnVC/g85tXg/gNUxnGdJbySp
	 viUttyYtT1kpQ==
Message-ID: <sashiko-outbox-193832@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] staging: media: cedrus: reject too large
 H.264/HEVC SPS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20261102170303.1973892-3-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-3-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:26:55 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: cedrus: SPS size check in cedrus_check_pic_size() bypassed
--

commit 22d806de7dc3cc25db6d7871ebfc3e81dbda3078
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

staging: media: cedrus: reject too large H.264/HEVC SPS

This commit validates H.264 and HEVC SPS picture dimensions in
cedrus_try_ctrl() against hardware limits and allocated capture buffer
dimensions to prevent memory overruns and hardware hangs.

> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index c3331b4f3f020..45deebddb630e 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -28,10 +28,38 @@
>  #include "cedrus_dec.h"
>  #include "cedrus_hw.h"
> =20
> +/*
> + * The hardware decodes whatever picture size the bitstream headers desc=
ribe.
> + * Reject sizes beyond the hardware limits, or beyond the capture buffer=
s once
> + * they are allocated, instead of letting the hardware overrun memory an=
d hang.
> + */
> +static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u32 =
height)
> +{
> +	struct vb2_queue *vq;
> +
> +	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
> +		return -EINVAL;
> +
> +	/*
> +	 * The hardware decodes whole 16x16 macroblocks, and all capture
> +	 * formats pad the buffers to at least 16 pixels in both directions.
> +	 */
> +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (vb2_is_busy(vq) &&
> +	    (width > ALIGN(ctx->src_fmt.width, 16) ||
> +	     height > ALIGN(ctx->src_fmt.height, 16)))
> +		return -EINVAL;

[Severity: High]
Can the check against ctx->src_fmt in cedrus_check_pic_size() be bypassed
when V4L2_CID_STATELESS_H264_SPS or V4L2_CID_STATELESS_HEVC_SPS is set
before capture buffers are allocated?

While vb2_is_busy(vq) is false on the V4L2_BUF_TYPE_VIDEO_CAPTURE queue,
cedrus_check_pic_size() only checks that width and height do not exceed
CEDRUS_MAX_WIDTH and CEDRUS_MAX_HEIGHT (4096x2304). Unlike the HEVC
bit_depth handling in cedrus_try_ctrl(), setting the SPS control while
!vb2_is_busy(vq) does not update ctx->src_fmt or ctx->dst_fmt. In addition,
cedrus_s_fmt_vid_out() in drivers/staging/media/sunxi/cedrus/cedrus_video.c
allows userspace to shrink ctx->src_fmt and ctx->dst_fmt (down to 16x16)
at any time before capture buffers are allocated:

drivers/staging/media/sunxi/cedrus/cedrus_video.c:cedrus_s_fmt_vid_out() {
	...
	peer_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
				  V4L2_BUF_TYPE_VIDEO_CAPTURE);
	if (vb2_is_busy(peer_vq))
		return -EBUSY;

	return cedrus_s_fmt_vid_out_p(cedrus_file2ctx(file), &f->fmt.pix);
}

Also, if userspace never sets V4L2_CID_STATELESS_H264_SPS, the default
zero-initialized control has V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY unset,
giving a 16x32 picture height while cedrus_open() initializes ctx->src_fmt
and ctx->dst_fmt to 16x16.

When capture buffers are subsequently allocated, cedrus_queue_setup() sizes
the capture buffers from ctx->dst_fmt, and cedrus_h264_start(),
cedrus_write_frame_list(), and cedrus_h265_setup() size the auxiliary DMA
buffers (pic_info_buf, deblk_buf, intra_pred_buf, and mv_col_buf) from
ctx->src_fmt. Neither cedrus_start_streaming() nor the codec setup
callbacks re-validate the active SPS against ctx->src_fmt.

If the larger SPS was set on ctx->hdl before VIDIOC_REQBUFS(CAPTURE) and
subsequent requests do not attach a new SPS control, cedrus_try_ctrl() is
not called again after vb2_is_busy(vq) becomes true. Even if the oversized
SPS was attached to a media request before VIDIOC_REQBUFS(CAPTURE),
cedrus_device_run() in drivers/staging/media/sunxi/cedrus/cedrus_dec.c
ignores the error from v4l2_ctrl_request_setup():

drivers/staging/media/sunxi/cedrus/cedrus_dec.c:cedrus_device_run() {
	...
	if (src_req)
		v4l2_ctrl_request_setup(src_req, &ctx->hdl);
	...
	ctx->current_codec->setup(ctx, &run);
	...
	ctx->current_codec->trigger(ctx);
}

Wouldn't this still allow the hardware to decode using an SPS larger than
the allocated capture and auxiliary DMA buffers, overrunning memory and
hanging the VPU?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102170303.1973=
892-1-jernej.skrabec@gmail.com?part=3D2
