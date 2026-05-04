Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276C3E3DAA
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916952; cv=none; b=TULeqdgiot6e3wDiLXANoQExpG5yWBB0oY+d8u5xK5XlXi/ZhO1ppZzom00otMLpC0S64/ygiKN2KCp+qAaVxJFp1m5694lKeoITH7bmV5bChCgsPnTR/x491FBf2WhhJ99KvjfPTrNDgcKK1w06h0lG4WxUnHFxkzzp9DrXnoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916952; c=relaxed/simple;
	bh=/MyttNxa7Rdujb9ZVQxRQ3bnYHx9AV0Hr8Kn7vSqiEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0jYmyMDYnGOyjpx+cA1xDy1n1iDhpIAuKnL0raVy1tEm4dRawXsWWbmH/V01odMnwhINfMLQMIArUrB1YU1c9+I9isSASJgJn40tESPcvqDLxMsmuiMhPVRz19KmUstuTxwnycz4CAHQGFNWuH1Abpls4agGMVVc/4Fg5E5GC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SVnDG4tD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SVnDG4tD"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EDF6175;
	Mon,  4 May 2026 19:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777916946;
	bh=/MyttNxa7Rdujb9ZVQxRQ3bnYHx9AV0Hr8Kn7vSqiEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SVnDG4tDJpRD1pGi6dpuqWH/nt08r97IRxjdXIKnb2UDvYJy+u9wRxfrWt5nW9RBR
	 dT2wPwppgjkNrffDRzNLCpYVKDMcbO6r7r2VaAhHYvu3yOVcWfgz6f/jbWFacMmDew
	 Uy5IRB4P3h9wUMjXnpSCEVgk3nZzezGh4KMrQal0=
Date: Mon, 4 May 2026 20:49:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Alex Hung <alex.hung@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
Message-ID: <20260504174907.GT1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-18-8b68d9db0d8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-18-8b68d9db0d8b@kernel.org>

Hi Maxime,

Thank you for the patch.

On Fri, Apr 24, 2026 at 12:18:58PM +0200, Maxime Ripard wrote:
> Now that drm_mode_config_create_initial_state() exists to create the
> initial state, use it instead of drm_mode_config_reset() during
> driver probe.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 1c8cc18bc53c..f5099d5d6e32 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -169,11 +169,15 @@ static int tidss_probe(struct platform_device *pdev)
>  		goto err_runtime_suspend;
>  	}
>  
>  	drm_kms_helper_poll_init(ddev);
>  
> -	drm_mode_config_reset(ddev);
> +	ret = drm_mode_config_create_initial_state(ddev);
> +	if (ret) {
> +		dev_err(dev, "failed to create initial state: %d\n", ret);
> +		goto err_irq_uninstall;
> +	}

There's also a call to drm_mode_config_reset() in tidss_modeset_init(),
shouldn't it be dropped ?

>  
>  	ret = drm_dev_register(ddev, 0);
>  	if (ret) {
>  		dev_err(dev, "failed to register DRM device\n");
>  		goto err_irq_uninstall;
> 

-- 
Regards,

Laurent Pinchart
