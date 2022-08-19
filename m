Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B93C17EE
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Aug 2022 09:17:57 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id l7so3641194vsc.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Aug 2022 02:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=p1fTT14mThGLEnUJzebZNUEmZIwatmKiQNsPLBHI5iY=;
        b=01QL6Ru06UZdT55kpKDVwXAeZuOa5RBrCn869CXi/jJzzkn1bE1MKfB4J4lvtdXvTa
         gFjdYsL1COvJJ581a+fFYrXJL2JEWPnuyMLjXIHM1uscXO7nye86eFmaTpPN4NawFTXL
         /mdQqFmT0BA6PhZALSO0wEdB5okm/1lL+n28j4e8Bl9O7yIipgsnCXhDxXHgNzZtIp/g
         98btcGCXp61gyUgxWRmL1ON1R3bbc6r5rmPIOqN+X+6mw9oqzpksLfec7ZTksc/nviQH
         NyFBWTZbO7NjMOVHiYG1FkRBFGPxk2MXGMk9JeeciuCu4P/+cPRT14TseDXEgIKSO03/
         Perw==
X-Gm-Message-State: ACgBeo0do/KQb2FLz+vKWz4EEEeQyNNNHhgAeL1I8Q6+gYXQJP8Bq/NX
	KlzhmXOPnpgHpIX8yEO0oow68X5KJDY6X0Em
X-Google-Smtp-Source: AA6agR4YiLLdOBuVryzyuKE4KZTtHmIDYXNcbJD3BDwjQjXGumAZEC5tTUra7YoQY+Y0bXwE3fzYrQ==
X-Received: by 2002:a05:6102:5591:b0:38a:9691:933f with SMTP id dc17-20020a056102559100b0038a9691933fmr2442526vsb.54.1660900675850;
        Fri, 19 Aug 2022 02:17:55 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id z20-20020ab06294000000b00384ca77a9e8sm2133940uao.27.2022.08.19.02.17.55
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:17:55 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id e3so1570087uax.4
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Aug 2022 02:17:55 -0700 (PDT)
X-Received: by 2002:a25:cbcf:0:b0:695:2d3b:366 with SMTP id
 b198-20020a25cbcf000000b006952d3b0366mr1673997ybg.365.1660900664907; Fri, 19
 Aug 2022 02:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220818135522.3143514-1-arnd@kernel.org> <20220818135522.3143514-2-arnd@kernel.org>
In-Reply-To: <20220818135522.3143514-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 11:17:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEXQNeOQGnYTQG58nHwB8YwLQ5q1vaje7kPQexrAMsRA@mail.gmail.com>
Message-ID: <CAMuHMdXEXQNeOQGnYTQG58nHwB8YwLQ5q1vaje7kPQexrAMsRA@mail.gmail.com>
Subject: Re: [PATCH 01/11] ARM: defconfig: reorder defconfig files
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bin Liu <b-liu@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Richard Cochran <richardcochran@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Shannon Nelson <snelson@pensando.io>, Peter Chen <peter.chen@nxp.com>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Felipe Balbi <balbi@ti.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra <linux-tegra@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, Aug 18, 2022 at 3:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The debug-info and can subystem options have moved around in the
> 'savedefconfig' output, so fix these up to reduce the clutter
> from the savedefconfig command.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -33,7 +33,6 @@ CONFIG_INET=y
>  CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_CAN=y
> -CONFIG_CAN_RCAR=y
>  CONFIG_PCI=y
>  CONFIG_PCI_MSI=y
>  CONFIG_PCI_RCAR_GEN2=y
> @@ -57,6 +56,7 @@ CONFIG_RAVB=y
>  CONFIG_SMSC911X=y
>  CONFIG_MICREL_PHY=y
>  CONFIG_SMSC_PHY=y
> +CONFIG_CAN_RCAR=y
>  CONFIG_INPUT_EVDEV=y
>  CONFIG_KEYBOARD_GPIO=y
>  # CONFIG_INPUT_MOUSE is not set

This may cause conflicts with the usual refresh I plan to do for
v6.0-rc1, which will be very similar to
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=517d634d376042ab797d9feeb94236ad4cb03396
So it may be better to drop this part.

However, that decision is up to you, as you will have to handle the
conflict when merging renesas-arm-defconfig-for-v6.0-tag1 later ;-)
But sfr might complain before...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
