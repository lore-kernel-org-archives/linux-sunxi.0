Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41023ED60;
	Thu, 20 Aug 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216113; cv=none; b=SbNL3g3WB7xdLu8FfEeQUNU2lAYNSbM8wJXytWAhe11dUKsD/e/iThejuJT9gUzzULxNObaQeSdq2tv/ap4Zf4rLoviEURPx1Qs5aMxDIz4LHlSz35V/WbqoIxmV+AwNaH9mD/yxLNgDznY/qbcoYqS3Jj9EQjbb+buR97sP9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216113; c=relaxed/simple;
	bh=MqCEqQX4RIwIf5TpRhNbUAW4QnZ7mlc0LruO2j4znEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUIZ7tEDT4EFeWeazSgU9eDPeGFWOt5R9Sow8jJQZxbW+hQZPMJiFBnKFfA/2m68LCleMFmQZFKasn5f4M6uP4MHpYxS6vFILSH+PG1WBokJn7lk1oNRW7SqtvQ59fZGbvNSBx8QODxUzenNFaECGaKg0JJjdNWKPCtW0TdJCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oETed9BX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oETed9BX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6FB1F000E9;
	Thu, 20 Aug 2026 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787216111;
	bh=l3rPSY8/H1j5rwG0ZinkqkOyB7YrD7s/UlfIdkhJ1Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oETed9BXxV63wuse+XXarKPoAQ3KSpOTyKnyE7NwwDW3L+GqR6KhcBNOifSEIvzfN
	 sY7w26iUwAfWzk+FIA2DtXNEcUOOdiQ4DrervBhLHeXyVAA1cKsxNbfW5bm9bnwS7J
	 r+mTKm/eXeanGOwL6ASPhcNCr/3wvvTZk+QbzSPxEhh+ESK+xBBVh4q2HJ0chhSbpQ
	 JG0Id8T6ephZcPzHH0lAWDF9p2WVUvwbUYKVSWMSmY0d5JbuVqyZLBnSIaAdVYebgl
	 yf5/DX1OnarTxQ+YNvY7eqOvwarVqg1OtqgpyBa7tjgYsFUxaB1wf7Yx69A+TNSV/t
	 QRflykiZOcP5Q==
Date: Thu, 20 Aug 2026 10:55:09 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 43/69] drm/vc4: hdmi: Propagate -EDEADLK to the top
 level
Message-ID: <20260820-sceptical-friendly-panther-6cdfd4@houat>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-43-294364b2cf15@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jheie2hl6uizzjqu"
Content-Disposition: inline
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-43-294364b2cf15@collabora.com>


--jheie2hl6uizzjqu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 43/69] drm/vc4: hdmi: Propagate -EDEADLK to the top
 level
MIME-Version: 1.0

On Fri, Jul 31, 2026 at 07:19:50PM +0300, Cristian Ciocaltea wrote:
> drm_connector_helper_funcs.detect_ctx() is expected to propagate
> -EDEADLK so that context owners, e.g. drm_helper_probe_detect_ctx(), can
> perform the required backoff and retry.
>=20
> vc4_hdmi_handle_hotplug() instead runs its own retry loop and calls
> drm_modeset_backoff() on an acquire context it does not own.  This drops
> all locks in the context, including connection_mutex held by the core.
>=20
> Drop the local retry logic and propagate -EDEADLK to the caller instead.
> This aligns VC4 with the expected detect_ctx() semantics.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index ba16e7944cf3..72042fad04c5 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -344,12 +344,11 @@ static int vc4_hdmi_reset_link(struct drm_connector=
 *connector,
>  	return drm_atomic_helper_reset_crtc(crtc, ctx);
>  }
> =20
> -static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> -				    struct drm_modeset_acquire_ctx *ctx,
> -				    enum drm_connector_status status)
> +static int vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> +				   struct drm_modeset_acquire_ctx *ctx,
> +				   enum drm_connector_status status)
>  {
>  	struct drm_connector *connector =3D &vc4_hdmi->connector;
> -	int ret;
> =20
>  	/*
>  	 * NOTE: This function should really be called with vc4_hdmi->mutex
> @@ -368,17 +367,9 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi =
*vc4_hdmi,
>  	drm_atomic_helper_connector_hdmi_hotplug(connector, ctx, status);
> =20
>  	if (status !=3D connector_status_connected)
> -		return;
> +		return 0;
> =20
> -	for (;;) {
> -		ret =3D vc4_hdmi_reset_link(connector, ctx);
> -		if (ret =3D=3D -EDEADLK) {
> -			drm_modeset_backoff(ctx);
> -			continue;
> -		}
> -
> -		break;
> -	}
> +	return vc4_hdmi_reset_link(connector, ctx);
>  }
> =20
>  static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
> @@ -416,10 +407,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm=
_connector *connector,
>  			status =3D connector_status_connected;
>  	}
> =20
> -	vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
> +	ret =3D vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
>  	pm_runtime_put(&vc4_hdmi->pdev->dev);
> =20
> -	return status;
> +	return ret =3D=3D -EDEADLK ? ret : status;

Don't we mask any error that isn't EDEADLK here?

Maxime

--jheie2hl6uizzjqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaobA7QAKCRAnX84Zoj2+
di3CAX9taIN5wWfjabsZQCOc93N9yDXa9ZGCjkYY2vFUSE/fV+whVEefexpHg4/R
F3pHcVEBgJ20yb1ebjodb2eVDBUxXUD4NaTMlRksgE23J/oyYEmSCvMSew5M3fNh
7EuqooG5SA==
=WNEd
-----END PGP SIGNATURE-----

--jheie2hl6uizzjqu--
