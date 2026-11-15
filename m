Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723092;
	b=mmQlEivo5mteu00SsydjZzMoutHFWJHljEff7hA0a2+h3LeLm7qIhz5oboFGPUFPQJXe
	 91+tsG5zqgAhRiAjJVsKry3yI6O2fRhol0lHxhB/arD0S4v3qocLhtKfDvRQpjc4bUyHf
	 hw352aSDZIIdTZSD+i0DHc1musMP/sYKEXdl8l06slvvupgTUN9T/6SdqP8L/RmqtaeI2
	 H5Hs17qR+7GffAf/Sb1+YKqkq2AQzOQbCnUWJ7Wun1LJS0pD/Hf11o2WOeSpmuJGu0kLR
	 tbqJ0eI7CiW/0d1XmB0MfJdxUlFHY8BZJJR3mE3TaXlE1xSePfRRe0oABbkLai6dDgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uUl8Gcdr1CjrV+R7vEydrBbKUTZ9VI9y6BS4nuOZ0fM=;
	b=txXTdwlfzvplSvGsEWw/B1/VKHy3G/WliKiO0SSMqDM3YNS4OFYjAVCMSJuMyIY04E+D
	 g8lN118xxOhJK5jfDyHvSw7xeJEkhg89gD5qAFKgLA7PQFUCdzpPKUauJGGdj4d24OHaX
	 wiA4xHP+kbv4qESlC5GH7YINxUe08AwveW6RqdI8/mDvaBL8lPPlw6JuKdckpsqsvwpzg
	 sPWE4tQeXCsWvKyjaczkAMcMDFWane6jOY6BwdTYmJeWtdEEscPJoUw8vgqx2miU073e5
	 ujxlISRjsvEsCiEM9W8h6txLeoeNlzuQwfPu23Ox7hsiqET31UCrLSSsfIqSjVRGKBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKdUMO+c;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D1606A885
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97D1606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKdUMO+c
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-497614c95f0so1000464f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 22:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723090; x=1795327890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUl8Gcdr1CjrV+R7vEydrBbKUTZ9VI9y6BS4nuOZ0fM=;
        b=fKdUMO+c0HtO2apznATfeRu81f3S+AQiAct3DmhS81Z+gp/1IpmP66hqMNZlwalJNE
         Y0/m86ObhMmkoWNACwaNvttCZMxbT0sTbdPv3qFiQWyjvLGlhwslMJEdXU62ySVrkEb4
         b6KwzLP/tSVGqIbOhY1Oezd3rcAN+h4R4whZc3LYKzNBnjow+186Sc3hYiB4nWPTXO/Y
         aIdCTY4mu7k7b+JAIPWXFZNbK8Mg+qpduP1FYNRFhXOnIoGMMtNSO0k/voZox1y4jNjN
         IAbBnVx6V/LqeX+Wfm9+Xqwszi5edA1lUTdxxuMQRWUcYHKqOuJVy2vhEZvp8NH7WHQ5
         2D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723090; x=1795327890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uUl8Gcdr1CjrV+R7vEydrBbKUTZ9VI9y6BS4nuOZ0fM=;
        b=NI432A0Aeznjx50pYNd+maMuWFZG4m2ObyyXYOWWz7VFQhOe6a9Vmpyp30lHcQ2LVB
         wlFEOvyHLEfBRmy0GCykxGS7DTQB8uv4h8NL62h2wjuOb3uQy5fRvQQtx23K9uwrOVry
         tzW03wQmwegHw/N9XQtmRb1ISF96aiS9ALOStre2kS4MZfnSgVY/fM+Mg3MxXx1+nCoC
         wOu1FqA6APeAD3krp6WSv3Ay0+6yN2J/vQclf959r2SyAfgJ6Re/Cd3h6FwDkpDgjWbq
         nKS2WFccF3H6hmEvWIfuWQAX9IOqvaBaZAN1ISg2YJ30e91jb8naZnk3ijY6pz4ZI3mo
         F5VA==
X-Forwarded-Encrypted: i=1; AL+hErFwepam5Zk9ON+gAyDEOBUD0EGW+5kuuaHP/Mq31MVbiG+Z2HglHI0xdTf61zScOF8jxTNe2fxlzW8dmA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+2OkLbH3RaIwJsfqf1TGsLiupwFBb0T0zTW9LeIdE6mEzE/J7Z
	06HgMtFKMuPy9dOc9V5KN6cZOu+gw2cypCbw3RIYPZ9d/s6XV9+mrBkO
