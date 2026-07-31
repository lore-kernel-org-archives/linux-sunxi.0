Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DB2489895
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 19:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785525602; cv=none; b=WeKl81Ow95BjQwNHlxpulbIj1TEfCkVPaN2yogSKY+BS0cioeDWsRZ9UlaybPTNzdmgzU7VjVVoXzL+9FcIdONhYFS5UzItQjhlmpiZXIo1tSFvVbWx/SMvkPC41CdrhaXWKwubH77onBwXuiI340YhlMKbKcuIgYC4lPA7yVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785525602; c=relaxed/simple;
	bh=5oqvLF5oHI/79wszhwM9l3G98tSM5zllcv76CoGYJv4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I6zFCY9VAoyQyFizSmamdMpa7YoLBYYw4OJv4qONATTxJ4lZGiswagxmuQikKqgersAhK8vbBNIveOMW1kN2qdfiLwrzevbO6Sm0/+v0TRhsSpYGYjJGQs/MrOGMN3o3l7asigh2iBlxzqXAaRgdKE9yl5L/Xa1UuF4IiE+MSu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic0oH/3l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic0oH/3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54001F00AC4;
	Fri, 31 Jul 2026 19:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785525600;
	bh=NIvYFcOnTHs5LUj/bjZowA8yIeUKukHYedpMECoTgwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ic0oH/3lDaxJqKkCudzS0rpasO3oMdpamyl1WgGQGQiBLYOcbBvD+j+0B2MZozx2h
	 +mbSN68jB1E19p66PfLbUieNNs4l1TRUCIA1e0EzLYYPCAakyg6x51mqG7f1OI67yX
	 mFJpRVvjk7tmNSC2wv2Zs8cIsg8Z5xzVFLCRj55bNNY8s5O1wgum1N3l+gIWp8SSU7
	 /fpbOQbT7HwP7+JevbQbzUthL5FMZ7ShTiMFhI/HHY/2Q2VTU/4QT0HntL8DXqF5QM
	 oLi9nmWcoZwuudo3NKaKkrFClueUyWMnwe5/tTGCyyCSE6W3cm2uQ82/U3ytlhnwmw
	 flz6BnGRXx5Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 23/69] drm/display: hdmi-state-helper: Set HDMI
 scrambling requirement
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-23-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-23-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 19:20:00 +0000
Message-Id: <20260731192000.A54001F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The HDMI atomic check phase unconditionally sets `scrambler_needed=
` for TMDS character rates > 340 MHz without verifying if the source and si=
nk actually support scrambling, which can cause an ungraceful failure durin=
g the atomic commit phase.
--

--- Patch [23]: [PATCH v10 23/69] drm/display: hdmi-state-helper: Set HDMI =
scrambling requirement ---
commit e6622cfc80adce83ef4209e099003b9cb90bec11
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/display: hdmi-state-helper: Set HDMI scrambling requirement

This commit centralizes the HDMI scrambling requirement check in the HDMI s=
tate
helper. It sets drm_connector_hdmi_state.scrambler_needed to true when the
computed TMDS character rate exceeds the HDMI 1.3 maximum limit.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 3377ea9361209..9544eb8659aa8 100644
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
> +

[Severity: High]
Does this code allow an atomic_check to succeed even when the source or sink
does not actually support scrambling?

In the KMS atomic framework, hardware capabilities must be validated during=
 the
atomic_check phase to prevent failures during atomic_commit. Here, we set
scrambler_needed to true for clocks > 340 MHz, but we don't seem to verify =
if
the sink or the source hardware actually supports scrambling.

If a malformed EDID advertises a high TMDS clock but lacks SCDC scrambling
support, or if a driver supports high clocks but fails to implement the
scrambler hooks, the atomic check phase will pass. Later, when
drm_connector_hdmi_enable_scrambling() is called during the commit phase, it
will evaluate scrambler_needed and return -EINVAL.

Failing during the atomic commit phase violates KMS rules and results in a
broken display pipeline. Should hdmi_compute_clock() or hdmi_clock_valid()
also verify drm_scdc_sink_supports_scrambling() and
drm_connector_hdmi_scrambler_supported() before succeeding?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D23
