Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49037175
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYE56A+z"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35d74cf427cso18921525ab.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 09:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703005476; x=1703610276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3vdGyZ+giFIRD6X/bv1+u6PRAF0RuL1pLhWZ53wREY=;
        b=BYE56A+z6AMkHpwHJc4/3jUiruXh6VYsoYkPWuo+rk9o35A3J4kBob0iqBUhuBmMag
         IxBwFnmYGVCOgHj4FYeh3xFnJRgGFftPqmI7qL4TqgK9sJANRG94J68b4QXDoP6bdhjl
         gPoewxkXMBtzMzmZCB/Z+RZcLTkOESxbGamGuBbWVoyfWv7cqwo4xNIaYYdorjkTVpUW
         NCuPPXkY6wy6/2qvZaRNkGHpUr8p5R0XSgfsO99IdO62PAavbvdfZgPtecTXtVNO2gZf
         4N/dTk+KOeRLoA/w2raD3YBXlOCuDqmF3j3JVJg4nIl7EmeaclJ+sTwYRJUzbPZjm0Db
         UuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005476; x=1703610276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3vdGyZ+giFIRD6X/bv1+u6PRAF0RuL1pLhWZ53wREY=;
        b=CvmVfpTKWuKSvGw60UDbdiBSEQVH/IcHVzGJ+/tb7A6Btj/z6Ce+U6i+Xl2YagjfoG
         y+hW6X2ZTht20gyIjUgL81yMei4CynE2Oh24gt0bShjEHkqgkBEIVL4s7e/6+Mc0pEDK
         hmY1G0UaKHb51OBohT5KoqE5k40se8O5IA4BCsx0Y4BZpGO4HAKRt6edlpAIbNJe7uId
         DSC/woJVPrfFjbekpeU4FxypZXHIIhFz6AH7zDueUaqZFS37ruGjxxGoKjzkxIUstH7C
         EIF4++/bMLyD03KB/X5IMbXCQMtiGF9I1ibAY2aiZyf+y1nJr50CaFxJtfjN0LUhX8oV
         lVBQ==
X-Gm-Message-State: AOJu0YwYQWzE4UCCPwUDZT0ZBjpXJJpvX9Hwsv/uT1MtfR9DcYCtuUzN
	uDqPKxr2wlF5JZHubYBHrkg=
X-Google-Smtp-Source: AGHT+IHTnWFbi3tnLUi55hj74IPei992iitC3hJxS75IRffKP/GDwsXkYn/gQjSWJRug8oGL8oZx1Q==
X-Received: by 2002:a05:6e02:20e3:b0:35f:c6d4:5d59 with SMTP id q3-20020a056e0220e300b0035fc6d45d59mr273364ilv.43.1703005475772;
        Tue, 19 Dec 2023 09:04:35 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id w1-20020a056e021a6100b0035161817c37sm7488495ilv.1.2023.12.19.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:04:35 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Frank Oltmanns <frank@oltmanns.dev>
Subject:
 Re: [PATCH 5/5] drm/panel: st7703: Drive XBD599 panel at higher clock rate
Date: Tue, 19 Dec 2023 18:04:29 +0100
Message-ID: <10386431.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-5-e238b6ed6dc1@oltmanns.dev>
References:
 <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-5-e238b6ed6dc1@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 18. december 2023 ob 14:35:23 CET je Frank Oltmanns napisal(a):
> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
> Acoording to it's datasheet, the SOC requires PLL-MIPI to run at more
> than 500 MHz.
> 
> Therefore, change [hv]sync_(start|end) so that we reach a clock rate
> that is high enough to drive PLL-MIPI within its limits.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

I'm not too sure about this patch. I see that PLL_MIPI doesn't have set
minimum frequency limit in clock driver. If you add it, clock framework
should find rate that is high enough and divisible with target rate.

Best regards,
Jernej  

> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index b55bafd1a8be..6886fd7f765e 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -320,14 +320,14 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>  
>  static const struct drm_display_mode xbd599_mode = {
>  	.hdisplay    = 720,
> -	.hsync_start = 720 + 40,
> -	.hsync_end   = 720 + 40 + 40,
> -	.htotal	     = 720 + 40 + 40 + 40,
> +	.hsync_start = 720 + 65,
> +	.hsync_end   = 720 + 65 + 65,
> +	.htotal      = 720 + 65 + 65 + 65,
>  	.vdisplay    = 1440,
> -	.vsync_start = 1440 + 18,
> -	.vsync_end   = 1440 + 18 + 10,
> -	.vtotal	     = 1440 + 18 + 10 + 17,
> -	.clock	     = 69000,
> +	.vsync_start = 1440 + 30,
> +	.vsync_end   = 1440 + 30 + 22,
> +	.vtotal	     = 1440 + 30 + 22 + 29,
> +	.clock	     = (720 + 65 + 65 + 65) * (1440 + 30 + 22 + 29) * 60 / 1000,
>  	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  	.width_mm    = 68,
>  	.height_mm   = 136,
> 
> 




