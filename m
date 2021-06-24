Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287E29D6
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Jun 2021 08:52:52 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lwKmk-0006cm-HJ; Thu, 24 Jun 2021 10:32:30 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lwKmX-0006oO-Cb; Thu, 24 Jun 2021 10:32:17 +0200
Message-ID: <43f805608f1172b73c62717f6cdc72c7a15d145c.camel@pengutronix.de>
Subject: Re: [PATCH 08/15] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
	 <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Heiko
 Stuebner <heiko@sntech.de>, Paul Cercueil <paul@crapouillou.net>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,  Philippe Cornu
 <philippe.cornu@foss.st.com>, Lucas Stach <l.stach@pengutronix.de>, Daniel
 Vetter <daniel.vetter@intel.com>, Laurentiu Palcu
 <laurentiu.palcu@oss.nxp.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, Stefan
 Agner <stefan@agner.ch>, Sandy Huang <hjc@rock-chips.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jyri Sarha <jyri.sarha@iki.fi>,  Tomi Valkeinen
 <tomba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org,  linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-sunxi@lists.linux.dev
Date: Thu, 24 Jun 2021 10:32:17 +0200
In-Reply-To: <20210622165511.3169559-9-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
	 <20210622165511.3169559-9-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

On Tue, 2021-06-22 at 18:55 +0200, Daniel Vetter wrote:
> No need to set it explicitly.
>=20
[...]
>  drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
>  14 files changed, 15 deletions(-)
>=20
[...]
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv=
3-plane.c
> index 8710f55d2579..ef114b6aa691 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -772,7 +772,6 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  }
> =20
>  static const struct drm_plane_helper_funcs ipu_plane_helper_funcs =3D {
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check =3D ipu_plane_atomic_check,
>  	.atomic_disable =3D ipu_plane_atomic_disable,
>  	.atomic_update =3D ipu_plane_atomic_update,

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
