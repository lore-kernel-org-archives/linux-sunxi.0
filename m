Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF333E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:57:30 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id j6so5448018ejc.13
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gObXNMCeL04pRkzfUrbEYNuGnSmsJApWDHwj3r0JiVQ=;
        b=UdY39AZqXiBKog7jwIYOkFGgB82bNvFxD9+bmmpgska5kaiJ7XZnl9oe4Y+reIg0S1
         /WOTLuZWF9bQvqXWykCHQJDM1d1hu40iXT3ovjpJYFBe2bsh4RJfrgSBjGrN5l021hOk
         maLFCmTUJld/O1DScaRp5rwECpSy1m0sgS2i9IkHShThIJHlgEWAB83jz/eOEoVYff97
         Us2UeuV/qri6x5zvMMZTsvBtj/sVfEHKCqoXVBLLx5DsxiVCZBI21P428Cs33wupzajM
         cjxEMYET2sz/6T6Pz09zlL4SZ/UlpMTXxS9/Bg92nr1VmTjrUjm1j2XAGleVU+x2c0c8
         70jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gObXNMCeL04pRkzfUrbEYNuGnSmsJApWDHwj3r0JiVQ=;
        b=kfE2VpK6i+GgcuGq4q4/hUGoxNOMPYMyW9lJF8cQQ3JZA8DDGzFoAJ4t1Da0pAWCRT
         H2uNkzrQHhm4k/DKInQe76NDNX6ic/SxBJn9EtH9xxxHtYd22PpRFCasgb/tObw7I/rH
         8cs5FdvN8iQDkEUju1RnKoh2ls5PSEt+MpNbnw4E1MvnVrSByeM64B0B9ZJYvMUp39Az
         U/uLx1cmWbZtp56VJiXPcClCteD5jAVYUuPR8i/jl+zORxmxdjrYI1cwl8qUAEaVyAgp
         GWV2r2yY/eXV4Q27acQm7Ez9Jhb8e2ZNEtTouJbSXt44LkdR6hp+TIlAHeXbC8YSZsEb
         BKgQ==
X-Gm-Message-State: AOAM5328wylmjilcVu+3ofAcT7Omyiei9zpIh1ncJo4zfkZP6xIlG9YT
	2EhpBwHDzY2Nrkh82PlkLe4=
X-Google-Smtp-Source: ABdhPJyahhPKGQI9V4wIt3BeD3AWHWuyBXHzhGlMuwxN95ZpKY4Vz62RU2CJ1vXMM5iTv5qm5kULDA==
X-Received: by 2002:a17:907:7e8c:b0:6e8:92df:1656 with SMTP id qb12-20020a1709077e8c00b006e892df1656mr30370481ejc.386.1651089449246;
        Wed, 27 Apr 2022 12:57:29 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709067c0c00b006e86db76851sm7217728ejo.193.2022.04.27.12.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:57:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 41/45] media: sun6i-csi: Add extra checks to the interrupt routine
Date: Wed, 27 Apr 2022 21:57:27 +0200
Message-ID: <2580640.X9hSmTKtgW@jernej-laptop>
In-Reply-To: <20220415152811.636419-42-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-42-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:28:07 CEST je Paul Kocialkowski napisal(a):
> Check against the enabled bits and make sure capture is running before
> serving an interrupt, to add extra safety in the process.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c index
> 43b6557b3207..3963a88a2e0b 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -105,13 +105,17 @@ static void sun6i_csi_v4l2_cleanup(struct
> sun6i_csi_device *csi_dev) static irqreturn_t sun6i_csi_interrupt(int irq,
> void *private)
>  {
>  	struct sun6i_csi_device *csi_dev = private;
> +	bool capture_streaming = csi_dev->capture.state.streaming;
>  	struct regmap *regmap = csi_dev->regmap;
> -	u32 status;
> +	u32 status = 0, enable = 0;
> 
>  	regmap_read(regmap, SUN6I_CSI_CH_INT_STA_REG, &status);
> +	regmap_read(regmap, SUN6I_CSI_CH_INT_EN_REG, &enable);
> 
> -	if (!(status & 0xFF))
> +	if (!status)
>  		return IRQ_NONE;
> +	else if (!(status & enable) || !capture_streaming)
> +		goto complete;
> 
>  	if ((status & SUN6I_CSI_CH_INT_STA_FIFO0_OF) ||
>  	    (status & SUN6I_CSI_CH_INT_STA_FIFO1_OF) ||
> @@ -132,6 +136,7 @@ static irqreturn_t sun6i_csi_interrupt(int irq, void
> *private) if (status & SUN6I_CSI_CH_INT_STA_VS)
>  		sun6i_csi_capture_sync(csi_dev);
> 
> +complete:
>  	regmap_write(regmap, SUN6I_CSI_CH_INT_STA_REG, status);
> 
>  	return IRQ_HANDLED;




