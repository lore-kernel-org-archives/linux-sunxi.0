Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFFF38FB0
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729347267; cv=none; b=NeqztCMlF8yE2gH8Rdy7fC9GU3q5bkeGmG+92LkHwIJ4AKBE4Hu0xBi5Hrn2OdNgeOzEtSDLI+ivOShpAI6c4DhxcBmGDAAAm2kPZvAP33im7etIWyppEDdIsbt3J96Sjai5cOCnw/iptxWy/+RUS22pg7g1ZBnNgtCFOA/r7iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729347267; c=relaxed/simple;
	bh=K/FugdwtDsOBQVpWzEqCm4CMqjmDrl2cnTsdg6+InVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1MVbaxdEAsHlhPFlNcu+dfzpveoToVa4dUehtl9OwijhhGY/5rsS/1kzyS/P1dGDRceulMln9XacfuCgTbkIYX2qnv+cSIGlEv2uAwoSUyBGiUjtbrt0pjIfx3xhcYzH87jndS6EPRnNiLs5IKu4xdiqZFYiyF96KR1ezs0Rvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aUMHDezP; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aUMHDezP"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so27406471fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729347264; x=1729952064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sZQKGhids4Q82uDym0yxnTsBolQaUr1BmnikbSV6eUY=;
        b=aUMHDezPfqZXU4ae5y3U0JtVukZbgavWnNHFdPeV2fkiaxNWiVZzfbArgszq3yQfZo
         oBM8A3NIx2z8vDuZoAk9+BY5MvqTM8ZV4trrCt2nyhuSdiqNwvPte9JcSe+LxcCJkroz
         22YfJYVDCz2A/pbaxafAkuKeOxx9gT2CfMLko+5QOxLYkIzXmzj1zY5LERxcX+1iNtii
         z9cJsrDLDWyXdlVLYcNeoTaIa1m0KRHwGNrgEZdN9FCfDXJixt5U6HSAnoQANy29GfAz
         qLcDp14JncLSsxxjoGRMyOFLZqmNqQ46Ebqwr/KtwGY/TWnb1Bsv+nltl5ceuGhfWMXh
         tzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729347264; x=1729952064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZQKGhids4Q82uDym0yxnTsBolQaUr1BmnikbSV6eUY=;
        b=TI+X0LZb+eftMYPLCx5Hpn5FaRqoAR6499Atby3v+xtn4eE1FZzMpyz5LoCElii9oY
         vkTm3bgk2XLVRTzPPS1i9Vwae8D+tywtUZ3v5i1KJjCLir3uyXZC0WaBAfhCaqV69G/a
         l3MypT0UbkCdne3PBX3mSri73xxPjk08tHSp1iEUkOQr3f26Bbe1nD152qYU9Goc6QKk
         plaQGeb/XSoxqXlp6WJusYKvXYBTgpCHkJS+RW+ubtJAu6hYE0jbS8jBaWnkl33f9DRt
         SgDa0P0XAYB5A7Q+Fmn/jQx1Gd0nTW/Nw0eupc8COBOfEGYRFSY3XrqCL2vMM9wodHS5
         9lJw==
X-Forwarded-Encrypted: i=1; AJvYcCX7y23qpTehd+WsPuLpvkoiBdICsvilsspSNYJhxpKJWoXEciS5qm+R0gUyedqdbPhNRtxXqsMTn7Tx/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7bEukjaltjgS7TjRkV+BrWxQ8eG+xY46YlyPNtSaoYJXDS/ei
	O9j5217le7acsDHIem1frwaZd4jfgqXUkA+QMuIfJut9nqcl4PGbMa65e6jsMaA=
X-Google-Smtp-Source: AGHT+IGzHb1rffWyHrZTm2xiGlwmytyCfNCauniR0HmfW31srODVd8fWJi7jNSl4XxdH6Wu9L+Un6g==
X-Received: by 2002:a2e:1309:0:b0:2fb:8df3:2291 with SMTP id 38308e7fff4ca-2fb8df322ddmr11397241fa.16.1729347263486;
        Sat, 19 Oct 2024 07:14:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb80a082b8sm5061001fa.101.2024.10.19.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 07:14:23 -0700 (PDT)
