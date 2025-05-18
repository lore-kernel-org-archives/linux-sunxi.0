Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8B836D
	for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747587059; cv=none; b=lhpTIXW2zU9V6VAL9JlSlXTRd8kb+0ZXVcPGSn1GeNvM6GFknk664AiZkPol3rgILyDoK9AxNIwHWK6vOJB1CtfEmR7PVqJO9Z2JAKOigHS1HIu2BAypfeJ527X91xSYRRJj+AkH2/9w3KzFEuD+1nYHY+uHAU4R+KiYDIKWPRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747587059; c=relaxed/simple;
	bh=Cjf9RkohDGX9YYNtqE4vGQjyj1EQX8nQWRzC7QDYNLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZdQjZTMcHMGnHTr7s3Ju3JjeaBpDQcLsaIfwk5LDzoa7g9A7zwY5e7aY/VIyIrE5viotgNwigLgwzidoGF/FnvRJBOeA5vpAVFtpKGsws574Vl+o5Lm+n2ucBO6MjMhr/ghBiCD4gvWhhgHBgqIjeavlwUnU0mQ20DKrJt48gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b0d638e86so4823349e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747587051; x=1748191851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMCSgP1jqOSpYfOyIfGCKgapP8IcMXQbC49KZ7zqoq0=;
        b=WiIXaoR5pcMVf9ZA+7bFttlryKqathgTnGyBjchsXlzOf34PyAAAbNrJ7Yofhhmtk3
         1LEFH/tyYowziggh7VOgObsFMdcvw85EEoVVVVvwdRUrPByne+3wX63jruVTuFxNX0lr
         BSAPNvELPXoQ0lWXulwiGP/RsunJkG0Vi4l4k071Baqd6Z3bG0O3eAbJSWEM7pwWm3T3
         1A1iKZPSV3xcY1sSlrQsoROahwW0IVoaWd3HVk9hFaeP+geRgxpTugbRmBo7DlSnH842
         3BNrIdES+dJ/Wir3TUHaElj5Xn2roRz3H1W8ARWHZ/MWoNO7EmCErEPKKrU4jD9pWcxH
         sgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWHZTIwX4c/g4FDzCA8hcExqMTiMMLFt94RxjZfAhOMeRjxQF13wRJCjXGZPlAhcL+TqnDqqmkWo/Ceg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYX+zFaGaJJHfXEi7vcKs1/gzw6GdUw60RlN8UvWaUPxdMUXhQ
	bLOTaFNx1bpOmSx03wjT7L/db+Vj1dbnYXA5y4EmobALuGM6UgFbsm/gxRKyjp5Lues=
X-Gm-Gg: ASbGnctfgdkoxOXoSGNfcRx2wV2FLhRD3wB7+4XDiRBBXSntHGKoDlJmUObTSLt7XS4
	J95ghksa883nPZat45568RdChnnzDXREBL8fvHz2OOF7j8gQdZPnhaKQDq4aNl4ExbsjRA/ZFfD
	7eeLSUx7X1XCQeEQ3PUxYtvXeqxMWTtRV0RA4iqNoHGUsnQXjaqj0EAjtLcLSfDwenjNyLYc7T0
	qzs9b/UFE667CgyFTT5bVga8THJ6CEXv19vd9DlXzluf4njEXHEcVT8xv+pb3gBwpE8cAWERr8i
	WReabMdPYV5FbIfSOqG6a+auxkNuHOiU08I2cUesl51TVVa1hRj/SmxShhA7mvyTBzFG7dF28DS
	dXbxUc0C8
X-Google-Smtp-Source: AGHT+IEpo/AaHx23lh36KBjQOrg3/BpT4LpWuDBOjmqE6uns2I/18Jy8Wtiqowh9aIMRZf4hfFD4cQ==
X-Received: by 2002:a05:6512:220b:b0:549:8fd0:bad8 with SMTP id 2adb3069b0e04-550e97cc44amr2553948e87.21.1747587051358;
        Sun, 18 May 2025 09:50:51 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017ef7sm1470616e87.108.2025.05.18.09.50.50
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:50:50 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3105ef2a071so40632881fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0xbLNdA9UO4KCi8WlCy/fml4wA38mbxjl5jiYqxZqzWhV4XBhOMhMN04QlRitw7tpi6E9A6W7bXFhOg==@lists.linux.dev
X-Received: by 2002:a2e:8a88:0:b0:328:685:7cc4 with SMTP id
 38308e7fff4ca-32809782356mr26567051fa.30.1747587050098; Sun, 18 May 2025
 09:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-7-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-7-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:50:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v67oQhoM9aFnOX9njcF3USmEz_80oqfrmY7jrMboHT8fEA@mail.gmail.com>
X-Gm-Features: AX0GCFthsimZ1Vpr-P15pdmflifaZ2Czon48jDxa1m9hAkmxkrKyvTCzCS0vxW4
Message-ID: <CAGb2v67oQhoM9aFnOX9njcF3USmEz_80oqfrmY7jrMboHT8fEA@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>
> Extend the mixer to support the DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> ---
> Changelog v4..v5:
> - Whitespace fixes
> - Correct strict mode warnings from checkpatch.pl
>
> Changelog v7..v8:
> - Add top/disp regmaps to mixer for DE33
> - Remove YUV-specific code
> - Remove use of global double buffer
> - Remove unneeded if/then parentheses and fix an alignment issue as sugge=
sted by checkpatch.pl
>
> Changelog v9..v10:
> - Use names from vendor BSP kernel for register blocks.
>
> Changelog v10..v11:
> - move before vi_scaler patch as vi_scaler code references new DE33 enum.
>
> Changelog v10..v11:
> - Convert de_type enum to uppercase
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 82 +++++++++++++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 15 +++++-
>  2 files changed, 84 insertions(+), 13 deletions(-)
>

[...]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index b75008d05fc9..870f9b9daf0d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -21,6 +21,9 @@
>  #define SUN8I_MIXER_GLOBAL_DBUFF               0x8
>  #define SUN8I_MIXER_GLOBAL_SIZE                        0xc
>
> +#define SUN50I_MIXER_GLOBAL_SIZE               0x8
> +#define SUN50I_MIXER_GLOBAL_CLK                        0xc
> +
>  #define SUN8I_MIXER_GLOBAL_CTL_RT_EN           BIT(0)
>
>  #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE                BIT(0)
> @@ -154,6 +157,7 @@ enum {
>  enum sun8i_mixer_type {
>         SUN8I_MIXER_DE2,
>         SUN8I_MIXER_DE3,
> +       SUN8I_MIXER_DE33,
>  };
>
>  /**
> @@ -178,6 +182,7 @@ struct sun8i_mixer_cfg {
>         unsigned long   mod_rate;
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
> +       unsigned int    map[6];

This needs a corresponding change to the kernel-doc immediately
before it, or the doc generation build will produce a warning.

You can keep the reviewed-by after fixing it.

ChenYu
