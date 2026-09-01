Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708353B6BF4
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291622; cv=none; b=B+UlCq/aG+UwhOmalasxIBOXZ5wLeaHD030g50JfK3NzTUXGmfYVrLeJqYCFtckvTADW8l9zdflfs2vywWTYxwnD5EwnbcWBLXWM0th7VCtbODCAzh+fMVsUdUcb9XeVnzbGxusernOyQcUKQIVdW6gZYrWU44jDkSn3jEPNaAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291622; c=relaxed/simple;
	bh=GDUXyLgXkadgBe2zyV9F2U2fHWOX/nd5mNg/PopBiJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=THUylYx7OsLSFsvIdmewA9QYP6Y5gwu/bFDPbgXTrawlifcw5U2rz8nFAGEyfnoeQ9cX937chYetsbmdJpgmToMNVS0QItqtJYaeyMbeDRIdZIcA2edxHp79BOYDEO78deku4DOP8/UkqIOwCfJyqOtzGyLOD1p6Mr/gh0Ij4CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMUC8fFr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMUC8fFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67CF1F00A3D;
	Tue,  1 Sep 2026 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788291621;
	bh=pKO/S7vhDWGbW+d7wsYJ1EgRoQypdpBvCGPu8UEUpag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fMUC8fFryW+xepn8bjNMWwUHOaSEc00ZS72GK/z9O6nNZvlgp+qrN7ZMmMHsRU22u
	 V9e1IOUI/53kVmSlii8C4R77I1dxp2o280GnKl3z1c/fjM5lgQgKy/sfML7wt3U2Mm
	 0qHGtX41XLvUh3yH77+V5DhinA+urDSKeB3/rTNIg2cfP4NYahYMlCa17SQFu+nXBR
	 CRVzQi/uXpjZw071/vt17EgEbKtwOGo5UhTBV4hpd4lZHWdHTa/RTN0A0JT7wUYzng
	 vpsM7WngdthH86zU5dYhaq5P5yMu/XPmVhotjzgdfw5X6m810LAKf0fqpnai+zwUGo
	 L2ZsdYhlrrB4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 23/74] drm/display: hdmi-state-helper: Sync SCDC
 state on hotplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-23-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-23-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:40:19 +0000
Message-Id: <20260901194020.E67CF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing error reporting for drm_edid_connector_update() on the c=
onnect path, contradicting the commit message.
- [Low] The SCDC sync call on the disconnect path is a guaranteed no-op, le=
aving the scrambler state unhandled and introducing dead error-handling cod=
e.
--

commit 41a712cbfad2ca468ecdd91cc77914f264d5dce6
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/display: hdmi-state-helper: Sync SCDC state on hotplug

This commit attempts to synchronize SCDC status on hotplug events by hooking
drm_connector_hdmi_sync_scdc() into the connect and disconnect paths. It al=
so
aims to report errors from drm_edid_connector_update() for consistency.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 8045b1d17d6ec..1e269b203b987 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -1362,12 +1362,29 @@ drm_atomic_helper_connector_hdmi_update(struct dr=
m_connector *connector,
>  					enum drm_connector_status status)
>  {
>  	const struct drm_edid *drm_edid;
> +	int ret;
> =20
>  	if (status =3D=3D connector_status_disconnected) {
> -		// TODO: also handle scramber, HDMI sink disconnected.
> +		/*
> +		 * .detect_ctx() can only ever return a drm_connector_status or
> +		 * -EDEADLK. Handle deadlocks, and report any !EDEADLK error.
> +		 */
> +		ret =3D drm_connector_hdmi_sync_scdc(connector, false, ctx);
> +		if (ret) {
> +			if (ret =3D=3D -EDEADLK)
> +				return ret;
> +
> +			drm_warn(connector->dev, "Ignored SCDC sync error: %d\n", ret);
> +		}

[Severity: Low]
Does this actually handle the scrambler state on disconnect?

If we look at drm_connector_hdmi_sync_scdc(), passing false for the plugged
parameter causes it to return 0 immediately:

int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plug=
ged,
				 struct drm_modeset_acquire_ctx *ctx)
{
	...
	if (!connector || !plugged || !ctx)
		return 0;

Since ret will always be 0, the error handling block here is dead code, and=
 the
scrambler state remains unhandled on the disconnect path.

> +
>  		drm_connector_hdmi_audio_plugged_notify(connector, false);
> -		drm_edid_connector_update(connector, NULL);
> +
> +		ret =3D drm_edid_connector_update(connector, NULL);
> +		if (ret)
> +			drm_warn(connector->dev, "Ignored EDID update error: %d\n", ret);
> +
>  		drm_connector_cec_phys_addr_invalidate(connector);
> +
>  		return 0;
>  	}
> =20

[ ... ]

> @@ -1381,7 +1398,18 @@ drm_atomic_helper_connector_hdmi_update(struct drm=
_connector *connector,
>  	drm_edid_free(drm_edid);

[Severity: Medium]
The commit message states that errors from drm_edid_connector_update() will=
 be
reported for consistency.

However, in drm_atomic_helper_connector_hdmi_update(), the return value of =
the
drm_edid_connector_update() call on the connect path (which happens just be=
fore
the drm_edid_free() call in the snippet above) is still being ignored:

	drm_edid_connector_update(connector, drm_edid);
	drm_edid_free(drm_edid);

Should we also add error reporting to this path to match the stated intent?

> =20
>  	if (status =3D=3D connector_status_connected) {
> -		// TODO: also handle scramber, HDMI sink is now connected.
> +		/*
> +		 * .detect_ctx() can only ever return a drm_connector_status or
> +		 * -EDEADLK. Handle deadlocks, and report any !EDEADLK error.
> +		 */
> +		ret =3D drm_connector_hdmi_sync_scdc(connector, true, ctx);
> +		if (ret) {
> +			if (ret =3D=3D -EDEADLK)
> +				return ret;
> +
> +			drm_warn(connector->dev, "Ignored SCDC sync error: %d\n", ret);
> +		}
> +
>  		drm_connector_hdmi_audio_plugged_notify(connector, true);
>  		drm_connector_cec_phys_addr_set(connector);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D23
