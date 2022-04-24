Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB127C
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 20:08:16 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id m20so5228307ejj.10
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sudUzil2TeGtGGqvHjugQsy8d/UrN+DwGR4+Ef4x1Kg=;
        b=maOBumgDQGBkUzklplB1UFE2bwWZfJQfJTafW0PmOMkFWVnN2oeXdc7HPJnueqqqV/
         YNnhAncdsA+C1p1GcZ98NsTyatxwo0LXVBs1NiLmxnINTWSbMfEOVnihqXtTcDMhSTKG
         EmHkhppovTi80fY72HGDLMYCZUe/+FpITY4xmjr0qPR1k9TfcVBX0rUesp0oQ9mIM4Jj
         4xJx3E3XfAGdqzzJwF644y9q2lZfCerI20QlBzZ/mJelnFMlMTaA4S7y4At4iU+I5iKO
         f7yOxm/FAY2uizoM5Pk9kLXG+U9FB3ClSK2JvfFC7bMsQxMNWB0b6w9/QBdNDfuVCZ94
         IrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sudUzil2TeGtGGqvHjugQsy8d/UrN+DwGR4+Ef4x1Kg=;
        b=fNNEfXA0AAsHcsWyC+ezocTxxUG8hNwy/IjR8yen3y2doxFZe6saUHLg+nE5UoyL8D
         XFhw6w03uSY8/ijeDr4q0ypEwrNaC8huIGvH0i4stOaP4gqfz8gObf3h/L5mTTKDTOVL
         /tEBpiZ0j7/dWrZwST9gWMShsqzu3XGpazSdAWwm5Y/xGwyvWfF+QPQxk/2XiNC3worS
         GjELaveFF+W+J7HQULN9dPG8zq4e9qWc5CqzVif76UV3PkqS8yUcKSZG01Gl4OvRzSgM
         47mAZRS+lwRDfKPmhMKoDIPVvB0Vc/HBFFBMyaoboIDYpCjqJ4nQwb0XqkLNFszxZf2X
         gjpQ==
X-Gm-Message-State: AOAM532SdEJAhqz65cQ3oo8bUNa3kBJxJvAlRXjEoY6+z+6qw755tsa1
	RfrhpUGJzL8Ev4WE16Ei3zI=
X-Google-Smtp-Source: ABdhPJyHJKKOxw8s1yJlNHqrD4UJnk4HSPgCDiT1JHiiYrtZFxHbUJW0QWUiJ2r37sWgPoDPw2ht3A==
X-Received: by 2002:a17:907:7704:b0:6cf:48ac:b4a8 with SMTP id kw4-20020a170907770400b006cf48acb4a8mr13128991ejc.305.1650830895109;
        Sun, 24 Apr 2022 13:08:15 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id p12-20020a50c94c000000b00425c48132bfsm2982323edh.55.2022.04.24.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 13:08:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 13/14] drm/sun4i: Add support for D1 TCONs
Date: Sun, 24 Apr 2022 22:08:13 +0200
Message-ID: <3164754.aeNJFYEL58@kista>
In-Reply-To: <20220424162633.12369-14-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org> <20220424162633.12369-14-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 24. april 2022 ob 18:26:31 CEST je Samuel Holland napisal(a):
> D1 has a TCON TOP, so its quirks are similar to those for the R40 TCONs.
> While there are some register changes, the part of the TCON TV supported
> by the driver matches the R40 quirks, so that quirks structure can be
> reused. D1 has the first supported TCON LCD with a TCON TOP, so the TCON
> LCD needs a new quirks structure.
> 
> D1's TCON LCD hardware supports LVDS; in fact it provides dual-link LVDS
> from a single TCON. However, it comes with a brand new LVDS PHY. Since
> this PHY has not been tested, leave out LVDS driver support for now.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/
sun4i_tcon.c
> index 88db2d2a9336..2ee158aaeb9e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1542,6 +1542,12 @@ static const struct sun4i_tcon_quirks 
sun9i_a80_tcon_tv_quirks = {
>  	.needs_edp_reset = true,
>  };
>  
> +static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
> +	.has_channel_0		= true,
> +	.dclk_min_div		= 1,
> +	.set_mux		= sun8i_r40_tcon_tv_set_mux,
> +};
> +
>  /* sun4i_drv uses this list to check if a device node is a TCON */
>  const struct of_device_id sun4i_tcon_of_table[] = {
>  	{ .compatible = "allwinner,sun4i-a10-tcon", .data = 
&sun4i_a10_quirks },
> @@ -1559,6 +1565,8 @@ const struct of_device_id sun4i_tcon_of_table[] = {
>  	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = 
&sun8i_v3s_quirks },
>  	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = 
&sun9i_a80_tcon_lcd_quirks },
>  	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = 
&sun9i_a80_tcon_tv_quirks },
> +	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = 
&sun20i_d1_lcd_quirks },
> +	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = 
&sun8i_r40_tv_quirks },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
> -- 
> 2.35.1
> 
> 


