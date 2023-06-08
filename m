Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E8A1641A
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Jun 2023 16:08:53 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-75d3f2c9d13so69410485a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Jun 2023 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686240531; x=1688832531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZrPvXOaXEQPKsXtUpbfz4WhJ7pTJywi1kpaIctsmkU=;
        b=fPopCkJMNl6Wa8tCmVs8EGEKP23aN9LegzcBYqKkXVzpgYIMdHGLTO+J46ZxAUHyST
         2TfNcWX/m0fON4jE6vIQhQrM/gzmRifMZkB4jXUvDOlAeQheLqPU2VU57YnJ6CNpNhD+
         VhUrhjlSF9clT9C8ax25GbQVhx6XpXzDEFJEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686240531; x=1688832531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZrPvXOaXEQPKsXtUpbfz4WhJ7pTJywi1kpaIctsmkU=;
        b=N6YEdsFnW9SJAssMvWEfAhN2EkY71Rak7kZ0cM8Pp9nqIeRlVd5iHrO/u7+xPzERma
         DAyB/hcNv+BGOK2pMKsJNkiy815/l61pulZAq1IkIpmVr3i2KEgw3BA6pCviAFI+mAZ1
         5UDy0lG6VzaJiatDDUIP5gDZfEuNIw2EpxHPRS5KR2QNpVou/Q5+4UKMzbIMMsWbxsqj
         6P42E8KyVJyUsRJdcULeD2UQd1r7rBoqey2fy3giFqpgmlc6F0NDaxWHVlY4hD7rji+R
         2Bwshe6zYmC51zv/o3NAcOp6xh6WJoPEEtRp4nxkB2cbAsWefrkrvvk5s9pNvmNMIPVx
         eAMw==
X-Gm-Message-State: AC+VfDyNPNo3y4kKERtG/yzswS7V6YeVe406LKFfDN5B4LH6R6uhabfV
	qvVrfOjRt4Px0K+RHQ8fq0xNIbtuSuC/gVWM4Cvu5A==
X-Google-Smtp-Source: ACHHUZ688cKMuNOrmKPFjjrQ1SHrnkVFGUYIsRINZG0DEMQvlrMSgvk3agvPvuDdOHppeUJ96TTHKA==
X-Received: by 2002:a05:620a:4495:b0:75b:23a1:362e with SMTP id x21-20020a05620a449500b0075b23a1362emr7676741qkp.63.1686240531291;
        Thu, 08 Jun 2023 09:08:51 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id b14-20020a05620a126e00b0075c5e32593fsm418353qkl.40.2023.06.08.09.08.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:08:50 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f9b7de94e7so231511cf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Jun 2023 09:08:48 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a22:b0:330:af65:de3d with SMTP id
 g2-20020a056e021a2200b00330af65de3dmr115540ile.11.1686240508041; Thu, 08 Jun
 2023 09:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de> <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
In-Reply-To: <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 09:08:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
Message-ID: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Mihail Atanassov <mihail.atanassov@arm.com>, 
	Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Rahul T R <r-ravikumar@ti.com>, 
	Jayshri Pawar <jpawar@cadence.com>, Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Minghao Chi <chi.minghao@zte.com.cn>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Danilo Krummrich <dakr@redhat.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Qiang Yu <yuq825@gmail.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Liu Shixin <liushixin2@huawei.com>, Miaoqian Lin <linmq006@gmail.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Marek Vasut <marex@denx.de>, Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>, 
	Yuan Can <yuancan@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Liang He <windhl@126.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Deepak R Varma <drv@mailo.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maxime Ripard <maxime@cerno.tech>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Alexey Brodkin <abrodkin@synopsys.com>, Emma Anholt <emma@anholt.net>, 
	Melissa Wen <mwen@igalia.com>, Hyun Kwon <hyun.kwon@xilinx.com>, 
	Michal Simek <michal.simek@xilinx.com>, linux-aspeed@lists.ozlabs.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	John Stultz <jstultz@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Fabio Estevam <festevam@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
	lima@lists.freedesktop.org, Steven Price <steven.price@arm.com>, 
	linux-rockchip@lists.infradead.org, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Mali DP Maintainers <malidp@foss.arm.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, 
	Yongqin Liu <yongqin.liu@linaro.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 1, 2023 at 8:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > this patch series adapts the platform drivers below drivers/gpu/drm
