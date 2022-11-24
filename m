Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C472D23A0
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Nov 2022 08:14:03 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id r8so1135010ljn.8
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Nov 2022 00:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeUefraTLOsYVw9xLhjc2jCiF4qkVOolmQaF127DKVk=;
        b=PAL/4lgO3qwcAfVMsmymoQQ9m3TeqyOkDETk9KBNX6z/o9HLwn8RaXvTDlHWiBBDvg
         atY0ccAGfcCtVElHLwQsrm0QhHkHvKqJqM7RMLGPIFIPWuhF0QyVvPm9wRCzT9iCxASw
         LN5V+FcWg/SEJM7UxqmH+AYRIOqBhulcXZfzgGab0XACfOxuhyQKNDmHdtNHKaj/8Zfl
         FplfjNLMeze2dGtr55IUGmbCnmpZu5oViaQ4LvbS85ZhO261UmBzZe6bsie2P1qRpMeU
         ZCqIYWK6+QBAocMAgO6/neFsIvtKZ8dEs27C22xWp0mQ/KCBXyWacaXLkPM597S1fqZP
         NN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeUefraTLOsYVw9xLhjc2jCiF4qkVOolmQaF127DKVk=;
        b=WRmm1CIKmSFxVHSXQMKnf7R7UyNDVWDchoEPSpZ7VAZXMQPHJcZ4m4wMzsBaDS1O2U
         dfiIUhCmy+3JGId6pgaIcBSeER6i/sV1wfA237whuaGACqj/h9JYt5bBxlh0yob2ddDK
         HiqzkZK+kpDNB7vMXZ0dXyNDC99CuvwQqRH82DPCBAQeu6Cfe1vY9MNDJhmTV2qEWE4D
         3Rk5WIuDi2Hw729I6rYOxIQBCBzyh4MelL+0R3PSlPzOZ5yITmKvOsNaAiLLIyTr300l
         6zmooHLKGPD3tOr1Y9hX/zToPf7U7ESNR6Hl5v2eLo7xIB3Syg1cIlLllkG7Rx3l8Rxw
         17tA==
X-Gm-Message-State: ANoB5pkg3tzZ0+t7aBOIzkVCH9U9qDC8EpTlR3iwDaJ9KdIRzFf7WIdP
	pnz+Ya++HeomOUZBYroPkDw=
X-Google-Smtp-Source: AA0mqf6hK0Yfc6U0TtdSmI9ZQLi93h7zpR/we4ftZe8kBmfGIWxQNqL4Gq2HZFwudP2QWyuNPdZNhg==
X-Received: by 2002:a2e:c52:0:b0:277:9bf:9411 with SMTP id o18-20020a2e0c52000000b0027709bf9411mr4006863ljd.504.1669277641653;
        Thu, 24 Nov 2022 00:14:01 -0800 (PST)
Received: from ?IPV6:2001:999:485:946b:e412:ce24:16c6:ba10? ([2001:999:485:946b:e412:ce24:16c6:ba10])
        by smtp.gmail.com with ESMTPSA id p12-20020ac24ecc000000b0049a5a59aa68sm52803lfr.10.2022.11.24.00.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:14:01 -0800 (PST)
Message-ID: <b2a00199-fccf-5887-1029-99f9e7e55e7f@gmail.com>
Date: Thu, 24 Nov 2022 10:15:11 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] dmaengine: drivers: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@microchip.com>, vkoul@kernel.org
Cc: f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, lars@metafoo.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 green.wan@sifive.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, ldewangan@nvidia.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, michal.simek@xilinx.com, tony@atomide.com,
 krzysztof.kozlowski@linaro.org, trix@redhat.com,
 radhey.shyam.pandey@xilinx.com, shravya.kumbham@xilinx.com,
 harini.katakam@xilinx.com, swati.agarwal@amd.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, ye.xingchen@zte.com.cn, quic_mojha@quicinc.com
References: <20221110152528.7821-1-tudor.ambarus@microchip.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20221110152528.7821-1-tudor.ambarus@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/11/2022 17:25, Tudor Ambarus wrote:
> platform_get_resource() and devm_ioremap_resource() are wrapped up in the
> devm_platform_ioremap_resource() helper. Use the helper and get rid of the
> local variable for struct resource *. We now have a function call less.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
> v3:
> - fix errors reported-by lkp@intel.com
> - lkp@intel.com built successfully few configs, all should be good now.
> 
> v2:
> - rebase on dma/next. s3c24xx was removed, thus drop the changes for it.
> - collect Acked-by
> 
>   drivers/dma/bcm2835-dma.c                      |  4 +---
>   drivers/dma/dma-axi-dmac.c                     |  4 +---
>   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  4 +---
>   drivers/dma/fsl-edma.c                         |  8 +++-----
>   drivers/dma/fsl-qdma.c                         | 10 +++-------
>   drivers/dma/idma64.c                           |  4 +---
>   drivers/dma/img-mdc-dma.c                      |  4 +---
>   drivers/dma/imx-dma.c                          |  4 +---
>   drivers/dma/imx-sdma.c                         |  4 +---
>   drivers/dma/mcf-edma.c                         |  5 +----
>   drivers/dma/mediatek/mtk-hsdma.c               |  4 +---
>   drivers/dma/mmp_pdma.c                         |  4 +---
>   drivers/dma/mmp_tdma.c                         |  4 +---
>   drivers/dma/moxart-dma.c                       |  4 +---
>   drivers/dma/mv_xor_v2.c                        |  7 ++-----
>   drivers/dma/mxs-dma.c                          |  4 +---
>   drivers/dma/nbpfaxi.c                          |  4 +---
>   drivers/dma/pxa_dma.c                          |  4 +---
>   drivers/dma/qcom/bam_dma.c                     |  4 +---
>   drivers/dma/sf-pdma/sf-pdma.c                  |  4 +---
>   drivers/dma/sh/usb-dmac.c                      |  4 +---
>   drivers/dma/stm32-dmamux.c                     |  4 +---
>   drivers/dma/stm32-mdma.c                       |  4 +---
>   drivers/dma/sun4i-dma.c                        |  4 +---
>   drivers/dma/sun6i-dma.c                        |  4 +---
>   drivers/dma/tegra210-adma.c                    |  4 +---
>   drivers/dma/ti/cppi41.c                        | 10 +++-------
>   drivers/dma/ti/omap-dma.c                      |  4 +---

For omap-dma:
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

>   drivers/dma/xilinx/zynqmp_dma.c                |  4 +---
>   29 files changed, 36 insertions(+), 100 deletions(-)
> -- 
Péter
