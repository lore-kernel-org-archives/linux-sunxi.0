Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEA17C
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 19:59:47 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id i27so25916314ejd.9
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bV7abALvJSLkm1kXyFRmPXQZ2gIon9h1Q/8YJtaLQt4=;
        b=lcAdQ6A+UaHD3xIrVIAm0/cpdlS52ljmY/RnUwRNx33hyNO15ij8+ZKeJ2lQ7pWkiy
         WDv1tK/A+g45C0CQaHsQvsYH8wBVOJ1k3Y7H/TSR/QyGyRXxKUPM5Tz0XuWUkHWunE5Y
         lBrOLHdwkS+hWXMRCmbZtV0woML4a7TscSAY0bS53ftl6TNrHE5qQvITz+a6uc7o5xnf
         C6O/kY1mU1P1UzIf9ev5uMDpE7GV2hUhpqiwpc+vovpuQ8ALgvweJRrF9W9/D7QzM33w
         nKILE+YGn8kTLiu8t+VdRp/35f9xuzkIdZ7evu4/5yJ0rs99yigb2Q4SzMy2bdTxwOj8
         sraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bV7abALvJSLkm1kXyFRmPXQZ2gIon9h1Q/8YJtaLQt4=;
        b=KCc2SzNgtRMCjtsGe2b7iEegRgThKzLq1aKho7RU5wdvBlQnGitOL8RT8iP52bVIFb
         jHymDTIqupNkGILRW6+uiWf+vm9uUyQTe6Gra2pC/R/4X3hWlrFw2gR0oU+V2zna1isV
         G8bIwYsVQQaKYuJWfJbisA76MnZHDNGzlLL3wPOmKwMEsU+Zj9nl90/D6d04zVwV3RMG
         06pJs6/3Eb5cxYhkk8K9U4BDKVbyWkpSHA8fC4juzjr2spv2bhmKm96/gOYniKWavmoz
         TYZJGCJmUGyHbTMVecTr9alLfi/ngqGMJPc32dtZrTrP4LpLM/mzlUXViWs5BUWMwaMm
         Y4Zg==
X-Gm-Message-State: AOAM532fxr3f9BQAQUjIpryaCYRbvc6NjBZmzdvqx9xxRmeMYGCh3BQ2
	ToxLz/XBQFsvqFFeD+eTjp8=
X-Google-Smtp-Source: ABdhPJy+WUlHCxfjVulhRV24z4zq5PYWrKRNgfG26I/7xRNckO6yB1RPxAIu2B7iY6TbPQGLZ9u00A==
X-Received: by 2002:a17:907:7f28:b0:6f0:29eb:85ba with SMTP id qf40-20020a1709077f2800b006f029eb85bamr13971555ejc.15.1650830386246;
        Sun, 24 Apr 2022 12:59:46 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id m5-20020a17090607c500b006f1bf5f545asm2837299ejc.26.2022.04.24.12.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 12:59:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 04/14] drm/sun4i: hdmi: Use more portable I/O helpers
Date: Sun, 24 Apr 2022 21:59:44 +0200
Message-ID: <4732416.31r3eYUQgx@kista>
In-Reply-To: <20220424162633.12369-5-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org> <20220424162633.12369-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 24. april 2022 ob 18:26:22 CEST je Samuel Holland napisal(a):
> readsb/writesb are unavailable on some architectures. In preparation for
> removing the Kconfig architecture dependency, switch to the equivalent
> but more portable ioread/write8_rep helpers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>  - New patch: I/O helper portability
> 
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/
sun4i_hdmi_i2c.c
> index b66fa27fe6ea..c7d7e9fff91c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> @@ -56,9 +56,9 @@ static int fifo_transfer(struct sun4i_hdmi *hdmi, u8 *buf, 
int len, bool read)
>  		return -EIO;
>  
>  	if (read)
> -		readsb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, 
len);
> +		ioread8_rep(hdmi->base + hdmi->variant->ddc_fifo_reg, 
buf, len);
>  	else
> -		writesb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, 
len);
> +		iowrite8_rep(hdmi->base + hdmi->variant->ddc_fifo_reg, 
buf, len);
>  
>  	/* Clear FIFO request bit by forcing a write to that bit */
>  	regmap_field_force_write(hdmi->field_ddc_int_status,
> -- 
> 2.35.1
> 
> 


