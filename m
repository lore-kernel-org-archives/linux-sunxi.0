Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40A234F24D
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Feb 2026 03:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770781791; cv=none; b=FU5GLon9yBsHf/Dk2at0uGcMUfKr0Omh3VT6hZ/MeoNUpUJZ2MVswNi6eL4M461iEt682dbc4mxY+01jB/PKU8SSUTVpwu7Wk0gftg4+bMbW6c42ZWS+z2kviaGFx0eOkCky+zFqBBFS0ESEWp2xB+YUwunGm5r6wzEwoc7oJXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770781791; c=relaxed/simple;
	bh=Jy0ltPXhz9tRco4ib1CKhZ6LDLJXYw+nypbUadGqQTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwgOg5MBAqxai4zpfQD1dyTKiWpRnealAPrIKgagG+3qadqcdrRV1dQZFN6mjeSPDTAv2nezJrktP3DuuNgADFXsrUjCQCEwuwEXtg1nHY35yYbcxi4Go5plGnRGEGDf80bKLQ/zGn2UVOqplWyn7FEwtb7nMdVokHyeLEpmFTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGYRrDWD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGYRrDWD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6BBC4CEF7
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Feb 2026 03:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770781790;
	bh=Jy0ltPXhz9tRco4ib1CKhZ6LDLJXYw+nypbUadGqQTs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=HGYRrDWD6/LORoYvdtWxpamKunatE1qHTT8fQbZLwnwzZ+rob6DQ4VvfrF06BRfS2
	 23Pd+DftXcWs/kqdEHIXw5zmTJK53t3DKqFfI0uVLPoy5cbIGBmXVVYFpDQpLzQ/ch
	 INjAQ+FGVRYR4Y1vZegFG8r71QE7xIiNJHBddHXeb2uN9CGGf7ZmWM9LvPAEo98lWi
	 fVVIfh7S0jdTJclgGjmFk8B3l2PSE3z4mIleDh8Ixy3fP5lxSIa4P1uRrrG2fLfNog
	 8PNiqoaRBX3HQzMIo9vPTvmFzrvmVBRQGZHuVq7ReDEnGyopxM8zGaMSX/g6iXQEzJ
	 ASadz2OhBwvCg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso1686650e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Feb 2026 19:49:50 -0800 (PST)
X-Gm-Message-State: AOJu0Yx2OPDC7VK2+c57WaPwtvC+2Nu1Et3Rl7wWOGD88MquohFUx2/Y
	W13TDV4rX7cdf3BXz+q5dot7FrRWo/2UrGfHlyb+ozPCwKQvjEzL7+EgObtZDOhtd7clh1nNTKS
	upmiCG2+a7OIhsjxfFdo55pfLm1pJ3CY=
X-Received: by 2002:a05:6512:3ba4:b0:59e:38c7:b372 with SMTP id
 2adb3069b0e04-59e450437afmr4669513e87.6.1770781789020; Tue, 10 Feb 2026
 19:49:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com>
In-Reply-To: <20260211033249.2770281-1-james.hilliard1@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Feb 2026 11:49:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
X-Gm-Features: AZwV_QhPOLTZNzx5G_KENa0ppJq8t642Pn8F0o2YJqb-P0Bn-8LQi4bIpuV6-jg
Message-ID: <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 11:33=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:

Ah, you beat me to it.

> Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> the sunxi gpio_chip setup.

Can you also mention that without this, calls to gpiochip_get_direction()
cause a big warning?

> The new callback reads the pin mux register and compares the mux
> value against the pin descriptor gpio_in and gpio_out functions
> to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> If the pin is muxed to irq, report it as input.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 0fb057a07dcc..424f23be27b2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(struc=
t gpio_chip *chip,
>                                             chip->base + offset, false);
>  }
>
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +                                           unsigned int offset)
> +{
> +       struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> +       struct sunxi_desc_function *in, *out, *irq;
> +       u32 reg, shift, mask, val;
> +       u16 pin =3D chip->base + offset;
> +
> +       in =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_i=
n");
> +       out =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_=
out");
> +       if (!in || !out)
> +               return -EINVAL;
> +
> +       irq =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq")=
;

This is less efficient, as you end up (linearly) searching the whole pin
array three times.

What I did in my version was implement a search based on pin and muxval.
I can send that out if it's OK with you.


ChenYu

> +
> +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +       val =3D (readl(pctl->membase + reg) & mask) >> shift;
> +
> +       if (val =3D=3D in->muxval)
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       if (val =3D=3D out->muxval)
> +               return GPIO_LINE_DIRECTION_OUT;
> +
> +       /* IRQ function is effectively input. */
> +       if (irq && val =3D=3D irq->muxval)
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return -EINVAL;
> +}
> +
>  static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
>                                 const struct of_phandle_args *gpiospec,
>                                 u32 *flags)
> @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>         pctl->chip->set_config =3D gpiochip_generic_config;
>         pctl->chip->direction_input =3D sunxi_pinctrl_gpio_direction_inpu=
t;
>         pctl->chip->direction_output =3D sunxi_pinctrl_gpio_direction_out=
put;
> +       pctl->chip->get_direction =3D sunxi_pinctrl_gpio_get_direction;
>         pctl->chip->get =3D sunxi_pinctrl_gpio_get;
>         pctl->chip->set =3D sunxi_pinctrl_gpio_set;
>         pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
> --
> 2.43.0
>
