Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED5A1DA62E
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 16:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912429; cv=none; b=YJ8sz7oShxs3XuSnrZMR9yrE8iMvgGuvKmXJz/anKDKdzVjWYUXu64zs45MB2+2HM4WGFCDkL6zS3w2AHTofQtK8ip1fHwECpg9Hv2+2B0b4lNCucU621hepBf9JFpyWwWDQWPqqFRfgO+mXVkVHvPvxDCmrC1vIanqxLaJZL7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912429; c=relaxed/simple;
	bh=cfzmXBDD422Por2LycrwmL6gW7qKihpcCAhAXwjAaEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZMvk0YMhH3QfgSzFyrfgillYEYzpa6TjlQRgVpdeCJMgQLItwQ4HIq4EsAJOl6/B1RLaa3kGx04vK0ZxLryZzN0GxDGR0gpt5KtrAW4fGTjUUiHK5V3z8me8Vjl1RiVu5E+ZrtjY+ky4o3wrduPLFFkNesPk1Ybw0P3CTeKhOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rUrAPYey; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rUrAPYey"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3A09C;
	Mon,  4 May 2026 18:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912424;
	bh=cfzmXBDD422Por2LycrwmL6gW7qKihpcCAhAXwjAaEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUrAPYeyapt7U6A033SCkQly5hGUACZeILzTaCoo/zhWqAvQkZYig/KxXOks6nWNF
	 +mQmvYBFY1yLdCZtTJbujncTJg3f10lZ8BQDZeh+DS2omCGMjll8J4BZ43NXelpeqm
	 U3Hv9iUwLY8rJOcXjck2D40TI3gagvm3DdC9vo4A=
Date: Mon, 4 May 2026 19:33:45 +0300
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
Subject: Re: [PATCH v3 03/20] drm/atomic: Drop drm_private_obj.state
 assignment from create_state
Message-ID: <20260504163345.GH1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-3-8b68d9db0d8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-3-8b68d9db0d8b@kernel.org>

On Fri, Apr 24, 2026 at 12:18:43PM +0200, Maxime Ripard wrote:
> The initial intent of the atomic_create_state hook was to simply
> allocate a proper drm_private_state and return it, without any side
> effect.
> 
> However, __drm_atomic_helper_private_obj_create_state(), which most
> atomic_create_state implementations call, introduces a side effect by
> setting drm_private_obj.state to the newly allocated state.
> 
> This assignment defeats the purpose, but is also redundant since
> drm_atomic_private_obj_init(), the only call site for the
> atomic_create_state hook, will also set this pointer to the newly
> allocated state.
> 
> Drop the assignment in __drm_atomic_helper_private_obj_create_state().
> 
> Fixes: e7be39ed1716 ("drm/atomic-helper: Add private_obj atomic_create_state helper")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 76746ad4a1bb..875149494b00 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -729,12 +729,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
>  void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
>  						  struct drm_private_state *state)
>  {
>  	if (state)
>  		state->obj = obj;
> -
> -	obj->state = state;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);
>  
>  /**
>   * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
> 

-- 
Regards,

Laurent Pinchart
