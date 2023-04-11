Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6C353B7
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 10:28:13 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id bu14-20020a0568300d0e00b0069fab3f4cafso3615761otb.9
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 03:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681208892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9k4ZTujQ4vL3rn+nuolFAvnH5smJoZ+VnOtxKctHstQ=;
        b=qmTvyHtx3DkF6kXz+J05Nnu1JcCgdUomT+qSr0Fypj+xEjZzqJs7rINh+KxAoWBYTs
         sV/U3LtG2DRo6g9Pfc8vphQOAGOlMCZNU1JAAnckqRVUwE4o4w/8zN8uq90Hq4G7bFD5
         KNkyyUIbWYlhauLYBO+kpfEbT90zEqzpfheiJ130JuoHBqBvepdMJ+CbCV+9tZzGEU98
         ewLZQ4O4eeM2tdNmW1DcjUHJFs9suHuwpap3EEOAyxDZU1WT2Ts1URXV5yMrpayaqBqw
         o1MeDIMDZNPvwfyHvij+AX3ebf9n0UMET4KrA/2I1ctUYGnXllz5DvF+bdAJduoMfGBU
         7ZsA==
X-Gm-Message-State: AAQBX9cbg7V3cXj3Nl1yq4YTvTCu+a05OuGTPUxS8neqi9BZOIo9UutD
	jPCqLVfDL0jz1vXAw083usLzwiw5GcagPTLF
X-Google-Smtp-Source: AKy350aNiG7ojf0ug17yI6uKhV/7clGC3tuQQPWv3Nixf0rbjzIL+TisG7FCv55Xs9Z7bogz18hXrw==
X-Received: by 2002:a05:6830:1d62:b0:699:f81a:14bd with SMTP id l2-20020a0568301d6200b00699f81a14bdmr6002008oti.30.1681208892332;
        Tue, 11 Apr 2023 03:28:12 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id u2-20020a9d4d82000000b006a3e377f0d7sm3051776otk.4.2023.04.11.03.28.11
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 03:28:12 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id cg19-20020a056830631300b0069f922cd5ceso3589172otb.12
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 03:28:11 -0700 (PDT)
X-Received: by 2002:a25:d74c:0:b0:b46:c5aa:86ef with SMTP id
 o73-20020a25d74c000000b00b46c5aa86efmr5126210ybg.12.1681208871324; Tue, 11
 Apr 2023 03:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech> <20221018-clk-range-checks-fixes-v3-28-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-28-9a1358472d52@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 12:27:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUEOP_3zjf8nwDyHvZVG-D0AsBjnr=esKzejMMcEiLSQ@mail.gmail.com>
Message-ID: <CAMuHMdXUEOP_3zjf8nwDyHvZVG-D0AsBjnr=esKzejMMcEiLSQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/65] clk: renesas: r9a06g032: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Dinh Nguyen <dinguyen@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org, 
	linux-mips@vger.kernel.org, Gareth Williams <gareth.williams.jx@renesas.com>, 
	Herve Codina <herve.codina@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC Gareth, Herv=C3=A9, Miquel, Ralph

On Tue, Apr 4, 2023 at 2:44=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:
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

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
But I do not have the hardware.

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -1121,6 +1121,7 @@ static int r9a06g032_clk_mux_set_parent(struct clk_=
hw *hw, u8 index)
>  }
>
>  static const struct clk_ops clk_bitselect_ops =3D {
> +       .determine_rate =3D __clk_mux_determine_rate,
>         .get_parent =3D r9a06g032_clk_mux_get_parent,
>         .set_parent =3D r9a06g032_clk_mux_set_parent,
>  };
> @@ -1145,7 +1146,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *cl=
ocks,
>
>         init.name =3D desc->name;
>         init.ops =3D &clk_bitselect_ops;
> -       init.flags =3D CLK_SET_RATE_PARENT;
> +       init.flags =3D CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
>         init.parent_names =3D names;
>         init.num_parents =3D 2;
>

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
