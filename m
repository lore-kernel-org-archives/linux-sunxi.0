Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392E13DBA0
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716458644; cv=none; b=YbCY6KJqXttD7AvHgG2OFKlEnRyk2xRbiUs3UfpK3X6lOqLB3QgFFQ+5svnQ3gpFOIdEHSMKPtcwVDb4OW4WsWJ7GkqAMOkedLxfgmZ2mfjvd2m8n/HTYFYnMKJX4xuQ0hEtxS+8v0EAMxK47aOachLqAzKiYVlbBhGGnQs1Y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716458644; c=relaxed/simple;
	bh=BHP9XT/mVXwqm4ETOekupe344ZcCjtfN+SBGF641Vc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zfwqt1+E1igXdhw4bIoZbzcu3IofVJYhHMEGnjJ+dZiPdGB9p+yPWqniUsJ4H3uR5WJt7jYQOoIa2blIatCEkLKtKIRuQAouIe42Xpo86cgYa+ePvNtLWtW4Y/ZgA/bq1GeTMXvpKN37QSVtS0f5YEL3FdqF1iIosV++eJ0bUuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nvM4oYHk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nvM4oYHk"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f60817e34so8513339e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716458641; x=1717063441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TH/BUWVtxkmUJ13gtzS4sCxD7fWyObo8iOIYwJa0PIw=;
        b=nvM4oYHkb2t0U3wbTzz1gMg7yrAtcHtOQa2XrPMDV+apGmZZdTtohWkLMzNtyyOpSM
         JDf7fIjefNbhGekpexOkF58lOcc1bf9bJ1hSN+VACeXr06ZPFal1tVzHX9P0RhhPnjzI
         6D3Ug7Wd5M6j3X6xhgayyW7pTFDpOD74SjSvw8V7KDopwHZFmMBPJMwYSq+ajuQwMCbm
         w/Z6BJzC1h5hQ9K7Q7XqvdSOpbDEj8Fi9whV26RzcX0zBH5q7X7KEZOGeRDD73FGXBWT
         zZBcW3En7SX/U8z4Rj6mzyyM6Te2GnKsw0GgKzkxsiHvez8A+iWXsgYJaNQQgp1MiZd0
         AD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716458641; x=1717063441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH/BUWVtxkmUJ13gtzS4sCxD7fWyObo8iOIYwJa0PIw=;
        b=ftO16df8XiD2ulKxeVWJnGVStGqSStEqz0Ethrn04dvvJpIoqyev+G4slT9y3r+THe
         wp7eP/yzpJw9Llwm0qB7ffrWqxatvGagnA1rU1jSa7+W6yuMHcrQmzmpJsemGwA89wc3
         57+SMcYJHfZfzmj6O3RbKvrB58V90OCZ47RwAglQWjNtffRmEtAZtZCHJKSTSbHVxgVK
         bzR67k/0rsnAXgrgXrZ+NcE6PvN7atcYYXPeMq8oQyk+Plzn6QLIjx1U1cVtZvvv0m04
         QI3W2nl0Vg7eUG1hHgrc17OveGUqdwyKEzYZxqWVnoABqfFdVoet7eI/S0Hw7cc76h3J
         I0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzD/p+JfNZ+KiwgqGSQgDgjfaZLwwLtM/nAlYAfu2RCC0duj1oypiKUaBY7pGDaRBHekLD5tCTeFrTdLMwJgRCj0bPjCKvNQFCt8U=
X-Gm-Message-State: AOJu0Yxn8D+pyI0OG8XNAQrAxmKz2r5r39LMao/VvvUD/Fl+b+h64WEo
	7S387aVKElVxnkjqnGMigm+vcnA74lmHJ4V3Map4SVxuLHzQpdXVBc4YI2WiUPU=
X-Google-Smtp-Source: AGHT+IGlpqecDFsJDGKpUD/L/07fSwQIVn93IEsQGl4tYZ0BdBGomkd7vGGiht1/7leKlSP/ZRYLZg==
X-Received: by 2002:ac2:5930:0:b0:523:89b0:9b64 with SMTP id 2adb3069b0e04-526bebb45afmr2452653e87.7.1716458640738;
        Thu, 23 May 2024 03:04:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8ae2sm5423836e87.204.2024.05.23.03.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:04:00 -0700 (PDT)
Date: Thu, 23 May 2024 13:03:58 +0300
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
Subject: Re: [PATCH v14 13/28] drm/connector: hdmi: Add custom hook to filter
 TMDS character rate
Message-ID: <hjz32n3wokppjxdpzu2lsoypno2dy6thi3tfrkhy76g7v2a5aq@5hjjd52fsqup>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-13-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-13-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:46PM +0200, Maxime Ripard wrote:
> Most of the HDMI controllers have an upper TMDS character rate limit
> they can't exceed. On "embedded"-grade display controllers, it will
> typically be lower than what high-grade monitors can provide these days,
> so drivers will filter the TMDS character rate based on the controller
> capabilities.
> 
> To make that easier to handle for drivers, let's provide an optional
> hook to be implemented by drivers so they can tell the HDMI controller
> helpers if a given TMDS character rate is reachable for them or not.
> 
> This will then be useful to figure out the best format and bpc count for
> a given mode.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  9 +++++++
>  drivers/gpu/drm/drm_connector.c                    |  4 +++
>  drivers/gpu/drm/tests/drm_connector_test.c         | 14 ++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  4 +++
>  include/drm/drm_connector.h                        | 31 ++++++++++++++++++++++
>  5 files changed, 62 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
