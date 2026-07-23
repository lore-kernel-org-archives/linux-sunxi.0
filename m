Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2517D283FDD
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771619; cv=none; b=cmFy32bTcLjyDh/TfVdRIRwAQH1SBFrKukDbhk7J5gUSJMv8lkolQQZZct5tRKmqhWiei3xaUSoby2pkf+yPzK96TN5DeBHA/WkH/FgOkvpCbv0Y0RknaxxoqpjFLPxVbltu7Ag+RZ6LL9KblZ/MK9/FC+z+AiO/P/OsvoPiN/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771619; c=relaxed/simple;
	bh=LkLytdKdDkGLKge8d7eZ5psFvisFNi8G5slTn9fNbU8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QCGO+Zq2e3tex4Shc+30uAfdgHcE+2q1GHtwRqvZOQtfd8KpFRRkb9KSeicKpft6Dnac2G9De5HPutBAiILsPn64oIH45Of5xmwCVz9mn106jPVRorQolsnH6i0KETNI6Z+r40L7j5bnneKtHW1+Fd0wiJc81oC21Yl8Y1/jhqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFEtgrkj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFEtgrkj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDB71F000E9;
	Thu, 23 Jul 2026 01:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771617;
	bh=4cPCloTIk0ymrNXgzIt+S7yl5YLm7pvCq+S4ak4JTU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CFEtgrkj3yS4raofD76b9m74eoiLYG+NC9BGL3JIPOyg04WGFAUDObUW34BpBQTBJ
	 42QKmtNEuDglOTNPw0s8CqTgl8UnZ9jnFTqG4uD0KRu+3EOI7AaCU8DMQjnPxRq+tu
	 hKnrHEp6GqQQLAq3fH6XNqMTmgUSwEIYzt/YiVFjbNttkY26OTMTHef0MI3GTtgrwu
	 NcEnrm5LeqhvCVAKgI0zUiZVf93m503aOcBH7EMRz0YMPx43f/exafkxFsRxJO3nbO
	 JlIQpQ7iQLaGicr46U2ZVagcfPUCvmQbCycrUOBWdyA/rfy9jFiXaVeEL3ENfvKl19
	 4t9fKC2eAa0iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 17/61] drm/display: hdmi-state-helper: Sync SCDC
 state on hotplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-17-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-17-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:53:37 +0000
Message-Id: <20260723015337.8DDB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The HDMI disconnect path fails to implement SCDC scrambler synch=
ronization, resulting in dead code and potential display corruption on hotp=
lug.
--

--- Patch [17]: [PATCH v9 17/61] drm/display: hdmi-state-helper: Sync SCDC =
state on hotplug ---
commit c0cc8e9a78dd0bbc36a54e19e44a65a37553ae23
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/display: hdmi-state-helper: Sync SCDC state on hotplug

This commit hooks drm_connector_hdmi_sync_scdc() into both the connect and
disconnect paths in drm_atomic_helper_connector_hdmi_update() to synchronize
the SCDC status on hotplug events.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 04d5196a2010f..ad59318a3e85f 100644
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
> +		if (ret !=3D -EDEADLK) {

[Severity: Medium]
Does this code actually synchronize the scrambler on disconnect?

Looking at drm_connector_hdmi_sync_scdc(), it has an early return when
plugged is false:

drivers/gpu/drm/display/drm_hdmi_helper.c:drm_connector_hdmi_sync_scdc() {
	...
	if (!connector || !plugged || !ctx)
		return 0;
	...
}

Because of this early return, calling drm_connector_hdmi_sync_scdc() with
false for the plugged parameter makes it a no-op, which bypasses the
scrambler synchronization logic.

Additionally, since it always returns 0 in this case, doesn't this make the
if (ret !=3D -EDEADLK) check dead code?

> +			drm_connector_hdmi_audio_plugged_notify(connector, false);
> +			drm_edid_connector_update(connector, NULL);
> +			drm_connector_cec_phys_addr_invalidate(connector);
> +		}
> +		return ret;
>  	}
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D17
