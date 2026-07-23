Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E011C7080D
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 02:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772063; cv=none; b=KKN80qaDscEtxqdiNw4kenmHyWE3Q36I5njAPFwtW3HRo1d5igZg9Ei5rYNUSGi4VND/Z3njkt18fEm+v8KwO0TjSwaWENzkDCXfQGWLO9Q89Bw/uWMwx+cpij6t7kF8ehfTL2W03DcZVoUtO9m+gm7Qo0hMFfYT9ZcKAUgt7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772063; c=relaxed/simple;
	bh=Clm2ETaOoBgLF5TPzgDy5iuTdSO/nNFs28iUV8JIOGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K17tuPaH7AGXDuzCLecN8vuItPRyjvtMnVReVAM2UOUSx0M3XtN1vYDwpjHgdbCpzOZ7iXGlVOFZSuWfUDsLhcxxw0MQq2Nu5+SUXy0rXYKN4Vi10Kii0SsKb2jnusYG/91LP9DiOygENSXb6BqBwAVWaDbth8Xg7AUXhRu89+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jo421Dv4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jo421Dv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9201F000E9;
	Thu, 23 Jul 2026 02:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784772062;
	bh=Jsj025+j5ajWSUEXfF8QGxVeM6i7mgTc2Fko/KuJWz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jo421Dv44BQ8JVDMO4QSVSsMGtVcLeVMo4yqWY4LCEtY2FaJirX4j1cuU9tkBlSQA
	 XW2PJvIxJAEcHJtbggLR/xT1B25QuYP974FWxbZLxda3p8vpccyjZSQGmuszRLbrlh
	 Fb6LVdT/Ua8w+FhPzM2+M+4f2Q+zyEJDQ7QHjqtiSACm5gQ8TLcL65PPGWapeHnBDl
	 R8M3SBDh14cre1d7pVYKH4ms9caNY9dih6SxemcZ37RBg1doWIvMwLV1cvXCyMWbA7
	 IBJUT6p+vuQVXYPyAAAc+z5vcgM3CMbPQCgKlIhiepPtChEp0Kbkfo07SJTRos++X6
	 kOZOxVLfLk2qA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 43/61] drm/bridge: ite-it6263: Advertise HDMI 1.3
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-43-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-43-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:01:02 +0000
Message-Id: <20260723020102.9A9201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro `MAX_HDMI_TMDS_CHAR_RATE_HZ` and its descriptive comment =
are now unused and should be removed.
--

--- Patch [43]: [PATCH v9 43/61] drm/bridge: ite-it6263: Advertise HDMI 1.3=
 capabilities ---
commit 30b48bebf03b99c913be112fadde6e8cf5c4b197
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: ite-it6263: Advertise HDMI 1.3 capabilities

This commit advertises HDMI 1.3 support for the IT6263 bridge and drops the
redundant it6263_hdmi_tmds_char_rate_valid hook. The TMDS character rate
limit is now enforced via max_tmds_char_rate during connector atomic check.

> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge=
/ite-it6263.c
> index f166bb38998c0..73caf28c6ac77 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -738,20 +738,6 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_b=
ridge *bridge,
>  	return input_fmts;
>  }
> =20
> -static enum drm_mode_status
> -it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 unsigned long long tmds_rate)
> -{
> -	if (mode->clock > MAX_PIXEL_CLOCK_KHZ)
> -		return MODE_CLOCK_HIGH;
> -
> -	if (tmds_rate > MAX_HDMI_TMDS_CHAR_RATE_HZ)

[Severity: Low]
Since this function is being removed, should the definition of
MAX_HDMI_TMDS_CHAR_RATE_HZ in drivers/gpu/drm/bridge/ite-it6263.c also be
removed? It appears this patch removes the only user, leaving the macro and
its associated comment as dead code.

> -		return MODE_CLOCK_HIGH;
> -
> -	return MODE_OK;
> -}
> -

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D43
