Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49332FA36
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771666814; cv=none; b=peIQW8O5tDBUIgbhQ7wb1/095h9UU6UETTSgE367XvkSmIJh0Vk71LMkIczTquPYOvRWtjTXsAIQ430+viZcOZnFRB9zgQHf10YmHrizU59XQLKWGnLFrojexdRUJ2wMzXjpWIK5DkCf4YpQ6AqHUjfKOv8/VQ/B5UAyaqwjnlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771666814; c=relaxed/simple;
	bh=+T/ZYClx1R3HtRgnaGI/FCamHUwL+EtSB1lhrA2R27I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGxRFvldn93y9SJ7NkhB0i6CEjvYddHu1SUw8aqRbP5oLZLn/JRufxvYq+6B2D/jHQLGCUROEOyIkLVB7muKQ22UuZhNH36hBJ1GliJ8i8L7dm0Y6mSE2TYp5rqT8MWXjOTUKZ+OOvG/6DVOrvuCn88gtj/9reBqLYG4KkREi1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czT7RyyW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czT7RyyW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso19340975e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 01:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666811; x=1772271611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuF5x3a6e11GI4kifXt3xbSibryG5QrOhbEp/FvY8E0=;
        b=czT7RyyWYxLXJZrbntSq1uMT+O75V0DeL5DGte4RNVvKBhlSYeHuSoyRr0FjmaidiI
         uCRYmuyv7jCv5PwNTn2JvNOeIc63LQniytx9bFhsVSdVwJGwPjPlWAdPebviTBKRAM62
         Z+fv5ayXo/VrZsdj7HcyBTpLm6g+hcGNGqxAVwJrllXH6CHCjI4CDeFuVZoTXNjQCvEY
         Fugqk+zaavjGQvFOwVah4+no3dlwu7DQ1CijAGd2Cck9EQiPlS4EP/pu9hiqPpwN0GAc
         ULjvaiW1n0KjTrwG9DHy1MVII7nkOm12XMVKdQOCg+Xqdpdfyc63eIzGmQ3kzG3tPQWg
         HtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666811; x=1772271611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuF5x3a6e11GI4kifXt3xbSibryG5QrOhbEp/FvY8E0=;
        b=vO1OfxnqTpJkpIqFWtkd+3HYeo1z8/DRnPBU4p7CkPiwDoyOnUdfRcdYwt5tMS29Ij
         ePrwFFtOiu6rzUsMirt/Oqm0Wdv/0Z81OS8Sx6ufm+QDwOo/NUvRlmgRGJGWcDj//dis
         s90tw2m94F1Pmf9f3SvR5rmtcYOtchC26y+807TJ4xt2ihYiyNn/FfOcmhHR2pCyG/PN
         sfyNMinFeMd/SbqiAmZZu5UU2IYZagb/gc+nGvOLZb1cyIJhcx5XHkdlkii2xA15uuux
         GGRf3DskEnTRHexEsMfLpO79gBwSNFEu0fl/5p7J1ss3fmIAkEd46auC7r0MKiB/9UzA
         c7BA==
X-Forwarded-Encrypted: i=1; AJvYcCVTtWnEI4oaILBoCojC9zdSLQG9HtxWyB5AZSHbwI/Iz8Q/Qz2sLJxNZneq4LDxFMWa+PeqniirH8lQ1A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8eirk3vbDlxXLQF9Q+qxZBr5rrFsI0aXm8q3UhtJQMPAkw9Bd
	DM/cG80pt4SaMWGtRyZ8m1KfRArrgYQ+FF/auas9o9cqum6WutU7/o3n
X-Gm-Gg: AZuq6aLm/qDJuvRPgPVC3Y8SnvnLjsgRInSaTql2R+Zq5zVPUZKcw36zu7sP7DowIKt
	pIQ+d/1O/7ORQCJbtdLdHRbc5jsGtr/pEPaJeY2sW/Fg5fpN3ix8/OrEKnftcQWd158RRgDjUd6
	9rdNXB7FWeydQ4BbMv73lW0KfUNt+C24o23AjzLmosxY7MS4OzBaZiBXjtdoB8WdQs0BFoQbIsP
	EEnbF6+JFATEg/husGNuDkH0c/k0ufwYnRPUslGXutCPyodRlVjLm38G8pwpzZ3nBbwvqZ3G5jv
	2Z6ajsXXeOTf/YHTP2Xhi01LO0+9GGYvf2MCFvI4glOmANpML2L6Jo73ira0UQ/xkGw6rFLhNJ2
	0NWyT/Ba4xEFVkVD9l8gcAmOSDUYDT4uHYTd7855SXCSP6A57nklAr8DzteRnmRyWILXvMBcxFW
	oUG4qsQBjSNfm4W0wcUW2oq4d+qQMIsHR/XwsLGS20SEojAH3BNvyjndyLxGI7eJaeOQW2pytYM
	j9JfB7netMZXGSSnQ==
X-Received: by 2002:a05:600c:1c29:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-483a949e5edmr41113355e9.5.1771666810853;
        Sat, 21 Feb 2026 01:40:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm133439895e9.3.2026.02.21.01.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:10 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 1/6] mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
Date: Sat, 21 Feb 2026 10:13:16 +0100
Message-ID: <5967652.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260220161011.999642-2-richard.genoud@bootlin.com>
References:
 <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-2-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 20. februar 2026 ob 17:10:06 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The available length is really USER_DATA_LEN - 2 instead of just 2 (the
> user data length minus the BBM length)
> That doesn't change anything now, but if USER_DATA_LEN changes, it will.

s/USER_DATA_LEN/USER_DATA_SZ/

>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

If this is really a fix as subject suggest, then Fixes tag is in order. How=
ever,
this looks more like code refactor as end result is the same. So maybe
reword subject?

Best regards,
Jernej

> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 9dcdc93734cb..c420909b944b 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1761,12 +1761,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_i=
nfo *mtd, int section,
> =20
>  	/*
>  	 * The first 2 bytes are used for BB markers, hence we
> -	 * only have 2 bytes available in the first user data
> +	 * only have USER_DATA_SZ - 2 bytes available in the first user data
>  	 * section.
>  	 */
>  	if (!section && ecc->engine_type =3D=3D NAND_ECC_ENGINE_TYPE_ON_HOST) {
>  		oobregion->offset =3D 2;
> -		oobregion->length =3D 2;
> +		oobregion->length =3D USER_DATA_SZ - 2;
> =20
>  		return 0;
>  	}
>=20




