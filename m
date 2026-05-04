Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11243DE44C
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912590; cv=none; b=OmijDPrF9dphcuORGDQKPsUn7Jlj+7MrcYWbRr4mmh3y0k1OdbgZbwWbWjft611ls2U0fzsy+Aw/9+/lD0820TKCEHPbckv4dZxiSboHL57Bhd+XKu1GxaSzsLgaHYb5VxU8CMVgXxkNLnXBEsliz5JNfZT6z5Si9H9jfr3sg4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912590; c=relaxed/simple;
	bh=1EJqZzRZKr0O2+ZK+UwE6c4ahhtTRCZZ2gf3ylP/+Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HprOQVWASH/B8NdWJVkAVrA9D+pj7nL2s9P7n4J9Q9lRpoeaNwHo7xBTIb+H+XhUQoiFWH+sLN6tgsrzS5RMmurjBA3W1M3YEdVo2T01SmKSsAzx3WarNM0ROXKTyzRopzpYkREjmajD3JZtltox0aGP+4IZqBz8bTdKJYmZZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t5xVo43W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t5xVo43W"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAC319C;
	Mon,  4 May 2026 18:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912584;
	bh=1EJqZzRZKr0O2+ZK+UwE6c4ahhtTRCZZ2gf3ylP/+Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5xVo43WK/DZuGnNw5dwo2Lb5Ceoc2zGDTrfDDiBBbAntPEsGW1ttAXPCZHUUJmW8
	 8D44iUJbBQQvexGBda7xP7p80qwhLjJG8zNYyZknz2g0VlltE3y41+HDutUtNu6Z+A
	 tZHRnbLPfIAmXBPDZiDWQt444WwCofNaunY7oFv8=
Date: Mon, 4 May 2026 19:36:25 +0300
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
Subject: Re: [PATCH v3 06/20] drm/colorop: Rename __drm_colorop_state_reset()
Message-ID: <20260504163625.GJ1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-6-8b68d9db0d8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-6-8b68d9db0d8b@kernel.org>

Hi Maxime,

Thank you for the patch.

On Fri, Apr 24, 2026 at 12:18:46PM +0200, Maxime Ripard wrote:
> __drm_colorop_state_reset() is used to initialize a newly allocated
> drm_colorop_state, and is being typically called by drm_colorop_reset().
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_colorop_state instance, we will need to call
> __drm_colorop_state_reset() from both the reset and atomic_create paths.
> 
> To avoid any confusion, we can thus rename __drm_colorop_state_reset()
> to __drm_colorop_state_init().
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_colorop.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 48d0b7ae3fc9..4c4d0a953e35 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -498,19 +498,19 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>  	__drm_atomic_helper_colorop_destroy_state(state);
>  	kfree(state);
>  }
>  
>  /**
> - * __drm_colorop_state_reset - resets colorop state to default values
> + * __drm_colorop_state_init - Initializes colorop state to default values
>   * @colorop_state: atomic colorop state, must not be NULL
>   * @colorop: colorop object, must not be NULL
>   *
>   * Initializes the newly allocated @colorop_state with default
>   * values. This is useful for drivers that subclass the colorop state.
>   */
> -static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
> -				      struct drm_colorop *colorop)
> +static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
> +				     struct drm_colorop *colorop)
>  {
>  	u64 val;
>  
>  	colorop_state->colorop = colorop;
>  	colorop_state->bypass = true;
> @@ -537,11 +537,11 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
>   */
>  static void __drm_colorop_reset(struct drm_colorop *colorop,
>  				struct drm_colorop_state *colorop_state)
>  {
>  	if (colorop_state)
> -		__drm_colorop_state_reset(colorop_state, colorop);
> +		__drm_colorop_state_init(colorop_state, colorop);
>  
>  	colorop->state = colorop_state;
>  }
>  
>  void drm_colorop_reset(struct drm_colorop *colorop)

-- 
Regards,

Laurent Pinchart
