Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E413D240
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455416; cv=none; b=YTeIdSCGipHSdTBnvZhCfe8RbK4iSKp5gaFSsxv8P4q8j1YYoibB1oxfl0g2SxaiWhi82Y9K84ZQU4pmNHHgRwT9ypXR7jze6aI9/V7bMyrKG0BuciuDwu1vuHwFZ//Qgy11Fb/SjPFrCsr5soTRiL2ennXfDX2sM0AF0krwLvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455416; c=relaxed/simple;
	bh=2LLQXSCtOxv6wPX6ulrJ4oQTIol5AljMIJ9YZtpb3U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RynSZFn7n32v6mC0G0//xioYXVuS79laZ0DY5ggC39Cr0IJWU90XPxmJWWuGBayZ2Tlb210uie761cu5PTSbuA/va3JkVJ+n/pXeXCl5vE5PjU2LjYDCvabmXb9gacGo9AQrrlngzGClLWoBApJmgqU2BtYn5iVFwsb/7XXG1Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjI8+v2R; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjI8+v2R"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so82446691fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 02:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455412; x=1717060212; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLbNbEeZZx+Y9UagHOzdXnc5AHkeTqV4LNqc32hMk7o=;
        b=rjI8+v2RnWz5QwFN8om+Mipi/10B/Ag8iL+LiJbb5SxtzIwDUs2qHneHsKa70fG1Yj
         olnYkrP6YTh9h0+pJdM1ofpqTXRlkcXTMSaTlrjWLzSqhbmDvoTrHsaW8FVUcZITTBfj
         iSOSPWSfwk4qbeDWaBhbtfSY/wF43BhqXuv8oduicnOysdMlSEX77uoCfVjWqxAH9071
         kvyvM7k0WfLDAwQgUyZZqmLY5CkEqhqaIej20wGCbyi/W3Asb+ABT2mSDNWKLP35VRIY
         ASvjK2AyEWTv/S0CVjsK91VCddLx5EJZgV1p6AoylTYGMzAhmvCOknTgbFSuE4kR7J/h
         4I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455412; x=1717060212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLbNbEeZZx+Y9UagHOzdXnc5AHkeTqV4LNqc32hMk7o=;
        b=COxX5RwkoiT2Q+kfam7Js4LvP6OwNVxjTfd3Ft3HeGFoewoLW2e78TdrYwwcftUsM1
         v+jH4tXPyhGow852vjViml9sJx9d7x1/vwu9FKeuS2m4+ot4vmdxFtIqTL8FHZObbZJq
         Ooohbt135neJchmP+p78n3TXs/RA78FZKpZliDeG9fZKx9J0OA74aGQ59SK4ZBNxw7nA
         bCWorWC+dpytctXCC/haA5l4FJDjwwuFtXItUjn1alzb2w07a2fwhqZyJJK5YZEMmCK1
         a8xTOrqdOcrYE8NiSJF/paQXgFJ2fAMThPMlmHTRI2Y9jC6Wrqz0zy8z9DMvKI95jY2a
         41pg==
X-Forwarded-Encrypted: i=1; AJvYcCWgc7p5Qtg35Lj+dTCifl+5FIg7SI4GvSNH01PX/ptWfCBv1HCRidUxrZWP2xIii+ra3okE7tHpY+12iTl82rvHSqfFL+Nuo+Wql+s=
X-Gm-Message-State: AOJu0Yy5cqkezDu8lH9wKRVh16beCYo25Iy6A6TUXVq7npXFB2GXlFf+
	v1/oz0DVCha3I+psKW4DNbrIg7+Sw+DFQ5+vg3l9qc9NvR2evsGDr5ajQ5dCmCA=
X-Google-Smtp-Source: AGHT+IGdSgWnLFMgir035AHyOCVqS5scq5u8M8DlUryO/CIUdmVczkNrL4TJ+hWCvcPS/dK0wrOj/Q==
X-Received: by 2002:a05:6512:44b:b0:51e:646d:fe3b with SMTP id 2adb3069b0e04-526c1213db4mr3455906e87.60.1716455412389;
        Thu, 23 May 2024 02:10:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad640sm5253516e87.61.2024.05.23.02.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:10:11 -0700 (PDT)
Date: Thu, 23 May 2024 12:10:10 +0300
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
Subject: Re: [PATCH v14 06/28] drm/tests: Add output bpc tests
Message-ID: <p6mpuna2ubfpqyfogblvknxadga2uqnm3lsocwol4npwmgw66h@42yt4b5zhk5y>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:39PM +0200, Maxime Ripard wrote:
> Now that we're tracking the output bpc count in the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Kconfig                            |   1 +
>  drivers/gpu/drm/tests/Makefile                     |   1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         | 140 +++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 438 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 +++++
>  5 files changed, 686 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
