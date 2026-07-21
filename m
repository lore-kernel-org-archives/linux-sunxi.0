Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC123EA84;
	Tue, 21 Jul 2026 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637706; cv=none; b=tJKzky/x3HlRp1bPsn+hKiNP0WhVSxY44sTaXqpkhLLttB6FC7J9T5wBwEJeTFn/OMAcxDpISroQQxId4QxHhaEE81lrj8kz37xHn77qJLIhNMxF9dLTeBvKBeNnlyEbJgQ0uO9f6FQ/Fkqu7/+R86xG54d/goDi/tHgjU33IVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637706; c=relaxed/simple;
	bh=1vRAfqZ87PHMM09wv4aT3IhkpB2yT2fdEKU5OxzKOfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3XXP9Vkn0Zwgp61xiJgzY5oS9HxYv4euBkX+R9yY+TkuVxou27sJtanelegQPZB9nk9ftE0JOrKtAM1QUNk7L1BYNb1x10wRQtwr03H/eHqBCrDxHKUfCATkv2OSgAEfxcNkG5QBr3N/1FPhcO6G9oK/p5HyBC3izZY2VjBnSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/UWNzA0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/UWNzA0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC731F000E9;
	Tue, 21 Jul 2026 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637705;
	bh=1JHcUVKCdjggW2V84rHWH09x4Ps/8CZBsAwOVTuMPeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/UWNzA0yWWlF9ZLanaiQNsP6Zm7yDKSGYmj48b5b+4g4LyvtFST9LlYVnYrtO6H+
	 QRFeT1d7B7dmbTk2/g9Gy3PfH0D99jsdBlIhUO7+58g56hWRchl2PtZPwtTQODogjl
	 kD84mcbdn9cwSDzVuNyYhtLCuOYRZJe+PXycP0wXVTKc4RHp+WQvVQD7hm9J8RdciI
	 4OwD+fvjH5aX9k8YN6otXljbhQlgBCCIq4OAlSjnicIC+8Z/qWlB1S2ZWTV7o2634L
	 VDfyRCdAvcr/QYBRURkhYpfw79fdcJNTlVItL1kzuLD6JUkOT8I1z0TuSjE1CQ2OI/
	 X8ou5ameiWTMw==
Date: Tue, 21 Jul 2026 14:41:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Daniel Stone <daniel@fooishbar.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entry
Message-ID: <20260721-angelic-gay-caiman-26f7ab@houat>
References: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
 <20260721-scdc-link-health-v7-2-92df1b6ad5fc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ah7fjvzl6blaxfpq"
Content-Disposition: inline
In-Reply-To: <20260721-scdc-link-health-v7-2-92df1b6ad5fc@collabora.com>


--ah7fjvzl6blaxfpq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entry
MIME-Version: 1.0

On Tue, Jul 21, 2026 at 10:58:58AM +0200, Nicolas Frattaroli wrote:
> SCDC provides status information on the current display link. At the
> very least, it may be useful to expose this info through debugfs.
>
> Add a debugfs entry for it under the connector, which displays a few
> more details parsed out of the SCDC registers. A new
> drm_scdc_debugfs_init function can be called by the connector
> implementation to initialise the debugfs file.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_scdc_helper.c | 184 ++++++++++++++++++++++++++++++
>  include/drm/display/drm_scdc_helper.h     |  32 ++++++
>  2 files changed, 216 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
> +/**
> + * drm_scdc_debugfs_init - Initialize scdc files in connector debugfs
> + * @connector: pointer to &struct drm_connector to operate on
> + * @root: debugfs &struct dentry for the debugfs root of @connector
> + *
> + * Creates SCDC-related debugfs files for @connector. Must be called after
> + * @root is already created.
> + */
> +void drm_scdc_debugfs_init(struct drm_connector *connector, struct dentry *root)
> +{
> +	struct scdc_debugfs_priv *priv;
> +
> +	if (!root || !connector)
> +		return;
> +
> +	priv = drmm_kzalloc(connector->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return;
> +
> +	priv->connector = connector;

You need to take a reference to the connector pointer here with
drm_connector_get()

With this fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ah7fjvzl6blaxfpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal9pBgAKCRAnX84Zoj2+
duQAAX4m1SnGZZ8EMKaEFk9BhMZ/Xe875CrDjdHjh302duMOC5cuJpLPYvEQ9kqh
q+HhmA0BgMrujQdJGYnLIZuz92Uq7vUm+TUXDnAv9rppoVkbLBtCiEhC4riDT7yL
VYFcIdRPLw==
=Vh4j
-----END PGP SIGNATURE-----

--ah7fjvzl6blaxfpq--
