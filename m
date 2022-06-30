Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A47463
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jun 2022 17:38:33 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t189so170499oie.8
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Jun 2022 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yRt2uPyCTkr3L23mkOV5jzWQCVWH61bPdgdKUhINZi0=;
        b=dUxjXs4MlHvfXO9xVNfCPOq2IDb3+NDw6so8BPXnwxWxhv51RZ3Uh49XkRLb1PVquF
         vXPqYQo3o0XU/wDvQ6ceawvxHBXRA6/9tMKO96IJn9b6JEOhHhvB7nlxlfKd9UN9caB8
         7Ah2Jx6IJa/TbkshlWuKPbumjWqYC/OTi4pxLgsAHTP7xDZfpOjn7w5sOBs2ai7IWgs7
         BOf2Oevb9NpBtcNPYKn8VcOL0QZQmrHo6tDKPFmhyIOpgm1J7r+3HxURB250+u3OgUGt
         QjSBPh2z9yjLRsQFWdO+axuYy17ZZf3rGj9pUwmzGv3kzSIwUgE9cyYMMEYSkGjVZdsr
         Jehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yRt2uPyCTkr3L23mkOV5jzWQCVWH61bPdgdKUhINZi0=;
        b=cTd3tW1xSX4RFGdPQeclgX7n0qa8PRqLFVVYzfjPRMOIr6mKI603TcMiHF+hyV/uhn
         +Pak6SkmTeb13Zn4JMLCxl1DzWAJCFHBGOwTNj+ct7RfKKicldXTI2i9n/ggUcLXUOQ5
         guhKvphmcV1Czy3rd4uoDjP3+7Gy341Kmq2it1vuuwm5ulOMj4kRRB8j4m0+hCut/Mjf
         XCAuccdi/eLolNK8kk87Em178aftfg9lT3tUUicCOtI4PmPGAOV95pXyQiWriwTKlPpM
         TU5eT55pqhMwI9KEYQW3sJfU6Z9JMVdkcUP56GsEnCbL/O08qvGHRxm9kVJFtov841Or
         IqoQ==
X-Gm-Message-State: AJIora/2Slv1bcSy5kwkmv1fRVZWYPG2+gkM1GQ351b1NZ2y2IAg872h
	/d80MibPUMPwjsJrMC36xyfE8g==
X-Google-Smtp-Source: AGRyM1sMFzpdDko0W+UJF+RaaGAmUzY7TXCDlzU+R3T3PNpyAfQe5AIXUZ1C8LrlBLBZuPyCeeNW5A==
X-Received: by 2002:aca:c282:0:b0:32f:546:61ff with SMTP id s124-20020acac282000000b0032f054661ffmr5879809oif.39.1656610711298;
        Thu, 30 Jun 2022 10:38:31 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id c13-20020aca1c0d000000b003351dbf5e36sm10269648oic.43.2022.06.30.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:38:30 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:38:24 -0300
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
Subject: Re: [PATCH 5/7] media: Hantro: HEVC: Allows 10-bit bitstream
Message-ID: <Yr3fkPrQXqT+UZNa@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-6-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-6-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Fri, Jun 17, 2022 at 01:58:00PM +0200, Benjamin Gaignard wrote:
> Stop limiting HEVC support to 8-bits bitstreams also
> accept 10-bits bitstreams.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_hevc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> index e06837108a09..85688a4df166 100644
> --- a/drivers/staging/media/hantro/hantro_hevc.c
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -159,8 +159,8 @@ int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc

I'd like to go back to checking the SPS control directly
in hantro_try_ctrl. I believe the best and most reasonable
place to validate the controls would be TRY_CTRL.

See https://patchwork.linuxtv.org/project/linux-media/patch/20220629195624.45745-2-ezequiel@vanguardiasur.com.ar/.

>  	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
>  		/* Luma and chroma bit depth mismatch */
>  		return -EINVAL;
> -	if (sps->bit_depth_luma_minus8 != 0)
> -		/* Only 8-bit is supported */
> +	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
> +		/* Only 8-bit and 10-bit is supported */

Having said that, the change looks good:

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

>  		return -EINVAL;
>  
>  	ctx->bit_depth = sps->bit_depth_luma_minus8 + 8;
> -- 
> 2.32.0
> 
