Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728967;
	b=bIRZ9iSFw9wMfqWiqneUL7axVyfypAfLhQda5T9ARsGKmCqUMxAQtjkyGdQnLk2T4IAm
	 qAaO3YRq7BROsiRwe4XYTrJQcVH+p1SFvsUEO5bXc/1UPuvN1poANDOwiJKtrOsM2Cj+b
	 zCs4FCNdFTSqT67E7l7JZxHh+7F1RkgFPe+IBfkkHUPRaciAcPznfmOrZ4gCCAjfp5+sR
	 yJpwK1BH3W16TGcOTPdzJD2B4qtYrMWKobEuGBp1vP9z/M/z1qAdQ+nsisoAW5oZo8Whc
	 8ESEi+jx71fB8/e0r12Qt/5w2K0vjF6W4IkpIANvqbFzLyX30jbjD+Y12WWZbfkOHhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
	b=ChmIOtHcoDktG/SkRnN7tLMuOg5Rjet+8FnJ8i9wQGwna4csD7X7iWlOqCZkmbb16rY2
	 /CHnPTjWvOhboozNTSQ0gsySfzVtuGxvez5y0q2hO0NbiTx3BWL4SvNk6QCIz6lgIVDwX
	 qzp0rzRhQPrvYt2VHnY8eP14L4sYQZJ/U1H6il4bVgeJfpiBgegpXSGhVQxBpd/KoIO4l
	 Gu2cHJuvRUGTB51GXpocs5N0QzS4t0fM1lo8tJY5vlCY1qIpkpVrHt7Th8baPoQ66mE+X
	 YPE9VekSeagEhZ1r5XFU11+DRaTPw+6scd313nccCwcBBZtw855YjiGn3+v8ZDM/JuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDEB606A328
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 18:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDEB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2307011f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728960; x=1794333760; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=RxE11tTb71EJc6te/ZoyrKJ/UP/Et6Kk/UIR3f9MjaJO5JTVpHQZMWaVOzyIpZQmQl
         jJdeptMfIquSA+nTj3k2musnAQtbDlV4rRDpX68FJyS9myUiemEH+IOiMe4RiXE1+yMy
         w81xeE//+cESpmehKf94kRhSEGQ/VWMsRZjkSikRqezj1B4gnDTLae3h4twtnOqyyCFk
         8RE7bXoMkY8vQCJtBuHyYBFMcknI7SkoD5YUiPgckVP1KPYe5d91b0AhZH1bn9xk422B
         53lQGGI5URQ58v4zORNDxz9RVsZi2bVrEsRunoRWCgAwIVXhMOlHc1H4eY1gUrwdTWD7
         1Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728960; x=1794333760;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=pFrfr8mu6RI9dviXbehLS1m1+OsmnHVTLZolXTUM63ev/z5Oda3psPxNno3GnGXVg7
         NacY1fRIJMnmvPexI1zx5guP4fGEzikgVUceZoRsYIrhFwAdZtMTJjNvh+zOLgnEIpZI
         ZUeQOptKNysKRvhwVsF2GEl1CBryoSmTBi+UPn8c3Qb4QNw98vgVsqL5JIrr4afGJR3e
         h9oKX5biKCpk+0Ic1lQNek32b0GvkjPXhYqganZTwZZDS0iLauMEmM75ECS0pyR9T3p8
         YWDbpoLUD2JUukVLQt2vZpaEiJoUqB47fB5omEr05jkactmeNGzjQEOIfrE1rHbcy0Ff
         YuKg==
X-Forwarded-Encrypted: i=1; AKwUvBzeUocR+AFIA3I8cedA0BSGHg9uONLxYUJSY9Gz+I9Dp5b8Zeaui4sDIV7gabLpb2t9JKDfoUhG6xvcPQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z98zI7HRUA2dgd4xO0g5Up8uLBBUWiSC5Hhcioemb798YpzVhXp
	byGAsChXipp2tDw7EEXa+JAo/P7uEA/S6BIyGFyBFaKhKdl4IbfviVEIWtvi5w==
X-Gm-Gg: AYBFou2wEFxZ7IhgLUXUBzrUnBJ4nvpi9q1kFdnEP+MnVFAAtmDDfdc+d3mqhbI9yIz
	nXQ/CAcnV+bIaY+1Ufif/hGE5KeCYbRL5GeZiCYbEGlRp4h+hfKUnOmHE25aDdmcfFM7wvKfesb
	zPIcS6f8DGdmycKKq6/lmxT2MLueR7gmj8+RghCrScO++9y95nQuRUkddnF1uFd0FHB1TzLF2aV
	qyBPMCRtgy3WOVkEk7wSFzpX6D0eUtFqye9EbJK6ab5s/RZ3Hg1SLw0vdeum82QUNV6oWmWmqmP
	OV+3mYoYiTb7tm7ca8dsWLpbRAHTe2RKG7qHzyoRM0QgBXVoY3KdBIGe9eqGnOAvm0IAhWK72wB
	j4nQCmG1EBKYkTnTM4O9rAC9L11yh7X+wDsFwlQkPW1yWNFjbu/PDKB7NdIYzYEGckyl1Q1i7tN
	RslfGq8RVt0/TF2XcOsnzOP9+uXqeqQz7sdAPY8F0fosx4F2DD1mot8OCvIAMdbCG3Hpliy6jQu
	6c/m8Vr3MTCAzZHVQcS2UDEFeqoUexdaa+BN944qrcE6Bbm0IfJXJnRr8swKeYdiLJfsE5BtmUD
	2hApYeCDzmB5b+keJhyFLLOzA/5dir2O382wA+HKeNYLGwMxGK7UhYhs0BIHfmSWqxYFWMc+0ew
	z9kgvgAFUAnYFACuxn24uiFMRA2FF5Xuw6r5Fc0lUx/xxW6/vnOXPnSxSi+M6yQCjwQ5T1iCmY7
	1GK+Min0RhvN5kfnH1hro43lRSHF+qT/WElXMSLtIx1ao5th8rH2eF31ZP927bWk4mC4NJYt15C
	WYhgwYRuXztuXM9gGhkXmTGIBHDAFCEroAtXiBhz6iJkwn0Yk05EZEQiJ1XDA==
