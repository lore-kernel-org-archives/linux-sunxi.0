Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73141D86E8
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266801; cv=none; b=Tve6+tUFtEnAbm4FCDze1AuhZ60MiEztbGRcejX3BRuv5v7elKAxmXNHA/8ed3BcFQ+53vxgKHnStC0+XkHL5/dHvJrtEXCLZApNZTyv+XWJn7zHMD9bThgEBZscMj2fUfEgwtUylRg2siWuxCYYaYVArq9J+uXwY9AUu4gEVP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266801; c=relaxed/simple;
	bh=ua4QBZ4riM6Opp9fYNSoyg41GZXfyIYINU+ndYQUB6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uy3a1zFGXf5ty4r3f5nNooE+XK1UBGafiJxavD2TM/ScoWBaQuZd5Mh7r4MIkbW50BNCRPYr0HZI+u5TzCJJmWcGwBP7a1VBMKaDTZWL5K4pXaX8+tZTFPUKFHwDoOHZpOsfNnhRddnoTlKZ5MZXlEp38NeJUo9IZR3fODjFIU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTG+fO+b; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTG+fO+b"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so365404e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 01:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266797; x=1732871597; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bn7n+Ij/Vq2ciN8r7fMFmAZOh0BG4t/fByh+MoATRM4=;
        b=DTG+fO+b8OeoGCubfj+0f1wF/DCbVzosFVaC6dXjaCAw8vvsxBZ/rRYNvlvp9ocaAp
         A5N6OB2Q9YdiZ8yaWgWG4zJ4lo5/aF2ijKToI/JEBOwlt90S00dDV8cIUQtkGLIh4RFK
         KnDlJ4ZbDijHjj2JwBGUmbVhwMAL3YdJqvfaJBIbVN8YpWzOcNQ7giY29CG7gYWMfOuJ
         +tjPLBGwrM653JTWZaHoM/0pA2wLs7AgytPGU1hweEXGqkYKhc2gM1PsCaDNuU+4O9Uo
         +2jg8Ak9WH9v3xwNev313qGTSc6TATA0DkZEfIk829WUwpfH/niqprlTTvyu7wC8BTxX
         6/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266797; x=1732871597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bn7n+Ij/Vq2ciN8r7fMFmAZOh0BG4t/fByh+MoATRM4=;
        b=MiOdaruRaeFMlj61b/pVIsfobqMqn/APLwQR6JfwLoY3dXvjFul4+Gxe/UAZxk8DlD
         /nByqOyyW5UQJNCaGbjN+sZmsMOLG29wpjCnuuGzKukhcZDfJnv/cO5cNINWQeGlTnYv
         Kb3t/5wl6DVv0xMWdSSJ66RKrJzRr/+2+ysV64+fO6yOCfLmru5wdhZXltUp8Dy7j+lP
         Q7tvtDSLA9h8HkqndktRoAcb9weQQn1INv+nPwolomYNuCHIzsdx2PKSkgybW3gG/QOB
         GJ1E7tzOad4ZIg1FPOpUKs2jhnA4YRMt5oiIBtENYDuyOpnpfh/XJ2VD42OfwFBE9nQm
         Z1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXtJ2aYgiltVHVPFwImWVpGC7DW6AMzYt0pBGyrBMVwqxXxK8+0Zo1BUMny/Iwd1UTV1ovilTtPRk+uvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxL7qXQrcQgFNjRELKZRkae5jWeLqOrq6Jol9TrLwlLg/CuqN88
	KPILvcfe7/i2lOOJGv8PPWloUDGUcmd4XpEwfBSigmeihjKUgUbKes5WUkvFreQ=
X-Gm-Gg: ASbGncsdF6dpvHsvI9Crhh3b816KQwHJ7hd2V5QT72/w9GXDFUxgY2gxIw56qKNkeIX
	LGeaR2AWCBJj89G5dfYt3K4hXoAIKYhHscmTmO4ae+lEgHQrcuNGIRVUdWuo9Nbm9acFN0hB4Wh
	iPoZjbcTEQduXgsbmj2Dd2h0Qjrd8KSRZOC2qWwM4HKgb4hwb6nWx1UjesWtoKSq1vMWToQfker
	0j1giCQEntRjAJV/2G0mCChShoEJBozcfpB8vUZto9/myWmby8Xmi2Zkw==
X-Google-Smtp-Source: AGHT+IFq3zbQ0De3BTK0sXYYbItGqTSGZgyN0ksGm0iVTU9b2Y4WWbgSyJUSMBI6BlqGlAARhL7baw==
X-Received: by 2002:a05:6512:3c83:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53dd39a4c72mr747793e87.45.1732266796855;
        Fri, 22 Nov 2024 01:13:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:12:59 +0200
Subject: [PATCH v4 03/10] drm/tests: hdmi: return meaningful value from
 set_connector_edid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-3-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6697;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ua4QBZ4riM6Opp9fYNSoyg41GZXfyIYINU+ndYQUB6k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshxoQTVi+os/StFFK828rJmRTkBm3HXf3HO
 zvtKRVX30SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1dt8CACsBNzvug3dVlllsHPsfMwgWOnSIMgZwk0MWkGA0gAUUoTWpzd8byhb5O2YUsxEjhr8Pkc
 rf4sGlX9xHatXY1VjWmQallOgJ47yMezHGxAXqU2PIBMvbWSRERsZLvhhV88v00dmoXIvnRK1Ft
 aJl73es6aUazP/Y54Ew7mQ67iwgmpbwBjLtXuP3QjxU34fWTp0ca1GTepxqcEtGyG/w24eNDcqW
 K3Wm9uQY70CNwQUwLIPOI50MQCd0FBUrZ2vx6S0JW3yvojemLbXB4Hz4Yhk+OscNHFE0URzxFq3
 UmTvOfjhJp4j5t73KK4l+jKMfEuWyAuHtsPfjDgiEftV8Snk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The set_connector_edid() function returns a bogus 0, performing the
check on the connector->funcs->fill_modes() result internally. Make the
function pass the fill_modes()'s return value to the caller and move
corresponding checks to the caller site.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 31 +++++++++++-----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index d81254d46975e8af0d782249928217a1ebb7646e..c963d7015d179ac36e646d4c19d986ac5997dd2c 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -105,9 +105,8 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	mutex_lock(&drm->mode_config.mutex);
 	ret = connector->funcs->fill_modes(connector, 4096, 4096);
 	mutex_unlock(&drm->mode_config.mutex);
-	KUNIT_ASSERT_GT(test, ret, 0);
 
-	return 0;
+	return ret;
 }
 
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
@@ -223,7 +222,7 @@ drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	return priv;
 }
@@ -728,7 +727,7 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -802,7 +801,7 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -873,7 +872,7 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_dvi_1080p,
 				 ARRAY_SIZE(test_edid_dvi_1080p));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_FALSE(test, info->is_hdmi);
@@ -920,7 +919,7 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -967,7 +966,7 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -1014,7 +1013,7 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -1121,7 +1120,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1190,7 +1189,7 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1254,7 +1253,7 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1314,7 +1313,7 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1381,7 +1380,7 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1447,7 +1446,7 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1507,7 +1506,7 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_340mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);

-- 
2.39.5

