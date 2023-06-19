Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9C7D2F8
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 15:17:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f90a7325f6so22548975e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687187842; x=1689779842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2BCqWZdnOgJLi1yS8YB0jgtq7UEXjCvPUI8CflkrIM=;
        b=fcoarEbtF5e7jxTOdi2dHyVdAjhYmhluM3IFzimhgMrW9R2daBbBYONDuB/o0J7YOr
         bYoFkt5eSY/Qihi9kxiUYuqaZKwp6C/9xXf69fScIaGVS4gjGSSOvIOa3jTRTzaSwqgo
         2gaZezk7u5fR7Kg509bBrm6W/dGDLiGwmt92XSnrUpruNV7ERRTZMtx4PpTBz5mWAvXH
         E6WXnT/ZBDfu65fZkld2fRZj1Frr4AmlNFoCLHOgMTJ+7yEUexlom1z70/90A4OAA2Yh
         NSvi3RBD5Ebu0ss9+0SIJSPmMzhVizmHebLSUqHuIeomQXmB+2xsS8oMi2Q6cDaymSv0
         1KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187842; x=1689779842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2BCqWZdnOgJLi1yS8YB0jgtq7UEXjCvPUI8CflkrIM=;
        b=I5ABkPj88lWSVaqsy1GyR9QE70W6b/DJVLVo+IJoDiqMyXrpXev75DR/nMvMg32Euq
         jTxgLoVZHFoPIQ6fjUtFTeK5vRs5AzLwpPC2Ctrau3zqr9CnlRC2Rde9LYSrR12zBIvy
         CaQeLFNY1n5B79+pihCp9Okj9OWG6dVxQmsJXNH82oKOq1ToXNgBCNTv17ITprpJzhpS
         XKbtdGDO2G+Vo5m3IBEPMXSyttApZD/fqRHrFNbiFU7foiYcVNdwvkWqRGMZJvBkYY7s
         +fJ8jl+09DpqydnkCRCJYOGkloubv37Kn3cWI4WhGX8rsMfLUed3b7Nq7PsLKol5WrwV
         fbCQ==
X-Gm-Message-State: AC+VfDwhmCUL98RK9Af/l+vmKWAdvpFHPi2/aAEbDbgNtRm0ZGQesZBy
	qWCRNUzwt6pSICR05bUNq54=
X-Google-Smtp-Source: ACHHUZ7K5Wzb9tlqACcOU9KMrL7nII5/kQ/ZHVCVs95ZpIEDFwh9jxtGKtIzb9hQmQ6Nf+bJZPS2NA==
X-Received: by 2002:a7b:ce14:0:b0:3f9:7a15:1716 with SMTP id m20-20020a7bce14000000b003f97a151716mr3720485wmc.5.1687187842081;
        Mon, 19 Jun 2023 08:17:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d43d2000000b0030ae93bd196sm31712456wrr.21.2023.06.19.08.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 08:17:21 -0700 (PDT)
Message-ID: <91db8e7b-29fb-3c43-ac38-008ebc9b1f6b@gmail.com>
Date: Mon, 19 Jun 2023 17:17:18 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 11/12] thermal/drivers/generic-adc: Register thermal
 zones as hwmon sensors
Content-Language: en-US, ca-ES, es-ES
To: Yangtao Li <frank.li@vivo.com>, glaroque@baylibre.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, thara.gopinath@gmail.com,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 anarsoul@gmail.com, tiny.windzz@gmail.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, edubezval@gmail.com, j-keerthy@ti.com,
 angelogioacchino.delregno@collabora.com, bchihi@baylibre.com,
 niklas.soderlund+renesas@ragnatech.se, wenst@chromium.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230613114904.15749-1-frank.li@vivo.com>
 <20230613114904.15749-11-frank.li@vivo.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230613114904.15749-11-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2023 13:49, Yangtao Li wrote:
> From: Chen-Yu Tsai <wenst@chromium.org>
> 
> Register thermal zones as hwmon sensors to let userspace read
> temperatures using standard hwmon interface.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> [Yangtao change to use dev_warn and remove return]
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   drivers/thermal/thermal-generic-adc.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
> index 017b0ce52122..9531bc2f2ce7 100644
> --- a/drivers/thermal/thermal-generic-adc.c
> +++ b/drivers/thermal/thermal-generic-adc.c
> @@ -13,6 +13,8 @@
>   #include <linux/slab.h>
>   #include <linux/thermal.h>
>   
> +#include "thermal_hwmon.h"
> +
>   struct gadc_thermal_info {
>   	struct device *dev;
>   	struct thermal_zone_device *tz_dev;
> @@ -153,6 +155,9 @@ static int gadc_thermal_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	if (devm_thermal_add_hwmon_sysfs(&pdev->dev, gti->tz_dev))
> +		dev_warn(&pdev->dev, "Failed to add hwmon sysfs attributes\n");

Isn't that already done by patch 1/12?

Regards,
Matthias

> +
>   	return 0;
>   }
>   
