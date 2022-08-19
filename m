Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3217FC
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Aug 2022 10:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECB1C43144
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Aug 2022 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660904267;
	bh=bBGGs+VaVwa9GZVrl+mfip/PNxqOhyRiV5mtJK9gULA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LSwaVI8rUzMmO/Ct43XNW9RruD+qxBI8tnG2OoF/s63ywpKDgUlWIi/aLX949UKPN
	 jM20X3grcEAWH38fx5/oYHEV7F5sTeuvwCDPVnMMG53ff2UByclp++LklueQkXypFU
	 H7c9/JJp/RjyIB8BwC52gvvAYZIk2WNxpCZz5cJXuJNC06FJis2sLmU6k3EGL09lKc
	 Jb0xsF7kl1AKAIK0xmR/ofWHEdPxStI2V1NvsgZa+z5y1Ow/2cxRWkgNKh/52pgoWK
	 DCt8ZOZFDA7eTYb7MHgMkmQVIDOYTuxR00NmLv1qFt7npxJhkX1i5DzsxxCLPXCGpY
	 yOQjDCPKxSuDQ==
Received: by mail-wr1-f49.google.com with SMTP id k16so4619323wrx.11
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Aug 2022 03:17:47 -0700 (PDT)
X-Gm-Message-State: ACgBeo35b26SEPJ0ukbS8hKGyr9AE/G5VL+rmfFiRVAa88coFgm+6k7C
	RKnUSYZqDqoo9f3Sjrb5CXZdPdU1NkFq0a/uIlI=
X-Google-Smtp-Source: AA6agR5J9QREsVSQar6+cAcI+eQkL21ldizqJ/P5eBUIHXbbNTd/IG0qShM+KxoLNU3uFpfrKuXX255VS5DFZKFqEjU=
X-Received: by 2002:a05:6402:2751:b0:443:d90a:43d4 with SMTP id
 z17-20020a056402275100b00443d90a43d4mr5657123edd.368.1660904254658; Fri, 19
 Aug 2022 03:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220818135522.3143514-1-arnd@kernel.org> <20220818135522.3143514-2-arnd@kernel.org>
 <CAMuHMdXEXQNeOQGnYTQG58nHwB8YwLQ5q1vaje7kPQexrAMsRA@mail.gmail.com>
In-Reply-To: <CAMuHMdXEXQNeOQGnYTQG58nHwB8YwLQ5q1vaje7kPQexrAMsRA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 19 Aug 2022 12:17:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kJVLEFqS0E=Lv2=HE9dbmjgA=_T2NX4zhq7EHvk4DBg@mail.gmail.com>
Message-ID: <CAK8P3a0kJVLEFqS0E=Lv2=HE9dbmjgA=_T2NX4zhq7EHvk4DBg@mail.gmail.com>
Subject: Re: [PATCH 01/11] ARM: defconfig: reorder defconfig files
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Fri, Aug 19, 2022 at 11:17 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> This may cause conflicts with the usual refresh I plan to do for
> v6.0-rc1, which will be very similar to
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=517d634d376042ab797d9feeb94236ad4cb03396
> So it may be better to drop this part.
>
> However, that decision is up to you, as you will have to handle the
> conflict when merging renesas-arm-defconfig-for-v6.0-tag1 later ;-)
> But sfr might complain before...

I'm not too worried here, if you just do the 'savedefconfig' step, you
should get
the same change and the mergetool will figure it out. In case there is a nasty
context conflict, you could just send that part early so I can resolve it.

       Arnd
