Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638C93A6B8F
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246897; cv=none; b=sKpfv7EzVTKX/b7pczkJ+LpUnphB1FYW8LtD+efdgUD96gg2de2rLFlkWZV9bdoY+2rMPt+KrCcRTCBEY7/9d100KZTYUQ1SpWH8URiVuC7Ga5mnEGwkVwToKe2M42C9SU6Qa+LuXcjx3AAQjA3jV4+iU68mOa0Ll5BHFY8/IxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246897; c=relaxed/simple;
	bh=VIVa48SIpA6zVOPSS8O6SLVXDjtd6I9Jk+9GWFqC30Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FqYBvohj/80CkpZXX2H1sTH2ukiH7zpV3vDVydTY6SIRlJeR8iU8DgMpR24JUAmKMZvnukQwh6qDL6wfniEPgBSYuHN6ZIJuhJcQrWqlNIZG9bNtmVE/d7/og9K+2rkfRWzimMrANtYLOT+XjV9RU6DPBJHHMqURjODAcWLWlq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnuMlThw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnuMlThw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso3222585e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782246894; x=1782851694; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5t3Yym7TNcn23mBBw6H+IPIGFaMcwRdXEZmNa7/R0B4=;
        b=GnuMlThwk7WLgUPeNTCM+Y1MhHQTI+IE/sO7dM1H9/SXY3T0xq++4qG9L/c6mte4ML
         3Sw6bSKk94uwWaYENY5GKxVfOunXE5jGaLPwadkaWacRPMtNj72YWnWSV7yoLONvFuNg
         KKIICcNKO+zoeME2l+HLnb9enBJ6gEeY+Q8XH6/dlXbqMm/EdR/LBaQ+ukI/cZUIYK6H
         ifRmwjYGJnJ1r9GpzeVTVTRNn9Wi1PuEnCsGI+YaELPKnrwIS6ohiznkCmmE5zexvc3w
         8Jq5U0AWDNncvpffPw30vHykwDsm3tr/zXgmibZ/mG/WqdTf/OQ9Vlsr7fsWRCVT13a9
         ZmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246894; x=1782851694;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t3Yym7TNcn23mBBw6H+IPIGFaMcwRdXEZmNa7/R0B4=;
        b=gfdPTtTLWQ0ZVGXb6yPQip/nYgIWGEBte5LU2obk2RYOMVR6T3nH2G3jPTNCOOl8RB
         Do4t91QK1YusL+sMAV2u+7r3HQksDm0q61I4xmpH+stAzhqWiZ8yYCKDQKNIcmAUD1NF
         drJxlVsnWHQRzQRn0g+mvxiyfwJoxBJwUgFp4HrNWkIModHZPb4mwGa++T+q5UdT/E8y
         P/sWmnQDluXgy8nXLm5AnwDpaKS0hCsCmUDx7hqkmeKALVHXuMBfv9AVcqPTaFtgf9DO
         Cnn2l+Fvx2C4/zZ3HUbg14yijb4K37Kxz25AUmnDFrk5JCcDJqxiptUAIiMRna+2pfAA
         Ewqg==
X-Forwarded-Encrypted: i=1; AFNElJ9DkGzCUF0qm2nVPKbwRG9MzsQBOthHryP3nWEONOYSaWXd+tToiGROJUjQgNOmkNgrh2CKzmf/PUSOng==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjACWPHH2Gk5h23pPbtKJBruEX7sUvetKRbQ8R5SiAdZRxwMsq
	kTC8zSSh+XymDDQ0nretQko3i2aa0b6CbZ1X1d1agBHGUmiLY7aAzDMj
X-Gm-Gg: AfdE7cm8VubLlONZZEccx7P2s4Aq8pH7LmetMKWDS1+EjDVQJ9lrK/TXQhjUSZ46pEf
	REbOXB2ZPq3dPAgUHuoYNwXpEZOZJsmoKRhWRKb9T4VUu+9+PH2NH5Bi7k4ayo5cPEaborVdM6l
	nP9XzqIf8TffQDTyJCuM2DM3zf5j06fzxJ8/6MEFMe98M4VvtxHfGjjb0lymICEQYEQmKF7ngsW
	/wEKkk9bEiC5gw3ccw/Ng+IkuXFmmoe7M/C6PToh9Wg22Yp8g/9uXpHxnHr7A4GOZnDILpOkS/q
	ayt11bZ6Y4awT/rIJVYWQ1hLwsH3q8w7g329GmhN7F38WP8i3mtGzPJUOYsCHHhgQGIireBh+r7
	SlewBx8gXt0ruVwV7Y4mxxSyEetzYZ5Oi3m40DtefGU5FSe4ah99D6wu6nDi78A+q0j45SgaUg5
	j9kwyj9kTV2ex6cfv7sz6O
X-Received: by 2002:a05:600c:34c2:b0:492:465a:7e5b with SMTP id 5b1f17b1804b1-4926087371bmr2714075e9.22.1782246893690;
        Tue, 23 Jun 2026 13:34:53 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd154fdsm374613865e9.1.2026.06.23.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:34:53 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 22:34:40 +0200
