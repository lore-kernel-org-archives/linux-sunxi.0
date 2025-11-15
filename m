Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB73D3019D2
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216067; cv=none; b=MbyB4xLd3ScIwlUXS6os4eNIZJ3PtmmA+xnpSpFSSA+cadbTuTtyje3uHrVOh4yJ6MrFTD3hwyhP/A1edq3fLvQpjAfd8ValavhGJu9+mhcmGPDHDdZy6VfYW3PNW4EtOUI87riZhjQl6KtvMPyMBrueAwUKPx20l43yHfiCEj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216067; c=relaxed/simple;
	bh=ARCr2MF2PDcGudo+PTuVZew5/GiYdu3vBhL2diGFAU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6xBIhQRO84B7triTGXH6kqtc/3rFfgRJnsmRPG56wUz+e0SUcg6bmhsPbzE3TkJJE9Bejug0QAX16Jg6xxkyqkDwBEOJKPSd0kJe24esRhAQ6eS0c3B8cTy62CZPwz0RpnsVbtFeLV3DYHTF47ycKjE3NxvjV57+MyvpqIWGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8XWkWew; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8XWkWew"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b73161849e1so500082166b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216063; x=1763820863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SznPGrtr2XDooq13sk6Kgg+QMqAR2LlCpjlNsch42gA=;
        b=D8XWkWewYm/0W7YHs132G3WSG8A9vqwKeagJ/y1JoZVhO3ePmSErYf0s5y6/692Xf0
         SWupGCMjjxiO8XijLoVsEWYrbrZzOSTmsNy9nqbRkG5sND43Uo2OIClvQMuK6aIcfxGl
         z3EG87r53Bp2wV0yQhIQY6fnAoaFRbGrv0YSZL6DjHPy9ddHHZ2MTwBE7lbMTa16E2LQ
         yAToq9JKEMrbre2t9ao3jwa9aeI88z4axWZcRETFLpPMgxU2VxGO3CT2ypZeFE/sfcUQ
         cumia5myW29eDrl8yrBH5eA3+MgYVrDNySOV+SYz502UgG+UEU0Hacbl2ClnaIEFHCNl
         Dt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216063; x=1763820863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SznPGrtr2XDooq13sk6Kgg+QMqAR2LlCpjlNsch42gA=;
        b=LlmqKt2BQH6DUajwp68BHRs9Pku92QaAcjyt0a0FRUNB+ft3kAxAcSg/Pq8mORzVDN
         cZE0i9TVfNgf330ATb6S/AvlJR+T+JtLhtAogByJS3d8WIZPDXilTHoq9kIC38GHKBsn
         M5GIa8Ecqfffu655vf18cs9kypknO4xxnEgKwxlcLZQuxJG+6Fpv/i1M8mR9/nbfWKk1
         9UvQQYxfloastd0U+sA+LF2nH3N3r4uMO61d6VRp4MFyGLra9VCr6dF9rC5nXN4aO7wv
         CZa6KUHqnbw4FUkeTXJBm+QIS8gMuZtxan91GE/Gjh8QFr4qbVVErfJmTaPD1x2SJ8Ze
         CIGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeF8h4JZpJC41b0HhbIKZENggtTSrWLlYdE+BXh+Sl25G1VD/ylGfsxgj0JzxkForG/ulMGs4sTpPOgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoT5/wxQWYM8N6OTqcsXdshw6kuMfuM7j8uPS4oJIIaLQts0b2
	D/0loKNPMvYd0zp2l4w8Km6Zxwyq9QjplJ3aERJyrBEHnamKIMuO3bG4
