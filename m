Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C335202B
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190531; cv=none; b=AstlsI72jR0wWFro9JOBSbXK6H/xzEIwyr40jAf+dUNbWak5ROs8EG32osNlGZ035l6vccHKYie8Pmzq3B/0N348gtos215/RLPpJ0fiud+73pvJhpMPUYzdWtHxwDDDA59SnYUnzN7U8gVr9+sCONpVIxPK1zvK0TpU7eVT7fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190531; c=relaxed/simple;
	bh=BdOA/RrGnLQzpL/7abIo+XztyD6F+K/Fq9P3OT8pwZ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LwNaZ5YYaMGCE76Dqhjy2SXVmx1b7CUfXnv+a2AvflecVfB5teXyYGJB0m0VCIT36RVCA9DHLrHccCBH1DXsX56lUsNPC9VJvSPIN+SQQsKjaUu0H5CE7CBRwTjo9jBBAWah76zEqDyDfJCO3/v//9MIzcWXis2gxBfsXkzv+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8RyeA4a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8RyeA4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AE1C2BCB3;
	Tue, 19 May 2026 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779190530;
	bh=BdOA/RrGnLQzpL/7abIo+XztyD6F+K/Fq9P3OT8pwZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=k8RyeA4a02KLyyG954ZWqXb0pXmCjQykkBAPrwOHrUtLNj36Dm1tQp4B2jJF4Vuvw
	 X/Y/KdOEMIqQ+2z1ZAGnzK7ffsxDZX8QnCOEEX5Xyi8kpidvbje9zJVBTUeVxC0fHR
	 sdIcVzu2IRN7L8Pbms6vKNY8oRgnsb/jKvgWLYkUtd3TXG8Gt1pmR3Vy7YHahybHXN
	 GhzvVRBfqiAGQN66cy4ri+KnWzRxIJYaCLmPIq2WwpkmIHPCA2dhmI7jY4bvwd0o2d
	 TegwX7TmrcCTrO5ZwbySA//Ner1G1aR6b7vzrR1SxK2O7VvntD3WOyjPUyKNVdU1b6
	 I+x9BR2pJl2nQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/19] drm/atomic: Drop drm_private_obj.state
 assignment from create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260519-drm-mode-config-init-v5-3-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-3-388b03321e38@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:35:30 +0000
Message-Id: <20260519113530.C2AE1C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbalanced Lifecycle / List Management Error in drm_atomic_private=
_obj_init() leads to UAF or NULL pointer dereference.
--

commit 44b9224847cfbcc3b1c83e99bfc50096eaebde99
Author: Maxime Ripard <mripard@kernel.org>

drm/atomic: Drop drm_private_obj.state assignment from create_state

The initial intent of the atomic_create_state hook was to simply
allocate a proper drm_private_state and return it, without any side
effect. This patch removes a redundant assignment in
__drm_atomic_helper_private_obj_create_state() that defeats this purpose.

> This assignment defeats the purpose, but is also redundant since
> drm_atomic_private_obj_init(), the only call site for the
> atomic_create_state hook, will also set this pointer to the newly
> allocated state.

This isn't a bug introduced by this patch, but since the commit message
discusses drm_atomic_private_obj_init(), I noticed a potential lifecycle
issue in that function.

In drm_atomic_private_obj_init(), the private object is added to
privobj_list before invoking the atomic_create_state() callback:

drivers/gpu/drm/drm_atomic.c:drm_atomic_private_obj_init() {
	...
	list_add_tail(&obj->head, &dev->mode_config.privobj_list);

	state =3D obj->funcs->atomic_create_state(obj);
	if (IS_ERR(state))
		return PTR_ERR(state);

	obj->state =3D state;
	...
}

If atomic_create_state() fails, the function returns an error but fails to
remove the partially initialized object from privobj_list.

Since many callers (e.g., vc4_ctm_obj_init(), drm_bridge_is_atomic(),
drm_dp_mst_topology_mgr_init()) ignore the return value, could this leave
the object in privobj_list with obj->state =3D=3D NULL?

If this occurs, could the next atomic commit trigger a NULL pointer
dereference when drm_atomic_get_private_obj_state() invokes
atomic_duplicate_state(), and implementations call kmemdup(obj->state, ...)?

Also, if the device is torn down and drm_atomic_private_obj_fini() is calle=
d,
it unconditionally executes:

drivers/gpu/drm/drm_atomic.c:drm_atomic_private_obj_fini() {
	...
	obj->funcs->atomic_destroy_state(obj, obj->state);
	...
}

Since obj->state is NULL, would wrappers using container_of() evaluate to a
negative pointer offset, causing a panic when kfree() is called on it?

> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index cc70508d4fdba..a82568d87e4f7 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -731,8 +731,6 @@ void __drm_atomic_helper_private_obj_create_state(str=
uct drm_private_obj *obj,
>  {
>  	if (state)
>  		state->obj =3D obj;
> -
> -	obj->state =3D state;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-mode-c=
onfig-init-v5-0-388b03321e38@kernel.org?part=3D3
