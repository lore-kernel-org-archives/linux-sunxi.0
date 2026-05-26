Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D28B2DE709
	for <linux-sunxi@lists.linux.dev>; Tue, 26 May 2026 17:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816395; cv=none; b=iBVKvmYa8E4weEaaevBBsoBRqalqqCE/lRu93ySbL5G+tkAcgkRiiCqNpe0Z6IZ+eJ0gFuXYAytIHf1gm0XqU42VRs8aTrRArt9TNyWisvftq39LNQlkqWGzLIilfhetiio+k3msiDLnsqtlO9LsjNyMjNvR3egiq7p0cY/UdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816395; c=relaxed/simple;
	bh=VWkZj6IFlZWrNMcwOyMg0nGbVRU2Y4Kb77MDVTqxLBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lHQJZU9sclVcVtqdDgwIk8sLNvTd8KW1LoooTZ/0p1PipvHBqy8cZA/NN+M8a7XbRk15ErIYv/hanojTplIVgbvrr0Jjsdj7ybHM7dyTU7HjEKVRCIbB89mjtxadEt4lelcr4vxcRGQEbA9Nu/+CcP5Q4Iacon4CZ3wosG8JMl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TridF/pb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TridF/pb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57AD1F000E9;
	Tue, 26 May 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779816393;
	bh=dacpQOxAHSRxvt9Kl03HLk2VjWv2ep63Pn24tzKSXyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TridF/pbhnAnCPyhWcl8K390oPrxxig5ATs534G2c2QE1IuAbi4lG8Si9kLkcVEkT
	 yMRocK8im/w0YU/VTqm2AEFLahyDAcCoUaANUwt1ksBYFac0TOGN5bR7ASwuwkRYwq
	 ZmV8cxjLwforElzjPjU/3o0v7rYkSrJnDCiNzGjVOECmxy1yPWmcV2iLchsJqRgbyH
	 URWwidqm/oyC2vgmHF5XKFc7nH8Q5CvBwrZ0Q4sKH6AhKUATFui0mTK6ks8m5u7mte
	 bQpKAnOhOj/GAFBGN5mDot69POfg2Zjq/rZDH5iiM/hg6llhu039hJRtdZhitOTtmO
	 7fBNNvruKboyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/19] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260526-drm-mode-config-init-v6-7-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-7-852346394200@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 17:26:33 +0000
Message-Id: <20260526172633.C57AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit introduces `drm_atomic_helper_colorop_create_state` b=
ut fails to add the `atomic_create_state` hook to `struct drm_colorop_funcs=
` or wire it into the core logic.
- [Low] The newly added helper function `drm_atomic_helper_colorop_create_s=
tate` lacks an EXPORT_SYMBOL declaration.
--

commit 523a46597f73af1e23a2580a6ff384bfca9c08b5
Author: Maxime Ripard <mripard@kernel.org>

drm/colorop: Create drm_atomic_helper_colorop_create_state()

This commit introduces a new helper function,
drm_atomic_helper_colorop_create_state(), to allocate and initialize a
pristine colorop atomic state without side effects. It is intended to separ=
ate
initialization from hardware reset operations.

> Continue the transition to the new pattern with drm_colorop.

[Severity: Medium]
Does this commit miss adding the atomic_create_state function pointer to
struct drm_colorop_funcs and wiring it into the core logic?

Unlike the equivalent patches for planes and CRTCs, the hook is not added,
and functions like drm_colorop_reset() continue to hardcode state allocatio=
ns
via kzalloc. This leaves the new helper as unimplemented dead code, meaning
the transition described in the commit message is incomplete.

> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 4c4d0a953e357..c0eecde8c1762 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -523,6 +523,29 @@ static void __drm_colorop_state_init(struct drm_colo=
rop_state *colorop_state,

[ ... ]

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

[Severity: Low]
Since this is a core DRM helper intended for drivers to plug into their
function tables, should there be an EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL()
declaration here?

Without it, any driver built as a loadable module that attempts to use this
new helper will fail to build due to unresolved symbol linker errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-drm-mode-c=
onfig-init-v6-0-852346394200@kernel.org?part=3D7
