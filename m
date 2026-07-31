Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1910147A0B7
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524580; cv=none; b=aIdmZK0PlLJ9OsNfOy+7DE0jUBiB8Tbq63e/xVh2vcoLKy1T+dceGwutxl54sixTDjOsluqrZluiHU3VQwVVdOxtH2reecFw6hpgY5AsAcxOBVTDi/FTQn0OmBixCBIBtAX1nBZNdLDURVEOQsPX2BPTeqrU9g3HCv3ZOyzLphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524580; c=relaxed/simple;
	bh=V52l48PvFgr+RmTYXqdmJ0FiUD9zrKcPzbZaaQbD8xM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XRXZxUAd1e7XgTCtUp6NCsZuWWVC2Dfk3YSO3EIyT+FIQ/xmcKJhQ9ofuuWUIsyYbk10HJb+JgY97IaKd0LEem6K2noAgwHwWKuO49tTKWuPiTlk7IZFDYIg09F+W2pu6qvLZ7rX2gbnBHA70CHp48vEvS4L7fCI/caSIX4AH+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ay0A5eLa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ay0A5eLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E91F00ACA;
	Fri, 31 Jul 2026 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785524578;
	bh=E88JEGx69E4FBYr7wu0mC8tzEvmo6Bvv6M04Ci1tcsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ay0A5eLa+j9zUyJHzaNFSj7UTsKN1ORSMzyEYMMZSmCEID4lhAogF4kI92Z1HPHb+
	 ZIJyxQ9JscYfT9Ne54P37ZxlLL0hPrrOR4NkKrMTXd4EpWkyiaku5wU90hfVFrJdZh
	 +NeYIeQEllwYofV2UqCsWYu10PywOcDoZ2kUFglx9UYV0phhgrDfmkwgFKiK6QPklN
	 GtXhxKCfSbwosq6e6YtQoLLys4tMBND5gJT7tg1HkkDjIN0ai8qkvhWvU0eRwPt+6U
	 UWXgYxE5dEuIr+CgGsuQ4DgVcnw9ZjbE9RQVomY51+OJUHXdl/Bt49niZRLUWO3jGj
	 fF8SCNulTbIfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 22/69] drm/display: hdmi-state-helper: Sync SCDC
 state on hotplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-22-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-22-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 19:02:58 +0000
Message-Id: <20260731190258.8E5E91F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] SCDC sync fails to handle scrambler teardown on disconnect, leavin=
g the source scrambler active when swapping to a non-scrambling sink.
--

--- Patch [22]: [PATCH v10 22/69] drm/display: hdmi-state-helper: Sync SCDC=
 state on hotplug ---
commit 7cc2ce705b4793d8696717d86562fbd6c0bde231
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/display: hdmi-state-helper: Sync SCDC state on hotplug

This commit hooks drm_connector_hdmi_sync_scdc() into the connect and
disconnect paths in drm_atomic_helper_connector_hdmi_update() to synchronize
the SCDC status on hotplug events.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 4a93c279c9a76..3377ea9361209 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -1205,13 +1205,16 @@ drm_atomic_helper_connector_hdmi_update(struct dr=
m_connector *connector,
>  					enum drm_connector_status status)
>  {
>  	const struct drm_edid *drm_edid;
> +	int ret =3D 0;
> =20
>  	if (status =3D=3D connector_status_disconnected) {
> -		// TODO: also handle scramber, HDMI sink disconnected.
> -		drm_connector_hdmi_audio_plugged_notify(connector, false);
> -		drm_edid_connector_update(connector, NULL);
> -		drm_connector_cec_phys_addr_invalidate(connector);
> -		return 0;
> +		ret =3D drm_connector_hdmi_sync_scdc(connector, false, ctx);

[Severity: High]
Does this call successfully tear down the scrambler on disconnect?

Looking at drm_connector_hdmi_sync_scdc() in drm_hdmi_helper.c, it seems
to return immediately if the plugged parameter is false:

int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plug=
ged,
                                 struct drm_modeset_acquire_ctx *ctx)
{
        ...
        if (!connector || !plugged || !ctx)
                return 0;

This would make the disconnect call a no-op, failing to disable the source
scrambler.

Additionally, if a non-scrambling sink is subsequently plugged in, the
connect path will call drm_connector_hdmi_sync_scdc() with plugged set to
true, which also bails out early:

        if (!connector->ddc || !drm_scdc_sink_supports_scrambling(connector=
))
                return 0;

Could this leave the source scrambler incorrectly enabled if a user swaps f=
rom
an HDMI 2.0 monitor to an older HDMI 1.4 monitor, resulting in broken displ=
ay
output due to mismatched hardware state?

> +		if (ret !=3D -EDEADLK) {
> +			drm_connector_hdmi_audio_plugged_notify(connector, false);
> +			drm_edid_connector_update(connector, NULL);
> +			drm_connector_cec_phys_addr_invalidate(connector);
> +		}
> +		return ret;
>  	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D22
