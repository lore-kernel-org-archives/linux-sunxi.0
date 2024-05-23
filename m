Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EE78003A
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716464797; cv=none; b=oH1ry6QbYxK+Yl1x6nwny1ChXtt0ZhUVjxpkJVRwZ6AqZ76rLo5u2j/u4UZ0ee+qqDMXbaVhLPk+eHLGIYIdKIbN55V8dxn9wKXdcd95PGQ45Hww6REaCf+OOtCWqrhSJwbahFkzzueoMtmfiyXHYkBw+iTZxVjS7WA3s7A0Nek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716464797; c=relaxed/simple;
	bh=Tjqag5Ft0/cLNmS/1MjmwM9JVkyiVtyORGiBEQxrD9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2he8kJJTMFIZVfLhGyHEt/kIVCdishygjKK+tY9rAXeBDdfHGqHF11eLXclA/V32Ax6/hE4Cx2fEXOjmfYHVeIWdxa1ECF9bR16DO2lzaU/K3kBTbx+sW30rweuSiET/jKzb7Aa/JHG6ZOMAl6YTSfh3YVTX3QBXYQ5n435aHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XUgzwndB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XUgzwndB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51ff65b1e14so8814181e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 04:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716464794; x=1717069594; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uprefhCgqHmgRCR+cfAZCBDosMSOOYvyqNmZZJrA1vg=;
        b=XUgzwndBJ92NLPwANell0bN4v/VovDMafw/bKv1At0hNIYQwubuXrrl4ygqq3kX9zB
         HdvA6xfpD3n8B4H42CpvmeiP9kXHHQUsujrfgXqWc5PUhKYGxcFG1TMRF24HKThQHh9V
         6ukQcjbf18Aoc7qk43DjbO7R4nwmMtHVYYhfEEoPOjIhC4UuSUZ+E99/YGSCaRCnLyZu
         fVt0Sm6nYazJYkkaaTt3itA6KcZcgVTdmL7Ni/Og8bFqYhBR8kIhjjvBmkkZ0IZWv7gY
         9gUoZhh1A7lKJOu5rOh2ZBrsrptm0TAvgcWDOqMNo9R/w9uV/Fy+mHHAK5f2ygAMiWqj
         tMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716464794; x=1717069594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uprefhCgqHmgRCR+cfAZCBDosMSOOYvyqNmZZJrA1vg=;
        b=sN9RCkdwQW1GXhBwuqoho1SS8lbq1DNXK9/Ylq6TowDFQ9Uscq7zHe7o5PNv+Uv9gk
         uYJlhGHr6LjK8wnNyftAFg8JUxBEK6FksLQQXLthyrdNykTydIm7yWEoLi8AspJbeNVz
         ktqgNj+hIsNTNZCk7MdMTgSJpeM7pEV+sVTda0UlK7bCFN9iLIv8rDOKMXs5ISR28sK0
         xu+2rFFIPfJADlvopc32JtY2n+YBvEwnJSR9fJ+CfpRRwtU+ZAOP9dRlC09kulwhJT1H
         XeuZr4lIj1Ro7JCsWW9f68AJSUqno0981zBoNbf1oiZkMepQgWLjERuEqzrmFwJjDDxm
         eIug==
X-Forwarded-Encrypted: i=1; AJvYcCVwH492pBdNyTdKgzZ9t4qpdugda4tV0VVQZI404wJeYp2/aW3pZF0+2lnjmIIO049G8G2wszOdS/CAZKYf3epJ/Bg1E83Sbc+9yFM=
X-Gm-Message-State: AOJu0YzH+LgT020iEtIVKek24rrfvHQWwBo1eAvYTHqSCQSA8wljHDAy
	6yQY7yuRl6+3QkpNL+jdoSXGQYMOzuWmrzkBi4PIdErA8CgzEdV0qBbLXrj7kSw=
X-Google-Smtp-Source: AGHT+IGBiL7Oiztj/+dmQv4BL665Zqfu967E/8LJRhUrFe0HkWUk7uqDb6+uR4EPIq2SDZKgH59zZA==
X-Received: by 2002:ac2:4d1c:0:b0:51b:248b:e768 with SMTP id 2adb3069b0e04-526bef87adcmr3053749e87.25.1716464793664;
        Thu, 23 May 2024 04:46:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d2c84sm5319149e87.282.2024.05.23.04.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 04:46:33 -0700 (PDT)
Date: Thu, 23 May 2024 14:46:31 +0300
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
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 21/28] drm/connector: hdmi: Add Infoframes generation
Message-ID: <e47uh7w6fxqdtio5qwgv7yro5mmywhbjj7v332ts4thzzg3uk5@ilke33oaczgj>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-21-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-21-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:54PM +0200, Maxime Ripard wrote:
> Infoframes in KMS is usually handled by a bunch of low-level helpers
> that require quite some boilerplate for drivers. This leads to
> discrepancies with how drivers generate them, and which are actually
> sent.
> 
> Now that we have everything needed to generate them in the HDMI
> connector state, we can generate them in our common logic so that
> drivers can simply reuse what we precomputed.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 336 +++++++++++++++++++++
>  drivers/gpu/drm/drm_connector.c                    |  14 +
>  drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   1 +
>  include/drm/display/drm_hdmi_state_helper.h        |   7 +
>  include/drm/drm_connector.h                        | 111 ++++++-
>  6 files changed, 480 insertions(+), 1 deletion(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
