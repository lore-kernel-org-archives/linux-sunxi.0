Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A8811E0
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 22:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416247; cv=none; b=HpAq8kWD6kQwyCGwActgpUpCC8Ox1pyZaBoJLirWl0nS2X99zrcvl09RiWKdP4s1D4zy+nq2bpyLaqJK36HbuaPVD0pKdqvyy74FYsMAWPNaV9J6n+MsV5HbRR+Vt96NnIm0U2NH0/NJ/XLI6ICeN998NCk228mj5eIayKpdu/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416247; c=relaxed/simple;
	bh=//b3G9sO2gtB09XWop8ljHzV1PwbXxvr5BFI95w+WaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDYLorCGmpL+83wcpnFIgJsmo+R5VkidbCOEL43l0JEcbQAfK9inilnJ4U9tDGL3nOWTIMxOvZGouMiDcqxIJeRutLIZIVrPCwlsMpABKnf6+dC8OpfRR8JIXA40M4Tl5njcVVVhQAyOsKpyS8ytE4lEX7uuqI3Fx/LVoGG6W/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hgwG/ibS; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hgwG/ibS"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52389c1308dso7028906e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716416243; x=1717021043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKjPVo1pobuPoRvHj1uEO1HEyVXXDgMeLw2a17VZbrU=;
        b=hgwG/ibS2qPapBkX0gHPQotNymb+v/C1rwpZgyJvDDPzuWKkfrgL0UFL8vlHN6TDVT
         Zn3Mz0baiaWwBygBt/9eqURML8Xy6Vl72A//mVwGRL5mV9m2/akPUnjKi+Q8tIQ82Z8p
         tBKwVQbCLgyceU/mCgAFmdmz43DBhuhiRK6Htr37x9lTELEbrablE+kMcZY6r3U9lB5F
         pzo+TG+IonAdpHbcaHItnLosAEpQwNyLLesbC1GnPh9w99HBTQ2mMrfVwk87vNXsGGXV
         fvG5DoyUEF6sjiJ5Qx41zEdsjSilBPZQraXivL6wnqUL0/aEDHVgwiL93ULa7x8SvAjW
         v7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716416243; x=1717021043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKjPVo1pobuPoRvHj1uEO1HEyVXXDgMeLw2a17VZbrU=;
        b=D9pcxsH//d3oX+hF9JdKT/8j7w8KpYus7Mqx/t94TRvktLZGMvsUw2mx7I0ESHBU9u
         sxw/qzKs+4Nz/pAymqXnfTGcif2pt2m2fk3g/Aglffb8tCn9qsL+bl67rcyc6GfqqLDn
         3Bnwr+iMzAEG+5ihR3hUG7QlyeWhyL4er56BGcoMH8/ftMT3EGbcBNngjxoxntK9BEkV
         aQIWNAHjTq+oWX2b4fGlShGSNoImxtMql5PVAZjHaalrGq89Kz69RPGW9CWG+5Gk26Jo
         tDQ74FRgXCfaPfG30T09wOt7vh9stPfPeyp+osJHgDGVSD1qVW330t8Tya53Jf04dx7L
         cfqA==
X-Forwarded-Encrypted: i=1; AJvYcCWrjkFWeaD779k8V8wEzL8idfEKapSBb9YOPcNDI5RW4ouJQVb6c9hk3xaL80oc/IWBgxac2HdtzlH02hrNXghp8EmBo42aFNmmUlQ=
X-Gm-Message-State: AOJu0YzKuEiIS2WwqU56LgmFv2DbwiUucfYYTT5kv0Dl5sRNqoMsbGIe
	QjzldubSt8Rvm5VVddln8/5Bxx/ziu98btx5UxlG0lRYXBWbBE7No4+Cw7A10I0=
X-Google-Smtp-Source: AGHT+IHfhjtR8bEAU54UWtngodjp97JPGUmwO1OM74aRntp9IkGMZ3Yej1SUNJLq9vHd0wtc+li0YA==
X-Received: by 2002:ac2:4c95:0:b0:523:72b8:8002 with SMTP id 2adb3069b0e04-526be315f14mr1967940e87.30.1716416243518;
        Wed, 22 May 2024 15:17:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8b66sm5075515e87.195.2024.05.22.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:17:23 -0700 (PDT)
Date: Thu, 23 May 2024 01:17:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v14 04/28] drm/connector: hdmi: Create an HDMI sub-state
Message-ID: <zeg3lwkgc36lheoh3wdieexta2roqhhx74crxtw7dygdffkgzn@fwkfx2ixhu4q>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:37PM +0200, Maxime Ripard wrote:
> The next features we will need to share across drivers will need to
> store some parameters for drivers to use, such as the selected output
> format.
> 
> Let's create a new connector sub-state dedicated to HDMI controllers,
> that will eventually store everything we need.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/Kconfig                 |  7 +++++
>  drivers/gpu/drm/display/Makefile                |  2 ++
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 41 +++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_state_helper.h     | 16 ++++++++++
>  include/drm/drm_connector.h                     |  7 +++++
>  5 files changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
