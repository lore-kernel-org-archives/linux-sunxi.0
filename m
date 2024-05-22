Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E080F7FBD2
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 22:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416216; cv=none; b=B7OwnDeul4C+UN2zTd6PGeVm+qhVfff4O4jOLJSLaMJJt9QyBckJehlK/KZsQU+k9woLq2mgo6xT7UTG4EFKx5Ih/2Xoz2dxtxoToHATx0/Py54BJNV9Je/m4xjCLZGfK5uidJE/DqhdPMRtJ2YSEVqDkkd77nbkKikIATnRCho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416216; c=relaxed/simple;
	bh=So3o6Lg7+fY/3iQje4qLIfCyvlQ2gYJIGQIhupPwnWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ugj63b4srHQKa5FfIxgmsVbLsGQ3q1MHPmwrx6FwIAkacMNO8IyxQuTt+94QCUqXnF3OrMkkv1DPVPTb52/m2a8LGRSBQo2pbS6dyqYqBHGDRBmaonzuNu+YtVdp0arvYCIvPAWNBHQd/bKQwZWe2U7g2BArfko36ZLlYPWcgGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VY8HZCkH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VY8HZCkH"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5231efd80f2so7767002e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 15:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716416213; x=1717021013; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOv8Z9OuvrouyMMtf2t9ALTmfVkIrc4vJ4mhIPjt+Xw=;
        b=VY8HZCkH0pALvR3XNiFVFSVDPhM8Vp5ey8hlBmb/s0Xn1pIZqHnv8fg8WrUiv7Ogwf
         4eb05ogXnhG3YPaADBlU0b/9AM2KsGtPRIwcD9MD5h9FZJDTBM/VfEk1lPPJu0buhRr0
         u331D0loM9KjM5z6YbTE9YVrZuBXXGfRkMZYrA5WbCg3IoTbJUdXVDiUsY+3ZVNR+xQl
         nCmRqMknpOJCtkgavJH8ufrVyNUtcszb2Jgwsoz1cHiXlUDw62PRaPoJbmXuI4XZ5BIw
         NWvsPmt18qSKGk5Iqw3egS1kF/3xcfq045NxGBJptgt84Sv3hdvJZcwSG9ihEv9yWnpM
         7HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716416213; x=1717021013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOv8Z9OuvrouyMMtf2t9ALTmfVkIrc4vJ4mhIPjt+Xw=;
        b=N7fLJYvFG58vKTkP6un3+vNP5B9hMFVJ/9EIIEqet1qQ9etErjPXSU73Gx3lLiAw70
         xnGQWAu3qY8Jpdl2yc2R1qGpYBueQi3SclcAb6g1fLOD8zLO3zUHHZV+h/9QN/+uYZxh
         uTGfiDJ7/vpfYPAL/cBBPUmWHRiVrw7Qtb0w0ivUvIP9C0boQmiggNsdJk+mXPS3Fb41
         EpG5h86wW75gl5xMDYrWqSynS7RVV7Z6vGbC6YImSLfYYbr1m6d9JgLsTi4DWKVk6RPJ
         YvPQDiJAbYwf13Yms8OjTyhccVpKvNWHGBlsMup1U9UK99ShMzPLCT9qG9OuzDiyfRtr
         TEJg==
X-Forwarded-Encrypted: i=1; AJvYcCX1cChPDmDuxVoAPmFgb0eQHmlmALB2tFYvgBGROKHnOK8c9cQnPX5R0GZj8cftZv6spd9vhDNtycVvxF5f+yl12QFuioJ5xspFg64=
X-Gm-Message-State: AOJu0YwY6c+sZek2StwaXU50woHnVM5+vY4tWjEYPxvj0zecHGaSLed+
	LGLnC99pJHClp6owBg6fZGdglm1QqhLJ739P65lTbXpqXXXBNKeRaiqJhEhLyZiTubH1OkGYmio
	2
X-Google-Smtp-Source: AGHT+IEuFGymLQfp5rTalVoB9wZNPMs9O3YdvgJXkOez5hZ61Aob79NQskger3tI6SZIHM2Dj+fRCw==
X-Received: by 2002:ac2:5ec6:0:b0:523:8a79:ed62 with SMTP id 2adb3069b0e04-526bed9e8famr2047667e87.3.1716416213020;
        Wed, 22 May 2024 15:16:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5238f6fee2csm2840002e87.181.2024.05.22.15.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:16:52 -0700 (PDT)
Date: Thu, 23 May 2024 01:16:51 +0300
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
Subject: Re: [PATCH v14 03/28] drm/tests: connector: Add tests for
 drmm_connector_hdmi_init
Message-ID: <ex52reilea7p7fkayf47cuewa4cpuaxpq2ezr7f6cvflmpugc5@bbeo6uvs32kj>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-3-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-3-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:36PM +0200, Maxime Ripard wrote:
> We just introduced a new initialization function for our connectors, so
> let's build a kunit test suite for it as well.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 123 +++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
