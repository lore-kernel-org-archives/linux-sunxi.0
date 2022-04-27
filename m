Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DC67F5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 18:42:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id a21so2987125edb.1
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 11:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kM7QKgAFBW1YvmaUCZRsC0/6t1UvkOHugGgZxLi1Vr0=;
        b=S+kHBI/504UiUBVwrLTFGKBKaowxmoONKDYMlQIV4s6mofRVbccXVXAXj8K8BXLa55
         PKPXRzXNTv7UPUOFRBnPq0CsvYN8ufGPVTnQg7zCGVX7dBsIBvweiLQZKoNC2kGHoNb4
         Gn+9odGqMMu9c04/gJYxVhVh2ixOrzAu3Zl/Mu+/eviXikF2zSs9HCzA1bzDxjU6ONDO
         IHbqsqDFjkpRpyKLWsujzupJKuRBPnlTuFDxCrWs0OAVAXMXeVPw1XtRYa2stKmZNcXd
         1z+bK1OVuUcDn7Mk8cKdsnS95xTJpBq75UmfQ1nObO6NkLmInR0yKfGPGGoqzz9MKZ8U
         o53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kM7QKgAFBW1YvmaUCZRsC0/6t1UvkOHugGgZxLi1Vr0=;
        b=Og0TsANY9TshqIXVOLfIBaRZBuCKfaZe0vWJkd+rHjJd0UnhXpGRj0Ri7DJnxuN8z7
         OeOf737yff38xD3Ypgkd8Itkr91UGpYe5yLdjkEYsdJ2kvbRDOVmD2aREQZAl1QTe6mg
         Yiqnv5Uz5a4nN7PQT/6nRUZc/r8i654BPF9LFAeDb+dZxSThbW27wxkmrJgrPbeRt13X
         iHc/lulu1mPTWT8PfI7ihILEX/1DoQcZJS6UZY2PNhjBH1RwXL0FN4aUsyIV51fbvxaJ
         +C3DN78UcxZjEnOGWPAyDy9nIrhIa62dzKQ2c0omj6H9+Ho+PbT5EC4OcCz5GphZRec1
         grPQ==
X-Gm-Message-State: AOAM531/AwE4BFdghgBTz5psyaZrcm67d5CoD6cgvX/AcYVR0typD6by
	AUTWvBtwTCnXI161Rpt2GOA=
X-Google-Smtp-Source: ABdhPJwXgfYi2dTLT9QE2lh91WC5EwoIzb7cZ7ysQtl/DgiXIIGDXTWRE8w1/uoxyG/OsjUPhQ/wCA==
X-Received: by 2002:a05:6402:364:b0:425:f88d:7d4a with SMTP id s4-20020a056402036400b00425f88d7d4amr11968554edw.68.1651084929330;
        Wed, 27 Apr 2022 11:42:09 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id e19-20020a056402105300b0042617ba6384sm7099edu.14.2022.04.27.11.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 11:42:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 12/45] media: sun6i-csi: Add media ops with link notify callback
Date: Wed, 27 Apr 2022 20:42:07 +0200
Message-ID: <1813200.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20220415152811.636419-13-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-13-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:38 CEST je Paul Kocialkowski napisal(a):
> In order to keep the power use count fields balanced when link changes
> happen between v4l2_pipeline_pm_get/set calls (in open/close),
> the link_notify media operation callback needs to be registered.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c index
> e59ee3e3f372..578714606c2f 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -23,6 +23,7 @@
>  #include <linux/sched.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> +#include <media/v4l2-mc.h>
> 
>  #include "sun6i_csi.h"
>  #include "sun6i_csi_reg.h"
> @@ -574,6 +575,12 @@ void sun6i_csi_set_stream(struct sun6i_csi_device
> *csi_dev, bool enable) CSI_CAP_CH0_VCAP_ON);
>  }
> 
> +/* Media */
> +
> +static const struct media_device_ops sun6i_csi_media_ops = {
> +	.link_notify = v4l2_pipeline_link_notify,
> +};
> +
>  /* V4L2 */
> 
>  static int sun6i_csi_link_entity(struct sun6i_csi_device *csi_dev,
> @@ -683,6 +690,7 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device
> *csi_dev) snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
>  		 "platform:%s", dev_name(dev));
>  	media_dev->hw_revision = 0;
> +	media_dev->ops = &sun6i_csi_media_ops;
>  	media_dev->dev = dev;
> 
>  	media_device_init(media_dev);




