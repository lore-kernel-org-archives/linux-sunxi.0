Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46954229B4
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Jul 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599866; cv=none; b=c8otXgzKuEsTU9HSAtElqvT+y02zn8+k9nJDfKwFMSrCAa31ZLx9N2gdw61wzNjcU87LE/wAC28oZfhYvAynZrrIIBHvKonJjrcVXtHx1tXyA0cRsHCFH/gEuCzY0/8QezdC67rsbrTXDj39MxjWsFfg7OwFhY/yOf3iGJ+Goj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599866; c=relaxed/simple;
	bh=nEvSJxsk+O/cfDs0Oj/kkzWVX3n5Jk2E+fdPvmM0r/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PFP8w3tQIGys3qv9f6RcI4YftORa5r6/hsdvZVBNG+0FlD8WUV48nkqFucrd21CI3MZiEEU77F0ID/Ps7p8zkVDetQ5xzT1Dp7xRMIlk+vE6mT8BvLNO8dIki+2XA1mev/1WxpB8X0sK8zCyxt3oXO4CX0nwOiu9MaRWZvvQSME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ovt+O3fy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ovt+O3fy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C63C1F000E9;
	Thu,  9 Jul 2026 12:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599863;
	bh=amCnJNUnxFpqnz1M4THYao3WctE4Z7iS5x02Med6Dd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ovt+O3fy5SX/DtkROskQrz15wLKCpgIcUOh2RQN3Y8owpSt/jOnJSxCzAD/qBPXJf
	 RC53i4axiMLgln4WvxqRHI/8sLMLvLrjb2V41wCLIG3GP4Srpx9nnwyruHuowBPsSO
	 TygaRdOC2f4EdKtAaSFYtpkEJBo0watIKT6QwZDpFO4OTiyEMUH36b17ptHeSzv1vO
	 fOrJxWyhEy3gcxIZvXRScMEdl9ElUoN1vuN1NmFmxDzdqWIPwzyn6d+yPDwl2T1B3A
	 +WmCkPXYqdhg3Pat9YcUNfSbWq+DS4sKIs744gzgFa9ML1Ikg5qiu1fZK5UrOymXzv
	 JEoiGVL/jECJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 32/60] drm/sun4i: sun8i: Convert to atomic_create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-32-302d986fe5f0@kernel.org>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
 <20260709-drm-no-more-plane-reset-v1-32-302d986fe5f0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 12:24:23 +0000
Message-Id: <20260709122423.8C63C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] sun4i_crtc_init() returns NULL on plane creation failure, but the =
caller checks for errors using IS_ERR(), leading to a NULL pointer derefere=
nce.
--

--- Patch [32]: [PATCH 32/60] drm/sun4i: sun8i: Convert to atomic_create_st=
ate ---
commit f2f31601b0b32de3a56fe2a7c233cf40904cfee8
Author: Maxime Ripard <mripard@kernel.org>

drm/sun4i: sun8i: Convert to atomic_create_state

This commit converts the sun8i plane reset hooks to use
atomic_create_state instead of drm_atomic_helper_plane_reset. It was
generated using a Coccinelle semantic patch.

> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 00756ab78b4eb..bad102134726b 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential NULL pointer=20
dereference in the sun4i display driver initialization path.=20

In sun4i_crtc_init(), if plane creation fails, it returns NULL:

drivers/gpu/drm/sun4i/sun4i_crtc.c:sun4i_crtc_init() {
	planes =3D sunxi_engine_layers_init(drm, engine);
	if (IS_ERR(planes)) {
		dev_err(drm->dev, "Couldn't create the planes\n");
		return NULL;
	}
    ...
}

However, the caller in sun4i_tcon_bind() checks the return value using=20
IS_ERR():

drivers/gpu/drm/sun4i/sun4i_tcon.c:sun4i_tcon_bind() {
    ...
	tcon->crtc =3D sun4i_crtc_init(drm, engine, tcon);
	if (IS_ERR(tcon->crtc)) {
		dev_err(dev, "Couldn't create our CRTC\n");
    ...
}

Since IS_ERR(NULL) evaluates to false, the error is missed and execution
continues. This NULL pointer is later dereferenced in sun4i_rgb_init():

drivers/gpu/drm/sun4i/sun4i_rgb.c:sun4i_rgb_init() {
    ...
	/* The RGB encoder can only work with the TCON channel 0 */
	rgb->encoder.possible_crtcs =3D drm_crtc_mask(&tcon->crtc->crtc);
    ...
}

Should sun4i_crtc_init() return an ERR_PTR (like ERR_PTR(-ENOMEM)) instead
of NULL when plane creation fails, so that the caller's IS_ERR() check=20
catches it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-drm-no-mor=
e-plane-reset-v1-0-302d986fe5f0@kernel.org?part=3D32
