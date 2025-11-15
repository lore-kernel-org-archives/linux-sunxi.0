Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB43F3009F0
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216064; cv=none; b=glBW6YrBwsKYyS/ZPvn0T3gLY5bcEwn0IS52gCt9Jgoo/Ab1LGchhtKqQ/SLQAWIb0bBClpDsUQjogOJbARCqop2kwtijBVDgSLTPkx60wxQ6JEgatl03nY48iduXktjNRix3oaeassmqtp68qmpqrBt45a/56SJx+YN+33WJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216064; c=relaxed/simple;
	bh=JeJ/r3r6p1NeXChaBCcLY3ZUFPlKr1ccZPRTLmbzSzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zlu0lnvzOlzYYsEt8CIFFCSdHTACHSt49RjsZL+RsCttWkzlnElLjMpEScquAFaoSRPobZdTyl2/tOIiEfg2mcdMNfWKlrn+LpozeWlQIjm8GnVdD53tR5bSIWZPOUrZXkdhAJoCnaIKecEQ6TJYStzpIVxPazyD695Pyly3V3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO+FtlqN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO+FtlqN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7291af7190so421725166b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216060; x=1763820860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVbw8sqfmsGsfsXTGzKu/do/A1FF7lGaLVG/hAhMlcM=;
        b=jO+FtlqN8btbRNtiesX11Co81ACr/CySVQ9HpugmKaN/NZ0BESLgF3N9vemqYKXzsm
         G816j7i44SjpgF8VcjyQLh8hX1NOll+lDfQZmSR5RaWqNO53yXWVOQyYi+CbqFKf/Qb8
         PK9lt8tUUBsc+jFYnkLVaYwSYXpnMukEwv6/0QpysaX9sEktueKRTyF5cyoA4X6aixYD
         3F4Bk2buTnW24Em4Gmw9mOMkcmO7rZm+LLoczBYUa9YzQrR6q5KsfGEAom2Vzqqrt+LY
         tO0iZEkxhWfbXVRn+v5Bs7GFPbvDx8sdmMkc3dTZVEnoJ/lXDHmAZMe9V8LXLzhmdanI
         BwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216060; x=1763820860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVbw8sqfmsGsfsXTGzKu/do/A1FF7lGaLVG/hAhMlcM=;
        b=mpN7a0/kDv/khxWptYerhI0y782xjEqzHBFq4oPSUcKHF83U1i02cATFqSubFu49FD
         PtuZpme+h7Q9JpiXmg61E4Pb1M/ThY8yLW+CUJrg7TNCcN6iAiauiFGQNpNxuBat9OvA
         hJRq9I/CpPXeJpJYlEDMtXEQmHt9eG2gM6i5oUFclLvAKDEANUX5eYqA4KaYk37Cm5bT
         IZ0IMlcZqepEnAcJPiq2QoC2C+yL/NTSYwmI6GsunjEadOSw1ndFnF+qYxvav323l7SD
         4qqo3lk0e7O8s9M2TkLmUN6yYXcEo41XxQHJBWKk31pS48pdW3MyfkTMWn3zdNew4pJu
         qmUA==
X-Forwarded-Encrypted: i=1; AJvYcCVkidK+U8TCPp46Cr2A+Kr29T/RggnzKq5LduuzkjH2EBILgNAky/rhu+PJkTjj3kT8UI26ZdwGIx0Qaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFYL9ZLYSfxTdsD+1DVhjxPu8uGRQAwmkjPjZdd1PfyNM2paMO
	FbQToM3WfXNF3i8gykFKuT3DuMx8qewnLF8Dssa0MRuEl90/FMBLkvO1
X-Gm-Gg: ASbGncu9Xq6N6pzGlm5vip0nN6zljeqacwzOqu744GwtBACa+H1mCEP7Id872MrAVQi
	N+q9hcBvV+5642NpUpao3Pxwh+wa1p+mOsQBDrFvpz0YoANMUrHKtsJdslxayvriG/5Pw1XXZt+
	dXCNA1c6EjucHeoTtKRSe7F78eKICOwEI7BOeIZvsG35Dc3K0YSauihjHzhY7oC/0Yx6AvpeXv4
	X7N+kJPII8uHjssWctJn71+boLJ1zbyix1DPAwZszbIUVuNEmIbX9a2BxpOlfubp2aTbgcL1qVo
	Jm56JGVYoo9o1AWz39nfyBLPi6sw608GqG1B2FkxZ8t3zT3i8B5Ll/ehiP2LpVT2e99MyI1qUkS
	+JXw2WLsL2ht7Qkt4RKBcQ0unn4OZsm3jv/y32HtObRPRtg1U5PaKIiS2CXGo6rmhsmg9ZFqSDJ
	mEAD4JZRIylrgB7T6O1syg2Nhb8GNYy/sJ3ZmFpY/2NnAYAg==
