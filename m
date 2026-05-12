Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818CE38E8BD;
	Tue, 12 May 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778584683; cv=none; b=Qpu9toI4ahIedepOFinaANmD0uI43jjFekszeSDvF2CiTw0xc+HpXOQZ8busNeGcDiUsBNViiptSBiejt2xhVBEcTGQU9dudJqtzH69Qm4T4I0tLI+AGwVPHQ2N6zYe9hu1cjlZfXTPcnflghtiuDD6UKi0hWPNmpLnNqxcyWF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778584683; c=relaxed/simple;
	bh=izVpPklsgFhgBJ6UDkzs+YdvB1EtAk+r3l+WycQYVK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0keYz3GZ1FLsab0pCBqKxMpF4u+RMYTxmMybRtb/70W3i8hk5GF6cybbA6j3pnJN2nvivG5jMbcCUDjx6soQDGFhODLEf4WR+gSg8jhvG/gWO/jL8e50OhjxH/744OmwLF07OfzOVKHO/EDOm2QSndrVlDehgIH0xT0im/DLyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MI/cMLhr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MI/cMLhr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968C9C2BCB0;
	Tue, 12 May 2026 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778584683;
	bh=izVpPklsgFhgBJ6UDkzs+YdvB1EtAk+r3l+WycQYVK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MI/cMLhrJ0d6BbO5le9N/pjNBvowsmBJX5p2aGRXKCvkEru0ZhZYb0gC7XQnEZJ3S
	 LbRF3MViww/nf4lziH+Eyn5CqRWN1xAAY+NODlFsE2tYoYO0ItSuFKmC+uxkBX8a8X
	 NczYDhnIJP3RPyMpEKx9+amQX5rXMHSWJL9zlYhhoLDuh9Y5EZMAhQYR4KpTBLjfaP
	 bafp/z9rmbrAtMGhR93r+nb1a+uJhZuZS2KU9Ooj/7LEIrVi65TnLMqZamjMXLNi8V
	 uTmLFAldAGbTgqHThC1qQJAzZY0sC1GqT3r7UNYFHkVHUQOiuOoBNVbBVnXJ61NZn/
	 OvCU2yP1S1Awg==
Date: Tue, 12 May 2026 13:18:00 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
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
Subject: Re: [PATCH v3 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
Message-ID: <20260512-partridge-of-unexpected-contentment-ccceef@houat>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-18-8b68d9db0d8b@kernel.org>
 <20260504174907.GT1344263@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="y4bfkipmhdhmpwea"
Content-Disposition: inline
In-Reply-To: <20260504174907.GT1344263@killaraus.ideasonboard.com>


--y4bfkipmhdhmpwea
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
MIME-Version: 1.0

On Mon, May 04, 2026 at 08:49:07PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Fri, Apr 24, 2026 at 12:18:58PM +0200, Maxime Ripard wrote:
> > Now that drm_mode_config_create_initial_state() exists to create the
> > initial state, use it instead of drm_mode_config_reset() during
> > driver probe.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/tidss/tidss_drv.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/=
tidss_drv.c
> > index 1c8cc18bc53c..f5099d5d6e32 100644
> > --- a/drivers/gpu/drm/tidss/tidss_drv.c
> > +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> > @@ -169,11 +169,15 @@ static int tidss_probe(struct platform_device *pd=
ev)
> >  		goto err_runtime_suspend;
> >  	}
> > =20
> >  	drm_kms_helper_poll_init(ddev);
> > =20
> > -	drm_mode_config_reset(ddev);
> > +	ret =3D drm_mode_config_create_initial_state(ddev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to create initial state: %d\n", ret);
> > +		goto err_irq_uninstall;
> > +	}
>=20
> There's also a call to drm_mode_config_reset() in tidss_modeset_init(),
> shouldn't it be dropped ?

This has been fixed by f468fef38716 which is in drm-misc-next

Maxime

--y4bfkipmhdhmpwea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCagMMaAAKCRAnX84Zoj2+
duMkAX9Rlb2ZlLxkiSYUwHnQLHcT3AspaIvuP3QQ2XkS9gd4+lhw1TxXVQYzOpx/
xIszD98Bf2NlJxIM0uLxiH3sjS3jGpTbz+Ge+VMI9xSNO/XbIt4c4tka1DCPybKM
tJoOYMCdnA==
=YKv1
-----END PGP SIGNATURE-----

--y4bfkipmhdhmpwea--
