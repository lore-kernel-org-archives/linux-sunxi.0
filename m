Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF6944C
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 07:43:47 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5728df0a7d9so42138657b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 00:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579826; x=1692171826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LWJf53shp0viE9TAbmwOxmgVvdOZl/M9mic33WO7Jo=;
        b=b3YuQiRd5cfm1yA7ZArFE1nFXlT/ka6NeBaJNk77gJex87oIzEULKOkpnakbnNe1Yi
         D60mC7DE5j3Wt4H2imRwc+x82acvCRPu6pT++Pa0F8EDfb+QGmG4/aZnOJpVi+JOl4PL
         sTSA7dMQ9oQND8/rjWBOOs6W/YscyBWxeA/UbMNURlFLsS4j/hUy6gSYWA+w0DOnxliu
         QJehdx8QLvadS+K9efPPXvx2p5kyO2tMooAD6FJLxAN+GXqDztd2rT3B4UzV6MSc9JoZ
         f6Q/pK2VhcySQDagMhphZbfOHzB+00n9SdFtUdc7Wo7JRUVkh7NQ8us8Bv5RW++4unQI
         962A==
X-Gm-Message-State: ABy/qLbF6n31fWxSvoAmzQzvBX8H9u7QgtI6gYzMIqhU5nX7pMigbbLB
	D76941oz/DtvYX7ix1GA1HMamkEOs/hnxA==
X-Google-Smtp-Source: APBJJlG7ATMmXkzrt0Taaz/a3eI/Up+rzvC+CYSlMJ4D0fGrqmNqcKfDDxNazD95sfTlkiUMVuXXjg==
X-Received: by 2002:a81:528b:0:b0:583:2df2:35f3 with SMTP id g133-20020a81528b000000b005832df235f3mr4505788ywb.1.1689579826018;
        Mon, 17 Jul 2023 00:43:46 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id w125-20020a816283000000b0057a6e41aad1sm3681535ywb.67.2023.07.17.00.43.45
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:43:45 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-57a551ce7e9so42122007b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 00:43:45 -0700 (PDT)
X-Received: by 2002:a25:2945:0:b0:c21:caaf:bd47 with SMTP id
 p66-20020a252945000000b00c21caafbd47mr10530962ybp.2.1689579804817; Mon, 17
 Jul 2023 00:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 09:43:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOUAPoBcSqHLTCKh8_PqyAiuGFEXedEPS48X=oc8SqDA@mail.gmail.com>
Message-ID: <CAMuHMdUOUAPoBcSqHLTCKh8_PqyAiuGFEXedEPS48X=oc8SqDA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Chester Lin <clin@suse.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chen-Yu Tsai <wens@csie.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-oxnas@groups.io, 
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 7:52=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/renesas/core.c                         | 1 -
>  drivers/pinctrl/renesas/pinctrl-rza1.c                 | 3 +--
>  drivers/pinctrl/renesas/pinctrl-rza2.c                 | 3 ++-
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c                | 3 ++-
>  drivers/pinctrl/renesas/pinctrl-rzv2m.c                | 3 ++-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
