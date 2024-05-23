Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8E313AA3C
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457191; cv=none; b=SLJhGX9AVs4+k3uOrpe2C/DEq1Gbnntny+yQzC0Kss1d8noDEWvVUGscY/nt9dcZICbFdqPzfC/EBzh83yRflREDcdx1tTXtwm8ejeKXB6fxfVAAtWtBliXpl6iR9kxZhjyzmC11SaCudxPVBm93A2vj9ls+5sQvd4DK0WmV32g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457191; c=relaxed/simple;
	bh=pANZ9BOe7lIjdlZajVdcF6HeMjTV5Ks8Me0Z1rWXSv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwsyBMIDhV+GwPtjYnh+JUah7YU8y2JRGt7K9is6ckoCNtWkSiWd41Qe7fNek1W1dXEqSwnc4ii2sSs+D2Jo7BQ/By2AnPPesLjiKihwMBfeyhXxT6Zt1TC4Hy8DAtu+exUN2uIPjBsUPdwfZNpY6dvOR9D98LW6tVGMKhwjsUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YiCh6Ch9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YiCh6Ch9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5238b7d0494so7938037e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716457188; x=1717061988; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZr+4M+DoXpeV8oSkkFyzaRfzRj8DnnoccV995epHpo=;
        b=YiCh6Ch9PmiE461UF4QgOTZQRIp60JE51SLhxbTeMcXyr/dpQF+aGBs/9DGIhXtscY
         0YhFhwLFj6ge83SXRZjV7u4AK4kDQy+EGO7x4+QhRLK+39n0v+qGOgwxmJfXdYZjxtY2
         Do3EU6LVkHVhQdM1bFH2hA69CyGJkrNbmScG2IG+rqRSq4QEGtmOIjF2UNPSStpPNi1A
         TBTyAuMhl2CFV7zsdqMCD3TP9PbHrDqv8ZklIdES4nrz5I0tSpEFGmpcVJFky+DNwD3z
         pOQ7skjiLV2B0i37NWEwFAeultvPEv/7UoYnK71XKYNLd01VuFgtYu2yPPgvDJLZg4AK
         guTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457188; x=1717061988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZr+4M+DoXpeV8oSkkFyzaRfzRj8DnnoccV995epHpo=;
        b=SoBIj0gmi3tHckHPX/MnVcMRzbgcvMOVVZ4B9Kv0W9ACF8gTbiPjHu52u9bGi4s8Ky
         I3xHuug2hN8m3uCulqaDNqsTz2bg4shExYZ01UbjEHpac9P6rn4NASvW4ETHbdyDTYa7
         9Is6ovfJnRnnVGuy0qn4LK005gSkcWSBz53V9v1fiSxsPs4Ywliz0a3vjiodJyIB1NFT
         e4Ajl7gjww8Z36PxJB89q6VxmOSAQOtveVCCNGNDTw3eZDP33+Te9bx0eY3OAIoN89xl
         d5xdDUYhjo5jV1aGMxUWsm6s12ujUrYVrbk6MSZ8RB65uccritM/+4xVQKSG9q4wi9dj
         K5JA==
X-Forwarded-Encrypted: i=1; AJvYcCVPul0OyLiTYvd422FCqvR0wkNiArF3CjJXedie3bekQofCrEsLbX1n1z2cmSqHMePABbn6ram7LsmBHLY7F1f3nQySbNGgEiE1Fng=
X-Gm-Message-State: AOJu0YwFHL+BYi6woOqF0cYKMMd8JMnblx6lGjHVmTLYCqiRBpQuwGCo
	O/WPNRzBAXmg+iAXMvDjsiggLzyKthnyw0gEAHfWdMJGG9Uv7p5KoDDhcnca15A=
X-Google-Smtp-Source: AGHT+IHZxrSIuUr68retAsDGyT49V7Bjyk+0v3vLZlctFxxYj5K8ZOcu4gphFsf8YhaZBtcNl5CRiw==
X-Received: by 2002:a19:520a:0:b0:518:eef0:45c0 with SMTP id 2adb3069b0e04-526c0a68dcbmr3895711e87.48.1716457188090;
        Thu, 23 May 2024 02:39:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d2c63sm5212392e87.278.2024.05.23.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:39:47 -0700 (PDT)
Date: Thu, 23 May 2024 12:39:46 +0300
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
Subject: Re: [PATCH v14 11/28] drm/connector: hdmi: Calculate TMDS character
 rate
Message-ID: <2drjirwwj3cwm4saboa5qnhwi7wev5gnilg24u7svz2iw3gtef@jainjgtog3uf>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-11-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-11-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:44PM +0200, Maxime Ripard wrote:
> Most HDMI drivers have some code to calculate the TMDS character rate,
> usually to adjust an internal clock to match what the mode requires.
> 
> Since the TMDS character rates mostly depends on the resolution, whether
> we need to repeat pixels or not, the bpc count and the format, we can
> now derive it from the HDMI connector state that stores all those infos
> and remove the duplication from drivers.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 67 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                       |  1 +
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  3 +
>  include/drm/drm_connector.h                        |  5 ++
>  4 files changed, 76 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
