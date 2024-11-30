Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6C82890
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Nov 2024 01:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931564; cv=none; b=GFkxZOf7AXECiS5qgsYuC64Qsk1DJrTCqoJMD7wSsVLnunJ4zWHqbv7Ze00+O9s+vr8uUkVp8bjNAa20a/cnZMRkyCmGBoTWmK7+EHmcbHUiRaI/7jtnpwN60DUBROq11oi4AEDMNKP4Azv43Q9rI7SZ7g3qdyDV5eu8Q5C8X78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931564; c=relaxed/simple;
	bh=v8BoSRVhNVLNIqn0L1HvmQQ2nfTsZdUMUqZ1imeVKuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJXmgSzlJlnx6aCR1nFxFXMpY3MWvk+rZgnEyRiuSnpC/CWphDzm7dHBbl25hYdHXqE28jSVGhfXn0w3fDtlOGLhnf7F9505zzv9nVmHtDx76xC+5+Z+rjI9EQ8DVqU40oyYTOs3eWGaq94ydhC9jtKtx7COnaIESmi/qoOxIJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vCKK/9Id; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vCKK/9Id"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso2868160e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931561; x=1733536361; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4B0Y8eeW8nijFHMU2wdPBEmou1JUmUHuwSM02tCW6A=;
        b=vCKK/9IdcMiTqv7EwewO1V3k5W2xobi3tgR1bnwXSx/10B2uuZypzIStkhYR4kilLV
         SL3+MIxPiVRR5mBxChUXDb50W4iQ15XIeE1P3hgsFt2t53L28jjG9B5xD1rdhf1I0IpV
         zKsdA25QHcjAekO9aEvTRL7urWrI0A5+w7wj98DYuDKUzf//7a8g04ss9Mtf86gE2W7m
         XhzRMnwLxLGR7Iu4ChlMT6n5vkF4srb3c0khY7+bOfiADm6cItUFHUvzMvfj+P4OJUsM
         uu2wp3PH4abQB4k0sKU32lj0WqQENnDYf4//SB+9nRwswfQ+doXGVdzYP43JoA1sS48S
         /E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931561; x=1733536361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4B0Y8eeW8nijFHMU2wdPBEmou1JUmUHuwSM02tCW6A=;
        b=RaIUHN6FL5b3jKUf02SulO/9boyx+PHT2fyUW81Npgmon9Nowfr6uMxOtY5Ew7NhO+
         DmZYuWI30itxDDbj91CHQfiBuSJKOkS0pjaWHVn3v2oC/VlBGkswZ/X+z3QOp9QJPa+i
         CQcIB0Ii+XnDwMx6mlyxbeiQaWdN4WcCYjctqAdFsh/waBSJABYrfAZ8AH8p5mrktqgD
         fWSNoWA+GEF1PiwD27jeImhYwSzJNOai+h9ObSLZTdi+ypOpNSA3TUGnjL+mPEfsV8zL
         raRo3RPgnz6jfYCUQP5Z1qiaHmUvrVhdkiCIbVIrP+KNDqUsoJjvf6+wZ4C8jwU3Wjkg
         SJDw==
X-Forwarded-Encrypted: i=1; AJvYcCVVti+IR6oETaeS0HzTOUXy1taz6i8VFv0mnpDYWKhyYZvh1TgS+y4iRpQ9C7Tou5NEDcVsPYxoSQOWQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxzQVZ1PS0eIx9wKPqm/27veya+CntCnBnrnCIg0YasTCQtHKG
	k0bO77U8N/sS6AvVs9ebc1e6IWkazfS5W4IJpy4QLXhDB2WU21cqlSLB6kxDAOE=
