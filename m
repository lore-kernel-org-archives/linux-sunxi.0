Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E5223700
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807313; cv=none; b=hMgYH+klj0mF2CgBiY8l/kH8uh8/f8nGpgIbzd/BlFp3wfovuvfcQnoM4SFOSawkrJkyTv9O5MWIUauwuyZApz/HKGS5v8Z4kvYAYM6cvT9kZVlC9EbVWubF2MIzii7nW9DjzT8ROwjTZIa/2Uc2BhU8xIKANn3JKdz0xDoityA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807313; c=relaxed/simple;
	bh=06+HsNBqZbxG8SrKyC7xwIUS/afQ5IoCNqI5xrOzpH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2VTnYJ3nvyNwtGGz7S3vEu4+1NdQhtXGDhnnMMvxGaTP6pp6W1WNQUadK98JJBVlEKVU2zISLdH2m/1ciPaQSlv3bLcR3eK/tEdS7xw01xmcqRgkTlEKRl/2J5XQUVLsR/zlGm2RKOkfE1KvKcgDLYBLX1mwDM/DeBJQHhLfKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5452c1daabeso2531673e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 07:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807308; x=1740412108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oT48PO3HfIeDjSDux1vBuhE4VoEwoL5q99u+4AwOVE8=;
        b=A0/X6CG5uND+FGYu8fy01nQOFTf6Oy1VSqAjz6RXk0HiyCxQZhvLoMosqIvO2jVx1t
         EjN0wTtQzV66yWo/yM2f2Icp1X60LqtEJdnofCaPRNxDHYW/AVvRx6DjQIasl3nw+Orq
         JuRrsf6+qaD+yntYvdQ+nsRrbEdD7ra/F9AHGh5RgOqNIWEdNS6KzgG0jL7PeJveVfVK
         xUx6SXeTIJuWKKmbrj09yKdO1RBwCyMWAf1PA2Kwk8V+rgtkRfkCtoRvTnMBaKYBKtra
         rUC9paFPG/mqEtS7gLMwKGITOC43MSi3Mdlm9I9j1u6gNF9Zk9uWfl7jsJu1MDbK8NGh
         4wlw==
X-Forwarded-Encrypted: i=1; AJvYcCXPs8tdWDT4B6H/ZTnPFIWIeYT1bhI/q722hhQ6iEXhFFBVXu900tKrVvKpmgN9DU9Y6J734IcIi4Olzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGhbGXCn580TibJ0ZgU5OK/O3bnC2Ccz7Tz7TjR3T5sOuDDMo6
	eVxJKzzMfWHNt19RJRgBUrjoRsMYmg9u6z+CYA3kCBwg849l6YsEsteyRhBV
X-Gm-Gg: ASbGncu4WT9S/jcpi8WX1rxIaum5bTrS/fwiF6KBgXTboJS9O2Ki2Gnw++xYYa3GNxC
	AXmns23NEI1KP5L3Yh7aeZ183bnpxIiLVs7n6RfctGGLnlow/bvPxkyL8MfrktwID9RF9L7AnQu
	jwNKbujJIDWUQptZEJA4LzYnujD5K+5fkJDMZNytxQgS+deBpUiD4WHZKq8jfZ0dQlHDKrcO114
	tWkbY5fsbHyZfYLWrZWTk8VroM4pYUcEpP1fzBjt13uXcctznzGbRIy4kAhQ2YP6Mre/J9KHZl7
	PSTQIdGoU6tDn+cLcI9s3bphlzAmibafQw426Mb6c0KtmGUs
