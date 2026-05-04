Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462B26ED59
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 17:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777915829; cv=none; b=Vs3kUOZtYV3W/AefcKHIt2OPmMF0LK13LAFbnXVDkQRUcnotAuCNkMXiIhlw7LwNoPtZLyEWjAMu3YQCkTMLbPclW31E/uf5bBQbGWt1w/cxVTgY93ib3MLfzxnIUH/09U7uAkbEEXAHU9rwYfrdE1JXXhOA8Rc7iKOEPDC1lY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777915829; c=relaxed/simple;
	bh=oTaUra+bG4LJjX8r95V5qmyr/EwumZmZ6vDS43GTKWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l94awyNf94DMWCAts0+goqnCh4Dj4FsuVJkFSopgXyMuaWgFwpF1JsxnjzfC9pYjZZoFualWH+T0ibsvJDfYY0O0YogE06Hi5xnNAF5aEWFh9wgnBEN36r9THz/n0Uw0IFwW25Rgcz5M/2jYUwjq/aEgRejmrk8/+GxbDBJqsFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=saXpTw/c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="saXpTw/c"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62952175;
	Mon,  4 May 2026 19:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777915824;
	bh=oTaUra+bG4LJjX8r95V5qmyr/EwumZmZ6vDS43GTKWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=saXpTw/cq+2cDG19nhWqSEzOT/A0uky1r/147CTZajVngYuq/6kB9hlWPqAqsj15V
	 JXaFQigz4g2A8QcgROUDLYMBLJ+kwwnCyknFVenHDN4bpS0d9hPujSdIVaxkiHD01X
	 mcHQKV4Y7dGJ6nf7pixCwPfGonYrRi3iBV6LFREg=
Date: Mon, 4 May 2026 20:30:25 +0300
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
Subject: Re: [PATCH v3 13/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_connector_state_reset()
Message-ID: <20260504173025.GP1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-13-8b68d9db0d8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-13-8b68d9db0d8b@kernel.org>

On Fri, Apr 24, 2026 at 12:18:53PM +0200, Maxime Ripard wrote:
> __drm_atomic_helper_connector_state_reset() is used to initialize a
> newly allocated drm_connector_state, and is being typically called by
> the drm_connector_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_connector_state instance, we will need to call
> __drm_atomic_helper_connector_state_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_connector_state_reset() to
> __drm_atomic_helper_connector_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 12 ++++++------
>  include/drm/drm_atomic_state_helper.h     |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index b7da134c8c50..f67aacaa3b6e 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -496,24 +496,24 @@ void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_plane_destroy_state);
>  
>  /**
> - * __drm_atomic_helper_connector_state_reset - reset the connector state
> + * __drm_atomic_helper_connector_state_init - Initializes the connector state

s/Initializes/Initialize/

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>   * @conn_state: atomic connector state, must not be NULL
> - * @connector: connectotr object, must not be NULL
> + * @connector: connector object, must not be NULL
>   *
>   * Initializes the newly allocated @conn_state with default
>   * values. This is useful for drivers that subclass the connector state.
>   */
>  void
> -__drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
> -					  struct drm_connector *connector)
> +__drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
> +					 struct drm_connector *connector)
>  {
>  	conn_state->connector = connector;
>  }
> -EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
> +EXPORT_SYMBOL(__drm_atomic_helper_connector_state_init);
>  
>  /**
>   * __drm_atomic_helper_connector_reset - reset state on connector
>   * @connector: drm connector
>   * @conn_state: connector state to assign
> @@ -528,11 +528,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
>  void
>  __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>  				    struct drm_connector_state *conn_state)
>  {
>  	if (conn_state)
> -		__drm_atomic_helper_connector_state_reset(conn_state, connector);
> +		__drm_atomic_helper_connector_state_init(conn_state, connector);
>  
>  	connector->state = conn_state;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_reset);
>  
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index 129762b99de6..e7c097e6dfe3 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -70,11 +70,11 @@ struct drm_plane_state *
>  drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane);
>  void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state);
>  void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
>  					  struct drm_plane_state *state);
>  
> -void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
> +void __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
>  					       struct drm_connector *connector);
>  void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>  					 struct drm_connector_state *conn_state);
>  void drm_atomic_helper_connector_reset(struct drm_connector *connector);
>  void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);

-- 
Regards,

Laurent Pinchart
