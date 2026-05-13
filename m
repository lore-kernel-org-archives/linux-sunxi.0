Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A873ACA62
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778703785; cv=none; b=Oj/c5dCrJ7rI89nzgVtQ1pi/JlIz0oCcT7NmBQM+Bt0nzKGobcP31V0a/tKEUbCt5HqjutMr4vdFvaJ1JLJ8RB+MZxK2FxlqouJtem5yu6IZcKImTOQ6ovf6Z5v0+oao6rfTV2qHum6S9p/Yu+lZEQU0ij8qvGvYihqnWRMsjR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778703785; c=relaxed/simple;
	bh=8VoltUrLdbwL0jcfEn9k3774FHuaNiE9Y3fSoTK1IBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UyCeBWGKbYHziOGXGNua/nqoaGuqKs2IKLXztVsOl5qR411U5fOj7trBmRIGW88rhuusN4ktWL+vCgumAEymmG48BdKq4Pq7PRCrpge3jKYnrJtaktdhvaEWP2nP0pUnDq2oADhsFMPBh8swI06qHm/5BV3ya3XTAeSDuwoXFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDlBEgt0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDlBEgt0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44509921fbcso3681315f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778703783; x=1779308583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V1myvD5g5e+ykOUotYKcza96x6t5F4ELRDkfltp7Vc=;
        b=UDlBEgt0T1Syh7Kdt6S3D6G7EfHl1sGInYz7IqlvE2V05SPBqgFy9s1ieVPzUJcMQj
         cVVlI0tGRsjQP2j4cj9Fn9grQVvZIzlvk1q4+WbM42o4kJLkO+J9czhxfv8hiUmW4EjV
         ZVYz/xC80JWf2zYp2AE9mogShmJrvesQHQXr+5mB4Mbb6l3jRuuMjVE/ScO05gWYL7zp
         fQ7IyRdkF2ux4LntxUy9OFUx2/p5BF7pM2ISOdeybD/hG0NLZh9vvEH8wieBZopn2T17
         oOVYFG3l8RFmJ/GhHdhmtu7edv6ZxAoSp0AN+fm3LVlY5LMqPhHgsIh9e13bBeIgkHbN
         4W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778703783; x=1779308583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7V1myvD5g5e+ykOUotYKcza96x6t5F4ELRDkfltp7Vc=;
        b=kwpS3wX73Kmf+WPTHwgxaicrElkboAvPAwGq+a5oXmgEslojziqt+0X+HiRMFmFyKl
         rIax4Z2B+es7G6jqqsgYnJqG3LYrxIvHI6Xa3wHzndvE37I9/Fu2tVCHKE6+FWmf0v9g
         yRQL52JV/hW3LJlUEMgY0cSbWtjuAgrDGWQve9QHXvrMnNdjc3J+UGXZmHy0UWdpSKzK
         4D5fm1jnXabrSKTXZ8fD1mL8wxIVY96rkxHWyswSzOoHBgO9X0IdBdyhqZ/JFap0Ns4N
         vGde+774di4vfVi1IpYXKt+oB3BvNkE1UgCILWgPQ2DD0csn/d7dI8C2jxR5ghnUX53q
         baVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QuoM0BxfrMqYmcgQdhooDUXm8JyEk5e4OuiOY/poEA3/bCO2hVVpvha3cU8nhSmA9qSCoRssh+AWO4A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3ESQskfqvXM1SfRT2T1e7ctia/oTzNtr3diPjHF39k/1GI27g
	crFuUuFFvgLV2E4O8b/rxQVk/xw7A5ViDFqeI1r3oDldLX7n+zSRP+EX
X-Gm-Gg: Acq92OHZkMbX4cySVCjJT2qbPZGt5TU6uRpYofJFVzeMnt6NhP5YAtS5nbowMXIjUsF
	jqTUshv34UEwafBXvYUw6aC7LxMIKTg7oV3UlsHhblnRcmyufI+aLsDKbL8dDtiDTUJYWdSa4ia
	Of7Q/hZvYmePffDR5E7/49oDTywscp6vurpY576KNDi/WPB5qS2fCg8g64hxbkLlmeCh4ekiZHq
	4tSwduzK6K+ycPvGCnMUVLiTDXpQa0uHmXRM9qoI0akUuCCvwNneDL3ZfwvmFBv3eAV2mPF7kFq
	fB2tjYVRJAaog18lZi9AZV28LlTRmkKrwt8mRnk8k5YtGhF17WyDX/134avwPJa3IqLZe3MloD3
	jqF6PVPu48ervBK5ssGu5se83XM/7Q4BLkEYS8EHNJVOLKHs/T+rdb36YjvpJzwKnSYvuGw6Xx9
	ICjqZN19UV1Fks8iLhuIt0sa53h/5TGMcdHzfArkCgZuK/rF8wy3PO6niaDMvv8mtTHSnVvNScq
	mV+5HeI
X-Received: by 2002:a05:6000:24c6:b0:45c:154d:6387 with SMTP id ffacd0b85a97d-45c7a7dc6a2mr7430880f8f.37.1778703782701;
        Wed, 13 May 2026 13:23:02 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm1279025f8f.15.2026.05.13.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 13:23:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?B?67CV66qF7ZuI?= <mhun512@gmail.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
Subject:
 Re: [PATCH] media: rc: sunxi-cir: unregister rc device on probe failure
Date: Wed, 13 May 2026 22:23:00 +0200
Message-ID: <YRYbhQnwRdCZPKQIjbWE2A@gmail.com>
In-Reply-To: <20260424000000.558-1-mhun512@gmail.com>
References: <20260424000000.558-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. maj 2026 ob 09:11:03 Srednjeevropski poletni =C4=8Das je =EB=
=B0=95=EB=AA=85=ED=9B=88 napisal(a):
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> After rc_register_device() succeeds, later probe failures must undo the
> registration with rc_unregister_device(). The current error path jumps to
> the allocation cleanup label and only calls rc_free_device(), leaving the
> rc device registration and resources created by rc_register_device()
> behind.
>=20
> Add a registered-device unwind label for the IRQ lookup, IRQ request, and
> hardware initialization failure paths. Keep rc_free_device() for failures
> before rc_register_device() succeeds.
>=20
> Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/media/rc/sunxi-cir.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 92ef4e7c6f..cc64a68dfe 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -344,22 +344,26 @@ static int sunxi_ir_probe(struct platform_device *p=
dev)
>  	ir->irq =3D platform_get_irq(pdev, 0);
>  	if (ir->irq < 0) {
>  		ret =3D ir->irq;
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
>  	}
> =20
>  	ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, i=
r);
>  	if (ret) {
>  		dev_err(dev, "failed request irq\n");
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
>  	}
> =20
>  	ret =3D sunxi_ir_hw_init(dev);
>  	if (ret)
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
> =20
>  	dev_info(dev, "initialized sunXi IR driver\n");
>  	return 0;
> =20
> +exit_unregister_dev:
> +	rc_unregister_device(ir->rc);
> +	return ret;

This return should not be here.  Device must be freed too.

Best regards,
Jernej

> +
>  exit_free_dev:
>  	rc_free_device(ir->rc);
> =20
>=20