X-Google-Smtp-Source: AGHT+IFsvtZBfxSGOu2cyMCyM4S21bKke0LKw4MgunZw8encA2bef/UyCDWp/xX+bw76SzBedQkp1w==
X-Received: by 2002:a05:6512:33c9:b0:545:225d:6463 with SMTP id 2adb3069b0e04-5452fe8befdmr2369359e87.42.1739807307961;
        Mon, 17 Feb 2025 07:48:27 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54619e64bcbsm768581e87.37.2025.02.17.07.48.26
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:48:26 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30a2dfcfd83so11116291fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 07:48:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUssef2Zy+njtonViR3BaE5RmJvobW72uYDNUqH4wOS42dWfYR+WHGU+dIJz/krpai+p3f5p2J3kLEt5w==@lists.linux.dev
X-Received: by 2002:a2e:88c9:0:b0:309:2012:cc5d with SMTP id
 38308e7fff4ca-30927ad64e9mr23653441fa.24.1739807306250; Mon, 17 Feb 2025
 07:48:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-5-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-5-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:48:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
X-Gm-Features: AWEUYZlCDWHC9MbTz92hd57HNQUJnNXRSXbL_QnKKWLChMmYjVCum1sff3H_yMQ
Message-ID: <CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: sunxi: support moved power configuration registers
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner pincontroller IP features some registers to control the
> withstand voltage of each pin group. So far those registers were always
> located at the same offset, but the A523 SoC has moved them (probably to
> accommodate all eleven pin banks).
>
> Add a flag to note this feature, and use that to program the registers
> either at offset 0x340 or 0x380. So far no pincontroller driver uses
> this flag, but we need it for the upcoming A523 support.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 83a031ceb29f2..a1057122272bd 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
>
>                 raw_spin_lock_irqsave(&pctl->lock, flags);
> -               reg =3D readl(pctl->membase + PIO_POW_MOD_CTL_REG);
> +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
>                 reg &=3D ~BIT(bank);
> -               writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
> +               writel(reg | val, pctl->membase + pctl->pow_mod_sel_offse=
t);
>                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
>
>                 fallthrough;
> @@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunx=
i_pinctrl *pctl,
>                 val =3D uV <=3D 1800000 ? 1 : 0;
>
>                 raw_spin_lock_irqsave(&pctl->lock, flags);
> -               reg =3D readl(pctl->membase + PIO_POW_MOD_SEL_REG);
> +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset +
> +                           PIO_POW_MOD_SEL_OFS);
>                 reg &=3D ~(1 << bank);
> -               writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL=
_REG);
> +               writel(reg | val << bank,
> +                      pctl->membase + pctl->pow_mod_sel_offset +
> +                      PIO_POW_MOD_SEL_OFS);
>                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
>                 return 0;
>         default:
> @@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_=
device *pdev,
>                 pctl->pull_regs_offset =3D PULL_REGS_OFFSET;
>                 pctl->dlevel_field_width =3D DLEVEL_FIELD_WIDTH;
>         }
> +       if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
> +               pctl->pow_mod_sel_offset =3D PIO_11B_POW_MOD_SEL_REG;
> +       else
> +               pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;
>
>         pctl->irq_array =3D devm_kcalloc(&pdev->dev,
>                                        IRQ_PER_BANK * pctl->desc->irq_ban=
ks,
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 6cf721876d89d..a93385e456a57 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -87,9 +87,11 @@
>  #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
>  #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
>  #define SUNXI_PINCTRL_PORTF_SWITCH     BIT(9)
> +#define SUNXI_PINCTRL_ELEVEN_BANKS     BIT(10)
>
> -#define PIO_POW_MOD_SEL_REG    0x340
> -#define PIO_POW_MOD_CTL_REG    0x344
> +#define PIO_POW_MOD_SEL_REG            0x340
> +#define PIO_11B_POW_MOD_SEL_REG                0x380
> +#define PIO_POW_MOD_SEL_OFS            0x004

Shouldn't this be PIO_POW_MOD_CTL_OFS instead?

ChenYu

>
>  #define PIO_BANK_K_OFFSET              0x500
>
> @@ -173,6 +175,7 @@ struct sunxi_pinctrl {
>         u32                             bank_mem_size;
>         u32                             pull_regs_offset;
>         u32                             dlevel_field_width;
> +       u32                             pow_mod_sel_offset;
>  };
>
>  #define SUNXI_PIN(_pin, ...)                                   \
> --
> 2.46.3
>
