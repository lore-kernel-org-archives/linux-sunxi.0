Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870900;
	b=je9/G1W4F7cHvL5SSU1hwnRG1ti+DmZmZCDLdDQEUaikn5uGvwIMTH74sVb4JGFoDFEZ
	 lbjgkdhXGEBU6iwf++gGrQaRZu8tXT/EZgjjxlJaRy2gxlDPzS7EkWCxH2YV9zwXmqvlT
	 fOt18i2f8REmZi8PeopKXGxJI6Ow5LlcfRWj76EpYGg3M9AyQffnglX2mzoStbffqsgL5
	 7nZrNHL0BxULCwo4w9agZAIx/eEbuRBk9vchqpMW1VQCv3FZL78LdOmVNOftgxzENT4Rd
	 kKbqNt7uoZWpgkFkpuYRJmgD9ojdQXzegSVVLwIQYcW5IoQgMkiJl2Tpb62HWw9G5PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870900;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
	b=dXNMm7O+/9v0+nhShQZz1bzmqrgqtRUlGTQ6E9RdWO/K3EH0Pssk9bgNlrES3G57kdWA
	 I54HwXQnEkdF4nK2d7IN0nHccoQXU9tBUki/FXJr7WWwhYlt89m1OVki/oL5yerwfIzHa
	 OESFT2sML99mjxiEJTi/viIJl1eSGDZu/rHh+BUumpdcZBFgtH67+5uRGrjumXI2ff0wX
	 m8EIP7Zgked+xBZu1gsTb6atWpSUmJ64tnhhUOLnNKtxPxrnE2c1b1Twk5cXN2dbCtM/Y
	 gNlbrTKXdKsHFyYKiWYsABL5X40LZ6SXs8TW+S/R7f/e2/wpwxvaF5pxSsJQeMY0wew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE520606A329
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 09:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE520606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5363c8de563so16956681cf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 01:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870898; x=1794475698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
        b=2NpK7Gkv87To07s6mR6ELBwdb2UNfFe0ZDjALTmL4nh9gFKH65GkWvXdPyb36PyOtJ
         /YZR11OrIVMH2z+BDD1LH0ZeYjDnfD6o/7nCDtPUKdz91FU8Is2KkuKvuk9mfJhfTQJE
         kwQjWsKGO4y8t9Di1Frg0e02086YDC+0xBgmQdpWVBMjlQS5JXH4VZsd8cO65i/5D4td
         nqh2hS7DuEG+v87dEBG0jKXnnnoQ8HGX8rPzHpu3AyjZUEfXcZ48yPjknQIPiq55knWy
         Xcy+tiTU0F6f86wKWznsuUrWVHGGbg0uHFbI1seajVUG1AwG4F7Ojj7VW0hI0GYjS9u6
         /W3A==
X-Forwarded-Encrypted: i=1; AKwUvBwIXlmZHK0qUBDf2IsegEoqq7szD6jsycucGDXFCB9xDqJP0AkN0lKDRVDL3OHGAJwF/ExcdMqB1EXd0A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+2ZI0S3MkRMcLMyUVqg+85iJtGVV4dg3pglNFJIgN8KMVxed3i
	79NPPt4uHUWn5z3yJvDO5tf+3jV1yHql7TgQPKidb5B+Y3iXp8sg3v4LLnBH8be65Eo=
X-Gm-Gg: AYBFou2Xdxv0AWsdTwXLIbLiJkTq2Zbk3D9iXP3rPbhMOnJegHdJmVCE2hZIBx9zvKp
	+NB7JiCHZSaQyZkEusxnXSBa76QH1R50iOneK1lZhv0v8mbvSOthaHiWoxRjzmluS/sfPfOXHl+
	pdEpWUvp0NzbPCEcCLele4WbNAcGoYnXBJjxwEUQtS3D8MJ2+2cVVVOWpB5BCRX1DmFNfvu+i7n
	a5LwCX7DhVb9o/C9lq2eaTEOw9OQ9o9miTZDHUwX4qQNwFrheSvx6EYIq+dAHDiSXvnmcSq2ciW
	VnrO4guiIhd786rgeFWQ/ucE568N4KOYZ1IzoFnmsi9jtf62kl6KnKoen5GSYGMLCEOfM7NFhpX
	RU6fgD5AROehTaTpAKbMd2GQaz0LAoOH5gBNnqMl2/zReErsnNK9Qqg3TbDuK83LCISgqx9R1nj
	hlHwc0Bj8HhTBoOrA3XwOl4QPQpZG1UCs+epmOgv8TlSHiGk9sLO6l9f2NZsdq8+XRdhVLBGl8u
	FiVbl8eBv4Q097d2WcSxhlxysGcxCnC1ZNYXABT1jV5Hqw9PDWz6+I1TOH1+E4POEZhE83qTfC2
	0dcMOeVRuMBsr6nRChRGFjT+/iW528RqEOt+0nAB/+faNqOrWZwRriyewRSPZgk0xvsVvg==
X-Received: by 2002:a05:622a:1b2a:b0:530:430d:87f7 with SMTP id d75a77b69052e-542b75214eemr285436311cf.47.1793870898379;
        Thu, 05 Nov 2026 01:28:18 -0800 (PST)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9a5d0656sm9638376d6.16.2026.11.05.01.28.18
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:28:18 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f2f2edb19so150819085a.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 01:28:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzorW3HtMLvRl5wxKm4zA7xkNWNAjoRrmpPI5dvMBRL9LmklJIJEiXJEdgYYapyOG6BpVQiRTdVvnCFBQ==@lists.linux.dev
X-Received: by 2002:a05:6102:e0b:b0:7cc:1045:610 with SMTP id
 ada2fe7eead31-7d072cc4a42mr6604019137.27.1793870415083; Thu, 05 Nov 2026
 01:20:15 -0800 (PST)
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
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
X-Gm-Features: AclHuK-9tAw2bAtaZucYUxK8rDds9GR808jJtyoj1R1Fxu-dNuDK-M2tP9yoLrk
Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
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

Hi Frank,

On Wed, 4 Nov 2026 at 16:30, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *

You have lost the "# Renesas related drivers" part from Wolfram's
review?
https://lore.kernel.org/all/auoQiuIm9FxdOrYl@shikoro/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
