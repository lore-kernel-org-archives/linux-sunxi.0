Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD62E2823
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Aug 2025 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779725; cv=none; b=Q7JoPt6LO7aTQ6eVbTGbV1UVzcS+YqUCD5DxyjUdZSrKwf1lF1VRDfhem5o9xyJg7F6K6NImYrEUiVuvfdAWqWhEXrVHB6ATN0S0+VCcnEvhBXGM2X0uzJtCOCyK16JUwjam+5kcaQOsepGmrk8yqcKpgadZDtnUi9kDNUz+14Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779725; c=relaxed/simple;
	bh=6SsyLR5JLHjbKtKd89+UE2OomTPPbF3m8LLiO2yv1Fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bru29yOpTB9GjAVmAFSKx5CygA58kInINVNlDvwZ0/LtLdThqNvpJpVoX8cOSrai0GgXDCwzk7K2wRDeMMwDzdHlJ5uIOqlD+phbu783OY6ZaI/D+c9MzmUBjg7vsU0EYga4lJoxA1+cZAaND1mpLClFK1Ycthht/muJnT3+Isg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ku3rIFhl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ku3rIFhl"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55ce526ac04so847887e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Aug 2025 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779722; x=1756384522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhK/5iEdOsHso7WQOtGlojYYvxbDlPHKTAFa/LVoWKk=;
        b=ku3rIFhl/SvYiZQ51tBpZeUtYl+n2r47rMC1aF7q9ayT5mw2sz10Urf1xMrjASdnU0
         BFOw0EW4IuFsfqN4d4QICTkgBo8aFg0zF9jczprDHLlh7TfXgR4IyHO/8agP7Cm1pwex
         N5VoCGh9V/7wvuSwYzDUTW/HVMOIxms/6U+E5cFWqHkUCUo/Fq1MdgNlK+ohux/6UNVH
         wwxMrscLYfRftNeYG84bh+tRa6tf89Ttkv44CMPHxSd6I/LW6/v8Ry3bLFOcxCze9hNC
         sysXPsAaZalrax7Dccz2rjRgrExXolzvirxMkKjhekxgHFmLEI9VBCsDmpo/ByDSZrH/
         NTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779722; x=1756384522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhK/5iEdOsHso7WQOtGlojYYvxbDlPHKTAFa/LVoWKk=;
        b=bzc9bjDQWvKJPbdyl3ElnOkhtHp+RjTnpSwUIpX9yheTMETdEvblN1J7nm0JEvhRGe
         6AiNgqfl8xLAypF+sxf35znMqGFJkY/T45TGTVCWyGezJ93Ja2o+llPVwQj3K2WKt3ee
         GY2dIeQJ8Iat2jHhHwJjotX/cIO8kvlOWcfgunXrlRNKirwN8ChID+L3dAQTVZdKLijI
         aB5uC79HyHHJPjD8kp7NqslCZYox+pG36GE89lKRC7JFtzNnpRelUyKBfbQBa9Dyj4dU
         mnt5O9vMDS1qSzzZZSOmZU1Spdbu/1MzQhq/WjaCQH8UjPmqHhQ674lf/n8aSYB+w6Aj
         97aw==
X-Forwarded-Encrypted: i=1; AJvYcCVwGJc+kTkiOWtXIOUFtqeYXA+Mgq15iHWqmd+IRjIT0mGnZ9yuHkrNtDTLGgmgSfEkgjttGMvMEfu4BQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBx/KnXiUdQr4t+4Ob0dlTwaAopnsbKT5LqhpU7NEYOBzvQ+pA
	Xn6FMaZk06Z57ucLgQ2/5N8GOSZY9ov0EpMEQTVJj1K9z/RFFxnhiUhsu+r0yFn4RdqEglGFUwt
	Ul079oNiNaDFEwQXzbr7o2cGcpludZpi+PRQcfY5vzg==
X-Gm-Gg: ASbGncvqFbwc2qQCTQWtoUv2dKZ0DqgEBR/wvU58GnbLw96soO6ATDSudRxL+RagQE/
	/mdSnqFKz+gVQh81eoAIF9EQ5CP0anLzBq4rftSATcRV3lm89OfJQhGE1Gp9p0QsVwbjOKIRAm6
	+5DBwbpsMUV0jq6aHxoBbJY3Rv8Fwucn17WkAfc61tQvInp4j+HAbypM53fE2E0kO6hoAakQIWf
	qiyFyQ=
X-Google-Smtp-Source: AGHT+IGFT1SOHRHnznv0j24jQt6OItG+VkUUqGfuDCNg03+god9R2F302j/+MpxBGP6QnhkRVuIKkbhRbFIemE8O8FM=
X-Received: by 2002:a2e:3314:0:b0:32c:b83d:64ab with SMTP id
 38308e7fff4ca-33549f4a0e2mr4716741fa.24.1755779721325; Thu, 21 Aug 2025
 05:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821004232.8134-1-andre.przywara@arm.com> <20250821004232.8134-7-andre.przywara@arm.com>
In-Reply-To: <20250821004232.8134-7-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 14:35:10 +0200
X-Gm-Features: Ac12FXyGD4nO__iucr4UwJuUtNZrpHlCHuWUThm0Y3PsAmwji1zokHx8_NHiyLM
Message-ID: <CACRpkdb-cudZE6mZH7vEOLU=aJFaNLX2dHz8Q_=2cfh1-JBRgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 6/9] pinctrl: sunxi: add support for set/clear regs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

thanks for your patch!

On Thu, Aug 21, 2025 at 2:45=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:

> -       raw_spin_unlock_irqrestore(&pctl->lock, flags);
> +       if (pctl->flags & SUNXI_PINCTRL_HAS_SET_CLEAR_REGS) {
> +               if (value)
> +                       writel(mask, pctl->membase + reg + DATA_SET_OFFSE=
T);
> +               else
> +                       writel(mask, pctl->membase + reg + DATA_CLR_OFFSE=
T);
> +       } else {
> +               raw_spin_lock_irqsave(&pctl->lock, flags);
> +               val =3D readl(pctl->membase + reg);
> +               if (value)
> +                       val |=3D mask;
> +               else
> +                       val &=3D ~mask;
> +               writel(val, pctl->membase + reg);
> +               raw_spin_unlock_irqrestore(&pctl->lock, flags);
> +       }

This is now starting to re-implement the generic MMIO GPIO chip,
which I'm not so happy about, this is simply the difference between
passing just a single data register to the generic config or
passing a set and clear register.

        ret =3D bgpio_init(&g->gc, dev, 4,
                         g->base + GPIO_DATA_IN,
                         g->base + GPIO_DATA_SET,
                         g->base + GPIO_DATA_CLR,
                         g->base + GPIO_DIR,
                         NULL,
                         0);

...

I also notice:
pctl->chip->of_gpio_n_cells =3D 3;

Is Allwinner one of those drivers that could actually start using
select GPIO_GENERIC nowadays?

Please look at
commit bd3ce71078bde4ecbfc60d49c96d1c55de0635cc
"gpiolib: of: Handle threecell GPIO chips"

And the example user:
drivers/gpio/gpio-spacemit-k1.c
esp how it uses spacemit_of_node_instance_match().

If it's possible to switch over to GPIO_GENERIC this hopeless
maintainer would love if that could be done first so the picture
gets more clear.

Yours,
Linus Walleij



Yours,
Linus Walleij
