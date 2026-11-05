Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870196;
	b=GNrQnsVdDoVR2WKQPISZ8oOM4OO5/WThxqqWYZvvPsqaIgNUNavXuHc+CUW3tyAMqVtv
	 4uwC26beB4OoR2v+y9dEbQ3u6DnCLpoNpn783vaEIH2HzEtKs4YrRKPJuVfp73/NSVSPS
	 q8mqSznzWHDlvHbsVlwomRlPD+wN8YO3qIOtnRxf8OsYTG7w/yr48JNWRRPUCj4TsO+FV
	 Nb34wcNu3jsz0qqqS8Z+09uIqU+DwpVqAVAhuSY6idZEwO3U4Cen/xrBl8EtcyJ4MUhU9
	 5ogEslr0mCeC50RnIIoxMzTl+KSnmneMkgNHK64gTLw7prjAHo5O7hkilv8stQzlMqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870196;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
	b=jx2a2zyjEkqEZDbUy/jI+ZbZ0d0cjhWHuuF/12EYN6rpIIndDN264+ePjj3dgtNNCGCt
	 h0PkKardGIVWD6NuFFiKubU6JMGf79un26fiMHfTOIrQ51ktA+mfsBnw/6EJu0C+um9eL
	 CqjYPWIAfseVwCi0XnARjsHToFbrd2xIZVlWaUth9IY4V5nYw0LI2JGeLjr+7r54D/2mS
	 6Nd8eIzKNqp5rahbhyduc2IiA0GEbkROIvczoswP0kPLL+4u+TAFQfSoDF/F0ICZ+AObx
	 aJE7w8CvnEbSW4pwmEhGUON+jb51MYtUVH/71Hu3uoIFPF65xOhPyem/iVhnBRHt4Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9775606A31B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 09:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9775606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eafa528803so545708e0c.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 01:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870194; x=1794474994;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
        b=mGqqpVDVp9I5PyvQPk/IyzpxHhgk0Lu8Gk3TQg7mERCZ06z3KeJONfDdpHTk6cAKgx
         iidD3pjQ+HKlV9LBW9KIbN+ZdOTbrdY6U/HoCSf0A4wDEqVJfsLV86I3CN99BlCMMzPg
         cSPu7xvT8HqqIeuucX+e7J3Unr6+olLWxZkirj1iPEPEjunju0HFmgMAFv49Hq+RehtP
         17iok99r7PMZcq/riR2X8pXbQsWhQpRdPccIb4sukWnC/81oa+qhHQdqqga/xPB53sk0
         WgEueiB3S9sg5hP3gqdYtehQfdYMLaHxm+r80svBILivKKeYcHXchJ+gfDdF0cNiJR/P
         prsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7tuA/1cJVTj0XDEwTb1kJWjjbUPQkEk9XWywRr9pHNB984f6Aik3rMmNOfHKqzh5rsL2+JOfF26VeRg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8+YwGQDY5E7K3nr2we3K7TjUzWVnC9AP/Ok+bQNCahLjVDbm1g
	Izf+kLClXSL8gWoMkhf2im3lPuaYnrLIVVEEj/Q0kP709zCWU4erCswMp2+e3JXsTRU=
