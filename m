Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA8F13D521
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459938; cv=none; b=NbDGz/XO0zy8ZsV5ejlWPWpDVzwtqrMuqPzaa5NRbF1TbUjWmXcz3jm72BGdNTMYmmOJI1PHrmv8SP3nd7UR8KSDPgGbrZoFeTaJIMsVKdZoc/vSinNwq/8OQ3hS8IukJ8ZiHL4pQUf9yE++0QNK/55PLTvcS91SOjYl3IRwHx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459938; c=relaxed/simple;
	bh=7qYk3nhcej1wrZJb9D0jf9PZ7Z4vN9EkOqPyNt6ofBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAmD+FAbPKFhDmqPup0JMgFzoFoahiCk1ZoRwfyX9rNyk2iuIJ22Gf75HBMrAw9xaBcrvPoQHbbRsJBE7y3lm5Q28nnECtrAKLS64YJkNauLKh8/SMjzRSP1SCDkM7Yyc5aQK0fxisw9lP8gkXPwJ5zr3f3QDPJIFWaBbGpggj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1YhbWz7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1YhbWz7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51f57713684so9036231e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459934; x=1717064734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Y/Ql63/IxwaJL+O/h+E6/ion+Rk9v6vnf8eimobm8=;
        b=x1YhbWz7sFakfyfaH1O0u7ghWq7aa29perhCkD1wwJZGB59B465iARvJVGlgywswLH
         VOPj7gw5Cnx0lU4dyyRQcbeiXutSin4TxblyofYDlPU2jSjVDTgMUud+zGOOhhjDGswj
         hSy8UqFr1l7OHFB0tvJUbbibqJLU4mzBTkkCzLU6JKf33CcmsvjqPFbAMc8EDTlzMei9
         3Pkg+Qu2zqgyVCybjrdu5DTHv8GjXIsxBRecgHce/ZLGcx4IWTwdmFB5e7cbrqU+MsNg
         9TPTr6skkrBwMRwe6Uq5V1bZy8g8/cAuogCSIlTKiur/GWOTu+L8pmrO17qiwnrK7Nfa
         oacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459934; x=1717064734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0Y/Ql63/IxwaJL+O/h+E6/ion+Rk9v6vnf8eimobm8=;
        b=jBzhTD1UHCVbzTcCOE+Gr3J3pF15c8CdpzA1TOo6x/cL2C/KBLanCNf/uWwN1/Zylb
         rz5ERQEFxp3ozpc3HxB+eWZUX9W0N91UpOwBSif7gYx4NU24U/i5Ie+pdpRPtdTLtBE/
         QKxJV/Plu7j3Bsf3z+i7BDh+BvspK4IYS6c1pC53CEf25g+WGH9TYyhmIjHwd0qFRecF
         WXbJk7OJczU4WsswnNigQOGQYG6y1P9m/iAtCeISFxqfflAUMJO30n5t2V2az40sK+Yw
         sZ6Nq/CVC8MuQmLGYmFYK+8VM5wPrPF6vPzeCMgt67Nsg1JFxETfZNhDaSLAztymsGjO
         SGVw==
X-Forwarded-Encrypted: i=1; AJvYcCX9tf2AV8cthYnp1d6dv6xR6RRYGP6XfYz9awBVT6SnlIBJalF6DkcQ+x7/wE84ENRgmXpdxSs5HYn76c17yPQEvScXUCMngElP3k0=
X-Gm-Message-State: AOJu0YwpqbXLSMuJleTfKgxC5e6Rxcy7KveSWObZWWKT4exC3Osoc10m
	CaTuw1RQ/fzbP0Yu3Xnt6vb9bPEddq811MgLMRXiF8/rl6qPfAQdgNdRtFW1PA8=
X-Google-Smtp-Source: AGHT+IG3S9HxgA+BRyKc+tEiIJocVHkYeAAUZVOvMSsA2E8b2S+QZ7Z9TP78uV3Je9C7031yrjAtlg==
X-Received: by 2002:a19:5208:0:b0:519:2a88:add6 with SMTP id 2adb3069b0e04-526c0782f50mr2886400e87.55.1716459933553;
        Thu, 23 May 2024 03:25:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba739sm5323969e87.101.2024.05.23.03.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:25:32 -0700 (PDT)
Date: Thu, 23 May 2024 13:25:31 +0300
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
Subject: Re: [PATCH v14 20/28] drm/tests: Add RGB Quantization tests
Message-ID: <pruqf2ou26m7i7ez2p6rgjdfbzkngqyuwfv3bnx5d3jzxce3af@sa3d467uka3d>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-20-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-20-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:53PM +0200, Maxime Ripard wrote:
> The previous commit added the infrastructure to the connector state to
> track what RGB Quantization should be used in a given state for an HDMI
> connector.
> 
> Let's add some kunit tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 355 +++++++++++++++++++++
>  1 file changed, 355 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
