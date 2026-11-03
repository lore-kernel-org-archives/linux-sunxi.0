Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729174;
	b=mAwDan9fsvDLl+IZ3uxQ8/kQHkmKb3Z2/muk+jQbfjSMd72Sgne3mxswrAO7QOQ8Gm0+
	 lOZ9jfivfZBvhlsqlme99+vbeIst9PN4Bgujqk/jM1h2sSicaJSDsgIeLopJItExi56VF
	 jOCedoHcI6MkdskdsQAPfLtgA7UEqDb+kfWPKoTlfxNZ+4pglST5OKWl2QwqA8LWopp+S
	 Gg2TCk9FkG4UShnOHDx1YK6eZx5zbhTIRTXNLCRCewtMkmYUBWbwzjDX9V/QwgR1FZ73w
	 VEGArTc8jANNtF2a1hcwwnsruDHFdbwZql7vV62uphUYGH23ArT7Bs7t06HjD+LVRJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
	b=0Xeg6ibm2m2w68Ptw5pKeYXqBpBCYIOryTojO5XJAgmRIHjpDU5M+cd1a0jjXwMKTxXG
	 D8nV6XUis21C8SQxtTUWid+D41NzKW/J+PJUsgAttqInjcHjgYdqDFDRNNpL/X0zBczYt
	 6ysU2V2orqFSKjxDAOeXV/TuO+Z3bcM0VckrxOpFL4XzFWHs6CZlfdpqXJJFizeEguuwp
	 z8K06nlR5cSbm7VWqn8ZGxbXJgMOxeSNKvnKg5EtqsXgEy6sKyrjtN+Gs79QSVtK5k7Ow
	 Q/TSIOV3a1D/V9rZuz53+Sy4rky0rD/4hAtFs8i0S5kV+rn2h+fq7UEzIHYF2yj3Qhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayo2jZyW;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF02606A31B
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 18:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF02606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayo2jZyW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so44649665e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729172; x=1794333972; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
        b=ayo2jZyW/YCAE+ct8TymsE5vm+W78Ah2iDoIImR7+Sdxka3WBN5BWQtCSqLKTg8nLe
         uSqSG9aToB9bzTP1FBFF0lmG425cn1wDtZRq+rMiPx84A/ioWbw4/+8IvOZj/6ZsKad1
         5P1bb3+J3u3z3CCTKyvENMbP6TBpP1kdqkBKaxJdd1yKNjtgRm4UZqm8aAtfb1ANpFTi
         kvGOhePP66h8b88plmNOp0703k0pPfQPQxoJNA+++oTR7he/YlEtxMwIHf4IxBfERO5V
         0jD9lhht3W42vd1bXlWnjoJGu5q+XxI/QoMJAzWycw5/QEAwaAk3i8bOH8AErfdmWG0y
         8wJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729172; x=1794333972;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
        b=f1GCciw/1zFqLDMYNMDkjRgBnW6NyRcexGxa10JUgxBZTyxdOpnwO2vsgA3NVcJOMs
         9EmvpcIv8UWfJoDGkTpa32kO7snxgp/PhC6rdiKpC+7T4ICfGg0+2YFecCPe78py9f1V
         5h48zuByH1BJIpF02fwM3N0kyjDaxWbd8jeREnp9HbKp11oEtAIMiItjNe2FYf8Jg2+q
         58qHiSup4zrG6W224LmyZSyhGK1yg6JJRDY0HBlZRiTh+8SaBr+U2HSSu44/Io9jv1qs
         +dlFsZmiK7X252FfI0E7Fh+pQ7TSM/SmxQw8ScOWFLj40zXs1YDNsgqQJrEx6AlYK7oD
         x2Sw==
X-Forwarded-Encrypted: i=1; AKwUvBz0ROwkaQTrrO/32MRemwrQojIM++3d3N7J2A5gIw2PI/Uc8qU+O48y1Pg7X8eO1csJLTZNv+DErsVlow==@lists.linux.dev
X-Gm-Message-State: APuU4Z/4cUIxaSMFCKCZ8qwOhxAz+9oHMi9XfGej+P87ov83Ap60L0LA
	8xnmIkH1nfLsQZ1BKWnEhB3FecmQ3fQ0V3Kq+c4dVkQOA/w3mhKCMbaU