X-Gm-Gg: ASbGncvWAUAdno/kpAay/AoRS0JVac5ERf+f3OVDEEQKlVWBdZ/9ojTln89eb+5QD6e
	bDdI3Do4OwQePMEhNmlNPZQXn8BrdvUkxl/ZwuQ9vKOSJZ6LaRVOt4CcgtbUqpEVO9KuRDFMaQD
	Xj17py/MsN6SHSlWs9TMVKUi5vdV/Hj8v+Ja+II+LfAFgdlg/kiJly2VdPejzyaVPKBlFcwF/U/
	ANLH1UUQJaCl+/fDsuGvqQ3IvH+Ym5BhmJMXb75FNWLUAcCiBB5l/WMP0Zh8+igOqDyl5XXPcva
	wkUg10L+q0w6dTGZqlP5t1imBjZV2qQeze/bu4L/yQEt4r//8ixopD7M7Rc/YenhvDd71wsZInw
	WRqIiXcU8YqZ3bXQyayNH7T+loEXSh7rj8Q2FoShx4K9T8IJAVxl7D6iwxEMYdV3AuFzTGN9m7z
	epKaekEIkJm3n0Yb0h/oNpL9p/mQ7SEsDglp71MVGEqH7R13/XVgZI9BSX
X-Google-Smtp-Source: AGHT+IGNZo/U7zY8Q07lDbxVpkIabIMsA3romzMD93FNBaHxF7DsQi/nyue3LGz4eYZpXchvaLYh/g==
X-Received: by 2002:a17:907:3d0b:b0:b39:57ab:ec18 with SMTP id a640c23a62f3a-b736794a6b3mr650833866b.45.1763216062968;
        Sat, 15 Nov 2025 06:14:22 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:22 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 7/7] drm/sun4i: switch DE33 to new bindings
Date: Sat, 15 Nov 2025 15:13:47 +0100
Message-ID: <20251115141347.13087-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that everything is in place, switch DE33 to new bindings.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 130 +++++++++++++++-------------
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +--
 2 files changed, 71 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index fde3b677e925..da213e54e653 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -24,6 +25,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_drv.h"
+#include "sun50i_planes.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
@@ -256,7 +258,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
-	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -293,16 +294,16 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		route |= layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 			     SUN8I_MIXER_COORD(x, y));
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 			     SUN8I_MIXER_SIZE(w, h));
 	}
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	if (mixer->cfg->de_type != SUN8I_MIXER_DE33)
@@ -317,7 +318,6 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
-	unsigned int phy_index;
 	int i;
 
 	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
@@ -332,12 +332,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = i;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[i];
-
 		layer = sun8i_vi_layer_init_one(drm, type, mixer->engine.regs,
-						i, phy_index, plane_cnt,
+						i, i, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
@@ -357,12 +353,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = index;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[index];
-
 		layer = sun8i_ui_layer_init_one(drm, type, mixer->engine.regs,
-						index, phy_index, plane_cnt,
+						index, index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
@@ -376,16 +368,25 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	return planes;
 }
 
+static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
+					     struct sunxi_engine *engine)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+
+	if (IS_ENABLED(CONFIG_DRM_SUN50I_PLANES))
+		return sun50i_planes_setup(mixer->planes_dev, drm, engine->id);
+
+	return NULL;
+}
+
 static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
-	struct regmap *bld_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
@@ -397,14 +398,14 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -417,8 +418,14 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.mode_set	= sun8i_mixer_mode_set,
 };
 