X-Gm-Gg: AYBFou2VD+VnkJT57xr0/r8ZIgYC5xyRUdItMmkbVYGYo06OlFVnvQvjM4jEkz5tw7v
	qEq5NQr9xfATCNtNM8IEvnwbU2UBvwDCgS4g7xdpvQySBOca21lqo6KO1kuaalKpYv3ppXr2VZS
	dUyDOIRYxH6wlYtF2BU7VJAufYGmc0GgZp4OxcYLvj88bDX6/Q6JZtW9FynwyqIQyPrfuJ1pztK
	3RaIxIn3L8cAk8pgKFlOh79NyO6uEt0t+CLgvuiXnBBPGHY4AsYGzl4W1MzdNb8x0E1F8N8qrYn
	cke2toLSDRBYMsojCg7O5MI+7vZAzY7SI+dAiP1bKKp16MPMtmibgrKq5Sbu6RRt+UlKO/zPTi0
	G06WPesDSB7zFphtTQv2D6xkM+gbpSdKCx9c5wHNEdQBHh8SssV+j2zMUg+FSJB8PFFjtvH6Zdy
	KWM5LR7WHNRtNqIg9BNCv2BkGuF/mX+Q+UcPqxUTqkmGpC/zmWwBQ/ooIaH9CFdb20ZQ8IvJVDk
	7YEf28eNb5kqNz9Fq0TLqztG515IplfVHNqIVO6ZyaP0SMwf9hXDjjNx1vG5wKmAavUhg5hE+/U
	6ljyPCBNclb1qeaQkrgY03aQhJQe0fLvw4ykDiEPVojGjQ8otI5h7mdoXEh9HSEUYcqGv7q0edN
	2IfltgNMd3brDavKwvekVrLf37w3kv6Dg7+QI37iCjRw4jI28FgyOOQE0NYSWQKublKyLblGPe2
	hceqlqXO+sgWrEKTVy5GoprkFwlvIZ7Bhyiy1TVmGLyeDUIjKTS0DjlHSRC4veux5fVb/6h4wqm
	G7kUQ3cIhYPKA==
X-Received: by 2002:a05:600c:3f12:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4bb55a644bfmr147443945e9.23.1794723090126;
        Sat, 14 Nov 2026 22:11:30 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:29 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 6/8] drm/sun4i: Add DE33 shared plane driver
Date: Sun, 15 Nov 2026 07:11:00 +0100
Message-ID: <20261115061102.229680-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DE33 makes its plane channels shared resources that mixers select through
routing registers in the display clock block. The existing mixer-local
plane initialization cannot represent that topology.

Add a component that owns the shared plane register space, programs the
default channel-to-mixer mapping and creates each mixer's DRM planes
from that mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/Makefile        |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c | 215 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
 3 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11..501e3d867918 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -16,7 +16,8 @@ sun8i-drm-hdmi-y		+= sun8i_hdmi_phy_clk.o
 
 sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_layer.o sun8i_ui_scaler.o \
-				   sun8i_vi_scaler.o sun8i_csc.o
+				   sun8i_vi_scaler.o sun8i_csc.o \
+				   sun50i_planes.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
 sun4i-tcon-y			+= sun4i_tcon_dclk.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/sun4i/sun50i_planes.c
new file mode 100644
index 000000000000..22b9f104a391
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#include <drm/drm_device.h>
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "sun50i_planes.h"
+#include "sun8i_ui_layer.h"
+#include "sun8i_vi_layer.h"
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
+static const struct of_device_id sun50i_planes_of_table[] = {
+	{
+		.compatible = "allwinner,sun50i-h616-de33-planes",
+		.data = &sun50i_h616_planes_quirks
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
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
+	if (!of_match_node(sun50i_planes_of_table, dev->of_node)) {
+		dev_err(dev, "Device is not planes driver!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!planes) {
+		dev_err(dev, "Planes driver is not loaded yet!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (mixer > 1) {
+		dev_err(dev, "Mixer index is too high!\n");
+		return ERR_PTR(-EINVAL);
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
+	struct platform_device *clk_pdev;
+	struct device *dev = &pdev->dev;
+	struct sun50i_planes *planes;
+	struct device_node *np;
+	void __iomem *regs;
+
+	planes = devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
+	if (!planes)
+		return -ENOMEM;
+
+	planes->quirks = of_device_get_match_data(dev);
+	if (!planes->quirks)
+		return dev_err_probe(dev, -EINVAL, "Unable to get quirks\n");
+
+	np = of_parse_phandle(dev->of_node,
+			      "allwinner,plane-mapping", 0);
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "Missing mapping phandle\n");
+
+	clk_pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!clk_pdev)
+		return dev_err_probe(dev, -EPROBE_DEFER, "Unable to get mapping\n");
+
+	/* Regmap is registered by display clocks driver during its probe. */
+	planes->mapping = dev_get_regmap(&clk_pdev->dev, NULL);
+	if (!planes->mapping) {
+		platform_device_put(clk_pdev);
+		return dev_err_probe(dev, -EPROBE_DEFER, "Unable to get regmap\n");
+	}
+
+	if (!device_link_add(dev, &clk_pdev->dev,
+			     DL_FLAG_AUTOREMOVE_CONSUMER)) {
+		platform_device_put(clk_pdev);
+		return dev_err_probe(dev, -EINVAL, "Failed to create link\n");
+	}
+	platform_device_put(clk_pdev);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	planes->regs = devm_regmap_init_mmio(dev, regs, &sun50i_planes_regmap_config);
+	if (IS_ERR(planes->regs))
+		return PTR_ERR(planes->regs);
+
+	sun50i_planes_init_mapping(planes);
+
+	dev_set_drvdata(dev, planes);
+
+	return 0;
+}
+
+struct platform_driver sun50i_planes_platform_driver = {
+	.probe		= sun50i_planes_probe,
+	.driver		= {
+		.name		= "sun50i-planes",
+		.of_match_table	= sun50i_planes_of_table,
+	},
+};
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/sun4i/sun50i_planes.h
new file mode 100644
index 000000000000..7be969491f9c
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#ifndef _SUN50I_PLANES_H_
+#define _SUN50I_PLANES_H_
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
+struct regmap;
+struct drm_device;
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
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer);
+
+extern struct platform_driver sun50i_planes_platform_driver;
+
+#endif /* _SUN50I_PLANES_H_ */
-- 
2.43.0

