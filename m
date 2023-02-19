Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C7210F
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Feb 2023 14:56:39 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id w6so198893ilv.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Feb 2023 06:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRWzUiIkZMN/8VwTf3/WG02TOz303pOTBThE0ISU9KA=;
        b=OBp/XQAU5Q471JJAcxBMgqa6dD4Dp32mVwrDrvC1tRuFffnp8TdtHAw/E8heX1RCnn
         mZ0zJ/aWl+G8TXYcKZuS0Gx/77yQV9MyRVZhYGfgTIwQgi1f+S7jIWw21vvn+0IyeUFX
         rdGxpxTfynV5AOlzLbnmYCLi82W9sEgiqT7rTWjNkuCAl/kE3OPW30GwGFZqwI+/03tU
         y7wSgIhnwQY0CXiY+UKDIT1n/bfXzXdmCFVT9lWQ/dd9grtj5iw3PduSsmfni1mS1tZT
         HOvxd60YwrOlZZkXi8ODkZ40ZdpjvMDWGoKx4Vf2pWX9kbUlwTVQq817YlKAqQz5NLhr
         k9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRWzUiIkZMN/8VwTf3/WG02TOz303pOTBThE0ISU9KA=;
        b=ubz23kKvD+xCAA9D7mkrCQk18AnKEz/56RewvOYQf/JWEISPA5qja88mWTolHhtcmD
         T0MxYtLXiCfdW/+XAf5NzK7bZKonRp9GY+/FR8e1BUO8vOPrt/QCyEreBRnZ5xBhpRJ+
         PbbL3nIzd7LInz9JtlTQdsYfM2u/DPTnjrrBCv6usrsbCEMZyTqWkodp/BdUvPbYdDGu
         XQPmkDUAlNXfLFCPTesjld1QlrRPHZcHijt28ojS3HXUNd3qgpARH0mEpPGRjXw5zZsU
         kzNyF1ZXLLMfO9mhjWdYyw+RIPlZNRzxNmSE+H0JlD3P/yWdq8R5Wrvj/A9UhbTfXPsZ
         g7fg==
X-Gm-Message-State: AO0yUKUzDMQ10T1CJ9TevvH5RNBVaxY/cCaVHk6F+1rLFdgtAxPgrN1d
	7Bbt/bYxFU19Q309fDGU17k=
X-Google-Smtp-Source: AK7set/tBdHvgZ9GFY6tgVICfvLzFe6RtqLrm+n2c8aFQ5ip61CmdhaCQUFruBwYDgn3guOUu59kmw==
X-Received: by 2002:a92:1a41:0:b0:315:4350:9c09 with SMTP id z1-20020a921a41000000b0031543509c09mr1511617ill.16.1676818598543;
        Sun, 19 Feb 2023 06:56:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c8-20020a92cf08000000b003153cdd03a3sm501663ilo.61.2023.02.19.06.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 06:56:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Feb 2023 06:56:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kucheria <amitk@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Talel Shenhar <talel@amazon.com>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zheng Yongjun <zhengyongjun3@huawei.com>,
	Tim Zimmermann <tim@linux4.de>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Jiang Jian <jiangjian@cdjrlc.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
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
Subject: Re: [PATCH v1 01/17] thermal/core: Add a thermal zone 'devdata'
 accessor
Message-ID: <20230219145636.GB4084160@roeck-us.net>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
 <20230219143657.241542-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219143657.241542-2-daniel.lezcano@linaro.org>

On Sun, Feb 19, 2023 at 03:36:41PM +0100, Daniel Lezcano wrote:
> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
> 
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
> 
> Provide an accessor to the 'devdata' structure and make use of it in
> the different drivers.
> 
> No functional changes intended.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
...
>  drivers/hwmon/hwmon.c                            |  4 ++--
>  drivers/hwmon/pmbus/pmbus_core.c                 |  2 +-
>  drivers/hwmon/scmi-hwmon.c                       |  2 +-
>  drivers/hwmon/scpi-hwmon.c                       |  2 +-

For hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
