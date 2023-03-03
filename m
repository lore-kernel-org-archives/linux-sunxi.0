Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B638F42
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Mar 2023 19:48:29 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id g3so14794903eda.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Mar 2023 11:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677872908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qr3wWyppk2JO5cvuGc7OJNqcMG2NC5hwXnkMjN+yuLE=;
        b=OkvsXm6O+DKgq2Cm0cj9/9Ymld1YYm/Od/BojtQ89AgEVxKuaxIngigvODLsBn6ZWC
         gTc55f7dTJN2Uv+DQ8v3ytKFc3R/qDOxEpro4Rdz9WQa3PBzoaRLkhul+As3np4pnF7i
         0z7bYfy3QZr6YH8EiMf6f9s1+d6pSmnLDU22lcbQ7l39SkeWZrBlutq86k5S5PAei8Rh
         S4udJtNTGW23As3Q71fDqD34aGKKzp99paxfRT/DFKBkeRxZ34qBryhP7SKfR795WChE
         /ABCdH0PszYFiUYWG6+lHxpHPbAD60iuznx245mxhw8F7PMQMgu7kAUlGE9SaNzmOtQ+
         c1pg==
X-Gm-Message-State: AO0yUKUHPro0bKluJ9mBkzfPEFLrUaT9EIIFaLUz1OJlPSpNYyGpCqwc
	Bh1zASy70w8HAhu22qy4zTlBfd8QYp2AOjbLiOQ=
X-Google-Smtp-Source: AK7set8pOENE3qQdov6OdbnX8NZeqRAuHLeW/9RDr9g861DgXcdaR15YJISLt3N0xGeu3omTus0Ig7L1FfyytK0BbOU=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr1748709edi.6.1677872907622; Fri, 03 Mar
 2023 11:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org> <1d3da42e-2499-7ff6-50fa-048a720e855f@linaro.org>
In-Reply-To: <1d3da42e-2499-7ff6-50fa-048a720e855f@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 3 Mar 2023 20:48:16 +0100
Message-ID: <CAJZ5v0i9fbEpedS-CCM5qvfaG095jUDzOFd-H83G3mpwDaxoAA@mail.gmail.com>
Subject: Re: [PATCH v5 00/18] Self-encapsulate the thermal zone device structure
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amitk@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
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
	Stefan Wahren <stefan.wahren@i2se.com>, Zheng Yongjun <zhengyongjun3@huawei.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Daniel Golle <daniel@makrotopia.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-acpi@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, Mar 3, 2023 at 10:24 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
>
> Hi Rafael,
>
> Do we have enough ack to apply this series, is it for you ?

I've just queued it up for 6.4.

It will reach linux-next and the thermal branch some time next week,
but I will be traveling, so there may be delays.

Thanks!
