Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350F440757A
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183253; cv=none; b=gO6jthtGptJO7x+GpZ5Wr5Lck8Ln6WZaajqxWymFmFVRz1OedY12FJ+eZpvJJravLCSqhNuOTm0BcWeA4wFcksPNuaACiJURON4iMJkSCItCW8zeFanLrRsNKaPPbidfJ4GMt87vq7HvhnvfHpNBu55oSTchnokzMQvLDVwxBZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183253; c=relaxed/simple;
	bh=d4UgWWF2T/RGIR2x4ySF/HqZw7frq6Xg3yFiiyqr1dI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fsGPLGaITJz/STqmUq1eo+I/RvP/o+XonHIyzEb/9jPSRAIJUssh9mzPmaLhDg4CpvY81aIxRFAFjlrLjz9/iUYwIChIOnMoPUzNX/SVbTUjZokTKcZQgtyunRU2h9ta2duCcs/FTvy8Ol/ufO2LE9XtrP8xIw++BlHjdp0BHiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYHkjpya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYHkjpya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5B2C2BCB3;
	Tue, 19 May 2026 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183252;
	bh=d4UgWWF2T/RGIR2x4ySF/HqZw7frq6Xg3yFiiyqr1dI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FYHkjpyaxtlCaaWY1z9azQaCENAAcEXy2FhdGdZD8eguPZWWly0bAal5FdylXOFCe
	 UR/JgVi0hR6IgRW1wYO0ohBW+D9S35pTJ4WBoVdSMF8oGu7NLJi9og89azYdeRCEs2
	 cGW58gxFYUOVAs1HMwm/RXRH8ZJWVDXmdpIss/chJtLQjI9+nNMzirPzAhEO+g1OHC
	 TQZDuiool63yAo/MLYahk1RWAFPqlNPcxEwSOOAynqA069WvKZZqeBI95xDFoifQZC
	 p6ufay+SufHzSBu6Lv9eoTCCbod4hVpvVLZ8+H/d15c0mbWO3PZE2gcmgPfv1szesB
	 Ty3NnZATTKEeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/19] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260519-drm-mode-config-init-v5-7-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-7-388b03321e38@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 09:34:11 +0000
Message-Id: <20260519093412.5C5B2C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `drm_atomic_helper_colorop_create_state` helper function lacks=
 an `EXPORT_SYMBOL()` declaration and the `atomic_create_state` hook was no=
t added to `struct drm_colorop_funcs`.
--

commit 96308971f93a9789ee23443eab7d504d21283abe
Author: Maxime Ripard <mripard@kernel.org>

drm/colorop: Create drm_atomic_helper_colorop_create_state()

Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
to drm_private_obj") introduced a new pattern for allocating drm object
states. This commit creates a new hook that allocates and initializes a
pristine state without side effects for colorops.

> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 4c4d0a953e357..c0eecde8c1762 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -523,6 +523,29 @@ static void __drm_colorop_state_init(struct drm_colo=
rop_state *colorop_state,
>  	}
>  }
> =20
> +/**
> + * drm_atomic_helper_colorop_create_state - Allocates and initializes co=
lorop atomic state
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
> +	state =3D kzalloc_obj(*state);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_colorop_state_init(state, colorop);
> +
> +	return state;
> +}
> +

Is this missing an EXPORT_SYMBOL() declaration?

Modular drivers like amdgpu or vkms wouldn't be able to link and use this
new helper without it.

[ ... ]

> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index c873199c60da9..b4b9e4f558ab1 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -425,6 +425,8 @@ int drm_plane_colorop_3dlut_init(struct drm_device *d=
ev, struct drm_colorop *col
>  				 enum drm_colorop_lut3d_interpolation_type interpolation,
>  				 uint32_t flags);
> =20
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop);

Does struct drm_colorop_funcs also need to be updated to include an
atomic_create_state() function pointer?

Without adding the hook, it seems drivers cannot assign the new helper and
the DRM core would have no way to invoke it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-mode-c=
onfig-init-v5-0-388b03321e38@kernel.org?part=3D7
