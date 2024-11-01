Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E0C18E20
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Nov 2024 00:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420719; cv=none; b=MYXuNY3s3bQMfXYBbYFdrvS9VY10l2LShtwpsoz26yyZ9iIugyJsSUA6lV70YCIc0LVQPxwCJJeVkURPz6KVdZrssviBOxtsbDeUO++qqJ/EVxCS3Sio3Byx97MhhwRpyEyZXmKAkNWtek+4NnGFAX3T1hcdhEnOKxHEAZjZRIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420719; c=relaxed/simple;
	bh=kVBUKzWAeHVvHBydx3EkRE4Q3REprXqMLr3/QDo5buM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArpttZWdWM4SkIKrBkXlDIBeM+DopCdcEyeMN6EEardvY1LMShnv3zpl+C1ErF9lCV6I95KJTs7H37xiyPGHuNzHj97YAWkdoGNQkfKn7SqFRVDz77Gku6bfAD6YAZcp1JmxqDOv3uPjhMZd8bbFyyAkCWRORNts2WouIrpuy10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZTPhQy1F; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTPhQy1F"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e63c8678so1732479e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420711; x=1731025511; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6wvkpdEJy3UY0KoyL1u6wW6pZJHCkWq8daEN8XaygQ=;
        b=ZTPhQy1FZCwNRwfQm2/E+SR34ofdUmqDUp9sv0clfI9RucwZOiCkUTY0mkons10PHe
         GR/9W4yGprIFps+1j66gHKeQD+nSQn4Z3BtMqp0h1YpmGYx7DhpxbxIYQQuPUo7gSX7E
         mmq/zQsev/B0z0UgIkFNU7zCaJ9hAugEchYqcj30gAx9MkNwiqnvcbPEkMFnkfI6O9EO
         /29cxZAI9TpUDcoChCQBXzyNEQTJ9BtRwShkSuGRVoq/s6UlS3+DD5Ci6Xqxo0haXOwz
         Bu+juTbLBYbVcktfgOs061mz3Uuo9UejjZiL0a3Q/0cLs4uCIY97knvF5eZ6kQoMWJJ0
         QfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420711; x=1731025511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6wvkpdEJy3UY0KoyL1u6wW6pZJHCkWq8daEN8XaygQ=;
        b=Dx68ZwCjdfQVVa3wA22/hgU5EpAb7r5ARk3Ss1h06VibSXvCqpYCQbWXcoq9Z9K3XT
         2M4KClX7LjQOyw8yghjw0c81my/2oyUC3mfUBYwdeUZmvFCYeq/V2LaPjGEMw54By4CG
         SKmFwVlqdsLM6nfMkiV4qmznkOYTUuZvM4awoaladGOneY4D1upYkT9P+E8hdWN+1+px
         CzHXSaOmjkriWd2umeIxERgMAQ91bw6vTUX01sBk/7GZ/kA0tx1mUXFtsZB1Hrv1vlsM
         O3FdygSognOwl83w0j2YIzNDDleI4D4+CfzGj55t0F640eQwluTrQBudNpXxlGUVbhwA
         UUqg==
X-Forwarded-Encrypted: i=1; AJvYcCUBjFYtO18oOCMLIvcTBKd/u4UXu0OvhAw60AfT5aKvFzrdlycz5bjiKatqcp6S77YREYRJDdd3cz+bqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCGjutoTDcMStS+KUmvhX0gWGsx0LaeOHBafcRPlN8R0VCxtPj
	JtWoX4ESoTWZD+fGYM3dWSFBHONYmm/u7t5o3l+RWg4cmdJbj1chX4rMJqs2G24=
X-Google-Smtp-Source: AGHT+IFl02U+Enu+dOc8nLBGUqiQvjvTgpJmOb8nUqlghPqDc1+5KcRdRr4F22uyWdsyfKCDEEXcqg==
X-Received: by 2002:a05:6512:114f:b0:539:958a:8fb1 with SMTP id 2adb3069b0e04-53d65e1aeecmr830681e87.60.1730420710791;
        Thu, 31 Oct 2024 17:25:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:04 +0200
