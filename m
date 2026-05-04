Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286829E0E5
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912901; cv=none; b=m0unNg9YGAegDNJpxcE9v7snez4JSrOTvIhB+Mr9mRNevLGOxxAIuXpsgyWCN6JVUekSfkQgfTgsca/JQ4Tth6II8HEsLMqwfnck0JX9X3WrXVbRBE1rI1g34QgVbR+uhPTxhmarlSlNPrLr3ESFcIDUDwgqIT6AmdUUWnV8fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912901; c=relaxed/simple;
	bh=q1gQlpJfoIxy1ibk2v+LbSUU57lpISXKKiV+29GK8TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpCdoZ5hNmRKVYrpBfnLClLpXDW3s2hNJIijmAdWp5qAAmd4RBB32IbhCAizSVyFsQHqqnVH7lqzfsfRYBh1kni7sx6MmmOEdpSmJipmLfHQyNeYm5esdmfiVzRH5gX8umL+9khBikgFdOuQFibethKilw/iZ8BQXbuSuSW8WSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nUNDsNG8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nUNDsNG8"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC37D9C;
	Mon,  4 May 2026 18:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912896;
	bh=q1gQlpJfoIxy1ibk2v+LbSUU57lpISXKKiV+29GK8TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUNDsNG8tJC/KsgdJGoEI6BDHNyr771dyng6PLE0QJK6PtreNut6ApucUb8PaBo72
	 pzi2mQln+olh4fy250zaOr0PJjnqRmtiuw3vPH6lCCYctS7yRQ4YGV0ZWBsn1YKVpO
	 7SR8Ly/gZLzjulftP4R4LxjZfzNjZmkl5mZvuF8A=
Date: Mon, 4 May 2026 19:41:36 +0300
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
Subject: Re: [PATCH v3 07/20] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Message-ID: <20260504164136.GK1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-7-8b68d9db0d8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-7-8b68d9db0d8b@kernel.org>

On Fri, Apr 24, 2026 at 12:18:47PM +0200, Maxime Ripard wrote:
> Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> to drm_private_obj") introduced a new pattern for allocating drm object
> states.
> 
> Instead of relying on the reset() callback, it created a new
> atomic_create_state hook. This is helpful because reset is a bit
> overloaded: it's used to create the initial software state, reset it,
> but also reset the hardware.
> 
> It can also be used either at probe time, to create the initial state
> and possibly reset the hardware to an expected default, but also during
> suspend/resume.
> 
> Both these cases come with different expectations too: during the
> initialization, we want to initialize all states, but during
> suspend/resume, drm_private_states for example are expected to be kept
> around.
> 
> reset() also isn't fallible, which makes it harder to handle
> initialization errors properly. This is only really relevant for some
> drivers though, since all the helpers for reset only create a new
> state, and don't touch the hardware at all.
> 
> It was thus decided to create a new hook that would allocate and
> initialize a pristine state without any side effect:
> atomic_create_state to untangle a bit some of it, and to separate the
> initialization with the actual reset one might need during a
> suspend/resume.
> 
> Continue the transition to the new pattern with drm_colorop.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_colorop.c | 23 +++++++++++++++++++++++
>  include/drm/drm_colorop.h     |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 4c4d0a953e35..c0eecde8c176 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -521,10 +521,33 @@ static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
>  							   &val))
>  			colorop_state->curve_1d_type = val;
>  	}
>  }
>  
> +/**
> + * drm_atomic_helper_colorop_create_state - Allocates and initializes colorop atomic state
> + * @colorop: drm colorop
> + *
> + * Initializes a pristine @drm_colorop_state.
> + *
> + * RETURNS:
> + * Pointer to new colorop state, or ERR_PTR on failure.
> + */
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop)
> +{
> +	struct drm_colorop_state *state;
> +
> +	state = kzalloc_obj(*state);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_colorop_state_init(state, colorop);
> +
> +	return state;
> +}
> +
>  /**
>   * __drm_colorop_reset - reset state on colorop
>   * @colorop: drm colorop
>   * @colorop_state: colorop state to assign
>   *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index bd082854ca74..874ed693329c 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -423,10 +423,12 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
>  				 struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
>  				 uint32_t lut_size,
>  				 enum drm_colorop_lut3d_interpolation_type interpolation,
>  				 uint32_t flags);
>  
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop);
>  struct drm_colorop_state *
>  drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
>  
>  void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>  				      struct drm_colorop_state *state);
> 

-- 
Regards,

Laurent Pinchart
