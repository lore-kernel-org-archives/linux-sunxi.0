Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA868
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Nov 2021 08:44:53 +0000 (UTC)
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hk3P13f6qz90SL;
	Tue,  2 Nov 2021 16:44:37 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme755-chm.china.huawei.com
 (10.3.19.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Tue, 2
 Nov 2021 16:44:45 +0800
From: He Ying <heying24@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <jernej.skrabec@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -V2] drm/sun4i: Grab reference of connector before return connector from sun4i_tcon_get_connector
Date: Tue, 2 Nov 2021 04:46:28 -0400
Message-ID: <20211102084628.149070-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <33e01d45-c9f9-0e8c-6871-868ecd198368@huawei.com>
References: <33e01d45-c9f9-0e8c-6871-868ecd198368@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected

From the comments of drm_for_each_connector_iter(), we know
that "connector is only valid within the list body, if you
want to use connector after calling drm_connector_list_iter_end()
then you need to grab your own reference first using
drm_connector_get()". So fix the wrong use of connector
according to the comments and then call drm_connector_put()
after using connector finishes.

Signed-off-by: He Ying <heying24@huawei.com>
---

V2:
 Use proper subject prefix

 drivers/gpu/drm/sun4i/sun4i_tcon.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 9f06dec0fc61..24fa6784ee5f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -47,12 +47,12 @@ static struct drm_connector *sun4i_tcon_get_connector(const struct drm_encoder *
 	drm_connector_list_iter_begin(encoder->dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
 		if (connector->encoder == encoder) {
-			drm_connector_list_iter_end(&iter);
-			return connector;
+			drm_connector_get(connector);
+			break;
 		}
 	drm_connector_list_iter_end(&iter);
 
-	return NULL;
+	return connector;
 }
 
 static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
@@ -65,6 +65,7 @@ static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
 		return -EINVAL;
 
 	info = &connector->display_info;
+	drm_connector_put(connector);
 	if (info->num_bus_formats != 1)
 		return -EINVAL;
 
@@ -361,6 +362,7 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	/* TODO support normal CPU interface modes */
 	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
 	struct mipi_dsi_device *device = dsi->device;
+	struct drm_connector *connector;
 	u8 bpp = mipi_dsi_pixel_format_to_bpp(device->format);
 	u8 lanes = device->lanes;
 	u32 block_space, start_delay;
@@ -372,7 +374,9 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
 	/* Set dithering if needed */
-	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
+	connector = sun4i_tcon_get_connector(encoder);
+	sun4i_tcon0_mode_set_dithering(tcon, connector);
+	drm_connector_put(connector);
 
 	regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
 			   SUN4I_TCON0_CTL_IF_MASK,
@@ -430,6 +434,7 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 				      const struct drm_display_mode *mode)
 {
 	unsigned int bp;
+	struct drm_connector *connector;
 	u8 clk_delay;
 	u32 reg, val = 0;
 
@@ -440,7 +445,9 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
 	/* Set dithering if needed */
-	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
+	connector = sun4i_tcon_get_connector(encoder);
+	sun4i_tcon0_mode_set_dithering(tcon, connector);
+	drm_connector_put(connector);
 
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 0);
@@ -518,6 +525,7 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, connector);
+	drm_connector_put(connector);
 
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 0);
-- 
2.17.1

