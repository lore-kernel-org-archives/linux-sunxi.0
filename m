Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5442E2F0E
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707541; cv=none; b=BE7z+oqYXOnBcomM17djYWQEI3HVOTDu69umWdUVtS+aWzgYHkyITP6/ERw9tlR2xCJOz5W9I8O5Cw27/+GgWCxakeII44PrAfp+j57MpOIDu3JogtBJ5R+fRyGdifaXlUE4+yyFmY7iX9i9NR2CNe7ZWgtrWSky7fR5ZiJy5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707541; c=relaxed/simple;
	bh=vSBeIwF+aCnPa2v4Y/boBJOr5dgp9S5E6LWiNQ3RnL8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qhdj5CpfKFibUJs+/7IwMoy9CLAvdG8/po6Ay7JVJCc+1fShqnz6aMSGCQRzr0R7fMoMHXGP/mk5bKRHcy2Oqxss+s2MkO7B8/D/W4lobdoCP8q1Tz2Fi85PptkrfFiXiN+8DO8MPHFSVf7Q1CjfU/qC7bfIhe1hiip93E+I+XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzxu9C6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzxu9C6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B793C19425;
	Wed, 13 May 2026 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778707541;
	bh=vSBeIwF+aCnPa2v4Y/boBJOr5dgp9S5E6LWiNQ3RnL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Wzxu9C6ptnh0DAdwrDE17DK0OiSBOiSAiBZY3OBOacYgoWES6LZC9ZBmIh+ADDrBj
	 q3Ga50mvZPm0jHECaHvmzoQOGrBvJWpHZddC2d+HbkBAbbm5Q6+n9L3L6Wb3YVjpkX
	 hd9Hw1u8dD7OfSIqLdCTDGHsffIYbStCwmpETHxGj6cp/yT4+GQEtILrYnZjtvkBgh
	 wlhqCSS5Cwn8ekoirJwRikQUufRKQkuJo78iNnr8WG7adr3f5bgp0DtcOyv+enw/PW
	 iUmyRviNqEdDraPYMJz+FtW9xGCRCLHyDAu6+Cx+OCtdvDCZZzB3drYX6QSHmhk1rV
	 3qa2OU11RjY1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/20] drm/atomic: Document atomic commit lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260512-drm-mode-config-init-v4-1-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-1-591dfdcc1bf9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:25:40 +0000
Message-Id: <20260513212541.2B793C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The documentation incorrectly states that drm_atomic_commit_clea=
r() frees the struct drm_atomic_commit instance.
--

commit fdfb916c25c456b6e4d4d1ec325dd4bd7d5f24d3
Author: Maxime Ripard <mripard@kernel.org>
drm/atomic: Document atomic commit lifetime

This commit adds kernel-doc comments detailing the lifetime and allocation
process of the drm_atomic_commit structures.

> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 170de30c28ae4..04bc3e736cbdb 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c

[ ... ]

> + *   + After the state is populated, it is checked. If the check is
> + *     successful, the update is committed. Part of the commit is a call
> + *     to drm_atomic_helper_swap_state() which will turn the new states
> + *     into the active states. Doing so involves updating the object's
> + *     state pointer (&drm_crtc.state or similar) to point to the new
> + *     state, and state_to_destroy will now point to the old states,
> + *     that used to be active but aren't anymore.
> + *
> + *   + When the commit is done, and when all references to our &struct
> + *     drm_atomic_commit are put, drm_atomic_commit_clear() runs and
> + *     will free all state_to_destroy (ie. old states), and the &struct
> + *     drm_atomic_commit instance.

Is this documentation accurate about drm_atomic_commit_clear() freeing the
struct drm_atomic_commit instance?

Looking at the implementation, drm_atomic_commit_clear() only resets the
internal arrays and frees the individual object states.

It appears the struct drm_atomic_commit instance is actually freed by
__drm_atomic_commit_free(), which is invoked via drm_atomic_commit_put().
__drm_atomic_commit_free() calls drm_atomic_commit_clear() first, and then
frees the memory.

Should the documentation reflect that __drm_atomic_commit_free() is
responsible for freeing the instance?

> + *
> + *   + Now, we don't have any active &struct drm_atomic_commit anymore,
> + *     and only the entity active states remain allocated.
> + */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-drm-mode-c=
onfig-init-v4-0-591dfdcc1bf9@kernel.org?part=3D1
