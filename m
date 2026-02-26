Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C171F399027
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097164; cv=none; b=rpD90dXVhJBPvacJxZ6uXY0Lld9ZW4sruaK4M95hMMl+O76vAPlpkjV66frUZzg8/CSqGG7QAW7QtIvhDXFtIOsYoVMEYVWYU2tFQ/brYZKPAwFzQG9FRbLP3sWyEgUyE8touKXV3enuGK7zQFsy3zeyLFLI+fdIK0GYdEp7BqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097164; c=relaxed/simple;
	bh=1j+zka3VwDpAifrTTMZey/VQLKhdfcenrL2q3WNfcT8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jPYlHWnn0MrnwpRD1x0gWiGEMmt+ET5Z2uYFHm9r5yQeN+aBIOFGOW7/y+6sITy2I5/0PVBPD+W18ZP0+nExIXaBQvMw+BwRk5fVeqrLeIBzdeRSd/UurmpdkcU4OZdb+DbaRN7l3CI0/VgIGBXmEyKpjFM6yfnjxVEwC4vZOeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvXPh-0002CZ-Q5; Thu, 26 Feb 2026 10:12:05 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvXPd-002hoS-2a;
	Thu, 26 Feb 2026 10:12:03 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvXPf-000000004RI-04J7;
	Thu, 26 Feb 2026 10:12:03 +0100
Message-ID: <4ea869750681f5eee3bbb2978f4ff0ace70310a9.camel@pengutronix.de>
Subject: Re: [PATCH 01/14] drm/connector: Introduce drm_output_color_format
 enum
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>, Nicolas Frattaroli	
 <nicolas.frattaroli@collabora.com>, Jani Nikula
 <jani.nikula@linux.intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie	 <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland	 <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira	 <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Yan
 <andy.yan@rock-chips.com>, Liviu Dudau	 <liviu.dudau@arm.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,  Heiko =?ISO-8859-1?Q?St=FCbner?=	
 <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai
 <wens@kernel.org>,  Samuel Holland <samuel@sholland.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal	
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Date: Thu, 26 Feb 2026 10:12:02 +0100
In-Reply-To: <20260224-drm-rework-color-formats-v1-1-bebc76604ada@kernel.org>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
	 <20260224-drm-rework-color-formats-v1-1-bebc76604ada@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

On Di, 2026-02-24 at 11:58 +0100, Maxime Ripard wrote:
> The EDID parsing code initially introduced the DRM_COLOR_FORMAT_*
> defines to represent the sink capabilities. Since a given sink could
> support multiple formats, it was first defined as a bitmask.
>=20
> However, the core and drivers have since leveraged those defines to
> represent both the supported formats but also the current format being
> used.
>=20
> Considering the latter case, the more natural, and consistent, thing to
> do would be to create an enum of all the possible formats, and then list
> the supported formats using a bitmask of the individual enum values.
>=20
> Let's create a new enum following that pattern, drm_output_color_format,
> while maintaining the DRM_COLOR_FORMAT_* compatibility to make the
> transition easier.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 42 ++++++++++++++++++++++++++++++++++-----=
---
>  1 file changed, 34 insertions(+), 8 deletions(-)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 7eaec37ae1c735334afa7dad15a38cf0c8b761b8..c67539708f636ae3905bb8424=
c63799bd1811f28 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -554,10 +554,35 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	=3D 14,
>  	DRM_MODE_COLORIMETRY_BT601_YCC		=3D 15,
>  	DRM_MODE_COLORIMETRY_COUNT
>  };
> =20
> +/**
> + * enum drm_output_color_format - Output Color Format
> + *
> + * This enum is a consolidated color format list supported by
> + * connectors. It's only ever really been used for HDMI and DP so far,
> + * so it's not exhaustive and can be extended to represent other formats
> + * in the future.
> + *
> + *
> + * @DRM_OUTPUT_COLOR_FORMAT_RGB444:
> + *   RGB output format
> + * @DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> + *   YCbCr 4:4:4 output format (ie. not subsampled)
> + * @DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> + *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
> + * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> + *   YCbCr 4:2:0 output format (ie. with horizontal and vertical subsamp=
ling)
> + */
> +enum drm_output_color_format {
> +	DRM_OUTPUT_COLOR_FORMAT_RGB444 =3D 0,
> +	DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
> +	DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
> +	DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> +};
> +
>  /**
>   * enum drm_bus_flags - bus_flags info for &drm_display_info
>   *
>   * This enum defines signal polarities and clock edge information for si=
gnals on
>   * a bus as bitmask flags.
> @@ -697,14 +722,14 @@ struct drm_display_info {
>  	/**
>  	 * @subpixel_order: Subpixel order of LCD panels.
>  	 */
>  	enum subpixel_order subpixel_order;
> =20
> -#define DRM_COLOR_FORMAT_RGB444		(1<<0)
> -#define DRM_COLOR_FORMAT_YCBCR444	(1<<1)
> -#define DRM_COLOR_FORMAT_YCBCR422	(1<<2)
> -#define DRM_COLOR_FORMAT_YCBCR420	(1<<3)
> +#define DRM_COLOR_FORMAT_RGB444		(1 << DRM_OUTPUT_COLOR_FORMAT_RGB444)
> +#define DRM_COLOR_FORMAT_YCBCR444	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR444=
)
> +#define DRM_COLOR_FORMAT_YCBCR422	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR422=
)
> +#define DRM_COLOR_FORMAT_YCBCR420	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR420=
)

Can we move this? Either up, directly after drm_output_color_format, or
down, directly before color_formats.

I think 8d70f395e6cb ("drm: Add support for a panel-orientation
connector property, v6") didn't separate the two on purpose.

>  	/**
>  	 * @panel_orientation: Read only connector property for built-in panels=
,
>  	 * indicating the orientation of the panel vs the device's casing.
>  	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN=
.
> @@ -712,14 +737,15 @@ struct drm_display_info {
>  	 * fb to compensate and gets exported as prop to userspace.
>  	 */
>  	int panel_orientation;
> =20
>  	/**
> -	 * @color_formats: HDMI Color formats, selects between RGB and YCrCb
> -	 * modes. Used DRM_COLOR_FORMAT\_ defines, which are _not_ the same one=
s
> -	 * as used to describe the pixel format in framebuffers, and also don't
> -	 * match the formats in @bus_formats which are shared with v4l.
> +	 * @color_formats: HDMI Color formats, selects between RGB and
> +	 * YCrCb modes. Uses a bitmask of DRM_OUTPUT_COLOR_FORMAT\_

Maybe s/YCrCb/YCbCr/ for consistency?

> +	 * defines, which are _not_ the same ones as used to describe
> +	 * the pixel format in framebuffers, and also don't match the
> +	 * formats in @bus_formats which are shared with v4l.
>  	 */
>  	u32 color_formats;
> =20
>  	/**
>  	 * @bus_formats: Pixel data format on the wire, somewhat redundant with

regards
Philipp
