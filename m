Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D29C2598
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:50:11 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-946a769ae5cso266233466b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681116610; x=1683708610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1PPutowbE1ddcNuSAkCSkroxKYobdEeWd9KbxPUEEU=;
        b=LGokBRfwoSyZtR+ih01/in6zmOZnvXuD0gRgan30Ovo+XaSic5WzY5NP0OsgxDn2BD
         AQFQUcqrQGq4Y4LxFytV9jBA+GuNfiKUMpcHpw8SY+VcyHINzPe7SZuN1CRF4KdQtYci
         1zbPaxCZQgEletquEAe90/xgnK4r7T51t4hs2NEloEKXpbjRj94RMFM9nBDsM0U10Gbj
         cL3SNK11tuZF2nvLlVNm19bOmr6Meku4x7yt7EEvnlPnM0tR8Rk2saCNs95CwiBi5Nyw
         hBfasGfcB0buCGwQo0Tprro2EnXeLsKORetkxx1xrP9jG+h/G1KDeknmZtRH2nKqAmVj
         95dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681116610; x=1683708610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1PPutowbE1ddcNuSAkCSkroxKYobdEeWd9KbxPUEEU=;
        b=Hy3R7MrKAW61MFEzN4ETGK/7aI0a8gdBHmkN4Pe7IunBqto+ZO3WVSUK6nJ0qF7GI4
         jBP3ByYO+MceGd0Jqb1KCm+hIzUlbRrVCEOHDe6g1bBkVxBoS2aFtkwcv+eDMfdq8Lwd
         d9SyB9kYi6nnQWd7NzfmlTMhapi5IlpIFtgAT4DZtElK1oCNzCOCy+y/8pgaGTRyuTx/
         Dkp0Vi6rQEGE79XUVaPjqVi6vMG3z84o6THmKm0aW8Y4jLjAz1E9g5XAjTNdnc9QELRt
         FNwaZmI+mexqObz8jrNGPYnPeTA3tEFD/qWwPeJpk9JacuPzjdaeTa/9DXYHfxoiadAm
         DLlA==
X-Gm-Message-State: AAQBX9fdfc2uAIbPhQaWVWwqJXoVof7aWiiLApha/0BVrFAfGibgCxz1
	W1H4f/AIGNvHqtz5DyRDOac=
X-Google-Smtp-Source: AKy350b5k9AR/6UulnkpYaBxALJEatRglMDChZn26EjA3zlioQLSx33nmJs40SAHZ2UuLARzkJjy8w==
X-Received: by 2002:aa7:d697:0:b0:504:852a:6856 with SMTP id d23-20020aa7d697000000b00504852a6856mr7280281edr.16.1681116609374;
        Mon, 10 Apr 2023 01:50:09 -0700 (PDT)
Received: from localhost.localdomain ([154.72.161.184])
        by smtp.gmail.com with ESMTPSA id v13-20020a50954d000000b004fc649481basm4709962eda.58.2023.04.10.01.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:50:08 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: maxime@cerno.tech
Cc: airlied@gmail.com,
	andrzej.hajda@intel.com,
	daniel@ffwll.ch,
	dave.stevenson@raspberrypi.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jagan@amarulasolutions.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-amarula@amarulasolutions.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	marex@denx.de,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	tzimmermann@suse.de,
	wens@csie.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 1/2] drm: sun4i/dsi: factor out DSI PHY poweron and poweroff
Date: Mon, 10 Apr 2023 09:47:49 +0100
Message-Id: <20230410084750.164016-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230410084750.164016-1-fusibrandon13@gmail.com>
References: <20230410084750.164016-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out PHY poweron and poweroff sequences from sun6i_dsi_encoder_enable
and sun6i_dsi_encoder_disable.This leaves nothing to be be done in
sun6i_dsi_encoder_disable, so get rid of that. Also remove
drm_panel_<prepare/enable/disable/unprepare> as these would be invoked the
modeset helpers.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 64 ++++++++++++--------------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  4 ++
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 760ff05ea..4dc92109e 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -713,7 +713,7 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
 	return 0;
 }
 
-static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
+void sun6i_dsi_phy_power_on(const struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
@@ -768,43 +768,12 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	phy_set_mode(dsi->dphy, PHY_MODE_MIPI_DPHY);
 	phy_configure(dsi->dphy, &opts);
 	phy_power_on(dsi->dphy);
-
-	if (dsi->panel)
-		drm_panel_prepare(dsi->panel);
-
-	/*
-	 * FIXME: This should be moved after the switch to HS mode.
-	 *
-	 * Unfortunately, once in HS mode, it seems like we're not
-	 * able to send DCS commands anymore, which would prevent any
-	 * panel to send any DCS command as part as their enable
-	 * method, which is quite common.
-	 *
-	 * I haven't seen any artifact due to that sub-optimal
-	 * ordering on the panels I've tested it with, so I guess this
-	 * will do for now, until that IP is better understood.
-	 */
-	if (dsi->panel)
-		drm_panel_enable(dsi->panel);
-
-	sun6i_dsi_start(dsi, DSI_START_HSC);
-
-	udelay(1000);
-
-	sun6i_dsi_start(dsi, DSI_START_HSD);
 }
 
-static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
+void sun6i_dsi_phy_power_off(const struct drm_encoder *encoder)
 {
 	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
 
-	DRM_DEBUG_DRIVER("Disabling DSI output\n");
-
-	if (dsi->panel) {
-		drm_panel_disable(dsi->panel);
-		drm_panel_unprepare(dsi->panel);
-	}
-
 	phy_power_off(dsi->dphy);
 	phy_exit(dsi->dphy);
 
@@ -813,6 +782,34 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
 	regulator_disable(dsi->regulator);
 }
 
+static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder, struct drm_atomic_state *old_state)
+{
+	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
+
+	DRM_DEBUG_DRIVER("Enabling DSI output\n");
+
+	sun6i_dsi_start(dsi, DSI_START_HSC);
+
+	udelay(1000);
+
+	sun6i_dsi_start(dsi, DSI_START_HSD);
+
+	/*
+	 * NOTE
+	 *
+	 * Unfortunately, once in HS mode, it seems like we're not
+	 * able to send DCS commands anymore, which would prevent any
+	 * panel to send any DCS command as part as their enable
+	 * method, which is quite common.
+	 *
+	 * So maybe panels/bridges should send any init DCS commands in their
+	 * prepare/pre_enable methods? This should work as the DSI PHY is active
+	 * before those hooks are called.
+	 *
+	 * This will do for now, until that IP is better understood.
+	 */
+}
+
 static int sun6i_dsi_get_modes(struct drm_connector *connector)
 {
 	struct sun6i_dsi *dsi = connector_to_sun6i_dsi(connector);
@@ -843,7 +840,6 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
 };
 
 static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
-	.disable	= sun6i_dsi_encoder_disable,
 	.enable		= sun6i_dsi_encoder_enable,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index f1ddefe0f..a0b541f48 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -40,6 +40,10 @@ struct sun6i_dsi {
 	const struct sun6i_dsi_variant *variant;
 };
 
+void sun6i_dsi_phy_power_on(const struct drm_encoder *encoder);
+
+void sun6i_dsi_phy_power_off(const struct drm_encoder *encoder);
+
 static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
 {
 	return container_of(host, struct sun6i_dsi, host);
-- 
2.30.2

