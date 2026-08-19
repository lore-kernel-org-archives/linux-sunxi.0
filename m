Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3B231A3B;
	Wed, 19 Aug 2026 12:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143198; cv=none; b=Z0BTych8K3nJ5vNAXGnoBuyv2T51JjG1yriTLm9gQFOwUbx4TRAm66xKhPSW4YAHc3NnftEyed/2ZVxmf9vzcw3g5QvOcEgqK0VqcPwbGjpfijzxsSadiDzFvNnhuUGrlygHzyOHTTyijp6J/zcIWUA7/sy5kwd0OwZdhQRqEgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143198; c=relaxed/simple;
	bh=ruv5OdGmv4N7Ly2D1QGdtILwN/1UWKjgBvC9MXV+Tlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fw/IYRhBlHwOAKxpmGdhP4UniF92Q6XVI6C+FdHkYZBzwsLOha4r7y9WcWuaxjwz58umi1KOgWXUh/C92JOJiIiQ7tUO4g2VGnE42UE6+I/30OjvPJONxgoJGKJs08wOzfa8ZtizBbF+uQc/tk4uSIHwHwydKnoDBHvzn5URxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtBBz7Ik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtBBz7Ik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7224E1F000E9;
	Wed, 19 Aug 2026 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143196;
	bh=TrqogX1d6CpIK5BDZbM8rityiqPvUCn4X4SVNR7vuNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VtBBz7IkyQGjgipDTIQOj5OCMWFgrUj+acs8oItZKYvEr75rnCeV8/XJ+U9iGm24g
	 DkFpC+/1CnABHexazonHnlpILJpVHksKmmrCJsvmFLL4MDkXLyXiIniD5ZebeWxTKW
	 gRqv/FOKoaVZzjnu8PGW3BuHw/eXkXQLNlcsN3w02eZNa0TAHdCU9ISc/sEjZnLWY2
	 cldj4zUIVwApLixp1Y9ZrcGLrzdSDAimOIbGXBeFBc7UQeDcB8J4Azr8iz/iiAEUMu
	 fV8FtMh3rHmwPkKvlvb+0F/WSYagtKKbml3Kp4mHYYjCTDVQuMhJmEzQC+JnGqwGv+
	 qmYvzXTfEisfg==
Date: Wed, 19 Aug 2026 14:39:55 +0200
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
	Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH v10 21/69] drm/display: hdmi-state-helper: Pass acquire
 ctx to hotplug helpers
Message-ID: <20260819-huge-congenial-rottweiler-32ec85@houat>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-21-294364b2cf15@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3rp65omxlgvr2kuq"
Content-Disposition: inline
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-21-294364b2cf15@collabora.com>


--3rp65omxlgvr2kuq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 21/69] drm/display: hdmi-state-helper: Pass acquire
 ctx to hotplug helpers
MIME-Version: 1.0

On Fri, Jul 31, 2026 at 07:19:28PM +0300, Cristian Ciocaltea wrote:
> In preparation for supporting SCDC status synchronization on hotplug
> events, extend drm_atomic_helper_connector_hdmi_hotplug() and
> drm_atomic_helper_connector_hdmi_update() to take a struct
> drm_modeset_acquire_ctx argument.  This will be used when a CRTC reset
> is required.
>=20
> Additionally, change their return type from void to int to allow
> propagation of errors such as -EDEADLK caused by lock contention.
>=20
> Update existing callers accordingly.  Note that in the VC4 case, the
> return code is ignored, as it cannot fail: being in the .detect_ctx()
> call path, the connection mutex is already held through ctx, and it
> bails out early because the driver relies on a local SCDC
> state-management implementation, and therefore does not yet expose the
> scrambler capability through the common helpers.
>=20
> Similarly, introduce drm_atomic_helper_connector_hdmi_force_ctx() as the
> HDMI connector implementation of the .force_ctx() callback.  Since
> migrating from the .force() callback is somewhat more involved, its
> users will be migrated incrementally, after which
> drm_atomic_helper_connector_hdmi_force() will be removed.

The force_ctx introduction should be a separate patch. Once split, you have=
 (for both patches)

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--3rp65omxlgvr2kuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaoWkFgAKCRAnX84Zoj2+
dpxbAYDWvy2abaZ7cn62e+VobqiL0fNN+KQJAQuPE0h2SP0dGhzSQgFdt2m/iR0K
3guVa5UBf2cSjZ7ytgMSlTJ7y1BKsyj7fN6s0Us/VWsxeZ2vyt78eqeZNxsKcWVx
MjW7AWoLWw==
=63Wj
-----END PGP SIGNATURE-----

--3rp65omxlgvr2kuq--