Subject: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN/tOmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNj3eLSPJPM+OLM3IKcVF0j02QzCwsL01RjU0sloJaCotS0zAqwcdG
 xtbUAyL0mhF4AAAA=
X-Change-ID: 20260623-sun4i_simple-25c68885e359
To: Chen-Yu Tsai <wens@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3

Simple KMS helper are deprecated since they only add an intermediate
layer between drivers and the atomic modesetting.
This patch removes the dependency on drm simple helpers from sun4i
DRM drivers.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c |  9 ++++++---
 drivers/gpu/drm/sun4i/sun4i_lvds.c     | 10 +++++++---
 drivers/gpu/drm/sun4i/sun4i_rgb.c      | 10 +++++++---
 drivers/gpu/drm/sun4i/sun4i_tv.c       | 10 +++++++---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +++++++---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  |  8 ++++++--
 6 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 8f64464621c9..e99f52ebb26f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -24,7 +24,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -172,6 +171,10 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder,
 	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
 }
 
+static const struct drm_encoder_funcs sun4i_hdmi_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs = {
 	.atomic_disable	= sun4i_hdmi_disable,
 	.atomic_enable	= sun4i_hdmi_enable,
@@ -624,8 +627,8 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&hdmi->encoder,
 			       &sun4i_hdmi_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm, &hdmi->encoder, &sun4i_hdmi_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the HDMI encoder\n");
 		goto err_put_ddc_i2c;
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 6716e895ae8a..35a3f987c37a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -8,11 +8,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -89,6 +89,10 @@ static void sun4i_lvds_encoder_disable(struct drm_encoder *encoder)
 	}
 }
 
+static const struct drm_encoder_funcs sun4i_lvds_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun4i_lvds_enc_helper_funcs = {
 	.disable	= sun4i_lvds_encoder_disable,
 	.enable		= sun4i_lvds_encoder_enable,
@@ -115,8 +119,8 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	drm_encoder_helper_add(&lvds->encoder,
 			       &sun4i_lvds_enc_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &lvds->encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(drm, &lvds->encoder, &sun4i_lvds_enc_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialise the lvds encoder\n");
 		goto err_out;
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index dfb6acc42f02..9c3fbf1b949e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -10,11 +10,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -180,6 +180,10 @@ static void sun4i_rgb_encoder_disable(struct drm_encoder *encoder)
 	}
 }
 
+static const struct drm_encoder_funcs sun4i_rgb_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun4i_rgb_enc_helper_funcs = {
 	.disable	= sun4i_rgb_encoder_disable,
 	.enable		= sun4i_rgb_encoder_enable,
@@ -207,8 +211,8 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	drm_encoder_helper_add(&rgb->encoder,
 			       &sun4i_rgb_enc_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &rgb->encoder,
-				      DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(drm, &rgb->encoder, &sun4i_rgb_enc_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialise the rgb encoder\n");
 		goto err_out;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 814b77f278f6..ce22f1662c0c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -16,11 +16,11 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_drv.h"
@@ -391,6 +391,10 @@ static void sun4i_tv_enable(struct drm_encoder *encoder,
 			   SUN4I_TVE_EN_ENABLE);
 }
 
+static const struct drm_encoder_funcs sun4i_tv_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 	.atomic_disable	= sun4i_tv_disable,
 	.atomic_enable	= sun4i_tv_enable,
@@ -474,8 +478,8 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&tv->encoder,
 			       &sun4i_tv_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &tv->encoder,
-				      DRM_MODE_ENCODER_TVDAC);
+	ret = drm_encoder_init(drm, &tv->encoder, &sun4i_tv_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the TV encoder\n");
 		goto err_disable_clk;
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c35b70d83e53..f0c9f0e573d2 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -20,11 +20,11 @@
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -842,6 +842,10 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
+static const struct drm_encoder_funcs sun6i_dsi_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
 	.disable	= sun6i_dsi_encoder_disable,
 	.enable		= sun6i_dsi_encoder_enable,
@@ -1056,8 +1060,8 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm, &dsi->encoder, &sun6i_dsi_enc_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		dev_err(dsi->dev, "Couldn't initialise the DSI encoder\n");
 		return ret;
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 96532709c2a7..9694ad142a7d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -9,8 +9,8 @@
 #include <linux/platform_device.h>
 
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun8i_dw_hdmi.h"
 #include "sun8i_tcon_top.h"
@@ -23,6 +23,9 @@ static void sun8i_dw_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 
 	clk_set_rate(hdmi->clk_tmds, mode->crtc_clock * 1000);
 }
+static const struct drm_encoder_funcs sun8i_dw_hdmi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
 
 static const struct drm_encoder_helper_funcs
 sun8i_dw_hdmi_encoder_helper_funcs = {
@@ -180,7 +183,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk_tmds;
 
 	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	plat_data->mode_valid = hdmi->quirks->mode_valid;
 	plat_data->use_drm_infoframe = hdmi->quirks->use_drm_infoframe;

---
base-commit: e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd
change-id: 20260623-sun4i_simple-25c68885e359

Best regards,
-- 
Diogo Silva <diogompaissilva@gmail.com>

