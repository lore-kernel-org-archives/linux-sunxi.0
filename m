Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4517A2FFDDF
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763228568; cv=none; b=jOEbNXagygRcWrnnIAxAvPgWjzDBZc0ADjMwtB/K7J2zX01DRCIogvvJsFSuGgdEt4Kkyb+msRNpMRHlLHzlzo/1JRe6/XezKij9pgtpiKOKh+YHyZczExs+XvMumjAI8+u0HAikoPDlI5qWP7UPZOcJ3DyYu25t3+d19vJDl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763228568; c=relaxed/simple;
	bh=s+S9pW5x//ou7X1wP3bi3A8Ps+6qeGc9acdcWBpHbU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsyyppzJfffWrTLwnXbayK0+KJBUIrkIgHfxg/ciWzlmSjhzGM5eKMOY009qBe6A286V82FTlYZgBOm3npkMznH6rAkjFUCu9CwywopuG708NU75ZGUF3E3KvBiUEkh0RSxIea5xbAzCXnVyDkGBpQmqdoprWXAQVRoMNvi/TRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b735e278fa1so407050366b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 09:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763228564; x=1763833364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS8st6S4NEhfwQi2ADWQ0RHyYWa8wB83L+ih+AMC2co=;
        b=rJ3cEzL9/w5ZUktr7lo6ezFV00gEMXMPVg9WzttnutjmaSGUME79mG/yOKwi5LlDHV
         qRp7sTv5jyWDVDfnTaPFhVI7qbW8hBx60RBIMiZiVbKBohdzlRpMRNdOvIZKktYVEg1v
         9CDoq1TcZjR03FJHyfDUM1878+Im2kPjucsek/wUmDA8Glpt40M1FYEf4vakP2dgvfom
         3AesYShHuA00rY/nfB3g1ACDo5qeaIzKmLBQ95al0A6N4kuKDgSwTktOyDz6FUrWM0F3
         +ZrsfCWT/O+5VQsh+4GfQhZsMADLznG8KnqK/PHXQa1bF2V5WGatsVftkKA5y7i6/NAj
         Hrhg==
X-Forwarded-Encrypted: i=1; AJvYcCUZCsrFOQpVjufv8KVJUrhYIScJh0M7W5F37Gx2KoenRf/U9+VltzSytH52E8FRMo4a/o2K8P+6lI6z1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzR6obG6nJ8GdcxEUhCy+8sCLWbZCaYAN86r3Qf3QZRyPRi5Cdm
	ozPHQljXfq8mIQzjK/zlCyaHK79fFj6/Ljl6/9ybgGvcYvkzqBrn9JZqrhLqASZu3+k=
X-Gm-Gg: ASbGncsWlhVMF9+5XnItxP3sl0SebTkhXz7+w9r0AKwm7cMDmn7BS3odLmxl7bzOO2g
	M288QnR2aThfkpvQkbD7rBOUkiwnCf+p9j/ZJRqs9HOGLpZPkRXnvO0taP2JTI3qkAaCxZDJo1k
	uD0YBusYQYISHKCVAdneiDGFe8INIVpetupCqvI8a5afh2xVCrkUz2fZpeUCEKNepMlrNphtfLt
	wQTiGddOEtJNZeGCUxiQsWEolJ418cL0sKqrUnLFkhi4oUbAGDvc1RyA9/zJjwODPOsIxy+g2c9
	3dPFdVj1A6JSHBsJvNSKUv1Gefonkt7+8AFqVtP9dVT/EOXNTm5C1i5+AIxbnPl/T/oFYFaGRG9
	56lKag/A6dkLc6oFbx10GW6VNXWwY0hcX53sLYLLQuhEtae5/to+gY3sbuRpCkWi00QBMuqcFQJ
	K8v7yVLLb1tHdj1hQgNTIrDmqj8aWJBCyupoevkdo=
