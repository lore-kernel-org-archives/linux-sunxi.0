Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95035E937
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770532; cv=none; b=ck42Ll3RVlN0NCZiiUei8LQhkJR+FAUQKw6N4WrFR2VCrmu5ncNozqo+NTthaAoh2Mumw8fqvPa1qQHQZpf4KO992BVyA+VidlR+wFujvw2cIDGBAuPeA3FMo/+X6RKPiKnXAWkEuKBt6Ch8+48ZN53JdCqp1WMiSUb7VlGO3NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770532; c=relaxed/simple;
	bh=ptUAjF1127mEgfk7SCHZSYCvO19aORum+b47Rqqbm5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlvbmjjIrqqjFnUO7juvlhkvAh3kzJXOGYszcG8yr0BgIIhD6cXdjNzW1YS4cJy+FWlvMPArJpPeLg7YUrAvDQD7iQ2QpJDzUSZVcnnwqL/O6MotYwMNB3mp6sE7TBVEEIJJcV7RdpUUr+b3RDxJaHlemal9KfCe1R7lcXwllhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UByC9lYN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UByC9lYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770528;
	bh=ptUAjF1127mEgfk7SCHZSYCvO19aORum+b47Rqqbm5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UByC9lYN9/xayCQDNKsHk6QnaPOTyZRqZmFivytHB+AkCmA0lr57nbUFcPLkGNSeQ
	 8syzJo0XR/Ih4axdoIQDOl1YCHTxW+EIDx7wjqYsMU5R6mcEolvwSAg2/rMFUlWHbc
	 sM7/vv3S6xY2KSeHPi1qBkG9qcEtII0gBV9048UljN41F4M4wousme8NdLIA3xbS4A
	 5JSELifSUsE+4XhBN7iZQefaxBG5BnDLKaGFjp0x2P1EZRHoDSnbXRTAdmevgtlMq9
	 i4tRLRBcCGuVflgLlCR8Qvo26//gmzexGHZc2FTaPRK3bVGrclsk3mVYtrhyJwp//C
	 8N2GW7XpAXVxA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA48F17E151D;
	Thu, 23 Jul 2026 03:35:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:26 +0300
Subject: [PATCH v9 37/61] drm/vc4: hdmi: Convert to
 drmm_connector_hdmi_init()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-37-4fb12ea22ac9@collabora.com>
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

Switch driver over to the new drmm_connector_hdmi_init() signature. The
vendor, product, supported_formats and max_bpc values previously passed
as arguments are now provided through struct drm_connector_hdmi_funcs,
together with the new supported_hdmi_ver field.

VC4 needs three distinct capability sets, based on the maximum TMDS
character rate and color depth supported by each controller variant:

  RPi 0-3:              162 MHz (HDMI 1.2),  8-bit
  RPi 4 (HDMI1):        340 MHz (HDMI 1.4), 12-bit
  RPi 4 (HDMI0), RPi 5: 600 MHz (HDMI 2.0), 12-bit

Introduce three drm_connector_hdmi_funcs instances for these tiers and
assign them to the corresponding vc4_hdmi_variant entries. Additionally,
drop the now redundant .supports_hdr field of struct vc4_hdmi_variant.

As the callback members are identical across all three, factor the
shared initializers into a VC4_HDMI_CONNECTOR_FUNCS_COMMON macro to
avoid duplication, with each variant adding only its distinguishing
max_bpc/supported_hdmi_ver fields.

Note that HDMI 2.0 cannot be advertised at this point, since it requires
converting the driver to common scrambling infrastructure. This will be
handled separately, hence temporarily use HDMI_VERSION_UNKNOWN for the
related hdmi_funcs instance to skip generic scrambler and TMDS rate
validation, and continue to rely on current driver-local implementation.

No functional change intended.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 93 ++++++++++++++++++++++++------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 +--
 2 files changed, 56 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 75a251530970..99b233af3c7b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -509,7 +509,6 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.mode_valid = drm_hdmi_connector_mode_valid,
 };
 
-static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
 static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
@@ -517,22 +516,13 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
-	unsigned int max_bpc = 8;
 	int ret;
 
-	if (vc4_hdmi->variant->supports_hdr)
-		max_bpc = 12;
-
-	ret = drmm_connector_hdmi_ini2(dev, connector,
-				       "Broadcom", "Videocore",
+	ret = drmm_connector_hdmi_init(dev, connector,
 				       &vc4_hdmi_connector_funcs,
-				       &vc4_hdmi_hdmi_connector_funcs,
+				       vc4_hdmi->variant->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       vc4_hdmi->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444),
-				       max_bpc);
+				       vc4_hdmi->ddc);
 	if (ret)
 		return ret;
 
@@ -1721,28 +1711,51 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_OK;
 }
 
