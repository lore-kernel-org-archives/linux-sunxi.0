Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121F1D9A79
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266808; cv=none; b=Enx7O3UXQtZuBti75VIe0aLqRNKhvyMVEAFYQRV/iWVAY6PIWYEF1J4RMpKTstyR7aqIGOgU8A6nsR4S26MGU/cMIdOmSjFMyM9F9Xiq1OO5UB0PYtas4NLy1Tg05ItoMNdVpwI1bRvDKJ2u2dKiGXx226D7y3EK6zvBLwpDB7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266808; c=relaxed/simple;
	bh=V4oVcdTHVT3mKFPFYYqaTi+sHqWjzKg7CIWwA7qtBbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfrs0pt8MmC9IMG6rAbbFhwTkZ0k1XO/AZ58Agpuue8asQyz4FjD0+madJpVrkt29Y/xNAYeLk2RuVXNzTI2kSHrkkgL2nMGPg4Z2HkwO3vBpQtP8dbhY96VhtlqmTQg6FOuI1DdqHiJ1ptFwb/WNIqHgP2yx43JFTnk1mB2zrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8qvvfA+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8qvvfA+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53dd57589c8so322358e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 01:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266804; x=1732871604; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yuGfl/EBV1L9yZwllQ4z7rC0GCiUIVGF8V+6a/LgMU=;
        b=K8qvvfA+TPOXBGNgtXmlBgHdhOPX1dZ7MzX/K1YoUNLB2U12sz8M2UoLKBpGie5K32
         uZuIqAIXcmM6OhrPODWDQOWLDBAUg/W0vkzPL49flf8ZYBsQrGgfYisCrD1odSq+2HBW
         YJJ/q1egnil/iFI55P1rz0MG0YPt+ZB2MGAa/B/sbmOKVahvYwrwb80Y0nDGtYwM7FEO
         8I8bKShVYXxcNGibH4ioxKEuqw4kow8F1xGWl5EQ9nZwjWg/5gyr3ERNLeeBGcS5bLFr
         bfQutISvV8Fco31FeG5lt65YbrhSO5YylDWCZlhO3SgjAg2VbL7TLtb444xfcy5NEeXc
         FIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266804; x=1732871604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yuGfl/EBV1L9yZwllQ4z7rC0GCiUIVGF8V+6a/LgMU=;
        b=fGjGGrUWo93GWTYAi+OG/tjBuNnktnXpA2vMSNmjrg/96oTxjWd8YMrlQgfjWQ0RaG
         HXy0cUy02nogrep9vD5SUWUlVmy6b0826cQ81dADtyCEZLISHnGxHggyjz3/BUb4dCOk
         HCXcL0veXkAN0jJMCJOmYtYeqLOy8VcFKVv7cGHNOnjkY+kMDgR6/c7heMPOywkGzyh/
         rsN9yq3fPfZBB/g0Xcp0H7BNKJ5LQkqQR0QLc9O+iRrVXpe6pZXxnEslnSy3SrHvG8i1
         QAIPyGAxXRgFHAkjokjEZ3CccyadIzRKdL9JX++9HuKwrnZCtah/N5cI12numzdSXtDb
         SDgA==
X-Forwarded-Encrypted: i=1; AJvYcCVMMBp8KDSe4UjSD4Q3gn5xnfvmH4hkwLdJJrV5vKkPQX7mhIcVrKPz4BvvXDkXt3fncYyvrdy7lMqAvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJNOqPc9OwBSEsQXxdfe5aPdoC/N736jnHMyX0mDff+AANgFco
	O+pn5n/A8Kddy/0ucjBxaugHcNMlhmG31RHObrzsURTA7hMbWfgdhZzKVGq1Jpg=
X-Gm-Gg: ASbGncuJqq6VBKcz7oRs7I/9SbD9kmFCyCceMpDXT1SM8v2qUmqX40u41C6MiIkWVbT
	STAnwj8UVEg+komlABaAhR5mHN3zPBaIQAJRkVgUbFwzN3cJ7W6WTVyjPGZbg2UIHkZwS6ZMfGR
	3N++kAIm3ODGLChV3qtGCWK2tk6lNk00Qq/fWtpfV/o2Jilbappgc/0zcnp3+UbxpZ0CStKT+X9
	w5FhI6Ofokh0WAff8TTp8Onqhgs1MxdxgCHLpgraWhp6V6Fvwtct4VgdQ==
X-Google-Smtp-Source: AGHT+IFLvHEAOMFsbgXw0Dwjm3ehikp3aJtpuOLNAA/Ny7NGqmxqJedFV/QSTgM4ejrUuhK9ANir2A==
X-Received: by 2002:a05:6512:3c8a:b0:539:fd75:2b6c with SMTP id 2adb3069b0e04-53dc618307bmr1957531e87.21.1732266804495;
        Fri, 22 Nov 2024 01:13:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:02 +0200
Subject: [PATCH v4 06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-6-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V4oVcdTHVT3mKFPFYYqaTi+sHqWjzKg7CIWwA7qtBbc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7qDt5JRalysFtfhpV3XJx9r4HUI7Mk6MKsr+cPD+3Hfb
 Jbz8vN1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiGk84GPqERKMOmjLumLjD
 MnKKz41Pm3N+pJ9/n8z0rvuN6cMZVyc75WV+fMW/4fbSA2vvrrVpMe45G3ww+9aP3vVvnz98rSu
 4O/isbPYRnyflj5ydRXks1ul3emxm9fvxfFpOelVarJm2RHEYa/6RS44puVXrtA+wmssZ5c0uzJ
 ygVmJ9LPPTud7Y0PcL77Sd/xHW+ob7VvMR38uiHV0XZA79iVnTJeCicc++kzU/JSzJ6oPkpn6nn
 mvqh9ltP5Y1VQhNcD2W0HDzreEji7nuNWpRnX37Lrr1bVsfapB0u+3tivnhToYGkh6Ov7Pn7ivy
 U2d2yzm0/xyn4Lp0CR2pL0vk/PYt+hT85/Dzhto1cnINAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb3694d1685969c49b2760cbbddc840e..2fecaac0df0acd865186ee928cf26449799fc7ba 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -580,6 +580,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
+	.mode_valid = drm_hdmi_connector_mode_valid,
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
@@ -1752,7 +1753,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1760,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return MODE_OK;
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5

