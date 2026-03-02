Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71E33FFAB6
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Mar 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467897; cv=pass; b=W279AnDiMTkDAHtqAerZV2FaEd8j0zygUotw3UGNaLhL5YEq+UNirlbAYY2SGFaqtqcWJfF8WLnzflJQ9QntQdZTOeQLKN5trkLwzdaNv7z8UbXwaZGW6Mq79v+VpcrWOAhsshpJGvdzBKMg9Za2R1mnf4KKvOoDRvmS8k9jRRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467897; c=relaxed/simple;
	bh=XlJbvwNteTeQ3cMMMWCXzRs3QEn4XBRBRn65MbzmVLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nj9DIyq8cuuOffqQt304CWT2yof0bdCkKW14e403Mo44a5FGd33cqRaHm5qaFdZgfCCZMQW5uQAFzVnFXItaHxwIUJhmeB5OysyriTmYw+HEfJmfGF65ozJPxAU7YMsOwtel4cqXIsGZsm7OOCKUHYBzci0nq7UPWf9qKHm9Q/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=W0F/s1WV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="W0F/s1WV"
ARC-Seal: i=1; a=rsa-sha256; t=1772467825; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JXcnLJWgLCF+YZoorFdBR1yAwjY7LGAS1wsZttwSZ7OX1N8/tnJuRhgJ+frB9Q4b6lfq6qMedTrSlMEU0sGgxTyLFOvcWCVEFFb2d7R3YdZGhKZTR/jPT5rJdYY3mxQxVtAR7qnensaRyP+gChcl9H3hdJAEAS6X/GfVjtSeshI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772467825; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w7U2i7wNnzNewzg0HZ0VM12VPokXKDs53EuGg6YDrv8=; 
	b=SQsvFxkGjCOpd7AR/Pg3XOdD9HKqPhI4gLsvZbyx5J/H/xqlfcr1VbYYjBddL2YeSvaT/AV6AeOR2BFX+17Pe1UHRHufhxgqho1yhn6vXQj+llmafnzH3fKftx5V0gU+97otl0p1YJKSCULW73P8EG4ZLbp9FMXu+pvWGIzxzvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772467825;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=w7U2i7wNnzNewzg0HZ0VM12VPokXKDs53EuGg6YDrv8=;
	b=W0F/s1WVOicRqRRlh5k5bS16DecRt/X1lliwR6v9bihZZKydDIaE9AyHGcfVgqOl
	DvAw1wWZ42oww1fu25LhPzUbERsubMtUdY7LsGOtMzSepxHtaknXKw8XPpJIsvcOnzc
	wcoHVxy/hBVsZb7ebXFaIeFPF7bsc7pFw7l7IamY=
Received: by mx.zohomail.com with SMTPS id 1772467823906968.5878195359694;
	Mon, 2 Mar 2026 08:10:23 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject:
 Re: [PATCH v2 14/14] drm/display: hdmi: Use drm_output_color_format instead
 of hdmi_colorspace
Date: Mon, 02 Mar 2026 17:10:13 +0100
Message-ID: <5970802.DvuYhMxLoT@workhorse>
In-Reply-To: <20260227-drm-rework-color-formats-v2-14-8bd278e2af9d@kernel.org>
References:
 <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
 <20260227-drm-rework-color-formats-v2-14-8bd278e2af9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 27 February 2026 14:59:58 Central European Standard Time Maxime Ripard wrote:
> The hdmi_colorspace enum was defined to represent the colorspace value
> of the HDMI infoframes. It was later used by some HDMI drivers to
> express the output format they should be setting up.
> 
> During the introduction of the HDMI helpers, it then was used to
> represent it in the drm_connector_hdmi_state structure.
> 
> However, it's always been somewhat redundant with the DRM_COLOR_FORMAT_*
> defines, and now with the drm_output_color_format enum. Let's
> consolidate around drm_output_color_format in drm_connector_hdmi_state
> to facilitate the current effort to provide a global output format
> selection mechanism.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
>  drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
>  drivers/gpu/drm/display/drm_bridge_connector.c     |   4 +-
>  drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  52 ++++--
>  drivers/gpu/drm/drm_bridge.c                       |   2 +-
>  drivers/gpu/drm/drm_connector.c                    |  14 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
>  drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
>  include/drm/bridge/dw_hdmi_qp.h                    |   2 +-
>  include/drm/display/drm_hdmi_helper.h              |   3 +-
>  include/drm/drm_connector.h                        |   7 +-
>  16 files changed, 208 insertions(+), 183 deletions(-)
> 
> [... snip ...]
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index f686aa5c0ed9b84dbe5e0957df22d08aff2f1945..39cc18f78eda11ba35954f75315f646c0cb0d8e6 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -787,11 +787,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  {
>  	struct drm_bridge_connector *bridge_connector;
>  	struct drm_connector *connector;
>  	struct i2c_adapter *ddc = NULL;
>  	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
> -	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
> +	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  	unsigned int max_bpc = 8;
>  	bool support_hdcp = false;
>  	int connector_type;
>  	int ret;

Just noticed that we definitely also need to adjust the comment in
drm_bridge.h for drm_bridge::supported_formats. It still claims
it's a bitfield of HDMI_COLORSPACE_* values, but in this function,
gets assigned DRM_OUTPUT_COLOR_FORMAT values now.

Kind regards,
Nicolas Frattaroli

>  
> @@ -958,11 +958,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
>  		return ERR_PTR(-EINVAL);
>  
>  	if (bridge_connector->bridge_hdmi) {
>  		if (!connector->ycbcr_420_allowed)
> -			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
> +			supported_formats &= ~BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
>  
>  		bridge_connector->hdmi_funcs = drm_bridge_connector_hdmi_funcs;
>  
>  		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
>  			bridge_connector->hdmi_funcs.audio =
> [... snip ...]


