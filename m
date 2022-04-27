Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC233E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:02:33 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id l18so5234846ejc.7
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nRsrSZUdccGt8LRLTvc1f3066sqUlL3H8wQB+8CbAZM=;
        b=oI3+Pk0O84Q7xhxIXyeolKjcngLs7+jcTCJHTa0ksRxWgXNWFSMxJIA0UmAccbtqA7
         F2VjRBWqGNDcNP6jbMzBuINw/oc5sK1/EZD9x1kC7GrfCVGrjq3GRqjGpC8SvSy2rbEM
         dDpK7HnogLvq+qPCx7mybM5IaoBXavO9uXmytlp58AjkbukUaUMsjzCY4cPJMx8Fnxyl
         8jKcrvHJ/Lo+rfLgfgv7+6WP0qIWBEypKOlvY0DPPkLtPtF0ccjRFRtm2/3B0vRmw21B
         MF2BTA3bGpyVP6Zsh03jPM1HwD3XSDSJ+81lVtKJ8mQS/s4bILCpChYQd7migae76qFV
         iDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nRsrSZUdccGt8LRLTvc1f3066sqUlL3H8wQB+8CbAZM=;
        b=1vcW/DjphRbiLW3mhehDxQL2bQM7Qrk/4Vis1jmqHuN/5KH6MaquIpHXhhRRmZwGWJ
         QFn/2ob4R/Go/s0ggLygwQN9tv7qMAhX0x2UIBjsWQJt4O6CoXhJGQCv8/pyEfikgg4t
         VtwryVCKiW1lt3b1yKfVH38olMQULXezLT0fjAJ9hkZSa+QeGI2/90tlo1eFQZQCiQu/
         D8s5r0PQpq6Xyb9c6/NP1aOcu9f1QKGVCQi6X72eXmyd6dgh9PSn6Nk88atd/+6PwIkB
         yxBa5WPNEN6HL6WxTVldUmw+O01UDCUVUb1GsRI9juIz2CBorPp0HmsSsZJ2goAuVtr9
         qD0Q==
X-Gm-Message-State: AOAM530sRAZkmZmfJnHb8OUgrZqf8UZxdVXA+9lBhMpJ6bFHan3N+1/N
	0tqZSCkEiQ9Uo/lZ5ca51mU=
X-Google-Smtp-Source: ABdhPJy0Mjet+HjxsoEJgp/AwTr+A8CehTApQ33EoGLfYGLxo9jXmuRR5VCj1fk2EiLPzrIUAMNxYQ==
X-Received: by 2002:a17:906:b50:b0:6f3:ce99:3c39 with SMTP id v16-20020a1709060b5000b006f3ce993c39mr3446298ejg.52.1651086152184;
        Wed, 27 Apr 2022 12:02:32 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id d11-20020a1709067f0b00b006f395247b5esm4652604ejr.84.2022.04.27.12.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:02:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 42/45] media: sun6i-csi: Request a shared interrupt
Date: Wed, 27 Apr 2022 21:02:30 +0200
Message-ID: <2179026.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20220415152811.636419-43-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-43-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:28:08 CEST je Paul Kocialkowski napisal(a):
> Request our interrupt shared since it is typically shared with the isp
> block. The interrupt routine looks good to go for shared irq.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c index
> 3963a88a2e0b..a88deb8ba1e7 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -264,8 +264,8 @@ static int sun6i_csi_resources_setup(struct
> sun6i_csi_device *csi_dev, goto error_clock_rate_exclusive;
>  	}
> 
> -	ret = devm_request_irq(dev, irq, sun6i_csi_interrupt, 0, 
SUN6I_CSI_NAME,
> -			       csi_dev);
> +	ret = devm_request_irq(dev, irq, sun6i_csi_interrupt, IRQF_SHARED,
> +			       SUN6I_CSI_NAME, csi_dev);
>  	if (ret) {
>  		dev_err(dev, "failed to request interrupt\n");
>  		goto error_clock_rate_exclusive;




