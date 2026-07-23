Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89F37F8A1
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770547; cv=none; b=k6SmYgB41FOzRgGkNevU6Tc/Qgh0iBL8EO4XdUQ7/yt7yAhDv3h9thbAM0pGhDz7xDmR3RptF80naMq5ddzAzYu8wbBuNcOW3nGlgxQIfOcPQ+6UvsPOBpeGRMn6HuuawTznQN5Ux1vE+mwzr5NP5qStC5BBB6KfxD3ODZqbM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770547; c=relaxed/simple;
	bh=uLg7zYEx4PuEm5hUTroSVNr0ajJC3eSnGppIiyCnEzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ourT3yKbFNDjPvxYOz4etEOo5HMNpTCYp5YRnl2Hvw/vvUq56rlFHSggFTUyS+e39eI+7sBDCQDlljnP0BkAgKmUkZotFFGno3NzSsZA3Mco1dnNSQoSrm4AczVckP7N0IxYTlYZksri2pGbpYKxJUxAsumkxAjoCRlO3DIdICE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HXHA8z2R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HXHA8z2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770543;
	bh=uLg7zYEx4PuEm5hUTroSVNr0ajJC3eSnGppIiyCnEzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HXHA8z2RRuAR2lvG+YYOntpyPMbEkGeVdL8Pag+3qat7UWtoqZTr55O2Px1PNZcbY
	 Ig68s9VWK2Hngk3GC8D+ibgcFsPmHXJ9JmnRP16Hv8HoumsHHZ/Yhw2ORxm8TbbMCJ
	 ecY07mX6Gfq7wBdKEmq31AeGX7BXZU1PaQnEt3ajOp8V4ecpLgJ0SFylWrGXzp4+8L
	 X3sY8qPt3RIxvKSB2Y4a3j+fdjLRzzczGp1lWd3aZEEzRpYnKfy983WPlRW9eq/EFR
	 TiaMf94yLZme88RmU2Vf0tvuzuF9eqrcx+R1AYnF3jsNEueM6p/dRWCeud1OWZHf7y
	 4+6RjlTUKCJkA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 261CE17E37F3;
	Thu, 23 Jul 2026 03:35:43 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:48 +0300
Subject: [PATCH v9 59/61] drm/connector: Drop redundant hdmi vendor/product
 fields
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-59-4fb12ea22ac9@collabora.com>
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

Now that all users migrated to the new drmm_connector_hdmi_init()
signature, vendor and product are provided through struct
drm_connector_hdmi_funcs, a reference to which is already stored in
drm_connector_hdmi.

Drop the redundant fields from drm_connector_hdmi and point its users to
hdmi.funcs->vendor and hdmi.funcs->product instead.

This allows simplifying the related connector registration tests by
getting rid of the now unnecessary KUNIT_EXPECT_MEMEQ() checks.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +--
 drivers/gpu/drm/drm_connector.c                 |  4 ---
 drivers/gpu/drm/tests/drm_connector_test.c      | 41 +++----------------------
 include/drm/drm_connector.h                     | 14 ++-------
 4 files changed, 8 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d112c1555517..bb4dd9d0b482 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -784,8 +784,8 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 		return 0;
 
 	ret = hdmi_spd_infoframe_init(frame,
-				      connector->hdmi.vendor,
-				      connector->hdmi.product);
+				      connector->hdmi.funcs->vendor,
+				      connector->hdmi.funcs->product);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d424d245ef71..837dbaa65eb0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -656,10 +656,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 		connector->hdmi.max_tmds_char_rate = hdmi_funcs->supported_tmds_char_rate;
 	}
 
-	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
-	strtomem_pad(connector->hdmi.vendor, hdmi_funcs->vendor, 0);
-	strtomem_pad(connector->hdmi.product, hdmi_funcs->product, 0);
-
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
 	 * connector to have a state.
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 3d050ac5e5f6..1d8c30288aea 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -769,14 +769,11 @@ static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
 
 /*
  * Test that the registration of a connector with a valid, shorter than
- * the max length, product name succeeds, and is stored padded with 0.
+ * the max length, product name succeeds.
  */
 static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
-		'P', 'r', 'o', 'd',
-	};
 	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_hdmi_funcs;
 	int ret;
 
@@ -790,25 +787,15 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_MEMEQ(test,
-			   priv->connector.hdmi.product,
-			   expected_product,
-			   sizeof(priv->connector.hdmi.product));
 }
 
 /*
  * Test that the registration of a connector with a valid, at max
- * length, product name succeeds, and is stored padded without any
- * trailing \0.
+ * length, product name succeeds.
  */
 static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
-		'P', 'r', 'o', 'd', 'u', 'c', 't',
-		'P', 'r', 'o', 'd', 'u', 'c', 't',
-		'P', 'r',
-	};
 	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_hdmi_funcs;
 	int ret;
 
@@ -822,10 +809,6 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_MEMEQ(test,
-			   priv->connector.hdmi.product,
-			   expected_product,
-			   sizeof(priv->connector.hdmi.product));
 }
 
 /*
@@ -852,14 +835,11 @@ static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *t
 
 /*
  * Test that the registration of a connector with a vendor name smaller
- * than the maximum length succeeds, and is stored padded with zeros.
+ * than the maximum length succeeds.
  */
 static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
-		'V', 'e', 'n', 'd',
-	};
 	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_hdmi_funcs;
 	int ret;
 
@@ -873,24 +853,15 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_MEMEQ(test,
-			   priv->connector.hdmi.vendor,
-			   expected_vendor,
-			   sizeof(priv->connector.hdmi.vendor));
 }
 
 /*
  * Test that the registration of a connector with a vendor name at the
- * maximum length succeeds, and is stored padded without the trailing
- * zero.
+ * maximum length succeeds.
  */
 static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
-		'V', 'e', 'n', 'd', 'o', 'r',
-		'V', 'e',
-	};
 	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_hdmi_funcs;
 	int ret;
 
@@ -904,10 +875,6 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_MEMEQ(test,
-			   priv->connector.hdmi.vendor,
-			   expected_vendor,
-			   sizeof(priv->connector.hdmi.vendor));
 }
 
 /*
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index b80cc667604e..03f4e6751165 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1418,11 +1418,13 @@ struct drm_connector_infoframe_funcs {
  * and controller capabilities
  */
 struct drm_connector_hdmi_funcs {
+#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
 	/**
 	 * @vendor: HDMI Controller Vendor name.
 	 */
 	const char *vendor;
 
+#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
 	/**
 	 * @product: HDMI Controller Product name
 	 */
@@ -2117,18 +2119,6 @@ struct drm_connector_hdmi_audio {
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
 struct drm_connector_hdmi {
-#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
-	/**
-	 * @vendor: HDMI Controller Vendor Name
-	 */
-	unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
-
-#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
-	/**
-	 * @product: HDMI Controller Product Name
-	 */
-	unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
-
 	/**
 	 * @supported_formats: Bitmask of @drm_output_color_format
 	 * supported by the controller.

-- 
2.55.0

