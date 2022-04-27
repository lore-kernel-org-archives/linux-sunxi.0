Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4EE33E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:31:31 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id e23so3096946eda.11
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YwHyL6ksRYdO/2uEjrSuWuUYLvVDwQeQJw6R1edzvdY=;
        b=Rtny20XLbY0YZ4pWTjV5LtXtgx3tz2WAej0C2YvQ3g2epmFzzuK8G2i1K077YcC6Xf
         NbygAj2z+FKJ+/RfdcjlKIkB/aWTTbiPt9GnkmEvQ9VRG/Zyni5WRfPAaTlsn59GaAI6
         Qgd6MqRNTOulcwrO7A9zGmpBTYQ2q/adNwV36hEmJelitOYspM1bfNZ/qtNp4k13Ssre
         A1hkZo6oXVmMUL8T0/1UGJuET8L4Qq+LuamlXp7tLrVdgh5nBq3u4LdKl6DIs8uFQqA6
         5MvU7x0WzKwa10v+yjzd0NPGiSWoMRrd/VjEBRoAY9ez4kNyCiE1vywrkjn4ydjjOwRh
         yZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YwHyL6ksRYdO/2uEjrSuWuUYLvVDwQeQJw6R1edzvdY=;
        b=meE19SaBNi95c4wpK3JXZ8wlr5jUUgiaop4BYIxKpai6jE8fz2drkF2rdyervc+nlC
         DBpLFEVCnt3TDeD8M7kaeYWor8A1tWPQY0dUY37qXIlp8LlUoN6Kdb08/iMDyYUKvlIk
         R7D4GmtvM7sEufwuYB50wPIouCVcETFuZQ+VGihSKDbVe1CGussHPyQxFfOPDBgxzGJm
         bBuHx2vSuhVsXunbuFNat7BP0kmXpKN14Uos4NR1nmc/zpnCKn5hgIMEZZPk4ifC7JG5
         6gAavsTrYHNMFpz4YIJRupfoTOB4sJx8jqrFjbUoldgeteVJSWsB1762txC3zCkQQnTw
         R/hw==
X-Gm-Message-State: AOAM5319PqWAYieqnNkbzD9Dj5wNcO0KzpLIR5H7NMZL+jBNo5EwtR/y
	Ub39ITWwJEuMszWpjbE/R70=
X-Google-Smtp-Source: ABdhPJzA8hxplPWZv1L31HMwQ0f6r/SfVhojQ17MEXK8bJmGhirYYDI7nFkLtNMDGBeGQ1XoIRUDmw==
X-Received: by 2002:aa7:da43:0:b0:425:cd4c:e43f with SMTP id w3-20020aa7da43000000b00425cd4ce43fmr25259694eds.106.1651087890321;
        Wed, 27 Apr 2022 12:31:30 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id i19-20020a1709061cd300b006f38920dbeesm5175492ejh.134.2022.04.27.12.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:31:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 27/45] media: sun6i-csi: Add bridge dimensions and format helpers
Date: Wed, 27 Apr 2022 21:31:28 +0200
Message-ID: <2506257.Lt9SDvczpP@jernej-laptop>
In-Reply-To: <20220415152811.636419-28-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-28-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:53 CEST je Paul Kocialkowski napisal(a):
> Introduce new helpers to ease getting information about the bridge.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 20 +++++++++++++++++++
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |  7 +++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c index
> bba825db8322..0c1e159537a7 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -12,6 +12,26 @@
>  #include "sun6i_csi.h"
>  #include "sun6i_csi_bridge.h"
> 
> +/* Helpers */
> +
> +void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> +				 unsigned int *width, unsigned int 
*height)
> +{
> +	if (width)
> +		*width = csi_dev->bridge.mbus_format.width;
> +	if (height)
> +		*height = csi_dev->bridge.mbus_format.height;
> +}
> +
> +void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> +			     u32 *mbus_code, u32 *field)
> +{
> +	if (mbus_code)
> +		*mbus_code = csi_dev->bridge.mbus_format.code;
> +	if (field)
> +		*field = csi_dev->bridge.mbus_format.field;
> +}
> +
>  /* Format */
> 
>  static const u32 sun6i_csi_bridge_mbus_codes[] = {
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h index
> f9bf87bf3667..5e6448aa522f 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> @@ -41,6 +41,13 @@ struct sun6i_csi_bridge {
>  	struct sun6i_csi_bridge_source	source_parallel;
>  };
> 
> +/* Helpers */
> +
> +void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> +				 unsigned int *width, unsigned int 
*height);
> +void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> +			     u32 *mbus_code, u32 *field);
> +
>  /* Bridge */
> 
>  int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev);




