Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D4F296BA9;
	Wed, 22 Apr 2026 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776840721; cv=none; b=GejUW/W4rjktlhPxiYVTWVTu0JdLMjKCX4lVQgFwbe6w4C0J23bQ2nQFd2uYPBgy1uL48VoXTNwUbTQ8wEiZRc0XEX/ENfYmpYnUj9/ilOMXBRhvibBsLwTSoab9OiGQtTRB2UPdKowXALzQzEWjB/WBK5lGTqCHi09qkSPfFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776840721; c=relaxed/simple;
	bh=F+k2j61BaRiqQdtTNTgqmqkRXzyWVzQqwf1yxx9Jl5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSKtDLsEmScOQZK0WkUCsLDdTcaEM1vivAR7lqiG38zpgFxZ/AqfiSln4Bm8fwrtUIeqeeB3HW1bJmdunoi/4nomGuDruXRf/zw8/SKWeVYy/gG5qwlGGtuPqN2PjMR8iMZTmSQJF0X+TT6hpkPNMmUOH1E+xFuzTQqJqggZoJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBI2YyHQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBI2YyHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9AEC19425;
	Wed, 22 Apr 2026 06:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776840721;
	bh=F+k2j61BaRiqQdtTNTgqmqkRXzyWVzQqwf1yxx9Jl5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBI2YyHQ14xILWfOLl0M781/RFBZxHKsv77ZC0eXBHFwUqbPFiRATOVszWZUCkuoy
	 P8AsHN90clI5gEzB7QzrZq4mJrZ4zgAO8JLsI6oI8YqouSwk0t0Dgb3PIz3G2erBO7
	 gfHj0aU9d3+y+LdzG60/FGB3OnyhG4AuGHGGxVSdKByYp1bAJjSWJ/7z48Csc1C9Lb
	 +4B0hE6FXg5eWOEiUZBsCNh0TQK6AvpA4lO8XvJFvdAh900rmQ0FOV9vkoYibxG9qo
	 gudHD4vXrsQnwh9duF4E+0jCjD8KIYut7hNPttSsTAwGrdFr1ApLK4/ho+U5OnHKW/
	 5g5uCvXkkYfvA==
Date: Wed, 22 Apr 2026 08:51:58 +0200
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
Subject: Re: [PATCH v2 02/20] drm/atomic: Drop drm_private_state.obj
 assignment from create_state
Message-ID: <20260422-poetic-malamute-of-greatness-ceee0f@houat>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-2-c63f1134e76c@kernel.org>
 <bbb554a6-2034-4f6e-9b48-fa9e10b4a95a@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bcajdpsxzzkhkmjz"
Content-Disposition: inline
In-Reply-To: <bbb554a6-2034-4f6e-9b48-fa9e10b4a95a@suse.de>


--bcajdpsxzzkhkmjz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 02/20] drm/atomic: Drop drm_private_state.obj
 assignment from create_state
MIME-Version: 1.0

On Tue, Apr 21, 2026 at 03:03:50PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > The initial intent of the atomic_create_state helper was to simply
> > allocate a proper drm_private_state and returning it, without any side
> > effect.
> >=20
> > However, the __drm_atomic_helper_private_obj_create_state() introduces a
> > side effect by setting the drm_private_obj.state to the newly allocated
> > state.
> >=20
> > This assignment defeats the purpose, but is also redundant since
> > the only caller, drm_atomic_private_obj_init(), will also set this
> > pointer to the newly allocated state.
>=20
> Is this paragraph no longer up to date? Grepping for
> __drm_atomic_helper_private_obj_create_state returns plenty of callers.

No, it's still up to date but super confusing. I didn't mean that there
wase one single caller of __drm_atomic_helper_private_obj_create_state()
that would set obj->state, but rather that the
drm_private_state_funcs.atomic_create_state hook is called only by
drm_atomic_private_obj_init() and it will set obj->state.

So, you're right, there's plenty of drivers calling
__drm_atomic_helper_private_obj_create_state() but we always end up
there through drm_atomic_private_obj_init().

Maxime

--bcajdpsxzzkhkmjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaehwDQAKCRAnX84Zoj2+
dpyKAXkBF+Uqrnq4REnKuA0OlvLZRGSTJJ2HUa7jCMcyxQLt/PBQx4V/BABYGfiY
yGO45+UBgIaXbaB8TXvhywyna7iuhl4sopx2bu7lqy0Hut5/L8CNhH/7RgZBQYhD
2HA5L3Ii3g==
=qp7L
-----END PGP SIGNATURE-----

--bcajdpsxzzkhkmjz--
