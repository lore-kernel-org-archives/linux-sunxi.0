Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A1D2019C
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 22:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BDAC433C7
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692743491;
	bh=c+z7Y44NmFLsYnIuor2AQkl3u9PUP11lx1AoXxt7Aw0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nS7aLPz6XlfCfDidZdEnCtvI4nk3gcO/5OpKzg5muURwot9sVMGoPMJUWOQd0T24Z
	 84JE7PTqbNKUXryr3fjjR4JRK6m8cHWmNi14o+EX+ZA3YttQLosTcTsEw8AR0Spc1m
	 uRSXN4Z7Lw1GPvwT/dvMc1UsX9MGYu1v12BoSShD7ht0x6+ir8JA4SrFW2/X213D55
	 qix4skVmgE8T3UBmzqiBQ8sYKpUjTdm7RKfcs0CiiXnmsCIyGzQ1goz+7Frseydur/
	 NNqhKzuT41T0ZCFBw7qAiP7H1SAsltJXGF4bKDZ9V11R6hCjhU0dUMp+gH+cmKosDN
	 GrlhOhdwuOI/A==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bcb89b476bso47294551fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 15:31:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywu7Hn3sBR4+6zdEpv5xDTY9rsAjy3yyrcn7Y6uqq7mq3xhMw1b
	RKvc0dBw29FLbvYNe8PrCdbpZEc6lnlCt4pV4A==
X-Google-Smtp-Source: AGHT+IFe521jhURKdbA7Y+o7DBBih8popF4ErXWCXScc9IMyiU+HU6o3tc/tpyLacfb62wdw0QFMTW5RLTmaYXsFchM=
X-Received: by 2002:a2e:380a:0:b0:2b6:d13a:8e34 with SMTP id
 f10-20020a2e380a000000b002b6d13a8e34mr7897705lja.46.1692743469060; Tue, 22
 Aug 2023 15:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org> <5696647.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <5696647.DvuYhMxLoT@jernej-laptop>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Aug 2023 17:30:55 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Ssha5KdBdJ+7c3cxuy+VqWRUjSa=YM78gKi5mZAwvgQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Ssha5KdBdJ+7c3cxuy+VqWRUjSa=YM78gKi5mZAwvgQ@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] soc: sunxi: Explicitly include correct DT includes
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, 
	Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Has him <shiraz.linux.kernel@gmail.com>, 
	Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
	Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 6, 2023 at 6:42=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec@=
gmail.com> wrote:
>
> Dne petek, 04. avgust 2023 ob 00:43:01 CEST je Rob Herring napisal(a):
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Applied to sunxi tree, thanks!

Did you really? Doesn't look like this is in linux-next.

Rob
