Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF14F2C9E
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022 09:49:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MoNMu-1pChib3m4O-00oncJ for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022
 11:49:05 +0200
Received: by mail-wr1-f54.google.com with SMTP id v16so6722076wrm.8
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022 02:49:05 -0700 (PDT)
X-Gm-Message-State: ACgBeo3y4VG+kpEN/IeJ4Ix52xDT44WIjaLnSaUsArJDNVcRAapgICp1
	bA1JCsifDLiIuJ/nJAC9Xoa47mGNV1bx8xmHFTs=
X-Google-Smtp-Source: AA6agR4dO9Qog99EOhFMYD2/TUvDUFPeLAFKpCKJySAtY2CWxJsmH8fvbDozC2seipJY5siIbg1N/2rhc6q5GDAswIQ=
X-Received: by 2002:a17:907:d0b:b0:741:7ca6:a2b with SMTP id
 gn11-20020a1709070d0b00b007417ca60a2bmr3580848ejc.654.1661763177783; Mon, 29
 Aug 2022 01:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220818135522.3143514-1-arnd@kernel.org>
In-Reply-To: <20220818135522.3143514-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Aug 2022 10:52:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1tsby7+xfKTQaaBQZ4t-=uWG5Dtbcn_jPEsSMG_YVHgA@mail.gmail.com>
Message-ID: <CAK8P3a1tsby7+xfKTQaaBQZ4t-=uWG5Dtbcn_jPEsSMG_YVHgA@mail.gmail.com>
Subject: Re: [PATCH 00/11] ARM: defconfig cleanup
To: linux-arm-kernel@lists.infradead.org
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
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bin Liu <b-liu@ti.com>, 
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
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dyTOD4yOAVwhoIGfjAmhfyxTEQ9twJ+TRoL+68J/nyRb3CYyjm4
 Eka2JFbB8XucKkHzHqL7T6URfs0bpsmyQ5UJkG9HgRRY4Jv5OGjp1iiDaYu2OoF4aLGfEjc
 ldLzdHFlJA5gJGBDeAf0CPZmkkjxzZF61UlAu1OtvR118VJUEbdoToN5HA1zVitWrdhZyrb
 01bX5o9lUgmNKUq1ptw1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1IURfECksAs=:IiVVoja6RBTKThEhK8RJuE
 antQQaQAEKaiNmi5H7XBzLuD0l8Vsvs3VpwEmCVtweqbG38VwXLQR4ViHv+AWzd//Ur6I2imk
 R17I/HvBsUdgzH+rvkwtV92gK9RSfTy6avQCJaaBRx5PudOEd/H0gwQ1PKIW64uC03CorfYcM
 xazkjJY5OkKv6wtzvphvFj7STxjM7ZjhCgmmbJxgLArUfQtmOx7if9jObSJwgo0LM4cn1KDzZ
 IVMdQQi6ymCwry/CVtqG8qRfNHmXS0oczM1bH/n+UYjJhfDUMD+L4A3QKf2b6YLTuuUGYCS7k
 0n4tOAOMyGdDNycitKbQnujovVEji0SMf9nXtHojujKihpPAwg3urVr507COjP5QDSvFNF3wH
 o9aFmJmq+XGBgGAjKtq+77ezcotqYB/iM8u6Mdlev5mK+wX/CzRxTa/8ynb/HBVrp/DdTL/nu
 PiuUegPS90OQqQfYMXeGli7YYY+tEaBuk3xBgrbs3MHNvIqQ+YwIixgRhWRx5yybQLVxpvIK3
 yENp3XtUvelizq7OwcBP3aUa8dP4USwGsWiiJFmGxZ0UfVzPKl2KMcSRRv8GMTCcuGAfIe3Em
 OlaSdmuebau2imc/4f1kLFvrBCTeablQ3kn7lOp0H8/4VWvUralbKPi058HNg4p1wZqCOkIMi
 JqAyXjSPCkuFzXF4pwmrH0J2QXVhZPHYZuuZyzxugfUBlW1lNvt08DldbmIlmNWsuq5ySrSaZ
 tvR80RJU+WHBPIz6gQI99B11mkSHY12nNZgthk8bkpoCPpE3v0TLGEquOd7BwrwbmeNyCk9wn
 VrIiO/TomD6sfwxe70g525NVpF/TOP0hngsi+VOkRx+kKWMvFNxZffYouvrzDJxw7dlGx1g/2
 A0zCqNo14+d6jDAdi8iQ==

On Thu, Aug 18, 2022 at 3:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I have continued the cleanup of the multi_*_defconfig files, and
> reordered the other files according to the 'make savedefconfig'
> output as before.
>
> I would like to queue these up for 6.1, though the last two
> should probably be considered bugfixes and merged for 6.0.
>
> Since a third of the defconfig files are for machines that
> are now marked as unused, I skipped those files. There are still
> a few things that get removed by 'make savedefconfig' as they
> now get selected by some driver:
>
> -CONFIG_SERIAL_BCM63XX=y
> -CONFIG_SND_AUDIO_GRAPH_CARD=m
> -CONFIG_NEW_LEDS=y
> -CONFIG_LEDS_TRIGGERS=y
> -CONFIG_TEGRA20_APB_DMA=y
>
> I think for those we should follow up with patches to remove the
> 'select' statements.

I dropped the last patch that Greg has already picked up, and merged the
rest into the arm/defconfig branch of the soc tree.

Thanks for the Acks.

        Arnd
