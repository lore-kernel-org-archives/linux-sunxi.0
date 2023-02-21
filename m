Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF98492
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Feb 2023 18:22:57 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id ck15so22127501edb.0
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Feb 2023 10:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWBuZuItO82IFqyz0MCKd6UQRtN+LPDLboXi20Lorqc=;
        b=nHxfMRu41wzUAs9PMVxmCTZM+TTzDTKp6U8xb3FCFk8OCHPjt0O/eHNa+0iXdsMjze
         fw0AK2OeVI0wt+Wxrk0mLbc+JHeEo0Y9rAMUnzYHJ45WIA7nS5GmcfYlMhPD6eLhzEbs
         /03ULvS4qjrv80E3qAv72cLm83yyFAV7GckeDgAgU2gOcChGvbgMKYOgJmAtzuMvs8qe
         1rugqInJKPI2dPHXBOjdHpSf3EnfxiXv6rbaXRYMwvxtemLT9NAOzZLO4CQouNdHO1Ny
         EFU2g8Qb6p6UWUDeIED19Oqy6Faq2uJZ18mohAJeGIzW60Vl6EiqtTwe102l/joXzyOs
         w/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWBuZuItO82IFqyz0MCKd6UQRtN+LPDLboXi20Lorqc=;
        b=g89mC2B1R7CAPZ2rHHNgQmqfVaLzuX/OrPdZ0zJvdy3kgCTHIhztkaURuwBE2fyt7I
         Z7S79fjwRvQD6yLTTgE1l+VT6Hw67/3qFRBumulZy2uqtgqkC0vEgKmigUwWXZaQb3aB
         NcMN0th0nCuch5/HhlqezzppfMvwxIqqsf4Un+OkxiU/SvQHCkXGvwAH6hif+yNfXqJQ
         r8q1vLcTn8MB9YT56STy+WEr8B7WwxoRilwWtGuU9AqqGnJyFfC8fOBE9dnIbQB+X8+c
         1QSgfhNvECNwD9vp1UBsMoKpdOKipVEtMimc8payiRwb7d3MrtvRD7Vzryb87jqjluqd
         UWjg==
X-Gm-Message-State: AO0yUKWRxXqW/LYptu5HEc/lU1jC7GrKPuyyyWBY+DjqLw8HqanLcwEV
	3KmoHDHR35IihLhk8g/98n0=
X-Google-Smtp-Source: AK7set9RRyalSHH8Rnrhw+wG3j5tvzZjg2pF8az9E56fflvH6AQziI48YwaJ9r11hqsK2UbALLkZKg==
X-Received: by 2002:a05:6402:35c1:b0:49e:1f0e:e209 with SMTP id z1-20020a05640235c100b0049e1f0ee209mr5617045edc.10.1677003775806;
        Tue, 21 Feb 2023 10:22:55 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i14-20020a50d74e000000b004acbde59e64sm3031509edj.8.2023.02.21.10.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:22:55 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: rafael@kernel.org, daniel.lezcano@linaro.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, Daniel Golle <daniel@makrotopia.org>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 ye xingchen <ye.xingchen@zte.com.cn>, Randy Dunlap <rdunlap@infradead.org>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject:
 Re: [PATCH v2 05/16] thermal/hwmon: Use the right device for
 devm_thermal_add_hwmon_sysfs()
Date: Tue, 21 Feb 2023 19:22:53 +0100
Message-ID: <4462258.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20230221180710.2781027-6-daniel.lezcano@linaro.org>
References:
 <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-6-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 21. februar 2023 ob 19:06:59 CET je Daniel Lezcano napisal(a):
> The devres variant of thermal_add_hwmon_sysfs() only takes the thermal
> zone structure pointer as parameter.
> 
> Actually, it uses the tz->device to add it in the devres list.
> 
> It is preferable to use the device registering the thermal zone
> instead of the thermal zone device itself. That prevents the driver
> accessing the thermal zone structure internals and it is from my POV
> more correct regarding how devm_ is used.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> #amlogic_thermal ---
>  drivers/thermal/amlogic_thermal.c                  | 2 +-
>  drivers/thermal/imx8mm_thermal.c                   | 2 +-
>  drivers/thermal/imx_sc_thermal.c                   | 2 +-
>  drivers/thermal/k3_bandgap.c                       | 2 +-
>  drivers/thermal/mediatek/auxadc_thermal.c          | 2 +-
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c           | 2 +-
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c        | 2 +-
>  drivers/thermal/qcom/tsens.c                       | 2 +-
>  drivers/thermal/qoriq_thermal.c                    | 2 +-
>  drivers/thermal/sun8i_thermal.c                    | 2 +-

For sun8i_thermal:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/thermal/tegra/tegra30-tsensor.c            | 2 +-
>  drivers/thermal/thermal_hwmon.c                    | 4 ++--
>  drivers/thermal/thermal_hwmon.h                    | 4 ++--
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
>  14 files changed, 16 insertions(+), 16 deletions(-)



