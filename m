Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A168
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 15:59:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d27so18952928wrb.6
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PhxuWkPI7WSwy9/xbqGbDSYuHklsrt0Nk6zcSCvllc4=;
        b=TwhyPU09oneH/AU/9GXFKzHVqir73+1g3JpQ9AFfyha+N8H0ChgooRv+GQYT1p1Th2
         I2VqA+hxBvt7DZKJEV2DX4Jy0CO/AJh0pE2xdxF1hTDo9ZsboQ5I6BnwhBXgrhNuXk9h
         0ndxoqOooybtnf4H5QOINzsLesl4fQqWHv9D1X22BcwfAfwmBAhPNVh6qe93jahCH7rB
         iFleYESeWPaUdt3sk7g4GwX5xRwmGBGn6NORWACU4HDsEl1DRDYOK8ToObXGuW6Imbuh
         cXN8LYgVYHIIzP8iR4WGYQJrlXRABNF5cajy6uUOcOR+JVTkqM3V0onTZ/+VJ3mUflTV
         h/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PhxuWkPI7WSwy9/xbqGbDSYuHklsrt0Nk6zcSCvllc4=;
        b=cODVaqNxeHWRyBFS11vbBbLtDtrMImdHXxr6Ezh2rO5nK9Bm+WmFNrDliUIJvUef2a
         0Y3diPaC+7pT0pS43x9+GbcoYuYnApPA2Tl1pKKtXPslgCbnUivB9oSfIVPjldZlIdJ5
         o1J93YvIzPP8pP8usswIMHcmLw5sppA1XgQi7FJQs8gOkExjpETkxJzo2rv1wwi7Ges4
         VN3prOjl22pkRb0PIwtse/JOpT0N2a/pgxE1U0iF6vRhKn47V8y/kL0/8XnzW2t+YsX2
         Ojeblzj6bYdme0ZwYDu/0PQko28uOcp8+cOAyokrIO+1UzoYzVgdcZti4nA6V0+dEzfG
         YzSg==
X-Gm-Message-State: AOAM531PRwvk+xNeYbvdIcuPtGyKdVW1HOhZ1e0XDLCE1fYZFM7woG2q
	RW4GHHol7f6rjbA+9oy/bL4=
X-Google-Smtp-Source: ABdhPJxqkheLx99/Jc54Crfq7FUPzLztWfwJvGcdI4VBHYB6zr0D2Dj4bZFCyE2taCdh/brhM7QYfg==
X-Received: by 2002:a05:6000:1a48:: with SMTP id t8mr8663541wry.66.1637337584924;
        Fri, 19 Nov 2021 07:59:44 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id n184sm12038875wme.2.2021.11.19.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 07:59:44 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Bernard Zhao <bernard@vivo.com>
Cc: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] drm/sun4i: remove no need type conversion to bool
Date: Fri, 19 Nov 2021 16:59:43 +0100
Message-ID: <4355729.LvFx2qVVIh@kista>
In-Reply-To: <20211116021449.27503-1-bernard@vivo.com>
References: <20211116021449.27503-1-bernard@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bernard!

Dne torek, 16. november 2021 ob 03:14:49 CET je Bernard Zhao napisal(a):
> This change is to cleanup the code a bit.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/
sun4i/sun4i_hdmi_tmds_clk.c
> index fbf7da9d9592..25e6f85fed0b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> @@ -49,7 +49,7 @@ static unsigned long sun4i_tmds_calc_divider(unsigned long 
rate,
>  			    (rate - tmp_rate) < (rate - best_rate)) 
{
>  				best_rate = tmp_rate;
>  				best_m = m;
> -				is_double = (d == 2) ? true : 
false;
> +				is_double = (d == 2);
>  			}
>  		}
>  	}
> -- 
> 2.33.1
> 
> 


