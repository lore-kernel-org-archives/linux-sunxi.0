Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4F37D114
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 22:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712653; cv=none; b=Fvp43pQ7Mo7+2EIED9qafy8UEG0wUaV4PSV2ajiY3YPW9+2JW9894YrzbVDNzVZV9oqpVFj4C1r0PdrfVg4oIMJgA8ZnZv7YLv9pBhaAFm1DeVefh6BXm0ENURwGpu1sZHElwNBHiREChn12+YyvOZv3IVSI4VZxu7vqE77RCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712653; c=relaxed/simple;
	bh=6Ui/AJ63it4Uax2UE8BvRB8ez9zHFy9sSyLiavD+zq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DvT/c14Xn9aISltUHO/V85f/Sar/sKLk5ws9nDqlV6Uag2ap494XozxDcPDbpauxJ1Nlv1szrnu8aPy52CXvMhOzAbkrDLKXgS8nDOu78QDA7vt+OIF24Q4Bi40T85h5zxgmwJvGKvPH3MkdWtgxDhdUjZnfZyJfct8dobSvNKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlwcMk9Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlwcMk9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC4EC19425;
	Wed, 13 May 2026 22:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778712652;
	bh=6Ui/AJ63it4Uax2UE8BvRB8ez9zHFy9sSyLiavD+zq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TlwcMk9QpZq/G9o/+xB/H8LdSNGAkaw02kOcE05FRcNR+TwlBp2jvgWGqtObhUxPn
	 V0cTzs40MO35SkYiun1z57QJ+05G9Q7NBetDP0zfrqh2a6hrdoYNhM2KSU2bcQ3/wM
	 J2Le3ZRd/LV3hxBN8xJK9qUPPsVD2kB4qrUMqPrGXLHBQ0Aqw7Nqvxd6t1bWTa8JQq
	 Z7Sl8fA42qWN7UYp2YcPC80Mp42bcKoLkWY6Adekwyt6AeBesAiHOQj1KOpzJ8hEYc
	 fVZ5g0skVb53WwHbxzYkqckJRk9GXccgXhsjerwYxBBgyQnaWlj2ZYhSxHPBQvyy8O
	 ns5VRcXmegRPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/20] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260512-drm-mode-config-init-v4-7-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-7-591dfdcc1bf9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:50:52 +0000
Message-Id: <20260513225052.9FC4EC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing EXPORT_SYMBOL for drm_atomic_helper_colorop_create_state
- [Medium] Incomplete implementation: missing atomic_create_state hook in s=
truct drm_colorop_funcs
--

commit 33d70aace7968630d61946321195c9263dae2576
Author: Maxime Ripard <mripard@kernel.org>
Subject: drm/colorop: Create drm_atomic_helper_colorop_create_state()

This commit introduces drm_atomic_helper_colorop_create_state() to allocate
and initialize a pristine colorop state. It is intended to separate state
initialization from hardware reset during operations like suspend and resum=
e.

> It was thus decided to create a new hook that would allocate and
> initialize a pristine state without any side effect:
> atomic_create_state to untangle a bit some of it, and to separate the
> initialization with the actual reset one might need during a
> suspend/resume.
>=20
> Continue the transition to the new pattern with drm_colorop.

Does this patch miss adding the new atomic_create_state hook mentioned in
the commit message?

Looking at struct drm_colorop_funcs, the atomic_create_state function
pointer does not appear to be added, and drm_colorop_reset() seems to
continue handling the state allocation directly. Does this omission cause a
regression where drivers are unable to hook into the state creation process
to subclass the colorop state?

> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 4c4d0a953e357..c0eecde8c1762 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c

[ ... ]

> @@ -523,6 +523,29 @@ static void __drm_colorop_state_init(struct drm_colo=
rop_state *colorop_state,
>  	}
>  }
> =20
> +/**
> + * drm_atomic_helper_colorop_create_state - Allocates and initializes co=
lorop atomic state
> + * @colorop: drm colorop
> + *
> + * Initializes a pristine @drm_colorop_state.
> + *
> + * RETURNS:
> + * Pointer to new colorop state, or ERR_PTR on failure.
> + */
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop)
> +{
> +	struct drm_colorop_state *state;
> +
> +	state =3D kzalloc_obj(*state);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_colorop_state_init(state, colorop);
> +
> +	return state;
> +}
> +

Could the lack of an export declaration here cause a build regression for
loadable DRM modules?

Since drm_atomic_helper_colorop_create_state() is a core helper function
intended for drivers, modules attempting to reference it might encounter
unresolved symbol errors without an EXPORT_SYMBOL or EXPORT_SYMBOL_GPL
statement.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-drm-mode-c=
onfig-init-v4-0-591dfdcc1bf9@kernel.org?part=3D7
