Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA91C6FFE
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Mar 2025 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741197041; cv=none; b=RG/fu3d47wm++LmcStYn8ePPzGFQlNghWnkP/1MoklT8VPUFOnerH42wR18qpqQpCnxcUyW6uegsdJ974EvsmaPgpfdXHVQYtFflojHMYv48EXfnLzQ+3S12g/mlwLYgG+zw+2v49GOtA8Eu2l9vsoq0Um/ayx/U8/1R4m0Jofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741197041; c=relaxed/simple;
	bh=SrBVncElceWvlFqYJC7mWyh2fFh8LuZ2Hw7tSkvo2vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6dMM/7E5bu7g5oCV1GuSTCo/4rD9TtU3YcnkV8ZXvwtBlHLmjru/VvIXSgMzVC80AlLchWPgGNo38eRJs/3Nj6JidCpzCYcdT+WcpT7TWDINhXra5C1XK+t5NdWumtnSIm9XlNBiPD8gUzcwoDh01PQrc5d2w7RvVqC/1YK6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhIIOiN2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhIIOiN2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2f391864so4000070f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Mar 2025 09:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741197038; x=1741801838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShSjChoUXi6cdOr1qzYBZJXXI7K6JwDBuHhj6HnUiUg=;
        b=WhIIOiN2baFwRzCRvef3tnZG6LYdD3yY2hYXdpll+xFdZLmcy34fk3+j4on3axtOBM
         PswtM2fH+wC3TeiaVQrHtZk/ouLYURsCJLJwnkvqK00Ek8NBM3bmP4rywP6NqB7rQIJr
         8xUeCCZBe79HUB+TfqBDPlpHDsb4bT2tPtbzvjVYdP8EeVPPRyGvFoOAzxDtVJJxKG+r
         4fJ7gb7/lYh7y3rkGIAy5atLfb1si4rnPTezuyewecTOJNQauIyWuSR1xYuxXOKPWZYN
         9yKpqk7susEKGfgUlJzG77Wd5i53/cnfWNhOVHgzHTXmnpd0HzdxEkg2KhNzHZ9IKm9O
         8IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741197038; x=1741801838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShSjChoUXi6cdOr1qzYBZJXXI7K6JwDBuHhj6HnUiUg=;
        b=SwpIh6R76I7rUP9VmCfFeYfj6uoAy2jtqq/Qg0AMw8xsDg36zKPPMQ22FsiD1EhyMW
         Dzgk1XpCjNsBtXY40d9gTkKGkaAXLU/BV/JyR8KHkCDH7m16SuEMhoepfFs9+hVVoIx+
         zY7Q6cgvrtYaiCNfPhTKnZAU/4Cr18NBveXhYbS6umr9s1IzMjpiQrNeEFz7CzFnLE1b
         nHAnHBmRyOKgiYvtc/c3Soaycv3ww/ilJZzBHwISqUo8dcCpweJGT987XYgZIWSvZmi7
         UXw6wgZANHPxdgGAeCbIsVjgpmybG1DSmkr+m8Fhgfo6fo3uIQ/ETKicatrh9q7FZ1RP
         uMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKghR/UjVOfbJap1YUPvNs3ivNdWROu3izhlABa4sIypMXPoGjI5JqrUNjZDnGdy+P0GAXn31hFn/sLg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf+9ggR+Xc2s1ar17oFa5AGsTFOe6drE8RTlY0204P8TTc77Ej
	wQw2pNT5i58nw9K+mxrinQ+XIGeo/96XBusGZMCDyxAtfX7RSNYa
X-Gm-Gg: ASbGncvv5yqEz8z3oOHWOH1NP8DvnyYarbcl1WuB7LTpREhhFmiDxpYgjVjtqbhoIRr
	HpNpB3MLBGjYsxfu0y06SfIQymsPDFVMTY5Zk/ZVdmT7CpPdm8RJDtFMlDWuFXsHdTTgp3QvGFl
	4WBqy2UJNG4oefRmaVuYb//6MEHGx7IbLYTZpsUOwkgrXwbBeAUiC8iEP1Tz7ZSdHm+9buhbPTA
	UhCXrG0PJfkTdtbMdt3e5Lb/KiUXnspswMM3CAJDZY+H05g5xM91SfGGYj/+TBqSSGNJPflxGJ8
	pnwXUDdAJ+Y+u3H+kteoMk/tza13tdAh6PTk/D07WlToL785pSu+5jqq9dm7eXQKQETnET+fKhb
	rFfBNHy8xSqq1rUB1eQf7
