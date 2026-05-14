Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F28281357
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 02:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726901; cv=none; b=tstr+b38DjOJiGmk5H+oZLfoFnlaXnP1Kx3pRl26fms5gYaaMOhxNbgRuHf5Dh6r+MyyA3yyAl91n/n43+95do+aCfzhLOOycLc7wyJh7vDYCx423DrCMEIr7dH/JWCiSSIkWTG49tOwhoXziaZVkdwJK/Gp1otJAPbHYa4Kk54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726901; c=relaxed/simple;
	bh=DV4E6vUnHgIaFxTlK9WV5PZP2tHuHjH5iS7mHMX5M9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kXP5vTeU00mV3HBVv0JQ5w6iCigz7Nkqu/uqxrzFaFJ9IYBxXIzVXoDwCzTOSL0f9SzdLsqn9E40L7FtFnVgTuzE0IAXGFPMxP4uWc7Ry+PN0C1SddL9SQ5SWU7pIJMH0y/JNCK9z37c4x+LZeJgxvkicbYbasVLLLQrTv2UIVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKbLb61W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKbLb61W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95369C19425;
	Thu, 14 May 2026 02:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778726901;
	bh=DV4E6vUnHgIaFxTlK9WV5PZP2tHuHjH5iS7mHMX5M9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kKbLb61Ws7DmjGf3qxnBcpy8b2w8yDE5MBr1fkpwFbnVhFZO+HfiWtxiImnCYNzT+
	 vHTuXfCFD6fJnhfYm8VEj4AhdoG/MAtAVdYvpkHV1WbJlD6WepAEekP4XX4/Kc974V
	 x6hBWAdKr5+f9MQ2MJMKA16Am5jzo3qjcj6FiqxoTvvLY2kOrAx77dvS8KfuUE3L2A
	 ZpaH1tEvhfA8d1pHIsOYTTG/v4j/BBBVubfb12BMcWlgZKHfizaeV8pxTeVZtRz9Zf
	 WmOwKT8uoaA2nWm4IP6mrZ/iVpdvwxhXLIWwrHpJynB8LyDqFuCb6ydLSG/Qp4jMPg
	 A2wCsQSwg9UFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 20/20] drm/bridge_connector: Convert to
 atomic_create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260512-drm-mode-config-init-v4-20-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-20-591dfdcc1bf9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:48:17 +0000
Message-Id: <20260514024820.95369C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Removing the `.reset` hook from `drm_bridge_connector_funcs` c=
auses a guaranteed NULL pointer dereference and kernel panic during HDMI br=
idge initialization in `drmm_connector_hdmi_init()`.
--

commit 4d1b1d55e3ba2c5d7992c514db2a00581120fa32
Author: Maxime Ripard <mripard@kernel.org>

drm/bridge_connector: Convert to atomic_create_state

This commit converts the drm_bridge_connector to use atomic_create_state
instead of reset to initialize its state. It removes the reset hook from
drm_bridge_connector_funcs and replaces it with atomic_create_state.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 50408af746d84..cafa498c38482 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c

[ ... ]

> @@ -265,22 +265,29 @@ static void drm_bridge_connector_debugfs_init(struc=
t drm_connector *connector,
>  static const struct drm_connector_funcs drm_bridge_connector_funcs =3D {
> -	.reset =3D drm_bridge_connector_reset,

Does removing the reset hook cause a null pointer dereference regression
during HDMI bridge initialization?

When an HDMI bridge is present, drm_bridge_connector_init() delegates setup
to drmm_connector_hdmi_init(). Looking at drmm_connector_hdmi_init(), it
expects to allocate and initialize the connector's state by calling its
reset hook:

drmm_connector_hdmi_init() {
    ...
    if (connector->funcs->reset)
        connector->funcs->reset(connector);
    ...
}

Since the reset hook is removed here, the state allocation is skipped,
leaving connector->state as null.

Immediately after this, drmm_connector_hdmi_init() calls
drm_connector_attach_max_bpc_property(), which unconditionally dereferences
connector->state:

drm_connector_attach_max_bpc_property() {
    ...
    connector->state->max_requested_bpc =3D max;
    connector->state->max_bpc =3D max;
    ...
}

Could this lead to a crash when an HDMI bridge connector is initialized?

>  	.detect =3D drm_bridge_connector_detect,
>  	.force =3D drm_bridge_connector_force,
>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.atomic_create_state =3D drm_bridge_connector_create_state,
>  	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  	.debugfs_init =3D drm_bridge_connector_debugfs_init,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-drm-mode-c=
onfig-init-v4-0-591dfdcc1bf9@kernel.org?part=3D20
