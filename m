Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED2444701
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514817; cv=none; b=Cp9/FYvBNeGJEfX2Smn6FTGct7e0HcCQLNpxZc8IsC1Ny5anfXSOsF2Gw+3Kl8MSsmCEa2pDnXdD/G9Nj532TvC2diYwyzxrzEH8yJWC8O2Y3c08RNJodcETo+78LbnPQY4Yo1WuW62ZgdHftN8H+vSxBI4FjeuQEFKpfrmli5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514817; c=relaxed/simple;
	bh=AmbKeI0EA/av+tCQTuliU0wD5msuSFI/IwkTSCcBjH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fc+h9raQm3FtrPPJx5uEnXofCajuqR4Zoy+0+XjWWvJSDM7F9nOG9yHR596Zyie9hYlXHYsteSFtNJj8AUU9hrHTAtEW+XPyqh0uZ7pzQgcjR/BIVD320glkoAm0xyyZlb+bvy91QYsY2Ye1CP2lpNbM95pvgB447FaQUk2a6Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mgQh52NJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mgQh52NJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514798;
	bh=AmbKeI0EA/av+tCQTuliU0wD5msuSFI/IwkTSCcBjH4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mgQh52NJc/dD3AlB5W5xaMG5LiZLC1sbE7Yqx6LSC+/KF1VsSQdShrrr8q0iFYaoZ
	 ZIObsCO4WKlHIhlq6LPy+Z7CfQetgjE2Xqps0SKJRHzr5/lTaUJE2xWlCCtK8ov2+M
	 MS4vv2VrUmgRbg+JxoA2HOqQ+FFqKC0UBYav7Tzq7c11lQ7KofZWSZ6nqxe8DBiRX6
	 zmekAExsvGDsxpD4yVPCE45+p7Yxlxfz29jdMcSgkdopu7ZNth5HOpSMRRoygEoS57
	 B92YdZmKSYZkQcu87kXlSuHnMtnnHttjNY1R52LL/4CxuSeTcmZ3v0enXgD9ZBhFjE
	 csTKcxZYei2jA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9A8E17E09AA;
	Fri, 31 Jul 2026 18:19:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:20:09 +0300
Subject: [PATCH v10 62/69] drm/tests: connector: Add HDMI source-side
 scrambler coverage
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-62-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
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

Add KUnit tests for the HDMI source-side scrambling validation done by
the new drmm_connector_hdmi_init() helper.

Connector initialization derives scrambler support from the
driver-provided supported_hdmi_ver capability.  The scrambler callbacks
are only valid for connectors advertising HDMI 2.0 or later, as
drm_connector_hdmi_scrambler_supported() uses their presence to report
source-side scrambling support.

Therefore, connectors that advertise source-side scrambling support must
provide both .scrambler_enable and .scrambler_disable.  Registration is
rejected if either callback is missing.  Conversely, connectors that do
not advertise source-side scrambling support must not provide these
callbacks, and registration is rejected if they are present.

Test the valid and invalid callback combinations for both supported and
unsupported scrambling configurations.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 87 ++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 17242d1c1b16..3d8500ad8be9 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -1417,6 +1417,89 @@ static void drm_test_connector_hdmi_init_max_tmds_rate_no_version(struct kunit *
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
+/*
+ * Test that the registration of an HDMI connector advertising source-side
+ * scrambling support succeeds when the .scrambler_{enable,disable} callbacks
+ * are provided.
+ */
+static void drm_test_connector_hdmi_init_scrambler_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs_scrambler,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, drm_connector_hdmi_scrambler_supported(&priv->connector));
+}
+
+/*
+ * Test that the registration of an HDMI connector advertising source-side
+ * scrambling support fails when the .scrambler_{enable,disable} callbacks
+ * are not provided.
+ */
+static void drm_test_connector_hdmi_init_scrambler_no_callbacks(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	priv->hdmi_funcs = dummy_hdmi_funcs_scrambler;
+	priv->hdmi_funcs.scrambler_enable = NULL;
+	priv->hdmi_funcs.scrambler_disable = NULL;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       &priv->hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector advertising source-side
+ * scrambling support fails when only one of the .scrambler_{enable,disable}
+ * callbacks are provided.
+ */
+static void drm_test_connector_hdmi_init_scrambler_partial_callbacks(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	priv->hdmi_funcs = dummy_hdmi_funcs_scrambler;
+	priv->hdmi_funcs.scrambler_disable = NULL;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       &priv->hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector not advertising source-side
+ * scrambling support fails when .scrambler_{enable,disable} callbacks are
+ * provided.
+ */
+static void drm_test_connector_hdmi_init_scrambler_unexpected_callbacks(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	priv->hdmi_funcs = dummy_hdmi_funcs_scrambler;
+	priv->hdmi_funcs.supported_hdmi_ver = HDMI_VERSION_1_4;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       &priv->hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
 static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_valid),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_8),
@@ -1447,6 +1530,10 @@ static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_max_tmds_rate_at_limit),
 	KUNIT_CASE(drm_test_connector_hdmi_init_max_tmds_rate_off_limit),
 	KUNIT_CASE(drm_test_connector_hdmi_init_max_tmds_rate_no_version),
+	KUNIT_CASE(drm_test_connector_hdmi_init_scrambler_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_scrambler_no_callbacks),
+	KUNIT_CASE(drm_test_connector_hdmi_init_scrambler_partial_callbacks),
+	KUNIT_CASE(drm_test_connector_hdmi_init_scrambler_unexpected_callbacks),
 	{ }
 };
 

-- 
2.55.0

