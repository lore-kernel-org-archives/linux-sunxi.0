Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C283191CA;
	Thu, 20 Aug 2026 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216003; cv=none; b=eOvm24ihrYmm+P0gs1iWshcacuVCKs9SpsSz4BRg3Olyo/dPvqrblbMiuMuGg4kwqVcINkBWBQB1fgfk8zG7C2LSkErQCgSrpUFqbmUkFfyS731XfbJYjXsYap2ag4o1Swxe2iG/MmjNnZLj18Ya+oEdN1SrgezMOBykGL1uNYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216003; c=relaxed/simple;
	bh=dNJxQKLd06IZ+8aed0SuwONQadO/gDAx7mMPFI3Ro8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbSeaPiL8eZcLPEn+VDqK+MUy4gcJ5rrCLSPGtNKmV3ftB9g+YtS65OFMz17m0YOq4CI1W8sh34DGX4rQT5e4qp8iKNFmdbC8RXBCw4FC9/+Lcslqpi4Fb8QZYTXTIbs0P2ttLN8qUvQ8GIcB4uf1OQ9tCO0yyqCoe8WE6kQSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebpoa054; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebpoa054"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD541F000E9;
	Thu, 20 Aug 2026 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787216002;
	bh=pMTmIVVAV0WmbjCuxhFNMHkuv6fXx2hzsnZMAGVvYWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebpoa054yVk5qC6s1kUafg5ihJLbX7Uxj7uDom86w6i63STFYV901vYQYM+ScP7nO
	 GiQA1XYKUcfOdwvPAWD5rbJ/jZTaT6llynKFG+d2Rs9pXDfR/6QH5mmliOS4GbQ5Qm
	 0sJOJCeyaKjZRbsUD4dskD/SXM/E53W57J4H+TOTyU73gy8wdEVCD2GROGJ7PtJ7lw
	 CoQPv0Uza6w6P4RhX8W+wO6WR/A1EgSw8HkyQ8l/M87Uwxo4mmvLDp1qx0kgKP+WYc
	 wUt7Cu9g88ooxpeCopWIDwc5xwBoU64IRzXdUrh0YczmZ4wLddkq4nuKrTY4anXJip
	 U1uWB3EF2QE9A==
Date: Thu, 20 Aug 2026 10:53:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
	Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>, 
	kernel@collabora.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Maud Spierings <maud_spierings@hotmail.com>, Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH v10 22/69] drm/display: hdmi-state-helper: Sync SCDC
 state on hotplug
Message-ID: <20260820-accomplished-curly-bandicoot-cc36ba@houat>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-22-294364b2cf15@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3vbhipdczwkvmxnj"
Content-Disposition: inline
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-22-294364b2cf15@collabora.com>


--3vbhipdczwkvmxnj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 22/69] drm/display: hdmi-state-helper: Sync SCDC
 state on hotplug
MIME-Version: 1.0

On Fri, Jul 31, 2026 at 07:19:29PM +0300, Cristian Ciocaltea wrote:
> drm_atomic_helper_connector_hdmi_hotplug() does not currently
> synchronize SCDC status on hotplug events, leaving the scrambler state
> potentially inconsistent after (re)connect.
>=20
> Hook drm_connector_hdmi_sync_scdc() into both the connect and disconnect
> paths, replacing the existing TODOs around missing scrambler handling.
>=20
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, R=
ock 5B
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 23 ++++++++++++++-----=
----
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 4a93c279c9a7..3377ea936120 100644
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
> +			drm_connector_hdmi_audio_plugged_notify(connector, false);
> +			drm_edid_connector_update(connector, NULL);
> +			drm_connector_cec_phys_addr_invalidate(connector);
> +		}

If there's a deadlock, shouldn't we restart the whole sequence there?
Ie, we should return ret all the time anyway? And if we do that, we
should return ret for drm_edid_connector_update() too.

Either way, a comment on why we're doing it this way would be nice.

Maxime

--3vbhipdczwkvmxnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaobAewAKCRAnX84Zoj2+
dsmXAX9ZDU9lPiTQM27i5k7mRJDVntMtGwshaDMSDOnYE2AAllfcjI+ZdG0n6mHZ
R8zCkiIBfRWAvboi0YPym8+kt7BmG5tIQeVj0csBP/DfUERW2sf6oKOJGu9EZTzz
Mx2ECE+5xg==
=ZQWH
-----END PGP SIGNATURE-----

--3vbhipdczwkvmxnj--
