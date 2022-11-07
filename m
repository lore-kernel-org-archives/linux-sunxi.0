Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711822565
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 07:52:22 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id p18so2163385qkg.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 23:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLKOOl0yo7YI7pAdrLyTR/NQWG7rhWdAq87I8wp+XOk=;
        b=3nBwr66D3TJ6ZidhOmAoPghWe5EuFG5a4XtltdagqnArT6SUeDo5SvxmdWGVxlhrkJ
         /GUq8SYuSIsj4CArlL1dCEHuiArR0r6UxuOgw0X2qJwtdxuhOgLdEDpOCqilM4lPiIuC
         OKnpVP/jZy4OHNIhJwHSPFZiDbBM/H9Jlri7eps0J33/yGLgG0J4TBnc/Q40CMbzsxh6
         YfBJL6WKCvk3d4sPM3jWo9KQDFfdteeC00kOAZd0FHiBwj5JybGI8m92pgJDLKzWnUl5
         r7vtaMG85INm2cU4qLcnESczc3xReO+wKztOKBQYO+jeexlmqUFrpiBBl8dCiV1UpQMo
         ZHrQ==
X-Gm-Message-State: ACrzQf0i0b1aoBlZlOymTkYW7RpwGqxV5ZGmoqm62GzwBXTfDrujAbmx
	5IM4RJR/I3srQb7OKiFWDC8EnwEErndz6d0w
X-Google-Smtp-Source: AMsMyM7JMmyjNiYvjhrfEIPRABVoadAA8iyvIv34UEVN8VgJIoq5j2NFdT6sAeRGmjc1P9GCDGuyoA==
X-Received: by 2002:a05:620a:b90:b0:6fa:2ffd:ddad with SMTP id k16-20020a05620a0b9000b006fa2ffdddadmr28591368qkh.542.1667807541138;
        Sun, 06 Nov 2022 23:52:21 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id w13-20020a05620a444d00b006cbc00db595sm6396697qkp.23.2022.11.06.23.52.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 23:52:20 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 131so8232289ybl.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 23:52:20 -0800 (PST)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id n9-20020a819c49000000b0034a00de97b8mr45959924ywa.384.1667807529144;
 Sun, 06 Nov 2022 23:52:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech> <20221018-clk-range-checks-fixes-v2-28-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-28-f6736dec138e@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2022 08:51:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXee3Xf8G53anCq-4qfenHhgnMiyC1KhKo8Uv6-UV_jrw@mail.gmail.com>
Message-ID: <CAMuHMdXee3Xf8G53anCq-4qfenHhgnMiyC1KhKo8Uv6-UV_jrw@mail.gmail.com>
Subject: Re: [PATCH v2 28/65] clk: renesas: r9a06g032: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Michael Turquette <mturquette@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Samuel Holland <samuel@sholland.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Vinod Koul <vkoul@kernel.org>, 
	NXP Linux Team <linux-imx@nxp.com>, Sekhar Nori <nsekhar@ti.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Lechner <david@lechnology.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-stm32@st-md-mailman.stormreply.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-clk@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, 
	linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Gareth Williams <gareth.williams.jx@renesas.com>
Content-Type: text/plain; charset="UTF-8"

CC Gareth

On Fri, Nov 4, 2022 at 2:18 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Renesas r9a06g032 bitselect clock implements a mux with a set_parent
> hook, but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
>
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
>
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
>
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
> index 983faa5707b9..70c37097ca6e 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -773,6 +773,7 @@ static int r9a06g032_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>  }
>
>  static const struct clk_ops clk_bitselect_ops = {
> +       .determine_rate = __clk_mux_determine_rate,
>         .get_parent = r9a06g032_clk_mux_get_parent,
>         .set_parent = r9a06g032_clk_mux_set_parent,
>  };
> @@ -797,7 +798,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *clocks,
>
>         init.name = desc->name;
>         init.ops = &clk_bitselect_ops;
> -       init.flags = CLK_SET_RATE_PARENT;
> +       init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
>         init.parent_names = names;
>         init.num_parents = 2;
>
>
> --
> b4 0.11.0-dev-99e3a
