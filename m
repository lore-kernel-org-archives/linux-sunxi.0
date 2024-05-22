Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D5148305
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416726; cv=none; b=Lm7eK/nJaLTvjleN+OiQFKT5gptjm8UODgghwAk4X0iUd3yA8aQVINn3D+QzVpM2bcUeIki3tqL6oga07nTZp21gW5827s5ir6Ah3dTTXAOkGp13nCib9LhGZa3Q6CUralxgALpSbuT5wtddFlbnHiQuzdd2HfUHtMZH0rciPBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416726; c=relaxed/simple;
	bh=S9gk0oHEgZRttCqVbj1YGaYY20MAg99heofbtYJxY8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJtWvjWUX89pZNDrEITWEvMIko1Tjsbr+B/hN9SmzQenfnSDbD99l8uvAly7a/mO/Y3C5wHlbbSHUlQmVM5zBfwKloeXoxiluQ8xq23YCt7rBlvtSGrtwa52ySx7LOy00EkwuO3hp1q4+PbTEdR83Kx0ufdNbliWcLnIXZxGFOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CpPp30X7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpPp30X7"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f72a29f13so7470437e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 15:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716416723; x=1717021523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0B2JbRhNTxBGKVMHTsItxZYaFytK7xf2SG3yQV20MJg=;
        b=CpPp30X7BULYb6JzbvsPfzvdsOB/bgAa62Xsj8aN0/aWbe4HRxJTlKBO2pJ8USoNJT
         g4QJs70Y0h37NQ95wgWjl0Mf1DtrINXDnl++m6sOB7qVWT3pfg/u5A3W2sZIgH8AUtCJ
         xGZHHKsdCsrqA8J98lNhxaA9Z4AWs7oh++K1nFtE0mHVaVME+IGxmg6mvcgLdO8IpILP
         sKJMQVs/+I+P+nYPj6TPJ3F1Wa9XDi91JrwQht2Pb15JTt7xSNuL9fG4Hc0xS9F8xbN/
         p+PeiE8NQWlqJ0+vamdUbbhwKK9xQL6OTzdjmGSJIxpfEMGw4kkMz9cp3VLQ/hH+hzSR
         ohtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716416723; x=1717021523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B2JbRhNTxBGKVMHTsItxZYaFytK7xf2SG3yQV20MJg=;
        b=QxFHCZG1NdqNiKExY1q1tCAW680N1qyoAR+U+ESSBIsIDsZyny3Dn+Ew8avWP0iwpy
         YhvkzKoQW42pa2LTStgUh9SmojPjPgeIpHWhplGro7obGOIqRuwsJFUSJp2abtM5576y
         0TcYlBtEYl3UfCKFVaGYNUtnLomGSbaOYhQUfmKiG0NjSx7yP6PjTkIjei6C9wqpYBtD
         536qDp2o50xJ+DwyvxkN8dOg2zwCTfhLeUBOKUnPBs1k7LAFxVcrPi6rGPsr4s1va5Su
         +U7HORyRnm8Gw2VW/XrdoJMwMizepS8eQxCFEBIttChCqZuTCvqEarFxMQBz4RIu732O
         UOeg==
X-Forwarded-Encrypted: i=1; AJvYcCUQObbcbC6tZ99aNVZSA0lSvBSXuePiKZqS5P2dV5Eg1/VdNAe9OTAPi0I6MqMorCGVK4LcHMBvxCXDmRcNDgHjMT5b0XX/stefhl8=
X-Gm-Message-State: AOJu0YyA2IUYb9BNA6V85ZK707Vfp7JkRxnUALS4yx9WlgY+aZdtAUHG
	p9DaqkhoZtGL8aJIuvJj2QiBoGyPs80pMkWwXOuhKNbsIP3yZpNqyuavpFivfiE=
X-Google-Smtp-Source: AGHT+IEdRcdYbBoQQzpqYVDzxkuMPcPMqGC5L1AwkkRW2Odahvetj8UXht61AaeWnM+5cMkq4/v0ww==
X-Received: by 2002:ac2:5ded:0:b0:519:6a93:ed3a with SMTP id 2adb3069b0e04-526bd6935bfmr2114964e87.23.1716416722617;
        Wed, 22 May 2024 15:25:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad499sm5106336e87.20.2024.05.22.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:25:22 -0700 (PDT)
Date: Thu, 23 May 2024 01:25:20 +0300
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 05/28] drm/connector: hdmi: Add output BPC to the
 connector state
Message-ID: <ikljb6koxeg6urdzjyg4nbqtl6pzxs2vakavjkxjudsjhsklyp@3ib3inb2oq4s>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-5-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-5-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:38PM +0200, Maxime Ripard wrote:
> We'll add automatic selection of the output BPC in a following patch,
> but let's add it to the HDMI connector state already.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                    |  5 +++++
>  drivers/gpu/drm/drm_connector.c                 | 20 +++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_connector_test.c      | 12 ++++++++----
>  include/drm/drm_connector.h                     | 12 +++++++++++-
>  5 files changed, 63 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
