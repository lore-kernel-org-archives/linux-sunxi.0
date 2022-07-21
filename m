Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67A29AD
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 14:37:12 +0000 (UTC)
Received: from mail-ot1-f42.google.com ([209.85.210.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQuPJ-1ntrNy3g7L-00O0y9 for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul
 2022 16:37:02 +0200
Received: by mail-ot1-f42.google.com with SMTP id z12-20020a056830128c00b0061c8168d3faso1268000otp.7
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 07:37:01 -0700 (PDT)
X-Gm-Message-State: AJIora80dTWxh3pnmBHvEqfkNuFe8ZacbdSbwETSSsNIL/m6b4CD0dGO
	ucd0lidbF282tEDLPmKPCLM2YNJEDGEdKbeR18s=
X-Google-Smtp-Source: AGRyM1sipmxaJDGQ/BXJ6IogC7daDCl2+j4F9uhSVcXz89KYHnAMaLqcK10XehN8TJ/WBsHB+lO9Dw0DiPklmfIK8Mk=
X-Received: by 2002:a81:493:0:b0:31e:6ab9:99a5 with SMTP id
 141-20020a810493000000b0031e6ab999a5mr8799929ywe.209.1658414210293; Thu, 21
 Jul 2022 07:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220721141325.2413920-1-arnd@kernel.org> <20220721141325.2413920-2-arnd@kernel.org>
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Jul 2022 16:36:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2X7unsa2N5ynkUdk6H1=GZiWTyKBiLrDjQirAc9nfKhg@mail.gmail.com>
Message-ID: <CAK8P3a2X7unsa2N5ynkUdk6H1=GZiWTyKBiLrDjQirAc9nfKhg@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
To: Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Alexander Shiyan <shc_work@mail.ru>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	"moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, 
	linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fhgtZ6N9h7gyFk1DCFM9LzVC8g8RLI6DdaPHkg1zEXnGkgPgSpz
 dOsuKLuCvlvFMpd5VBPW5LJ5FVuxUyb5+ohVi7rrj0WocQd9Upetu68i+tCWKWdAf4CUeRT
 Z2ZLoOMQxSzWKHxuycTQO3NKobVkuwewynD8xSf8cxX5O/FLOpKpqcCbVi1L/er+OC4wpaB
 WRND792srMNiUvTE/x8fg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:V1jvfIBzb0s=:e6IQ+CwgwHmdpHd45xrNJ2
 hyV+f6SsJaoqLdPfrku2e7+wgD6NdKyq+LWJMerDzHG/PPRjCqtrAyMly/VLlMVYBJb/RHHxN
 dgaj+0ofgeij7vditszQITNlSPz6Z2kh1ELGXhwCXSaAwRwPLsRXv3LKPm0LcfBykWacrCl+5
 UuQUm/fNyotqrV3YbK0hai5K5DUCP/lqXjARvd9Z0FkQujnM6xX6d6bbjl6y6ALPbfzj9JTxl
 7YdDR6u694NLPBeENo0G0JWTQDYzACyqQ9tgB7AfNSli56d53N7mzmnTYpI9A+4LhnP/ZvVW0
 QFg9VuwdzqrfdewclMWqdbiehzn8EhgL/ohaSXV0BfrqH/XB05mcATo3u+Mlx+sQTJUr0U3et
 SyXMnVWc1faQkjzTf2hXg08tpWHAQ0UqVopdFIFJP/O9/xkn8W7KZG8UTWiIT19Ku8fnS+gVs
 0ZLQTB7szNqjM5dvmZHZcSeaHlDEc9eXEKCmOD3/LIXNCj1QBtfuLMB4iaSiBFFG3RiI6jMpD
 NXdHO+vAh6adZ08CuQA1qO8FFdq0bwmZlKsd2mGGb9eZJcptM0nd1bl+DuwPbwrmpFE/tXqrK
 fJBH8V2dpkOUBH9pvC9G2jesQbM+aJ6oqZ/dSLcChV/6Ys5npQwtBkIaLDSmcJt/yqgKwF3xh
 r07gLfoWlXgzV9jZQKC6Cdk1V+3uqEOFSJZxQMuAzwLDzNfdkRME17Ld6m04KXI+avRQopZfa
 HIqPkkqpGJB69wZlO7CPC1KYvoRSqbO2488+u0/dYmTANjIeuRnbeWFQku3PKu9Jb6FrO9JY2
 sfQc14Jp6eZ1ZjebCShbKT9Pff7SmRcRmS1Y2EqrImd6pZgAUt9H2xVA2+JLLHDSo8xtGFKHN
 sJBwPhMxxfWVMR2AZ3gA==

On Thu, Jul 21, 2022 at 4:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A lot of Kconfig options have changed over the years, and we tend
> to not do a blind 'make defconfig' to refresh the files, to ensure
> we catch options that should not have gone away.
>
> I used some a bit of scripting to only rework the bits where an
> option moved around in any of the defconfig files, without also
> dropping any of the other lines, to make it clearer which options
> we no longer have.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Apparently this patch got a little large and was rejected by some of
the mailing lists, in case someone wonders what happened.
Fortunately the contents  don't actually matter here, as I'm just
reordering the lines as seen in the diffstat.

        Arnd

> ---
>  arch/arm/configs/am200epdkit_defconfig    |  26 ++---
>  arch/arm/configs/aspeed_g4_defconfig      |  16 +--
>  arch/arm/configs/aspeed_g5_defconfig      |  16 +--
>  arch/arm/configs/assabet_defconfig        |   8 +-
>  arch/arm/configs/at91_dt_defconfig        |  10 +-
>  arch/arm/configs/axm55xx_defconfig        |  22 ++--
>  arch/arm/configs/badge4_defconfig         |   8 +-
>  arch/arm/configs/bcm2835_defconfig        |  36 +++----
>  arch/arm/configs/cerfcube_defconfig       |  16 +--
>  arch/arm/configs/clps711x_defconfig       |   2 +-
>  arch/arm/configs/cm_x300_defconfig        |  26 ++---
>  arch/arm/configs/cns3420vb_defconfig      |  18 ++--
>  arch/arm/configs/colibri_pxa270_defconfig |  32 +++---
>  arch/arm/configs/colibri_pxa300_defconfig |  10 +-
>  arch/arm/configs/collie_defconfig         |  20 ++--
>  arch/arm/configs/corgi_defconfig          |  44 ++++----
>  arch/arm/configs/davinci_all_defconfig    |  26 ++---
>  arch/arm/configs/dove_defconfig           |  28 ++---
>  arch/arm/configs/ep93xx_defconfig         |  16 +--
>  arch/arm/configs/eseries_pxa_defconfig    |  26 ++---
>  arch/arm/configs/exynos_defconfig         |  20 ++--
>  arch/arm/configs/ezx_defconfig            |  72 ++++++-------
>  arch/arm/configs/footbridge_defconfig     |  14 +--
>  arch/arm/configs/h3600_defconfig          |  10 +-
>  arch/arm/configs/h5000_defconfig          |  18 ++--
>  arch/arm/configs/hackkit_defconfig        |   4 +-
>  arch/arm/configs/hisi_defconfig           |  24 ++---
>  arch/arm/configs/imx_v4_v5_defconfig      |   8 +-
>  arch/arm/configs/imx_v6_v7_defconfig      |   8 +-
>  arch/arm/configs/integrator_defconfig     |   2 +-
>  arch/arm/configs/iop32x_defconfig         |  20 ++--
>  arch/arm/configs/jornada720_defconfig     |  10 +-
>  arch/arm/configs/keystone_defconfig       |  62 +++++------
>  arch/arm/configs/lart_defconfig           |   6 +-
>  arch/arm/configs/lpc18xx_defconfig        |  12 +--
>  arch/arm/configs/lpc32xx_defconfig        |   8 +-
>  arch/arm/configs/lpd270_defconfig         |   6 +-
>  arch/arm/configs/lubbock_defconfig        |  10 +-
>  arch/arm/configs/magician_defconfig       |  30 +++---
>  arch/arm/configs/mainstone_defconfig      |   4 +-
>  arch/arm/configs/milbeaut_m10v_defconfig  |   6 +-
>  arch/arm/configs/mini2440_defconfig       |   6 +-
>  arch/arm/configs/mmp2_defconfig           |  28 ++---
>  arch/arm/configs/moxart_defconfig         |  18 ++--
>  arch/arm/configs/mps2_defconfig           |  14 +--
>  arch/arm/configs/multi_v4t_defconfig      |   4 +-
>  arch/arm/configs/multi_v5_defconfig       |  12 +--
>  arch/arm/configs/multi_v7_defconfig       |  62 +++++------
>  arch/arm/configs/mv78xx0_defconfig        |  32 +++---
>  arch/arm/configs/mvebu_v5_defconfig       |  28 ++---
>  arch/arm/configs/mvebu_v7_defconfig       |   2 +-
>  arch/arm/configs/mxs_defconfig            |   4 +-
>  arch/arm/configs/neponset_defconfig       |  24 ++---
>  arch/arm/configs/netwinder_defconfig      |  10 +-
>  arch/arm/configs/nhk8815_defconfig        |   6 +-
>  arch/arm/configs/omap1_defconfig          |  74 ++++++-------
>  arch/arm/configs/omap2plus_defconfig      |  16 +--
