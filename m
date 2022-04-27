Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61133E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 20:01:30 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id i27so5501390ejd.9
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aLowST4nKAkGr9c3fHqSpsjf0Wm9DG/3Bvzsg405mP4=;
        b=MG4f5rcNTMQf8BjT+/LacYXM0bt4cXS55yondFKDP25V8gs4yEsHXcgyWwR+jliuWe
         eJll4Db9T1i52aZdoZIC3shF446867eVgacgMi4oD48JvDrZB0lSwMhoaVSqPNk4RzQB
         jGIXOzBcUH5gnrZTVBGKIhIu5NERUEYaY+H7z/QQLQ3UhQoRfa/HGoJ5esB8EggsPCCT
         YpuKsbNc/rXOTEFEeFkAKIRQbyMfcrlh5kKvSZBoKMM7FD78MF4PVUo+InCNaHrbDg7K
         XvQ880yfuVwBQmMFu529yKCSLH39A63IBkIyoX/CYhNmWzbS/Uyy8P+4nt6ct28AQIof
         keSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aLowST4nKAkGr9c3fHqSpsjf0Wm9DG/3Bvzsg405mP4=;
        b=ozdDSPj5MbpeiMlz2Iax+wvzPIg5zHSaoIKjoqeGm3R8i9HdaK6sfGUHMST3OTDa7l
         RMEUIRqXIP1SBkdhdNdUJx7pix5kPRFZAiY8K6nEcHM6oOJwyq7MqOS0rmDlup/a+S6W
         dUFs9jE1FySZETQn/3yWfMoBTuG7XsiDdWISfBj1edJE1u1Hy3jwPd0O9x9FNsEEOJTT
         iCHp2b6W//C+9AFqILDeN3KXEzCbz4/NjpWy9TZvNa9cRxiDjUG/eCWIiQE2n7ZLUVV4
         82ZoH7K4v9+1UIXYochos+uLteaW2P8Uxv6xR83Ywfu9696BAy2XMIW3ez0FyNiRGAmb
         0n3w==
X-Gm-Message-State: AOAM5306iXgfyGPuRpaD1L79QA+i46NsH/hdaBbSk6kHQ1RCVmHgi2gm
	t+jO1CPuLHR1RZrWnoKHMmI=
X-Google-Smtp-Source: ABdhPJxS4IZ0+iTjCGdsh1af2+eAD2UhX/BmO3fFmIZzxswqPED//m8AjF4IdzLfr7I4JgzHWJKYZw==
X-Received: by 2002:a17:906:3ec1:b0:6e8:aae3:90de with SMTP id d1-20020a1709063ec100b006e8aae390demr28151878ejj.127.1651089688800;
        Wed, 27 Apr 2022 13:01:28 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id hb44-20020a170907162c00b006f3bd744275sm2794919ejc.181.2022.04.27.13.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 13:01:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 45/45] MAINTAINERS: Add myself as sun6i-csi maintainer and rename/move entry
Date: Wed, 27 Apr 2022 22:01:27 +0200
Message-ID: <13001519.dW097sEU6C@jernej-laptop>
In-Reply-To: <20220415152811.636419-46-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-46-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:28:11 CEST je Paul Kocialkowski napisal(a):
> Given the substantial rework of the driver that I carried out and the
> knowledge acquired about the hardware along the way, make myself a
> maintainer of the sun6i-csi driver.
> 
> Also rename and move the entry while at it since the driver is not
> specific to the V3s.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by; Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  MAINTAINERS | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c7a3c792837..43f456982ecc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -761,6 +761,15 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/allwinner,sun4i-a10-
csi.yaml
>  F:	drivers/media/platform/sunxi/sun4i-csi/
> 
> +ALLWINNER A31 CSI DRIVER
> +M:	Yong Deng <yong.deng@magewell.com>
> +M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-
csi.yaml
> +F:	drivers/media/platform/sunxi/sun6i-csi/
> +
>  ALLWINNER A31 MIPI CSI-2 BRIDGE DRIVER
>  M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>  L:	linux-media@vger.kernel.org
> @@ -5232,14 +5241,6 @@ M:	Jaya Kumar <jayakumar.alsa@gmail.com>
>  S:	Maintained
>  F:	sound/pci/cs5535audio/
> 
> -CSI DRIVERS FOR ALLWINNER V3s
> -M:	Yong Deng <yong.deng@magewell.com>
> -L:	linux-media@vger.kernel.org
> -S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-
csi.yaml
> -F:	drivers/media/platform/sunxi/sun6i-csi/
> -
>  CW1200 WLAN driver
>  M:	Solomon Peachy <pizza@shaftnet.org>
>  S:	Maintained