X-Gm-Gg: AYBFou2+I4CM6zJADKDQja9M5Dj0Qco+lYKuNzuDWRi0VZVDfmUWtTgPoeuNxGliQlM
	Enfz0qsYkPQJHIgK1C/hgPgSJ99YQVLjQFdw+jQmeuzYTIrtCeWyytYMyAokJpeAuESKUnaS19o
	kjFTFmMxTakelAiJ6Y6CQjotA31Z8v1DSYy50JZW6k2atyozxT7wUn4pltK0Y2f2uE7hGyHIlhZ
	RxM0ZvbWJ8cccd4C3ZMGEdEEypwv0kh5k8FW3uldjMuvYs/fhaOx47DXjttrPO1Tv7kj6VAxA9r
	ykkDpAmZd7f/oSZDjBydf3N2JHl6NJFXq9aBkCv/aVmxHi8jZlxV64pB/Kf39WTyWtySQlizHrB
	12FqWbl+1U6khyoExn7qRmxdU7aKG87bErjem3L6E5Mo8E0si1gpDdxrbhXPqa4n2wl3+P3ZqeZ
	81tPUIxCHNgay8gKQuGB2qpktyN4BLXJWBKV/ykzBrWgdAqufWFFbZ5A/Tpk/WRGJYI3GL0BnN6
	b6qy+mh6vTO3sTTvJoYLkxtsPNEqPMuvMwKVTx90BUfSH8LTxzQHUfKIukMAlGmsbFnnXyr4JpQ
	+g4DP94LedHSTW8D26FHnasNtw9yc/EF9J9u7SJbv2NgPBg6kTSui/lPy3LBYhqaVixIb6ev+Oq
	zKOIkTf1qlsFeDuc=
X-Received: by 2002:a05:6122:1d4d:b0:5ea:c9ab:bd86 with SMTP id 71dfb90a1353d-5ec6897efbdmr9468067e0c.21.1793870194561;
        Thu, 05 Nov 2026 01:16:34 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecb6d79d9fsm1190725e0c.7.2026.11.05.01.16.27
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:16:29 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eac01ff101so637675e0c.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 01:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxihmxuh3RxSq0K0lXT8STdfZOQdWHWf6jgseaMHbYfRWziDHt7X29L5cOo88CIiWku0qNiTFZhsO9uaQ==@lists.linux.dev
X-Received: by 2002:a05:6102:3711:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d072695e4emr7033715137.14.1793870187629; Thu, 05 Nov 2026
 01:16:27 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org> <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
 <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org> <auxF9RT5aljXkfh7@ashevche-desk.local>
 <auxGdYgJvjq9EBu6@ashevche-desk.local>
In-Reply-To: <auxGdYgJvjq9EBu6@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:16:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
X-Gm-Features: AclHuK9751j09IKd6_4EIkqyFvn0FA5bsvqOYkEgIDax6KzLeXviQYPveqzIsxk
Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Konstantin Ryabitsev <mricon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 10:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Nov 05, 2026 at 11:01:55AM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 12:02:21AM +0100, Krzysztof Kozlowski wrote:
> > > On 04/11/2026 21:44, Andy Shevchenko wrote:
> > > >> Andy,
> > > >> These three lines look correct.
> > > >>
> > > >> LGTM:
> > > >>
> > > >> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > As
> > > >
> > > >   Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi
> > > >
> > > > Note, it's in your power to ask the author to split out what you maintain
> > > > to a separate change. So, it's your choice what to do, Ack the full patch,
> > > > give a partial Rb, ask for a split, ignore reviewing (often means silent
> > > > agreement when maintainer just applies that kind of a patch)
> > >
> > > The "# note" after the tag solves the problem partially, if people were
> > > actually using it. Solves people looking at the Git commit and being
> > > mislead by partial review applying to entire commit. Does not solve
> > > credits, because Rb for three lines is not the same as for 100.
> > >
> > > From v1 of this patch, four people (Alain, Lab, Troy, Kunihiko) did not
> > > use it even though reviewing only part. Only Wolfram, so 20% of partial
> > > reviews, used that syntax. Without that syntax, b4 will pick up Rb tag
> > > like it was for entire commit.
> > >
> > > So I do repeat - if one does not want to use that syntax, then just Ack,
> > > instead of creating false impression of reviewing everything.
> >
> > +Konstantin, then we need to teach `b4` not to break that or convert it to
> > something like
> >
> >   [FirstName: reviewed only ...]
> >   Reviewed-by: FirstName LastName <...>
>
> And Ack is not the same as Rb, when I *reviewed* patch, I have *reviewed* it,
> even if it was partial one.

Exactly.

Ab means I won't take it through my tree, please take it through a
different tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