> > to use the .remove_new() callback. Compared to the traditional .remove(=
)
> > callback .remove_new() returns no value. This is a good thing because
> > the driver core doesn't (and cannot) cope for errors during remove. The
> > only effect of a non-zero return value in .remove() is that the driver
> > core emits a warning. The device is removed anyhow and an early return
> > from .remove() usually yields a resource leak.
> >
> > By changing the remove callback to return void driver authors cannot
> > reasonably (but wrongly) assume any more that there happens some kind o=
f
> > cleanup later.
>
> I wonder if someone would volunteer to add the whole series to
> drm-misc-next?!

It looks as if Neil applied quite a few of them already, so I looked
at what was left...

I'm a little hesitant to just apply the whole kit-and-caboodle to
drm-misc-next since there are specific DRM trees for a bunch of them
and it would be better if they landed there. ...so I went through all
the patches that still applied to drm-misc-next, then used
'scripts/get_maintainer.pl --scm' to check if they were maintained
through drm-misc. That still left quite a few patches. I've applied
those ones and pushed to drm-misc-next:

71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
callback returning void
1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning void
b957812839f8 drm/v3d: Convert to platform remove callback returning void
e2fd3192e267 drm/tve200: Convert to platform remove callback returning void
84e6da7ad553 drm/tiny: Convert to platform remove callback returning void
34cdd1f691ad drm/tidss: Convert to platform remove callback returning void
d665e3c9d37a drm/sun4i: Convert to platform remove callback returning void
0c259ab19146 drm/stm: Convert to platform remove callback returning void
9a865e45884a drm/sti: Convert to platform remove callback returning void
3c855610840e drm/rockchip: Convert to platform remove callback returning vo=
id
e41977a83b71 drm/panfrost: Convert to platform remove callback returning vo=
id
cef3776d0b5a drm/panel: Convert to platform remove callback returning void
bd296a594e87 drm/mxsfb: Convert to platform remove callback returning void
38ca2d93d323 drm/meson: Convert to platform remove callback returning void
fd1457d84bae drm/mcde: Convert to platform remove callback returning void
41a56a18615c drm/logicvc: Convert to platform remove callback returning voi=
d
980ec6444372 drm/lima: Convert to platform remove callback returning void
82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returning v=
oid
c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning voi=
d
a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback returning=
 void
9a32dd324c46 drm/aspeed: Convert to platform remove callback returning void
2c7d291c498c drm/arm/malidp: Convert to platform remove callback returning =
void
a920028df679 drm/arm/hdlcd: Convert to platform remove callback returning v=
oid
1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning void

The following ones appeared to apply to the top of drm-misc-next, but
I didn't apply them since get_maintainer didn't say they were part of
drm-misc-next:

drm/tiny: Convert to platform remove callback returning void
drm/tilcdc: Convert to platform remove callback returning void
drm/sprd: Convert to platform remove callback returning void
drm/shmobile: Convert to platform remove callback returning void
drm/rcar-du: Convert to platform remove callback returning void
drm/omap: Convert to platform remove callback returning void
drm/nouveau: Convert to platform remove callback returning void
drm/mediatek: Convert to platform remove callback returning void
drm/kmb: Convert to platform remove callback returning void
drm/ingenic: Convert to platform remove callback returning void
drm/imx/ipuv3: Convert to platform remove callback returning void
drm/imx/dcss: Convert to platform remove callback returning void
drm/etnaviv: Convert to platform remove callback returning void
drm/armada: Convert to platform remove callback returning void

-Doug
