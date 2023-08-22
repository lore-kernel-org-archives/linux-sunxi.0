Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6165E2019C
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 22:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2448C433CD
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 22:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692743786;
	bh=NjYZtuuDSprtGhXi35X3nTK9OBfVVh4gcwf3JptlP0g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CAh/v16TAyXS6VO2ALNXtF2z0iRgcCCKE7nkjOLQellZv0WJnN86cgMH5yfZM03mJ
	 Jx7K+pGTv+F3J4t4qdynaJ4n+9KzyQL/Kl4q//xGrAaann0vW+KcGY9xzp2weGiAEm
	 AM2toYc5L90AHzt2FPD4Mu0ypPk8pnXSL+CD0gBQDaMwYb/M9sBM4CHI+zjnuQj2ri
	 39GiQ6h30YJ4VP+pOIvNDAKT+qCvo3e7cRjfCnGmssz08Ht+w9j4URgHcKpYBGxip3
	 FWaX/yBtm5Mb9ACd7PY7MPuGJvuu+s2iDMLyik9tB/h7AKE//+xsiAOJyPubVbG9Rm
	 fAD8TLwq5Lm3A==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso77606171fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 15:36:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YwKVY6NCuBvTHntH0WIEI9N1p7DJbSyph2m9lTsBLustN4Ge/W5
	EiB3FXHGx2x+RSffsxETr7q37mX1vSDVdT2+AQ==
X-Google-Smtp-Source: AGHT+IE9Tj4RwFZn6igP8wgaaZ8RvFIFIaigPEIiJVjQdchFweTdVVeIAYobrH0bchiVGw+zmZLMPKDd//GHA7HUmZ0=
X-Received: by 2002:a2e:b0d0:0:b0:2bc:c3ad:f41b with SMTP id
 g16-20020a2eb0d0000000b002bcc3adf41bmr4736964ljl.2.1692743763933; Tue, 22 Aug
 2023 15:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
 <5696647.DvuYhMxLoT@jernej-laptop> <CAL_Jsq+Ssha5KdBdJ+7c3cxuy+VqWRUjSa=YM78gKi5mZAwvgQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Ssha5KdBdJ+7c3cxuy+VqWRUjSa=YM78gKi5mZAwvgQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Aug 2023 17:35:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKL7x0JCW476dU=Q5dQOCjLkBq4xcZSJAKzBiLK94nsHA@mail.gmail.com>
Message-ID: <CAL_JsqKL7x0JCW476dU=Q5dQOCjLkBq4xcZSJAKzBiLK94nsHA@mail.gmail.com>
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

On Tue, Aug 22, 2023 at 5:30=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Aug 6, 2023 at 6:42=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabe=
c@gmail.com> wrote:
> >
> > Dne petek, 04. avgust 2023 ob 00:43:01 CEST je Rob Herring napisal(a):
> > > The DT of_device.h and of_platform.h date back to the separate
> > > of_platform_bus_type before it as merged into the regular platform bu=
s.
> > > As part of that merge prepping Arm DT support 13 years ago, they
> > > "temporarily" include each other. They also include platform_device.h
> > > and of.h. As a result, there's a pretty much random mix of those incl=
ude
> > > files used throughout the tree. In order to detangle these headers an=
d
> > > replace the implicit includes with struct declarations, users need to
> > > explicitly include the correct includes.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Applied to sunxi tree, thanks!
>
> Did you really? Doesn't look like this is in linux-next.

Sorry, it's just the genpd part that isn't since that moved.

Rob
