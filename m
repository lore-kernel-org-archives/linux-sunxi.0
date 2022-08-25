Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDEA4C74
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 21:32:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d16so20862590wrr.3
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 14:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=EqzBE2zZDGLUoXZ6/uzFpkdW0uwLXRH/ZxpTVcEz4RY=;
        b=qRHXiAAEFxUcduAYJZefohZKXO+X74fsUPVcUnRRNf+vtvMwz8JzmfaFa/1seliOel
         N5+yl3sLaJJlffdQq01u8PTRL9UQxM/PoiC7ftzfbX51Aq8ANtKnXVyaXgD923wBKQqx
         rBg83MrdCs3pKmg8CGmdCWsr4aZh99glKYt7zXjnFcbfRHvzafycELQgPgmSYOf7BN47
         3MaiDabh9OZ1Utit2EFvQvYo7b9K4nHYjvp9OZyLoiy4FQG3LnBO8IAQNX5J9l2cb7T5
         rtgQnl9eXZzPWaaixqRuGQhKVWXU5V00NS72L6T+gCoNDqeMumddMdJCTb3+B406bi49
         Wkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=EqzBE2zZDGLUoXZ6/uzFpkdW0uwLXRH/ZxpTVcEz4RY=;
        b=t3p47wTjCuKoR5Hx16dciADNHjya+XVd0uGrSpeHEvaezmAHPJcKD45qyrJaII44GO
         KhDotCfjqmC0h0uVpMd8MNuMS+NBl00ne2N7uc9Rls/DJ3e8XeNHfpAePbs+1POo53m8
         R5eqUsUbP/3oJnhTXd8K+pQVHR5Ttq9tfWI1/YGLURq5zNaLGg/JNtV9k4kJBOjCKo/I
         yPqNucnllLYUF0U/I7Dfp1jXddN749oBoxRbCAIkWArftlkE1f/xU2C3oHRP6fppGWgt
         N8Q3qf6J7RrTGHF7QJ4n/MfgaT7BV6CB8LPLe5W1iN7lGDNpeBoRsUSa+ktbOrnePCUm
         Dc+Q==
X-Gm-Message-State: ACgBeo2KC4v5fptp/VJEIHueMG/DcJbLlGxT/3xHdL8ModDLzhUKsVG4
	Fy/H+i8Y/qTN6GdR5T4cSNo=
X-Google-Smtp-Source: AA6agR4t8yoF99sRe2L0fBzRS1+im+UO4VTke2Bd+B09oSf0uCYPQMeZRw3swuBH9PBDTRwnH39EJA==
X-Received: by 2002:a05:6000:701:b0:225:3f77:9793 with SMTP id bs1-20020a056000070100b002253f779793mr3124854wrb.202.1661463169088;
        Thu, 25 Aug 2022 14:32:49 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c3b8300b003a319b67f64sm14167595wms.0.2022.08.25.14.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:32:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Qin Jian <qinjian@cqplus1.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Bin Liu <b-liu@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Richard Cochran <richardcochran@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Shannon Nelson <snelson@pensando.io>, Peter Chen <peter.chen@nxp.com>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 01/11] ARM: defconfig: reorder defconfig files
Date: Thu, 25 Aug 2022 23:32:46 +0200
Message-ID: <4207673.ejJDZkT8p0@kista>
In-Reply-To: <20220818135522.3143514-2-arnd@kernel.org>
References: <20220818135522.3143514-1-arnd@kernel.org> <20220818135522.3143514-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 18. avgust 2022 ob 15:55:22 CEST je Arnd Bergmann napisal=
(a):
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The debug-info and can subystem options have moved around in the
> 'savedefconfig' output, so fix these up to reduce the clutter
> from the savedefconfig command.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/at91_dt_defconfig   |  2 +-
>  arch/arm/configs/dove_defconfig      |  2 +-
>  arch/arm/configs/exynos_defconfig    |  2 +-
>  arch/arm/configs/imx_v6_v7_defconfig |  2 +-
>  arch/arm/configs/keystone_defconfig  |  6 +++---
>  arch/arm/configs/lpc18xx_defconfig   |  2 +-
>  arch/arm/configs/mmp2_defconfig      |  2 +-
>  arch/arm/configs/mps2_defconfig      |  2 +-
>  arch/arm/configs/multi_v5_defconfig  |  2 +-
>  arch/arm/configs/multi_v7_defconfig  | 12 ++++++------
>  arch/arm/configs/mvebu_v5_defconfig  |  2 +-
>  arch/arm/configs/mxs_defconfig       |  4 ++--
>  arch/arm/configs/omap1_defconfig     |  2 +-
>  arch/arm/configs/omap2plus_defconfig |  4 ++--
>  arch/arm/configs/orion5x_defconfig   |  2 +-
>  arch/arm/configs/pxa168_defconfig    |  2 +-
>  arch/arm/configs/pxa910_defconfig    |  2 +-
>  arch/arm/configs/pxa_defconfig       |  2 +-
>  arch/arm/configs/s3c6400_defconfig   |  2 +-
>  arch/arm/configs/s5pv210_defconfig   |  2 +-
>  arch/arm/configs/sama5_defconfig     |  6 +++---
>  arch/arm/configs/sama7_defconfig     |  4 ++--
>  arch/arm/configs/shmobile_defconfig  |  2 +-
>  arch/arm/configs/socfpga_defconfig   |  6 +++---
>  arch/arm/configs/sp7021_defconfig    |  2 +-
>  arch/arm/configs/spear13xx_defconfig |  2 +-
>  arch/arm/configs/spear3xx_defconfig  |  2 +-
>  arch/arm/configs/spear6xx_defconfig  |  2 +-
>  arch/arm/configs/stm32_defconfig     |  2 +-
>  arch/arm/configs/sunxi_defconfig     |  2 +-

=46or sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