X-Google-Smtp-Source: AGHT+IEWCqUxzSuiWh8DdXYIcHOPlTXKj59lMZgwA5RjbQMnCjHanj5mZRn4/ZQa/hWBmdDMtYjALw==
X-Received: by 2002:a05:6000:402c:b0:38f:48ee:ddc2 with SMTP id ffacd0b85a97d-3911f7a8ffamr3802810f8f.37.1741197036980;
        Wed, 05 Mar 2025 09:50:36 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391253b3e23sm1792217f8f.76.2025.03.05.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 09:50:36 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 4/8] pinctrl: sunxi: support moved power configuration
 registers
Date: Wed, 05 Mar 2025 18:50:34 +0100
Message-ID: <6028746.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20250227231447.20161-5-andre.przywara@arm.com>
References:
 <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 28. februar 2025 ob 00:14:43 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner pincontroller IP features some registers to control the
> withstand voltage of each pin group. So far those registers were always
> located at the same offset, but the A523 SoC has moved them (probably to
> accommodate all eleven pin banks).
>=20
> Add a flag to note this feature, and use that to program the registers
> either at offset 0x340 or 0x380. So far no pincontroller driver uses
> this flag, but we need it for the upcoming A523 support.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 83a031ceb29f2..fc12e6f807e4d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>  		val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
> =20
>  		raw_spin_lock_irqsave(&pctl->lock, flags);
> -		reg =3D readl(pctl->membase + PIO_POW_MOD_CTL_REG);
> +		reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
>  		reg &=3D ~BIT(bank);
> -		writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
> +		writel(reg | val, pctl->membase + pctl->pow_mod_sel_offset);

These two are missing "+ PIO_POW_MOD_CTL_OFS" right?

>  		raw_spin_unlock_irqrestore(&pctl->lock, flags);
> =20
>  		fallthrough;
> @@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunx=
i_pinctrl *pctl,
>  		val =3D uV <=3D 1800000 ? 1 : 0;
> =20
>  		raw_spin_lock_irqsave(&pctl->lock, flags);
> -		reg =3D readl(pctl->membase + PIO_POW_MOD_SEL_REG);
> +		reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset +
> +			    PIO_POW_MOD_CTL_OFS);
>  		reg &=3D ~(1 << bank);
> -		writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL_REG);
> +		writel(reg | val << bank,
> +		       pctl->membase + pctl->pow_mod_sel_offset +
> +		       PIO_POW_MOD_CTL_OFS);

And these two have "+ PIO_POW_MOD_CTL_OFS" too much, right?

Best regards,
Jernej

>  		raw_spin_unlock_irqrestore(&pctl->lock, flags);
>  		return 0;
>  	default:
> @@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_=
device *pdev,
>  		pctl->pull_regs_offset =3D PULL_REGS_OFFSET;
>  		pctl->dlevel_field_width =3D DLEVEL_FIELD_WIDTH;
>  	}
> +	if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
> +		pctl->pow_mod_sel_offset =3D PIO_11B_POW_MOD_SEL_REG;
> +	else
> +		pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;
> =20
>  	pctl->irq_array =3D devm_kcalloc(&pdev->dev,
>  				       IRQ_PER_BANK * pctl->desc->irq_banks,
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 6cf721876d89d..742fc795c7664 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -87,9 +87,11 @@
>  #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
>  #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
>  #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
> +#define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
> =20
> -#define PIO_POW_MOD_SEL_REG	0x340
> -#define PIO_POW_MOD_CTL_REG	0x344
> +#define PIO_POW_MOD_SEL_REG		0x340
> +#define PIO_11B_POW_MOD_SEL_REG		0x380
> +#define PIO_POW_MOD_CTL_OFS		0x004
> =20
>  #define PIO_BANK_K_OFFSET		0x500
> =20
> @@ -173,6 +175,7 @@ struct sunxi_pinctrl {
>  	u32				bank_mem_size;
>  	u32				pull_regs_offset;
>  	u32				dlevel_field_width;
> +	u32				pow_mod_sel_offset;
>  };
> =20
>  #define SUNXI_PIN(_pin, ...)					\
>=20




