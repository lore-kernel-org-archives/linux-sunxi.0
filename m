Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB0362157
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770536; cv=none; b=e5ETtIUpkw+yxjCN+9YxMR7d5lndso+jxCy0qZfMvOPsLXaXKDF17bMglbub1uDTphYFt+bZlpD/POE1tya5/UOzH/THhVas/pd8FuAIU6pzGr5G20/ORhNvw/2aOwwjPAgPl2unUwIR/vBYwOBb4n4Ag5TKI38w+LEeD2EZW5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770536; c=relaxed/simple;
	bh=LYpIGWFeHlxx1fVwt8S006d+7lbpWnUBcfPCYM40698=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlkFf4hoR447YUdPF6i9qr0eTX3R8DAhg7P2AiZu7ZBRKrtb+i3COrrzzUGgsuH5Pu1upT5JbzrbJ1IXLpBbQFVbtNHiIjazRVy0Hxgbk1+tf124mL3lEp7qGbV0BDv9rARYozd9Lcztl/DQqWisPnBk2vhQ9Q/6aIX/h3/3t2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MU/4B/nd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MU/4B/nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770529;
	bh=LYpIGWFeHlxx1fVwt8S006d+7lbpWnUBcfPCYM40698=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MU/4B/ndGHGqa8IAlmRcoXOwNXpyLqEZ54uk8VBK9JgCKjoaopYQairCb6JSdKRwp
	 2EvObD75dJQzrtb8ozO0Ml/Bp2+LXegfjibw5265DRsPl6EvPtLpVXcZq8hPLZ7LkV
	 OrnqOMgsqu5tV0soFnoQew6zlexYOtwxq6JsCJdVgM1LZB4Gjp62zDxs6thp0/tQtY
	 a7ES+iiCMvHBwAMsVjjCI2OqQSkJU2ZrQ1rhOiscH9skjCorKcYT+LUwboON9yyczZ
	 vmkTvzW2jCQ906c0FnPS3+f7dnZhDY17hC84BYYdo/4i4ehEteie+/LB5WQNeOunKB
	 KdO+cNJ62NY7g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F0EE17E1313;
	Thu, 23 Jul 2026 03:35:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:28 +0300
Subject: [PATCH v9 39/61] drm/vc4: hdmi: Defer pixel clock validation to
 HDMI helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-39-4fb12ea22ac9@collabora.com>
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

drm_atomic_helper_connector_hdmi_check() rejects modes whose computed
TMDS character rate exceeds the connector limit before invoking the
driver's .tmds_char_rate_valid() hook.

BCM2835 is capped at 162 MHz, slightly below the 165 MHz limit of HDMI
1.2.  Set supported_tmds_char_rate in vc4_hdmi_connector_funcs_hdmi10 so
that the limit inferred from supported_hdmi_ver is overridden by the
lower hardware constraint.  All other chip variants rely on the standard
HDMI 1.4/2.0 limits, so the default validation suffices.

This allows vc4_hdmi_connector_clock_valid() to be simplified by
dropping the now-redundant max_pixel_clock field from struct
vc4_hdmi_variant.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +---------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ---
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8e5676c5527e..5370d585cd28 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1528,12 +1528,8 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 			       const struct drm_display_mode *mode,
 			       unsigned long long clock)
 {
-	const struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
 
-	if (clock > vc4_hdmi->variant->max_pixel_clock)
-		return MODE_CLOCK_HIGH;
-
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
 		return MODE_CLOCK_HIGH;
 
@@ -1578,6 +1574,7 @@ static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi12 = {
 	VC4_HDMI_CONNECTOR_FUNCS_COMMON,
 	.max_bpc		= 8,
 	.supported_hdmi_ver	= HDMI_VERSION_1_2,
+	.supported_tmds_char_rate = 162000000,
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi14 = {
@@ -3184,7 +3181,6 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi_regs",
 	.card_name		= "vc4-hdmi",
-	.max_pixel_clock	= 162000000,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
@@ -3204,7 +3200,6 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3233,7 +3228,6 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
@@ -3262,7 +3256,6 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3289,7 +3282,6 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index f6159c9e6144..61486e7b4ba2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -29,9 +29,6 @@ struct vc4_hdmi_variant {
 	/* Filename to expose the registers in debugfs */
 	const char *debugfs_name;
 
-	/* Maximum pixel clock supported by the controller (in Hz) */
-	unsigned long long max_pixel_clock;
-
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 

-- 
2.55.0

