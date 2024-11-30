Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A8155CB0
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Nov 2024 01:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931583; cv=none; b=OjSzjUlyj24R7V6qhNIglp9u/zim2BqB31oqLyrHK+0tzQIDDGQlUOMNIrqwKoI4KhwioO/fJm83dGYH4Q1PKpENDoVVd1o3jpvfMWJyuqP3FObXqr7OeyyJbFGo6vBbdUQQgc35cjBIhSK0bQDh3EZ05PnYeGR0YoBjroCdFGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931583; c=relaxed/simple;
	bh=tt33sNy4EHSANTDHQAExXai1314OqzFqkWnpPj2YPOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsVo8++E38NYNJAyjKkJ5ZoLMBCslyPrA+GFy8wCmv8lXXVvLxvAF6wJQBHz1/xAM3thypGVwZK7yXBbv3ItQA4x9FCJwBqAhcxJPZXRjS1pX+WwhmawlzGTSt4Ut9hB19u0j/jUxC5W7cNtqsSULm2XHuYfUrM7v5KAmQYasFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N5tFbkio; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N5tFbkio"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso2740904e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 17:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931580; x=1733536380; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1lXYCxrn128DpMjUx/X3ynnQZTeAwK/ttm0jSS1k6c=;
        b=N5tFbkio+vWoEe0WfF4qE3/d8P8Ufzl0En9vfh1VTdoYyQGvMW+NChuLAQxc55IisT
         3r7h1sgq8u9ZqlkDgS54Thie7G8dHZnFMVf72SbJpYETsmaJksWpr5psYduyaynXN7dv
         OARWEi2U2IZ5B8Rgwfj0zDAHYQ3NoA9vTCvykkhf7a8iscY7f5vmrndNL7z4Tl12DEju
         OJfqQvDu7bKF2gem5FQxmBsvvZR7bHfChA7sUY9QBGBC63mtmI7DSwIEOujehKmmfwnj
         AiWTQiHRZsOKIAgCEev1KdumPZeYiDHHTv6eM5FC2SZUxIxfbkbX4wVUmF+uzbO885A7
         1cIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931580; x=1733536380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1lXYCxrn128DpMjUx/X3ynnQZTeAwK/ttm0jSS1k6c=;
        b=AU0s1xzTTmmjVJqrlVMueId1WLmG54sCa7wEbqFy1TyuqGjLXFs/rs34foleTxsdzx
         oU4cBR9ateqdHK0KPFTxnxPpvGz3s08x6+/DSsMOZVaGZ/guvQcQEIKj3+XMsmOkv1y+
         3+Qchij59xFXszLS7QF8Gf4W/ucfrNwdmJxmGv/ja0a1ErnmRh4bBN5zZ/OtSQApPm27
         zttFL5YJv+VgzadUuLhWSG8g8oB6HObxfBWFqkyTJV/qwS4BkOrB6YYupyMpnbXAWLDl
         64FwZvyWEOHwh8d1bYE4Y/1sHURRrVUYhOxKJ4xG4VEbW04R6c6O9/RyWy18ErhBHCiN
         PAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd/2bPKUDfhgSy8HyKzYUzLo8bxgYUNDF0rSqhhE+GBn4nnM9/sGlSHszt09Zrsvm+P5Ruq4S9sdrTUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ3IRH6hz14K61LSDVqE2nyP7+/HuHZXV4iG/X1N2tfzbKZZdk
	Xva6rpIqVvC/+czAUq9Hb05K1/Vxx8Qtdlc+ZbluGSc9ah9abDc6sD8ffxt/mWA=
X-Gm-Gg: ASbGncvnkN+lliEF57d6r6HWDwOsEbXRf/51CbDzY0fjldLEkqJ0KAUnwtq6Z/MszEL
	WyEd0N99XS3ZmCkZF9jD9BXJo4oII8406M7nj+ZPZSVSA9SHysl0jlncXGbFpisnNzbRloHNwmH
	IdU32BB74qxuRG/WS6cyS9OE5eZvDdlh4UJWRDXJ7lIgDs++P32OBFprSBbyeiTd1M4t+MZI5/Z
	JDJ+OpRfD2v9D/0JWWZghbk8YCEFsayKxXuUDJgNuDqr0fOoMXEO3IShg==
X-Google-Smtp-Source: AGHT+IF1zZCeJZP0c56HDhB3dZvzfBBbMK+T1fbyelhZdZGvyXwekGQxsUf0KFWRtcl6qeCukozDbg==
X-Received: by 2002:a05:6512:3ba2:b0:53d:ab21:4e17 with SMTP id 2adb3069b0e04-53df010e3dcmr8347283e87.55.1732931580177;
        Fri, 29 Nov 2024 17:53:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:35 +0200
Subject: [PATCH v5 10/10] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-10-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tt33sNy4EHSANTDHQAExXai1314OqzFqkWnpPj2YPOw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/hEd3SJUPYNRrY3fgh17VdYvds7f7Q168Zy
 EaL3JawgciJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4QAKCRCLPIo+Aiko
 1X26CACq+Vplt9h/bOf8vjWm6vdUiW7JOHiBTGnHe70WgxSHu/ZuvlCePWg1uh99nqgs2ima6WF
 a9lLDOxqI+EJiL4HXVW/9rMgRI9+kPpvRo4ZpFhSzWDzSDLhXw69MnpuoryWhAMHZUyDDqAaP6O
 eiqfS2m9WWGLc9eup/Hiiuc2DkZeZRIUpCxUytQsfiM08yjPmolqxG1B6UJFaoNBNQnoAiB6NKV
 6yENKHrcdPICm1HbAhl90zh1cQYxOeCxuPr/++Vj6Lb/96pS3lioxQ+HZxLy35xyxCP5nSvsOIB
 IF09MJu53IVZkYd6054wQHgHWjrTHeEygEM+tXSOP4m5zQ6Z
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Replace sun4i_hdmi_connector_atomic_check(), which performs just TMDS
char rate check, with drm_atomic_helper_connector_hdmi_check(), which
performs additional checks basing on the HDMI Connector's state.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 54b72fe220afacc208b3fd48d5160031127ea14a..b05fd77870b00aac97d003f3fb9c2b98cb73abc0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -187,24 +187,6 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_NOCLOCK;
 }
 
-static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
-					     struct drm_atomic_state *state)
-{
-	struct drm_connector_state *conn_state =
-		drm_atomic_get_new_connector_state(state, connector);
-	struct drm_crtc *crtc = conn_state->crtc;
-	struct drm_crtc_state *crtc_state = crtc->state;
-	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	enum drm_mode_status status;
-
-	status = sun4i_hdmi_connector_clock_valid(connector, mode,
-						  conn_state->hdmi.tmds_char_rate);
-	if (status != MODE_OK)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -258,7 +240,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= sun4i_hdmi_connector_atomic_check,
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.39.5