X-Gm-Gg: ASbGncux+sHMbsUOYHhT+SDf8fYszqV8N3BdvkuBSjsONQ85pn44UGqqD5EB6rjX2FD
	4xECN8Dy7eC2serULLXACyIjojkiBrLGYTT4nax2cu6FVqM6wpqv63oFH+YYIF0l2q0zWS1CBmo
	E82gznpbygxum4QXvMn9Y+fd3sS2tIt/CG/tsCYyVTA5lgi3tGRny4qJj4iafVhzj+9dQ14QPqc
	DUE/MihgJvIO59Wkkrem+Sxy/+8fdBLPyjNpuX2zcT2Uef2JtO4KynrtQ==
X-Google-Smtp-Source: AGHT+IHr7e6eqX9Z0gQvURdKQ1bdtAFQTJZejUyHCz6bKeZj+mC0/lLghPW0EOJgTJMIplS8zy4hNg==
X-Received: by 2002:a05:6512:32c1:b0:53d:a68f:d901 with SMTP id 2adb3069b0e04-53df00d1b06mr7609554e87.15.1732931560699;
        Fri, 29 Nov 2024 17:52:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:27 +0200
Subject: [PATCH v5 02/10] drm/tests: hdmi: rename connector creation
 function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-2-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14634;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=v8BoSRVhNVLNIqn0L1HvmQQ2nfTsZdUMUqZ1imeVKuY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/fLC3qTV5FPAg0koUKF7mCCVp4yjgnKY2Ob
 7XbeEcO7OuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv3wAKCRCLPIo+Aiko
 1W8+B/wK+y74BQCSvsvXrO6Z3w7xSSgmnVQ99HIWNd93CVXPYrCnNdWqf/FAeZisVnWQRjmqeyV
 L0N+uCP5Wt1zYJyCnIFQC4R5WgF8vMQ8v39fsp9Ab3f03lvV/5/BpvWcBC6FQdGTBx6ObXov7xp
 VOVE5CIYcE5LxJWlebKEE2e5J0cZTNEH9IyhHjYq8gERQmh2oAKbBBWHs7HpDuSZta1oid9nUZi
 cdWlFnP4EajV5XBJ6VleF4Ideqv6+Vg/KH7ZUCelcHS5hnxwnbxlw9r1GOLUIc+Gzuk/BCs+E0Y
 uh9d/yk0xHTcrLsNtUfZ36YteFQsA33xM6D/deRqQpwMun9D
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As pointed out by Maxime, the drm_atomic_helper_connector_hdmi_init()
isn't a good name for a function inside KUnit tests. Rename it to
drm_kunit_helper_connector_hdmi_init().

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 202 ++++++++++-----------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 1e77689af6549f162eb3026c7bd2bbd59516ed98..60b1e37522837ee183c65413e3ba6c6ec4fed341 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -164,9 +164,9 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_atomic_helper_connector_hdmi_init(struct kunit *test,
-				      unsigned int formats,
-				      unsigned int max_bpc)
+drm_kunit_helper_connector_hdmi_init(struct kunit *test,
+				     unsigned int formats,
+				     unsigned int max_bpc)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -247,9 +247,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -310,9 +310,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -373,9 +373,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -429,9 +429,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -485,9 +485,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -543,9 +543,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -601,9 +601,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -659,9 +659,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -719,9 +719,9 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -793,9 +793,9 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -862,11 +862,11 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -911,9 +911,9 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -958,9 +958,9 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1005,9 +1005,9 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1056,9 +1056,9 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -1112,9 +1112,9 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1179,11 +1179,11 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1242,11 +1242,11 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -1305,9 +1305,9 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1370,11 +1370,11 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1438,9 +1438,9 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1496,11 +1496,11 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1593,9 +1593,9 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1615,9 +1615,9 @@ static void drm_test_check_bpc_8_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1639,9 +1639,9 @@ static void drm_test_check_bpc_10_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1663,9 +1663,9 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1685,11 +1685,11 @@ static void drm_test_check_format_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1707,11 +1707,11 @@ static void drm_test_check_tmds_char_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;

-- 
2.39.5

