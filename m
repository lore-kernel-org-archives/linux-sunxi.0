Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD2A1EF0BC
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216641; cv=none; b=on8y4dyR9WrmxEj8/cm6uNQSxegOjV16pUaQV37Zftcixuzdr+ixPnJnZm9765QMjlW+P8q+w5/nvLTLHOS3K+wlm0m4TNs45RywhSWM3JBN78+QX4dC3ohu3oa3RJcVbwhsoQ5yth0UvPZjCJ/QKI+9I1GdLv3DUp6nY8EeSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216641; c=relaxed/simple;
	bh=ohDuKgeYqsp+9JhZO++8jr92MnlHbq65lbOggkplOMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r8bnZt4E2gcB4ucIUQjf3D9r5w0kZEWyF75RcFBxdbqf4wgbEdhCMld+6anUxr8xb9WA7lWwF3HYi7YsIlKuzka5nZwTY1/mbILm1LqDgSiejjmkqf806LLtLVR0FZRAWayiNwlbPDvc04Sm65Myqd2AVszKboEuLvGkZ7YLFEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCMUI+mg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCMUI+mg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so1462085f8f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 01:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740216638; x=1740821438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9F20fzricZrTGW+QeF883b7IwAmdJ0gyJoHIxyxNBc=;
        b=MCMUI+mg2/sIBpa4w0ERlGfCH7j5rxuDWMPwt73QqclAuyJOlCUfDrqfKA5gA/24sX
         rdJFL2EGV+99u/n4Ru/P3yWRj/TJSJR+HSZK76fZifj8gw+rboHq8FTkDIu264WZYa9O
         xQa/ZKL008Vws2DkIdla1z4onhh8iQbAVgaHtBnUIduMFqKdLqTHFec4X6nWEn49tJxC
         dvNF6mZUUubOJdkA/741PUg8y/9262Vikdk6g4aGwVFD2AzjPrQLS9fwHniA6W2CRkhe
         LxIUwQAUIs3PYj0sc5Xh6WIsTbBWCbhMMOP7b9dG6ExsbJ/5xswcxnc+xUXNZKGwtvhE
         ly1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740216638; x=1740821438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9F20fzricZrTGW+QeF883b7IwAmdJ0gyJoHIxyxNBc=;
        b=iDLYLWoc12wzx1fV5ODGFMkdHXhINoDsxWFYSXhz1vrYBSv6C8gE/hsQcvXCuXZxXS
         AxOSDjBwRsw1x/OS0pn/1xE64/xI/qwbKsHU2G8W4GNSePOxngA7P/6Rn6Z3qTMNiLrW
         2dMFE0pBR6guc/tn2XahiRkSjkO6sTbaM+cPd+qpBCnOmqVKcMdGc5u69Redn91P6/ro
         zFAvLFHlcYF8H5hvluz802kR0bPIFegX6vF9kr2iaAOc9ThAPGL3I/LizVsS9Tqmj1JW
         1v+I7LBHdLI3cy2X0kVTKg9R0wFGBnQjOHLv0ZF2IFH5diT0YqQNROnh2z7O8tjjQShv
         kKMA==
X-Forwarded-Encrypted: i=1; AJvYcCWIichhLZEKsp23GNDj5RO+urv5BDlWcL2cw2h1XrMBPIIGW7u8OTFtzUGhcShMcTzS1IdIBDHS4Z2Lgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGN+CPLHphb2cfcOAzWolq+O20FZ50L+4KtFsWMTjUXneFBR6Q
	Mmzc7wpXvr0KjnX9DkVjDAPq1tPwafB+NdWTTVXg9C5P2uuSnQjn
X-Gm-Gg: ASbGncuOTVE+eUbbkHtT6BCOEuEda1X8ZWF77VQ3uCbIgMe0L9Bvoi4YvbimQVBLmcc
	PTr0S1JUaCt0nHa/VxFjhztcmq97VxIUbzBBSDbl1rMe242GwCBCsyjOeHWhlfofb9AsYIkBI/9
	v7bBggbapXkH4P4GI/jzhFFQ6QQun7pMfGNFebSEJcDAIf0089hh+Emb59s48xkofEF4esksooX
	mfkq+NXqwRlitEuj2LRsDLnkdZvxSWFsMn5VxcnBuxiF4qz0lj4KvRIzYsralho+k4taiNp4qbX
	iUZFvVE6baBtI72kZ3h/foM/Kh9dRol2U7nv2cYsjIdy5qccj1tAF9V7spDDvhv1Ds/7qWtDkhh
	LLw==
