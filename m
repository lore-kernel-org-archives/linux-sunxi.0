Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA212101
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 18:32:04 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-55af0a816e4so3802690a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689186721; x=1691778721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTThceHWQZD4Ac2XfATsHd8gywiOPtbGgdMtmxYrl6g=;
        b=ZKQJbvlx5WWNgpkWPN0OWQJTNOVsEk6DALT2pe/Y4ecNR9eZIbI+fv9phbdHZ1ynSe
         yKAeT2uyoUqgOthnKQchaIYQhEJgqyugSPKALgI5JNgPDIn1FFpGdITga46C4J3tcWZy
         LolBFANy3lQrFmL/PAU+GLn7jnEgDLe0QakUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689186721; x=1691778721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTThceHWQZD4Ac2XfATsHd8gywiOPtbGgdMtmxYrl6g=;
        b=PRYFS14Ypt9XC2FTO6Qi3U9YJ8+APVA3YrUWPqtE9dmIio+9Hzugnx2kAbHLyYlRaA
         ASBxU8L5aiV2miCbL7Dizz51f6xb0C0LYud0LkpfG32LDMOPQbKErYqmO5K5pDdRu8MQ
         mLRkR+MggIFAXWoy5VqV4HTA9Hrk12DBQrx2VjGyECt6ImksZZIws7IyCOPToHBSREeK
         nRi8I45sV4i0/PiArIc7SJz/3jcoCT/woPQfyQJeC8rw0/Nx1iGG/jPHhq/TZfaiH5wu
         kpx2BW1jgh2sJU01i8Q1nbSY7P8WqsZym8DJ/arwcZJ8IvJ0qvXYLVaSI6mES0v7GqZU
         BzwQ==
X-Gm-Message-State: ABy/qLYIDrBfwnbJtZCEGN0JuRWEktsYuBBVQhqf3jII3/1odtJyyWK2
	hBIpIW9f3HaIA09895qmLrYOxpPHaVoziBPsYNfA6g==
X-Google-Smtp-Source: APBJJlEipBZmlxHDWr98fB9TktuYkmupcDg/L0UtuWCDZYhIUf9l15NO1DjzfD1BEWYzDLhq8xucSA==
X-Received: by 2002:a17:902:dacd:b0:1b8:87dc:3371 with SMTP id q13-20020a170902dacd00b001b887dc3371mr19273562plx.67.1689186720683;
        Wed, 12 Jul 2023 11:32:00 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id q21-20020a170902bd9500b001b6a27dff99sm4291713pls.159.2023.07.12.11.31.59
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 11:31:59 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-262ef07be72so3669329a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 11:31:59 -0700 (PDT)
X-Received: by 2002:a25:50c9:0:b0:c6d:e3e3:5592 with SMTP id
 e192-20020a2550c9000000b00c6de3e35592mr13511834ybb.54.1689186698646; Wed, 12
 Jul 2023 11:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de> <87fs5tgpvv.fsf@intel.com>
