Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E23011C93
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 14:27:14 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-666e916b880so1194023b3a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 07:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687184833; x=1689776833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFntx4YXgadpDVJ2Ga1nOHhwiQ9Nxhf2XabKx8SJuMo=;
        b=hWga5hPAOH+AqDiF00Oi53sg7cpq15Hjmi8I4FNpjIWdW7BbOTxDiS8vsn1kN3k5yc
         j/OuJaGeQW1jTvk8WtcuKv51g3olBTQbMXA9GMol7p1Ksp/lJ2lLv2iF9rgJIMtxW3j/
         DpxDKzRPaaqaUEVssu0PFHhqyL8Htd+jii60IhJz2+z/cXjpIPKpuxupYf5EfuigwBb9
         EosCry9G0FHdVby5FWh8GJWgx3wKYAwmGuJTmLT6MH2J9Xr/JkVyEwnY7tYrZ73eN2rz
         Z57uuMAwQkhCVCNRsT6MlOHFYfbmphUCMc/J+ll7kDqpwepiXmR25z9KQmkPpePH3o9g
         rv8w==
X-Gm-Message-State: AC+VfDzmjWhOf6XxVK2aL8JHDTMPVkqkReAvyvVPUqx4vc01SKJ0uQJC
	2AwxRP6ifVUb+6vptMsb5wsBBOJpL3lEyJje
X-Google-Smtp-Source: ACHHUZ7Uoi4osIFd39YEzlN6wx4tJrH1ArF887f+gVHPfV6p7REVZ9BLEwx7H1xq0TDz/1SHuPTlfg==
X-Received: by 2002:a05:6a20:1589:b0:11d:322a:ce34 with SMTP id h9-20020a056a20158900b0011d322ace34mr1067853pzj.31.1687184833380;
        Mon, 19 Jun 2023 07:27:13 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id l3-20020a170903244300b001ae4d4d2676sm1799611pls.269.2023.06.19.07.27.12
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 07:27:13 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b52bf6e66aso14445135ad.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 07:27:12 -0700 (PDT)
X-Received: by 2002:a5b:88e:0:b0:ba8:33d9:b583 with SMTP id
 e14-20020a5b088e000000b00ba833d9b583mr987140ybq.13.1687184427316; Mon, 19 Jun
 2023 07:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de> <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de> <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de> <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de> <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
 <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com> <vegkiv4puxederjvonyyqsg4j5swpi2h7ttg7ng6gq2tibk4gy@afa5vexshp7q>
In-Reply-To: <vegkiv4puxederjvonyyqsg4j5swpi2h7ttg7ng6gq2tibk4gy@afa5vexshp7q>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2023 16:20:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXf5Pao+Fjf42iRV_iMFEcb+F=s09NG+mudB-L5wWF_OA@mail.gmail.com>
Message-ID: <CAMuHMdXf5Pao+Fjf42iRV_iMFEcb+F=s09NG+mudB-L5wWF_OA@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To: Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Raymond Tan <raymond.tan@intel.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Linus Walleij <linus.walleij@linaro.org>, 
	dri-devel@lists.freedesktop.org, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Samuel Holland <samuel@sholland.org>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Danilo Krummrich <dakr@redhat.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, 
	Rahul T R <r-ravikumar@ti.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>, 
	Inki Dae <inki.dae@samsung.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>, 
	Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de, 
	Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, 
	John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>, 
	Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org, 
	Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>, 
	linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Wang Jianzheng <wangjianzheng@vivo.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Brian Starkey <brian.starkey@arm.com>, 
	Karol Herbst <kherbst@redhat.com>, Miaoqian Lin <linmq006@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Michal Simek <michal.simek@xilinx.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>, 
	nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Christian Gmeiner <christian.gmeiner@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, 
	Karol Wachowski <karol.wachowski@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Doug Anderson <dianders@chromium.org>, 
	Liu Shixin <liushixin2@huawei.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laura Nao <laura.nao@collabora.com>, 
	David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org, 
	Yongqin Liu <yongqin.liu@linaro.org>, Jayshri Pawar <jpawar@cadence.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Russell King <linux@armlinux.org.uk>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Qiang Yu <yuq825@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>, 
	linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org, 
	Rob Clark <robdclark@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Mon, Jun 19, 2023 at 4:02=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Jun 19, 2023 at 03:25:28PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jun 19, 2023 at 2:51=E2=80=AFPM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Mon, Jun 19, 2023 at 12:53:42PM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > On Mon, Jun 19, 2023 at 11:45:37AM +0200, Maxime Ripard wrote:
