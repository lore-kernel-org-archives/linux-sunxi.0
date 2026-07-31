Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22A233952
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520218; cv=none; b=UFajsyexTYhORTuQZfZcO4itfdpHQ2nO061IknGNKbstk+RxpeFBCQioeExRiQZfaCtaux80Il8E9ZLB7mvleZ9he2sX/a2473s7Ph3T/GKKw91MaKbm0A9a1B7agFeRLHb7wZM47+eSpA/Db5NGErwUyH2KhkEdyVsuoOPY1/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520218; c=relaxed/simple;
	bh=sBO3sf5h3KmfjQFaKj+vToAwMDCpsFJF8xco3QvOoto=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S0tKotSg2SdW9CkA6YAXs6ZqWmdNAbh33sXicewcBmMBLZ9k5YMLCCQp0bnfhWCCpblZgkcnWXRx5Z9F5m7SEMKHmHcCWYXth5/g5kwB/lo4YH+93APR/tkO/41T3QH0NSasNG8IgCx3gaKIL8ZAErx5vof5uOhekv0lMyMo5Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHZqUwHI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHZqUwHI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D591F00AC4;
	Fri, 31 Jul 2026 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785520217;
	bh=yQjGBuegKft+d7JZE94GfWgQJwWOu3bicyqNFN3eUyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FHZqUwHIplUz+V9LHdxFQ3kItfrG41gUREOd6siZnc79n5RvAl0bYvLCoe5mMMy9t
	 nXzpWXY8HzDhAqMxlilLcVZFfmPWlQEGlAR9wYnPXsKa/aySWTEtFjcIj9Q3qQWxEE
	 jmZrZEpffXpXqLHaxyePQ3c37S9z+zgJfV+hLMgM2ESi4SfqXeytBaSn5EZOHDDT1w
	 kxx4G7X5neKMkF1FgDG+Mtqr1xgwpRQ3uQLeKr5QMUw/cC14wa7vk71JOLIwk0I/Fc
	 4oL4XPJ4JO+rO+XAE0Iz+xz4RZ5h2+sxNxgCtRmmRqjOGRZygE3U0/fE0NuJUar0mJ
	 CcWP/dtj4BtIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 12/69] drm/bridge: Fix unlocked list_del in
 drm_bridge_add()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-12-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-12-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 17:50:16 +0000
Message-Id: <20260731175016.C5D591F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Legacy zero-initialized bridges not allocated via devm_drm_bridge_=
alloc() will cause a kernel panic due to an uninitialized list_head and tri=
gger refcount warnings.
--

--- Patch [12]: [PATCH v10 12/69] drm/bridge: Fix unlocked list_del in drm_=
bridge_add() ---
commit e0f10da4c05d8a75c537ce94edb147bda1eb2e78
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: Fix unlocked list_del in drm_bridge_add()

This commit addresses a list corruption issue in drm_bridge_add() by wrappi=
ng=20
the bridge_lingering_list removal sequence with the bridge_lock mutex. It=20
prevents concurrent modifications from drm_bridge_remove() and debugfs walk=
s.

Closes: https://lore.kernel.org/all/20260723015004.1F5711F000E9@smtp.kernel=
.org/

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index afaae272347c0..8b8f71c3ccff9 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c

[ ... ]

> @@ -454,8 +455,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
>  	 * in bridge_lingering_list. Remove it or bridge_lingering_list will be
>  	 * corrupted when adding this bridge to bridge_list below.
>  	 */
> -	if (!list_empty(&bridge->list))
> -		list_del_init(&bridge->list);
> +	scoped_guard(mutex, &bridge_lock) {
> +		if (!list_empty(&bridge->list))
> +			list_del_init(&bridge->list);
> +	}

[Severity: High]
This is a pre-existing issue, but will this cause a kernel panic for legacy=
=20
bridge drivers that allocate struct drm_bridge using kzalloc() instead of=20
devm_drm_bridge_alloc()?

For a zero-initialized bridge struct, the list_empty() check evaluates to=20
false because the uninitialized list_head pointers are NULL, and NULL is no=
t=20
equal to &bridge->list.=20

This means list_del_init() will execute and unconditionally dereference the=
=20
NULL prev and next pointers, crashing the kernel during device probe.

Is it possible to check if the list_head is actually initialized before=20
testing if it is empty, or handle legacy zero-initialized bridges safely=20
to avoid breaking the probe path on affected platforms?

> =20
>  	mutex_init(&bridge->hpd_state_mutex);
>  	mutex_init(&bridge->hpd_mutex);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D12