X-Google-Smtp-Source: AGHT+IHXNlMp9Vcwbp4moX0E3jRb4aHIdr9NH2Zu3HPqeTsw55s6NnNIgf9lOwvUM59ZIEiVrNGS/g==
X-Received: by 2002:a17:907:3f0a:b0:b6d:565f:7862 with SMTP id a640c23a62f3a-b736786c793mr737814166b.14.1763228563954;
        Sat, 15 Nov 2025 09:42:43 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm655912066b.30.2025.11.15.09.42.43
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 09:42:43 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b737c6c13e1so126371866b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 09:42:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbsudqfH91OHquaO1Qvb1uakFRAeXSv39dqvh51rE8PRcCh3DHtVrgX8JqKLeOD00+8d8Anzks+f83oQ==@lists.linux.dev
X-Received: by 2002:a05:651c:41d5:b0:37a:4c29:3a90 with SMTP id
 38308e7fff4ca-37babac1aa5mr18627811fa.0.1763228257141; Sat, 15 Nov 2025
 09:37:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-4-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-4-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Nov 2025 01:37:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64xOrLzPYNOfFNFfPckR8EUF_U6xY0J_a3G7b0Ymb4OnA@mail.gmail.com>
X-Gm-Features: AWmQ_bmhcY2-o8gJRo_3ltGzVFP1TpTD5csESojSsWw724bLMcf3HNL8i2V4XHQ
Message-ID: <CAGb2v64xOrLzPYNOfFNFfPckR8EUF_U6xY0J_a3G7b0Ymb4OnA@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: sunxi-ng: de2: Export register regmap for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> DE33 clock pre-set plane mapping, which is not something that we want
> from clock driver. Export registers instead, so DRM driver can set them
> properly.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 53 ++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index a6cd0f988859..2841ec922025 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -6,9 +6,11 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>
>  #include "ccu_common.h"
> @@ -250,6 +252,41 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_=
clk_desc =3D {
>         .num_resets     =3D ARRAY_SIZE(sun50i_h5_de2_resets),
>  };
>
> +/*
> + * Add a regmap for the DE33 plane driver to access plane
> + * mapping registers.
> + * Only these registers are allowed to be written, to prevent
> + * overriding clock and reset configuration.
> + */
> +
> +#define SUN50I_DE33_CHN2CORE_REG 0x24
> +#define SUN50I_DE33_PORT02CHN_REG 0x28
> +#define SUN50I_DE33_PORT12CHN_REG 0x2c
> +
> +static bool sun8i_de2_ccu_regmap_accessible_reg(struct device *dev,
> +                                               unsigned int reg)
> +{
> +       switch (reg) {
> +       case SUN50I_DE33_CHN2CORE_REG:
> +       case SUN50I_DE33_PORT02CHN_REG:
> +       case SUN50I_DE33_PORT12CHN_REG:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}

Since the registers are contiguous, I think it makes a bit more sense
to use the .rd_table and .wr_table. A bonus is that the check can be
inlined in the core instead of calling a function pointer.

> +static const struct regmap_config sun8i_de2_ccu_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .val_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .max_register   =3D 0xe0,

None of the registers past SUN50I_DE33_PORT12CHN_REG are accessible,
so we should probably just put that here.

> +
> +       /* other devices have no business accessing other registers */
> +       .readable_reg   =3D sun8i_de2_ccu_regmap_accessible_reg,
> +       .writeable_reg  =3D sun8i_de2_ccu_regmap_accessible_reg,
> +};
> +
>  static int sunxi_de2_clk_probe(struct platform_device *pdev)
>  {
>         struct clk *bus_clk, *mod_clk;
> @@ -303,13 +340,23 @@ static int sunxi_de2_clk_probe(struct platform_devi=
ce *pdev)
>         }
>
>         /*
> -        * The DE33 requires these additional (unknown) registers set
> +        * The DE33 requires these additional plane mapping registers set
>          * during initialisation.
>          */
>         if (of_device_is_compatible(pdev->dev.of_node,
>                                     "allwinner,sun50i-h616-de33-clk")) {
> -               writel(0, reg + 0x24);
> -               writel(0x0000a980, reg + 0x28);
> +               struct regmap *regmap;
> +
> +               regmap =3D devm_regmap_init_mmio(&pdev->dev, reg,
> +                                              &sun8i_de2_ccu_regmap_conf=
ig);
> +               if (IS_ERR(regmap)) {
> +                       ret =3D PTR_ERR(regmap);
> +                       goto err_assert_reset;
> +               }
> +
> +               ret =3D of_syscon_register_regmap(pdev->dev.of_node, regm=
ap);

dev_of_node(&pdev->dev) instead of directly accessing the member.
IIRC this is the new preferred style.


Thanks
ChenYu

> +               if (ret)
> +                       goto err_assert_reset;
>         }
>
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
> --
> 2.51.2
>
>
