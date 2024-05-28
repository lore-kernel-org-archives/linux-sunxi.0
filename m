Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459794683
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 01:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858057; cv=none; b=lKyJhMUbU79orpjH/MUSdqslSZmoP2Jb2kenxsjQZmVRNj2nRC2QorYLYw3NRHo/7+ZjbpNabSE3cb+2e6/Z6VpkbTGwLmRxTY52SAdmeDjP3CBo1CvinOYtAC7crdoyqiaxb+4AQvSQLQte4Q5XP2Ym4aTmVl8Unh8hsInDKuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858057; c=relaxed/simple;
	bh=6RdCALqZATAaluv2o0adt2Iu/oX3BJUs4MRNlUA/VzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWeKX5BAYm32veZoeSFcLvToVZk11GhIoo9RmP8rAa6wQWPGbAcWUArr1h5vEChzM7j/hfP9QGxmiJcnuyyGuGlQ2gGNcrcLnPUhuUr8kYBfgk5sy6DO3bO1+nZg4ZrADfjXO7m97fHJdFpucqT6sunczaWcBIzlIiEQq9l6+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfbYjkPq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfbYjkPq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5295d509178so368057e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 May 2024 18:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716858054; x=1717462854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmwopWG0DiE3sCpp8aZ0JQHOY+FYWa6TPkm28zzJyuE=;
        b=nfbYjkPqiEFNkEdV/L0VKNcukqUKLFaI7FOUOkdvpUitthBc0+Mb+zj68V7MwlV/Ik
         KxTPPKN7QaNV7DEMncTl6K83g3MeCbTKRh3TjKD7Sr3VsTVGujXBa2ITCzJXGYhoA3Zo
         bYi8rUoUlixHI2084r5gKiMrJewU5EIwtF52ewgNuoly1RqVm8crzbkxkSjlru/szA/q
         eWexi/mgTjag2CaftF7nbOqcoQkOJ6hQ5Scf94XMrDRVJqX8WbiXYW2OFUZ7kfzW4WWK
         ZAXsPLM7VWbISS95ie1yB4ANZ3l0uOWY2FenXtgUDii+8qI+qobnitysJmehr0yAwQ3x
         4n7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716858054; x=1717462854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmwopWG0DiE3sCpp8aZ0JQHOY+FYWa6TPkm28zzJyuE=;
        b=rHHGffWAXjwUQrPbMEhukzbnD/moqsnFC7cin9Y+hSAGbH9eGxkzrMRjCDgjUi3H3q
         NnVGBwZE0OA0JXNqE1sJ1kz+cCkWPl3FO0V8am81fpnqXikwmKG81EcJVOMK849OM/Dm
         /zXWczrcb+IPGDYLwrsdOOD+JefoLjdHz1yGhk/7gNHBNOvv7WxryMpyhhRF5l/u01mO
         bG4miwUCZJgxEFa8CaQOmCqqwMHoTUSWQPWo5HBaaO8xD7I6RocplCgAmcChIKOqF2W2
         30P6yJ3MMJl7oa8aljZmXbncukf/nzY/1iKMuFCG9o91+E6iFW9vQx2Q+3c4o5vfhPQS
         8KyA==
X-Forwarded-Encrypted: i=1; AJvYcCXmBw/F3uAoE4v2s1MS8tArrjsAbN29opLq9VRrwuCycoXBiFGzBcw/DQG1kr31SDE9E5ovLVIBRY0kJFHr+P4TZQJAOO3//66lGAk=
X-Gm-Message-State: AOJu0YxDlzx9ezLZtWiXgC89LEIPY9MzIv/sl3dIFLGSlTi8HWsRdujU
	n1YHKTR5zhKvjkXARLe33DjrzGG0ceq8RTWb5qwCPBqWUpdZYATwi3/pd4jy3qE=
X-Google-Smtp-Source: AGHT+IFvbCrRsIbF9xwlxxNScbQE81pHqx1ki/P6zSR2F11gCd7AhgIu3KUS7x8FnRnamS3CF4QPsA==
X-Received: by 2002:ac2:5a07:0:b0:520:11b7:6caf with SMTP id 2adb3069b0e04-52967465dbdmr8591708e87.64.1716858053510;
        Mon, 27 May 2024 18:00:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529712f32f7sm825854e87.282.2024.05.27.18.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 18:00:53 -0700 (PDT)
Date: Tue, 28 May 2024 04:00:51 +0300
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
Subject: Re: [PATCH v15 09/29] drm/display: hdmi: Add HDMI compute clock
 helper
Message-ID: <gdfhorm6pj7l2z4mfhkyabtckoprp3xmdcihjnulzt5gcbtlbq@hmaoimvgwgqn>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-9-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-9-c5af16c3aae2@kernel.org>

On Mon, May 27, 2024 at 03:57:58PM +0200, Maxime Ripard wrote:
> A lot of HDMI drivers have some variation of the formula to calculate
> the TMDS character rate from a mode, but few of them actually take all
> parameters into account.
> 
> Let's create a helper to provide that rate taking all parameters into
> account.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_helper.c | 61 +++++++++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_helper.h     |  4 ++
>  2 files changed, 65 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
