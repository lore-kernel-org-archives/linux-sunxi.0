Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16F13CFB7
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457273; cv=none; b=W463+AYLB6zuH0OCNmuNKdR97YaJxEbuLoExRS/SzWjNBeOMueLRMDLnIXALDI5f05BzipWaLI2mOdMWUAWv9VHxp50zu4JAJ2/Q3VE2Lcjs+UrFwKH0iCL+/2bnqrFI7LXpIdqc0MGS2y/ukpxzJXmpEH9nc2PqPaoXIp4M9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457273; c=relaxed/simple;
	bh=j2zx3VaHX0GsfKBrlQgn1untBcEyimrqEdjGH5+DWdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3/HOMAzguKb28tO2L4qXO2oIodSa0dvO0kVD6keIv6j3zPa5+6D6dRAy60/j2/5fZ7vg88fDeyrHaVo+e58mPoCTmTcAtC4Is/39G1D0BF4kn/Ls4Fq/Fdx759HoIPMQxSCQFSRTQlYpAx5u44VF+vhhXF3VV3gZh9ViUbIVWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f0wgmUtr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0wgmUtr"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5210684cee6so8013036e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716457270; x=1717062070; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymOIxLRXX6/t992boJGrCdN0THAC8qBuamXJNsylAfs=;
        b=f0wgmUtrUntRFVehVbqEPVitDRo4Rnui0Ohx/N2Lw73FC0sj5LpuJkNAVModidAPB6
         gP781WoWNUdIa5Bl8gHWMQ8FzsWx0rIiOnoF2tvG0TU20RwuBb4/fG/1c8OwPHvVo+A1
         aIA1cv0Ig4iL9jXkeA/MfUmoo53Lkl6dGSPOz/WPHDTj76g5sEgOyffAUs92BNjRrPY1
         ONHqTePuc30Q7KXJLflV7j2XUMk0bHQ+lNSphZB6/GnZ6SXXlztfRg8RJ2CP8+CqRFMe
         HbVQpqssbrtU0+unKZSZ/JuGbQA5qyRUbn6hOOsspl3qLoqFsbaoEahDkaBzF3mAVZF6
         lIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457270; x=1717062070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymOIxLRXX6/t992boJGrCdN0THAC8qBuamXJNsylAfs=;
        b=RBhDdEol5Os6yuoMFxNeBuF4KHV0L3W9asxhNmQLMXrDNyhCE7jKfOYj4xhfYJ+HjV
         Q9l9OU5k+jMA3r7zJsu/aZCm8emv4O2q3HhXzeOLlVgSgWX7Xs3XPmM4yImWkGGyWki0
         4mxftL3wuMp/aQ161hW0Uq5C/OSi6EqpqQlmCYEnGE005PWZ5pyMSbAlY2C9wd7zVpY+
         GBP5QEc2h4kpjFYIzBwO3L2lZAcyb9PCG4XTCUhUrY+m8RNAzJAaPWr8wtKKbt6FtoLs
         mXahd8dIkrFxjz96w7mGIr9tPkCsvUDoQWXoPGVzTtLwlEIYVojpEcCckVHfRrP16iAR
         99uw==
X-Forwarded-Encrypted: i=1; AJvYcCWsPORYna9OB4fNh3rmsh+4WJ8+Gcz8gyq7exwu9nQdtSkBrl4C7NiPHO09Dp9gVCOratlvE89BsfWvH/Bj6waD4labIZ3qc/AI6AA=
X-Gm-Message-State: AOJu0YzMtagik8jnsZ1TiT6zLLRlRcTE8O3NdOU9pWuW2ANDnEDYCE6D
	qlfDrEE1t0Z+hWdWB5r6UWNhXDMGajmizM3a1JE/DF/HB3kYAs28kyZsNUzxe18=
X-Google-Smtp-Source: AGHT+IGDBnS6Yxc91Ez/LJRvHEhoF+0Je5SmLoZcaOOlSUX1bIaRGc7t5bjpMnVmIRgP+hN+dWcqmQ==
X-Received: by 2002:a05:6512:611:b0:51e:f1a6:ac39 with SMTP id 2adb3069b0e04-526be6ea79amr2624505e87.12.1716457269807;
        Thu, 23 May 2024 02:41:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52394a319f1sm2983965e87.64.2024.05.23.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:41:09 -0700 (PDT)
Date: Thu, 23 May 2024 12:41:07 +0300
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
Subject: Re: [PATCH v14 12/28] drm/tests: Add TDMS character rate connector
 state tests
Message-ID: <ghotwzdstmtpnovbmt2fgvxxkcno67hfwydzjzbyfn6dkt247c@52ycrfinmimo>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-12-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-12-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:45PM +0200, Maxime Ripard wrote:
> The previous patch stores in the connector state the expected TMDS
> character rate matching the configuration of the HDMI connector. Let's
> add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 166 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 216 +++++++++++++++++++++
>  2 files changed, 382 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
