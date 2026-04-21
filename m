Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3151CAA6C;
	Tue, 21 Apr 2026 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776777535; cv=none; b=gWIvp9vKkB1LSOhuA8nTfMUu/+dEQj+FWfV68kWW7Zgeco5zaJzHdi0R+bWpUlXfYqPheGz8F4N4PE+0WtAv0Hv4xkH87oSgoYW5JzIuwfVA489ITqqAcvqHzpTI1R0SJUV6Ouox1U60Gw7782BZeTsWIQEUMxO6RFCBb7i1LcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776777535; c=relaxed/simple;
	bh=4YGxx1230NUeqGUVgj7w7B9jvZFIjNcNxTgoavQYPX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCh8wnX7HXfrk5wQCpqfvJxr8Ch+X9eRbU5T57uBbtjRR4xHw0VEHjjWknY9pDVx0mOees4mLydvUpUUrsc3neAtlCK7EU95wpECvzVqz0uQIi1okok7Y7p9uNZ7WRR4fyqO9IAKjeNCn4npNNkCYJhPw+RVh6ciOnbDUN2IjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4H9NCS1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4H9NCS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D3FC2BCB0;
	Tue, 21 Apr 2026 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776777534;
	bh=4YGxx1230NUeqGUVgj7w7B9jvZFIjNcNxTgoavQYPX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4H9NCS1wklFgmjG3fY7nQwgmC6y7es9bQm6jTUyEB7pb0KU8qFYkgLJJ+DR2whvN
	 j/G9gsVSHdb+BxBlMDVjCpFXiQtqCJitVKVK1ahJj3pCV3dg5CLpcNWK5oo2fCUJ5K
	 DlIJMohixGciaVZk3cvO64EqgMB3Ag98bQS7pKv7ObCZ/l6TK9TV68B/NPw9/nYBwg
	 rtFDfefPGUWPvhDVwl3UP9a/A0ejKvkmfvxPYrDtDlWHl1wncqKZOhKLS62DYz9cZb
	 I31H9HTV2NZ3Ci1mZGF23NTzsTRjD7X3THI/uSaQ7USYg6Sfrhra2owDzfhuuATxJl
	 ZHcbPuq976jwA==
Date: Tue, 21 Apr 2026 15:18:51 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 03/20] drm/mode-config: Mention
 drm_mode_config_reset() culprits
Message-ID: <20260421-satisfied-teal-serval-640ded@houat>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-3-c63f1134e76c@kernel.org>
 <8f111841-bb88-4cbb-a3ae-b26ac2f252cb@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rxrpmabyud4mqcjl"
Content-Disposition: inline
In-Reply-To: <8f111841-bb88-4cbb-a3ae-b26ac2f252cb@suse.de>


--rxrpmabyud4mqcjl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/20] drm/mode-config: Mention
 drm_mode_config_reset() culprits
MIME-Version: 1.0

Hi Thomas,

On Tue, Apr 21, 2026 at 03:08:03PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > drm_mode_config_reset() does not reset drm_private_states by design.
> >=20
> > This is especially significant for the DP MST and tunneling code that
> > expect to be preserved across a suspend/resume cycle, where
> > drm_mode_config_reset() is also used.
>=20
> Do we really? There's drm_mode_config_helper_suspend/resume(). Why would
> drivers do a drm_mode_config_reset().

drm_mode_config_helper_resume() will call drm_atomic_helper_resume()
that call drm_mode_config_reset(). So (most) drivers will not directly
call it, but it is going to be called still.

Maxime

--rxrpmabyud4mqcjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaed5NwAKCRAnX84Zoj2+
dtw8AX9DojrL3WFaspDKRjToSW+vRmF412s3y1qGLFZcP0f9OtAIccAw3Fg7lizI
ZN8HewUBgIkwUv4pGG2YRPkReA/5dhaOtLMZCBDBHqvL/6jxd48ge3+cGst6w3AQ
TyATWnE3pw==
=dUtn
-----END PGP SIGNATURE-----

--rxrpmabyud4mqcjl--
