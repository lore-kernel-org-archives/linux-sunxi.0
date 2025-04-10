Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3B20409F
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267332; cv=none; b=T8EMzJo90GqizCOrmtSiRm31iGdFumBB1Z8h3Hf1569xTed8icZkYkN1Y28mhnmOLBbrSo1qjA6pfemcZmg61LqcZQZ2vUOrn7mKJtXZx9HzJyMBVy0tCCU14bGHGCDXmVMTDBGpQpXuDEGRKntyqPye7odA+jllcy++jDz/I3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267332; c=relaxed/simple;
	bh=4P2dDT+RK6eI5rXKKYraRs23FNMILL3o1cfAX/g96lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ec3beAcN7GwAAQ+TPCYD2yp5TKH5q+zaeht5fTEewFU1dqdueRYw1N4ivf8FzeioMDkVVpljwCbwmqKdv+QugPtkbb0TcyLU1QP67cGK1GLIHOOfweessyfouZVlsE5Zsbg3C7L9UnPo97Tz3bMNGxpo4lhHIqDLYPm2niCkfS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNUijRRv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNUijRRv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a823036so4508505e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Apr 2025 23:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267329; x=1744872129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgi++iF3Fg7nMYQ18+rntnQ648+qoZ6drbTj0Fi+Lc0=;
        b=QNUijRRvHAA58KR1qePTJV9FSAW3Lm35dijnRgHZ0xt3vxRNc+miBWglnAc/CibYS4
         l9f0ieLxxH0yr/GJwSZFadkuXc8KYFfUdSs/3G3MT94Uu39M8V2PKNY+tWoBZiuwrPOp
         xgs2KVPA41Ifw3E6YeEtKwfHXPskNTJUeUqjuWbuZTIp5KW+M+MStIpPJUz+YN+qFnfa
         XetOAbx+v6ANgpe0xR6ha2ZjDol+LH2JuYckzalT097EejG8Vtn6T+BOCGTokdVWLLya
         5z4Yb9FMbWHb8Be4pdw9ik6CfMI7489tg4DZz37Nvi1dfOEI3I3aNH7Sw8Q0eY51nk3y
         ACtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267329; x=1744872129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgi++iF3Fg7nMYQ18+rntnQ648+qoZ6drbTj0Fi+Lc0=;
        b=KsVGJtGATwLPJOCKraoHzOAESyw/aT+rxS9euD7wpe3zoVxjjAyCCmNEdJCKc4py3x
         QAMY/EAQi33ppNIsre2MrUfzKsD77p5jClsguel4vv9ApjUcNWLEY2AkDgIsVboCMxwA
         ZkErMhyz6w1Mz/QR153l1OmQxAKKa10De23CxtD8AcEnaS35V4bXBWYcYB9lRCniIHqJ
         Bcvzxt9i0H72MkYx5KKWpoMz7xKS+aP7jfP3PKcU+TcOuyA6XDNN6K2pxp9eOpYkKswr
         KkT/Yip5e6gKWuA4OZI4jJdVwi6o6d6/im58sFeKAN5ich0bjTPKv6V3FUUvzIXWaklh
         +qcw==
X-Gm-Message-State: AOJu0YwA2E8GKLxSSJvc5RS1Si6aq3DQAhGlvAem8y5zOlpBYyZFg/B9
	ENkrGQy/MpjHaPsaHTMs/XM5gFM1/wNc59XybGBXQxmWiR8NRPBq
X-Gm-Gg: ASbGncv1IogJXylAL3c/ZAzHJn7rAEyoG7KeWndBOh1RHMgHHLOD60v2liJBf5KDSKk
	/FzGcTpWGHOGVT9qjQFeLIulJo+xAZmezidnSd+1XlrWMmVwqZbIAqRgwJ2HcfNMahdl2CjLDk1
	jirg/Nwtx3ouYgyH3FA8UFldVHdFErwMUXznWp3pVFsSX+jJanav4IaQClR3INv7UeqNEFgPEES
	yLq5Z/2b5UNtrJmfvZ5a48WlqeHD1QvI1TJmP5liHRsULnNc1cY7+9MmVWPN+7auIOEHYd+5g7f
	6dTfez1g0clLFCaLfESbncu8XYQWU0b0qE9vIolpuWE1nwe5veUhDSPOiZnXDAFoup9+rYonkw3
	8zJ09eig8pvd4GcoD
