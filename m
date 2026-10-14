Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A493C55C1CF
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000992; cv=none; b=RC3SlBm/b703VZCAr+DLTd1LbiPG5fo4ew1SOGJO7YFsXxWloYBmiYBT3pOffFkSD0tGskLL53VqDGfv46R/c8IDD4qqKSK27f4j/L9nwKoLVY20LjCBk0FspvPI+7MVFrbf83CsezDV1dgqZYBm1CitCGGMO5U0oKfCjHeEvSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000992; c=relaxed/simple;
	bh=N3+8uRef+Hj2Vk3KUdYbnY+yCrSQX1xSZXKZXXkZn34=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lb4LAcBhD2G5HBBtaYYRdVaiSdWCueAzWuIj9yFP0ccVpiu2ELBuZnfuGaSHLiw9gP9H8C9JR5frc85RXF+KyhGvHgjhqJQE38nXcAnWTW1EKtLboAB8HbCF/z6syluKbDiW7dOV1WeRIY6f1E64xo4PfHyrflbFGXWTwJugL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+Xq5y1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+Xq5y1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0711F000C4;
	Wed, 14 Oct 2026 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792000991;
	bh=on7++y1kVxk+KyGl3YCQVu1Vvwafb/0JuLSAqwBBpag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U+Xq5y1P9pqCU387xSghyhEcIkUSDj0KgMba2gz6OxetBdePnNA1jFL/uhh5u/Ije
	 4PYMB7NKaJnxnbYFdYmtMoUcP7QmJOALKJtHclMKsMZDuIj5l1M2ud9atqPlQiRph/
	 B3+X4ZXmBB4Opl2CgGnbXMOtByBp6XCHLYffbUNWyYwGjcwvDLk1Fk3ti555/9vESZ
	 41PPCLsVQpoGeSoUIwZLxapDL/0OvrzM7jGtAY363CdEKmgL04Gaj6msJbwdIagZcE
	 uvYc1/XqknQAthu4oc6Pp2Dpuwga94gjOsi3ryw9y1YErDtwS1NwZF2SE/ksBJXsU0
	 OqkkBoS4bsIPg==
Message-ID: <sashiko-outbox-171648@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 56/75] drm/atomic-state-helper: Rename
 connector_tv_reset to state_init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-56-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
 <20261014-drm-no-more-connector-reset-v1-56-586c9c026823@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:03:10 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm: Incomplete state decoupling causes NULL deref in tv_margins_s=
tate_init
--

commit 44e808ff1921e4945725ba2420217e2015fc2db5
Author: Maxime Ripard <mripard@kernel.org>

drm/atomic-state-helper: Rename connector_tv_reset to state_init

This commit renames drm_atomic_helper_connector_tv_reset to
drm_atomic_helper_connector_tv_state_init. It adds a connector state
parameter to decouple the initialization from the reset hook, preparing it
for contexts like atomic_create_state where the connector state isn't
assigned yet.

> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index 6238066fd5d60..1424c4873251c 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
[ ... ]
> @@ -501,16 +501,17 @@ void drm_atomic_helper_connector_tv_margins_state_i=
nit(struct drm_connector_stat
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_state_init);
> =20
>  /**
> - * drm_atomic_helper_connector_tv_reset - Resets Analog TV connector pro=
perties
> + * drm_atomic_helper_connector_tv_state_init - Initializes Analog TV con=
nector properties
> + * @state: the DRM State object
>   * @connector: DRM connector
>   *
> - * Resets the analog TV properties attached to a connector
> + * Initializes the analog TV properties attached to a connector
>   */
> -void drm_atomic_helper_connector_tv_reset(struct drm_connector *connecto=
r)
> +void drm_atomic_helper_connector_tv_state_init(struct drm_connector_stat=
e *state,
> +					       struct drm_connector *connector)
>  {
>  	struct drm_device *dev =3D connector->dev;
>  	struct drm_cmdline_mode *cmdline =3D &connector->cmdline_mode;
> -	struct drm_connector_state *state =3D connector->state;
>  	struct drm_property *prop;
>  	uint64_t val;
> =20
[ ... ]
> @@ -574,7 +575,7 @@ void drm_atomic_helper_connector_tv_reset(struct drm_=
connector *connector)
>  	drm_atomic_helper_connector_tv_margins_state_init(connector->state,
>  							  connector);

[Severity: High]
Since the new state parameter is added to decouple this function from
the reset hook, should this call pass the newly provided state instead of
connector->state?

When a driver like vc4_vec calls this via its atomic_create_state hook,
connector->state is not yet assigned and is NULL.

Passing connector->state here forwards a NULL pointer to
drm_atomic_helper_connector_tv_margins_state_init(), which then writes
directly to state->tv.margins.left, leading to a NULL pointer dereference
during device probe:

void drm_atomic_helper_connector_tv_margins_state_init(struct drm_connector=
_state *state,
						       struct drm_connector *connector)
{
	struct drm_cmdline_mode *cmdline =3D &connector->cmdline_mode;

	state->tv.margins.left =3D cmdline->tv_margins.left;

>  }
> -EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
> +EXPORT_SYMBOL(drm_atomic_helper_connector_tv_state_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-drm-no-mor=
e-connector-reset-v1-0-586c9c026823@kernel.org?part=3D56