-static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
-	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
-	.avi = {
-		.clear_infoframe = vc4_hdmi_clear_avi_infoframe,
-		.write_infoframe = vc4_hdmi_write_avi_infoframe,
-	},
-	.hdmi = {
-		.clear_infoframe = vc4_hdmi_clear_hdmi_infoframe,
-		.write_infoframe = vc4_hdmi_write_hdmi_infoframe,
-	},
-	.audio = {
-		.clear_infoframe = vc4_hdmi_clear_audio_infoframe,
-		.write_infoframe = vc4_hdmi_write_audio_infoframe,
-	},
-	.hdr_drm = {
-		.clear_infoframe = vc4_hdmi_clear_hdr_drm_infoframe,
-		.write_infoframe = vc4_hdmi_write_hdr_drm_infoframe,
-	},
-	.spd = {
-		.clear_infoframe = vc4_hdmi_clear_spd_infoframe,
-		.write_infoframe = vc4_hdmi_write_spd_infoframe,
-	},
+#define VC4_HDMI_CONNECTOR_FUNCS_COMMON						\
+	.vendor			 = "Broadcom",					\
+	.product		 = "Videocore",					\
+	.supported_formats	 = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |	\
+				   BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |	\
+				   BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444),	\
+	.tmds_char_rate_valid	 = vc4_hdmi_connector_clock_valid,		\
+	.avi = {								\
+		.clear_infoframe = vc4_hdmi_clear_avi_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_avi_infoframe,		\
+	},									\
+	.hdmi = {								\
+		.clear_infoframe = vc4_hdmi_clear_hdmi_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_hdmi_infoframe,		\
+	},									\
+	.audio = {								\
+		.clear_infoframe = vc4_hdmi_clear_audio_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_audio_infoframe,		\
+	},									\
+	.hdr_drm = {								\
+		.clear_infoframe = vc4_hdmi_clear_hdr_drm_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_hdr_drm_infoframe,		\
+	},									\
+	.spd = {								\
+		.clear_infoframe = vc4_hdmi_clear_spd_infoframe,		\
+		.write_infoframe = vc4_hdmi_write_spd_infoframe,		\
+	}
+
+static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi12 = {
+	VC4_HDMI_CONNECTOR_FUNCS_COMMON,
+	.max_bpc		= 8,
+	.supported_hdmi_ver	= HDMI_VERSION_1_2,
+};
+
+static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi14 = {
+	VC4_HDMI_CONNECTOR_FUNCS_COMMON,
+	.max_bpc		= 12,
+	.supported_hdmi_ver	= HDMI_VERSION_1_4,
+};
+
+static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi20 = {
+	VC4_HDMI_CONNECTOR_FUNCS_COMMON,
+	.max_bpc		= 12,
+	/* TODO: set HDMI_VERSION_2_0 and convert to common scrambler infra */
+	.supported_hdmi_ver	= HDMI_VERSION_UNKNOWN,
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
@@ -3358,7 +3371,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc4_hdmi_phy_rng_disable,
 	.channel_map		= vc4_hdmi_channel_map,
-	.supports_hdr		= false,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi12,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
@@ -3386,8 +3399,8 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
-	.supports_hdr		= true,
 	.hp_detect		= vc5_hdmi_hp_detect,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi20,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
@@ -3415,8 +3428,8 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
-	.supports_hdr		= true,
 	.hp_detect		= vc5_hdmi_hp_detect,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi14,
 };
 
 static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
@@ -3442,8 +3455,8 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.phy_init		= vc6_hdmi_phy_init,
 	.phy_disable		= vc6_hdmi_phy_disable,
 	.channel_map		= vc5_hdmi_channel_map,
-	.supports_hdr		= true,
 	.hp_detect		= vc5_hdmi_hp_detect,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi20,
 };
 
 static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
@@ -3469,8 +3482,8 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
 	.phy_init		= vc6_hdmi_phy_init,
 	.phy_disable		= vc6_hdmi_phy_disable,
 	.channel_map		= vc5_hdmi_channel_map,
-	.supports_hdr		= true,
 	.hp_detect		= vc5_hdmi_hp_detect,
+	.hdmi_funcs		= &vc4_hdmi_connector_funcs_hdmi20,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 29d461d4ee49..d5ffcc17de32 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -90,11 +90,11 @@ struct vc4_hdmi_variant {
 	/* Callback to get channel map */
 	u32 (*channel_map)(struct vc4_hdmi *vc4_hdmi, u32 channel_mask);
 
-	/* Enables HDR metadata */
-	bool supports_hdr;
-
 	/* Callback for hardware specific hotplug detect */
 	bool (*hp_detect)(struct vc4_hdmi *vc4_hdmi);
+
+	/* HDMI-related connector callbacks and controller capabilities */
+	const struct drm_connector_hdmi_funcs *hdmi_funcs;
 };
 
 /* HDMI audio information */

-- 
2.55.0

