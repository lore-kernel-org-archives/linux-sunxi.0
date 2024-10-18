Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1320CCCB
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283681; cv=none; b=Lh5Bex7D66FgKKGc0oTTZPi+/T2g1tM4rLZPO+xT5ggAZ1sBs8of6ylek7x46tyxviqmIPZXQRMnRiSPoWe1K0rxxRmChxr6TqX1SUwlhUP8CHBo8C2zOQMg9YfzZbdSz0LtSHZL5MeH4lY9GcWj0OY8GNDsUayuZ9Aq66IZ9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283681; c=relaxed/simple;
	bh=SLiFFY4mHaK2mj2q8xisga/Q9Y4nw81QpArU89KsdC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejfAkvNXYAKyr0arPcD2TAkNsew/RhSoojIowuzp881CNuqAvoXVvJuSU3zQS+qBqe8btyEfIdq+fT69/kUTPMEvdhwnALBnTQ9T5jw1DNb6KLNrwqoMRTH4r5BteOa27bvbRMyXWphm8JeQtscW3ps5hNa2o7V9x0Gxqe8wjcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ho1/qO7v; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ho1/qO7v"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2784555e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 13:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729283678; x=1729888478; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ca1rU5SjfCzQNv/FEym5QKCwQ3XnYE+z1oSBkBKPVBg=;
        b=Ho1/qO7vU6HLm9KmmJc1jSzofDiHg0KESyYMK3wrUsOOkWhtyJmefL46mx2ZEy4kmK
         TvDK5duvTEybJTh11/v6s3joA2xRWphoWYu2RjfPqKBQoR2SDRudkZWDUZSCLAzdGQHS
         vuNWAcYFT4T4LFYtiBTJG8XElZdj7lzKbE3q8/ednHFqrmxAmAxDWU1CWriYGLHEK/Sx
         rweKZ5SrfJ4/iu5Nwd7eHqE9kxH3lBqAVTeSnd7j7LgNje/qYOMP7MUhp5p7epVaBKVh
         W1beF+5CN1/jWOAGvujl+g+8qV3gdk2oiKGQHVY0xruA+54HGLH6WXZYrGGM2m/9VMOw
         BTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729283678; x=1729888478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca1rU5SjfCzQNv/FEym5QKCwQ3XnYE+z1oSBkBKPVBg=;
        b=nW1XLb9ARf1B6d7f028mAKtavHvJSWDTuYWsWOcMBKgWl6NRfn1mElQmzHW8oYu8sr
         /tTAm2LPv1uuoXLf5ILzKXvAGxkdTOctzI/VGIUV8Tv7FVmtY2Fw4w2jhjbfiLaGiweK
         eySNwyq2fcObHpulXLrwvAFb15kdZeDKgVjAVmXu8SzJ6WYD/lcjlMdYuaUFhrCOmY43
         ZiHzAzaD9UhJVBqcYWhxJsoGI4HckJJ1OwepC9gi30c6m/eFTkWA1j5RA7rjy4bDG31Z
         ioXZ3pwy4IFbPMa6mwGsERkRkWgxAmxNvF0CeYnoXOSvuHhxtlVqRohFm7/GLR5WpQ4+
         YD0A==
X-Forwarded-Encrypted: i=1; AJvYcCU8UJQUZDhi9IH4Kbc1WZuHNO3aoxpJHaxati9v2Q90SC269xQe4MySdq4enhUui4RTKqCF4kOy5pkhOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+iz+RHFhuPKJQScPe7N7nDhUV1TfB7mPsBO0HvzglR40JaL0F
	x5xl9hcvM95cNQ1w3hz3scn3BhCHxOKQ/MFmFmZZ3QwaNWdwB+vMhhg/C9xHXuQszE/Kay4WtcY
	GL9g=
X-Google-Smtp-Source: AGHT+IFTHfkrFtW/rXOHHbEDQkVHYXvE16LJg5mmb3Z1WRleIxcPDhcnmv9BafU4kuhPvZsMxuWfcA==
X-Received: by 2002:a05:6512:118c:b0:539:958a:8fb1 with SMTP id 2adb3069b0e04-53a1551168cmr1519828e87.60.1729283677753;
        Fri, 18 Oct 2024 13:34:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:34:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:34:21 +0300
Subject: [PATCH 3/6] drm/vc4: use drm_hdmi_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-hdmi-mode-valid-v1-3-6e49ae4801f7@linaro.org>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SLiFFY4mHaK2mj2q8xisga/Q9Y4nw81QpArU89KsdC0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZW5T8Y/qcRfISUNqKDHuO2cK3wsa4ZaEnDU
 L3k4nG0OqyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVgAKCRCLPIo+Aiko
 1V3DCACgaS2mX/0MXs81TWTKcZTjZ3KAqTJ3HrXMX6GnlBiCEqicvl7vBA4LM0KdCkTZk29pVaS
 FmoWyRYXnr0PklxZ9FlSqHz1LpsPCgONRG6Iq1szlo/1g4WbnHeracbGaj+Xt5QeFc83wJS1SMP
 PSssSHdZe/VhLGFADVaLuUvCim0834TLcmafqiK43Bx3yjx+XdZNXMc+75uXf3HD434HHhdA/Dz
 i1WWdq7icOPAZsT3xj3cbPCtGWy6ehHrkYS3R8vHwsIPJBVDPweWJxntNcRnQIIjxP2zNrDpo6x
 8G3v4fRMVwQ4wQe48iAB9NxgSl9mMIBEGeqryrzXVBfvHBhK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb36..486e513b898d 100644
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

