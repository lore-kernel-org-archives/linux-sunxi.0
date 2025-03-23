Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17B7C13B
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732303; cv=none; b=eiUvRUDPSy2em9g+/MF76iiwSjGecdMozXdsW5sU7D6IPAZpMiEzEJsRjDsrvrsC6Q3mh6Et3BygnAemZfnMaBfexi02gdldLQ1JKBiClTCInxSB40MMNXWvUrkOj8UAHo0JRw950U8iich8mfJaiMyzYxFkjoYWLluo5L//T2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732303; c=relaxed/simple;
	bh=837TaAWexaljub7XNiYP+RS72az8SRzc5hrUiK6u0Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwzYh9YeOmJ/MYWpH64GTEEtc2wWQyiQoGDFh6Lahm7VSKZloQKBai2HgK8Z+ktxOKVzvrBfSx4HhCVDUB3H4ZR3CKlXfwZHp+x9JnqEg12wogpXyPbgTUllvnzFrllARU1zLbsb/2j8C4tupzMHNtQR0bw26z3pDZunAbU2HiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y43Rg1sJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y43Rg1sJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf257158fso23288935e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732299; x=1743337099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB5ftIl8JH7BZPerq9sF1WFx6KIJVUF9CRkiQt5JH+o=;
        b=Y43Rg1sJ+Z/zGLpqTSOorfkViZ3UJj/WPSb8CtbgFFFCPwzO2qbqV1RUq6gYUp34Xm
         mea2qXtL+Y8d0Cvumjp78FYDsJ7RBPyf3LgSYfCSEqxZUWRCq7wQFH6w1VW8wqpTI56D
         BxbPpcS9jqUw5my4h/+OON2EOvnryAPE9TjBCSTuK9FD3ZwwF9D3AeH71PzXfPVo7XdY
         X4rHwtI8lc91KV1pWibdkG7MfYq8BjwBRjkSLOnqxBwmQ+NtM4+bUaDZVQfk3BpGtwNi
         Lu1AV08deeKM++uZDBm0kvBeteLY/2E0oXvMRairs/3XKZwHy4w68EbIbtL4anvgB7qJ
         M5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732299; x=1743337099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PB5ftIl8JH7BZPerq9sF1WFx6KIJVUF9CRkiQt5JH+o=;
        b=m1fFuQ4taROn4Mcln8lPkXIKkQmmdHrum4g+rxzfeYFgVvwL7Ag84cASSMIxlJRvYG
         jOd6M5G+Nk71aAdNPUqba7LJlhdv7IEBx5WdtybyJSNNycC0XJEZryMCNvowP6o+S+pf
         K0fPDUdANj354g+g/6/XkZZJOfn+C/Mxr1i6L+pyN2vj47Jn0oY0H7PLSLWhTy/4QwTZ
         AdkjnR8TGBDK67TvpCPG/Zulfmhi10Pneuu4NKdvyayK33x1TYxTTkqWSAIFrHp+8Rf+
         6twVA4B2alWrSvKqYfPf3tBm2aJDo9jF5zNN/Azwq8abOrn2nTSi3Yu2Tud9zeIMnu2G
         0+DA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4ZRCm07G3u00yz2ci2/ViZ0Tz07f7gdj4pBSDcZk3FjBe93sPqliU0I+NoBNO87McM5v9HzVtw7Muw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVpRVqTliza+XJOg0irRx6O8HCOqcbYjJ070ooqmZhMviPAPBd
	DJJJpknmtiYXlJIbEIoeYdyHgzJi/KMMycB/qVp5ZlrksF7FmIPy
X-Gm-Gg: ASbGncvFEfarA5JfXtI0uqk3hoNAQBVTjP+y1Nn2vC+ydHZe9QNcy++DU59uFnmWlsC
	6tJCp1HgSP3yWvVe1SfvIs6d1zBp859Oew2tOfSAgYp6RRBahsEM7R4CVjDmg867jV8avzeWbUd
	lKIt22uuCCdoW3gR6B7jI10i5YKYE3HjALVkYP404uGyjngWPyLirxzOME3ArWzUNJdvNew3suT
	+jQIfaZhBWl7fEd9VmEQk2iieIG6ThpycpuHPyu40h0A0Wy9up1MIlHgo68sDGtL/ksLtw3eamv
	56wf6r7V5z1V4vQ9GvkR+j8tpFqk8S6syYtx3BBSdah6wYSa3CZD5+KyTpZuSC0cDZXio5WWU5D
	nzSddzB9m3adj06NgE6x1
X-Google-Smtp-Source: AGHT+IH1nKK9o5E85nbDxFZyBZpavOLlOx+jrxur6spNirvhYnlDlZminsbULzEz1rLMHUOgZEwG5A==
X-Received: by 2002:a05:600c:3109:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43d509efa3bmr82770505e9.8.1742732298767;
        Sun, 23 Mar 2025 05:18:18 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f55c3dsm135978805e9.23.2025.03.23.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:18:18 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH 16/34] clk: sunxi: Add support for the A523 -R CCU
