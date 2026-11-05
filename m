Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910244;
	b=E4Z8gHHpmUXvuvd07JThwHHqGg2z30BQcXH9AfTl9Q/t2+uR7LxAcASMg2G/20sPsav5
	 qX3ZTjHuHrDOYMOlKEATPXNHhntDVK/IswOn1EDpUoA//uCWKtCfTraFIUXtueGhfqgcr
	 bzYX8G97akSxwr83ZNjEdxdH4yBO2I4F/Sd90LrGFs+mxHVMXVJfbrR/fVtAZ/ifNfs+k
	 4+nmyk5omF/Nq30l8fQEeyu0kYbEYS/9MDjUKCifJS9KFg17U4nToyknoJfJh8lAxgG9V
	 DDg0vWUMAKbbwcnf/SYJgZ5mbV1ce8egp7i3L5WJDnYDvVsnEaSM+3uBAnWLSfMWmkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910244;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wp64vaLNDEgG8dXH4zM/OcazZmMrZn4HhgFLRtCPELo=;
	b=ie0whQZWS3jShb+sDtlk89s4djxpSHJvCv4N7JnoQm6nslknI461u9gRpFYdjyvG+F7G
	 68kCtQicc1wzNxXwvdeWwQFUgmBQjVKhYMBHPoQj6Cgk7AAuafCH1hn0h3wNRK2bxUqQk
	 YOFjWuFZZNK92/+ktdImnHiJw7I8pGI4S2p9LDCHfq0T0Vi+5MlM/GOnb5yt7KdN91BdS
	 F1ym0VDDyOstn2kKipjXWcY+7DyCySBjEPhe+/eKBPLXBg6rJa9iVOR9m4ENbdgNM1dBP
	 oGM3W5JEUFEppgsBbQnuQTGXP3neIeLXTkBbiFLogaEzWqa28a/N6/HXeIrAz+k/PPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkh0Rnb7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CF7606A31B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkh0Rnb7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367141F008A1;
	Thu,  5 Nov 2026 20:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793910243;
	bh=wp64vaLNDEgG8dXH4zM/OcazZmMrZn4HhgFLRtCPELo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lkh0Rnb7+ArYInqyMrdjnIzH85ZOPg7JoNxPbDWRoh9HvtVqW5VMYR4+gpLC6z1Xy
	 O7xjJhfIHepy5BJHZpQeIAcN5dwhERVyzqPGidYTDM49UDum08b6m/R/Atl9BXyBuk
	 XaFK7/R29Y99fjDYAb0EEotyvwMixxqDQ54BKZMJYRRpdeAhZXyx4/THdBfw7AzGeY
	 ICz1nzpBux/xaX2dRalhewZSuzSVgtaY8SOk++ebZg+mTYXZpI+7AMNkn2enSc+iDI
	 yWdeMjsxC38WWPgBBXbJT6EIFwYY4glp8brNft9jKq3laR1lJVgbw5PWPUXzZO8Mv0
	 +exZQ9PcXaIXA==
Message-ID: <sashiko-outbox-200092@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 47/83] drm/sun4i: Switch to
 drm_mode_config_create_initial_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261105-drm-no-more-config-reset-v1-47-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
 <20261105-drm-no-more-config-reset-v1-47-1f58d1e33380@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 20:24:02 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/sun4i: sun4i_framebuffer_init() ignores state creation failure
--

commit 9bfddf90d8dccabe2d26ebb9b512f7adbc95c198
Author: Maxime Ripard <mripard@kernel.org>

drm/sun4i: Switch to drm_mode_config_create_initial_state

This commit replaces the probe-time drm_mode_config_reset() call in
sun4i_framebuffer_init() with drm_mode_config_create_initial_state() to
create the initial KMS state.

> diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c b/drivers/gpu/drm/=
sun4i/sun4i_framebuffer.c
> index fc822bc2c62b5..0ce3691dedade 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_print.h>
> =20
>  #include "sun4i_drv.h"
>  #include "sun4i_framebuffer.h"
> @@ -26,7 +27,8 @@ static const struct drm_mode_config_helper_funcs sun4i_=
de_mode_config_helpers =3D
> =20
>  void sun4i_framebuffer_init(struct drm_device *drm)
>  {
> -	drm_mode_config_reset(drm);
> +	drm_WARN(drm, drm_mode_config_create_initial_state(drm),
> +		 "Failed to create state\n");

[Severity: High]
Should sun4i_framebuffer_init() return an int and propagate errors from
drm_mode_config_create_initial_state(drm) back to sun4i_drv_bind()?

When drm_mode_config_create_initial_state(drm) fails to allocate state for a
private object, colorop, plane, CRTC, or connector, it returns early with a
negative errno, leaving that object and all subsequent KMS objects with a
NULL state pointer.

Because sun4i_framebuffer_init() only warns and returns void, its caller
sun4i_drv_bind() in drivers/gpu/drm/sun4i/sun4i_drv.c continues execution:

	sun4i_framebuffer_init(drm);

	/* Enable connectors polling */
	drm_kms_helper_poll_init(drm);

	ret =3D drm_dev_register(drm, 0);
	if (ret)
		goto finish_poll;

	drm_client_setup(drm, NULL);

When drm_client_setup(), a userspace atomic commit, or
drm_atomic_helper_shutdown() duplicates plane state via
sun4i_backend_layer_duplicate_state() in drivers/gpu/drm/sun4i/sun4i_layer.=
c,
plane->state is dereferenced without a NULL check:

	struct sun4i_layer_state *orig =3D state_to_sun4i_layer_state(plane->state=
);
	struct sun4i_layer_state *copy;

	copy =3D kzalloc_obj(*copy);
	if (!copy)
		return NULL;

	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
	copy->uses_frontend =3D orig->uses_frontend;

Could this cause a NULL pointer dereference in
__drm_atomic_helper_plane_duplicate_state(), orig->uses_frontend, or during
userspace property queries via drm_atomic_get_property() if
sun4i_drv_bind() does not abort and jump to unbind_all on state creation
failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-drm-no-mor=
e-config-reset-v1-0-1f58d1e33380@kernel.org?part=3D47
