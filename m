Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979363793A8;
	Thu,  5 Mar 2026 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701535; cv=none; b=M83RMQTiRSrFFzMlXC0cw6AMqNoTqCMabsrKFzSyAG9vHguhIsn5l19o7VWlm+rEQditdPZGaYTery3XHdkIRu9bnXlKjtqN2nudjX+s0ce+hsSwTjbXm9gXw5mVKoJV2cvtSBFUr0Ck/BFLxOOT0NLqZGB9agv5cUx6/Y0QM4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701535; c=relaxed/simple;
	bh=skFI5P2haIGjdD0+W8BO9ttWB17k7eh3BIV8frGuT1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lb7KpNgUfhFJfeoPd9HLl1Nh+GX6TEzkr1SXt5ZWllebo5jhDc9kP5M2mY01qAFPMzcMZ+jviUutFEvZsRZUsE8mRrLXx62Df5mxQr/GqqocVIuw460lEAUDg7plcr0H8QKa0yVmQezkqYOKAeejhwy1eJ5jifSotGQoeTmKgMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bF4sJ2R3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bF4sJ2R3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DE4C116C6;
	Thu,  5 Mar 2026 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701535;
	bh=skFI5P2haIGjdD0+W8BO9ttWB17k7eh3BIV8frGuT1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bF4sJ2R3g6drItQMyUx0FiiZuCIqTLETK2ukzmc476ghhRR4QChpE1FU1IjZ5FmYH
	 gkKFIcmUS3np8smnw6+Wmu/YID4pOEyveFVhCbATnvZc2EjJVu2V1vpwwCmwOoklVn
	 IzHvhYq64l7d4pL5fC9oGHzuC9sD4Y1WeOvXRTtjaDtJeuShiA12Nq6jGg/DQ0Gf5E
	 DsVzAFCKqcffkeNgUwiSVuMMKeTxRabbw0EaNgfpGU8zcqfYx+ew5V9ocrxi/Yx9c5
	 x0oTq0/mEE1DAK/ZllEb8aJVRSh2m7yNtQugPF0kEKIUzrWGybxt3WyPA+KH7OAC/P
	 4e2XexvXEoTrw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:05:03 +0100
Subject: [PATCH v3 11/14] drm/mediatek: dp: Convert to
 drm_output_color_format
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-11-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376; i=mripard@kernel.org;
 h=from:subject:message-id; bh=skFI5P2haIGjdD0+W8BO9ttWB17k7eh3BIV8frGuT1I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3a35ckLMraXmTGBSrvYOvOW/o3y6TX77h69zD++/b
 qH3ToqnYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzksCtjQ5uc1jqjvQlXbu/6
 HO/JJuNuy3TA/POilA0Ots8WsJWmLRX29L++9MyfNUulvKxk/9uLM9aHGN7a/vayY9tExiVpxW6
 6v399z0hUya69eDVV8Fmi8lXFFerPLyuKG+9czGTbZvFo51sA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 08c4d64b87b944dbcf57294dc48c740a37374469..c52cc7c2e20063b9dcc99be46bc7de50d67b0d6b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2452,11 +2452,11 @@ static enum drm_mode_status
 mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
 			 const struct drm_display_info *info,
 			 const struct drm_display_mode *mode)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
-	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 : 24;
+	u32 bpp = info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) ? 16 : 24;
 	u32 lane_count_min = mtk_dp->train_info.lane_count;
 	u32 rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate) *
 		   lane_count_min;
 
 	/*
@@ -2519,11 +2519,11 @@ static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	 * datarate of YUV422 and sink device supports YUV422, we output YUV422
 	 * format. Use this condition, we can support more resolution.
 	 */
 	if (((rate * 97 / 100) < (mode->clock * 24 / 8)) &&
 	    ((rate * 97 / 100) > (mode->clock * 16 / 8)) &&
-	    (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+	    (display_info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))) {
 		input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
 		if (!input_fmts)
 			return NULL;
 		*num_input_fmts = 1;
 		input_fmts[0] = MEDIA_BUS_FMT_YUYV8_1X16;

-- 
2.53.0

