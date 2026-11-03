Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729570;
	b=pIUWGCwGkX4EeiuQsWzEwJe7FYdGBNtsFc+IsFzd4FWIUUCuRwWFg7+WBNCBgbbVTjhi
	 ZuGhBEa+05F6syLYecGbLsK63jeVIm+adIQTjR9kxNKPu7A/nrVP+3CUtz0qe9e4fiVN+
	 IePMygba/kE/ePyRyHvHTfqjSmQENPFwQdhJFSao1YZAq63+oum1kuGdzA2TynlLB0jMp
	 RShatruXue9+VdN+vf0J+ylnN85n9n9yh7isbklWrwmsF3GWGEv75+cnNqrmo35kyQ81a
	 vUNCmV1WG+XS24zcF39MfchhDJKz3PVPjPcaQ50/DIevNZWXx0tEnrTqRKg6ERseWfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
	b=30Q6TFXEz+AEWq0yABB5xhyRNVUSCSQ5Qmd4D31z30GkNIjIaq/csOVRCkSeLP63JIKz
	 CRLKZfprEqB4237VVEegpBx3Z4H+pH8i4+m06mDF2i69yudCU6ADr/n3eRcb4Aut4UVtz
	 WBicIiYYQwJreCR+cc6KPZbMgsg0ujcHJcUz943yo2+2BUanapc4DDH5vCqe4IlNrIkx7
	 bVJv+bdaM3zKqw81Gl6yk/jcqgqePjyl8BzxnmvNkDmGXjU+JQSa2ncmQibbppNZI3grf
	 zClB6kYlMvvbSUoXytAmBePiPLOitOY9G+LJcGhbSAdGTwYSBrj+fmVNF0OxuuzFR5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwmhY2Q6;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720A606A324
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 18:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C720A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwmhY2Q6
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso2298960f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729568; x=1794334368; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=DwmhY2Q6n0SBsR+iUoh/HOTzqgF0tCmTpLLs+Yy7J1PDfkzoIUMxLCiPa4TW4mtXxu
         0oLRXnjlvLuBKX2LFp2MOUbR647HUXs9WhsZ+n1PzFiHm1HS6i5x7w8gz5tYQoS08UGn
         +90B0nk5SWD08YcgwGJQJAeDpZHNaaXK7VodcgUh9Ox232Vc1xOJ1RSxWZmjZqzM7GfQ
         RGl2UvS1F93cXBdmkXov2CPKQwZC5ChcwxVzkv/QOMDGlmrswRlXozfzZpmsDu71VuoC
         pptumAalxPc1EiVfJHb1GhPZDjU9oh8Erv/RZZ1OLxoDA7u9geWASW9ov8xb4cTt53GI
         f9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729568; x=1794334368;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=zUK7rWlSK7CywzBxyphraIYlF+WxxOM0hY8Bb9a1KoT3aBCcS/0r3c9ozeV1AdQTWM
         VSFpvZl3vnh4f0aid52LHBXeaM71YD8h9me0rv1t7+zAk/bPsr5Jl4zvz4xHmbl5L1LO
         MxugyQabnNEC+BP8isZUOav/QpKkJp+yF4fjkP1YY1KgtBWSa6H4jme2e9YBZSlwRUGW
         to7DY5rzJj/00/5lmWftNlCzmuiDKQM4vtN+LxrU9WDI6IA8RhzYjibc9jcczWMBdZuJ
         gL/UkYoTmCrNdtolgYyFdMCXj7uA56bUYXzypWhZGWqfiYJ2oMfs9KrB5N4Wn0soJ2Fj
         fMow==
X-Forwarded-Encrypted: i=1; AKwUvBwtgfAuRbzE1+ZYO7Uu3NW4+i0KOkIUcbWfqjkeX2/e6keXs7AKUdWW3BjEP5KuPMgVrCHKpmnc4U5+HQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8zBzd/gY07lV5d+h9T7WPuSGqdM4gC5gDCZeOklP1KjvOZeSgX
	4gc93AWetTv5qYjUYdqK7xrN2hBvuWCH2zr02xLEBCYRc8goDMlanInk
