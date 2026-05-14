Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB81FB1
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 00:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719535; cv=none; b=mzR+mtMdKg3YYLegt35EZ+p/DMZCMC2lrjNOmgBacThl87t+IGoGQM2AcB5JdckjrvMWbR9FNh8ud4gZMctip3G2VW8U/DeV77vVenMok7Kff9NLVsyeqZ92WFBnRXRhBPOp8mD7qwgbFCYnKtNecePI+kjCtzZAJUrBop9IzKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719535; c=relaxed/simple;
	bh=R/4bU9ie42n6bUToc6A2EA2o0hPr0jKM0pUVIhLVJkU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PoJ980m/gXu2MGaOjwLG1u2/kKv1EwThtfpQ6rDvu1eA5TJm3cYtj7p684Ri8pF7rdLLAWzjK4hYINs5mLZ8pA7rpi4KM/EUb6xINJyWS6aA3kod0QUvr6SPO4MOrPaXuUuOf6FMhTumgMKd2U+fByWF7ZCfYKnni5gHrfZVae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4pPIgfm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4pPIgfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989F2C19425;
	Thu, 14 May 2026 00:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778719534;
	bh=R/4bU9ie42n6bUToc6A2EA2o0hPr0jKM0pUVIhLVJkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=a4pPIgfm1GhazEz6LzbGI8P1mgVJr9QDYFr5kuoewOdRvRfdvegVSK1nHirJzZ5sl
	 tOjlILhcxgqY9mrKn/ZjVaHx2Sl3Iq9XjIRMxrOkUyq33Fb1HEdm1j98QYuwWFedyO
	 sL38bUQHHQnOugQKucDW5iu8Wq4DX2sRbsJvZlnSWZ9YzETK75cKSy5NTPYq8EWijo
	 W0sMcv2TCs9woZRzzt9NYyrMph9bV5SwC4iCUcLZJtvkqCyyXmQdehHEuxmsuDJj5i
	 sg7o7YywkDHi29hs1moGFillxi455NvpFuBjlrpvNhV7ThRSXeL5MYoHPKk0tn64PA
	 Yfx8OAhhxDiBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/20] drm/connector: Add new atomic_create_state
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260512-drm-mode-config-init-v4-15-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-15-591dfdcc1bf9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:45:34 +0000
Message-Id: <20260514004534.989F2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Missing fallback to `atomic_create_state` in explicit `reset()=
` callers causes kernel panics (e.g., in `drmm_connector_hdmi_init`).
- [High] TV connector reset helpers are structurally incompatible with `ato=
mic_create_state`, preventing driver migration.
- [High] Missing NULL check for `atomic_destroy_state` causes kernel panic =
on driver omission.
--

commit 9c7dcc4b2ba2f3c09ed3926c7e0db8c1a524dd31
Author: Maxime Ripard <mripard@kernel.org>
Subject: drm/connector: Add new atomic_create_state callback

This commit introduces the atomic_create_state callback for drm_connectors.
It allows drivers to allocate a pristine state without side-effects, separa=
ting
initialization from hardware reset operations during suspend and resume.

> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index e2e5a1b8a8202..07686e94aae00 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c

[ ... ]

> @@ -534,6 +534,32 @@ void drm_atomic_helper_connector_reset(struct drm_co=
nnector *connector)
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
> =20
> +/**
> + * drm_atomic_helper_connector_create_state - default &drm_connector_fun=
cs.atomic_create_state hook for connectors
> + * @connector: connector object
> + *
> + * Allocates and  initializes pristine @drm_connector_state.
> + *
> + * This is useful for drivers that don't subclass @drm_connector_state.
> + *
> + * RETURNS:
> + * Pointer to new connector state, or ERR_PTR on failure.
> + */
> +struct drm_connector_state *
> +drm_atomic_helper_connector_create_state(struct drm_connector *connector)
> +{
> +	struct drm_connector_state *state;
> +
> +	state =3D kzalloc_obj(*state);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_connector_state_init(state, connector);
> +
> +	return state;
> +}

How should TV drivers migrating to atomic_create_state handle initializatio=
n?

The new pattern requires drivers to allocate and return a pristine state
without assigning it to connector->state. However, existing initialization
helpers like drm_atomic_helper_connector_tv_reset() and
drm_atomic_helper_connector_tv_margins_reset() are hardcoded to read and
modify connector->state directly.

If a TV driver attempts to use these helpers on its newly allocated state,
will the helpers dereference a NULL or stale connector->state and crash?
Would it make sense to introduce state-based variants of these helpers
that take a struct drm_connector_state pointer?

> +EXPORT_SYMBOL(drm_atomic_helper_connector_create_state);

[ ... ]

> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 2e2cd18a14b43..9d240817f8b64 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c

[ ... ]

> +static int drm_mode_config_connector_reset_with_create_state(struct drm_=
connector *connector)
> +{
> +	if (connector->state) {
> +		connector->funcs->atomic_destroy_state(connector, connector->state);

Is there a risk of a NULL pointer dereference here if a driver migrating to
atomic_create_state omits the atomic_destroy_state hook?

While omitting the hook is a driver bug, other DRM core functions like
drm_connector_cleanup() gracefully guard against this by checking
if (connector->funcs->atomic_destroy_state) before calling it. Should this
wrapper include a similar defensive guard to prevent system crashes?

> +		connector->state =3D NULL;
> +	}
> +
> +	return drm_mode_config_connector_create_state(connector);
> +}

[ ... ]

> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 5ad62c207d009..529755c2e8620 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h

[ ... ]

> @@ -1571,6 +1571,22 @@ struct drm_connector_funcs {
>  	 */
>  	void (*destroy)(struct drm_connector *connector);
> =20
> +	/**
> +	 * @atomic_create_state:
> +	 *
> +	 * Allocate a pristine, initialized, state for the connector

Does the introduction of atomic_create_state require updates to other core
functions that explicitly call the reset callback to allocate state?

For example, drmm_connector_hdmi_init() checks for connector->funcs->reset
and calls it. If a driver uses atomic_create_state instead, the reset check
fails and the state is never allocated.

Immediately after, drmm_connector_hdmi_init() calls
drm_connector_attach_max_bpc_property(), which dereferences the uninitializ=
ed
connector->state. Can this cause a kernel panic on boot for drivers migrati=
ng
to atomic_create_state?

> +	 * object and return it. This callback must have no side
> +	 * effects: in particular, the returned state must not be
> +	 * assigned to the object's state pointer and it must not affect
> +	 * the hardware state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-drm-mode-c=
onfig-init-v4-0-591dfdcc1bf9@kernel.org?part=3D15
