Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA91465AC
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 22:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716415958; cv=none; b=oeblbFZSLFOsjD6r0DVt9eof66VRIEHmQYYOHcmAWwu9NVoWvNK95KHkTIWAESu2WHVDTwnW2XBtIvGS6rdXt7vu/C9xT6mOstQ7D6v5ugLJ4whc1c0qosPnJSK8/2GkNpO/cbKXxor59bXd4jbZts5KjWO8zLXTlFKIvqANk/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716415958; c=relaxed/simple;
	bh=fDOnQ8n/6U8eCK1Py4zZQ5yun47iYE10SbmdRNCSXao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtrsFbe/PzwPN+/LJ+9SNJKsr/w8sf32nPMSivSkxyCOaS0FdlwZZtuYLlai000lT91wSjWjTCAIhj5iLAqTYoFhAndq4ND1F/VqNWdcg0VkZmkkoubRk/zwBySgzL9gxzHFd+tYqpLasKPS/CNNw8TtLHo7X4RVSrcQg0F1z2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6q2yT76; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6q2yT76"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5210684cee6so7485041e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 15:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716415954; x=1717020754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQOeeyMaEqMnu39Y+NwRU81Ky5s55spLGysaOpoEjNs=;
        b=e6q2yT76TvGLE9jXvQ78HvgYhBNew6hfj1PpQZtIWZmlnz2R+LrVxeBYIfdFGM4efD
         s0+KQjA021kiEFHspiuYsj2UrKb2zWN9xQgvdbr5pxgKfqDTHwLUsSjC75tsZW14e2hV
         y5LtpH/iGKmsL6mAgebk+ImbCQ2nywH21VV8wX+0iJAiOhEAwNBHo9cN7w+V7LCxcSQr
         OLmpG/MuTJkg2kVISFKqOsbbnwKH6+ZjpLm/FpzJz0Qn0+4WgrEX2FbQz3JDHJBB0vBj
         fbUE8cqSAGpWRkI682aKYTICpR8LPPzoUKQrp24HMkYw1SlcIxaQsunmPqxxP75CDlyf
         5OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716415954; x=1717020754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQOeeyMaEqMnu39Y+NwRU81Ky5s55spLGysaOpoEjNs=;
        b=gs2D2Q2ECyaq0eNZ4lFGpjXtqR7EYQnEJUW6KES9QViP7X4XrWwqWq3AHzawuVx5to
         3k5vSwGHAnD2PIfxpXHKFA/NQbUXGNQDe1xxfZVBK3PsxMoIgHLt+uCm369doK6I36Ul
         mLw47c/rU7SAxld+0lMv4CEpR1mINBapFQLL2yqXGB21eb9Etg44VTqn1ZFlFyzI0XL2
         1hd8HDpLq5ou+ox0/4l9kTVLX4IC5yfxPQmLDIK4QaAD4gfnvx25QKnWD7GbHA96lNlT
         CAcDis/QmGcp7UIx7spVd9jZMJ+Rjye7Za3S4FRN0cDQMD80j3yWGjBsZHs4UqCprLO7
         f0kw==
X-Forwarded-Encrypted: i=1; AJvYcCXldZXfvI7v/ODntFjG4VrxjjTL0NvpD1m4/w9dmAoPw8Re8dICY5NBSB8B3SDjWQIXN08iz0K2eyn5s2XVs9ui8gVhTxTyVSbknbk=
X-Gm-Message-State: AOJu0YyjuW5C6Phra7kFGiBbpd9PCsIFCum/ZM5Mi40QH8ONCID5uORR
	teq2Fvpn9g5aEn4MIcLdabS0VLZLzicxA5pNFh0cMmljvIly5xK5ma8eBZP5vXg=
X-Google-Smtp-Source: AGHT+IFmy9iqYhx6F/MxVLTLyGH1Ov9kV4rl1NcWdUJFcx0idK0FYhwE3IrOr5DzJF6JcDSGkx+xHA==
X-Received: by 2002:a19:431a:0:b0:523:9493:4e63 with SMTP id 2adb3069b0e04-526c0d49771mr1801806e87.60.1716415954442;
        Wed, 22 May 2024 15:12:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba50csm5062862e87.69.2024.05.22.15.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:12:33 -0700 (PDT)
Date: Thu, 23 May 2024 01:12:32 +0300
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
Subject: Re: [PATCH v14 01/28] drm/connector: Introduce an HDMI connector
 initialization function
Message-ID: <g4eqwhtbdtqyhjhigtvsplu3hxdyrggkowssgh4b6lj57t6kqh@mptafawe26m7>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-1-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-1-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:34PM +0200, Maxime Ripard wrote:
> A lot of the various HDMI drivers duplicate some logic that depends on
> the HDMI spec itself and not really a particular hardware
> implementation.
> 
> Output BPC or format selection, infoframe generation are good examples
> of such areas.
> 
> This creates a lot of boilerplate, with a lot of variations, which makes
> it hard for userspace to rely on, and makes it difficult to get it right
> for drivers.
> 
> In the next patches, we'll add a lot of infrastructure around the
> drm_connector and drm_connector_state structures, which will allow to
> abstract away the duplicated logic. This infrastructure comes with a few
> requirements though, and thus we need a new initialization function.
> 
> Hopefully, this will make drivers simpler to handle, and their behaviour
> more consistent.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 39 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  5 +++++
>  2 files changed, 44 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
