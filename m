Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914730C611
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Sep 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339596; cv=none; b=AKFmYJMr9NYZF75iGP8j6iYSyx6vSLqaD27CaKWnFiLWvHnNRlKg4vDuOVkA/jhBD4ikS22PrsUz1yqcPZZATI1q5bB2oIFv9dnmjQP4f2JkfvAuh3/8qYRnsD8hvZx+OyJ/anvB5gicuc3XYecWtWvjvVUyZ3Tkun7hAtfSM1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339596; c=relaxed/simple;
	bh=XHCWMZvvdtWa1+WbwLMOHSGAMdRjcSr+YUaIUbFqFFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/O2SxdA5Yp5mw/rXGtfLHNuvI0xb7gfwko1upPjudK4saL9DrPr5JcOkza1pi26CpwZrdlf9RcGtbLklCgnOuFkxAafpJuTvo2rP5YWv5qLhq85+gg3u77QgkfC3uc/AemV2q70cQA7VXScgeTU0+Kga0vgvyHCpwqTaou5Q2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3yJzYpK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3yJzYpK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so26779755e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 08 Sep 2025 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757339593; x=1757944393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bi8yTXJoOBwCylt9q6MtHjP7YgyhzTMi3lxmixfzTvA=;
        b=A3yJzYpKzIz8857XzaoJw4r7loXYGBZzw8QSaX3AYOKWnXrhYAIruOUYAoha0Mmgkb
         QsPJDWugRpD+jT6ma08/RoXQ4bqJwLrLs1Q4XlP1e6cTiVxbIkDmaejKxG51Xv7RETpP
         46Drr39URbpxx6fpFFZv6/aoiu68ie1+F3TTPBjy03zzwxHhKdLinPuh/zlfyDElshyF
         VKqsp8v7iWAaFlwlhRcOHSsJgjgjj2Rf0yatAGn9sE+L9EKxQnBKCqNXMMbJpYMVgpUr
         OE8nrn0cmpEVWDpbU+VKFFRIzWO4RPWvZCCYGPCN1qb+DZHYaARutKXm08bkECKoSXLi
         9FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339593; x=1757944393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi8yTXJoOBwCylt9q6MtHjP7YgyhzTMi3lxmixfzTvA=;
        b=lJisRaAkj+OtScd5vMPxyPxL85dWD38Fd2JgevyRSLXwMBp9PgOZzFMYE2bLJ68nh6
         Tau8B9Hj/sOwe1ydkEHY+doLmXHWMWrdHa6cEijLLNbRgOAG3jpN8tn6mtRs3mnMGbAQ
         VrMpN7aOxP56qG/jp6ZNj/97DAK4G9W2LKp5K10srBORxBUQoamcQoABUiGMWBtJfZ8z
         LMTej45N182yuYJJiydaXslfMAzuK9knjM4Ewnm8bNcFCW5V0PiRFDPrW73ZHtzLEM4R
         YL603Pai9GSXdjLiamEHLbQVHl0Evb6SVvU1E6r7ERHbkoyuUHqSNdw22baGErklDoxF
         3IoA==
X-Forwarded-Encrypted: i=1; AJvYcCVnmILSujqXhOMyRpP3fHYlRLQpOWF1+TaUkBSJcn1ms5u4U6o0nm/Om17fKPwHwADtZwBduCY1OACfjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh1B/CHSlTd0sNF2U8aMm1y6XDFj8BOsSvpE2yxSy/0pFYxjHc
	0zVbh4sJTJgqgvjSP9lC/qrOi3ahk8v6kBigj+mGSqM2ugViAv7cx03W
X-Gm-Gg: ASbGncs1I6+d14plFJana/+UWX2EIS2zDaRfPbZbgMnRITIZ7pAOL2wc4Cgwqu6m0yv
	lLRTKLBe30K8JfNW60teXVVddrJqeTBmTjUyVODSRufHbC2a+gqluwZG6Zk9FE4I39LEszZUqfJ
	tXKdry0yrky6NcecFdTJ9eHFNRbgmvyHtAvnzSCxKS7CtxklnNR1OAOeNZyK7ICTFNwHeWN2scx
	w0WcTJKiY4Ol1Ir8ufEX30fLkA3Ifgsa5vtRUZjsGflsFy85oihIQS+0ckVl07WUwVFbT6GXbPk
	dwCTIgXtSlhKIt4++tYsVbYPtkUqeRmPlNRDmJVP6IY8h6GMbIcCIVHvD+imqhalz+ezvO3+6nM
	kVOyqLrzehlnRW1ICFq7plJ8ZoUw5ljTQdYKbdL/7VmliEJxZl1+9HRL/WQzPDT/cS67m0veRnP
	k=