Date: Sat, 19 Oct 2024 17:14:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 08/26] drm: sun4i: de3: add YUV support to the DE3
 mixer
Message-ID: <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-9-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-9-ryan@testtoast.com>

On Sun, Sep 29, 2024 at 10:04:40PM +1300, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The mixer in the DE3 display engine supports YUV 8 and 10 bit
> formats in addition to 8-bit RGB. Add the required register
> configuration and format enumeration callback functions to the mixer,
> and store the in-use output format (defaulting to RGB) and color
> encoding in engine variables.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> ---
> Changelog v4..v5:
> - Remove trailing whitespace
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c  | 53 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/sun4i/sunxi_engine.h |  5 +++
>  2 files changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 252827715de1d..a50c583852edf 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -23,7 +23,10 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_probe_helper.h>
>  
> +#include <uapi/linux/media-bus-format.h>
> +
>  #include "sun4i_drv.h"
> +#include "sun50i_fmt.h"
>  #include "sun8i_mixer.h"
>  #include "sun8i_ui_layer.h"
>  #include "sun8i_vi_layer.h"
> @@ -390,12 +393,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
>  
>  	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
>  			 interlaced ? "on" : "off");
> +
> +	if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
> +		val = SUN8I_MIXER_BLEND_COLOR_BLACK;
> +	else
> +		val = 0xff108080;
> +
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
> +
> +	if (mixer->cfg->has_formatter)
> +		sun50i_fmt_setup(mixer, mode->hdisplay,
> +				 mode->vdisplay, mixer->engine.format);
> +}
> +
> +static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, u32 *num)
> +{
> +	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
> +	u32 *formats, count;
> +
> +	count = 0;
> +
> +	formats = kcalloc(5, sizeof(*formats), GFP_KERNEL);
> +	if (!formats)
> +		return NULL;
> +
> +	if (mixer->cfg->has_formatter) {
> +		formats[count++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +		formats[count++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		formats[count++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		formats[count++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +	}
> +
> +	formats[count++] = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	*num = count;
> +
> +	return formats;
>  }
>  
>  static const struct sunxi_engine_ops sun8i_engine_ops = {
> -	.commit		= sun8i_mixer_commit,
> -	.layers_init	= sun8i_layers_init,
> -	.mode_set	= sun8i_mixer_mode_set,
> +	.commit			= sun8i_mixer_commit,
> +	.layers_init		= sun8i_layers_init,
> +	.mode_set		= sun8i_mixer_mode_set,
> +	.get_supported_fmts	= sun8i_mixer_get_supported_fmts,
>  };
>  
>  static const struct regmap_config sun8i_mixer_regmap_config = {
> @@ -456,6 +499,10 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  	dev_set_drvdata(dev, mixer);
>  	mixer->engine.ops = &sun8i_engine_ops;
>  	mixer->engine.node = dev->of_node;
> +	/* default output format, supported by all mixers */
> +	mixer->engine.format = MEDIA_BUS_FMT_RGB888_1X24;
> +	/* default color encoding, ignored with RGB I/O */
> +	mixer->engine.encoding = DRM_COLOR_YCBCR_BT601;
>  
>  	if (of_property_present(dev->of_node, "iommus")) {
>  		/*
> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
> index c48cbc1aceb80..ffafc29b3a0c3 100644
> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
> @@ -6,6 +6,8 @@
>  #ifndef _SUNXI_ENGINE_H_
>  #define _SUNXI_ENGINE_H_
>  
> +#include <drm/drm_color_mgmt.h>
> +
>  struct drm_plane;
>  struct drm_crtc;
>  struct drm_device;
> @@ -151,6 +153,9 @@ struct sunxi_engine {
>  
>  	int id;
>  
> +	u32				format;
> +	enum drm_color_encoding		encoding;

Should these be a part of the state instead of being a part of the
sunxi_engine?

> +
>  	/* Engine list management */
>  	struct list_head		list;
>  };
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry
