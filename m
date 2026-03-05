Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11A377005;
	Thu,  5 Mar 2026 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701509; cv=none; b=EOKFeyhjrYvhN1suhl/DITE0I+g0kOJfUFVxX40/M4rnfIOIkZE3xYY+Xnlj3MduCHr76zAEJDnNzK72l7HzBcc94WURLMlauuXceZiB4nUn3oR2v/qUR2VRQBfAmVMAw+rRk6BQH3dsVQIwwDBbeg8YtVZFOm75xEZ/cahI98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701509; c=relaxed/simple;
	bh=Ll7vX0iwBqlcAulvUYDlg1AF0/cayK4xOYfyyHaI++E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/O93Kf/M/leb7ij0XhKVfUyGKc4dSUgIDu46r8cfr36VBDo6Mt282t5fcMYuITUvcMZnAcXPHMti6K3yYE/LOTrNCEIa/1s7gC6sFFkksVJzXBVwJOJJpYPLiOPi2jy8qf66eA/hooi2mz9QfBAmeUh6wxMfgsIhxBgIPGRQtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnSgtYuJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnSgtYuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7862C2BCB2;
	Thu,  5 Mar 2026 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701509;
	bh=Ll7vX0iwBqlcAulvUYDlg1AF0/cayK4xOYfyyHaI++E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lnSgtYuJJtg3IXuD0bcarNYHq4jV7do9cEExTj4hXU9vBiIhA9W/sC/Q4HdBa1uOf
	 T04hNZoGYRxY78DIdKdQiJGOSDawfx/wjgxdkS/8wCmZAZMy7DJASFntpQF8XD2wa0
	 IYEMcMb/tC12kSFfgemeMawDGVdmDPxtEK8evUfeGxuxwPEyXSCKMFinPMZndvp2tn
	 bzxkySHACTB2dHZ7FXWdzbpKZdrHZy1zYrHUVJAg2U3Fy64Kn0WzDpUdPoBmTJ0kds
	 NQsq0zUXGkbW2kKbZ8hR6TaAGHduG7Bzw9tKsWS3oOzirYbeW4z3geXLUh48l0tJ3o
	 lPKBjZnIfNBuA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:04:54 +0100
Subject: [PATCH v3 02/14] drm/edid: Convert to drm_output_color_format enum
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-2-f3935f6db579@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4310; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ll7vX0iwBqlcAulvUYDlg1AF0/cayK4xOYfyyHaI++E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3c1fP0m4lROx8rSsPncYk7J1h8qT9fEsr9bN/FH5R
 ftwn0Bix1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIeRFjrdT06klTYu/1WTt0
 sc7U0VPnXL7DgMdA4uhaUWllzynuFYGKT5m2Mx70bT+4UO2RRpsiY32xtHaZmG+J/eb58+aYhvJ
 XrZJ2Pah1vPRVv/er22dW3y/hfSexRJP3tWOS8i8Vva1HzAA=
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

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ff432ac6b5692d9178f4bfab039d2e52af68e952..5f9fcd7d9ce45d5b892077b7e7e78fed4aa88499 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5314,11 +5314,11 @@ static void parse_cta_y420cmdb(struct drm_connector *connector,
 	for (i = 0; i < map_len; i++)
 		map |= (u64)data[i] << (8 * i);
 
 out:
 	if (map)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
+		info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	*y420cmdb_map = map;
 }
 
 static int add_cea_modes(struct drm_connector *connector,
@@ -6090,11 +6090,11 @@ static void parse_cta_y420vdb(struct drm_connector *connector,
 
 		if (!drm_valid_cea_vic(vic))
 			continue;
 
 		bitmap_set(hdmi->y420_vdb_modes, vic, 1);
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
+		info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 	}
 }
 
 static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
@@ -6424,15 +6424,15 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 				    "[CONNECTOR:%d:%s] CEA extension version mismatch %u != %u\n",
 				    connector->base.id, connector->name,
 				    info->cea_rev, edid_ext[1]);
 
 		/* The existence of a CTA extension should imply RGB support */
-		info->color_formats = DRM_COLOR_FORMAT_RGB444;
+		info->color_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 		if (edid_ext[3] & EDID_CEA_YCRCB444)
-			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
+			info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444);
 		if (edid_ext[3] & EDID_CEA_YCRCB422)
-			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+			info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 		if (edid_ext[3] & EDID_BASIC_AUDIO)
 			info->has_audio = true;
 
 	}
 	drm_edid_iter_end(&edid_iter);
@@ -6696,11 +6696,11 @@ static void update_display_info(struct drm_connector *connector,
 		goto out;
 
 	if (!drm_edid_is_digital(drm_edid))
 		goto out;
 
-	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
+	info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 	drm_parse_cea_ext(connector, drm_edid);
 
 	update_displayid_info(connector, drm_edid);
 
 	/*
@@ -6750,13 +6750,13 @@ static void update_display_info(struct drm_connector *connector,
 	drm_dbg_kms(connector->dev,
 		    "[CONNECTOR:%d:%s] Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
 		    connector->base.id, connector->name, info->bpc);
 
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
+		info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444);
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+		info->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 
 	drm_update_mso(connector, drm_edid);
 
 out:
 	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
@@ -7227,11 +7227,11 @@ static bool is_hdmi2_sink(const struct drm_connector *connector)
 	 */
 	if (!connector)
 		return true;
 
 	return connector->display_info.hdmi.scdc.supported ||
-		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
+		connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 }
 
 static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {

-- 
2.53.0

