Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163C1CEAC2
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912485; cv=none; b=HfC1KZBXUBzpuejRoaqSQO9Dbo54aFOdxJ7ImndSdXrI2QCnvOpG49hUZCCDsX9MInoXh2exX8Jb1lIBY99KVGepP1J3ynoJ/AKbDTTnhJ/TVq/xROoZCPWCwbS7K7ZU4h1pmahr5qD+S3FqHE2QK4fAqTvjkb2HB2zasSZ4gD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912485; c=relaxed/simple;
	bh=2OSAeT8an5e3Y+nfCRfDAXE6cwKmFiIVVKAcvn/IUNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBRHYwyvSkoz2zDSjDdDOwb1Ue1qWaxlQmaKerTTCKWBzeIiY/KBQsdbNWJs9naVOa4x19Lg6RUuab75pV3c5Gwq5gt7vwR3neVOk+k2uMRq4pgT+qPUmdDGSyCNKb+54EusByPCM2dz+GGAuclojEYH9aPAPqyFZtuVfM/cD3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vxISDUCu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vxISDUCu"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A5EF9C;
	Mon,  4 May 2026 18:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912481;
	bh=2OSAeT8an5e3Y+nfCRfDAXE6cwKmFiIVVKAcvn/IUNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vxISDUCuo6b67rdu9OyWQc4v82FFMWzd49PyIU+P5FA58n/pOr24USVXMSVJzhYd2
	 9LLY/MSJUZJRAKvQ69brP3BXwQwmcOYkm+rI9oCeir5Z2a+F7hIimQPN7mSOZBxz6H
	 TnMUIUFuDNrQ9kdWmO/7opamqlJOvglSdCiRFVTA=
Date: Mon, 4 May 2026 19:34:41 +0300
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
Subject: Re: [PATCH v3 04/20] drm/atomic: Expand atomic_create_state
 expectations for drm_private_obj
Message-ID: <20260504163441.GI1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-4-8b68d9db0d8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-4-8b68d9db0d8b@kernel.org>

Hi Maxime,

Thank you for the patch.

On Fri, Apr 24, 2026 at 12:18:44PM +0200, Maxime Ripard wrote:
> The atomic_create_state callback documentation for planes, CRTCs, and
> connectors explicitly states the expected behaviour: the returned
> state must not be assigned to the object's state pointer, and hardware
> must not be touched.
> 
> The drm_private_state_funcs.atomic_create_state documentation is
> missing this clarification. Add it for consistency.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  include/drm/drm_atomic.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index f03cd199aee7..f7f9c6c85f3a 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -263,11 +263,14 @@ struct drm_private_state;
>  struct drm_private_state_funcs {
>  	/**
>  	 * @atomic_create_state:
>  	 *
>  	 * Allocates a pristine, initialized, state for the private
> -	 * object and returns it.
> +	 * object and returns it. This callback must have no side
> +	 * effects: in particular, the returned state must not be
> +	 * assigned to the object's state pointer and it must not affect
> +	 * the hardware state.
>  	 *
>  	 * RETURNS:
>  	 *
>  	 * A new, pristine, private state instance or an error pointer
>  	 * on failure.

-- 
Regards,

Laurent Pinchart
