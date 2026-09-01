Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D584A205E
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290279; cv=none; b=X7nIKF0nmE9Fj3FngLr2BMgX8MFBGcpxW9X6AnM0plXBw230Bl9j5EX23oAlVMI+9kqrXACRW+/xlNUYhYeen1uVMqyh6T1TPoDbeEztP5+ClTqAg3D4UqduRr0V+l+SWzNd2P2OgdgSrW4HEdofKOaPJ8+k5HiO2jw8mA8J7CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290279; c=relaxed/simple;
	bh=yTsKmXmQxr0c5FBWnT4k3AkYMLQyS0ne/iSMSr2ah8k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OEMWxRtRA2W4ReDZszOA/FxiwHspNZgEFrV5IyiGJPN0DXcwLd8iJRaCQW1kjk4YEEM0VhGR/Rv9SmPfYxSg8HS+rBilMspfbvI2S6Wba+lsOBDyH0SDrmQWWOQK+EQiwf+qBov7VQHz1P2RhwF1i4lJ9W7ZX88ssdvzM0cUqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMpdYJWx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMpdYJWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD4F1F000E9;
	Tue,  1 Sep 2026 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788290278;
	bh=t7PpiHPyWNWJXO2Tebracjvk2rfu94fPfn9VgN9yj70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PMpdYJWx9BYFbeDOJsO7knPUdHAsQIrexUas8LpPkTkPnFhbO1n5kXg/GzGVKX4vm
	 lEyr5VzGJTeOnIWPW+LBOrQLGY3GRQdK2xh6BpZfa56xPlZNAnUtMFgjw59zdrxAwi
	 s6sUQUW/BKFIjpE16rLwn1v+EH7HmeM5ybXoCYhrULz6EGe0yPmHNUXZ3UKGW/Mm6a
	 m3M2pPHBAHQ8vGuTuU99Qd0FAmF/CM4FkutnHnYxutZQDPvjC2UqK+yeRwFigmg8OY
	 DOHS3oQRbw62JMJgBjeTUYEQXKeTEmawmpNsDxIgEFcvDEZJSYYa+PMlVdJ8NzQej6
	 GP3IxKuGoQUdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 12/74] drm/bridge: Fix unlocked list_del in
 drm_bridge_add()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-12-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-12-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:17:57 +0000
Message-Id: <20260901191758.0BD4F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] drm_bridge_remove() destroys mutexes while the bridge is still ref=
counted, risking a use-after-destroy.
--

commit 7791e5cbe69e4f164e69cc2e98832df9a6224dd4
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: Fix unlocked list_del in drm_bridge_add()

When re-adding a bridge that was previously removed, drm_bridge_add() drops=
 it
from bridge_lingering_list without holding bridge_lock. This commit ensures=
 both
the list_empty() test and list_del_init() are performed under bridge_lock to
prevent list corruption.

Closes: https://lore.kernel.org/all/20260723015004.1F5711F000E9@smtp.kernel=
.org/

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index afaae272347c0..2c457ad74f3b3 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -454,8 +454,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
>  	 * in bridge_lingering_list. Remove it or bridge_lingering_list will be
>  	 * corrupted when adding this bridge to bridge_list below.
>  	 */
> +	mutex_lock(&bridge_lock);
>  	if (!list_empty(&bridge->list))
>  		list_del_init(&bridge->list);
> +	mutex_unlock(&bridge_lock);
> =20
>  	mutex_init(&bridge->hpd_state_mutex);
>  	mutex_init(&bridge->hpd_mutex);
[Severity: High]
This is a pre-existing issue, but since we are modifying the bridge locking
here, is it safe for drm_bridge_remove() to unconditionally destroy these
mutexes while the bridge might still be refcounted?

When a bridge driver is unbound, drm_bridge_remove() calls:

	mutex_destroy(&bridge->hpd_mutex);
	mutex_destroy(&bridge->hpd_state_mutex);

If the DRM device still holds a reference to the bridge via drm_bridge_get(=
),
and subsequently attempts to call functions like drm_bridge_hpd_enable(), it
will lock a destroyed mutex:

	mutex_lock(&bridge->hpd_state_mutex);
	mutex_lock(&bridge->hpd_mutex);

Could this result in memory corruption or lockdep splats if the display
controller retains a reference after the bridge is removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D12