Subject: [PATCH v2 1/6] drm/display: hdmi: add generic mode_valid helper
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-1-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12996;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kVBUKzWAeHVvHBydx3EkRE4Q3REprXqMLr3/QDo5buM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/h+qQ1svDVzgd0LXjIU1mOZYulRshe8N4cO
 hhkv1trDDmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1YsEB/oCWybrGbF8Zp55m5T5SgJSWWMvmHdwta73P4TbzdbYxcw2s2JeW3ZdBed51YYxvd29orC
 p6PB0KX/CZKEEyn4Xp9ZqQYRtEo4BZufIesiJxN6SWc+jisZtmmNry8JkoNh0C6UaLeip2k6dF3
 HHISp68oCmsgCVPYX7oPUN3Yv27H8YXfd1/UllhI2fuAMNtl4txBzdiPwRlvJpZEKv3CkGnOgeP
 QTdDn7BX88d9AjlBozZcgJa5Hib1obJ31EY57vKWvMxLt1vgPH5PIE1g94Nmq01lQdsUoZvV3GJ
 HjeNxTzyfa42+vFSYu0Zppy75ikECUbDVNoTowRpSr3FDqub
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
It can be either used directly or as a part of the .mode_valid callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
 drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 ++++++++++++++++++++-
 include/drm/display/drm_hdmi_helper.h              |   4 +
 5 files changed, 229 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..560c5d4365ca54d3f669395349cedfd6f75fa033 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -9,6 +9,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_property.h>
 
+#include "drm_hdmi_helper_internal.h"
+
 static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
 {
 	return sink_eotf & BIT(output_eotf);
@@ -256,3 +258,46 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
 	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
 }
 EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