+static const struct sunxi_engine_ops sun50i_engine_ops = {
+	.commit		= sun8i_mixer_commit,
+	.layers_init	= sun50i_layers_init,
+	.mode_set	= sun8i_mixer_mode_set,
+};
+
 static const struct regmap_config sun8i_mixer_regmap_config = {
-	.name		= "layers",
+	.name		= "display",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
@@ -433,14 +440,6 @@ static const struct regmap_config sun8i_top_regmap_config = {
 	.max_register	= 0x3c,
 };
 
-static const struct regmap_config sun8i_disp_regmap_config = {
-	.name		= "display",
-	.reg_bits	= 32,
-	.val_bits	= 32,
-	.reg_stride	= 4,
-	.max_register	= 0x20000,
-};
-
 static int sun8i_mixer_of_get_id(struct device_node *node)
 {
 	struct device_node *ep, *remote;
@@ -463,17 +462,14 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
-	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
+	struct regmap *top_regs;
 	int plane_cnt, i;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 		top_regs = mixer->top_regs;
-		disp_regs = mixer->disp_regs;
-	} else {
+	else
 		top_regs = mixer->engine.regs;
-		disp_regs = mixer->engine.regs;
-	}
 
 	/* Enable the mixer */
 	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
@@ -483,25 +479,25 @@ static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
 
 	/* Set background color to black */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(disp_regs,
+		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -532,7 +528,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer)
 		return -ENOMEM;
 	dev_set_drvdata(dev, mixer);
-	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
 	if (of_property_present(dev->of_node, "iommus")) {
@@ -562,6 +557,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		mixer->engine.ops = &sun50i_engine_ops;
+	else
+		mixer->engine.ops = &sun8i_engine_ops;
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -584,17 +584,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			dev_err(dev, "Couldn't create the top regmap\n");
 			return PTR_ERR(mixer->top_regs);
 		}
-
-		regs = devm_platform_ioremap_resource_byname(pdev, "display");
-		if (IS_ERR(regs))
-			return PTR_ERR(regs);
-
-		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
-							 &sun8i_disp_regmap_config);
-		if (IS_ERR(mixer->disp_regs)) {
-			dev_err(dev, "Couldn't create the disp regmap\n");
-			return PTR_ERR(mixer->disp_regs);
-		}
 	}
 
 	mixer->reset = devm_reset_control_get(dev, NULL);
@@ -634,6 +623,33 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	clk_prepare_enable(mixer->mod_clk);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		struct platform_device *pdev;
+		struct device_node *np;
+		void *data;
+
+		np = of_parse_phandle(dev->of_node, "allwinner,planes", 0);
+		if (!np) {
+			ret = -ENODEV;
+			goto err_disable_mod_clk;
+		}
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!pdev) {
+			ret = -EPROBE_DEFER;
+			goto err_disable_mod_clk;
+		}
+
+		data = platform_get_drvdata(pdev);
+		if (!data) {
+			put_device(&pdev->dev);
+			return -EPROBE_DEFER;
+		}
+
+		mixer->planes_dev = &pdev->dev;
+	}
+
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
 	/* Reset registers and disable unused sub-engines */
@@ -668,6 +684,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	return 0;
 
+err_disable_mod_clk:
+	clk_disable_unprepare(mixer->mod_clk);
 err_disable_bus_clk:
 	clk_disable_unprepare(mixer->bus_clk);
 err_assert_reset:
@@ -863,16 +881,8 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
-	.lay_cfg = {
-		.de_type	= SUN8I_MIXER_DE33,
-		.scaler_mask	= 0xf,
-		.scanline_yuv	= 4096,
-	},
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
-	.ui_num		= 3,
-	.vi_num		= 1,
-	.map		= {0, 6, 7, 8},
 };
 
 static const struct of_device_id sun8i_mixer_of_table[] = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index e2f83301aae8..7abc88c898d9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -202,7 +202,6 @@ struct sun8i_mixer_cfg {
 	int			ui_num;
 	unsigned int		de_type;
 	unsigned long		mod_rate;
-	unsigned int		map[6];
 };
 
 struct sun8i_mixer {
@@ -216,7 +215,7 @@ struct sun8i_mixer {
 	struct clk			*mod_clk;
 
 	struct regmap			*top_regs;
-	struct regmap			*disp_regs;
+	struct device			*planes_dev;
 };
 
 enum {
@@ -252,13 +251,6 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == SUN8I_MIXER_DE3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
-static inline struct regmap *
-sun8i_blender_regmap(struct sun8i_mixer *mixer)
-{
-	return mixer->cfg->de_type == SUN8I_MIXER_DE33 ?
-		mixer->disp_regs : mixer->engine.regs;
-}
-
 static inline u32
 sun8i_channel_base(struct sun8i_layer *layer)
 {
-- 
2.51.2