X-Gm-Gg: AYBFou1CQkOgCyAFHDNqhkoL7PHB1FbQbtIM449hF5jbDTm9SjzUfbA49nqHaDc0EXV
	svTRk9dV/NZnMbxFP0PGixWzMrT8Ybpn3Aa4Hx7mGBc/jdqjWwA3r9BWox/JaAg/NOvVZgNHVRn
	+yTmjpWy8aIuj/X9AwUuCdipnLjXCrFUelV8IUoqoQa58FRf7jV6XTwhFk3KlbF0jIJWG/+T8dH
	jXhmymlurgYAIoq7C+I2/wMzV3Ln2KFFnMfqpN/lQ4hCxTCQJIo9NY9RHx1HqniQSmaagXhYSMB
	L36BztORrHu5Qv/anSh8FffZPHBCDVUicAdx6jJleyoSzWGyP0XsBSwQlaQ/1HkUrwMsJzEQwAI
	++z0eLeYRXy8WGg/GSexwxaXfihouAaEg69f+EP2bxiYvtwNI7sv7/wXzkN7DSqNn3kUKJft91K
	odSsAhz9UQhn46/tdz9+WvH0HcrSDDt4uUj0NDvf2ddHtDJFAMWAhMSqTBncAh9bTt5IS6eHc6X
	rhUB5bjwkEahU/XNEkzKIRwmz86qXTCTHDuijB3nSwctw9V+rIPpgBhgyE9tJ0/joQQ6u42mlmb
	xu4LTOfmBMZEmZ0nemDN8r+lRP2AfzJqy4QYaHkc/Fva4MkDWfLrb1hfwHAEhaRGjGTa3qnetM3
	3QQ+XzVppkPynDTcfZ2sksMe7UDCA2rWWUn6TOFShsCP071iRIxCqBGvbfZ6WBm8d25oWef/Ois
	Zwd8zqdpOP7d9TgUxOndciVLbL21vhA+pwH9SyrSWDu8pv9U2bZ3EeHjhvHMJNSY63UoofK+Mo+
	ajHGByFZaXgLBaP4NRjBpa8F7PYeBDzT/gn4oHyKvsEfiJXYPRyw+BQLWvADw==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr33769566f8f.46.1793729568150;
        Tue, 03 Nov 2026 10:12:48 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm28261090f8f.26.2026.11.03.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:12:47 -0800 (PST)
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
 Re: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for
 field pictures
Date: Tue, 03 Nov 2026 19:12:46 +0100
Message-ID: <vCPa4waZQ6-kwYC7OOX3Kg@gmail.com>
In-Reply-To: <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-5-jernej.skrabec@gmail.com>
 <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
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

Dne ponedeljek, 2. november 2026 ob 19:56:52 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > A field picture covers only half of the macroblock rows of a frame, but
> > the driver programs the coded and the boundary size of the whole frame
> > for it, as for a frame picture.
> >=20
> > Program the height of a field for field pictures, like the vendor
> > library does.
> >=20
> > Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > index 10e98f08aafc..ca66a3c6b830 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx,=
 struct cedrus_run *run)
> >  	struct vb2_queue *vq;
> >  	const u8 *matrix;
> >  	unsigned int i;
> > +	bool field;
> >  	u32 reg;
> > =20
> >  	seq =3D run->mpeg2.sequence;
> > @@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *=
ctx, struct cedrus_run *run)
> > =20
> >  	/* Set frame dimensions. */
> > =20
> > +	/*
> > +	 * Field pictures cover half of the frame's macroblock rows; the
> > +	 * vendor library halves both the coded and the boundary height.
> > +	 */
> > +	field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> > +
> >  	reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> > -	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> > +	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> > +			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> > =20
> >  	reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> > -	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> > +	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height =
/ 2 :
> > +						   ctx->src_fmt.height);
>=20
> I'm not entirely sure, but I see:
>=20
> 	fsize->stepwise.step_height =3D 1;

Where? I don't see this in Cedrus.

>=20
> But I don't think interlaced video can have odd height in the first place=
=2E But
> it also have an implication here as you are not rounding up to a multiple=
 of 2.
> Not sure what is the proper fix, but I have this impression something is
> missing.

Odd height shouldn't exist in practice, but I'll use
DIV_ROUND_UP(ctx->src_fmt.height, 2) in v2 if you agree.

Best regards,
Jernej

>=20
> Nicolas
>=20
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> > =20
>=20




