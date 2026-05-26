Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE10638C2A0
	for <linux-sunxi@lists.linux.dev>; Tue, 26 May 2026 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816608; cv=none; b=VqHcOhWHtJpSfxX/4nzungkCBxuLI3JjIFJKqeWc4JzDtCquv8PFpUPL9J3DW5ZBa5lydquEwbi/LBIjXspmHETA2L1AB0pEfHAgoXdl9Q9bveHT6/qSqZfegtwvHImTWpQUkDiiMZv3+6ye5LfSN3gttqJsmu7xSoMfV4tibhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816608; c=relaxed/simple;
	bh=2U1RsmnXLktbaBS7DwUFAxHSbeHFIvA+9eH087o2ie8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sq3r1AICfPMIi+3w4a4bsQouSgCQ94B9aQKkYH9NrdA3QQhPfcLvmJxXECD6KDBppB9AxjNuMAQj3A4EQLgV/TztEItQqm8vL9eH9G82IKpEJsPAdLsB1CJww/imJxSxzxD4ex+FMMjS0h4myBmGk/kBN50bju1KKgPaJPFCapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otJGPO1C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otJGPO1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D2B1F000E9;
	Tue, 26 May 2026 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779816607;
	bh=DZC+qfjNEMs6INtYOxqMGBxDgQKqqF2UwRJO2v4Ot8o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otJGPO1CbVJrqsHJoYQni06JR3mLUZNgaJtuYdGpp6+KhqiI61rsfsFWdvMU7EWyR
	 Kp2IhB/eOJFAgYYQ9xVafstMSek3XzWqc4+HXdWHvapRD1uyYmWi5FwYhhRxb4WB/Q
	 p2lKrnJIc+6t+K2/OstntV4msNeDyYdLXzzmm3c38r6jsSbnhDf7779bnPdJzv4GnH
	 DQjWCxXK71vTtpSe1gU4lnvD1EnOP27nZ52+s1fYo50cN09qiFA4fca6V6mdg7nZG1
	 wkv3j3Ka3e4ka4heAc3CP/a1d5mBsubxHVwkCxZIu4hW8ky3hwVrD+ursXPm9SQtqk
	 dLcbqqfaYg2pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/19] drm/atomic: Drop drm_private_obj.state
 assignment from create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260526-drm-mode-config-init-v6-3-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-3-852346394200@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 17:30:06 +0000
Message-Id: <20260526173006.C2D2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Improper error handling in `drm_atomic_private_obj_init()` leaves =
partially initialized objects on the global list, leading to a NULL pointer=
 dereference.
--

commit ec1f21a958898ad786de645ae441f9fe381d3fe4
Author: Maxime Ripard <mripard@kernel.org>

drm/atomic: Drop drm_private_obj.state assignment from create_state

This commit removes the assignment of the newly allocated state to
drm_private_obj.state inside __drm_atomic_helper_private_obj_create_state().
This assignment is redundant because drm_atomic_private_obj_init() already
sets this pointer after calling the atomic_create_state hook.

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

[Severity: High]
This isn't a bug introduced by this patch, but since we are discussing
the obj->state assignment here and deferring it to
drm_atomic_private_obj_init(), could this lead to a NULL pointer dereference
if drm_atomic_private_obj_init() fails?

Looking at drivers/gpu/drm/drm_atomic.c:drm_atomic_private_obj_init():

	list_add_tail(&obj->head, &dev->mode_config.privobj_list);

	state =3D obj->funcs->atomic_create_state(obj);
	if (IS_ERR(state))
		return PTR_ERR(state);

	obj->state =3D state;

If atomic_create_state() fails, the function returns the error immediately
without removing obj->head from the list. This leaves obj->state as NULL.

Multiple drivers (such as drm_dp_mst_topology_mgr_init() or
vc4_ctm_obj_init()) ignore the return value of drm_atomic_private_obj_init()
and continue initialization, meaning the device successfully registers
despite the failure.

Once registered, reading /sys/kernel/debug/dri/X/state triggers
drm_state_dump(), which iterates over privobj_list and calls
drm_atomic_private_obj_print_state(p, obj->state).

Because obj->state is NULL, drm_atomic_private_obj_print_state() will
immediately dereference it (struct drm_private_obj *obj =3D state->obj;),
causing a kernel oops that can be triggered by userspace from a diagnostic
read.

>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-drm-mode-c=
onfig-init-v6-0-852346394200@kernel.org?part=3D3
