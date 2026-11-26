Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713445;
	b=XxDi3LqGmKBiE1iycAwJBaVB67tlCId0JEu7vPrh4ebVlEtcKeZnusw4t/5xOwcw6t4L
	 +lQoI2U47Se2i6tvmil90ZyQKDW4r3uWrsj2IRhEJezo9NKWzFw09as+yJVDYqLH0lD1o
	 uXuKxqQWBkJBKSmbWEuFMaeowQm+vfSb3PPWlzslgRIMaRuepgD0OFPuLbBYYvWdxihF2
	 9z2P+Z+zd9N6kk8YGwAwyCeUtypivMgeXYiaPupbVwq2K3fS4G25TtZPFnzQtR2DNN3hV
	 V+BBuJBhR7HdC/Ql6sRNlT/IptOjq2H48zbWqAkDxCxQnicu6bYb7BQFXWa5F3KtbbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
	b=RZeeE741qFC9jXMyxAGY7ST45ftEroSJD0p0p2/nfLvcH7fM/rvighBaJYmC5dD2DQno
	 Pg1gq6ezCSSFYbegXMPm4jzV29us4wxajK2e71Foh2fYE4Tq+CxveTASEMr2XDhzTYxF9
	 jWjKSKdGjlf3MuJOf+qOK6QikoMB0csTr7NN+LqIXjg923MKtnYqzDnlsgGSNwvJOYB6M
	 KsWSRArqQY1BR78nDQ/OMVtQ2Rz6zlTWA93IetjOxk2+zCJ0nd1LBDqCylUPeZpmVwjAc
	 4Xa75dIKSM65zA+lVMxLDse/nGsI30YjVMxQy3Y/sRlJ6D/MnFwfGOjWFlKVnvvRNvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRT59NAE;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91261606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91261606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRT59NAE
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490f38e9688so5066762f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713443; x=1796318243; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=kRT59NAE3U7OOHoiyS5mGTpvjfExiGuuOufdIl7B4V0cO9fMviNbQma4NEF1F4AFie
         q9zBmm3egI1i4dzu60EUB1elUdY8giwHQZ9HWK/9rAiQPvON7wWVw8JaJWP6RwjLjo0O
         lovqtxv8ssH/ZPkHMGH6bMRTM6LhaRX2gAkM1ipZVBiSANRjBDb+r1VQVxxc37cYgy6C
         DJg30Ei+GUbnO+2dBAer4SYJulZReK3rAMGs/SWrp6cHSy2SGvsnd0J2in1v+yKl/x6F
         1bEbeQgynHodpz95mOJzT1LaehZKvIqtBLRTsVfzpXMQt6Dx1KHC+9K3kIQ78WrMt5dF
         gqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713443; x=1796318243;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=BVKlhSOGItrtOq4WPLo6nogbnY5nj40CT+MWp8faCfxVZmroswVQKDH+Tz9XHtqlZL
         sBQAQ+Jy5EiSZBbk9C/stF03FETPQeC6sRTF9ER65vx9b026G3joNzYgC6MWPvcBbpgY
         MdnOnFM0Zeeb96hi3ree1d+S7/RwaMNTC4v+5aiWl2ysPHWszV4by3mW5YQvEPgibYfQ
         XZZAAWAMNW/7VMWSZYE2lamwLzDVP/x4GMiASxHujhCrFLZRIlKbYLqCBZoDICv29p0p
         +nPQhMw0a1amAY1zAcZIq72JC/b/v1qCFLQrHqQ+XtYgTaypFFOa/srksaUMP25S2Rx/
         piGw==
X-Forwarded-Encrypted: i=1; AL+hErEJWUVMYl5213+61y0LG2tiIZLQShA6qvK0LpQo4HYinUIXDAevFyHwWtcO3wobkGXeCsYsxYlYR2CbgQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8lc1EikuOE3OiSmJKsNufgBkVtLGnwRoQ0KNekBCQOt3WJpPVs
	iKPdNmbHtP3Wx2dRcSGQ1QWv9g8oSApk19+Twh9EBxETZoZO1tnT6dUh