+
+enum drm_mode_status
+__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
+				 const struct drm_display_mode *mode,
+				 unsigned long long clock)
+{
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
+	const struct drm_display_info *info = &connector->display_info;
+
+	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
+		return MODE_CLOCK_HIGH;
+
+	if (funcs && funcs->tmds_char_rate_valid) {
+		enum drm_mode_status status;
+
+		status = funcs->tmds_char_rate_valid(connector, mode, clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
+	return MODE_OK;
+}
+
+/**
+ * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI connector
+ * @connector: DRM connector to validate the mode
+ * @mode: Display mode to validate
+ *
+ * Generic .mode_valid implementation for HDMI connectors.
+ */
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode)
+{
+	unsigned long long clock;
+
+	clock = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	if (!clock)
+		return MODE_ERROR;
+
+	return __drm_hdmi_connector_clock_valid(connector, mode, clock);
+}
+EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
diff --git a/drivers/gpu/drm/display/drm_hdmi_helper_internal.h b/drivers/gpu/drm/display/drm_hdmi_helper_internal.h
new file mode 100644
index 0000000000000000000000000000000000000000..ee74435c04f62cf71b9857bdc427c46442b85697
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_helper_internal.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DP_HELPER_INTERNAL_H
+#define DRM_DP_HELPER_INTERNAL_H
+
+enum drm_mode_status
+__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
+				 const struct drm_display_mode *mode,
+				 unsigned long long clock);
+
+#endif
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..29c2cb2c3171366a2a68fc6ad48f8ad8a4dc7e30 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -8,6 +8,8 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include "drm_hdmi_helper_internal.h"
+
 /**
  * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
  * @connector: DRM connector
@@ -198,28 +200,6 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 	return false;
 }
 
-static enum drm_mode_status
-hdmi_clock_valid(const struct drm_connector *connector,
-		 const struct drm_display_mode *mode,
-		 unsigned long long clock)
-{
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
-	const struct drm_display_info *info = &connector->display_info;
-
-	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
-		return MODE_CLOCK_HIGH;
-
-	if (funcs && funcs->tmds_char_rate_valid) {
-		enum drm_mode_status status;
-
-		status = funcs->tmds_char_rate_valid(connector, mode, clock);
-		if (status != MODE_OK)
-			return status;
-	}
-
-	return MODE_OK;
-}
-
 static int
 hdmi_compute_clock(const struct drm_connector *connector,
 		   struct drm_connector_state *conn_state,
@@ -233,7 +213,7 @@ hdmi_compute_clock(const struct drm_connector *connector,
 	if (!clock)
 		return -EINVAL;
 
-	status = hdmi_clock_valid(connector, mode, clock);
+	status = __drm_hdmi_connector_clock_valid(connector, mode, clock);
 	if (status != MODE_OK)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 34ee95d41f2966ab23a60deb37d689430f6b0985..8640e7280053bd95852f53b92159f493b141f2bf 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -43,10 +43,12 @@ struct drm_atomic_helper_connector_hdmi_priv {
 static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
 {
 	struct drm_device *drm = connector->dev;
-	struct drm_display_mode *mode, *preferred;
+	struct drm_display_mode *mode, *preferred = NULL;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	if (!list_empty(&connector->modes))
+		preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;
@@ -125,6 +127,18 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
 };
 
+static enum drm_mode_status
+reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+					     const struct drm_display_mode *mode,
+					     unsigned long long tmds_rate)
+{
+	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
+}
+
+static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hdmi_funcs = {
+	.tmds_char_rate_valid	= reject_100MHz_connector_tmds_char_rate_valid,
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
@@ -147,6 +161,33 @@ static int dummy_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
 	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.get_modes	= dummy_connector_get_modes,
+	.mode_valid		= drm_hdmi_connector_mode_valid,
+};
+
+static int dummy_connector_get_modes_100MHz_max_clock(struct drm_connector *connector)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv =
+		connector_to_priv(connector);
+	const struct drm_edid *edid;
+	unsigned int num_modes;
+
+	edid = drm_edid_alloc(priv->current_edid, priv->current_edid_len);
+	if (!edid)
+		return -EINVAL;
+
+	drm_edid_connector_update(connector, edid);
+	connector->display_info.max_tmds_clock = 100 * 1000;
+	num_modes = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(edid);
+
+	return num_modes;
+}
+
+static const struct drm_connector_helper_funcs dummy_connector_helper_funcs_max_tmds_clock = {
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
+	.get_modes	= dummy_connector_get_modes_100MHz_max_clock,
+	.mode_valid		= drm_hdmi_connector_mode_valid,
 };
 
 static void dummy_hdmi_connector_reset(struct drm_connector *connector)
@@ -1734,9 +1775,132 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
 	.test_cases	= drm_atomic_helper_connector_hdmi_reset_tests,
 };
 
+static void drm_test_check_mode_valid(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
+}
+
+static void drm_test_check_mode_valid_reject(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	struct drm_device *drm;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	/* You shouldn't be doing that at home. */
+	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
+
+	priv->current_edid = test_edid_hdmi_1080p_rgb_max_200mhz;
+	priv->current_edid_len = ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz);
+
+	drm = &priv->drm;
+
+	mutex_lock(&drm->mode_config.mutex);
+	ret = conn->funcs->fill_modes(conn, 4096, 4096);
+	mutex_unlock(&drm->mode_config.mutex);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NULL(test, preferred);
+}
+
+static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	/* You shouldn't be doing that at home. */
+	conn->hdmi.funcs = &reject_100_MHz_connector_hdmi_funcs;
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	drm_connector_helper_add(conn, &dummy_connector_helper_funcs_max_tmds_clock);
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
+	KUNIT_CASE(drm_test_check_mode_valid),
+	KUNIT_CASE(drm_test_check_mode_valid_reject),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_test_suite = {
+	.name		= "drm_atomic_helper_connector_hdmi_mode_valid",
+	.test_cases	= drm_atomic_helper_connector_hdmi_mode_valid_tests,
+};
+
 kunit_test_suites(
 	&drm_atomic_helper_connector_hdmi_check_test_suite,
 	&drm_atomic_helper_connector_hdmi_reset_test_suite,
+	&drm_atomic_helper_connector_hdmi_mode_valid_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
diff --git a/include/drm/display/drm_hdmi_helper.h b/include/drm/display/drm_hdmi_helper.h
index 57e3b18c15ec79636d89267aba0e88f434c5d4db..93f0e566257338fb6e9a1f0b2cc14ce9c97ec0a5 100644
--- a/include/drm/display/drm_hdmi_helper.h
+++ b/include/drm/display/drm_hdmi_helper.h
@@ -28,4 +28,8 @@ unsigned long long
 drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
 			    unsigned int bpc, enum hdmi_colorspace fmt);
 
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode);
+
 #endif

-- 
2.39.5