> > > > > On Sun, Jun 18, 2023 at 06:29:50PM +0200, Uwe Kleine-K=C3=B6nig w=
rote:
> > > > > > On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> > > > > > > On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6n=
ig wrote:
> > > > > > > > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wro=
te:
> > > > > > > > > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=
=B6nig
> > > > > > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > > > > > Together with the patches that were applied later the t=
opmost commit
> > > > > > > > > > from this series is c2807ecb5290 ("drm/omap: Convert to=
 platform remove
> > > > > > > > > > callback returning void"). This commit was part for the=
 following next
> > > > > > > > > > tags:
> > > > > > > > > >
> > > > > > > > > >         $ git tag -l --contains c2807ecb5290
> > > > > > > > > >         next-20230609
> > > > > > > > > >         next-20230613
> > > > > > > > > >         next-20230614
> > > > > > > > > >         next-20230615
> > > > > > > > > >
> > > > > > > > > > However in next-20230616 they are missing. In next-2023=
0616
> > > > > > > > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b9863928=
6700a35088660.
> > > > > > > > > > Compared to c2807ecb5290 this adds 1149 patches but dro=
ps 37 (that are
> > > > > > > > > > also not included with a different commit id). The 37 p=
atches dropped
> > > > > > > > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5=
290:
> > > > > > > > > >
> > > > > > > > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048f=
cb4384aa9dc..c2807ecb5290
> > > > > > > > > >              1  Christophe JAILLET
> > > > > > > > > >              2  Jessica Zhang
> > > > > > > > > >              5  Karol Wachowski
> > > > > > > > > >              1  Laura Nao
> > > > > > > > > >             27  Uwe Kleine-K=C3=B6nig
> > > > > > > > > >              1  Wang Jianzheng
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I guess this was done by mistake because nobody told me=
 about dropping
> > > > > > > > > > my/these patches? Can c2807ecb5290 please be merged int=
o drm-misc-next
> > > > > > > > > > again?
> > > > > > > > >
> > > > > > > > > Actually, it was probably a mistake that these patches go=
t merged to
> > > > > > > > > linuxnext during the 4 days that you noticed. However, yo=
ur patches
> > > > > > > > > aren't dropped and are still present in drm-misc-next.
> > > > > > > > >
> > > > > > > > > drm-misc has a bit of a unique model and it's documented =
fairly well here:
> > > > > > > > >
> > > > > > > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-mi=
sc.html
> > > > > > > >
> > > > > > > > Is there a flaw then in this unique model (or its implement=
ation) when
> > > > > > > > drm-misc/for-linux-next moves in a non-fast-forward manner?=
 This isn't
> > > > > > > > expected, is it?
> > > > > > >
> > > > > > > There's no expectation afaik. Any tree merged in linux-next c=
an be
> > > > > > > rebased, drop a patch, amend one, etc. without any concern.
> > > > > >
> > > > > > I agree that there are no rules broken for a tree that is inclu=
ded in
> > > > > > next and a maintainer is free to rewrite their tree independant=
 of the
> > > > > > tree being included in next.
> > > > > >
> > > > > > Still I think that shouldn't be used as an excuse.
> > > > >
> > > > > As an excuse for what?
> > > >
> > > > Just because the rules for trees in next allow the merged branch to=
 be
> > > > rewritten, shouldn't be used to justify rewriting the branch.
> > > >
> > > > IMHO you still should ensure that only commits make it into any nex=
t
> > > > snapshot via your tree before X-rc1 for some X (e.g. v6.5) that you
> > > > intend to be included in X-rc1.
> > >
> > > That's never been a next rule either. Rust support has been in next f=
or
> > > almost a year without being sent as a PR for example.
> >
> > https://elixir.bootlin.com/linux/latest/source/Documentation/process/2.=
Process.rst#L297
> >
> >    "The linux-next tree is, by design, a snapshot of what the mainline
> >     is expected to look like after the next merge window closes."
> >
> > The general rule for linux-next is that its contents are intended to en=
d
> > up in the next kernel release, and that it should not contain commits
> > that are intended for the next-next release, cfr. what Stephen sends
> > out to new trees:
> >
> >    "You will need to ensure that the patches/commits in your tree/serie=
s have
> >     been:
> >             [...]
> >          * destined for the current or next Linux merge window."
> >
> > and what he requests regularly in his announces, e.g.:
> >
> >    "Please do not add any v6.4 related commits to your linux-next inclu=
ded
> >     branches until after v6.3-rc1 has been released."
>
> Which is why those patches aren't in next anymore.

So why were they in linux-next before?
Was this a genuine mistake (things happen), or is there process
or tooling to improve?

> > AFAIU, the exception to the rule is new, self-contained, and sometimes
> > controversial development, which may have to cook for a few more cycles=
,
> > if it ends up in a PR at all.
> >
> > > > > > For me, if a maintainer puts some patch into next that's a stat=
ement
> > > > > > saying (approximately) "I think this patch is fine and I intend=
 to
> > > > > > send it to Linus during the next merge window.".
> > > > >
> > > > > I mean, that's what we're saying and doing?
> > > >
> > > > No, on 2023-06-09 I assumed that my patches will go into v6.5-rc1 (=
as it
> > > > was part of next-20230609). A few days later however the patches we=
re
> > > > dropped.
> > > >
> > > > The two options that would have made the experience smoother for me=
 are:
> > > >
> > > >  a) keep c2807ecb5290 in next and send it for v6.5-rc1; or
> > >
> > > That's not an option. You were simply too late for v6.5-rc1, unless y=
ou
> > > expect us to get rid of timezones and work on week-ends. But surely y=
ou
> > > don't.
> >
> > I don't think anyone expects you to do that...
> >
> > > >  b) keep c2807ecb5290 in a branch that doesn't result it entering n=
ext
> > > >     before v6.5-rc1.
> > >
> > > All the drm-misc committers use dim. If that's a concern for you, fee=
l
> > > free to send a patch addressing this to dim.
> >
> > So you say this is an issue with the tooling? ;-)
> > If the tooling breaks the rules, perhaps the tooling should be fixed?
>
> We've been using dim for more than 5 years. It doesn't seem to work too b=
ad?

I don't know anything about dim, so I cannot commit on that.

> And it does feel like the goalposts are moving there: the discussion
> started by "you shouldn't rebase a tree" and is now at "patches should
> never be in a next branch if they can't reach the next merge window,
> even though it's not apparent yet"

There is no such anti-rebasing rule for linux-next.
Some branches and some subsystems do have a non-rebasing rule,
but that's not applicable here, AFAIU.

Besides, won't you have to rebase the remaining commits from
drm-misc-next on top of v6.5-rc1 anyway later?

> But yeah, I now that complaining about how much drm-misc sucks is fun
> and all, but it's still not clear to me what a potential solution to
> this would be?

I'm so glad I'm not the one making personal attacks on drm-misc ;-)

> Knowing that we can't rebase or close drm-misc-next, and that it should
> be automated in dim somehow, what would that fix be?

Again, I don't know what dim does.
But I think the solution involves not merging anything in drm-next
if there is reason to believe it won't make the next merge window
(in this case: when it is applied to drm-misc-next after the cut-off point)=
.

Personally, I use foo-for-vX.Y branches.  Despite some of my
foo-for-v6.6 branches already having new commits, I just hold off
merging any of them in a for-next branch until after v6.5-rc1.

Thanks!

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
