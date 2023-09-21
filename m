Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD48F55
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 08:48:50 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-502b1bbe5c3so1206022e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695286129; x=1695890929; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k4kPbAvXqYWCjQtm/jTtJ1li9AEbZqWafTDz226oJdI=;
        b=YRphU0AcOJPkEx2rAAsNjfgtDpxnmFMDaQf4O0Gt0K7IzAxZDRviv8RrwtVhR4d+z/
         IN9ophUXeu7CrnjfXGoi9BDfGOOYtODUKAY6Eaoa8Jm9noA4OdLp8jub710R5/uSB8xF
         ZmHl4PqmuWq0ZJBesMoXemHG0omKBl5g70zzgHPxv3GpTP6HcVrYvNyvdFsLvX3i0nxw
         7a7eBeBrwkx8OmZVAwfWWmpTuL0KGHwtV0WMNAAiSdn23XWthqXBpg9YfcU3heP54cT9
         9kcxLj5ijNgEASuSREfyHyMDr02T4JEzliqL3xxy0UvbSHzcxPWB7KwsLRZtdHBHWjsS
         CaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695286129; x=1695890929;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4kPbAvXqYWCjQtm/jTtJ1li9AEbZqWafTDz226oJdI=;
        b=o1O9T1iaV6xTDP1fTKbnOVahCir+gnVpUvx/yDmpZ+JJEIpNiYFtW45mD6jrb2pg+Z
         c1j1Ophp/CXLPbLyvsYGqyO95OvP5lOK6lOnnDmAAPmLVebjUN/Tex7Cs2WkHEMe3hFf
         SMhxWjKrS8B8yBwMw8shmtvcsVlKVzPxXA5YErNZppiDr/KqLEw5WOMIlpJVhufjBH7T
         prhKVJbk7rErK3/k1Qv9Hea/tiiSN5ZqpZ7UvUn7ZDcQROrqLCG6gxnRMOWPJKtLPjU+
         azPFE8fftSCrlMdZBopcx7iEjKzNvHrx6t2SPjiKqTh9HbcXyB8Z0ICOg4bieBcuQbaX
         Pbiw==
X-Gm-Message-State: AOJu0YyXe3J8gW3f54k0Qo1qR6kTPGmss1+s+7GCkeUw3u+G9tKlZe+d
	n4iHkHJgc8LRdmilPFA//vM=
X-Google-Smtp-Source: AGHT+IECgI0x8NqVEUwF8vAB/HRCbCPTukfPzQhaF2jXn5JCb5+dUTi6Rg3yqEOYh76bvzU4KraLtw==
X-Received: by 2002:ac2:5224:0:b0:503:1d46:6f29 with SMTP id i4-20020ac25224000000b005031d466f29mr4160892lfl.37.1695286128519;
        Thu, 21 Sep 2023 01:48:48 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id h16-20020a197010000000b004fbddb14020sm205979lfc.56.2023.09.21.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 01:48:48 -0700 (PDT)
Date: Thu, 21 Sep 2023 11:48:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, Jonathan Corbet
 <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3Q=?=
 =?UTF-8?B?w7xibmVy?= <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RFC v2 05/37] drm/connector: hdmi: Add output BPC to the
 connector state
Message-ID: <20230921114845.7edb1d37@eldfell>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-5-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
	<20230920-kms-hdmi-connector-state-v2-5-17932daddd7d@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1wJwHY6yZH5_elgENzeqr8U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1wJwHY6yZH5_elgENzeqr8U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Sep 2023 16:35:20 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> We'll add automatic selection of the output BPC in a following patch,
