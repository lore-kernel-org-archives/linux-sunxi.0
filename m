Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3A31957F8
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Nov 2024 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731155725; cv=none; b=kwIYUkrGKSIG/S5J87FSx66pitdV/DE8ef6E8Qar+3BTv0M85EUNE7udMHQDedeIq6tne6an+om5Ar6rg7OwMNpdHzgkvtXwRA6xyh/qK+tovhtN45rpxiiOXUPFyecpsXrB3cI9gVWCT3alliKNc29l6b58A3J6VR9sLsH/fd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731155725; c=relaxed/simple;
	bh=HrGaJ3EnGO039JV3w0anWuEujv8ijZYE/SL4efGrI0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qf8pIpXEL4T7MxqnDUiCdkBk3isffC4NE6f7XbFiQ8uXUq1fTaioYUfPFC3zLKMfiinpN5IaFjLeX/2e3FKN+4T9+GwJyKfTn4TPt1cFHfG/uazC6kAyfgNefnlN3kHDlrrFdhG5ubjVkZbARhbImdHungEs3sXRsKpV0Aa4p+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wr7uDdu8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wr7uDdu8"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e4b7409fso3588380e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Nov 2024 04:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155722; x=1731760522; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42exLch29KQ7aLIpxUbDK7QotO8PsN7YchUut2Ri5WY=;
        b=wr7uDdu86A0M0ehfBsa00MUxOJzxPFoas48oaHfOnM//LheEoIVcg6GwC/9hcrycYs
         bqtN9JRPazXipEFjtutJGQC8UljuFJ0pwz1uNy8QLS2x+g6deH2hvhQ60fTd/PFIBYQ+
         vjkR2qgqSvyKXILLslfhkWzqy+8H+hEPQvUfoOBuDzBdui2jKll99g2CkYprguD+N65u
         Fe1dRozXdodsAoyON/9O+Trxv9vR8gl4ogpY0YBPBoBP+UObLt/kunHdj0AmdYtuUeE4
         wjZQhTOE0leJo0DfRGtxJkumjNdsO3Eh4T+R1Co6doYri5KLyj5Qwj41vIf1GlueQ04n
         r59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155722; x=1731760522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42exLch29KQ7aLIpxUbDK7QotO8PsN7YchUut2Ri5WY=;
        b=M3sfC+hFvjOCVp31oYhi48teLDIFJx7d46QSOt4zmRERXAEs7aSlKM8EpgFYnPH+x1
         URynQzSRYUXuXanHPVTObtt3I6G1mHVMtvSLl2ZfoVOtMeZOY17mIlzhkOXOPbuGtEsU
         6I7Oq7TISaacIcINlAqa10wcsZJ9LtTVjtW6W2d2FvvwRgXE64ZxHQwdRIzYF4h3FzOt
         q+eQU1J+GWdjhTdfpGNq0pP3yKZbiZfMs23OpMIKtRLUAfr7yJQHBJoRPf2r0Ue1tH4J
         SRTGTAQbZ5zqQTVwpdgGBk8KeHs3UvY2Vp61fPrkx6UE+dqw0WJQiBYCDiKD2b7kHGyR
         nq1A==
X-Forwarded-Encrypted: i=1; AJvYcCUez8IwWfKZwCzUzVyTGHIcaEtc9JGhpfLFjXe4ql2HfyX4nEt6HIyz87FG0zTY0KZ0+LQlWhnFBpLewQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6rH++kUWJ2ApCSVytPLRiEg9qwYC+WI8A741s7JmWDJbj9I+M
	DMtr2lpHeUE9Sva+ozL2hLBVWwoLvhPe/KAH/Lfkl9izti9neQGMNwB2IZaj83U=
X-Google-Smtp-Source: AGHT+IF4/eBJh19k7QgFTqtYdnnffmTFfXf5+J78TQkqLjRVT/odItDWynAUIGAavfq6S1uNQ3S3Rg==
X-Received: by 2002:a05:6512:3b0f:b0:539:e2cc:d37c with SMTP id 2adb3069b0e04-53d866b20c5mr2162656e87.3.1731155722003;
        Sat, 09 Nov 2024 04:35:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:07 +0200
Subject: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
References: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
In-Reply-To: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HrGaJ3EnGO039JV3w0anWuEujv8ijZYE/SL4efGrI0s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+2D8f9f3f02SmxcyeF2ex7K28O/vzlAxeRaO7cXPNW
 zsuJYd3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi8XvZ/wepedeVGdUY/a45
 FTO/7Xv1pfz//KulXi+rvn++ruXV9J7NOxLtmRcxvg+wZrRovKntYX/l455LjPp/mY6/slNL/Pl
 IWeDX/SKHQ1IhgnO3qBnVF8wtvslfkSapYrigQPV1aors4rk70zwbriaaeRQcdeXdbrUik+9iTr
 3y4uDFNV95Qi329Ra9ez75iaVqFrfO4Q+ODGlq+7zjND5K1GcfK5y1cIpR3I81f1Sq0lZ9fjpv4
 h1f7px11wK7Fdc86Finv+NEnaX9fp3ZGteNPzDPa2jUMjdrizhkZfb2yw+FlWWPjxf++GQuHhh1
 QN72G+PP935pvX3m6Ws0Pt6+XhQ/dbleqv5FzZ6UOZXSAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb3694d1685969c49b2760cbbddc840e..486e513b898d7f761e8615f2afc193ca44b23200 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5

