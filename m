Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FD1BDC3
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Nov 2024 00:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420723; cv=none; b=pDgpQwoWw2kA3z7uvn8CdKVxD/y2lrOt2hMHdysFcGLNx1HEmA5R8uAGHmlSup6N3SQ1/umq2L6uUy4jNAFnjgcYEIi21Ca6t+tThlqsmibks3QKBoiYFT6G0KDGLyx2ej3C90xV1r06rif+vdpbMzsoO0ZYO5w64nzznme6n2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420723; c=relaxed/simple;
	bh=j8Ztg9arYN1ELRagVfF2elNxB8pJWUt6BffPwIK5vkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=apw3L7f8Fndb2V2Ix2YZkq9K3PDSVJLk8i1C7RyaEGm7YgZLYTDtJm6E18VkiatzU6XSRlYhBb70wgdBYPPlsEW+cxRiisqDhz/aR/5aIRsvaP4MZtYWSNkqTCNExh+R4XlWJgSgf9UJ/rNljYImOtEPpYojdXXztoduixWVZE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FG3OTey8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FG3OTey8"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f8490856so1600109e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420716; x=1731025516; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz8IVPHbbVKsM7ENVrxAMUhoPK6SMfJXrPI8pxkC7X8=;
        b=FG3OTey8b3TtwA1btbTtPQk0ZuXc33alGESB2xCl92QmRsbNwTFzsEGAU9dUduyYcV
         /a+91BaBTrolzJr4dE3MgFqhWIughm21p6KYalOMiSPk0C/EonoWnezKXgctyh2B4EQY
         eKfwQc2Odtko77QHiuCrn8wTsdVTdUTfsPcKDHlVikpj5VAQmugq4oNaDnXEQh3G6gmv
         Kk6fywH5Upo/AHa7f2fI5GyvnW+J2kGMief/w5zCxbgAZKzPQBGY7QPtlb/1dtDKXvbv
         oERLqFIC1GEXAE+Q26U67seYDZvh3bejJBERxpk5RdEEMAzmIkluZHsdVOrLlcDvRGFv
         Rszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420716; x=1731025516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oz8IVPHbbVKsM7ENVrxAMUhoPK6SMfJXrPI8pxkC7X8=;
        b=GxM8gsLyLXBactPzGLacH6lW2Nrav6jo5Qzms9HkEOe6uQvB7krMRF04bBjt68nLAu
         U/zS5nC8JW8xmDT275O3nOlFhXLtaDm4dTi4M7Rgn8a4ImuIBabnp84pOs7rY7Q23HpL
         JEmNTp6oFfTQxC75Ujd+S6G+yeggmKISwP+4FZozwoi3vJQ5bT85EwRJIn5irf8HxUel
         3S7yRT/XNA6BO+jn5NgLQAC/mVc4SzFId+oNG750d+60fU9V6vZI0aPLWrjN4j2vqVVn
         OljFKpwzDj76QzwytUP6bsIpYJDQzPMIi00aI6GiJCs2/tnJUbmMBRvIIKEobjPSmPEx
         Sjsg==
X-Forwarded-Encrypted: i=1; AJvYcCV93RxJC3SRsCbn0UokgbLGrEYy4M2mOnV0WyhhGj4fjaJ08q36NNNmT6DW/fTr5jskGTEzLjTm/Q22Ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYwP2301RZfN67IGGFlM4WZllBRYqXOENpJZYlojTvkY1qZKq
	d3l75ey93LUYHJHJEqi9ZLnHM89m3kEjPiCosVNZWpXxz4HKQlFGUEri+gEbeE4=
X-Google-Smtp-Source: AGHT+IHcnRqxSLmcfcXWYuLKSdTWcQFnoMfz9gg3tI8jWHEyOYxomQLugov09w4G+e8FKbd9IggEGQ==
X-Received: by 2002:a05:6512:2214:b0:539:fb49:c489 with SMTP id 2adb3069b0e04-53c79e16c2emr2460125e87.9.1730420716030;
        Thu, 31 Oct 2024 17:25:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:06 +0200
Subject: [PATCH v2 3/6] drm/vc4: use drm_hdmi_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j8Ztg9arYN1ELRagVfF2elNxB8pJWUt6BffPwIK5vkY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hBB9KzuzMuq6rZPVIIyhq0/H5DKznjnvjc
 mWPqbE1GVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1SHmB/wLX9KwONfQBArsPgo8Qz/Mgw1Z4L54OL1ZshkDnVR+j6A1CHLrTiAn9haUM9+bgg1kAdT
 mJ5lQ2iexzQSb+vqQ6TPriswRPmiJPhsRJ8Hrt/j7l7zjpf00cpdDUCc0xX4hq2FGgi2OnwrGH9
 8t/FOZqEZsmzrkkDf5Brms3bEZHmxOsYdt9C3Cr+6DGf/B41PgSXAgbp4X64iQN1BlkEly/Otaj
 vLINazwB3mxY9sN4JmhaZfrTWHNbe/39wV4Y7rA7ZCZ696ZvbGQULrGumY5jceHeqNseiYK8cB1
 UvP4ZZBU5mNKzwSAMaXF0LHzTr5DeBG8s4VVaM5S3ylORuQO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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

