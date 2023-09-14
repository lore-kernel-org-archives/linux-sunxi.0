Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C828E32
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Sep 2023 15:07:44 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9ad8bba8125so151133266b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Sep 2023 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694704063; x=1695308863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP69ASklQ06fWDPpKcoFyGEzOk0jQ6Af8rMe5+oydWg=;
        b=CAyQKoFUHAbSxdk18wEOMV7M+G7yPNkdC3Sr1Ue8uO3/pG11sH9iREE0NNiVy4X647
         R/YpdJGg8Y5eypPAd+71ifIECkctcbg072L5BpQt3BzDMGYQ/jLh4njG1g9cY+qIUTmJ
         m0/MSFaLit84SH8I2tP0BXSTIw9XmWigC66bFaTqJJoIzDYbWUKF+2XlFuV2nVGyp5ga
         LOEPxTPb5LatGVE59Kq2oaCdiau3iNRXVWT91rWVgvyK0bYfeXnvN5yUJli7Zb64cnfL
         5RZvYTOe45MIM1hBXhodcFRWAUlwJ2Q/AHij/L204b/IuIHJkU2almU/8wBxR0grHLjY
         ySFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694704063; x=1695308863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zP69ASklQ06fWDPpKcoFyGEzOk0jQ6Af8rMe5+oydWg=;
        b=HYofG5R/ktsLHLKO+o5srzZPmJ8VLPq18Qlgj02vL/uVinBtdyV7l1KgA4ax4ua5NQ
         c5kfLNoAcAAf1Nw2eVsrdvRbMXBHdLZovIF+x8N/0iUUwL76OOPktzYgbKB7nu+Q3Ttz
         EpvB6ME1tv56ZmJik956/H5MwZwT/6zPMPwGghuECyijyukr8d2t/tcb21zpxsnenyYi
         4reTHTwwy1cCWYueVG2JfHLx2wetQkt7llNhv79VwOm9TyTdw1l7xS/KggmDO3oGk0g9
         HrEA5QQVGZWadg6BJPrFp0AzJjI4tHNFEOk+ULJUTnFjZbXeisGQ8ecZp/espQR5Wl9Q
         p6Mw==
X-Gm-Message-State: AOJu0Yx2SqrO4BshuIHhdpPCxw/4eLBlllaXXH99KTs0lwSjTnkM5jlb
	pMUceoPxcpf3DX9jtQKneeY=
X-Google-Smtp-Source: AGHT+IG8KP3B9bjG4pI05wOHvPQCGugo4l8D48ar7CYi3L5ylg3/8JmO5GnaECy6z/Cpdjkqmo6/yw==
X-Received: by 2002:a17:906:2102:b0:99d:ed5e:cc79 with SMTP id 2-20020a170906210200b0099ded5ecc79mr4916268ejt.31.1694704062506;
        Thu, 14 Sep 2023 08:07:42 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id i13-20020a170906114d00b00992afee724bsm1117405eja.76.2023.09.14.08.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 08:07:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 14/17] pmdomain: sunxi: Move Kconfig option to the pmdomain
 subsystem
Date: Thu, 14 Sep 2023 17:07:39 +0200
Message-ID: <2696832.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230914111912.586764-1-ulf.hansson@linaro.org>
References: <20230914111912.586764-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 14. september 2023 ob 13:19:12 CEST je Ulf Hansson napisa=
l(a):
> The Kconfig option belongs closer to the corresponding implementation,
> hence let's move it from the soc subsystem to the pmdomain subsystem.
>=20
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: <linux-sunxi@lists.linux.dev>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/pmdomain/Kconfig       |  1 +
>  drivers/pmdomain/sunxi/Kconfig | 10 ++++++++++
>  drivers/soc/sunxi/Kconfig      |  9 ---------
>  3 files changed, 11 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/pmdomain/sunxi/Kconfig
>=20
> diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> index 67049ebf7265..39f358f27f2e 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -13,5 +13,6 @@ source "drivers/pmdomain/rockchip/Kconfig"
>  source "drivers/pmdomain/samsung/Kconfig"
>  source "drivers/pmdomain/st/Kconfig"
>  source "drivers/pmdomain/starfive/Kconfig"
> +source "drivers/pmdomain/sunxi/Kconfig"
>=20
>  endmenu
> diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kcon=
fig
> new file mode 100644
> index 000000000000..17781bf8d86d
> --- /dev/null
> +++ b/drivers/pmdomain/sunxi/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SUN20I_PPU
> +	bool "Allwinner D1 PPU power domain driver"
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on PM
> +	select PM_GENERIC_DOMAINS
> +	help
> +	  Say y to enable the PPU power domain driver. This saves power
> +	  when certain peripherals, such as the video engine, are idle.
> diff --git a/drivers/soc/sunxi/Kconfig b/drivers/soc/sunxi/Kconfig
> index c5070914fc6a..8aecbc9b1976 100644
> --- a/drivers/soc/sunxi/Kconfig
> +++ b/drivers/soc/sunxi/Kconfig
> @@ -19,12 +19,3 @@ config SUNXI_SRAM
>  	  Say y here to enable the SRAM controller support. This
>  	  device is responsible on mapping the SRAM in the sunXi SoCs
>  	  whether to the CPU/DMA, or to the devices.
> -
> -config SUN20I_PPU
> -	bool "Allwinner D1 PPU power domain driver"
> -	depends on ARCH_SUNXI || COMPILE_TEST
> -	depends on PM
> -	select PM_GENERIC_DOMAINS
> -	help
> -	  Say y to enable the PPU power domain driver. This saves power
> -	  when certain peripherals, such as the video engine, are idle.