> but let's add it to the HDMI connector state already.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c              |  4 +++-
>  drivers/gpu/drm/drm_atomic_state_helper.c |  6 +++++-
>  drivers/gpu/drm/drm_connector.c           | 13 ++++++++++++-
>  include/drm/drm_connector.h               | 13 ++++++++++++-
>  4 files changed, 32 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index b1b56dcaa76b..8dce0a2f2ac3 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1143,9 +1143,11 @@ static void drm_atomic_connector_print_state(struc=
t drm_printer *p,
>  	drm_printf(p, "\tcolorspace=3D%s\n", drm_get_colorspace_name(state->col=
orspace));
> =20
>  	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> -	    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB)
> +	    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
>  		drm_printf(p, "\tbroadcast_rgb=3D%s\n",
>  			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rg=
b));
> +		drm_printf(p, "\toutput_bpc=3D%u\n", state->hdmi.output_bpc);
> +	}
> =20
>  	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK)
>  		if (state->writeback_job && state->writeback_job->fb)
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index 0f7e5ba555b8..2c9b52ae1b56 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -569,6 +569,9 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
>  void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *conn=
ector,
>  					      struct drm_connector_state *new_state)
>  {
> +	new_state->max_bpc =3D 8;
> +	new_state->max_requested_bpc =3D 8;
> +	new_state->hdmi.output_bpc =3D 8;

Hi,

will this be forcing all drivers using these helpers to default to max bpc =
=3D 8?

I believe at least amdgpu would disagree. The defaults were changed in
the recent years, IIRC to avoid extra modesets during boot-up when
desktops prefer highest possible bpc for a mode.

The 'max bpc' property itself is a manual workaround for faulty
hardware that does not correctly indicate the max bpc it can handle. It
should not default to be a limiting factor.

>  	new_state->hdmi.broadcast_rgb =3D DRM_HDMI_BROADCAST_RGB_AUTO;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> @@ -651,7 +654,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm=
_connector *connector,
>  	struct drm_connector_state *new_state =3D
>  		drm_atomic_get_new_connector_state(state, connector);
> =20
> -	if (old_state->hdmi.broadcast_rgb !=3D new_state->hdmi.broadcast_rgb) {
> +	if (old_state->hdmi.broadcast_rgb !=3D new_state->hdmi.broadcast_rgb ||
> +	    old_state->hdmi.output_bpc !=3D new_state->hdmi.output_bpc) {
>  		struct drm_crtc *crtc =3D new_state->crtc;
>  		struct drm_crtc_state *crtc_state;
> =20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index b45471d540ac..f55f5918411c 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -459,6 +459,7 @@ EXPORT_SYMBOL(drmm_connector_init);
>   * @funcs: callbacks for this connector
>   * @connector_type: user visible type of the connector
>   * @ddc: optional pointer to the associated ddc adapter
> + * @max_bpc: Maximum bits per char the HDMI connector supports
>   *
>   * Initialises a preallocated HDMI connector. Connectors can be
>   * subclassed as part of driver connector objects.
> @@ -475,7 +476,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  			     struct drm_connector *connector,
>  			     const struct drm_connector_funcs *funcs,
>  			     int connector_type,
> -			     struct i2c_adapter *ddc)
> +			     struct i2c_adapter *ddc,
> +			     unsigned int max_bpc)
>  {
>  	int ret;
> =20
> @@ -487,6 +489,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	if (ret)
>  		return ret;
> =20
> +	if (max_bpc) {
> +		if (!(max_bpc =3D=3D 8 || max_bpc =3D=3D 10 || max_bpc =3D=3D 12))
> +			return -EINVAL;
> +
> +		drm_connector_attach_hdr_output_metadata_property(connector);
> +		drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
> +		connector->max_bpc =3D max_bpc;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drmm_connector_hdmi_init);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fdcf64ab91a9..d0bcb835c857 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1056,6 +1056,11 @@ struct drm_connector_state {
>  		 * Broadcast RGB selection value.
>  		 */
>  		enum drm_hdmi_broadcast_rgb broadcast_rgb;
> +
> +		/**
> +		 * @output_bpc: Bits per character to output.

Is it not bits per channel?

> +		 */
> +		unsigned int output_bpc;
>  	} hdmi;
>  };
> =20
> @@ -1700,6 +1705,11 @@ struct drm_connector {
>  	 */
>  	struct drm_property_blob *path_blob_ptr;
> =20
> +	/**
> +	 * @max_bpc: Maximum bits per character the connector supports.

channel?

> +	 */
> +	unsigned int max_bpc;
> +
>  	/**
>  	 * @max_bpc_property: Default connector property for the max bpc to be
>  	 * driven out of the connector.
> @@ -1939,7 +1949,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  			     struct drm_connector *connector,
>  			     const struct drm_connector_funcs *funcs,
>  			     int connector_type,
> -			     struct i2c_adapter *ddc);
> +			     struct i2c_adapter *ddc,
> +			     unsigned int max_bpc);
>  void drm_connector_attach_edid_property(struct drm_connector *connector);
>  int drm_connector_register(struct drm_connector *connector);
>  void drm_connector_unregister(struct drm_connector *connector);
>=20

Thanks,
pq

--Sig_/1wJwHY6yZH5_elgENzeqr8U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUMA20ACgkQI1/ltBGq
qqdaQRAAjfKbi0w7oddJriljZUDUoI1Xd4FCUc54o8hNaouY4GMPo8BjlHTUGHxT
oHxATfX6EO5a4wWK3ceBWFhBpLETGmIpqn5wdcG2+84vhIVHXgPn/l1MwShFkzcD
5WQjnEnFvGqg8eZ05Cc545omaAiLZbqGKeXw2piYUd2+cZmBDZroK3BQXgZlM6JV
62/0mx3eR3juCdwGR9PlWHnoPdsVQA8REfaR62C33rF4ZP52tp0x/OiXa0D7tcxl
bj7XqZ3iuK9lCArc8GGZZdSuyEK8oobA7j6SDvbY6KqNGoE4DLNkKHVp1Cm7x7X/
xvexGK/FiQ3QLSn7KUXFK3MFk5X14Zr5P83bLFnEL78MqSdz0KCgeZFhJ9Hs6PkS
y3FuV7YcM8PNsPwvJIElTRnMpby7LpweEPD2mohJENK22b3bfFWU5o+sGVGotCKq
Y3BRrJnjWZrXq6mkcKhFwq2YM7+oFasQrG74Afn8SFvfu9lnRfXnveYp8tpyR/Jz
CIH/X57kHsgZJeZaPVD86aGmEq5UFjynjuLbwznoJYVcJrwAtvbVwNzcrTO3x4ea
P8PRUxUwROJGWuLKSRKosmmoMIjpqSBIsQ2UDaWEwv0UIbKA2jivnb9vGkbBVEGZ
rAzfC0oo7clq9sikn0v8UMgbIkzWSYYy5ycZVl1KQ7xxXQtbHr4=
=JFuq
-----END PGP SIGNATURE-----

--Sig_/1wJwHY6yZH5_elgENzeqr8U--
