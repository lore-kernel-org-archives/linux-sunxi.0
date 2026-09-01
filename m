Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC64A0F17
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290183; cv=none; b=jMr1bkwkydv7LWaBlgiSLtoDVSVwFo8gB4v3yJ185pMfiAWG+DEwpuiOs1yK3+7uVX7EtGSE4TvusZNDfzmIK3BfAiT4jhOrZvkpDhITWqryLlODQ1lnEdY7QTGUegViLm/NkkJQ3bNEhogQaBqh3o8JKyeicjsgT4VnS1qg9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290183; c=relaxed/simple;
	bh=D5T9FDlA2bHdtw3qyUoUCTpgroM7V5k/zrq09fiWXQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=evDayAyOPa8l24HDsQULiUFTHHYWHKdhJqW4IuUtTbdg0Iq9JWqvXPSl0TBXgkqiwNW3Cou632njNW4V1OBI9G7USKVElUWUtHqTKCRxr5o0OWmStGOC1MTB+npxAOJwvYP1jZnoCgRDiBgDqnsCrbjeCYJe9o6xiQDLHVUZaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AemKn9Ni; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AemKn9Ni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59A31F000E9;
	Tue,  1 Sep 2026 19:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788290182;
	bh=sK8MxF/Bh9pZ54G0aGZ0bMqmuQjXPIjpgAgb8VVtQVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AemKn9Nip10IP09UHG7dPK04Mi4FSz1mMq5Q0/rfyg4542uSEZDa9HY0Gq+CjVIuP
	 z8kmR8JqyNYCDRjLoLfPZ1GHRze4AkvV4q0cIqsMDjL11LoDhJUxxIl007tr26PfUe
	 faqfAO0cit3n2D8E7NE/+9s8VSJEza7q4lO/GLssAOszJcv7nb/+2rZbetiAuZ/dkQ
	 lm8S3j6K4ph9UJqPUKCr2rel/YPwmqAW9NyOQ69AOHNFnQvN0QBuCKdu7E/myy7C5n
	 6FzRAaqHBsB+m6nALpIISFrxme7C1ueTBLSCNcTBi/2G6gphcGoRD0dvYUg1QY3D7w
	 Z4P45sjMxs/OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 14/74] drm/bridge: Fix unlocked list access in
 drm_bridge_attach()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-14-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-14-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:16:21 +0000
Message-Id: <20260901191621.C59A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mixing goto-based error handling with scope-based cleanup helpers (=
`scoped_guard`) in the same function.
--

commit a312843839f1a20e85a81d94af26656e4dacb18f
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: Fix unlocked list access in drm_bridge_attach()

This patch fixes an unlocked read of bridge->list in drm_bridge_attach()
by performing the check under bridge_lock. It uses the scoped_guard()
cleanup helper to manage the lock.

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index a8b6df5c13eaf..10dde3600c70a 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -606,8 +606,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, s=
truct drm_bridge *bridge,
>  	if (!bridge->container)
>  		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_all=
oc()\n");
> =20
> -	if (list_empty(&bridge->list))
> -		DRM_WARN("Missing drm_bridge_add() before attach\n");
> +	scoped_guard(mutex, &bridge_lock) {
> +		if (list_empty(&bridge->list))
> +			DRM_WARN("Missing drm_bridge_add() before attach\n");
> +	}

[Severity: Low]
Does introducing scoped_guard() here conflict with the existing goto-based
error handling later in drm_bridge_attach()?

The kernel's cleanup.h guidelines forbid mixing goto-based cleanup and
scope-based cleanup helpers in the same function. drm_bridge_attach()
currently uses goto labels for resource unwinding:

    if (bridge->funcs->attach) {
        ret =3D bridge->funcs->attach(bridge, encoder, flags);
        if (ret < 0)
            goto err_reset_bridge;
    }

While this specific change doesn't cause a direct runtime leak since the
goto statements don't jump into or out of the scoped_guard block scope,
could this structural mixing cause issues later? Would it be safer to use
standard locking (mutex_lock and mutex_unlock) here to avoid mixing the
two paradigms?

> =20
>  	drm_bridge_get(bridge);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D14
