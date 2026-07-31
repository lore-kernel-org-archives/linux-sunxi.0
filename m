Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F90B43849B
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520878; cv=none; b=UN81Z6bljdHoIwtabO4phP8He0I3sQTEq3J9aNrSahzvuxO238m3tjHMJ+4pcpzrF4LHxr8PI3V3cpUHg+55AXbQaG2HoG3/UkByUEaEJUVN5MhYrIzrI6tg+TqlqUGNfdLhjQRD847x+0dF2S5l7W3EX8vP52vZ9giBM7KoOrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520878; c=relaxed/simple;
	bh=EwjhSjTgXQ6hdEna74y0g89pNdXc9eF/pi3hdP57xik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uBxwQ2GETiTW/hsfcPkx4Yzsu3OZQE3rIs3hQ5PIqL7hI3zsNiQlGSO9fvIyEqUF4Vg3Nxrm3EELINfZ5uSOgymSVFfq8P/Xvl8EfpW3C5JgPXjW5bARrkLvWyfZIMmWcUZ3Wrf1xGGv2PUqsN9XRP85lDVxZgc8BayaiZWeZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKJ/sCev; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKJ/sCev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDF61F00AC4;
	Fri, 31 Jul 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785520877;
	bh=KAqD0yPsTaRgj4uV/hiNxUzYDnryZJwq4NKvceFi1WE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKJ/sCevOijtduInBdSUaxJj31lCYWEraY8MsRw+0fJG+cGDEZki4m9MjQ+NO2NUA
	 YLzJkS1WYR8sbBlW8tUuxtcgpAfWVrg3fNlknEcXn15H3eePJGf+a1uCgoeR51ZYfI
	 AthYgUIg65vnNrjqEOT26YTXhg+uZO7EQ9aQAVpo3cyINJEsuFg3ZLlfZfj1tCRrGV
	 QGgL4mYGJ++qozwMRMe1qdJmxSdue5RbjOClCJR3eNemafDHgw0ZsXaIkqUELJ9Pwc
	 MORVChm+DTfuQG2xbfWyLC/gTa/A4BwOLJhVW6jLV3O02GfToMmfK2NWTAHER4TEjs
	 LgHsGz+cHHbDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 14/69] drm/bridge: Remove redundant error check in
 drm_bridge_helper_reset_crtc()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-14-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-14-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:01:16 +0000
Message-Id: <20260731180117.1FDF61F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double unlock of connection_mutex and unprotected state access due=
 to nested lock handling flaw in drm_atomic_get_connector_for_encoder.
--

--- Patch [14]: [PATCH v10 14/69] drm/bridge: Remove redundant error check =
in drm_bridge_helper_reset_crtc() ---
commit 3469d1c48eb06940af7b278f9266400f3b5ea3dc
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: Remove redundant error check in drm_bridge_helper_reset_crtc()

This commit removes a no-op error check after drm_atomic_helper_reset_crtc(=
),
as the return value is already propagated correctly by the fall-through to
the out label.

> diff --git a/drivers/gpu/drm/drm_bridge_helper.c b/drivers/gpu/drm/drm_br=
idge_helper.c
> index 420f29cf3e543..0a3c8fee66b32 100644
> --- a/drivers/gpu/drm/drm_bridge_helper.c
> +++ b/drivers/gpu/drm/drm_bridge_helper.c
> @@ -50,8 +50,6 @@ int drm_bridge_helper_reset_crtc(struct drm_bridge *bri=
dge,
> =20
>  	crtc =3D connector->state->crtc;
>  	ret =3D drm_atomic_helper_reset_crtc(crtc, ctx);
> -	if (ret)
> -		goto out;
> =20
>  out:
>  	drm_modeset_unlock(&dev->mode_config.connection_mutex);

[Severity: High]
This is a pre-existing issue, but does this result in a double-unlock of
connection_mutex?

Earlier in this function, the lock is acquired before calling
drm_atomic_get_connector_for_encoder():

drm_bridge_helper_reset_crtc() {
    ...
    ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
    if (ret)
        return ret;

    connector =3D drm_atomic_get_connector_for_encoder(encoder, ctx);
    ...
}

However, drm_atomic_get_connector_for_encoder() unconditionally unlocks
the mutex on exit. Because drm_modeset_unlock() lacks a nesting counter, it
fully drops the ww_mutex.

Consequently, connector->state is accessed locklessly, and reaching this out
label calls drm_modeset_unlock() a second time, which could corrupt the
kernel lock state.

>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D14
