Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713696;
	b=008gWq/d1gEPv+/siEZBRlodiS+fKEbezSX9mtQhfqoWmO1evOz861wCzQhtq1YKdiz+
	 bVvk2EJ50ZDyi3kKVpPDeFLjEuivZUzqqVSPFbRcakKBOyvxLETloyw9Q4JkGFQZiZGtt
	 rra8vyLemBFzwk9DeKYMp9vO/EYa2gPS/9ichmmYyrwiltFUBGqNhYShp33ET813yTgfY
	 SSzk1byiUnSBlZGKr2T6dQ7HVhoouGo/2OVfnW9nnw8rQ8Itt2u6Jx3JaZQ9/ph3N3R7d
	 wWgkgqdA9QJXz7Vo1Y7wMsBLZZsYMRANeTnkhr3hg4/yHUYV16H9smZ8x88n5Ks8PBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
	b=tBiLJN7EX4LXMY1wGmgrq82kPTnnfHQU9c3f8RYUb2larkSFSDUD/zomuwsOC66XUyJw
	 zmdxj0fv1viKgpuBwD3px2qeBXrPWQhPYZnwREd7tubN+S/d5VyIvi/Y4TeSM523Fax9/
	 wBP9mriEG+k6qdxZ1W3fIw4+/edwtcWtNVDBxoI5ZvQNVit3zve0tl9MjhujbMDgd0p0L
	 I1reCakwZaoHfTxEtQW2xrd9vxbdCuTy6MG6ry+xXrym+JV735kXDcvRzZi/ly1eayWWs
	 8vZzpupL/HIppH7kUydtdMUhDldwlPpPbf9KfVM1d84sH/LzdevMypx/T3PEaPlK1TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJuHOjPI;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CD606A33A
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1CD606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJuHOjPI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so42450575e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713694; x=1796318494; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=sJuHOjPI+iuteZF29g7WxksUA/sAlvfYcZB4RFMpFkj1JiMU77aKEnym3qdbOEAnZo
         WBogN8Tjnpe/R9mj8tRYV2OAWgeekkA+Q5bNxhT/XaGWlJCvgYgmwpNcpoTfuGhWNle1
         XuKoZR23WMhUMvuXqC+CBuEYiv8pAWf98aKSir+v6RFH/5UdnmYJXK0ybgvffGGbioio
         MNXJjvku7y9o4YsuVGaE/aBVe1ddXPthrRQkiDa50QWs5NVxPWjOdf9PtX4Frk/JpSN1
         oh+tKxhKcMr+EPdWQh68koj5pzy0A1TcEemMTss47MKp55OQIB4qrMI+R06DThvpOgPy
         vGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713694; x=1796318494;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=V2DyQuaQu7RVpv3EjOXmGF7BnYGfJxZ+ccPjqsPWiC8CWlW05HsRZ7ggc8AF/97nBm
         5PPQx96asN2j+3c0hxHUTXrDL64fUJ9q6VMoLOnVJoMEC1y2n5/Ma6HXstdseRCVSHhP
         D/nJnsMTRmYENMdJ16jYzsKdxywx98Cd8+FokDg9Spy5VmL4rOMWve+mzAwRqRZ1TwOZ
         crG3xRx3hjzQ0XGI8jXrqnywBEpRTgyCtNMSaT65OoSRRA/aC8AwI9KKAfRBZj9IXquv
         bKbWKQ2YT8kUncB9cw1UqAcm8Nfa05GndsHzB8vWOucF3dqvw2GcLVsgBWelqPDnfgku
         COWQ==
X-Forwarded-Encrypted: i=1; AL+hErEMXUTogY8QphX95ftIfwXq/6LVLDeWL3rUqLAuVy9T6kByn0jhAn6qck0Teh68vXJxnrh2vWI1oHqaqg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/q5EGd4j+N1/Qj2UqnyLdM35MFyeThvp5MxOOhzNrEEn8EkBi1
	9yCq1/g0QOiG9KgoR6uIVhcLb8+5zWA4P4n5hf9FuQmAX5sAsFtox7Fj
X-Gm-Gg: AZFdTZdaocjdibbxegeuypRaurCQklFGaWIKYTa5Kh0U0Tb8mR+ofcrchtpsQc0tMKg
	scya8co/kgJipnTOjuOwW1Fj/nBRuAfhdk3HlXQ/YUym26pvs+FxJfoJDmqB3R429KjkSL2BpEj
	pGuiQ+x9b47X4kJXRe/uuBk4ElrC2AFVI8QI3KYs7qi3dPPw5rrtr7Zh5YAtHwjN5nl3Ljmy0LR
	OkmrQ8XgXGBTo6/306TBuCipCoszW7hwDQpKM/7ZULNMO8ipkr0nYIXNAAAiFJfj2PxIDHbzAc+
	YhmlrtNUvGtjmv8JAupnutMxnWCkz4+Rz3uoWGWxspvbE9JodEXEj1IrNLVlq7l5o+MHaBbWroy
	in0U0o5KJbJsIl3KyHgF4nmdlC87czqDW0ym4U2CFIeFHw00iYpR/3lp2Lg6HqY9mx9sp2Ck9lb
	9xb+owELlsCWe1auWizvqJknN8FriRH5qQ2isC+WhHkYxdHmxc3yf+takIs8JwYwH4c2e0VSv2N
	C0j54Ww8HyeKn+mTytahaVwLYmzYWvZ/SVH3qDIDDBPpWzgm0vTlUrTsRL1vxVxvPTppcvG0l5E
	K/wexD758wPGtKo6toNRo38o20y+eWV1PQrr2zER2rIGEhN0WNTnlVuaRjFbZW1Ye3UhxKHi8JR
	/P405SM1fS6B5w+DwxRRE37THd0PU+C+E4zAMDFKll48P6fXscAUjrgqSMArRhYcF/6sOx368py
	Kxt2OlPJgINTrlRl0XN6gZzH6r626YLQF2LilBSnTSA5xDYFTafBKbCgKYTsTf+6mkAj+Xk69wj
	uynNN1CH355l1v4ShvRXzlmUucwrhNwWPP4rrS0aHz0c8BFci6ShBSPfcHfM1c=
X-Received: by 2002:a05:600c:a55:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb889234a7mr403969765e9.16.1795713694512;
        Thu, 26 Nov 2026 09:21:34 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm373445195e9.4.2026.11.26.09.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:21:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@kernel.org>, aiyengar1990@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 1/2] media: cedrus: fail buffer allocations that do not fit with
 -ENOMEM
Date: Thu, 26 Nov 2026 18:21:32 +0100
Message-ID: <euqQyxcYQfOA1pYfEtNPBw@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
References:
 <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
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

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:47 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> vb2-dma-contig allocates with GFP_KERNEL, so a buffer pool that does
> not fit in memory invokes the OOM killer. Set __GFP_RETRY_MAYFAIL on
> both queues: the request returns fewer buffers or -ENOMEM instead.

This is correct only for IOMMU allocation. CMA fails directly.

Please update commit message.

Best regards,
Jernej

>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index ad4ec3490775..9b2d24e77fdb 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -602,6 +602,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	src_vq->dev =3D ctx->dev->dev;
>  	src_vq->supports_requests =3D true;
>  	src_vq->requires_requests =3D true;
> +	src_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	ret =3D vb2_queue_init(src_vq);
>  	if (ret)
> @@ -616,6 +617,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->lock =3D &ctx->dev->dev_mutex;
>  	dst_vq->dev =3D ctx->dev->dev;
> +	dst_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	return vb2_queue_init(dst_vq);
>  }
>=20
>=20




