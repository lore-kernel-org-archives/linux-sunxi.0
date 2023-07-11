Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA217FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 18:21:52 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so63002945e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099711; x=1691691711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGWHx9YJ+sHVNTsptq70WfauAMDUdyhwhtAtAzyLwys=;
        b=prNF0Bq4jlrRmDZIFceo67OVeHpV7LyMJF62uFY4evVYGhKXZ2KX7vOp1GYtUqEJqQ
         1YkCBn4nq7Rg0+FXaukk9empTRsaqwHd7B2sfWgLgnRTx4Mg/poRPgQtnUpNRMiTfNaI
         labMKzslQ2IyO/Ku2bj48xvMm/9cmg/J1cMbMau66Zwffgfaeg3vIcZ6cVv4zIT1cPwN
         tIr8PyoYZt0PT81072nSpa3+XuAyLgO11ic0zgo0r2pbsDbb3I6uGlEDJroFNg/exYb0
         yppraMnyaP2moBsaIJL5NPqh1JFbFBrJT74gopugLkeBhFhEoP37awDrn9KjJXlrOKlH
         4msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099711; x=1691691711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGWHx9YJ+sHVNTsptq70WfauAMDUdyhwhtAtAzyLwys=;
        b=SiyQldar3uVpUkBqiWUtBXik9tyTrM8/8KfV7C8oo5qccJpH40N4x7F62m4U9YpB+5
         M+TNTad3XIdPcMhueMGL5LNm3e7+v8FiLeZ2W9hFwdXJ2gMP2XupKftUFDF6L9+PIbiP
         Xhm6QzLElEg1CVrph5c4+VEKnJUSHEwrCBKce3SWxHxZOvp2csP/sbFUYFPEjFwox63V
         QgdDaqUiATkuFU5KccaJs+0wFaf0ajXCRCD8iiNhtumS6rw8N5OdCmB7REOMGeAKKNsO
         eooZd0hFPDLEPc1IFq/oLZcD1ro+QuzgGseFK7OW9wSm0kYkZTKOHlSABGY1SsBLgp1v
         G7+A==
X-Gm-Message-State: ABy/qLZCKP1ezumx3e8GrNMP3viXemCen8WiTgo1RsDiflxcVAtyMKwX
	rOGaIN7CC679rDXBbTSOUns=
X-Google-Smtp-Source: APBJJlEFb9G4bpiHa136SPi/MkE+zBko96esqUm3GHlYDJ7dCzh9UL1oaa67tntEVLsezYDMO5yv7A==
X-Received: by 2002:a7b:ce8a:0:b0:3fb:be07:5343 with SMTP id q10-20020a7bce8a000000b003fbbe075343mr14767059wmj.27.1689099711063;
        Tue, 11 Jul 2023 11:21:51 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c021800b003fbd597bccesm13649262wmi.41.2023.07.11.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:21:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 13/18] soc: sunxi: Move power-domain driver to the genpd dir
Date: Tue, 11 Jul 2023 20:21:48 +0200
Message-ID: <8241854.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20230711142204.751754-1-ulf.hansson@linaro.org>
References: <20230711142204.751754-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 11. julij 2023 ob 16:22:04 CEST je Ulf Hansson napisal(a):
> To simplify with maintenance let's move the sunxi power-domain driver to
> the new genpd directory. Going forward, patches are intended to be managed
> through a separate git tree, according to MAINTAINERS.
> 
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: <linux-sunxi@lists.linux.dev>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/genpd/Makefile                    | 1 +
>  drivers/genpd/sunxi/Makefile              | 2 ++
>  drivers/{soc => genpd}/sunxi/sun20i-ppu.c | 0
>  drivers/soc/sunxi/Makefile                | 1 -
>  4 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/genpd/sunxi/Makefile
>  rename drivers/{soc => genpd}/sunxi/sun20i-ppu.c (100%)
> 
> diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
> index baf2021235a7..76f2a411e6bc 100644
> --- a/drivers/genpd/Makefile
> +++ b/drivers/genpd/Makefile
> @@ -9,3 +9,4 @@ obj-y					+= 
renesas/
>  obj-y					+= rockchip/
>  obj-y					+= samsung/
>  obj-y					+= starfive/
> +obj-y					+= sunxi/
> diff --git a/drivers/genpd/sunxi/Makefile b/drivers/genpd/sunxi/Makefile
> new file mode 100644
> index 000000000000..ec1d7a2fb21d
> --- /dev/null
> +++ b/drivers/genpd/sunxi/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_SUN20I_PPU)		+= sun20i-ppu.o
> diff --git a/drivers/soc/sunxi/sun20i-ppu.c
> b/drivers/genpd/sunxi/sun20i-ppu.c similarity index 100%
> rename from drivers/soc/sunxi/sun20i-ppu.c
> rename to drivers/genpd/sunxi/sun20i-ppu.c
> diff --git a/drivers/soc/sunxi/Makefile b/drivers/soc/sunxi/Makefile
> index 90ff2ebe7655..549159571d4f 100644
> --- a/drivers/soc/sunxi/Makefile
> +++ b/drivers/soc/sunxi/Makefile
> @@ -1,4 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_SUNXI_MBUS) +=	sunxi_mbus.o
>  obj-$(CONFIG_SUNXI_SRAM) +=	sunxi_sram.o
> -obj-$(CONFIG_SUN20I_PPU) +=	sun20i-ppu.o




