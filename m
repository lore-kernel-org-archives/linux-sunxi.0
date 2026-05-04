Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91F3A63EF
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912046; cv=none; b=rakVhEeU9o7htExEOWoIUCEtrP/9YdM2wxxUuByKBgQaxvoNeJgesWrB6icsAU4gRoUe2cIiNZIhppu+MYoAupWdCtM3oP7cO99LmzDCqPIZ2DAVv7ungk25TxPxYfyzwxyYbrffZ2+wgPf2UeQ3WGPYLKpuyu78doFFPN09+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912046; c=relaxed/simple;
	bh=pb/tc+qet8z57KNYIbl6SB0j1yoUbSKvqYUNc/vuBQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWf5Cgl8qt9LTmWtCbXbnBAPY/0UU/qB205Qi68gxAuXWQSIZQKbL3x8giEJacjO0s4OM6VIqZs5JzP0e7c5c7bbcqI3NoAaq/tkfKfVtIE4DqeBeLJ0DUTaDWkjhbWdQa/1lZfCTT+s6NJTz1/j0J5phaFG2GOWv8stKmJUZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TCAf1RYT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TCAf1RYT"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3605B82A;
	Mon,  4 May 2026 18:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912042;
	bh=pb/tc+qet8z57KNYIbl6SB0j1yoUbSKvqYUNc/vuBQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCAf1RYTKs7xAHfxC0MRhizC0ArrveHSDdfoVakroTl6JZ5B+7FW0w1LBbEhyc4aI
	 CBWrbU/JfNPJsl//uhwdiNCNsAdRseXr60dxZpffaOkeF9oJqEmppzgIfmIaUuf37I
	 4sQIAaqoS+tGGO5Hw9Bl1jtP85PZqfBNW70G0HWM=
Date: Mon, 4 May 2026 19:27:22 +0300
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
Subject: Re: [PATCH v3 02/20] drm/colorop: Fix typos in the doc
Message-ID: <20260504162722.GG1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-2-8b68d9db0d8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-2-8b68d9db0d8b@kernel.org>

On Fri, Apr 24, 2026 at 12:18:42PM +0200, Maxime Ripard wrote:
> In the documentation of drm_colorop introduced by commit cfc27680ee20
> ("drm/colorop: Introduce new drm_colorop mode object"), the
> documentation of __drm_colorop_state_reset() and __drm_colorop_reset()
> were mentioning CRTC when they really meant colorop, probably due to
> copy and paste.
> 
> Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object")
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_colorop.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 764d12060666..48d0b7ae3fc9 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -503,11 +503,11 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>   * __drm_colorop_state_reset - resets colorop state to default values
>   * @colorop_state: atomic colorop state, must not be NULL
>   * @colorop: colorop object, must not be NULL
>   *
>   * Initializes the newly allocated @colorop_state with default
> - * values. This is useful for drivers that subclass the CRTC state.
> + * values. This is useful for drivers that subclass the colorop state.
>   */
>  static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
>  				      struct drm_colorop *colorop)
>  {
>  	u64 val;
> @@ -526,14 +526,14 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
>  /**
>   * __drm_colorop_reset - reset state on colorop
>   * @colorop: drm colorop
>   * @colorop_state: colorop state to assign
>   *
> - * Initializes the newly allocated @colorop_state and assigns it to
> - * the &drm_crtc->state pointer of @colorop, usually required when
> - * initializing the drivers or when called from the &drm_colorop_funcs.reset
> - * hook.
> + * Initializes the newly allocated @colorop_state and assigns it to the
> + * &drm_colorop->state pointer of @colorop, usually required when
> + * initializing the drivers or when called from the
> + * &drm_colorop_funcs.reset hook.
>   *
>   * This is useful for drivers that subclass the colorop state.
>   */
>  static void __drm_colorop_reset(struct drm_colorop *colorop,
>  				struct drm_colorop_state *colorop_state)
> 

-- 
Regards,

Laurent Pinchart
