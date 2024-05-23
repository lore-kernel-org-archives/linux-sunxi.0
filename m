Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E21F13DDD0
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716458668; cv=none; b=kFz1yOTn+yaHP/zt9kLwRD+kKwrJ2L7+s8SR+nhn5nLdxnr80i2MLI3+K+S4v0vgv7D0Gz25HzadwLPazOktK9AUZSrcqawnhL1YFDWouldWuRREv05TLIfuD7l6gpPm8SFBC+j765s3130xhR+z1N2JPa8sX54hvbcyopAcf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716458668; c=relaxed/simple;
	bh=O4KCTeshkfk5LZ7Q0POVGtoHwRI1v4DW1pm6Bzo+dLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BajBmgkJ5PGPzeT7xcgBvpFgmSxU1TYdPXFwxFBHYBRX/xJxHUAUGKp4XL76Yw0NBROa9gkv5RL169UHh8AAc6f7whBOmpBkN9sdORQQQ3MBza76medn5v7K7vxL24qU7sDk1RDYdBsgOolEg3RODCIFsrIZjkyt8QXigKBYCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qo5E5wKv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qo5E5wKv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f40b5e059so8306358e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716458665; x=1717063465; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y4dfGDIGi6g96GxO6el+LliDi+3YKJVZHbevMlNSfR0=;
        b=Qo5E5wKveq4wTZ0/dOuN6QU8n9F9UL6NVHdAKhkzP14+WsCUe97IfjTkZRRbK7aX9H
         GKu36B0CBIXeOvKT4XlCpm8mQcfx7RswDfmunc4Yb4znuhAZHgAkknLfx3OG3+0VMM5t
         DsJFrf3NLyn7QCq8B1VTY+yFlku965xy8xdDRuWeqPX9u5pJr++7lOtZOiIQZ7lzLIqC
         IG0GJgzof/aemlU3Sn9j4Aeel5npu+G6vclnbqi1tOrNMBS0rktK8UZG6JVpIdQyqkNe
         3tvGxkybsXKd2woyUI7okJOAB7QVyol1jgfOgCfHgU/G+PCQCd+xHDox2z0dHuon/Sp0
         rijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716458665; x=1717063465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4dfGDIGi6g96GxO6el+LliDi+3YKJVZHbevMlNSfR0=;
        b=CtmStgWohDiU62fGG3y7GB7PlqfxbSgokqxNSwhnxuxQhIOzyc34zq4v1+9R1nGSs7
         EeQYi/UZfKdk9zLFTRWZiq3OHB5zY7nM9LzfbcDvuvDEAc1QPMI9+OT3jz15DQ4wBOyX
         qYRXbh24E+1NPonlLMRH5Zb4Uy+wR5HxvshO0Ki/kqOf93Z6kzQxNPt8mx+QA5Kiro4J
         QNLOr7skqW6DEPIUxDN4qDxD/qvV4SeRzciQkUHoyXY2/PkjNFAJ/eRe8gx5lvyFXouA
         jV3GckgLRhqhXHSwBjVampuMkxKBlwwe4yvFUmK7ejjK+dz86lajlTXH/rSubWx9QcQD
         zagA==
X-Forwarded-Encrypted: i=1; AJvYcCUen7IOpKgyhTy+P5HD/jkpV8YprXb8pGZ8ikczgXE8NrmxtoDP02DXhS6grZkC5T59CtafoIwg7WGRgfOBPPJ+yYqa3NgYaqoMDTI=
X-Gm-Message-State: AOJu0Yz30s14lYGAWldDqFy2jxiLe8hO7BjA4t4PguG4hDFfrl1RBrzP
	64OPAssJRCRHsxGUUQ1K3q0giEZ138mPivplA02ZFbcMgjeJdsRoMIMHFcI3D04=
X-Google-Smtp-Source: AGHT+IHI9JqXzb0Cyfhcs6KeNERwPEvQfkeVQfr9ZS+SMw0TkOUBh/ztRskPl/+x+XS30MmAlFxklg==
X-Received: by 2002:ac2:5044:0:b0:523:3be3:cbfe with SMTP id 2adb3069b0e04-526bfc02bbemr2577217e87.65.1716458665403;
        Thu, 23 May 2024 03:04:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5236d2e9ad9sm3382898e87.178.2024.05.23.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:04:24 -0700 (PDT)
Date: Thu, 23 May 2024 13:04:22 +0300
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
Subject: Re: [PATCH v14 14/28] drm/tests: Add HDMI connector rate filter hook
 tests
Message-ID: <zds53yg36qf7ft7mrvvgv2k5avbjib3zy2pdd2azrnvthppngu@2bep5gso3wic>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-14-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-14-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:47PM +0200, Maxime Ripard wrote:
> The previous patch adds a new hook for HDMI connectors to filter out
> configurations based on the TMDS character rate. Let's add some tests to
> make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
