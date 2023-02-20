Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3046233EF
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Feb 2023 12:19:12 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id l12so478774qtr.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Feb 2023 04:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Re6NLj3mYWi/PS1iVcG93D07BAspc2CGyOXyoSaH5I=;
        b=o6jb71boFcgPgkzMtf1baLWpcvpferwVNN01umJxmQG4XWVwve+Sb8VE6hXwREsJm6
         EFHEFIeV3PVh3JkAc+90zzHamXnfm5o6REB2731ioBf5x+FHw0kLsHA5QZ33sWYPiCTx
         I5rubBRmLIztX+hTqFKkafRIykPfy/3qbI8WA1QAUIvBIBnCHfW2bAdEuHSaHIoceH6l
         0fPfKChfs7v3lGvHpmF0r/kmgXsWNlN0NbPMLAKMSEKhlvGOWyVRKowj7bNo8N2DQouu
         uhl6sZi5xX3cfXACT4OTR+YWuvB9/DjUJ/R6qMifispmq7p4fc1uJyGF0pHRnnLY3NRT
         2cSw==
X-Gm-Message-State: AO0yUKXe23nBMhUB6fvGYeIYqAkRfzqATbf7Ie00AMdHy2/fmcutuDT6
	1dmn6azToVAImXobDFXKrU8n5KP/LdpoKA==
X-Google-Smtp-Source: AK7set8rewBqLRRmHxNOACVGSACCwwlSiJ/zn9GSFnJhkSOvHE5rBw93xuvQ+13WG6bMDhX8kxA9KA==
X-Received: by 2002:ac8:5951:0:b0:3b8:6c8e:4f8d with SMTP id 17-20020ac85951000000b003b86c8e4f8dmr1629453qtz.68.1676895551092;
        Mon, 20 Feb 2023 04:19:11 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id x1-20020ac81201000000b003b9b41a32b7sm8663486qti.81.2023.02.20.04.19.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 04:19:11 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id z95so590536ybh.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Feb 2023 04:19:10 -0800 (PST)
X-Received: by 2002:a81:8606:0:b0:52e:e6ed:308e with SMTP id
 w6-20020a818606000000b0052ee6ed308emr1847623ywf.526.1676895529736; Mon, 20
 Feb 2023 04:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
 <20230219143657.241542-2-daniel.lezcano@linaro.org> <OS3PR01MB8460E7C2D1F9EEEDDC579FFEC2A49@OS3PR01MB8460.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB8460E7C2D1F9EEEDDC579FFEC2A49@OS3PR01MB8460.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Feb 2023 13:18:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFn+LbKE=77mRBfGqSu3x5qsk3X-pQVeu3uZXEejyRRg@mail.gmail.com>
Message-ID: <CAMuHMdWFn+LbKE=77mRBfGqSu3x5qsk3X-pQVeu3uZXEejyRRg@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] thermal/core: Add a thermal zone 'devdata' accessor
To: DLG Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raju Rangoju <rajur@chelsio.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Gregory Greenman <gregory.greenman@intel.com>, 
	Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Amit Kucheria <amitk@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	ye xingchen <ye.xingchen@zte.com.cn>, Zheng Yongjun <zhengyongjun3@huawei.com>, 
	Tim Zimmermann <tim@linux4.de>, Yang Li <yang.lee@linux.alibaba.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Jiang Jian <jiangjian@cdjrlc.com>, 
	Daniel Golle <daniel@makrotopia.org>, Balsam CHIHI <bchihi@baylibre.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	"open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>, 
	"open list:INTEL WIRELESS WIFI LINK (iwlwifi)" <linux-wireless@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adam,

On Mon, Feb 20, 2023 at 12:14 PM DLG Adam Ward
<DLG-Adam.Ward.opensource@dm.renesas.com> wrote:
> On 19/02/23 14:37, Daniel Lezcano wrote:
> >The thermal zone device structure is exposed to the different drivers and obviously they access the internals while that should be restricted to the core thermal code.
> >
> >In order to self-encapsulate the thermal core code, we need to prevent the drivers accessing directly the thermal zone structure and provide accessor functions to deal with.
> >
> >Provide an accessor to the 'devdata' structure and make use of it in the different drivers.
> >No functional changes intended.
> >
> >Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >---
>
> >drivers/thermal/da9062-thermal.c                 |  2 +-
>
> For da9062:
>
> Reviewed-by: Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>

Looks like Daniel has found the new Dialog maintainer he was looking
for? Time to update MAINTAINERS?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
