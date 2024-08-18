Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4138BB666
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988425; cv=none; b=aSlf5StIdQdR1WQOBrBCkp5zZOOGEmbytI2UHBm/OCvO1K2bM2Rqd9GPxg3ZWE6VoCHewavy0BYM1vMkkTqhPQht+0OJClZoE088p5F2TSWZudPa6dFfkxfGLLBOMfy9St9Bs1claOprrOhvu4FmJu5wn67V+LaSD1abpIcpjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988425; c=relaxed/simple;
	bh=ldamHuImR/6va6FjXYNn6RxdAp0P3Pw8Rryj40Qiquc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryOCOUQA6SoZJ0qvGF6e58DUTLjxVxQ8YE1AlQ2ANj6OOJ1eeXozBgSkkkTGi4xV80rN6Zkj09ZFrnjGT4TWIjaEUH4LopTuHfeMHbg7QdHTVGUrIvmHoihH54B3BvJtfRD23SR4lH4WbYuQu6KWTpmRnOw3k9ZAPj8obiqL83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f0271b0ae9so44496621fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988421; x=1724593221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvRzy9hrujHqDH8ifWbdcELEDvdI4LK/lGCJqnW2vRs=;
        b=nc0uxRnJSrQvxpwpjvX+CMHL7WRbPxSy11QAw9mPnIYVAk/+3mlR6GEkWyLMCkObXR
         cL+CbJbo7bQ4nUNl8P6WSHZYHAn3ouL0XyHZSAz0J3xTpR5iy/54/xqbc/9zDu9Wyy/r
         9m2qBGieYjwyTAA9+2x7sBrbzDvSJqG3ycp4pgtqjav2kL8X4mVXDDfP4fdM5RKKfe43
         jyUFYM5xgPb3/B+vFoZvGLomMDnS8XG47HYZWBS7SKwonizrRB9ZoHVafH7K+W0HTGWz
         9wUOjkkg4a6xrLicrwhoOgNIxScrkDFsnnSIjzJkqbskEWgD+zHST4sYXzHuMMo+1Jj4
         cTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuOHCtwFwTvO4mxXzjd68HKi+ItrRoQXBnJ/nbLC8agt6o+9WAi9nBIYWfZ+NbnqyhzYNTx2AWZqzu6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxaicl0RzEG5h7W8jJiKn6REyjPOaVCV6ifqfXvrIDHQQ4g+RH
	WOsFXVN53gn9Q931r0MKVZ2DtCanh8LG4uhW1Iq1XZshhuiWb88eXapf1zbT
X-Google-Smtp-Source: AGHT+IHf7XNxNZcSEig1EvDyxh2SDv57rArhhSdfIaCdjX9WmgF/H2nKokyVyel1bc5U+GhTwxZGVg==
X-Received: by 2002:a2e:a990:0:b0:2ee:7a3a:9969 with SMTP id 38308e7fff4ca-2f3be57219cmr60487191fa.5.1723988420012;
        Sun, 18 Aug 2024 06:40:20 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b74b325csm12352951fa.71.2024.08.18.06.40.18
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:40:18 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f16767830dso38360261fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:40:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUg7OBVYcuXsNyCuthA69tfKF5lzFl/Ls4qFFg6lvWP9DR98ZdwTgy9MGF1cdgjy2VUf/kjdEOt/0tOvA==@lists.linux.dev
X-Received: by 2002:a2e:b55a:0:b0:2ec:500c:b2e0 with SMTP id
 38308e7fff4ca-2f3be595f74mr47743761fa.22.1723988418234; Sun, 18 Aug 2024
 06:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-23-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-23-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:40:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Fpt_tP5gSZftmexOY-sS6dsC=+KmgAJmMoRuhsEvK7g@mail.gmail.com>
Message-ID: <CAGb2v64Fpt_tP5gSZftmexOY-sS6dsC=+KmgAJmMoRuhsEvK7g@mail.gmail.com>
Subject: Re: [PATCH v3 22/26] clk: sunxi-ng: ccu: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 7:08=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> The DE33 in the H616 has mixer0 and writeback units. The clocks
> and resets required are identical to the H3 and H5 respectively, so use
> those existing structs for the H616 description.
>
> There are two additional 32-bit registers (at offsets 0x24 and 0x28)
> which require clearing and setting respectively to bring up the
> hardware. The function of these registers is currently unknown, and the
> values are taken from the out-of-tree driver.
>
> Add the required clock description struct and compatible string to the
> DE2 driver.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>
> --
> Changelog v2..v3:
> - Lowercase hex value
> - Correct #include for writel()
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index 7683ea08d8e30..e0fdf9bda10b1 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>

Still incorrect.

>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>
> @@ -239,6 +240,16 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk=
_desc =3D {
>         .num_resets     =3D ARRAY_SIZE(sun50i_h5_de2_resets),
>  };
>
> +static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc =3D {
> +       .ccu_clks       =3D sun8i_de2_ccu_clks,
> +       .num_ccu_clks   =3D ARRAY_SIZE(sun8i_de2_ccu_clks),
> +
> +       .hw_clks        =3D &sun8i_h3_de2_hw_clks,
> +
> +       .resets         =3D sun50i_h5_de2_resets,
> +       .num_resets     =3D ARRAY_SIZE(sun50i_h5_de2_resets),
> +};
> +
>  static int sunxi_de2_clk_probe(struct platform_device *pdev)
>  {
>         struct clk *bus_clk, *mod_clk;
> @@ -290,6 +301,16 @@ static int sunxi_de2_clk_probe(struct platform_devic=
e *pdev)
>                         "Couldn't deassert reset control: %d\n", ret);
>                 goto err_disable_mod_clk;
>         }
> +
> +       /*
> +        * The DE33 requires these additional (unknown) registers set
> +        * during initialisation.
> +        */
> +       if (of_device_is_compatible(pdev->dev.of_node,
> +                                   "allwinner,sun50i-h616-de33-clk")) {
> +               writel(0, reg + 0x24);
> +               writel(0x0000a980, reg + 0x28);
> +       }
>
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
>         if (ret)
> @@ -335,6 +356,10 @@ static const struct of_device_id sunxi_de2_clk_ids[]=
 =3D {
>                 .compatible =3D "allwinner,sun50i-h6-de3-clk",
>                 .data =3D &sun50i_h5_de2_clk_desc,
>         },
> +       {
> +               .compatible =3D "allwinner,sun50i-h616-de33-clk",
> +               .data =3D &sun50i_h616_de33_clk_desc,
> +       },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_de2_clk_ids);
> --
> 2.46.0
>
