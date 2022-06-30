Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0617B
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jun 2022 17:40:58 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id y10-20020a9d634a000000b006167f7ce0c5so15250246otk.0
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Jun 2022 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L5LM24Isd3avLAri00yP0uUJEwQfm2+0rT9x5MHEIdM=;
        b=CYPltZ+rQkyqU6YuIXsNiiWskIjHVxrB/8nXlilwqtOY2j444buUx9aqaDKXm/seRU
         Lbic5cyhoH2aORYYmQ2gZmLolgdIdEaxhuVAkwt4pUiyPHYFa1grN4ivgvQ51gbFE+cl
         K3xLj9DTg/GOvfhYfVbmCZ6GI2LZCKR2qm1YQKWpbkPgLiT20hi+22ftMucyg3cMND1U
         6Nqh8uB3nR8nMPdKOvTpXdABL2MnL/VqskpxgNbM83/dTVbfLoMXD53KXFsWn+tZSN9d
         jSfB2MTv4STv28slG+Eut8KsVG6q+0dRV+AxOCjVqKTlS9Y1qpz5VUHJiigVcxNwJbWH
         nuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L5LM24Isd3avLAri00yP0uUJEwQfm2+0rT9x5MHEIdM=;
        b=JxC5OzWbBi3qdV1RH2sX4+gnf7sOtgxB3xeSfhQf0LEmzDWsYYO/hiNvAZtvrQD5pe
         CzkV/uGK5uXrJDBeV8IcWBr4wKAhMt7Qs/1Ih1YsE3L/DiNRYvz1sLBBFwCWcuPASZNE
         eIsoRT6lM2LwLS/yLkiVfAEcfv7xNiaJQueFWD56ZyHnE0qfp6xvkBdCmbKD3g+KhIde
         CwNwiZBrM+fKCa6OTtO0j1lzKdz7J6nhL2J86a+Ngq+OJy5Ms7to+BwEqwD1jvSDZ4AB
         XjYfN2JXbx6vOPBWPbJWIz7mwUXZurBRXLtM/t0hQFGAWVh+EYyhAfygoCS+VPjcfH6Y
         KLqg==
X-Gm-Message-State: AJIora8KWmDUMREbtzSwV98RYNOYRw4cKCv4Mt3mv4VqwC8SQnrV9T2z
	U6MDmJIcMc17Z4pvz3ISQp+Ehw==
X-Google-Smtp-Source: AGRyM1tFASk+uZEoikN/WRKV1KRqzG4udU6NKGy6hPh5tqzDkXxffJW3Qzy6XpqeMuezapvfPhGgZA==
X-Received: by 2002:a9d:3f1:0:b0:616:80b3:47e8 with SMTP id f104-20020a9d03f1000000b0061680b347e8mr4387751otf.213.1656610858062;
        Thu, 30 Jun 2022 10:40:58 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id c68-20020a4a4f47000000b0035f6cf71391sm11153701oob.43.2022.06.30.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:40:57 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:40:51 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, mripard@kernel.org,
	paul.kocialkowski@bootlin.com, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH 7/7] media: hantro: Allows luma and chroma depth to be
 different
Message-ID: <Yr3gI8L/o9DIYPWK@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-8-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-8-benjamin.gaignard@collabora.com>

On Fri, Jun 17, 2022 at 01:58:02PM +0200, Benjamin Gaignard wrote:
> Luma and chroma depth are set on different hardware registers.
> Even if they aren't identical the bitstream can be compliant
> to HEVC specifications and decoded by the hardware.
> 
> With this patch TSUNEQBD_A_MAIN10_Technicolor_2 conformance test
> is successfully decoded.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_hevc.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> index 85688a4df166..26b1329893f7 100644
> --- a/drivers/staging/media/hantro/hantro_hevc.c
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -156,9 +156,6 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
>  
>  int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc_sps *sps)
>  {
> -	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
> -		/* Luma and chroma bit depth mismatch */
> -		return -EINVAL;
>  	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
>  		/* Only 8-bit and 10-bit is supported */
>  		return -EINVAL;
> -- 
> 2.32.0
> 
