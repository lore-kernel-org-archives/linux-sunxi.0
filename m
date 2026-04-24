Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDAF2C324D;
	Fri, 24 Apr 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020278; cv=none; b=keTQAzt3GibFbTnUkmv036H3fnEPYeDJs8pQOt9yYtXiPAOR7Iy/SbsoAT4kRy6YUy5Bd/8AaDBjEuI2lfQgTG5cdFbdsJA0kq1mfx7vjLjhKB2nsRU97yhN+0VVq/TOBJ8fdYJn6hx87rLtqE4/bn58jD59smU1o6DYL1KhLDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020278; c=relaxed/simple;
	bh=ZPtRTAcO5vKULVkGrPOpdr9dYJKbJwHKAW4LzVRqvoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohTnWR1JVUVdoc+NaldDZ9aAZO+fKf4Eq5sJxx/3OclOScJq09qg12abf6APLDhy3eczUEsAbYbNYAFHfA+wgDm4SiSPlm0XcaMywBooRXBvIz3P7k6erVqE0stxswHt6vw9LWCVP8IMLYFxTox67Jre3ilUGJliFuhWJgJ5qDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW7ZL+CR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW7ZL+CR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB358C19425;
	Fri, 24 Apr 2026 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777020278;
	bh=ZPtRTAcO5vKULVkGrPOpdr9dYJKbJwHKAW4LzVRqvoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CW7ZL+CRxx2Sijgh6xjUCCZml3UTTpMsXH6cO1EZ6wibNcZoHu595LxCD4AB8p2gn
	 jSaoBI3ElXU1BYxmuOc3NDEcABEdeWKt6wgHB6S1IsWuiFyVWmWv6h/971fYooCBzo
	 RXo6526CET9X621wMlDYeWZctMcReAJzCTJhKeUpGjw8LbqkjVRhIMh6j6vBuXZgaN
	 vJhIZiRh3AQausKSMcfwwnRicX+K/+23ib3tV7aeM7/IdPKDxwRxc5oXLTYFRczQqC
	 tBByluQBB80/irXS/ql/+Ua1O0zUeEjDHWti0vhpQ85qMnzbxJfKvOh6qIr9+EWwRy
	 IX3mNtvMouAVQ==
Date: Fri, 24 Apr 2026 10:44:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Simon Ser <contact@emersion.fr>, 
	Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>, 
	Sebastian Wick <sebastian.wick@redhat.com>, Alex Hung <alex.hung@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
Message-ID: <20260424-nimble-asparagus-tarsier-15f8bb@houat>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-15-c63f1134e76c@kernel.org>
 <79cc30d5-80b5-4d87-a3ad-36d6fad98853@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3cb63aedvnuis3py"
Content-Disposition: inline
In-Reply-To: <79cc30d5-80b5-4d87-a3ad-36d6fad98853@suse.de>


--3cb63aedvnuis3py
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
MIME-Version: 1.0

Hi,

On Tue, Apr 21, 2026 at 03:38:16PM +0200, Thomas Zimmermann wrote:
> Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > Almost all drivers, and our documented skeleton, call
> > drm_mode_config_reset() prior to calling drm_dev_register() to
> > initialize its DRM object states.
> >=20
> > Now that we have drm_mode_config_create_state() to create that initial
> > state if it doesn't exist, we can call it directly in
> > drm_dev_register(). That way, we know that the initial atomic state will
> > always be allocated without any boilerplate.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/drm_drv.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d=
98662b5ddbcae8ded 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev, un=
signed long flags)
> >   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> >   		ret =3D drm_modeset_register_all(dev);
> >   		if (ret)
> >   			goto err_unload;
> > +
> > +		ret =3D drm_mode_config_create_state(dev);
> > +		if (ret)
> > +			goto err_unload;
>=20
> Way too late.

Yeah... I think that was Ville's main objection too.

> Lets rather go through drivers and call this where they currently call
> drm_mode_config_reset() for initialization.

I was really hoping to remove the boilerplate from drivers, but I don't
really see a good place for it then. drm_mode_config_init() could be
another candidate, but it looks weird to put it there too.

I'll drop that then.

> This can be a single-patch mass conversion IMHO.

I'm not really sure? For it to work we'd need to convert these drivers
objects from reset to atomic_create_state too. I absolutely want to do
it next, but I don't think it will be as trivial as a sed call, and it
would probably be best done by driver to allow reverts if we screw up.

Maxime

--3cb63aedvnuis3py
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaestcwAKCRAnX84Zoj2+
dqD3AX91s5aTyrSIs+zg1NTVZ/3A3vLYBnSfFHi5Qil7rXN1H/JxIEEE9V0Ta7xL
sVv2OtMBfAktM0SQa0/hMpYggLwZw3S6EpI61etzjCn+mWT08kRxfRP0K6KBacXD
xc3d+CTDBg==
=tyOY
-----END PGP SIGNATURE-----

--3cb63aedvnuis3py--
