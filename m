Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A84A70
	for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 23:18:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7DA1613EE
	for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621639103;
	bh=Hd7KH/71GldwhXzi4DHrPnVVlwTF8/7LpSIK8f+o37k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=doSxJyE4nO23f5+oE74A09xxktTkwdzbigZe9b3YeN5TGGNX/Nv6IIoUI0F5p1+Mu
	 ieYjeN2dLCOUY7nV7U3p8DbBZQs2VjfXLTlBeW0SWYrD0lZx7OGjEUprkiAsRpc9j+
	 nK1zf76rbz31ZTg0DVHrVHzqsVc7xwsMK9nyuk9qlKdk9eldQYDTBU0SOLOneqnl+2
	 pNEdFY9KRRkYPRYCS8e5/YdI/xV7Uar7Z3BKSCj9EKcPmg+gTSdn0mdGaq93QtakGb
	 3ZY7ghsCrw2RrZJLKbfKxTcUxJ9RBPJBHdIFkycWdF7omkT/tBJPUeuBSzMagtpNAS
	 ACy5yU4zvVDLQ==
Received: by mail-lf1-f49.google.com with SMTP id z13so31980689lft.1
        for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 16:18:23 -0700 (PDT)
X-Gm-Message-State: AOAM530lBM9KRBwAEAmD/5QEy6iF/vChuiO93kfoPJtjSax8/1JsJSsR
	aSDttmr7UWUizSwXLZBSCjos1IAkc23fmpEQYA==
X-Google-Smtp-Source: ABdhPJwLJlzlmPOVRB7WKK0qZ9/SZhKCK9XRN5xQd6mPkGwxMkeGWm/SWipPm0RU1P626dAzclwFX7nQ2tzbyDx7y90=
X-Received: by 2002:aa7:d550:: with SMTP id u16mr11816867edr.72.1621639091092;
 Fri, 21 May 2021 16:18:11 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch> <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 22 May 2021 07:18:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-PKbYrREUccm5ZbTaMawpaZ7c=1zBbQBFfCZqfpu-1Hg@mail.gmail.com>
Message-ID: <CAAOTY_-PKbYrREUccm5ZbTaMawpaZ7c=1zBbQBFfCZqfpu-1Hg@mail.gmail.com>
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
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Benjamin Gaignard <benjamin.gaignard@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomba@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-mips@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Daniel:

Daniel Vetter <daniel.vetter@ffwll.ch> =E6=96=BC 2021=E5=B9=B45=E6=9C=8821=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:10=E5=AF=AB=E9=81=93=EF=BC=
=9A
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

For Mediatek,
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
