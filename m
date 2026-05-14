Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1F7EEBA
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 00:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717025; cv=none; b=Qg7rB33Pc0P80FOs9x9ELXWVeSQ0AjHbnPfeOo4E0asLOW922s1zCWOBuvJ6K0YHPFOJvy8kPpG7tRXolzPuMaw2LLFj3MqScc8VbXjL+b0D3BMu+PPwxEuT0s/orh7mUssn9O3JbemrsoI9YkpGR+Gw8NVp8W2/kAd9x52Cayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717025; c=relaxed/simple;
	bh=xnFP9uJ1EddAbDcd0Lk6lFlj7XZ03eStpUzWPg4tZvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=obliIaeab8+9H/uQYZNpFWV4If9hbNe9st98iiIZSBsLia+7kxeZtp0519Fwc1jvNbH9qjBTWV7fdkDJhbm3UWHtGf/1GZ+aG+r95VkYBiobjoGdFmwswtXNYIBBQ1ThrGBNTEhJiuPNxEqpgOC2DK316Q9b34OMZvGjvw4bjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDZMH/Uo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDZMH/Uo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FF8C19425;
	Thu, 14 May 2026 00:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778717024;
	bh=xnFP9uJ1EddAbDcd0Lk6lFlj7XZ03eStpUzWPg4tZvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GDZMH/Uoc/LV3aJPOKgtEoTiQfikR+kXBp8jO9CNG2NPtzowezB412KaMNHEJGari
	 xVPak8MaaHuCpCv0rHHjDefaHUXoq1Yk/MXaKRb2sEnPzoTxoYk3A7V0TuIf0v3EzS
	 QGXxZSL+Nlqce0qTagzhIcV54VtMosnsZ6rDKk7VtDvR6KklEU2FZ4WscCA8q7z+S8
	 zONeyES0yXKtoIXoytNyjqzbuGAuzbYGLJR95dx3Wqfy7coNEGR/A3bFW9duF19BTL
	 fo/jp4wvyzA8IfW/5IgJWeO+kpaUbCkYPBNCST3E4aXRHSVgny0ueeCiNJKDMx/bY+
	 9tlXibBjVTnvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/20] drm/crtc: Add new atomic_create_state callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260512-drm-mode-config-init-v4-12-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-12-591dfdcc1bf9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:03:43 +0000
Message-Id: <20260514000344.71FF8C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The error path in drm_mode_config_crtc_create_state() skips call=
ing drm_crtc_vblank_reset(), leaving vblank state unreset on state allocati=
on failure.
--

commit 5e39f6f785f69a809d5a205ec026340edf6a2281
Author: Maxime Ripard <mripard@kernel.org>
Subject: drm/crtc: Add new atomic_create_state callback

This commit introduces the atomic_create_state hook for CRTCs. This moves
away from the overloaded reset() callback to separate the allocation of a
pristine state from hardware resets, facilitating better initialization and
suspend/resume handling.

> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c

[ ... ]

> @@ -208,6 +208,35 @@ static int drm_mode_config_plane_reset_with_create_s=
tate(struct drm_plane *plane
>  	return drm_mode_config_plane_create_state(plane);
>  }
> =20
> +static int drm_mode_config_crtc_create_state(struct drm_crtc *crtc)
> +{
> +	struct drm_crtc_state *crtc_state;
> +
> +	if (!crtc->funcs->atomic_create_state)
> +		return 0;
> +
> +	crtc_state =3D crtc->funcs->atomic_create_state(crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);

If atomic_create_state() fails here (for example, returning -ENOMEM), we
return early and skip calling drm_crtc_vblank_reset().

In the legacy reset() pattern, drm_crtc_vblank_reset() was called
unconditionally even if the state allocation failed, setting
vblank->inmodeset =3D 1 and bumping the refcount to prevent drm_vblank_get()
from attempting to enable vblank interrupts on an unconfigured CRTC.

Because drm_mode_config_reset() ignores the return value of this function,
initialization will complete successfully but with crtc->state set to NULL
and vblank->inmodeset =3D 0.

If userspace later requests a vblank event, could the vblank core attempt
to enable hardware interrupts on an uninitialized or powered-off CRTC?

Should drm_crtc_vblank_reset() be called before returning the error here,
or should the error be propagated up to fail the initialization entirely?

> +
> +	if (drm_dev_has_vblank(crtc->dev))
> +		drm_crtc_vblank_reset(crtc);
> +
> +	crtc->state =3D crtc_state;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-drm-mode-c=
onfig-init-v4-0-591dfdcc1bf9@kernel.org?part=3D12
