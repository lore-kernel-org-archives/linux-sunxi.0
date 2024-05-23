Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D29144300
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459884; cv=none; b=fD+EanYjzGX73yYSB0/k5GFxSJWaiMUje5cKvB0lea3k4cjNxP5EXsxNNU9bZzM0S9h3g6xYXGl2eHkuLH25JlaUoVW/q4BXDUU8fB+X8EInrkvd3RA+B4XDJRS3/Ai2c06nbg0choL2enWaHXqvYOu8Hx49UnL7tRW1GwBycvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459884; c=relaxed/simple;
	bh=GesYYDL0RueRfZ/lYstvElMRwIUq1iDUssl+48qnt7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW+8Wk7JYlvScLYDSfo0XWG87/3YHKeKKVKG2zorHvjIStqLC7NFumSK6yQJzHaQhIFLocuFAgD9b0ZxKuWf793Zfi2NvE6/WBpV1xFecFDMzLRI7raKTstJO+7MMfJ0VFKVT5VJIObz/lwTFTCWDNZGquROE6AbNb7MhfZymlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b4nS0gKe; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b4nS0gKe"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so65840631fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459881; x=1717064681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTs4KhPH145/AJRmP8+6lMsBop1Ixgucc2xC1shylpk=;
        b=b4nS0gKeBrB+ycXIeKiVTrUqIg8ZE77MlNWX6+Rh63LL3cUzJMhTqgrrxSpzbfNgeW
         RQpv4BXLD8jXqTXRUZt7PJ6IG15iD7p7QzgpMdKwBX8ypxhHaGw201E1RoB2JlDGiJWB
         yXD7/vxX9IXIjWmAUtsrlzV8mNnGFDmEbGv/S8Bx5kdt6HuHjGYk3DSAP/8zt+KYnhXL
         1EFjqO1lqCyHN3nxcx9pDEH60+n8UmMLyPNZ/nIzjhmhtOd87NCodrPI+ucIkP9TLHy1
         KgoD0lifwctRv4BaFXW2CJf1reUZ+2tUE7Ntzpxi4DWDr8ybZhoBKOaPw8ggyCaQPvS+
         8Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459881; x=1717064681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTs4KhPH145/AJRmP8+6lMsBop1Ixgucc2xC1shylpk=;
        b=RCXbRdwarn8dPoJXc+ZFtcGdf3dnxXEJqzQHFDkOUIg4aSm2L/kDntlmIcuSYCeVnh
         qzf0vG09+Fzu9XZw0+NEXwH9IIFUcJDuqGtwOL3C0wvWqMzy5DkYJUgw7KhGspiFFHpf
         q1xqE9dWgS2I76CiFh/9ROVA3xK5PLJXGkJ3sI6IT83ibtzcvVzcy9R+pQToZdGS8MRj
         OF1rKtFBbdtypw5vDOVTs9lpcCIBdHBmJvTV9ezjdMRNTsNqbV1rBfmhumwoV03WpXrb
         kGKmbdKkI7G9N3iN5YcXGzH7sXmN15dv0+lfUGXJmqoD1rX8TmV/0laoI/vw+6BL865m
         2uIw==
X-Forwarded-Encrypted: i=1; AJvYcCWBMn14T7zD2HHCksi2pikeFAobzP5dHWJJjNrB73u9PzjNYdQt7C6ZbeqDizDNAO4EsPc8JfM62LHr+CmL6tjcZ4WgwKHIpHzYSjU=
X-Gm-Message-State: AOJu0Yyh7Cqwj4F6CszluPD8KYaiV1B2ew8VSoG81GGcb25ATEsYQCk8
	NXGy4n7bSkLBDwxYHKsE0SufM5FGqukwJ+a6QMt+SHH2SQGdMQ8BllOCkQ3MfeI=
X-Google-Smtp-Source: AGHT+IFh8tvpeC+TwvjC1fPxZfM+UwuyED0DKgyl3oWL27XorJPrG1npFHJwvig7HdSlbfPLtqhR9Q==
X-Received: by 2002:a05:6512:3141:b0:521:9207:189d with SMTP id 2adb3069b0e04-526c121522amr2191728e87.65.1716459880614;
        Thu, 23 May 2024 03:24:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad526sm5387014e87.54.2024.05.23.03.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:24:39 -0700 (PDT)
Date: Thu, 23 May 2024 13:24:38 +0300
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
Subject: Re: [PATCH v14 19/28] drm/connector: hdmi: Add RGB Quantization
 Range to the connector state
Message-ID: <evhxta7gk6mogntoafibz7kxcgziikrhitrjg45t3p3lhify2k@uwwdo6i4bqbx>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:52PM +0200, Maxime Ripard wrote:
> HDMI controller drivers will need to figure out the RGB range they need
> to configure based on a mode and property values. Let's expose that in
> the HDMI connector state so drivers can just use that value.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 29 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                    |  1 +
>  include/drm/drm_connector.h                     |  6 +++++
>  3 files changed, 36 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
