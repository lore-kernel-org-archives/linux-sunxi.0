Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48072FAE
	for <linux-sunxi@lists.linux.dev>; Sun, 23 May 2021 12:17:14 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id t15so28655828edr.11
        for <linux-sunxi@lists.linux.dev>; Sun, 23 May 2021 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=;
        b=qLzt2Q8zgmZbiflD5+5P7ElMN2z5A5uPW8NRXtteO4uyLUUDRrn2IKkRaMvKWKF65W
         1cfWZUBsHQFj1InumAA50YINqUE+1gGMQa6vawhc32wnMK1JPFqy+ZWs+yK3N/lhIrZB
         tFzU7CEWgebc10cYE5ViNhI9KqJ0BhAzNgASIXHqW9Pvbic5Mbf7n+1hTPPnGTy2gyoF
         KIpNNID+LMnrZr9hOeF1GqZZFlAGZkUq4n5yICVxd5jeKSPa46Y9ikqlIlB9JT7xuTyE
         P+9+6vpZcRqQG7UUVVCq9WhiE6nWh3BKUbJrAhmJbHLt2xZ+1Xri6sMQDKQymr2NNUCG
         TF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=;
        b=dZAU0mMtyXlUxtHjKmJZY5p+CXcSQTPYkY6NpTCpk7jVCAQj+n6G3/8WjSfHxDltw8
         HTBh3YBNOZMLGTEGrp2nAvOQTOrHfzMmcFntAGgLZ6gXUn4nkXnsOlUyiNtqoRc3b7/h
         Wf/77pFiaZvS0RJxM/CAZhP3Sh+BOSn+yl6qQFIfYjtT7Or/7xGot1QSlkS/Gj4cArbe
         m8x5QZlj3hQ7Lj861olWKKwbc0fn6/f8tE9bzK6NE0B22G//QGSurO5NCI9PBIt4ULpM
         43FV6S9OEqFKQUIbC2bs7lE4Iis/EQEMptBvvOQTvSvxFknCGIPH3QnG+sMJ4w2Frmeg
         VAuw==
X-Gm-Message-State: AOAM531ZAyhoI3Oz2o8LBUrHq2ZYwbuvV3HjyRUBDhGbZVnW0L6HpKVt
	zbEI24qPeXEV5Iwr8IJtC6mJxg2MzsNQp5DOHHY=
X-Google-Smtp-Source: ABdhPJwPxmA4JArahzruRum264WKfGGbHUJh6bex9S7VrYwga+yKcdKWZft9UnfQIVsWH4AZBM7E8wWiBet0Lx5Pf5o=
X-Received: by 2002:a50:fb17:: with SMTP id d23mr19981613edq.338.1621772233437;
 Sun, 23 May 2021 05:17:13 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch> <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 May 2021 14:17:02 +0200
Message-ID: <CAFBinCDXgjevHr9wRn8gQ8pJhiSpZb5A7ChhQqk17yK8Tooa3Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Cercueil <paul@crapouillou.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Benjamin Gaignard <benjamin.gaignard@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> No need to set it explicitly.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/gpu/drm/imx/dcss/dcss-plane.c       | 1 -
>  drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c   | 1 -
>  drivers/gpu/drm/ingenic/ingenic-ipu.c       | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 1 -
>  drivers/gpu/drm/meson/meson_overlay.c       | 1 -
>  drivers/gpu/drm/meson/meson_plane.c         | 1 -
For drivers/gpu/drm/meson/*:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
