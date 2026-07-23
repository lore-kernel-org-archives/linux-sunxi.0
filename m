Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259F8634C
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771283; cv=none; b=ilmcsX03vWy6UKi3imuBTDH3R5Wal51tJYwA/8G1rmLEC8zrzq8ZFOdEtwaiXI6XHqAXiXGc/jkccDLwzKdRbAJDg39bNHJ1zmKoKo/fcrcGloKXFs5utxS/pYYp0GpqkknRAePHoym65ywKbmnzW4zShNBejozwkXzzGKa32ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771283; c=relaxed/simple;
	bh=LgAlAE26m5DLtVaLrctGZgP9ghB4nfFYioi6E1Thc68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VDwEpsOSYzV5OHCFlgiMjIbYIlmmz8h4h54yq/nVo3r7AQZQziF0x6exBdQVE16VrbXvCDclMA3G49Sbmsce6etLk11VeKBTSmjCoY9f3eAfZI1j8Zs3cLq4GZy80ksrE8Ex7r+dcKoKrtZgP+zS5vXvUyD9ztougtoQkZsh7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hf+zBgzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hf+zBgzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC961F00A3A;
	Thu, 23 Jul 2026 01:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771280;
	bh=hI0i7efmL2lkyS6wC7kGyPgxPrJS9rT7B578hvJBxTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hf+zBgzUqkmrusuJiUA2U3YzJyTK3Go4MylS6X1L1TxkO4BV6FByT7x0EtkntOQct
	 KAmSGu1VQh32G4qAZBFK6iZ0ulwS0O5hYozET3ucWm4uiOl9w6RamzMYpTDII+ehO5
	 285RU7gMe276iQBXSncyvLuIovFt4rFRpKUTTuvoC6sWUjkGnPMa8OZxrMIMmGlxuS
	 qr2KG8eIdE+QH4VQkF0AnTLpHxwmUCYOjkdk8ZyBFNdunCUfuzynFVnGHTeoUutUYx
	 ZgGZDDYHv0RC26loWZtU7TglLTY2Uas8uwHrTbk9FhRaGnthCygETz5MiQHkDo3NWq
	 7AaoPO+mn2KRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/61] drm/bridge: Remove redundant error check in
 drm_bridge_helper_reset_crtc()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-10-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-10-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:47:59 +0000
Message-Id: <20260723014800.0FC961F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional unlocking of a context-managed lock causes lock stri=
pping and double unlocks.
- [High] drm_atomic_get_connector_for_encoder() returns a connector without=
 holding a reference, leading to a Use-After-Free.
--

--- Patch [10]: [PATCH v9 10/61] drm/bridge: Remove redundant error check i=
n drm_bridge_helper_reset_crtc() ---
commit 9b5cf69b4268daeb09910d2aa6efb179fd6ada06
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: Remove redundant error check in drm_bridge_helper_reset_crtc()

This commit removes the no-op error check after
drm_atomic_helper_reset_crtc() since the goto target is the immediately
following label. The return value is already propagated correctly
without it.

> diff --git a/drivers/gpu/drm/drm_bridge_helper.c b/drivers/gpu/drm/drm_br=
idge_helper.c
> index 420f29cf3e543..0a3c8fee66b32 100644
> --- a/drivers/gpu/drm/drm_bridge_helper.c
> +++ b/drivers/gpu/drm/drm_bridge_helper.c
> @@ -50,8 +50,6 @@ int drm_bridge_helper_reset_crtc(struct drm_bridge *bri=
dge,
> =20
>  	crtc =3D connector->state->crtc;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This is a pre-existing issue, but can this dereference cause a Use-After-Fr=
ee?

Looking at drm_atomic_get_connector_for_encoder() called earlier in this
function, it finds a matching connector and breaks out of the
drm_for_each_connector_iter() loop. It then calls
drm_connector_list_iter_end(), which drops the reference on the found
connector.

The function then returns this connector without acquiring a new reference
via drm_connector_get().

If a concurrent hotplug event (like an MST display unplug) unregisters and
frees the connector before we dereference connector->state here, would it
result in a Use-After-Free?

>  	ret =3D drm_atomic_helper_reset_crtc(crtc, ctx);
> -	if (ret)
> -		goto out;
> =20
>  out:
>  	drm_modeset_unlock(&dev->mode_config.connection_mutex);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This isn't a bug introduced by this patch, but can this unconditional unlock
lead to a double-unlock?

Earlier in this function, drm_atomic_get_connector_for_encoder() is called
and passed the acquire context ctx. Since connection_mutex was already lock=
ed
in ctx, the inner function's lock attempt returns -EALREADY (which is
treated as success).

However, at the end of drm_atomic_get_connector_for_encoder(), it
unconditionally calls drm_modeset_unlock(). This unlinks the lock from the
context and fully unlocks the WW mutex, stripping the lock from
drm_bridge_helper_reset_crtc().

When we reach this out label, does calling drm_modeset_unlock() again on the
already unlocked mutex trigger a double-unlock warning or crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D10
