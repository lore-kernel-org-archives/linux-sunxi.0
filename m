Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F53D8D
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 20:28:08 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id i19so5600774eja.11
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvGmY2mQG936hGzg2VuapP2qnKpxxaFYjmRXixs6VIw=;
        b=MzXqmOkEd24dbNwdLzRcxZTb2yAdP6lxjxolSFWkLK094wVT5610q89FwZ/ACmJWZz
         JaZsD+iFtBu7Sd6EofSiptXIMuutK5FJMnSMgPchBU9BGddEjtH4AOh/Z4XN4wZ3NX6j
         9nDsIiBBcII8jofTbK2AxsQNZEqufmuwgsddUp/Y9xx4sc3lrZZl0wgF/5at5HQGtbMD
         0AD0ey2KzlA/t+OU6RpGmuHsmo9ixIkh6lpPGIRnzR485erVPeMxThYWyHMF+UKv4sbJ
         sUmr9ycIMaf8KZr6Z3btAq0qF4LLK9owYVro7lHFGpXk2nOKHJY0+5zRHUYx3L5ve0dJ
         u3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvGmY2mQG936hGzg2VuapP2qnKpxxaFYjmRXixs6VIw=;
        b=rAFLj6WMN56Ej1PJhXKbHQUNA/5y1aDW6+/Qoj0hsIBZBfhPJfbOiczT7IELzDMZXN
         PEvcGOknDRCkYgx1ALnE0NbtdthXPIgrIOi8DPW6e7yGw+0ckHS8njdxzUZT+oL6vNV6
         /gj3JCMzhQV2HkBaYRgAtiH47fr78LByatmGnMZ8jmexwRqANtQmKabxV8LcxjgRL3y9
         lHF5XNax7AovCI6EDLGJRPL1k/Msm0R3tFM6wNwlWVe+ROhXZvAuV2DAb2yLsMccBhfz
         dKJjgVeCNXxEsfkZf+4iToIZ2npnSX9VcWgm1c000jqvnRw9l6zU6cUhpKU10UBqhkMj
         ZnRg==
X-Gm-Message-State: AOAM533EcYZOlG1DDtq2LxSe8EcIzdxdrODfd3i2XJVqM20yyl2nx+pd
	44nC8YKxSfXcEjX3vQcUmHUtw4ZYlVHAkg==
X-Google-Smtp-Source: ABdhPJynfDhtkkRIX5oDrXpoq2M/wKC5ZG0bQaQWExaqc1wCyweARLqXzr5tTgNf04q7vp1gnE2VVg==
X-Received: by 2002:a17:907:7286:b0:6ef:f594:e063 with SMTP id dt6-20020a170907728600b006eff594e063mr28032902ejc.611.1651091284058;
        Wed, 27 Apr 2022 13:28:04 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906924200b006f3d1141693sm1004812ejx.44.2022.04.27.13.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 13:28:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 6/8] MAINTAINERS: Add entry for the Allwinner A31 MIPI CSI-2 bridge driver
Date: Wed, 27 Apr 2022 22:28:02 +0200
Message-ID: <3412158.V25eIC5XRa@jernej-laptop>
In-Reply-To: <20220415152138.635525-7-paul.kocialkowski@bootlin.com>
References: <20220415152138.635525-1-paul.kocialkowski@bootlin.com> <20220415152138.635525-7-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:21:36 CEST je Paul Kocialkowski napisal(a):
> Add myself as maintainer of the Allwinner A31 MIPI CSI-2 bridge media
> driver.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..0c7a3c792837 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -761,6 +761,14 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/allwinner,sun4i-a10-
csi.yaml
>  F:	drivers/media/platform/sunxi/sun4i-csi/
> 
> +ALLWINNER A31 MIPI CSI-2 BRIDGE DRIVER
> +M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-
csi2.ya
> ml +F:	drivers/media/platform/sunxi/sun6i-mipi-csi2/
> +
>  ALLWINNER CPUFREQ DRIVER
>  M:	Yangtao Li <tiny.windzz@gmail.com>
>  L:	linux-pm@vger.kernel.org




