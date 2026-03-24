Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09343DB63A
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343393; cv=pass; b=B1UZ+zS7IjmRg+1MQ6aSZYlcbY0uNS8jPANyfTSegPtxSbZnso4FodPnuOHdgFuKMTLiOfoMTzrb02CnWUZvJFMdqtsSft9UqWvCC09sXxpDJ62BTazxzPBuMsDcNgdmXf5acu4yLTWE3qLjgacYS0Twr+/qGbCAAVbyBg5ocT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343393; c=relaxed/simple;
	bh=FxnHGXfgqe5VjtUaVLAzgWq8T3cy6uWjqLKMnRdPrZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ANMZ91JDvgR5wW0/+1Z0fQCVAyXq2JJGYUmLTxcz7WNyVAYw7el/tfHLb27+rxDG0OtIcCNRPKDAuMQruIu4p34XXqC97MkPii+YqEyA1m31yiwGpKvRdZtIouwWb34Qrhn/LbANX/3Mz+N0MIskma3b4aglcOI4/ai5UiD1IYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=NeRVdyX1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="NeRVdyX1"
ARC-Seal: i=1; a=rsa-sha256; t=1774343335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O0Hdz56be/8KaHfU9qnv3CO8OOJ1oPU1gv/AfF3/JP/4zwrnLAxuDF/FHcQ6sEr5QhZfMjhwOsw/8dylYbQKkyu3SQ5xdRTd02Fh3wb6cQJb9qqIVVXhWv+JYvoyEigRscSGqPq6YuV+57ecOwGUuKSGDriS4fqjSdPV9QC87ow=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774343335; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=joZ/1jdRFsPMk+xnPDVTFuNcjEEqbrkRjRzofTM5y0Q=; 
	b=Bkk073o7CGNuNgfxwcsSNmdXkqYpB9+yCsJgihwThSjtzCzaC4iPwvv5IyiW5UF04sy0odFUxXc71w+u2dvWgFKxS8I6f18fTjcVxFLJN1oWSRPb/jOPskxsY7ZfE3p0C7BC0M2RIqpsajThcey1eXbPO3jeSRTv4zfzwv/+pYU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774343335;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=joZ/1jdRFsPMk+xnPDVTFuNcjEEqbrkRjRzofTM5y0Q=;
	b=NeRVdyX1dTbevqzn5YIfXosyF0UznGO96JvhmesokmSGQWQI1PuKPJY5PxaBLNfk
	aO2qz4uWcrFf9eeiv0zzHeE41A0MOn5cZVCjzVpQuTlLI2mW1wbjo8h/W1GWtS2MYIz
	vBg6qJfzwjHSB6VC3nouwGENd1IUXhjC25DDdmwQ=
Received: by mx.zohomail.com with SMTPS id 1774343334007578.4758740983518;
	Tue, 24 Mar 2026 02:08:54 -0700 (PDT)
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
 Re: [PATCH v3 14/14] drm/display: hdmi: Use drm_output_color_format instead
 of hdmi_colorspace
Date: Tue, 24 Mar 2026 10:08:44 +0100
Message-ID: <3687080.mvXUDI8C0e@workhorse>
In-Reply-To: <20260305-drm-rework-color-formats-v3-14-f3935f6db579@kernel.org>
References:
 <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-14-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 5 March 2026 10:05:06 Central European Standard Time Maxime Ripard wrote:
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
>  drivers/gpu/drm/drm_connector.c                    |  16 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
>  drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
>  include/drm/bridge/dw_hdmi_qp.h                    |   2 +-
>  include/drm/display/drm_hdmi_helper.h              |   3 +-
>  include/drm/drm_bridge.h                           |   5 +-
>  include/drm/drm_connector.h                        |   9 +-
>  17 files changed, 213 insertions(+), 187 deletions(-)
> 

Since I've been relying this for a while now and could find no further
issues with the conversion, I'll give this a:

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thank you for the refactor!


