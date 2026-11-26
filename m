Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713755;
	b=5EvE2zX1LwI47tDa5tqq/ysL+5d9RsW3nIuKl8bgUkJds8yaklgxS/EvWBpoLEKx1LKn
	 DZX3j7HMO6ABIR8VOCP1UcAQN7swITSVxuOI42D6jxJqsAtzIrPNBhviIPd+0/8GvEWuU
	 kGIf1EPueAA9vt1tM/4w0S3KpiF1vH30s8HJAQD+/S6cgLlKSCtYglrVTyeB8+M/Em3Ga
	 COXTKfUIDh4UHO0joxsAQwix8VZxEx0f+zTMpvge2GixZZDSs438U3O65WFW+iA0EFF2X
	 M4i0dPpMbzLpEZ6pSltvPJSv5N8GWVBbbXh9RlLdroBhGLSRVtA2jZjdSw6DNBVe7uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
	b=WouVoxHT30mh/USYIiv7dQVoyQoFSicEOo/DttkX4ZsC/ON+kwTkGE2WhW8IJier+rZM
	 RUcsBqr+JfVFGNzdR6A3LU7A9+FkbrKf17nsXxc/G8yh01mDaGu0r5wbp2gzqUxra6Co/
	 mFlZc8mWQ8YeXbxgIgCMAgMfStQzNpGcazLiAHgEP/JsphTE+oM0Au+aeQm6Xt7qBjUZr
	 0nZTwvvE0QrP2FxinC8DGgTNhvhNFP8PrggUMHhNwQyeMybN0R/uRcNZis6Z5V4CYU/KU
	 co5O5wxWLdGgf1wB9jaSn8mtclrIw9oQs4PRFr7xsmPfjbsuQbL3plfPmXVeZ/XkdYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vk/UNtmH";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D2C606A31C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D2C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk/UNtmH
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso52780745e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 09:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713754; x=1796318554; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=vk/UNtmHWjlz6hpox8WmYKPeYSoXqHSKnW2rEtCyt4Ms9g2Uzn4PK/LoKIhWxtAI12
         f7bJ+9oRdLKjdC2kN0mIGPSn1Mp+bvGzfLIwNcQzWhH3SXat09zI3X1kjYITPC0qWsOf
         q7A7Wu3WcyQv3kPW9+4Y68gyQOG9+1xqeeLsKB0jZZFD4hWLIVpIGImWvRcwZao7bZUW
         UH2354a3DyZl2YhKDG24CdoJQ43R7gtSEWNEgRCGfRLYyjyqyL1Hmg8de7mkrexzN6kn
         NSlL1BPN3biA4ZRZRGOJ25Xfruq5FYvbNaleHE9yfu4/XUZWpa94zsiuViRMMSN7D5d3
         iVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713754; x=1796318554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=D1A3wqDBEOLyDVPm327zlb+7DSnpDhiL+4NIIvgQ0jcaNKfF2VZSsDLQFseY7F9jHn
         /oKB94iuNIQ37L7dem/GCyvCSYIMd4TI2Qo6UymdQ0+p+ULOLa+eZDYamRlETqFRBx31
         X2xJgDZkirWszIzl3oOBh6yDxNPu1FPdjeDB0bigkFw9MtpYKBiDxEtSMKGRjH6sF3dL
         vxivWLZuzaUSTC4YYwG/MfNX+IvN5YTs98VmbSG62GQ6VR0HPQocq93de1BjecOkPmg/
         +LwWG7pQG7rXa2g14H3r02Viz3UTVYblHWxGJ+5MZJFDvZfirMWlw/N7VGgVBPgw/aHy
         UkSw==
X-Forwarded-Encrypted: i=1; AL+hErE+0UsU18W957SCMT5aPdIUDi7FYPyeAHMayWJZa85BAhJ47Snh/fYbSeQgq2SQbcCJkkSfnGKqv6Yyjw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9N0W6gu08+C7i4esy4U8TzZnZRRCoi8CeUOlsqTUNWj5Jxq8bd
	Z3RRbC8fCsSSyCHB9mzs1GIUCkQ3AJBUzsRg6+9wTnLp+k5LLQOp+rIH
