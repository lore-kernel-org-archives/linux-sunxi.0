Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFF6363C46
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770534; cv=none; b=U7veKJM/6t16sjsTLgVEMmpuUzfxg5USsP3dYmwlMvHihg7556OC8/VWBAXoeP8tO3uBRTTn0qxjYItV/DbSbV9M77MymJmKdlkeis7rAHgNhK4K1tq8u9VXGqQF2+yCaxuoQt78SBItzf8pm0YScGXaguwXddExqjKBl9GS2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770534; c=relaxed/simple;
	bh=LGoScTjZlmWz4kuA8xsClhLFJWNZkG2SOg+rDjY0yKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNirs7xZYmvdrc8UraRIACxVL1B+lSeFWrrofMgi549uK8s2iMcI4O9mDbsE49wzJfplQekQUTYCriWNgegp8M9S0XIHICMl+ulmYGashOwaqvxhBh7PZA9chPvY8HDat0eeX9xMAxFK+CVrEls7EnlFm5d0x+msXOM/vjDEV1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gO44nWrL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gO44nWrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770530;
	bh=LGoScTjZlmWz4kuA8xsClhLFJWNZkG2SOg+rDjY0yKU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gO44nWrLqkInoD0RkyMU4DQx0MWgya57Ldx+4tsYJn/JiJmG0n2A6J24zxm5l9Yiv
	 l54jxgTGjqWzWOAxmtpR6Kx+Pe/RRNepI302augIvViI2MeHJWgDVDAMkWwS/u/uJ8
	 MJu3O4RY6guqcf0Hmg/3HYqBXnYv4ZhAuzdBWmL4xMtoKeC1d8ZOXR6SLLe1NqbUoW
	 jW6f5eilWQs9jGeGF+YPFzUWj6yTP5ekXRBAZoTSlfqBWLCM3VUa0P0W5IjIqFs4ha
	 PlF0HT3TaS70UYAjbxdu0RAV4FN4TRAlEPJE7EfZO77J7r9OOZKnxErQcZ5R3YKeMc
	 5Cmt+2q5zAS2Q==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E513B17E124A;
	Thu, 23 Jul 2026 03:35:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:29 +0300
Subject: [PATCH v9 40/61] drm/bridge: adv7511: Advertise HDMI 1.2
 capabilities
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-40-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

Since max_mode_clock_khz does not exceed 165 MHz for any of the chip
variants handled by the driver, advertise HDMI 1.2 as the supported
version and set the bridge's max_tmds_char_rate so the connector limit
inferred from supported_hdmi_ver is overridden by the chip-specific
hardware constraints.

drm_bridge_connector_atomic_check() runs
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector limit before invoking
the driver's .tmds_char_rate_valid() hook, making
adv7511_bridge_hdmi_tmds_char_rate_valid() redundant. Drop it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index db99e252aeeb..ac50b24b4c38 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/slab.h>
@@ -775,11 +776,6 @@ static int adv7511_connector_init(struct adv7511 *adv)
  * DRM Bridge Operations
  */
 
-static const struct adv7511 *bridge_to_adv7511_const(const struct drm_bridge *bridge)
-{
-	return container_of(bridge, struct adv7511, bridge);
-}
-
 static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_commit *state)
 {
@@ -817,19 +813,6 @@ static void adv7511_bridge_atomic_disable(struct drm_bridge *bridge,
 	adv7511_power_off(adv);
 }
 
-static enum drm_mode_status
-adv7511_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-					 const struct drm_display_mode *mode,
-					 unsigned long long tmds_rate)
-{
-	const struct adv7511 *adv = bridge_to_adv7511_const(bridge);
-
-	if (tmds_rate > 1000ULL * adv->info->max_mode_clock_khz)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 						      const struct drm_display_info *info,
 		const struct drm_display_mode *mode)
@@ -1006,7 +989,6 @@ static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 
-	.hdmi_tmds_char_rate_valid = adv7511_bridge_hdmi_tmds_char_rate_valid,
 	.hdmi_clear_audio_infoframe = adv7511_bridge_hdmi_clear_audio_infoframe,
 	.hdmi_write_audio_infoframe = adv7511_bridge_hdmi_write_audio_infoframe,
 	.hdmi_clear_avi_infoframe = adv7511_bridge_hdmi_clear_avi_infoframe,
@@ -1359,6 +1341,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_hdmi_ver = HDMI_VERSION_1_2;
+	adv7511->bridge.max_tmds_char_rate = 1000ULL * adv7511->info->max_mode_clock_khz;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.55.0

