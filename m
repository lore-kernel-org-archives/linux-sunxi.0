Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5192349CDE;
	Tue, 12 May 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581017; cv=none; b=ucQJv9Y5M9xJojcK7xsN0j0OfWjgfVknU1zWl9FUtiVXaN4AIch6/hwUnAmsDM2YtvSDFMVczmYePpeB1qxkliIkJWr7MyhahzMF9LXoQcUGmPKGUvC8dyAegnkEhAG2XbOD82ijhLBBLO0qQ25BXjvC2xTyI4XW1rgiab0seVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581017; c=relaxed/simple;
	bh=w6hATkZRGSRSJowaFjN45EX2kl/oM+c7ccdVW67Eh3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=legOGLqlgG3TUo4qGAXAmhULKxxaz2AzcsQVOeFtJjrL15Y7c2pKqfFZnRi/tgsFUOJ3bdeYWCaCZBGNwbMeAFl2J7mQ0iyKsCFFGv2NbcZY2jd885MRptWj+zfTq9Mgr5S264ZksXFw5tlutdGWzIM34pH5MDXgYqmZvHK1V5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyynMxhK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyynMxhK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB70C2BCB0;
	Tue, 12 May 2026 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778581016;
	bh=w6hATkZRGSRSJowaFjN45EX2kl/oM+c7ccdVW67Eh3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyynMxhKI/8Jg0jAf3zt9NS9aZuPuBUsWGBl6pjep56D0BX7ArOWIvumJnsk4Hxuq
	 mnnaRaFvBV5mkvEsDlbtbvUSCRvLWYdvCMf4sNeM7vNilIbeePN5AkWfwxvjAQev7g
	 /0A4u2buvc8ZFh87pXWIBdFrJFLxqXQwPpvDqOdq1iuaVD2hhWsouG5CMcWCdCXTZv
	 ifyJNn5+17bVPbWwPFuyMigi7nZbU+5QYcAqZqfLOaUQjlplaxZPW1O+AKlvC2/zNq
	 0oO5sua9onBYaQGmy1JTt0SnaAYmCKIZGFkBl54L+OfZD1RfSStH8Oms9Ts4XPZzEe
	 eFQvD4RfZWaYw==
Date: Tue, 12 May 2026 12:16:53 +0200
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
Subject: Re: [PATCH v3 12/20] drm/crtc: Add new atomic_create_state callback
Message-ID: <20260512-unbiased-apricot-jaguar-a63eba@houat>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-12-8b68d9db0d8b@kernel.org>
 <20260504172858.GO1344263@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xucbq2efeno5xzls"
Content-Disposition: inline
In-Reply-To: <20260504172858.GO1344263@killaraus.ideasonboard.com>


--xucbq2efeno5xzls
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 12/20] drm/crtc: Add new atomic_create_state callback
MIME-Version: 1.0

Hi,

On Mon, May 04, 2026 at 08:28:58PM +0300, Laurent Pinchart wrote:
> On Fri, Apr 24, 2026 at 12:18:52PM +0200, Maxime Ripard wrote:
> > Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> > to drm_private_obj") introduced a new pattern for allocating drm object
> > states.
> >=20
> > Instead of relying on the reset() callback, it created a new
> > atomic_create_state hook. This is helpful because reset is a bit
> > overloaded: it's used to create the initial software state, reset it,
> > but also reset the hardware.
> >=20
> > It can also be used either at probe time, to create the initial state
> > and possibly reset the hardware to an expected default, but also during
> > suspend/resume.
> >=20
> > Both these cases come with different expectations too: during the
> > initialization, we want to initialize all states, but during
> > suspend/resume, drm_private_states for example are expected to be kept
> > around.
> >=20
> > reset() also isn't fallible, which makes it harder to handle
> > initialization errors properly. This is only really relevant for some
> > drivers though, since all the helpers for reset only create a new
> > state, and don't touch the hardware at all.
> >=20
> > It was thus decided to create a new hook that would allocate and
> > initialize a pristine state without any side effect:
> > atomic_create_state to untangle a bit some of it, and to separate the
> > initialization with the actual reset one might need during a
> > suspend/resume.
> >=20
> > Continue the transition to the new pattern with CRTCs.
> >=20
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c | 47 +++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/drm_mode_config.c         | 21 +++++++++++++-
> >  include/drm/drm_atomic_state_helper.h     |  4 +++
> >  include/drm/drm_crtc.h                    | 16 +++++++++++
> >  4 files changed, 87 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index 9cd8550cabb7..b7da134c8c50 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -103,10 +103,32 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *c=
rtc,
> > =20
> >  	crtc->state =3D crtc_state;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
> > =20
> > +/**
> > + * __drm_atomic_helper_crtc_create_state - initializes crtc state
>=20
> "Initialize a CRTC state"

Good catch, thanks.

> The name of the function is misleading ("*_create_*" while you state it
> performs initialization).
>
> > + * @crtc: crtc object
> > + * @state: new state to initialize
> > + *
> > + * Initializes the newly allocated @state, usually required when
> > + * initializing the drivers.
> > + *
> > + * @state is assumed to be zeroed.
> > + *
> > + * This is useful for drivers that subclass @drm_crtc_state.
> > + */
> > +void __drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc,
> > +					   struct drm_crtc_state *state)
> > +{
> > +	__drm_atomic_helper_crtc_state_init(state, crtc);
> > +
> > +	if (drm_dev_has_vblank(crtc->dev))
> > +		drm_crtc_vblank_reset(crtc);
>=20
> This is confusing to me (at least before reading the rest of the
> series), and itn't mentioned in the function documentation or in the
> commit message.
>
> Furthermore, __drm_atomic_helper_crtc_create_state() is later used in
> tidss_crtc_create_state(), which is the
> drm_crtc_funcs.atomic_create_state() implementation of the tidss driver.
> The atomic_create_state documentation states that "This callback must
> have no side effect", and drm_crtc_vblank_reset() has side effects.

That's a good point. I've dropped that function entirely and moved the
drm_crtc_vblank_reset() call in drm_mode_config_crtc_create_state().

Maxime

--xucbq2efeno5xzls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCagL+FQAKCRAnX84Zoj2+
dnNzAX0fzjsGevsyIM+1eS7aSdqPXqaWO2e4vKxwlm1t0+VWLC1LChDXcVfr74JX
gfLRKAABgLDj6dDvAIYO++YmRFrG/pDTCiRABTfTFmqA3MNWXLLdVzFuX/WVI0ll
s+ZfkvI9qg==
=NbJq
-----END PGP SIGNATURE-----

--xucbq2efeno5xzls--
