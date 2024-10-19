Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825948CDD
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729347071; cv=none; b=aadvYXq4HJaUasqu1nBQZiO8ZUfaguQ7RJCy25y6R+VBdeexSsuGw1VB+6U8AZMsqclYoefaFL5w+I789swLFBFmpFw7RtONTZh4DUah8hLGYzc/gneP3OZhEEYTbh4Z08J9xv86/YFL6zYRxjrDuH2gied60CgMyPgqEwogbfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729347071; c=relaxed/simple;
	bh=FpuzHWVrvatpfwMJ1QvSD5uJ4cdZ+VeHi0kf8jBIBPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAj8uVqYbuz0lxyIjEoa5RhDGu5hgCEaHlHRqtV/nF/vGIlXUvxYM4z7nXHfPAxLPJdvnRrDvNgum41pO8gRAvQXyOoPY6yPbKut4A4Jtpp3pq/FkbJZPnKs8FMky2OPiVuO5eiLtwl7OxE448uDi6AueybZ79vNfrIf97r2J84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgLLIgNy; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgLLIgNy"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e59dadebso4146557e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729347066; x=1729951866; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KFyqMGDzEiD8SJfgSIuL6OhjikfOSZdJxwOOF791tUo=;
        b=zgLLIgNyhRLkii4MAuxBRgIqSxvBBYEKG4Udp9JbVRrnXdwCDp8+Xavo8tQ9NWid4O
         Tk3RjZ382d3tV/tQn5BFqWoZw70vYYU/0FLxXW9O75mvcToDBz5I1GhRC1DKMT3h6eLF
         bpEFUzcjQML0WzNHoVRFrwg6RbUTt8MBPzNlCJZhigk70JRpbpMe3yQyBE5UxykaX4/n
         dzslA1ahpyzIZV/zfqr8QAMa9wgMMhqSsSynztL1Ct9KWyw1eYbevYRXYsV/b4rZzvmK
         0N5R6RnmKSy1nNM5jn814hT87jgKW2vsgCELRwnYcvczy42ZT0i7SHnLbRa5P9pz70pg
         clOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729347066; x=1729951866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFyqMGDzEiD8SJfgSIuL6OhjikfOSZdJxwOOF791tUo=;
        b=As4M4G/RdCb6FghRg9vTvHzHhafs0uRJYJzYm9gsB+xYXhoUa9aPMW+BNxwv5nx9R4
         MoeaFZ3P1oRwME++q6fJHRTEdTlvSlJB20zRWin4d5HKHOPNjEIB6WYCWvJpCf3h+Cgz
         5p2IzHdkoC3rI+l3BN21LaPeUECRCA7kitjpaHnmZSI1ZA5GhNTPp3Loony3ZfEaDA6+
         MzbZF62wLmM+2GQwvYioHN3pMecMiUAaDStQcW77QmH54ed1Mz14RPAY1okDi8m4XoMz
         puLlXSnpgxixoRlYtuEcQ5S7ebi9PycMujeUgBYelnkF5eCBM1qpkQY0SgbndnNO0e8d
         bRjA==
X-Forwarded-Encrypted: i=1; AJvYcCWcc9WcaPfDocZpqctisMcvuMf5P3ziQSab66PBnQM9aJk2nlJU6xtcAYCfHoecMry2drjo+BfdAQzGbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLHvdgZ/L5M7QTOemQVAtW3jqoPLLv729MEkeh6NzLR2Rrz3hZ
	7wFkor+2Tk+xJXYUjVRRS/k2JU5WEpU8sxCq2wZHXaocuM8w0y/Vicrda5Q/qLs=
X-Google-Smtp-Source: AGHT+IHpUlM2mb4sZE/F8kO/aL/+SbKMUhUOFGlRdpwHPf22GTTWehOQZojukTZmgNNOEorXiPGafQ==
X-Received: by 2002:a05:6512:3e0b:b0:539:eb44:7ec3 with SMTP id 2adb3069b0e04-53a1522d8bfmr3412287e87.31.1729347066370;
        Sat, 19 Oct 2024 07:11:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a152203c2sm543967e87.299.2024.10.19.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 07:11:05 -0700 (PDT)
Date: Sat, 19 Oct 2024 17:11:03 +0300
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
Subject: Re: [PATCH v5 01/26] drm: sun4i: de2/de3: Change CSC argument
Message-ID: <635hn2vkmoyna7fxzgrzp7q3tlk76aoggssjbt2mpkhpvvo4fx@2pmvvxgvmfpq>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-2-ryan@testtoast.com>

On Sun, Sep 29, 2024 at 10:04:33PM +1300, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Currently, CSC module takes care only for converting YUV to RGB.
> However, DE3 is more suited to work in YUV color space. Change CSC mode
> argument to format type to be more neutral. New argument only tells
> layer format type and doesn't imply output type.
> 
> This commit doesn't make any functional change.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_csc.c      | 22 +++++++++++-----------
>  drivers/gpu/drm/sun4i/sun8i_csc.h      | 10 +++++-----
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++--------
>  3 files changed, 24 insertions(+), 24 deletions(-)
> 
>  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
> index 828b86fd0cabb..7322770f39f03 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -22,14 +22,14 @@ struct sun8i_mixer;
>  
>  #define SUN8I_CSC_CTRL_EN		BIT(0)
>  
> -enum sun8i_csc_mode {
> -	SUN8I_CSC_MODE_OFF,
> -	SUN8I_CSC_MODE_YUV2RGB,
> -	SUN8I_CSC_MODE_YVU2RGB,
> +enum format_type {

enum sun8i_format_type, unless there is a strong reason to name it
otherwise.

> +	FORMAT_TYPE_RGB,
> +	FORMAT_TYPE_YUV,
> +	FORMAT_TYPE_YVU,
>  };
>  
>  void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum sun8i_csc_mode mode,
> +				     enum format_type fmt_type,
>  				     enum drm_color_encoding encoding,
>  				     enum drm_color_range range);
>  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
> 

-- 
With best wishes
Dmitry