X-Google-Smtp-Source: AGHT+IGbU8DEm/CCSleW/Yu4/6wA0uutVsxsCUAngp8FeQ9xWSzPAIlK7ahdDPBbaS4CEF2iCochtA==
X-Received: by 2002:a17:906:d9b:b0:b73:68b3:bd2f with SMTP id a640c23a62f3a-b7368b3c0fdmr502509366b.40.1763216060152;
        Sat, 15 Nov 2025 06:14:20 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:19 -0800 (PST)
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
Subject: [PATCH 5/7] drm/sun4i: Add planes driver
Date: Sat, 15 Nov 2025 15:13:45 +0100
Message-ID: <20251115141347.13087-6-jernej.skrabec@gmail.com>
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

This driver serves just as planes sharing manager, needed for Display
Engine 3.3 and newer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/Kconfig         |   8 +
 drivers/gpu/drm/sun4i/Makefile        |   1 +
 drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
 4 files changed, 257 insertions(+)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index b56ba00aabca..946dd7606094 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
 	  TCON TOP is responsible for configuring display pipeline for
 	  HDMI, TVE and LCD.
 
+config DRM_SUN50I_PLANES
+	tristate
+	default DRM_SUN4I if DRM_SUN8I_MIXER!=n
+	help
+	  Chose this option if you have an Allwinner Soc with the
+	  Display Engine 3.3 or newer. Planes are shared resource
+	  between multiple mixers.
+
 endif
diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11..03f002abef15 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)	+= sun6i_mipi_dsi.o
 obj-$(CONFIG_DRM_SUN8I_DW_HDMI)	+= sun8i-drm-hdmi.o
 obj-$(CONFIG_DRM_SUN8I_MIXER)	+= sun8i-mixer.o
 obj-$(CONFIG_DRM_SUN8I_TCON_TOP) += sun8i_tcon_top.o