X-Gm-Gg: AZFdTZf34z1kbYq6hcC9mmh+qhdOlpwaisaUZBmbe7eskdpxbHlnODDhzMmD59jnfC1
	Fo/BpvNfLBTWdTq09FqlULdx93cUOL0Y6QclG2hQD+NtytNitH4oxKgMcRDYAe+hnNPrpWS9aHJ
	NwSKM8wCsd8D2DT1WTKpa+buQhSIk4osTUHt8mBuJSfH5NivH5MrTwhGGHH2opZbzZwJ7hNAxsX
	mSlLMvS6iVnoya9UGvSTDAkmVmUTqqW4KVSo39VLSY63zaHcODM0kEkyBuntjzbrQ4nC/3G5RG4
	bzDYDDQDhnAG1JINXaMmKGVNP/6GU2RRyNkTagnB+rSu0dZ51qHJqxwGiM0Oe8WshxTcQwaQvct
	trh0LymlsEG5u9v3xgTKuwedO4LJAqpnSGX8MLWUkL6C/kZIxvLVa0yL+ZyFSwmLKxxXonioZiL
	iSvQJweFTRvJFIFzKnk/jK0OKVEPJhvIjOpAeiaI739N7L6eDBmAYeV5I6ADN+1JnZpZ3+Cz4qa
	mjmuzg5+zpw87zEmOiI4VfVsEFp+yO+D7CKQ/uppzmmaDFrmx/sHZhvrTBtyNAYBNKqqRI0agUy
	jAG8725odlQUfNDXtekcWhlk/Sir7s/iBl6PiYjWdWjnvzgFhOrGKK/phk9QPKRdp6Myw39f/2R
	7tC2RgxIf9xP+5NsKahXmNlLRslV2MCFAqBqw46epsPPadmJXxcpKcy9Ph4o2likJ4Rc9LXkcns
	HBN/DrGjW/Vu1uhZHz7BS8oMWQeYWH4uQ7KQuvYjfMei6mqnPK6cc/c4o/vsk3J5eQtdcavv0QZ
	op0y7Z4OHuhSa9m9W+Vb1DCgVaESV0ti45xBrVP5GjLtGvoGARdRspnMXhRzac=
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr450092465e9.25.1795713753675;
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm348317715e9.0.2026.11.26.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
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
 Re: [PATCH 2/2] media: cedrus: report only the picture as capture payload
Date: Thu, 26 Nov 2026 18:22:32 +0100
Message-ID: <KjxG6AExQdOXUtc6OkeVCQ@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
References:
 <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
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

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:48 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> For 10-bit H.265 the driver appends the low 2 bits of every sample to
> the capture buffer and counts them in sizeimage (extra_cap_size).
> buf_prepare reports the whole sizeimage as bytesused, so userspace that
> copies the payload gets the private plane as part of the picture.
>=20
> Report only the picture; sizeimage stays the allocation size.
>=20
> Fixes: 65429ba82572 ("media: cedrus: h265: Support decoding 10-bit frames=
")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index 9b2d24e77fdb..b7e0cbe548e6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -511,8 +511,15 @@ static int cedrus_buf_prepare(struct vb2_buffer *vb)
>  	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
>  	 * it to buffer length).
>  	 */
> -	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> -		vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
> +		unsigned int payload =3D pix_fmt->sizeimage;
> +
> +		if (ctx->current_codec->extra_cap_size)
> +			payload -=3D ctx->current_codec->extra_cap_size(ctx,
> +								     pix_fmt);
> +
> +		vb2_set_plane_payload(vb, 0, payload);
> +	}
> =20
>  	return 0;
>  }
>=20
>=20




