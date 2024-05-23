Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51AA78C7C
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716464846; cv=none; b=Z70zORgwkWxlZh9EH3AgNT7nZVjEXnvxlztFXwPTSwTXOInUDuws9UhiOBKGvXstQho2ALoLMmOpszc2kFvKj05MRDjeF8CEpxS8xuR/1KRY0wzCukTNilBBr5Ze4eBJ+qJwrIDFTbET1+IKPgfX3k987dTMMGGa3J79Afezsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716464846; c=relaxed/simple;
	bh=/v0IBX+5fBpI01TXlBxXnhYYhzIXqSCAmPfHSBwuNwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVgwLqb5GfJmzBSIN4FC1hnmn2YsZ/83l2N2wOeuqETWH6JNQaiQ64wAFTUESUJv8iLn1TR7DBkc5w1v0lbI78TNYAx96hruPPADXo9V3NEtt4rf8RPN5gnlBfedPezchyHAGOV1C7em+HNjhfOTUlpGm1f0vjsd1WzVdYRklao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q3HQwkXQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q3HQwkXQ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso7790232e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 04:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716464843; x=1717069643; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5JoDrVHVM7LfBzm/j8yQ//z7NC7zUr0L//iZ9DPpuos=;
        b=Q3HQwkXQlhDk/r6I808UPjgftMc/TIr9ayso/KZG462paZODYniMC7TN2JztizvFZu
         mh9rJEzALb2YYgCljMrF8UBZ2hRVTBU95ki9glWnCeGYZW8N3sgqBNvc6+BhG2twcqL5
         2PuKJmVVWYSINQmskN0SSFL7vsIhG62Xl30eu6ZJi86rcZ2yd8jY7buv9thEDtxdvo9k
         fLteWirBvmCSkMzmxril0L3DRKmq7E/UqvhJvy7q/9UveCC4XFEaRW2VWHZvxaInu7aG
         YYHIknWP5Mje/02IJTJClUSXrMPLyrMqyzkjC99UMWRnVRzITskfqycT17bUqYJ3VTcX
         04Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716464843; x=1717069643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JoDrVHVM7LfBzm/j8yQ//z7NC7zUr0L//iZ9DPpuos=;
        b=dYe63DzWi5OEqJ5itrn4bhOQRLCL7NzKIos1wxL737KR9NDzI7HL7iTA39U1smnoXU
         y/z0UCScmS3+KZ2Ri9YFO33iXVJXA/ibKJFwlN1e0fRn3Qzs1g5fqe3CUSr8BLhMbDlR
         fz/+G1c37a4xhUTkZ5AcUdDMN2g0OJ6SdVzS7u4xpWiZ7OazQWKghWZvwY1NMQ409b9m
         8URqvd8uGOw+vzLGEbUvYQsTxcieXyeavszCrFMJ/9Vq+ikezLNNB2bVRYNe9uEH3+A0
         sQMPTHCETm0shdIK3lfUC7zyKDNjQz+CsdjFskSsep0KMFL0oDP0EVSmTVl2nfWz1eyd
         QqWg==
X-Forwarded-Encrypted: i=1; AJvYcCWCFVKAkAA2pjyzUs++UYLsUZmbnt+RRil1m9Ly3fkbK7uTmqgkflCuf1KpyHcFRWvYYKRlxh7ZxOsFfqJswyhyAh9ReD2nqUEelvs=
X-Gm-Message-State: AOJu0YxQUwqUSUVZjvFR3Gcd5Y1irDI7H7Y7SyEElrDbsiHKde5aExrB
	GD5GK0XHZNs7N9isYPgsFmROV6ypS1FHKrE+65N3JChE94Ssf2l0uzqLUbrsr30=
X-Google-Smtp-Source: AGHT+IEN/K1SwxIaCA4NY4v+I8nntKcBr37nrUarJyi3sJM40IZJFMrjSZD7I/KQY++RSCd91be4qw==
X-Received: by 2002:a05:6512:4807:b0:522:32c0:bb6e with SMTP id 2adb3069b0e04-526bf35cc19mr3052433e87.23.1716464843059;
        Thu, 23 May 2024 04:47:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f318a326sm5291741e87.0.2024.05.23.04.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 04:47:22 -0700 (PDT)
Date: Thu, 23 May 2024 14:47:21 +0300
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
Subject: Re: [PATCH v14 22/28] drm/tests: Add infoframes test
Message-ID: <blzznexaou6bbiaonw3zeii43rcj5izgqt5zomv5wx5gxbeu2o@3j4o3hs3lfx3>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-22-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-22-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:55PM +0200, Maxime Ripard wrote:
> The previous patch added the generation of the infoframes matching an
> HDMI connector state. Let's add a few tests to make sure it works as
> expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 219 +++++++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
