Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA904334B2
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741216; cv=none; b=orO38TurQLpqPtAy3T9n62fU5dq2vVwYUGwsIT22OidMRLjyvYQo/qPEaSIxAgLFpUpFjrnci9fusrDpo+NtRiyL76/lbSFFq9yJOXZ/5uXRl6BgOJ8MggslUSbNMhvsuyka6xDxJ3JkhaAhfGABZBqYDAXg4bFnssT9oK5rBA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741216; c=relaxed/simple;
	bh=Dk2RriWFnptqVrp4DbTAlZa670cAIkFbA0MXp/ZGEWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3g6KIIvzXtrKDkLc1JG8l7cZw7h9VqQYYjaMrGxCTn1WD00nTx9pdvKjOfxwolH4wupu8hAXypk40rNvYW+ZOYEumtv8ztdm3zk2e2u5wQOgP+mMZ2FI2BnBy5j4nrnz0HZ9hYCGwkPC75a68UZXWFrVajh2Y5kXTr1knE4WHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbJBrVX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbJBrVX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1511F00ACF
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741212;
	bh=bmBbdGqXn7zX22juAuUHe8n2tln6u/foAWFAk2OvEPI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=VbJBrVX7eJu20xz06ZlMKi8QIRKS8rsZsooY7QwuebBNONta5I0m69DTasLhllPlo
	 3oi28M/ae9kK6j0h4rD9zTBYSMGWNq/gcMuZOqaxdtaKiFI8lxcB12UqaAjXxtOfg4
	 JtVu1hwtehUyh98Kw1kDSVxb/hWq5yoTLISGFFfASGtC9z1nOquWQ/LYfiaN71On3X
	 P1CO9/geM+92BYzHxKNdU+zf65QUR19ZBBE2Ldd1EUg5AEJ0Q9JLMyaIy+vHziNLDi
	 TIxyunHIMqdDNwQdwM1ZU+XjG8dAOFfN7mnSFcwxuLN/xg9Q56fOSSZkLzbNCdyU1m
	 79tcQ7BNQhekw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so2537698e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 10:26:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZPVn4tlrZ+Nu1V2gHO/Ty/nx0VPD0x+HCC6FbFVbYB1LVwzYJ8Nm+rgxJtCrWbIw2XI+lbAME8rrjSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2067rLaBUr7vJOra7xuefP/Bkoexx4QlirwIORAyArpbY/j2c
	2CnrU7syI+Sx92FCFKwubvXI5l2gcle+Ywa/psfzIKJzbNA64VT0CJLaRd015UyC9kS3deTvK3n
	abBPatcFgamSSbeUJuDgL0SoJU9Kdz8Y=
X-Received: by 2002:a05:6512:61b1:b0:5b2:a21a:10e7 with SMTP id
 2adb3069b0e04-5b2a21a12d5mr2494227e87.25.1784741210871; Wed, 22 Jul 2026
 10:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
In-Reply-To: <20260721223956.13665-1-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 23 Jul 2026 01:26:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
X-Gm-Features: AUfX_mzV8YT9ywm-27dQuVdFcDOwplaJLY2AjiPlfsSw77am-9UWqKDGzOnYCNk
Message-ID: <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 6:43=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 uses the same GPIO voltage "withstand" programming
> (setting the input level voltage thresholds) as the previous SoCs, but
> for some odd reason inverts the encoding of 1.8V vs. 3.3V.
>
> Add a new bias voltage type to note this difference, and select it for
> the A523. At the same time also use the newer "CTL" version, which in
> addition allows to turn off the withstand programming for I/O voltages
> other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
> Ethernet PHYs). The A523 has that enable register, but didn't use it
> so far.
>
> This fixes eMMC and reportedly Ethernet operation on some A523 boards.
>
> Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A523"=
)
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523-r.c
> index dfdcfa740ecc9..cffc1e53eef14 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX=
_BANKS] =3D
>  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
>         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
>         .irq_bank_map =3D a523_r_irq_bank_map,
> -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>         .pin_base =3D PL_BASE,
>  };
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index 801f62abc93df..001bd42afa3ef 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_B=
ANKS] =3D
>  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
>         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
>         .irq_bank_map =3D a523_irq_bank_map,
> -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>  };
>
>  static int a523_pinctrl_probe(struct platform_device *pdev)
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index cabcb8b6f38e5..634d9f1f23947 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -718,6 +718,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>  {
>         unsigned short bank;
>         unsigned long flags;
> +       bool inverted =3D false;
>         u32 val, reg;
>         int uV;
>
> @@ -757,6 +758,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>                 writel(reg | val, pctl->membase +
>                        sunxi_grp_config_reg(pctl, pin));
>                 return 0;
> +       case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> +               inverted =3D true;
> +               fallthrough;
>         case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
>                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
>
> @@ -771,6 +775,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>                 fallthrough;
>         case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
>                 val =3D uV <=3D 1800000 ? 1 : 0;
> +               if (inverted)
> +                       val =3D !val;
>
>                 raw_spin_lock_irqsave(&pctl->lock, flags);
>                 reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index d0936a32123ba..2c8648c3301b6 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -128,8 +128,10 @@ enum sunxi_desc_bias_voltage {
>          * Bias voltage is set through PIO_POW_MOD_SEL_REG
>          * and PIO_POW_MOD_CTL_REG register, as seen on
>          * A100 and D1 SoC, for example.
> +        * Some SoCs invert the encoding for 1.8V vs. 3.3V.
>          */
>         BIAS_VOLTAGE_PIO_POW_MODE_CTL,
> +       BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
>  };
>
>  struct sunxi_desc_function {
> --
> 2.46.4
>