X-Google-Smtp-Source: AGHT+IGveW3w0SKQKx8LXKO0L/gAvng9bbQi2cKgrZ9bQASh6DROV0jb7VWS/TE7EA2uJePz27ztjw==
X-Received: by 2002:a5d:47a9:0:b0:385:f249:c336 with SMTP id ffacd0b85a97d-38f70859ab3mr5498849f8f.45.1740216637740;
        Sat, 22 Feb 2025 01:30:37 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm25790168f8f.71.2025.02.22.01.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:30:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH v7 08/27] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Sat, 22 Feb 2025 10:30:35 +0100
Message-ID: <3860147.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20250216183710.8443-9-ryan@testtoast.com>
References:
 <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-9-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. februar 2025 ob 19:36:08 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The mixer in the DE3 display engine supports YUV 8 and 10 bit
> formats in addition to 8-bit RGB. Add the required register
> configuration and format enumeration callback functions to the mixer,
> and store the in-use output format (defaulting to RGB) and color
> encoding in the mixer configuration.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>=20
> ---
> Changelog v4..v5:
> - Remove trailing whitespace
>=20
> Changelog v5..v6:
> - Move color format and encoding flags to mixer and add struct.
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 54 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 11 ++++++
>  2 files changed, 62 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index a170f68708b1f..bc934186bfd6f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -23,7 +23,10 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_probe_helper.h>
> =20
> +#include <uapi/linux/media-bus-format.h>
> +
>  #include "sun4i_drv.h"
> +#include "sun50i_fmt.h"
>  #include "sun8i_mixer.h"
>  #include "sun8i_ui_layer.h"
>  #include "sun8i_vi_layer.h"
> @@ -390,12 +393,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engin=
e *engine,
> =20
>  	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
>  			 interlaced ? "on" : "off");
> +
> +	if (mixer->color_model.format =3D=3D MEDIA_BUS_FMT_RGB888_1X24)
> +		val =3D SUN8I_MIXER_BLEND_COLOR_BLACK;
> +	else
> +		val =3D 0xff108080;
> +
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
> +
> +	if (mixer->cfg->has_formatter)
> +		sun50i_fmt_setup(mixer, mode->hdisplay,
> +				 mode->vdisplay, mixer->color_model.format);
> +}
> +
> +static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, =
u32 *num)
> +{
> +	struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +	u32 *formats, count;
> +
> +	count =3D 0;
> +
> +	formats =3D kcalloc(5, sizeof(*formats), GFP_KERNEL);
> +	if (!formats)
> +		return NULL;
> +
> +	if (mixer->cfg->has_formatter) {
> +		formats[count++] =3D MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +		formats[count++] =3D MEDIA_BUS_FMT_YUV8_1X24;
> +		formats[count++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
> +		formats[count++] =3D MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +	}
> +
> +	formats[count++] =3D MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	*num =3D count;
> +
> +	return formats;
>  }
> =20
>  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> -	.commit		=3D sun8i_mixer_commit,
> -	.layers_init	=3D sun8i_layers_init,
> -	.mode_set	=3D sun8i_mixer_mode_set,
> +	.commit			=3D sun8i_mixer_commit,
> +	.layers_init		=3D sun8i_layers_init,
> +	.mode_set		=3D sun8i_mixer_mode_set,
> +	.get_supported_fmts	=3D sun8i_mixer_get_supported_fmts,
>  };
> =20
>  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> @@ -484,6 +527,11 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>  	if (!mixer->cfg)
>  		return -EINVAL;
> =20
> +	/* default output format, supported by all mixers */
> +	mixer->color_model.format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +	/* default color encoding, ignored with RGB I/O */
> +	mixer->color_model.encoding =3D DRM_COLOR_YCBCR_BT601;
> +
>  	regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 8417b8fef2e1f..5f465a974fbdf 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -9,6 +9,7 @@
>  #include <linux/clk.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <drm/drm_color_mgmt.h>
>  #include <drm/drm_plane.h>
> =20
>  #include "sunxi_engine.h"
> @@ -177,6 +178,11 @@ struct sun8i_mixer_cfg {
>  	unsigned int	scanline_yuv;
>  };
> =20
> +struct sun8i_color_model {
> +	u32			format;
> +	enum drm_color_encoding	encoding;
> +};
> +
>  struct sun8i_mixer {
>  	struct sunxi_engine		engine;
> =20
> @@ -186,6 +192,11 @@ struct sun8i_mixer {
> =20
>  	struct clk			*bus_clk;
>  	struct clk			*mod_clk;
> +
> +	struct regmap			*top_regs;
> +	struct regmap			*disp_regs;

This chunk is DE33 specific and should go in patch 24.

Best regards,
Jernej

> +
> +	struct sun8i_color_model	color_model;
>  };
> =20
>  enum {
>=20




