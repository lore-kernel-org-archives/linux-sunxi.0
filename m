Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB17080D
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 02:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772058; cv=none; b=pY+ZLKRwJdFHR3XtLCPWpv67tkx0LpxvroSHthRL7TAg0uTWp6uszqB0WL/8y0lJf0h8Np7zFSHCyGV0EjjcBAZ77YonifJb2WgESCVF53P8Jq25oo8ZmTka8enaAW3U+EDs/mGoSsv+bVd1mudjJvVL0X0s/oturbxhUphLU84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772058; c=relaxed/simple;
	bh=ppTD4BVBvzzjpW+IsjsAYNCQjI9f23EL/HOYJz1amPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bOXrG0lknkQJ3+aBtotc3mTggP8Td/QLDbkb+fBYj/Md6o38P4mARPvs+23kwSjqqQ0Dg1HDnhHtb1c4NknI78MiEkg6OeEbxNPeQY8DvEe7LhvRjS8QazvG6CuXmYLi1umS8D9LnR+W4dGUgYg8ttqHh1JuO2q9FEId4TxJcN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/oxGUVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/oxGUVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65081F000E9;
	Thu, 23 Jul 2026 02:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784772057;
	bh=jozKjk2J6NEYx/vndCj6GKzJOJ+ayBkah+8JkSadd9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n/oxGUViAFrCsmsNWcSsi1hQ2wHYKkpApG77a6loDfDTT54xp8r4FZFzclFbAOl87
	 u+kd3hmy1OeD7BpUfIIHus7+lxlSVZ026B/3n1Gc7Sp3Q07X6TtLsm9XhOTX6klalr
	 Ec+d8+5kVFn3zNXEHdrY7/OhY1qjmWWfpMrq8TPe7B1Hfk/GxjMKuds4Qd0g7Sx34h
	 G7oKGbseXiSFgGBRLyULLQACsCkhy9FspORjMY0N2ytGwMVYOsw2JCL2U2JgSkdmK5
	 RxWFu5kgNE6ukzwm3Mxi43V3SsuwssebcTSHuoXKrk5UVXr5pQ1JAf93JjHNeRbNRD
	 2LDuKkP2TVmog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 54/61] drm/tests: connector: Add HDMI source-side
 scrambler coverage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-54-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-54-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:00:56 +0000
Message-Id: <20260723020056.D65081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Masked test failures in TMDS character rate validation tests.
--

--- Patch [54]: [PATCH v9 54/61] drm/tests: connector: Add HDMI source-side=
 scrambler coverage ---
commit 51e9e33a81edd8b52502410a5e171c4a8d0bf3c5
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/tests: connector: Add HDMI source-side scrambler coverage

This commit adds KUnit tests to validate the HDMI source-side scrambler che=
cking
in drmm_connector_hdmi_init(). It verifies that scrambler callbacks are
correctly required for HDMI 2.0 and later, and rejected if provided for ear=
lier
HDMI versions.

> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm=
/tests/drm_connector_test.c
> index f14cd741b05e4..3d050ac5e5f6d 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -1412,6 +1412,89 @@ static void drm_test_connector_hdmi_init_max_tmds_=
rate_no_version(struct kunit *
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> =20

[Severity: Medium]
Will the scrambler validation tested by this patch mask the TMDS rate limit
tests located just above this hunk?

In drm_test_connector_hdmi_init_max_tmds_rate_exceeds() and
drm_test_connector_hdmi_init_max_tmds_rate_no_version(), the tests use
dummy_hdmi_funcs_scrambler but set supported_hdmi_ver to HDMI_VERSION_1_4 or
HDMI_VERSION_UNKNOWN:

	struct drm_connector_hdmi_funcs hdmi_funcs =3D dummy_hdmi_funcs_scrambler;
	...
	hdmi_funcs.supported_hdmi_ver =3D HDMI_VERSION_1_4;

Since drmm_connector_hdmi_init() rejects scrambler callbacks for HDMI
versions < 2.0 by returning -EINVAL early, will these TMDS rate tests now f=
ail
during the scrambler check rather than actually validating the TMDS charact=
er
rate logic?

Should they be updated to use a dummy struct without scrambler callbacks to
ensure the max_tmds_char_rate limit is what actually causes the test to pas=
s?

> +/*
> + * Test that the registration of an HDMI connector advertising source-si=
de
> + * scrambling support succeeds when the .scrambler_{enable,disable} call=
backs
> + * are provided.
> + */

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D54
