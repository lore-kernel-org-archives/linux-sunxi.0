Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713246;
	b=i7hU7aFkf8Iqvw++GYA0Bvi/dc85xoeMpzLNn3ltk1KL9jDOxMm7lZq8aU1kF8yJGaJl
	 GLHzJqgW2qMxn3ZwJ/0v4X4fLAIwwn0XXpZpoEFDnJW2xuogIkiI3KhNvu71/zdfUtpT8
	 zEwF91cq5i/y/va29Cml+6PuBHe9ZznO7FmX8gFF7X/MtVMIviZp9nSxkANSAP496N4P/
	 kh78DX0I+zeRYlbDscGpT+8DkFIkdrV/SU2KAEkKv99Lrp5+UC0Rx6UnAkhom3zYqkeQ3
	 Zg/yinhR1XeC7gmADJCWqdcNN5euGaw1/TGNyZIDoZzQI3HsnMYi9Olkl5VIH/elZwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
	b=ICGOL7+hTg5DTzJnCnESIc09rMrj6Lwmtq+RGMbAmpPxXuwWyXO1PYwhFogxZQoRqssh
	 oNKbPKu3aO3atO5aT3rB+GLrvq86SmKwqIvYqRrtW7ISKt8jH1+rLeueqOOstqqsWQ03+
	 o1neYjNmLEs8jjHhIqfx+XF9/C6X2YRbbJGLPlOLP27yQM3ziCWwK8GgNwRVsrHpIbNVi
	 oy7EPsoNQTZIFahlB/v66v9vrqYatIbEDI6VDQB6Gy4dv4lFQ79Wz6gvkIH+ItgP7KoHm
	 22Ra13PLAFJEJgpxhmLWQmjG0HDBLFpPcZRjokFSSJGFE3Yi+1MNp7AtjNNaKKsXGtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AloF2klS;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC7C606A326
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC7C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AloF2klS
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491846221ffso6336980f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713244; x=1796318044; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=AloF2klSV2AeKN2DtlscWAEDtkrkIgf66rIl4EVX2aWdP41tjP86FwGW6H3ng1Wh5P
         F3qyemzbMe6mdFNJAmbJDPWm4Pzyv6x4+JqIAbe8QLH7D5yty917qI4f+kicmbn1wxI1
         JfVThxJLFzQgoUvNQboMV96pBBArDHXoa4l6t82lpApG4CaInCI4hL/BPLS9NEMi73fv
         4NJPyviaMd/3PR8WNyAGVebHeDTLFenDeD6A9se2/eUUOvvYsZkU9ZwUqe2OBie2Yd4B
         pnFt2xw4N40hTmXcU77GtKVuzGpQBc3opZqs+W9JsxOGgSCPU/vf4Kr+q5c0xwlNzHV/
         NZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713244; x=1796318044;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=VcFSdX0AVi+vRy270TciN2/augtoyGB7LtunxBmzP5zaWrIv5fnrg2EoTkj/8fC56t
         N+VvE6toHyos7de24fN8EXulq7gythLJpRdTJAxvS4DPns1TkfcDWYbvlUnECJMRTGVJ
         Q3OMZsbDPFRI+cjMmWTqz0Re63W04zPWFs6kXeSG+fjST6uXcFf2dxjJZnIihHuMWbPO
         5KhFcBGP7xzklQJIDm1u+EnGLZkGy75hk58kB8kjxL2ESfGmKf00GbTCytZ7ZNGGKKjN
         waGxXgYGXWHlht7mUGgoDg6LWxLjRNCkICHo6XM27NpNUTvt3KmQ3h/fm1hzJsM/2fVt
         fEIQ==
X-Forwarded-Encrypted: i=1; AL+hErEvIO4Ov+KaUaNOB4wg9i1PejPvODp36R6+ihoFRmCaR2RFM3CVnay+JlmN8CBthIHGD8tfkWA0Escwbw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/p3KMklo+wRF5ZBiU6KsLXkxoW5r+Ofk7RJRkf/zbqBuplNDdI
	u6L8smFpcVRop3pBBFsFE1EMAbYlslxPtH8M/bN4ylAX+BoxjYabqoku
X-Gm-Gg: AZFdTZdbNlQ4sclH5oeMU3tpSppEWFw5HAlqiGOM+fpQqrawfsAq1JhUvq0CFZ0EOJh
	rcXP+g1gKhvMxB78bp++BglhUu4AXAnFbphNlrL6ALJFzlqWS2kDMR6MnqHFVHt8z8YA/xeJRE/
	EpF5/zHxuBrwZ5tUr3BbBv5TZfE8NmcuZgwzWbrw8lWg7ZyDeoBGBPP7Db5vbuLZLCyLT/G0K8+
	qYr6y/OozOlraM8pjyElHuBP9z1fxYxKhYCA/jkfaRrcBG8f7zdQ6z9zgvWJ7WthlXOKAyY7BHg
	X0XRlJf47Qx3/TFTtoznF3j6yAoFPl5Ao7tW/v9WNuiDCjn3kYgKe19xiTVrssY4TguyrMi73nO
	aolp05d15DpqHQmSoK64siTtAWNWezn6md3tfimGE1jThvun84BcQ/UXKrsY09TscQIURalAZPW
	uoKTj7TCgLCsVRWQAF2YgmMrijBiRGX6xw3xsZuabko9FltMUoPOVzBQUxOZcoqsVSncO1gvpyO
	HNgLHcfHeWLK66MTYlmHIXgtPNAJpiV09RFKqcHNKNupkfcIAuGPKbQ+To3W0O7fA5hKxiI6w7i
	dsbD8UBDvM1n3nmAmXuX7PM0KEavoISDrBAA/NdTrl4nQ9gzJsd1gvJ7C271u6WamMt79rDO1yW
	Ef73PZn3I71UBu74cba5VXKr3vRQqusrsu7B+VTrkNqvsATfmXehnvckJwUZBbpqMtBS9aU1wAg
	ey/mxQQIvE4+NBt+eaauMpUINAKMhQ4PFbWfwB0uH+WSEVdwtHxFsukxOn9bwHx0ILwMnVPp2hE
	tnIAdKvediTVtu3lMS7fwuT8Pw2nBLESywa7w1wXzr+JPFeh4nwROcMw+fXxlKJ
X-Received: by 2002:a05:6000:4704:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4abb5eabd6bmr42342899f8f.56.1795713244030;
        Thu, 26 Nov 2026 09:14:04 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39494189f8f.34.2026.11.26.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:14:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, paulk@sys-base.io, mchehab@kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Cc: gregkh@linuxfoundation.org, wens@kernel.org, samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: Re: [PATCH] media: cedrus: fix typo in comment
Date: Thu, 26 Nov 2026 18:14:02 +0100
Message-ID: <A2PFvd_UTOK2TCyMMfkywg@gmail.com>
In-Reply-To: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
References: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
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

Dne sreda, 7. oktober 2026 ob 16:00:56 Srednjeevropski standardni =C4=8Das =
je Caio Vinicius Ferreira napisal(a):
> Fix a spelling mistake in a comment: Neightbor -> Neighbor.
>=20
> Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	}
>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
> =20
> -	/* Neightbor information address. */
> +	/* Neighbor information address. */
>  	reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_in=
fo_buf_addr);
>  	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
> =20
>=20