X-Google-Smtp-Source: AGHT+IE3nWAVRE6ucb7+Uzjsl4IRZ7guyI39ocIlY0+wxgPZqYZO8ZgYVGT3E9SnVfCkjxK0FKGnEg==
X-Received: by 2002:a05:600c:1909:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43f2d798f09mr12514035e9.7.1744267328446;
        Wed, 09 Apr 2025 23:42:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a273fsm39895635e9.9.2025.04.09.23.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:42:08 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
 Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>
Subject:
 Re: [PATCH] crypto: sun8i-ce-hash - Refine exception handling in
 sun8i_ce_hash_run()
Date: Thu, 10 Apr 2025 08:42:05 +0200
Message-ID: <2774682.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250409133610.59d42bec@donnerap.manchester.arm.com>
References:
 <3727de04-7993-4b81-80c0-adb40b847307@web.de>
 <20250409133610.59d42bec@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 14:36:10 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> On Wed, 9 Apr 2025 13:43:39 +0200
> Markus Elfring <Markus.Elfring@web.de> wrote:
>=20
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 9 Apr 2025 13:26:55 +0200
> >=20
> > Two if branches contained duplicate source code.
> > Thus avoid the specification of repeated error code assignments by using
> > additional labels instead.
>=20
> Is that really useful? I think the current code reads easier, with the
> usual pattern of setting the error code and the goto'ing out.
> Now there is one rather opaque label it goes to, so a reader doesn't see
> the error code immediately. And it really just saves one line per case
> here. Plus the added danger that future changes might break this again.
>=20
> And then there is the oddity that it jumps *into* an "if" branch, which
> looks odd, I think typically we goto the end of the function, outside of
> any other statements.

I'm not a fan of this patch either. As Andre said, current code is easier to
read and such optimizations are more for compiler to make than us.

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> > This issue was transformed by using the Coccinelle software.
> >=20
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/driver=
s/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > index ba13fb75c05d..7d31e190bb6a 100644
> > --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> > @@ -399,14 +399,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engin=
e, void *breq)
> >  	}
> >  	if (len > 0) {
> >  		dev_err(ce->dev, "remaining len %d\n", len);
> > -		err =3D -EINVAL;
> > -		goto err_unmap_src;
> > +		goto e_inval_src;
> >  	}
> >  	addr_res =3D dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEV=
ICE);
> >  	cet->t_dst[0].addr =3D desc_addr_val_le32(ce, addr_res);
> >  	cet->t_dst[0].len =3D cpu_to_le32(digestsize / 4);
> >  	if (dma_mapping_error(ce->dev, addr_res)) {
> >  		dev_err(ce->dev, "DMA map dest\n");
> > +e_inval_src:
> >  		err =3D -EINVAL;
> >  		goto err_unmap_src;
> >  	}
> > @@ -428,16 +428,15 @@ int sun8i_ce_hash_run(struct crypto_engine *engin=
e, void *breq)
> >  		j =3D hash_pad(bf, 2 * bs, j, byte_count, false, bs);
> >  		break;
> >  	}
> > -	if (!j) {
> > -		err =3D -EINVAL;
> > -		goto err_unmap_result;
> > -	}
> > +	if (!j)
> > +		goto e_inval_result;
> >=20
> >  	addr_pad =3D dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
> >  	cet->t_src[i].addr =3D desc_addr_val_le32(ce, addr_pad);
> >  	cet->t_src[i].len =3D cpu_to_le32(j);
> >  	if (dma_mapping_error(ce->dev, addr_pad)) {
> >  		dev_err(ce->dev, "DMA error on padding SG\n");
> > +e_inval_result:
> >  		err =3D -EINVAL;
> >  		goto err_unmap_result;
> >  	}
> > --
> > 2.49.0
> >=20
>=20
>=20