In-Reply-To: <87fs5tgpvv.fsf@intel.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 12 Jul 2023 14:31:02 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
Message-ID: <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
To: Jani Nikula <jani.nikula@intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Guchun Chen <guchun.chen@amd.com>, 
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Evan Quan <evan.quan@amd.com>, 
	Likun Gao <Likun.Gao@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, 
	David Francis <David.Francis@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	Graham Sider <Graham.Sider@amd.com>, Lang Yu <Lang.Yu@amd.com>, 
	Philip Yang <Philip.Yang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>, 
	Tim Huang <Tim.Huang@amd.com>, Zack Rusin <zackr@vmware.com>, Sam Ravnborg <sam@ravnborg.org>, 
	xurui <xurui@kylinos.cn>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Qingqing Zhuo <qingqing.zhuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	Hersen Wu <hersenxs.wu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>, 
	Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>, Wayne Lin <Wayne.Lin@amd.com>, 
	Aaron Liu <aaron.liu@amd.com>, Melissa Wen <mwen@igalia.com>, 
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Tadokoro <davidbtadokoro@usp.br>, 
	Wenjing Liu <wenjing.liu@amd.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>, 
	Roman Li <roman.li@amd.com>, =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
	Dave Airlie <airlied@redhat.com>, Russell King <linux@armlinux.org.uk>, 
	Liviu Dudau <liviu.dudau@arm.com>, Joel Stanley <joel@jms.id.au>, 
	Boris Brezillon <bbrezillon@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Danilo Krummrich <dakr@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Matt Roper <matthew.d.roper@intel.com>, 
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
	Radhakrishna Sripada <radhakrishna.sripada@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Luca Coelho <luciano.coelho@intel.com>, 
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Vinod Govindapillai <vinod.govindapillai@intel.com>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>, 
	Anusha Srivatsa <anusha.srivatsa@intel.com>, 
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Uma Shankar <uma.shankar@intel.com>, 
	Imre Deak <imre.deak@intel.com>, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, 
	Swati Sharma <swati2.sharma@intel.com>, =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>, 
	Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
	Arun R Murthy <arun.r.murthy@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>, 
	Khaled Almahallawy <khaled.almahallawy@intel.com>, 
	Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Andi Shyti <andi.shyti@linux.intel.com>, 
	Nirmoy Das <nirmoy.das@intel.com>, Fei Yang <fei.yang@intel.com>, 
	Animesh Manna <animesh.manna@intel.com>, Deepak R Varma <drv@mailo.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Vandita Kulkarni <vandita.kulkarni@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>, 
	Manasi Navare <manasi.d.navare@intel.com>, Drew Davenport <ddavenport@chromium.org>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marian Cichy <m.cichy@pengutronix.de>, Dan Carpenter <error27@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Polimera <quic_vpolimer@quicinc.com>, 
	Jiasheng Jiang <jiasheng@iscas.ac.cn>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Liu Shixin <liushixin2@huawei.com>, 
	Marek Vasut <marex@denx.de>, Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>, 
	Gerd Hoffmann <kraxel@redhat.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	David Lechner <david@lechnology.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Michal Simek <michal.simek@amd.com>, 
	Haneen Mohammed <hamohammed.sa@gmail.com>, linux-hyperv@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
	Yongqin Liu <yongqin.liu@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Fabio Estevam <festevam@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, NXP Linux Team <linux-imx@nxp.com>, 
	spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-mips@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, 
	John Stultz <jstultz@google.com>, freedreno@lists.freedesktop.org, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 10:52=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
> > Hello,
> >
> > while I debugged an issue in the imx-lcdc driver I was constantly
> > irritated about struct drm_device pointer variables being named "dev"
> > because with that name I usually expect a struct device pointer.
> >
> > I think there is a big benefit when these are all renamed to "drm_dev".
> > I have no strong preference here though, so "drmdev" or "drm" are fine
> > for me, too. Let the bikesheding begin!
> >
> > Some statistics:
> >
> > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | un=
iq -c | sort -n
> >       1 struct drm_device *adev_to_drm
> >       1 struct drm_device *drm_
> >       1 struct drm_device          *drm_dev
> >       1 struct drm_device        *drm_dev
> >       1 struct drm_device *pdev
> >       1 struct drm_device *rdev
> >       1 struct drm_device *vdev
> >       2 struct drm_device *dcss_drv_dev_to_drm
> >       2 struct drm_device **ddev
> >       2 struct drm_device *drm_dev_alloc
> >       2 struct drm_device *mock
> >       2 struct drm_device *p_ddev
> >       5 struct drm_device *device
> >       9 struct drm_device * dev
> >      25 struct drm_device *d
> >      95 struct drm_device *
> >     216 struct drm_device *ddev
> >     234 struct drm_device *drm_dev
> >     611 struct drm_device *drm
> >    4190 struct drm_device *dev
> >
> > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> > it's not only me and others like the result of this effort it should be
> > followed up by adapting the other structs and the individual usages in
> > the different drivers.
>
> I think this is an unnecessary change. In drm, a dev is usually a drm
> device, i.e. struct drm_device *. As shown by the numbers above.
>

I'd really prefer this patch (series or single) is not accepted. This
will cause problems for everyone cherry-picking patches to a
downstream kernel (LTS or distro tree). I usually wouldn't expect
sympathy here, but the questionable benefit does not outweigh the cost
IM[biased]O.

Sean

> If folks insist on following through with this anyway, I'm firmly in the
> camp the name should be "drm" and nothing else.
>
>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