+obj-$(CONFIG_DRM_SUN50I_PLANES)	+= sun50i_planes.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/sun4i/sun50i_planes.c
new file mode 100644
index 000000000000..a99c01122990
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include "sun50i_planes.h"
+#include "sun8i_ui_layer.h"
+#include "sun8i_vi_layer.h"
+
+static bool sun50i_planes_node_is_planes(struct device_node *node)
+{
+	return !!of_match_node(sun50i_planes_of_table, node);
+}
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer)
+{
+	struct sun50i_planes *planes = dev_get_drvdata(dev);
+	const struct sun50i_planes_quirks *quirks;
+	struct drm_plane **drm_planes;
+	const struct default_map *map;
+	unsigned int i;
+
+	if (!sun50i_planes_node_is_planes(dev->of_node)) {
+		dev_err(dev, "Device is not planes driver!\n");
+		return NULL;
+	}
+
+	if (!planes) {
+		dev_err(dev, "Planes driver is not loaded yet!\n");
+		return NULL;
+	}
+
+	if (mixer > 1) {
+		dev_err(dev, "Mixer index is too high!\n");
+		return NULL;
+	}
+
+	quirks = planes->quirks;
+	map = &quirks->def_map[mixer];
+
+	drm_planes = devm_kcalloc(drm->dev, map->num_ch + 1,
+				  sizeof(*drm_planes), GFP_KERNEL);
+	if (!drm_planes)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < map->num_ch; i++) {
+		unsigned int phy_ch = map->map[i];
+		struct sun8i_layer *layer;
+		enum drm_plane_type type;
+
+		if ((i == 0 && map->num_ch == 1) || i == 1)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		if (phy_ch < UI_PLANE_OFFSET)
+			layer = sun8i_vi_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+		else
+			layer = sun8i_ui_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+
+		if (IS_ERR(layer)) {
+			dev_err(drm->dev,
+				"Couldn't initialize DRM plane\n");
+			return ERR_CAST(layer);
+		}
+
+		drm_planes[i] = &layer->plane;
+	}
+
+	return drm_planes;
+}
+EXPORT_SYMBOL(sun50i_planes_setup);
+
+static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
+{
+	const struct sun50i_planes_quirks *quirks = planes->quirks;
+	unsigned int i, j;
+	u32 mapping;
+
+	mapping = 0;
+	for (j = 0; j < MAX_DISP; j++)
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch < UI_PLANE_OFFSET)
+				mapping |= j << (ch * 2);
+			else
+				mapping |= j << ((ch - UI_PLANE_OFFSET) * 2 + 16);
+		}
+	regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG, mapping);
+
+	for (j = 0; j < MAX_DISP; j++) {
+		mapping = 0;
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch >= UI_PLANE_OFFSET)
+				ch += 2;
+
+			mapping |= ch << (i * 4);
+		}
+		regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN_MUX_REG + j * 4, mapping);
+	}
+}
+
+static const struct regmap_config sun50i_planes_regmap_config = {
+	.name		= "planes",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x17fffc,
+};
+
+static int sun50i_planes_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sun50i_planes *planes;
+	void __iomem *regs;
+
+	planes = devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
+	if (!planes)
+		return -ENOMEM;
+
+	planes->quirks = of_device_get_match_data(&pdev->dev);
+	if (!planes->quirks)
+		return dev_err_probe(dev, -EINVAL, "Unable to get quirks\n");
+
+	planes->mapping = syscon_regmap_lookup_by_phandle(dev->of_node,
+							  "allwinner,plane-mapping");
+	if (IS_ERR(planes->mapping))
+		return dev_err_probe(dev, PTR_ERR(planes->mapping),
+				     "Unable to get mapping\n");
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	planes->regs = devm_regmap_init_mmio(dev, regs, &sun50i_planes_regmap_config);
+	if (IS_ERR(planes->regs))
+		return PTR_ERR(planes->regs);
+
+	dev_set_drvdata(dev, planes);
+
+	sun50i_planes_init_mapping(planes);
+
+	return 0;
+}
+
+static const struct sun50i_planes_quirks sun50i_h616_planes_quirks = {
+	.def_map = {
+		{
+			.map = {0, 6, 7},
+			.num_ch = 3,
+		},
+		{
+			.map = {1, 2, 8},
+			.num_ch = 3,
+		},
+	},
+	.cfg = {
+		.de_type	= SUN8I_MIXER_DE33,
+		/*
+		 * TODO: All planes support scaling, but driver needs
+		 * improvements to properly support it.
+		 */
+		.scaler_mask    = 0,
+		.scanline_yuv	= 4096,
+	},
+};
+
+/* sun4i_drv uses this list to check if a device node is a plane */
+const struct of_device_id sun50i_planes_of_table[] = {
+	{
+		.compatible = "allwinner,sun50i-h616-de33-planes",
+		.data = &sun50i_h616_planes_quirks
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
+EXPORT_SYMBOL(sun50i_planes_of_table);
+
+static struct platform_driver sun50i_planes_platform_driver = {
+	.probe		= sun50i_planes_probe,
+	.driver		= {
+		.name		= "sun50i-planes",
+		.of_match_table	= sun50i_planes_of_table,
+	},
+};
+module_platform_driver(sun50i_planes_platform_driver);
+
+MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
+MODULE_DESCRIPTION("Allwinner DE33 planes driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/sun4i/sun50i_planes.h
new file mode 100644
index 000000000000..446feaeb03fc
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#ifndef _SUN50I_PLANES_H_
+#define _SUN50I_PLANES_H_
+
+#include <drm/drm_device.h>
+#include <linux/regmap.h>
+
+#include "sun8i_mixer.h"
+
+/* mapping registers, located in clock register space */
+#define SUNXI_DE33_DE_CHN2CORE_MUX_REG	0x24
+#define SUNXI_DE33_DE_PORT02CHN_MUX_REG	0x28
+#define SUNXI_DE33_DE_PORT12CHN_MUX_REG	0x2c
+
+#define MAX_DISP	2
+#define MAX_CHANNELS	8
+#define UI_PLANE_OFFSET	6
+
+struct default_map {
+	unsigned int map[MAX_CHANNELS];
+	unsigned int num_ch;
+};
+
+struct sun50i_planes_quirks {
+	struct default_map	def_map[MAX_DISP];
+	struct sun8i_layer_cfg	cfg;
+};
+
+struct sun50i_planes {
+	struct regmap				*regs;
+	struct regmap				*mapping;
+	const struct sun50i_planes_quirks	*quirks;
+};
+
+extern const struct of_device_id sun50i_planes_of_table[];
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer);
+
+#endif /* _SUN50I_PLANES_H_ */
-- 
2.51.2

