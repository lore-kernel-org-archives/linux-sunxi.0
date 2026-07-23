Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76AB191F94
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771484; cv=none; b=Yf2gJBOT0oqZ87govAdtqqCCmejjE/rjjrN117PhsuO67NqhDmTmMAm93oLtmtjupszxqhh5uDVjBmiP9a41k6xuyzK/+XlcdKweYrXtcDcu2uJe3sN4+4yKX9ZYbioOz5thi2++MQXRz9pcKj2yL9OcW2b7oME1eumjh7IWAP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771484; c=relaxed/simple;
	bh=pibw8nBvbvIO1lXYDHgP/NXpA+V3597jf+soq4hlDt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=REIQ7Omi+QgEktm3udvodYzUQ/IRRGtt+d7f5254FjLpbHh83cXW+f2APwXmTCeRVE6duEqT+TBpcvM35JAzwYu3YgtXkQXAs4lCOtZjpP+Oxi4svuC1A8ut1/U833guFBUq3spmbYXiV48mSAEnC+D5tnZ/EhHFXU6pAMDGbTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxEIqJ76; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxEIqJ76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FCD1F000E9;
	Thu, 23 Jul 2026 01:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771482;
	bh=wvX7KTUU61lDaiLET8Z8RLN245/Y3GBZZKNHMjZYC4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PxEIqJ76jUT4nKctPJjzHqD8BWm0b5RT9UQXu7W3HOc4pMu1aif5LDCe+CLSeOD4b
	 nOMnLzvIcU72mLavBQ7KzCMBAU+qjg+hWqXm3fwc3YFPVX9WFytpH4XeZycN6UVO1T
	 aehvv4l008RGLCr1d8hQkoVbEtWRF1Oa17EzNgceiw1gAbGAuImzUl3CdVa7DVCAg7
	 vkNRDSprEh17Pa17bKPNoo//8bVHwwriUwHY9WXCbsXI4nyF1k4CHrCl/qZ+X0VwSx
	 wEe+2nLyLL/HyTFgzg2VoI55fZ+dD8ONry3fdSDtkv4ypP519j5KOCPyeneOSUhqYN
	 BTkRhwv1Hg0Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 16/61] drm/display: hdmi-state-helper: Pass acquire
 ctx to hotplug helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-16-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-16-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:51:21 +0000
Message-Id: <20260723015122.49FCD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Self-deadlock due to re-acquiring connection_mutex with a new ww_a=
cquire_ctx in drm_atomic_helper_connector_hdmi_force()
--

--- Patch [16]: [PATCH v9 16/61] drm/display: hdmi-state-helper: Pass acqui=
re ctx to hotplug helpers ---
commit 5cf4eb0e25950e07d4630b5f697abf8096ce1b1d
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/display: hdmi-state-helper: Pass acquire ctx to hotplug helpers

Extend drm_atomic_helper_connector_hdmi_hotplug() and
drm_atomic_helper_connector_hdmi_update() to take a struct
drm_modeset_acquire_ctx argument to be used when a CRTC reset is required.
Update callers, including drm_atomic_helper_connector_hdmi_force() which
now initializes its own context.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 92be6278ea443..04d5196a2010f 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
[ ... ]
> @@ -1255,6 +1264,19 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hot=
plug);
>   */
>  void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connec=
tor)
>  {
> -	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +retry:
> +	ret =3D drm_atomic_helper_connector_hdmi_update(connector, &ctx, connec=
tor->status);

[Severity: High]
Will this cause a self-deadlock when forcing a connector's status?

When a user writes to sysfs to force a connector status, it invokes
drm_helper_probe_single_connector_modes(). This function acquires the
connection_mutex using its own local ww_acquire_ctx before calling the
force() callback:

drm_probe_helper.c:drm_helper_probe_single_connector_modes()
  drm_modeset_acquire_init(&ctx, 0);
  drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
  connector->funcs->force(connector);

This new implementation of drm_atomic_helper_connector_hdmi_force() creates
a new local ctx, which is passed down the chain:

drm_atomic_helper_connector_hdmi_force()
  drm_modeset_acquire_init(&new_ctx, 0);
  drm_atomic_helper_connector_hdmi_update(..., &new_ctx, ...)
    drm_connector_hdmi_sync_scdc(..., &new_ctx)
      drm_modeset_lock(&connector->dev->mode_config.connection_mutex, &new_=
ctx)

Because the current thread already holds connection_mutex but is attempting
to acquire it again using this new, conflicting ww_acquire_ctx with
acquired =3D=3D 0, won't __ww_mutex_lock() block the thread waiting for its=
elf
to release the lock instead of returning -EDEADLK?

> +	if (ret =3D=3D -EDEADLK) {
> +		drm_modeset_backoff(&ctx);
> +		goto retry;
> +	}
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D16
