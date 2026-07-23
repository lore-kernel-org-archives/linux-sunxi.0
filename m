Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747FB8634C
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771441; cv=none; b=mJP+M1BZwzy8IvGuauivLDfdLTP3MFNlr8vmG1VIyiSV0+GpvwSDjbCeoPDEiUkUGw3M7e1Ex9okaEu25BrIrKreCgRhb8gR9c83DJasYPpjIuXy1De97LFpHf/Iq7ssMsB3REYlnhP4L0SNWOSK4FX3m2v4Qs08zgvVWU68yC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771441; c=relaxed/simple;
	bh=6TidnTJBp0iuD8G8rj7pU3clCH1OM9MEvvyPSEmha3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OGlEmTbalF8UXBEIFX+5P4/SI6uhEzplOMmaA3aElTYsdNr7YMBB6VYf8pP+nn+KrVL05jMJq82S9/pR7cKgXDTqWOoY0e8o6RccKUPpwkb2XgGDi4B+E9UwBTP/3yla9zXXbEoglHjPIllBM5lgCoJ1kG62rOOqqa/Y5QiQ1Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjchJLWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjchJLWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B341F000E9;
	Thu, 23 Jul 2026 01:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771440;
	bh=1uqZ2fxy2CSbWgYVrfB6flCO9ZokFBE1VaME2LGwv+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjchJLWljXFo/LL2PHurDMTCZwiznsCAAa09IjL5s0Ngm5M9zE+un2WEi1kkaOxhR
	 aBXswkor0T6DafpAYdsTMRiHlyHwEji7DHt/6p55FGO34ZoY82kuu03goPZPhdrP2B
	 +clqYo5dEqG91Md2rtXsyZyb8mJ4Jku6Mezcn8IYftS0aFc7+H69WbClijcrtMOF7p
	 GCfkPX48+/eU7ImLho5Z0EGD5LLjcqxqdsCOS9fsWBCY0xcClBvuWeGrgQICiBhiFU
	 WUK7r/rIxfG4elJhGoxf5x1BzZWuM8sj5rzK6VhJEj7QrspxCNkGdst6XYPlJe3ocG
	 w1GR0bF4QPjKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 18/61] drm/display: hdmi-state-helper: Set HDMI
 scrambling requirement
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-18-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-18-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:50:39 +0000
Message-Id: <20260723015039.E1B341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The HDMI atomic check framework fails to validate sink scrambling =
capabilities, allowing unsupported high-clock modes to pass atomic check an=
d fail later during the commit phase.
--

--- Patch [18]: [PATCH v9 18/61] drm/display: hdmi-state-helper: Set HDMI s=
crambling requirement ---
commit 7fcaa4103f10e7da80a91d4e2de65346b900fcb1
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/display: hdmi-state-helper: Set HDMI scrambling requirement
   =20
This patch sets drm_connector_hdmi_state.scrambler_needed when the computed
TMDS character rate exceeds the HDMI 1.3 maximum TMDS character rate.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index ad59318a3e85f..d112c15555178 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -594,6 +594,9 @@ hdmi_compute_clock(const struct drm_connector *connec=
tor,
> =20
>  	conn_state->hdmi.tmds_char_rate =3D clock;
> =20
> +	/* TODO: also check drm_display_info.hdmi.scdc.scrambling.low_rates */
> +	conn_state->hdmi.scrambler_needed =3D (clock > HDMI_1_3_TMDS_CHAR_RATE_=
MAX_HZ);

[Severity: High]
Could this introduce a regression where unsupported high-clock modes pass t=
he
atomic check phase, only to fail later during atomic_commit?

If userspace requests a mode with a TMDS clock > 340 MHz on a legacy sink
that does not support scrambling, the hdmi_clock_valid() check bypasses the
maximum clock limit if info->max_tmds_clock =3D=3D 0.

By setting scrambler_needed to true here without verifying if the sink
supports scrambling (e.g., via drm_scdc_sink_supports_scrambling()), the
validation successfully passes drm_atomic_helper_connector_hdmi_check().

However, later during atomic_commit, the attempt to enable scrambling fails:

drivers/gpu/drm/display/drm_hdmi_helper.c:drm_connector_hdmi_enable_scrambl=
ing() {
	if (!drm_scdc_sink_supports_scrambling(connector)) {
		drm_dbg_kms(dev, "Sink doesn't support scrambling.\n");
		return -EINVAL;
	}
    ...
}

Failing during the non-blocking KMS atomic_commit phase violates the atomic=
 KMS
model and can leave the display hardware misconfigured. Should we validate =
sink
scrambling capabilities here in the atomic check phase instead?

> +
>  	return 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D18