Date: Sun, 23 Mar 2025 13:18:17 +0100
Message-ID: <3340159.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20250323113544.7933-17-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-17-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:26 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add a clock driver for the PRCM clock controller on the Allwinner A523
> family of SoCs, often also used with an "r" prefix or suffix.
> This just describes the clock gates and reset lines for the few devices
> that we would need, most prominently the R_I2C device for the PMIC.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi/Kconfig      |  7 ++++++
>  drivers/clk/sunxi/Makefile     |  1 +
>  drivers/clk/sunxi/clk_a523_r.c | 44 ++++++++++++++++++++++++++++++++++
>  drivers/clk/sunxi/clk_sunxi.c  |  5 ++++
>  4 files changed, 57 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk_a523_r.c
>=20
> diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> index 74e89b86301..1c1cc82719c 100644
> --- a/drivers/clk/sunxi/Kconfig
> +++ b/drivers/clk/sunxi/Kconfig
> @@ -136,4 +136,11 @@ config CLK_SUN55I_A523
>  	  This enables common clock driver support for platforms based
>  	  on Allwinner A523/T527 SoC.
> =20
> +config CLK_SUN55I_A523_R
> +	bool "Clock driver for Allwinner A523 generation PRCM"
> +	default MACH_SUN55I_A523
> +	help
> +	  This enables common clock driver support for the PRCM
> +	  in Allwinner A523/T527 SoCs.
> +
>  endif # CLK_SUNXI
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index dd33eabe2ed..93b542cebcd 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_CLK_SUN50I_H616) +=3D clk_h616.o
>  obj-$(CONFIG_CLK_SUN50I_A64) +=3D clk_a64.o
>  obj-$(CONFIG_CLK_SUN50I_A100) +=3D clk_a100.o
>  obj-$(CONFIG_CLK_SUN55I_A523) +=3D clk_a523.o
> +obj-$(CONFIG_CLK_SUN55I_A523_R) +=3D clk_a523_r.o
> diff --git a/drivers/clk/sunxi/clk_a523_r.c b/drivers/clk/sunxi/clk_a523_=
r.c
> new file mode 100644
> index 00000000000..e864ce16199
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk_a523_r.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2024 Arm Ltd.
> + */
> +
> +#include <clk-uclass.h>
> +#include <dm.h>
> +#include <clk/sunxi.h>
> +#include <dt-bindings/clock/sun55i-a523-r-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-r-ccu.h>
> +#include <linux/bitops.h>
> +
> +static struct ccu_clk_gate a523_r_gates[] =3D {
> +	[CLK_R_AHB]             =3D GATE_DUMMY,
> +	[CLK_R_APB0]            =3D GATE_DUMMY,
> +	[CLK_R_APB1]            =3D GATE_DUMMY,
> +	[CLK_BUS_R_TWD]         =3D GATE(0x12c, BIT(0)),
> +	[CLK_BUS_R_I2C0]        =3D GATE(0x19c, BIT(0)),
> +	[CLK_BUS_R_I2C1]        =3D GATE(0x19c, BIT(1)),
> +	[CLK_BUS_R_I2C2]        =3D GATE(0x19c, BIT(2)),
> +	[CLK_BUS_R_RTC]         =3D GATE(0x20c, BIT(0)),
> +};
> +
> +static struct ccu_reset a523_r_resets[] =3D {
> +//	[RST_BUS_R_TIMER]       =3D RESET(0x11c, BIT(16)),
> +	[RST_BUS_R_TWD]         =3D RESET(0x12c, BIT(16)),
> +//	[RST_BUS_R_PWMCTRL]     =3D RESET(0x13c, BIT(16)),
> +//	[RST_BUS_R_SPI]         =3D RESET(0x15c, BIT(16)),
> +//	[RST_BUS_R_UART0]       =3D RESET(0x18c, BIT(16)),
> +//	[RST_BUS_R_UART1]       =3D RESET(0x18c, BIT(17)),
> +	[RST_BUS_R_I2C0]        =3D RESET(0x19c, BIT(16)),
> +	[RST_BUS_R_I2C1]        =3D RESET(0x19c, BIT(17)),
> +	[RST_BUS_R_I2C2]        =3D RESET(0x19c, BIT(18)),
> +//	[RST_BUS_R_PPU1]        =3D RESET(0x1ac, BIT(17)),
> +	[RST_BUS_R_RTC]         =3D RESET(0x20c, BIT(16)),
> +//	[RST_BUS_R_CPUCFG]      =3D RESET(0x22c, BIT(16)),

Any specific reason that you commented out some reset lines?

Best regards,
Jernej

> +};
> +
> +const struct ccu_desc a523_r_ccu_desc =3D {
> +	.gates =3D a523_r_gates,
> +	.resets =3D a523_r_resets,
> +	.num_gates =3D ARRAY_SIZE(a523_r_gates),
> +	.num_resets =3D ARRAY_SIZE(a523_r_resets),
> +};
> diff --git a/drivers/clk/sunxi/clk_sunxi.c b/drivers/clk/sunxi/clk_sunxi.c
> index 30baabaafcd..842a0541bd6 100644
> --- a/drivers/clk/sunxi/clk_sunxi.c
> +++ b/drivers/clk/sunxi/clk_sunxi.c
> @@ -127,6 +127,7 @@ extern const struct ccu_desc h6_r_ccu_desc;
>  extern const struct ccu_desc r40_ccu_desc;
>  extern const struct ccu_desc v3s_ccu_desc;
>  extern const struct ccu_desc a523_ccu_desc;
> +extern const struct ccu_desc a523_r_ccu_desc;
> =20
>  static const struct udevice_id sunxi_clk_ids[] =3D {
>  #ifdef CONFIG_CLK_SUN4I_A10
> @@ -228,6 +229,10 @@ static const struct udevice_id sunxi_clk_ids[] =3D {
>  #ifdef CONFIG_CLK_SUN55I_A523
>  	{ .compatible =3D "allwinner,sun55i-a523-ccu",
>  	  .data =3D (ulong)&a523_ccu_desc },
> +#endif
> +#ifdef CONFIG_CLK_SUN55I_A523_R
> +	{ .compatible =3D "allwinner,sun55i-a523-r-ccu",
> +	  .data =3D (ulong)&a523_r_ccu_desc },
>  #endif
>  	{ }
>  };
>=20




