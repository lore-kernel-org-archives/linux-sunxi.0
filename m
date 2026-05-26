Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB6126C3BD
	for <linux-sunxi@lists.linux.dev>; Tue, 26 May 2026 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816892; cv=none; b=sLGvpC53Uhno6HY7TNInLIkwMK7b+mNRa7PIrJSd9RQ22b2tBf/4bjvvDPC8rY7DQuJkaqD/oKPH8TyEeWU0ipH+YCzdvlTnjgMa3h6kf6DukNQ1Me3fQyIkEm8UTnM4HenXqqnWBICmBL10CMzS+JgYzMD/HnisryQzNtWIoDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816892; c=relaxed/simple;
	bh=80EgPMTPghS0yY5R63kzZ5vriV/8avbdnWa3ft+a5LM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IXNnSe3uFkQ2cN6yqRRPvg0MaLmsX5ACVYFGKV2JGRM3Sy8TDDMopAhXHjRFErObr8siBdseBVzaUwSsADyfc/pDegxlH21kDGroJv0mRHyBLF4LfWHVAcTDfSSXV5Rbx1CdMzhf8N/YWN85LZsIf0QgQ+l3tK07vA4tDFjfkAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeGq/NS8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeGq/NS8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9290B1F000E9;
	Tue, 26 May 2026 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779816890;
	bh=FtHgmQRoVOi3Ww1I2aQ0Ri1v2qfCbVUHThgg8tuWPak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oeGq/NS8mmEUePOkjw3PGlHUUJ5b46jmLRXOd5hizZlqAL3pXSiNiBm76iTfZlVDS
	 gabRJuwR7uUPLMHu2Pl1eL/lH2/bKAqus+QM6HwUuCY2crsp+1g7disNGXXJ8fayOJ
	 3qwddTssBN7o0CDuOdeFcZAbTL1V2PWn3TRVQlzSBQ3Za8oU2973ITQINNL0uciiGc
	 1rkVx5p9OTSPlUoEoK7UpSEXPobe8gqh7GHeImwuh3zRRk5FlkjBG6dKxTvc5PUB/k
	 hm5o5vAxlPsasIhX7Q+m/fSZnzYIH3vHuiA0V4rBSSZ3QyvVjJxDN6aFxPYDPdLXOM
	 SuN3GJzd5MeQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/19] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260526-drm-mode-config-init-v6-14-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-14-852346394200@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 17:34:50 +0000
Message-Id: <20260526173450.9290B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Functions `__drm_atomic_helper_connector_hdmi_state_init` and `drm=
_atomic_helper_connector_tv_margins_reset` blindly dereference the connecto=
r state without checking for NULL.
--

commit 81f7911289ba8e39932c0a38e3a9d45baf115efd
Author: Maxime Ripard <mripard@kernel.org>

drm/hdmi: Rename __drm_atomic_helper_connector_hdmi_reset()

This commit renames __drm_atomic_helper_connector_hdmi_reset() to
__drm_atomic_helper_connector_hdmi_state_init() to consolidate DRM objects
state allocation around the atomic_create_state callback.

> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -508,7 +508,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm=
_connector *connector,
>  static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>  {
>  	drm_atomic_helper_connector_reset(connector);
> -	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
> +	__drm_atomic_helper_connector_hdmi_state_init(connector, connector->sta=
te);
>  	drm_atomic_helper_connector_tv_margins_reset(connector);
>  }

[Severity: High]
This is a pre-existing issue, but could this lead to a NULL pointer
dereference under memory pressure?

If drm_atomic_helper_connector_reset() fails its allocation,
connector->state is left as NULL:

drm_atomic_state_helper.c:drm_atomic_helper_connector_reset() {
        struct drm_connector_state *conn_state =3D kzalloc_obj(*conn_state);
        ...
        kfree(connector->state);
        __drm_atomic_helper_connector_reset(connector, conn_state);
} // connector->state is now NULL if kzalloc_obj failed

The vc4_hdmi_connector_reset() function then immediately passes this NULL
connector->state to __drm_atomic_helper_connector_hdmi_state_init(), and
then calls drm_atomic_helper_connector_tv_margins_reset(connector).

Both helpers unconditionally dereference the state pointer.

Should there be a NULL check added here or inside the helper functions
to prevent a crash when memory is low?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-drm-mode-c=
onfig-init-v6-0-852346394200@kernel.org?part=3D14