X-Gm-Gg: AZFdTZfD8qg+O1djnpb0QIGjfx/BOXZ9ZEBgEqbEsVwRcpdtQ3vT9c/mVSQP1yApcYi
	Q64mqr9F0mD5EMI85rP5CJDAxhaswCnu9dF8ttJnmdsh5pKL6ZkEOEdztd6VOPTIJbUoC4v3vhh
	l+xzg8F2wKMnaF8ndf8yjQzKlHVqJmLkvyplm3TY2wO7s4/1ajEEFgtUIvqgRg3c94RihUNhRiG
	mHjHVit5WGjObkwnmaKkUDgicoR/lDdfh5H1A173uMQEv45qLGy3hOw26qLjpOOIHI49oNtFaIK
	k1+2/XNoq0ih2GNV614gIq/sR5uym7hwKL87ZIrpaArzzv58Hq2bjz5j0NYu03xw4Be3VkYGv0J
	TuPpNIIkscU2DZtGjxq8Pgls14zV1EgJg94EhMSzk/lFw1DY4pPinY8IgsloQqhTZldm8jfLtXL
	o1QUNjKu/DzwXII50qgSKE64q40qUGcwj4pas2HeNA/7ubw4It+oPdHjQDkMYZrtlx30b7NBiDh
	kv19fsQy3/vLmXqXdA0mSCW3P2tCIYesszrPqzO/h9nlutbfbXm0XDueWOv9QGs1bTb3y4h6GYW
	1mbl1iZRXVRdYdTxOTOpfLMG+GWT0682Dvrb7udOuxecqT0HTcpOw4+tYIfx8iQQAkEggA6zSY3
	FJjiXB9hGGG40c4PNXmcA7bp4toeiJUqpzztmIDdhFI1/1/GAd05gc4Mx3l4F4HsMofvP8Pb2sO
	AR9cxrcKLX3EZXATGZL9vVGDXqEDvtXtFJ1MmrTNZO9zYsaLGLonHZ96AfYNW1GvFjr5tr0EyAE
	emmEdIJjCRyPdzVgGLP2Zy2NoY+a8ZhnkQr7SjuwX2QYWlcqTS5H1shEY9175HxpVLz1t2s3jFZ
	+H9M2g6n
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr18536789f8f.8.1795713442699;
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm39409423f8f.26.2026.11.26.09.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 aiyengar1990@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH] media: cedrus: vp8: do not disable the engine when a context
 stops
Date: Thu, 26 Nov 2026 18:17:20 +0100
Message-ID: <G0WUYb9qQ46JcwzsVuhrfA@gmail.com>
In-Reply-To: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
References: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
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

Dne =C4=8Detrtek, 12. november 2026 ob 17:08:44 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> All the contexts of the device share the one video engine, and the m2m
> framework keeps running the jobs of the other contexts while one of them
> stops streaming: stop_streaming() runs under the device mutex, which
> device_run() does not take. Writing VE_MODE_DISABLED from the VP8 stop
> callback can therefore switch the engine off under a picture that
> another context is decoding, which then never completes and fails on
> the watchdog.
>=20
> Every job selects the engine mode it needs in its setup callback, and
> runtime suspend resets the engine, so there is nothing to disable when
> a context stops. Drop the call, and the helper, which has no other user.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This is correct, I have similar patch on stack. However, helper to disable
engine is useful, but in different place. No worries, I can reintroduce it
once I came around to post fixes for concurrently decoding issues.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Tested on an Orange Pi Zero2 (H616) with the same change on a 7.3.3
> kernel that carries further, out-of-tree H616 cedrus patches (VE behind
> the sun50i IOMMU). The old behaviour was brought back on the same boot
> by a temporary test switch for comparison. The test is a 4K H.264 decode
> through FFmpeg v4l2-request while a second process opens VP8 contexts
> and starts/stops their OUTPUT queue in a loop. With the old VP8 stop the
> watchdog fired 12 times ("frame processing timed out!", after two IOMMU
> page faults at address 0), only 289 of 300 frames came out and the md5
> changed. With this patch all 300 frames match the reference md5 and
> dmesg stays clean.
>=20
> On media-committers next, the base of this patch, it is build-tested
> only (arm64, W=3D1, no warnings); it has not been run on that tree.
>=20
> This patch is independent of Jernej's pending series "staging: media:
> cedrus: assorted fixes and VP8 4K support" (v2) and also applies on top
> of it.
>=20
> This patch was developed with Claude (Anthropic) as a coding assistant,
> which found the bug and wrote the code and the commit message. I
> reviewed it and tested it as described above, and take responsibility
> for it (Documentation/process/generated-content.rst).
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c  | 5 -----
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.h  | 1 -
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 --
>  3 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d1..a22a8402fc60 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -71,11 +71,6 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
>  	return 0;
>  }
> =20
> -void cedrus_engine_disable(struct cedrus_dev *dev)
> -{
> -	cedrus_write(dev, VE_MODE, VE_MODE_DISABLED);
> -}
> -
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt)
>  {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.h
> index 6f1e701b1ea8..4edf729c556d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> @@ -17,7 +17,6 @@
>  #define _CEDRUS_HW_H_
> =20
>  int cedrus_engine_enable(struct cedrus_ctx *ctx);
> -void cedrus_engine_disable(struct cedrus_dev *dev);
> =20
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..4438c7e1bbda 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -856,8 +856,6 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> =20
> -	cedrus_engine_disable(dev);
> -
>  	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
>  			  ctx->codec.vp8.entropy_probs_buf,
>  			  ctx->codec.vp8.entropy_probs_buf_dma);
>=20
> ---
> base-commit: 3fc9303dba01676c2090768126e5327e341b7761
> change-id: 20261112-cedrus-vp8-stop-cb2d66d855ff
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20
>=20
>=20




