Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F65B5B8
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455559; cv=none; b=jD6TXHj8PPi80cMZW26GxjCOoOmn8OvsPII/RM1d8k99lV18Pqic57s5Sw/xCtpqvaiX0GTxyTxc+Bux/bZBteHNUUMTcn2WraofRVn22hQPVqhjmz+HKnol5iPe4dp3OOkBOAYrE9rEUOxgXKkfkIT9oRNsxnjiUnY98PCL3GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455559; c=relaxed/simple;
	bh=ua1ab30hbc2oLjmJi5p/l09P2vR0shXcHuLe8ZoBnaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GN8Ue3ZsMj/IMCUB6LbE6lGKfTxebf56P5CXoGdqRmJhCWC1skGRRWUI/Vk7qVB0bKq1fybuHIFBuVRcnH3btYmPD9g62b8i+p654/3vo/QSO54HbjBM4OveTPIVazYW5ztuBYC/Sbi5+NiqKHsNrDXUirY68YKa9R3tvLoMnuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xql5KwGF; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xql5KwGF"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e52181c228so72557981fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455554; x=1717060354; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeQACHVYvjXLcJmL0mtvqm0YtmyCm9cGr2iJkKX/fdc=;
        b=Xql5KwGFU6VwKyFtfTPytCjLo5/ZRctKiUtVCYPDNpUxLs3JFOXwmVotu3BDMNh/0F
         3nwY0FhcLDNN9ZVc2Y43UF+AXaPbafbig19FZ8Etq1JPCln9L3Z6GvPaT3X2MFA8WNRy
         sFQwLNgv9E3pvAEO8p6+NOTqono9ydhEggG7f/56te0itVDJSRRuEbB8JI7NBfJwWsA6
         DOzGgbqtoxQ7TWJC2FbwlmB7vZtfwRGRihDDmCMgltNT5MZVKfw5rMBNCC1UK0s7B79T
         pmY1Hu+BUYGMEC9USYE4kDH6Lqmfn2y7tOM0rJD4ehalGmSrK/Uq1AeiafctgXRJHSyx
         NSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455554; x=1717060354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeQACHVYvjXLcJmL0mtvqm0YtmyCm9cGr2iJkKX/fdc=;
        b=cdPog+UHzZmZV7/ScRLDa1gpiSZ5eET48ta7wx+0NcEd3IdkOHiFxEKVNSpETGb8RS
         Z0faCXJQtIHfd3pPxAfxvsF0HQAs1hiefH4siofgLhc2ZEYzIqmU6iERqQLeub6DmKpp
         Cr2jc5E2mY/pq5miBv5oNKFuZ2VOtjv1r8BjHBHETHqRzgVO9y8lwk+/AdSvV5C1aulU
         oon1F4tZTrIu2vGsCTYdxA9mFfZQk0tLVowAcZxPt1IcP4u7Lc3As0Nr7o4Z+5wfAbu/
         T0iYhH+ZjCD3D15CJSyiV2O/ZzIOlB6JeKhJbeEcRM2t/SBp/ECsRcezCP2ICXwkSLPi
         b1qA==
X-Forwarded-Encrypted: i=1; AJvYcCWYnyP84G6+5j67EldCS0mkGz9TZsFQkbJKHTuY7vvPEQ5wsa1sK8AJjNQjxRdlUAuWMKSymgx1tpnC9xf8yTWxNNyJoWlsm7RQeKk=
X-Gm-Message-State: AOJu0YzYEyWW7TH+ALc3cNRVos0+igfleU+Yfw43Zophx4SvXABCv0+/
	64pX8OIOL0UJIDSSMvL7H7LqHpNGxg7fqhOEnlOkyTnuw46W5UdVm4ai+e7VVEM=
X-Google-Smtp-Source: AGHT+IFRp9kSkZyOBZ37uKA0zC3RicLR9A71BI+sImuk8bVozEkI6NVn6ruWTcgBILxGVWLUmvKCJg==
X-Received: by 2002:a2e:8797:0:b0:2da:9ed:9b43 with SMTP id 38308e7fff4ca-2e9494bdbcbmr26440181fa.31.1716455554344;
        Thu, 23 May 2024 02:12:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d15158c4sm41368191fa.73.2024.05.23.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:12:33 -0700 (PDT)
Date: Thu, 23 May 2024 12:12:32 +0300
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
Subject: Re: [PATCH v14 07/28] drm/connector: hdmi: Add support for output
 format
Message-ID: <dxqf6n2gaksc66rksmdcaky22nz226veex5q6mw4c6npsuobut@m3vuxyai3evm>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-7-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-7-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:40PM +0200, Maxime Ripard wrote:
> Just like BPC, we'll add support for automatic selection of the output
> format for HDMI connectors.
> 
> Let's add the needed defaults and fields for now.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  3 ++-
>  drivers/gpu/drm/drm_atomic.c                       |  2 ++
>  drivers/gpu/drm/drm_connector.c                    | 31 ++++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c         |  9 +++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 +++++++++++----
>  include/drm/drm_connector.h                        | 20 ++++++++++++++
>  6 files changed, 81 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
