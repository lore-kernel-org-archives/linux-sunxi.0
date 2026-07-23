Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0E6326D55
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 02:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772187; cv=none; b=Lqu23qxAbTWKfULh99ZiJv4Bz4jWvLgWr00fA1f1hPfLjftBD5KnA43hVTvDtbqn1AHDmITiAbZsDjkzn2TWIdlr/NrZ1fhROS80DEWO33CRXscSDTCYenOZOqDO4epXY/0IAUYvIE+lYjtBRLwDAptwxwBem54+3VsE4BJKvRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772187; c=relaxed/simple;
	bh=Yzg0shqvCTI3F5iZ39/aRE81mQXEXX7By7DCKjjvgSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lveP+Kbngmu/s8U1/heQ4PCoUCK0MYH/aWNGQQsA56unZhiF2FGaC9se1l2J7nEgN6x/byEa6YMPA9tlU8EAI3T02JkMGseqTOBXvHoo0mpDh3cctKGfBvpuIpUDfBZslTSR/VCBWWo6zBNtMdHj+G0WgJKmVnKj/w2gzJMe2A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiY8AvMQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiY8AvMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855E71F000E9;
	Thu, 23 Jul 2026 02:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784772185;
	bh=kA7TMm+teipmpEZ5zXaVHPPX7z1kcuu2iCf1aojp8Eg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SiY8AvMQIJ0dXt91j8tNFeH2yWmqWCQyxUtx1rhmKQ3arAQKgL7XqwrnKUash8Rws
	 y60Pn+sEkHu3PlOpj8CotM4Jj8vmrZ3RiYxtsIm51KPXIsq3+i7Wu/LuaEU916CEUa
	 IRlJw1yfTjsra/KplPhuCY8+HgGVe8ODMxAkM6tcwA4oEyxWUSXNea4n+ZSqgj9wvu
	 1jsV7SmEmi3kxRExF5MPXJjlCRTfMDcVHLGKj/ZKsMA9t0T2i9ag344Bb0qQ9SQ7Ox
	 R6Mq2LpiIEP0ffz/F//JeQWkxfjNw0+PwvVPlk0Hqz3qU8XM4SyfZCjhChMC3/P9F7
	 iaV+jNFdo15fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 55/61] drm/tests: hdmi_state_helper: Convert to
 drmm_connector_hdmi_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-55-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-55-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:03:05 +0000
Message-Id: <20260723020305.855E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Stack-allocated `drm_connector_hdmi_funcs` struct is stored as a=
 pointer in a KUnit-managed DRM connector, creating a dangling pointer.
--

--- Patch [55]: [PATCH v9 55/61] drm/tests: hdmi_state_helper: Convert to d=
rmm_connector_hdmi_init() ---
commit d347c36729856832cc090215d18711ccc7662d1d
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/tests: hdmi_state_helper: Convert to drmm_connector_hdmi_init()

This commit updates the HDMI state helper tests to use the new
drmm_connector_hdmi_init() signature. The previously explicit arguments
for vendor, product, formats, and bpc are now wrapped inside a
drm_connector_hdmi_funcs structure instead of being passed as discrete
arguments.

> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -883,6 +874,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_=
mode_vic_1(struct kunit *te
>   */
>  static void drm_test_check_broadcast_rgb_cea_mode_yuv420(struct kunit *t=
est)
>  {
> +	struct drm_connector_hdmi_funcs hdmi_funcs =3D dummy_connector_hdmi_fun=
cs;
>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>  	enum drm_hdmi_broadcast_rgb broadcast_rgb;
>  	struct drm_modeset_acquire_ctx ctx;
> @@ -895,12 +887,11 @@ static void drm_test_check_broadcast_rgb_cea_mode_y=
uv420(struct kunit *test)
>  	int ret;
> =20
>  	broadcast_rgb =3D *(enum drm_hdmi_broadcast_rgb *)test->param_value;
> +	hdmi_funcs.supported_formats =3D BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> +				       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> =20
>  	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> -				BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> -				BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420),
> -				8,
> -				&dummy_connector_hdmi_funcs,
> +				&hdmi_funcs,
>  				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
>  	KUNIT_ASSERT_NOT_NULL(test, priv);

[Severity: Medium]
Could this lead to a use-after-scope bug during test cleanup?

A local stack variable hdmi_funcs is allocated here and its address is
passed into drm_kunit_helper_connector_hdmi_init_with_edid_funcs(). Under
the hood, drmm_connector_hdmi_init() in drivers/gpu/drm/drm_connector.c
stores this pointer directly without copying the structure:

drmm_connector_hdmi_init() {
    ...
    connector->hdmi.funcs =3D hdmi_funcs;
    ...
}

Because the connector is KUnit-managed and outlives the test function,
the hdmi.funcs pointer will become a dangling pointer as soon as the
test returns. If KUnit cleanup or any deferred teardown tasks attempt to
access this pointer later, it could result in memory corruption or KASAN
splats.

This same pattern appears to be repeated in numerous other tests introduced
by this patch, such as drm_test_check_output_bpc_crtc_mode_changed().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D55
