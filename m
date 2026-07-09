Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C12422546
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Jul 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600428; cv=none; b=uDHMEMvJOjJioydjhncl5/8xGsSiYFQU3wFKqX++dzZazU7zB9MKMJSbh2wmEnEcRYmYOdWWr65QqqttyG9AWcN3cZsiUttCavAAaSbFiviTOLFN18VrA13aztzXGZ9TQuOvq1iIMctQQN/+rl1D1QfGJkuIxL1Hgm1P/Y4Lc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600428; c=relaxed/simple;
	bh=gIuZfi7uUxbYPuqT9/XIk/i48Zl+Of5Snd1nFpJqdk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JOV2+yeBGS7aIReaQD4Y23HaM0W1vOuXLCaSvCbjaPqiuRbpojmTHdvSBYqBrnbuKwRlUrUpGD1gL2A5I2wHUEaKMwg11Aj1fqLII8uyiskQm/IjlPIJUWJ/TydB6obsq2kub31ykAY+H9jo24KhZ86Q8+bbOSDpeISmjlNFK7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTPWIjK+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTPWIjK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DA81F000E9;
	Thu,  9 Jul 2026 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600427;
	bh=J1j+sIyhKQngAmkw1qForz3WZUGW/ajgN+kBvp8Gl0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTPWIjK+LlrZSNxNMdD4av3RFVkE9Hv91ZhDSPeG+/tA47yNCMhhjvINochePIoN5
	 6aGPHwCwt6Rz7364WWR8wmYJINd8IjXJD+Pf3Fx1FfUPLamksYXgTZoEu/R3H8dZvb
	 G96obrU4z5y8ecQQq1pU6eheKrQydqEJLdOvQJQQy6XsJOR2zUCGFL4CS6y8t15rxD
	 SFtQUmw5N/nJdhLCBlFyNkHF5KfuFLodk6EgI39QS02cC2+1+9Ps2Dsp6KD7WlRsNR
	 hd/3mQpq2jp/Q+DOrBdThZUQGXSXUz/zYmPTbT/MT3+HMexz6qJ05aF0/Q1oscMBgR
	 C2rzBODQU4xGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 54/60] drm/sun4i: layer: Convert to atomic_create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-54-302d986fe5f0@kernel.org>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
 <20260709-drm-no-more-plane-reset-v1-54-302d986fe5f0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 12:33:46 +0000
Message-Id: <20260709123346.B8DA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Leftover state destruction code in `atomic_create_state` callbac=
k violates API contract
--

--- Patch [54]: [PATCH 54/60] drm/sun4i: layer: Convert to atomic_create_st=
ate ---
commit 85f4174b6e45254800a7a99399fee4bf10972b0f
Author: Maxime Ripard <mripard@kernel.org>

drm/sun4i: layer: Convert to atomic_create_state
   =20
This commit converts the plane reset implementation in sun4i to use
atomic_create_state instead. The conversion relies on a Coccinelle semantic
patch to rename the functions and update the DRM plane function assignments.

> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/=
sun4i_layer.c
> index d65587d96d9ee..b165960ca8e5d 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
> @@ -16,7 +16,7 @@
>  #include "sun4i_layer.h"
>  #include "sunxi_engine.h"
> =20
> -static void sun4i_backend_layer_reset(struct drm_plane *plane)
> +static struct drm_plane_state *sun4i_backend_layer_create_state(struct d=
rm_plane *plane)
>  {
>  	struct sun4i_layer_state *state;
> =20
> @@ -30,8 +30,12 @@ static void sun4i_backend_layer_reset(struct drm_plane=
 *plane)
>  	}

[Severity: Medium]
Does the Coccinelle script miss the plane state destruction block here?

Looking at sun4i_backend_layer_create_state() in sun4i_layer.c, the untouch=
ed
code right above this hunk still contains legacy state destruction logic:

	if (plane->state) {
		state =3D state_to_sun4i_layer_state(plane->state);
		__drm_atomic_helper_plane_destroy_state(&state->state);
		kfree(state);
		plane->state =3D NULL;
	}

Since atomic_create_state is expected to be a pure constructor without side
effects, shouldn't this block be removed?

While plane->state is currently guaranteed to be NULL when this is called by
the DRM core, retaining this block could lead to a use-after-free if any dr=
iver
logic later calls this hook directly on an active plane.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-drm-no-mor=
e-plane-reset-v1-0-302d986fe5f0@kernel.org?part=3D54
