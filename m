Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604553093D8
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771588; cv=none; b=Oj3uyBxIy3EiTCrKkgf8qY2kgmbgEqNJuZ4eyMPsWAsANUH3Z3xv5OHu57fIrqChLVDjRNI8D3dTnwlF5yJ22Fy0W7/hNhNnme/QJws2ue4FVNV1WUX+3vG1P24uc9QIChgRu7bgXWFH8vpVgrWu+uV/NMuucDTCKQwDO3+c/cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771588; c=relaxed/simple;
	bh=ejK8LCVbUIYFSgj16UyhSYbB9h/5prhEWXAmacg0Crc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Do8SSALdicgqd0qeXZREz0xAgGUYgpNnufdUEacblpFEkTkSmbyDZxEGcG006vSN9t2TZhSdB7p79lqeVS5ksp5/Hnc5t6ExUAuAahebT/H+A94913RBmN+Tf0fgDftBG7iCzKo80r/w01gPEXX1tDosj38FhlXrplylnIF5IcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNMht7Td; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNMht7Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94241F000E9;
	Thu, 23 Jul 2026 01:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771587;
	bh=pWTU5JdzSAUfPmcHwN5so1hBshLSEp8c9dgMtokF0vE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNMht7Td/4i8LxD4rD+2w02O1VvIafMlahRXLLC2ofZykGRguYWvC/Mj7C8H1f6y1
	 F7skjGEDeiRFOg7N2AzVbt5GKB6zBgX/UVL805MvuwWiOHDNabW2JbyDUjr4CML9Vd
	 N3RqWT+sox5WQH8bYxj55baswJJ0gON/9VtfP77jlwN4oeVTGwxfQ6eudzqDz6FCm2
	 R33xYu+MRAvjB88OpJnucISMkFIcMIB9fdIDxILpqFL52CfOh0B+WowjEH/0GFf0Xy
	 kyHHDz3Zw9B/YooiZKHPRJ4OBpDxeBxAEEJA6WyrXV9wA1CmTA6QmU4Mg4iXwmA1vV
	 xMhDHtFyMn+lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/61] drm/connector: Add drmm_connector_hdmi_init()
 with new signature
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-3-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-3-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:53:06 +0000
Message-Id: <20260723015306.C94241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing validation for `hdmi_funcs->supported_hdmi_ver` leading to=
 a 0 Hz TMDS rate limit or spurious -EINVAL on initialization.

Pre-existing issues:
- [High] Missing NULL check on `connector->state` before calling `drm_conne=
ctor_attach_max_bpc_property()`, leading to a potential NULL pointer derefe=
rence.
--

--- Patch [3]: [PATCH v9 03/61] drm/connector: Add drmm_connector_hdmi_init=
() with new signature ---
commit 68ee3a0c1e1945b6e973060559a1cafa855a35d7
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: drm/connector: Add drmm_connector_hdmi_init() with new signature

This patch introduces a new function drmm_connector_hdmi_init() with a
reduced signature by moving HDMI-specific parameters into struct
drm_connector_hdmi_funcs. It also infers the maximum TMDS character rate
from the supported HDMI version or allows an override if specified.

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c

[ ... ]

> +	/*
> +	 * The supported HDMI version can be used to determinate the maximum
> +	 * TMDS character rate allowed by the specification. Some controllers,
> +	 * however, may support a lower rate than that version would imply.
> +	 *
> +	 * A non-zero caps->max_tmds_char_rate lets drivers override this
> +	 * default with the actual controller capability. A value of zero keeps
> +	 * the limit inferred from supported_hdmi_ver.
> +	 */
> +	if (hdmi_funcs->supported_hdmi_ver >=3D HDMI_VERSION_2_0)
> +		connector->hdmi.max_tmds_char_rate =3D HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ;
> +	else if (hdmi_funcs->supported_hdmi_ver >=3D HDMI_VERSION_1_3)
> +		connector->hdmi.max_tmds_char_rate =3D HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
> +	else if (hdmi_funcs->supported_hdmi_ver >=3D HDMI_VERSION_1_0)
> +		connector->hdmi.max_tmds_char_rate =3D HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;

[Severity: High]
What happens if hdmi_funcs->supported_hdmi_ver is 0 (HDMI_VERSION_UNKNOWN) =
in
drmm_connector_hdmi_init()?

If a driver developer forgets to initialize hdmi_funcs->supported_hdmi_ver,
it defaults to 0. This if/else block falls through without setting
max_tmds_char_rate, leaving it at 0.

If a driver provides a custom supported_tmds_char_rate, initialization will
then fail with -EINVAL. Otherwise, the connector initializes with a 0 Hz
TMDS limit, which could break display mode validation by rejecting all
display modes.

> +
> +	if (hdmi_funcs->supported_tmds_char_rate) {
> +		if (hdmi_funcs->supported_tmds_char_rate > connector->hdmi.max_tmds_ch=
ar_rate) {
> +			drm_err(dev, "Enforced max_tmds_char_rate exceeds %llu spec limit\n",
> +				connector->hdmi.max_tmds_char_rate);
> +			return -EINVAL;
> +		}
> +		connector->hdmi.max_tmds_char_rate =3D hdmi_funcs->supported_tmds_char=
_rate;
> +	}

[ ... ]

> +	if (connector->funcs->atomic_create_state) {
> +		struct drm_connector_state *state;
> +
> +		state =3D connector->funcs->atomic_create_state(connector);
> +		if (IS_ERR(state))
> +			return PTR_ERR(state);
> +
> +		connector->state =3D state;
> +	} else if (connector->funcs->reset) {
> +		connector->funcs->reset(connector);
> +	}
> +
> +	drm_connector_attach_max_bpc_property(connector, 8, hdmi_funcs->max_bpc=
);

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to a NULL
pointer dereference in drm_connector_attach_max_bpc_property() if the reset
callback fails?

In drmm_connector_hdmi_init(), if the reset callback fails to allocate memo=
ry
(e.g., inside drm_atomic_helper_connector_reset()), connector->state will
remain NULL.

When this is unconditionally passed to
drm_connector_attach_max_bpc_property(), would it dereference the NULL stat=
e:

drivers/gpu/drm/drm_connector.c:drm_connector_attach_max_bpc_property() {
	...
	connector->state->max_requested_bpc =3D max;
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D3