X-Gm-Gg: AYBFou0b3zdeqrNZRC/dOTh+pYeLpbX36Hb6lY5IbedaWHlZ1aNu2L9GT6pBJ9l3lqb
	ddLG10R5anYn/ndnCCOU1IzSfziriN90lVzE84WAGgOY5fOFStdOHc7WUPAlmMhEDQe2mPkEOlT
	DgkK0WsaSPk7+9PnIabpc+ioXUEb1SmY4LGZdahQdE7xWIInRoGmMsFkTI1IVq1XgWv/xNq7Zv8
	uxFyxQLGmzjmixpneSnkYNcAU4yOyD6DumfNkOcP4GFVD2thECifOhIBB1V0MjRn/mzMj+R8eqc
	MAp9bYYFOv4D2Qnta+dQ8Y3BlXhq3s3Fr2w+6b5XPodCnu5Bd0DFWRVR4PHRNarCMhfbMN9W+O4
	yR9DL8LuF2ujvnX7lO94yXTomWdP5JJRdqK/QuwB+K/HgcNkyZgyosUW2FDxpIJ34Z0Uzs5USFH
	E7kdOYXIBf/xlQMxAtbnw5SCb8G/0X6iioUQHeoppAUGgQzw78gXh7to59Ii1y5sJBG3c0Jmgjt
	7Airxth9d5Lqzx5IGPDoQAVLpdSdoGr2quxxyS0dqcSZls/fGFpv3or8MuXeiivGAQ5WfLTb5b6
	lolrG8p5sX3Hlo4I/td0Mv2KxIYFCsWDKoH1lcD7zvS/VshiES4wwFlfoML1dD9zex/YnPkOUQu
	xn31B47BORICQjnMeZIaQz6wPy6Arcd2PJD9vQ/emSjk6KPOqJJuwk6XoUQt1eIuuywWwbUvnOk
	qaH/WynqBioPXCMJgs+44eHkk7DtG9/yAsNwRyFqk0tCj2BBA/OwoAXKfmWBNGAHOy2JMp0S0EY
	EItRwOnL4yCKYlvQurVoZYA19G8YPyEJ/m5g5WEgSGDUVEuvQUKFXlvcfftcMvBYBljwH0QU+s4
	xwHKizo=
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr284061485e9.23.1793729172136;
        Tue, 03 Nov 2026 10:06:12 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm82769945e9.4.2026.11.03.10.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:06:10 -0800 (PST)
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
 Re: [PATCH 03/10] staging: media: cedrus: h264: mark long-term references in
 the frame info
Date: Tue, 03 Nov 2026 19:06:09 +0100
Message-ID: <zYI0QcxKSEeu6sHIbu0-3w@gmail.com>
In-Reply-To: <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-4-jernej.skrabec@gmail.com>
 <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
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

Dne ponedeljek, 2. november 2026 ob 19:50:44 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Hi,
>=20
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The frame info of a reference has a reference type for each field, in
> > bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
> > long-term reference. The driver never sets it, so the hardware handles
> > long-term references like short-term ones, also where they differ, like
> > in temporal direct and implicit weighted prediction. The vendor library
> > sets it.
> >=20
> > This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
> >  drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers=
/staging/media/sunxi/cedrus/cedrus_h264.c
> > index 892193c12b2f..a716955655f7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *=
ctx,
> >  				struct cedrus_buffer *buf,
> >  				unsigned int top_field_order_cnt,
> >  				unsigned int bottom_field_order_cnt,
> > +				bool long_term,
> >  				struct cedrus_h264_sram_ref_pic *pic)
> >  {
> >  	struct vb2_buffer *vbuf =3D &buf->m2m_buf.vb.vb2_buf;
> > +	u32 frame_info, ref_type;
> > =20
> >  	pic->top_field_order_cnt =3D cpu_to_le32(top_field_order_cnt);
> >  	pic->bottom_field_order_cnt =3D cpu_to_le32(bottom_field_order_cnt);
> > -	pic->frame_info =3D cpu_to_le32(buf->codec.h264.pic_type << 8);
> > +
> > +	ref_type =3D long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
> > +			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
> > +	frame_info =3D VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
> > +		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
> > +		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
> > +	pic->frame_info =3D cpu_to_le32(frame_info);
> > =20
> >  	pic->luma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0)=
);
> >  	pic->chroma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, =
1));
> > @@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> >  		cedrus_fill_ref_pic(ctx, cedrus_buf,
> >  				    dpb->top_field_order_cnt,
> >  				    dpb->bottom_field_order_cnt,
> > +				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
> >  				    &pic_list[position]);
> >  	}
> > =20
> > @@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> >  	cedrus_fill_ref_pic(ctx, output_buf,
> >  			    decode->top_field_order_cnt,
> >  			    decode->bottom_field_order_cnt,
> > +			    false,
>=20
> nit: Not a hard objection, but I really hate boolean parameters. It could=
 be a
> simple as:
>=20
> +			    false, /* short term reference */
>=20
> Or using an enum. My preference being documented here, its yours to decid=
e.

I'll use VE_H264_FRAME_INFO_REF_TYPE_* as parameter. I have to fix sashiko
issue anyway.

I'll keep your Reviewed-by, unless you object.

Best regards,
Jernej

>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> >  			    &pic_list[position]);
> > =20
> >  	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers=
/staging/media/sunxi/cedrus/cedrus_regs.h
> > index 05e6cbc548ab..961fe023bb43 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > @@ -616,6 +616,14 @@
> >  #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
> >  #define VE_AVC_SRAM_PORT_DATA		0x2e4
> > =20
> > +/* Frame info word of a frame buffer list entry in the AVC SRAM */
> > +#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
> > +#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
> > +#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
> > +
> > +#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
> > +#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
> > +
> >  #define VE_VP8_PPS			0x214
> >  #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
> >  #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, =
28)
>=20




