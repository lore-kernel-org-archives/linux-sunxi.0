Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A59282F1D
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771925; cv=none; b=p4MVN6tWAlNHyEU5Eh/A3uinQ+olS1FgV35W4XlkiTOrjIQHXa9QUGLMh9ThNgkhumrIAHEHxspOUTnwFL3rBF2z+a+xYZ6ZpZJ1+ZdOuOCSe2KtW5vy9BXevbUINxDfpfbNkefhdItrvne2lKECMUi2jH8oBwhnYRs3ZWwF9d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771925; c=relaxed/simple;
	bh=gX3nuZG5ZvfmcJhwpjuVuZOBeu0R7FTcYG93IEtoJrI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BmLlfC7wMx7fgSQh7tIZ9jf2Pw2/3lMgeSxUuN0tI3o4h7g23tDmVsGSDJdPmaD1Tbi5ARsy4Gbbt4n83gzGLMXqSztMuHxb7uG63d2WIeRus6ldBf1yqmwK9KsuNxSZILMtC0/GisHqMhVJIjixL7qj/XZVf5PmdyBNKnU3nd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFuvKzxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFuvKzxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78D51F000E9;
	Thu, 23 Jul 2026 01:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771924;
	bh=GgXMg56GjrYY3qH4J3xAvN5VDJVQK7m1XDTjfdQPhUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UFuvKzxqskgWR4+6O8jmGOi5NKkrbgZ34nUZ80RDZDrH/8LK7gSb6U5S8dmasj6B/
	 DnVqvxZ6wfcDs8FlA7AE32mb1mm8P1ufIrTg0winRG4V8PqrtpYV3/emGRyRglxAbh
	 tEQU0TCKq7OsoAmgLK3ncrwFRjsUcAi09yzDVyTWiIZqWcfYrzs2pGUGp9BIbNuxYG
	 U8zNsSQEExqwMJUYXHXl9rQxFz++MWGaw3wd2gUemFvsin8f0DehEaUD3HhRzeyA7W
	 Tq3yklFEA4n1UcdhAQSAbXEGPAx839xsKv+qktGgqoobT9Y1cXVQTvVBJT+F81WK0c
	 ppSe/tfdZszVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 53/61] drm/tests: connector: Add HDMI
 max_tmds_char_rate init coverage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-53-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-53-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:58:43 +0000
Message-Id: <20260723015843.C78D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Flawed KUnit test logic causes TMDS character rate limit rejecti=
on tests to pass for the wrong reason.
- [Medium] Dangling pointer created by storing the address of a stack-alloc=
ated structure into a persistent device-managed object.
--

--- Patch [53]: [PATCH v9 53/61] drm/tests: connector: Add HDMI max_tmds_ch=
ar_rate init coverage ---
commit 7359a144a698a961aa27ac0fd6a0ec01ec7928f5
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/tests: connector: Add HDMI max_tmds_char_rate init coverage

This commit adds KUnit tests for the new drmm_connector_hdmi_init()
extension to infer and validate the connector's max_tmds_char_rate based
on the advertised HDMI specification version.

> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm=
/tests/drm_connector_test.c
> index 74342880b3015..f14cd741b05e4 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c

[ ... ]

> @@ -1236,6 +1264,154 @@ KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_in=
valid,
> +static void drm_test_connector_hdmi_init_max_tmds_rate_inferred(struct k=
unit *test)
> +{
> +	struct drm_connector_init_priv *priv =3D test->priv;
> +	const struct drm_connector_hdmi_init_max_tmds_rate_inferred_case *param=
s =3D
> +		test->param_value;
> +	struct drm_connector_hdmi_funcs hdmi_funcs;
> +	int ret;
> +
> +	hdmi_funcs =3D params->ver < HDMI_VERSION_2_0 ?
> +			dummy_hdmi_funcs : dummy_hdmi_funcs_scrambler;
> +	hdmi_funcs.supported_hdmi_ver =3D params->ver;
> +
> +	ret =3D drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +				       &dummy_funcs,
> +				       &hdmi_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc);

[Severity: Medium]
Does this create a dangling pointer?

drmm_connector_hdmi_init() stores the provided hdmi_funcs pointer in
connector->hdmi.funcs.

Since hdmi_funcs is allocated on the stack here (and in other new tests),
connector->hdmi.funcs becomes a dangling pointer when the test function
returns. Even if deferred device-managed cleanup doesn't dereference it
today, is it safe to leave this pointing to destroyed stack frames?

[ ... ]

> +/*
> + * Test that the registration of an HDMI connector providing a max TMDS
> + * character rate that exceeds the limit inferred from the advertised HD=
MI
> + * specification version fails.
> + */
> +static void drm_test_connector_hdmi_init_max_tmds_rate_exceeds(struct ku=
nit *test)
> +{
> +	struct drm_connector_init_priv *priv =3D test->priv;
> +	struct drm_connector_hdmi_funcs hdmi_funcs =3D dummy_hdmi_funcs_scrambl=
er;
> +	int ret;
> +
> +	hdmi_funcs.supported_hdmi_ver =3D HDMI_VERSION_1_4;
> +	hdmi_funcs.supported_tmds_char_rate =3D HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ;
> +
> +	ret =3D drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +				       &dummy_funcs,
> +				       &hdmi_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc);
> +	KUNIT_EXPECT_LT(test, ret, 0);
> +}

[Severity: Medium]
Are these tests passing for the wrong reason?

Because dummy_hdmi_funcs_scrambler provides scrambler callbacks, setting
hdmi_funcs.supported_hdmi_ver =3D HDMI_VERSION_1_4 causes
drmm_connector_hdmi_init() to return -EINVAL early:

	if (hdmi_funcs->scrambler_enable || hdmi_funcs->scrambler_disable) {
		drm_err(dev, "Scrambler callbacks unexpected for HDMI 1.x\n");
		return -EINVAL;
	}

This bypasses the TMDS rate logic completely, meaning the expectation
KUNIT_EXPECT_LT(test, ret, 0) succeeds without actually testing the intended
rate limit logic.

[ ... ]

> +/*
> + * Test that the registration of an HDMI connector providing a non-zero =
max
> + * TMDS character rate without an HDMI specification version fails, as t=
he
> + * version-inferred limit defaults to zero and any positive override wou=
ld
> + * exceed it.
> + */
> +static void drm_test_connector_hdmi_init_max_tmds_rate_no_version(struct=
 kunit *test)
> +{
> +	struct drm_connector_init_priv *priv =3D test->priv;
> +	struct drm_connector_hdmi_funcs hdmi_funcs =3D dummy_hdmi_funcs_scrambl=
er;
> +	int ret;
> +
> +	hdmi_funcs.supported_hdmi_ver =3D HDMI_VERSION_UNKNOWN;
> +	hdmi_funcs.supported_tmds_char_rate =3D HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;
> +
> +	ret =3D drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +				       &dummy_funcs,
> +				       &hdmi_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc);
> +	KUNIT_EXPECT_LT(test, ret, 0);
> +}

[Severity: Medium]
Does this test have the exact same logic flaw as above?=20

It uses dummy_hdmi_funcs_scrambler with HDMI_VERSION_UNKNOWN, causing early
rejection due to the scrambler checks rather than testing the TMDS rate
validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D53