X-Google-Smtp-Source: AGHT+IFymJM5Q/838u4sNcO2o9XEJ5qNZ4BhV9dGgjKVBrrKdv1vk6q5UfzwHAK51v7oPTW2ilOY8A==
X-Received: by 2002:a05:600c:3b8b:b0:45d:d356:c358 with SMTP id 5b1f17b1804b1-45dddec3b92mr84964785e9.16.1757339592629;
        Mon, 08 Sep 2025 06:53:12 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45d468dbf48sm206620575e9.11.2025.09.08.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:53:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
Date: Mon, 08 Sep 2025 15:53:11 +0200
Message-ID: <5037008.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250821004232.8134-2-andre.przywara@arm.com>
References:
 <20250821004232.8134-1-andre.przywara@arm.com>
 <20250821004232.8134-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 21. avgust 2025 ob 02:42:24 Srednjeevropski poletni =C4=
=8Das je Andre Przywara napisal(a):
> After keeping the pinctrl IP mostly register compatible for almost a
> decade, in 2021 Allwinner introduced some changes to the register
> layout, which made us use a flag called SUNXI_PINCTRL_NEW_REG_LAYOUT.
> Now with their latest SoC (A733), Allwinner changed the pinctrl IP
> again, so "NEW" isn't really a fitting name anymore.

That was bound to happen.

>=20
> Rename the symbol to SUNXI_PINCTRL_NCAT2_REG_LAYOUT, with "NCAT2" being
> a name often used in vendor source code to signify this "new" generation
> of SoCs.
>=20
> Just a rename of the symbol, no actual code changes.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviwed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c b/drivers/pinctrl/=
sunxi/pinctrl-sun20i-d1.c
> index 8efe35b77af4d..37a60e5d1163b 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
> @@ -821,7 +821,7 @@ static const struct sunxi_pinctrl_desc d1_pinctrl_dat=
a =3D {
>  static int d1_pinctrl_probe(struct platform_device *pdev)
>  {
>  	return sunxi_pinctrl_init_with_flags(pdev, &d1_pinctrl_data,
> -					     SUNXI_PINCTRL_NEW_REG_LAYOUT);
> +					     SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
>  }
> =20
>  static const struct of_device_id d1_pinctrl_match[] =3D {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523-r.c
> index 69cd2b4ebd7d7..86a12bce0e335 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -36,7 +36,7 @@ static int a523_r_pinctrl_probe(struct platform_device =
*pdev)
>  	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
>  					   a523_r_irq_bank_muxes,
>  					   &a523_r_pinctrl_data,
> -					   SUNXI_PINCTRL_NEW_REG_LAYOUT);
> +					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
>  }
> =20
>  static const struct of_device_id a523_r_pinctrl_match[] =3D {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index 7d2308c37d29e..0f703cacfe5e3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -35,7 +35,7 @@ static int a523_pinctrl_probe(struct platform_device *p=
dev)
>  	return sunxi_pinctrl_dt_table_init(pdev, a523_nr_bank_pins,
>  					   a523_irq_bank_muxes,
>  					   &a523_pinctrl_data,
> -					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
> +					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT |
>  					   SUNXI_PINCTRL_ELEVEN_BANKS);
>  }
> =20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 0fb057a07dccb..0a5acbd978da9 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1521,7 +1521,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>  	pctl->dev =3D &pdev->dev;
>  	pctl->desc =3D desc;
>  	pctl->variant =3D flags & SUNXI_PINCTRL_VARIANT_MASK;
> -	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
> +	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
>  		pctl->bank_mem_size =3D D1_BANK_MEM_SIZE;
>  		pctl->pull_regs_offset =3D D1_PULL_REGS_OFFSET;
>  		pctl->dlevel_field_width =3D D1_DLEVEL_FIELD_WIDTH;
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index ad26e4de16a85..fb17fae2dab69 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -88,7 +88,7 @@
>  #define SUN4I_FUNC_IRQ		6
> =20
>  #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
> -#define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
> +#define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
>  #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
>  #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
> =20
>=20




