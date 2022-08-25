Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF04C74
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 21:25:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so3153223wmb.4
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 14:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nls6DGbfFRAP957pxJ4lCmbOvdtMF+yoGyK/eIAHqyg=;
        b=dlpbM58i2Zl35pjmx5L7mRNtdc5YCm71F9sFmlELYER6ov9p1Zhw7Uryp66w+fECkw
         uWkzwI4ANxiJqV2NAH5qiBvSocnn8gCiQ2esbEPyK9VfrLMG6MP+UW57WsLhfQeb18Xm
         ywTHy3WQy2y0FYikqc1VoN0s6VRtWmBPqvQ7ayhaGh2a543N2UKdV/DJLzBcZZCckZJ6
         ioibCRuSXHClGOmbzN9j5ra8iRima6daMxIf45aGXMyoGgBcf5Q8AplMooQ7YxG8j1KJ
         +wVv5gF0Swo9gXi4Wnksh6Jhf6DtKC3uqCuZv3IfpxDnq0EW8o52F4JCeA7KQe1HLfXz
         RrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nls6DGbfFRAP957pxJ4lCmbOvdtMF+yoGyK/eIAHqyg=;
        b=OgMfTmPiU+eYJBBmr5LMReZWrOiMHIf7Ezbv6ku8/oOOnEUChHfLEvmlNz+eWe4VZa
         o8wf1yh8hOeVlLUAZJkJit9BSEsvG7duohdilx4J8B2h1AIykdPC7uIae7WnE2Q9TPvq
         +UMsA1dO3xEDGF1qVaT113DUcTP9DNHXQmNqpjoHgbgHYdwXUt/QS2HUpAVHZPhBMMZV
         une67ZVK0e/lUVeLimGm6AOJ8XvNMOYN89GIgf24in64GZ6pjV3yXtZjQBDHZ93DvbYm
         tg6ENCQloCZBcZ9yj6Nti/CsJvps2ao5KxCvT61+i1eTdIkNHgzSeJg50SXdttteGm2/
         QiCQ==
X-Gm-Message-State: ACgBeo2QkJo3CxR8gtyBiqgY8RwphuJM7dlM9MCatNeJnZGExq2YXomM
	qJenpPu9HMavWsS35ciuvUI=
X-Google-Smtp-Source: AA6agR4u4BAmHRat5LFEkPb1QUEY6oOp43RCL7jbGC6PWwiKhCvUcU/tuSQkwukDJ89Tw4ddFY+90Q==
X-Received: by 2002:a05:600c:b47:b0:3a5:a431:ce36 with SMTP id k7-20020a05600c0b4700b003a5a431ce36mr3484083wmr.89.1661462735769;
        Thu, 25 Aug 2022 14:25:35 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b003a64f684704sm7324411wmq.40.2022.08.25.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:25:35 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, lars@metafoo.de, 
	Eugeniy.Paltsev@synopsys.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, daniel@zonque.org, 
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org, 
	bjorn.andersson@linaro.org, konrad.dybcio@somainline.org, 
	alim.akhtar@samsung.com, green.wan@sifive.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, wens@csie.org, samuel@sholland.org, 
	ldewangan@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com, 
	peter.ujfalusi@gmail.com, michal.simek@xilinx.com, tony@atomide.com, 
	trix@redhat.com, radhey.shyam.pandey@xilinx.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] dmaengine: drivers: Use devm_platform_ioremap_resource()
Date: Thu, 25 Aug 2022 23:25:33 +0200
Message-ID: <1922204.usQuhbGJ8B@kista>
In-Reply-To: <20220820130925.589472-1-tudor.ambarus@microchip.com>
References: <20220820130925.589472-1-tudor.ambarus@microchip.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 20. avgust 2022 ob 15:09:25 CEST je Tudor Ambarus napisal(a):
> platform_get_resource() and devm_ioremap_resource() are wrapped up in the
> devm_platform_ioremap_resource() helper. Use the helper and get rid of the
> local variable for struct resource *. We now have a function call less.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/dma/bcm2835-dma.c                      |  4 +---
>  drivers/dma/dma-axi-dmac.c                     |  4 +---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  4 +---
>  drivers/dma/fsl-edma.c                         |  8 +++-----
>  drivers/dma/fsl-qdma.c                         | 10 +++-------
>  drivers/dma/idma64.c                           |  4 +---
>  drivers/dma/img-mdc-dma.c                      |  4 +---
>  drivers/dma/imx-dma.c                          |  4 +---
>  drivers/dma/imx-sdma.c                         |  4 +---
>  drivers/dma/mcf-edma.c                         |  5 +----
>  drivers/dma/mediatek/mtk-hsdma.c               |  4 +---
>  drivers/dma/mmp_pdma.c                         |  4 +---
>  drivers/dma/mmp_tdma.c                         |  4 +---
>  drivers/dma/moxart-dma.c                       |  4 +---
>  drivers/dma/mv_xor_v2.c                        |  7 ++-----
>  drivers/dma/mxs-dma.c                          |  4 +---
>  drivers/dma/nbpfaxi.c                          |  4 +---
>  drivers/dma/pxa_dma.c                          |  4 +---
>  drivers/dma/qcom/bam_dma.c                     |  4 +---
>  drivers/dma/s3c24xx-dma.c                      |  4 +---
>  drivers/dma/sf-pdma/sf-pdma.c                  |  4 +---
>  drivers/dma/sh/usb-dmac.c                      |  4 +---
>  drivers/dma/stm32-dma.c                        |  4 +---
>  drivers/dma/stm32-dmamux.c                     |  4 +---
>  drivers/dma/stm32-mdma.c                       |  4 +---
>  drivers/dma/sun4i-dma.c                        |  4 +---
>  drivers/dma/sun6i-dma.c                        |  4 +---

For sun4i-dma.c and sun6i-dma.c:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/dma/tegra210-adma.c                    |  4 +---
>  drivers/dma/ti/cppi41.c                        | 10 +++-------
>  drivers/dma/ti/omap-dma.c                      |  4 +---
>  drivers/dma/xilinx/zynqmp_dma.c                |  4 +---
>  31 files changed, 38 insertions(+), 106 deletions(-)