X-Received: by 2002:a5d:5d09:0:b0:48e:4835:de5f with SMTP id ffacd0b85a97d-48e6e4fcf2amr28751210f8f.47.1793728959547;
        Tue, 03 Nov 2026 10:02:39 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm26248330f8f.46.2026.11.03.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:02:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Tue, 03 Nov 2026 19:02:37 +0100
Message-ID: <P3FCc6YrSeexw_Zto5zS4g@gmail.com>
In-Reply-To: <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-3-jernej.skrabec@gmail.com>
 <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 2. november 2026 ob 19:44:38 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The hardware decodes whatever picture size the SPS describes. An SPS
> > beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
> > are allocated, makes the hardware overrun memory and hang. On H616, the
> > JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
> > 4216x528) leave the hardware wedged, so that every following job times
> > out until reboot.
> >=20
> > Validate the SPS picture size in try_ctrl. Move the size limits to
> > cedrus_video.h for that.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
> >  .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
> >  3 files changed, 44 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stag=
ing/media/sunxi/cedrus/cedrus.c
> > index c3331b4f3f02..45deebddb630 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > @@ -28,10 +28,38 @@
> >  #include "cedrus_dec.h"
> >  #include "cedrus_hw.h"
> > =20
> > +/*
> > + * The hardware decodes whatever picture size the bitstream headers de=
scribe.
> > + * Reject sizes beyond the hardware limits, or beyond the capture buff=
ers once
> > + * they are allocated, instead of letting the hardware overrun memory =
and hang.
> > + */
> > +static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u3=
2 height)
> > +{
> > +	struct vb2_queue *vq;
> > +
> > +	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The hardware decodes whole 16x16 macroblocks, and all capture
> > +	 * formats pad the buffers to at least 16 pixels in both directions.
> > +	 */
> > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > +	if (vb2_is_busy(vq) &&
> > +	    (width > ALIGN(ctx->src_fmt.width, 16) ||
> > +	     height > ALIGN(ctx->src_fmt.height, 16)))
> > +		return -EINVAL;
>=20
> If my memory is correct, Hans rejected this kind of construct in try_ctrl,
> because if you are only doing try() it shouldn't fail like this. Instead =
we can
> validate in the real s_ctrl, but I believe the downside is that it makes =
the
> error asynchronous when a request is used (perhaps that's actually wanted=
 ?)

You're right. This is not the best place to check size, since it can be
bypassed as sashiko bot find out.

My suggestion for v2 is to split this to two stages. Max width and height
check stays here, whereas buffer size check is moved to setup() callback.
=46ailing there it will mark buffer with V4L2_BUF_FLAG_ERROR.

What do you think?

Best regards,
Jernej

>=20
> Nicolas
>=20
> > +
> > +	return 0;
> > +}
> > +
> >  static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> > +	struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_=
ctx, hdl);
> > +
> >  	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS) {
> >  		const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> > +		u32 height;
> > =20
> >  		if (sps->chroma_format_idc !=3D 1)
> >  			/* Only 4:2:0 is supported */
> > @@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  		if (sps->bit_depth_luma_minus8 !=3D 0)
> >  			/* Only 8-bit is supported */
> >  			return -EINVAL;
> > +		height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> > +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> > +			height *=3D 2;
> > +		if (cedrus_check_pic_size(ctx,
> > +					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
> > +					  height))
> > +			return -EINVAL;
> >  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
> >  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> > -		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus=
_ctx, hdl);
> >  		unsigned int bit_depth, max_depth;
> >  		struct vb2_queue *vq;
> > =20
> > @@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  			/* Only 4:2:0 is supported */
> >  			return -EINVAL;
> > =20
> > +		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
> > +					  sps->pic_height_in_luma_samples))
> > +			return -EINVAL;
> > +
> >  		bit_depth =3D max(sps->bit_depth_luma_minus8,
> >  				sps->bit_depth_chroma_minus8) + 8;
> > =20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.c
> > index adc7f255d7cf..2521315abdb7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -29,11 +29,6 @@
> >  #define CEDRUS_DECODE_SRC	BIT(0)
> >  #define CEDRUS_DECODE_DST	BIT(1)
> > =20
> > -#define CEDRUS_MIN_WIDTH	16U
> > -#define CEDRUS_MIN_HEIGHT	16U
> > -#define CEDRUS_MAX_WIDTH	4096U
> > -#define CEDRUS_MAX_HEIGHT	2304U
> > -
> >  static struct cedrus_format cedrus_formats[] =3D {
> >  	{
> >  		.pixelformat	=3D V4L2_PIX_FMT_MPEG2_SLICE,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.h
> > index 8e1afc16a6a1..367e52158f01 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > @@ -22,6 +22,11 @@ struct cedrus_format {
> >  	unsigned int	capabilities;
> >  };
> > =20
> > +#define CEDRUS_MIN_WIDTH	16U
> > +#define CEDRUS_MIN_HEIGHT	16U
> > +#define CEDRUS_MAX_WIDTH	4096U
> > +#define CEDRUS_MAX_HEIGHT	2304U
> > +
> >  extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
> > =20
> >  int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>=20




