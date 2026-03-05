Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0137649E;
	Thu,  5 Mar 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701530; cv=none; b=gco8Au0zKl/3jiycUCqJftQd2FW/u4CPCAUJiwLSoKXkJmS5eYVpvuHHFz0llE32yNXjnGB9KHd95zFD4skIYAz8/Tfiklnp04egRLHXEy3GLqthJcQ70tHaQruqlY6FtX3LBmUGvYZwjkaUbCwJffB0lSTN+gPq7WrfJqfbxdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701530; c=relaxed/simple;
	bh=pmuV9XT5xz4TIGCX33nAahI5S0bV94XYGEmoM0J00kE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuVkZKpDTiQJSYV1moI3AIncGT5L6X83EwZ4M5+4or0kVpNhLA9zYe2JMdq/u4kK81PmUEvIZbsqXzXRaP5azc0hn/sckUW43gt9+5WgRSFp4P4pmTBM1g/0C/tOLyNcfpyQMN1pkQz9Wfe6N93EM+2W8buHAoXStGsOFwzgMEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jC4+HHcu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jC4+HHcu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24164C116C6;
	Thu,  5 Mar 2026 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701529;
	bh=pmuV9XT5xz4TIGCX33nAahI5S0bV94XYGEmoM0J00kE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jC4+HHcuntcj30yBeEVQDbJX3a3dAd9y5IWsKthessjg7RHnQEqjw2M+og+ij1/sn
	 WQOlvUJ9PjW9OnbFtkpWT9E63UNHfKjuBeZsDjXNTCG2T2ckGQ4ooEygXFaVqXs+ki
	 dV5yrJefX/M4rtvoXA2z7M1PBehVHns8m/CtIOFNvRLqW8iVS87+iCu4WqJEPcIqk/
	 ysB6L9Z3Z7suwqesUI9jHaF/Ur1xtYJQI+TDgkee+ff+bDQxO6T/kraorvO1K72hOD
	 qI5qBSaR8kVKofSm068dRkk/Zz8clPJpTwoZeif8mo1f05AubwAmgVZ1Hn2cT48myl
	 EoW+kqiNGFsgw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:05:01 +0100
Subject: [PATCH v3 09/14] drm/bridge: synopsys: dw-hdmi: Convert to
 drm_output_color_format
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-9-f3935f6db579@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pmuV9XT5xz4TIGCX33nAahI5S0bV94XYGEmoM0J00kE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3a2kPVZY9ibPfcBY5r9ATHlhts9q4Tcsjg8v7LvIv
 PWsWMjZjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARnomMdTa9L/ySirxdT05R
 vew7ZX3ETJb8pDM+Hx7vuP37afasXW4fJld+/D6Z46H9Saa0RKuwJsb6gom3uPkcJfrOP72eG2c
 w6Xj2pWv+kZUGjpNiOjrXH74sWfvFZKtt/A/lJwLL1Gv/FD0HAA==
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ee88c0e793b0416d20105a43448cb4037402e64b..0296e110ce65ffc284e120f4e3f92052474e83e5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2662,11 +2662,11 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_display_info *info = &conn->display_info;
 	struct drm_display_mode *mode = &crtc_state->mode;
 	u8 max_bpc = conn_state->max_requested_bpc;
 	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
-			     (info->color_formats & DRM_COLOR_FORMAT_YCBCR420);
+			     (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420));
 	u32 *output_fmts;
 	unsigned int i = 0;
 
 	*num_output_fmts = 0;
 
@@ -2721,40 +2721,40 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 
 	/* Default 8bit RGB fallback */
 	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
 
 	if (max_bpc >= 16 && info->bpc == 16) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
 	}
 
 	if (max_bpc >= 12 && info->bpc >= 12) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
 	}
 
 	if (max_bpc >= 10 && info->bpc >= 10) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
 	*num_output_fmts = i;
 
 	return output_fmts;

-- 
2.53.0

