Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E2761FDF
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Nov 2024 00:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420733; cv=none; b=HIGiqvtgTJB0R7B4rn7o4/redZbJ82pcBsm8N2yhy/1vNXjZZoRvmyayivGyJ1Achz4QekKTwIlTbd48VOuv/NJ5vDrVQWeGueVnTqsRz3rpsBgBtRW3Sw9FjdjV+mT59EVh0uMkjAHsRItMOmDZf6S1VefK+X/OSApfM7PA990=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420733; c=relaxed/simple;
	bh=rnWWDnvK/2UdwmliNMd8qjy7ZbPEcXVWLie22T2NTNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlQ00Wkr9p6+C8wMBqANj57VNXctXX3FFhRzgImoyXcbRPoW1VM+FbFuo01UXZqb+cOpC5Kv60ewZVmG4DSgA5JeiL2sPhMtNucPE6aPajv2TlP4AwTSDPArowvcNWOIZZozME4ruLRuxq0XOA3wykbmaDMmSSBw4hEzOYyllq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2ynaQ3h; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2ynaQ3h"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f8490856so1600195e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420724; x=1731025524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hv2lxmvcj3iHqVSo1vO+GpyATUEKN5RREgLh1lW/pKI=;
        b=d2ynaQ3hqzmVSWiw0DR/SLoEU3aPILNinzASJe3sTbQFLA2pqTazRmb19Q3x3P2QhN
         BcSm8CMtAEzxkVJi41uqGqjQJM2u5ZkOCCUAtRcutHjgsYK16sa4xjUxRh2Z0bjX/Vj1
         rDF9JM2FpUUyYtneVDb8SpQXd8j+tfxq/0vnMkDfg9+lHplxWG9hfqA31sEsEnuQNgv7
         FSRDKAW0SRfaTAVORO8277PaTmcfyeoPG1vYCGIlrhwUEdRvBQhf2upD7cYl9ex9Y6RW
         sXMMLmBo3XH0GZ4ITI/qBTONIQ95h+9K9aHH83FPqpQjajIo/wA0ptZwh5Nph2y2pOSg
         XtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420724; x=1731025524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hv2lxmvcj3iHqVSo1vO+GpyATUEKN5RREgLh1lW/pKI=;
        b=ADgReNJjKY4zlAX4hQ3yAJL+LiJXJYQJgTFe1K9K0nrTUmaa8PMNYm1dHK8bp2J8OE
         H7WjRSrQ/XtaCG1cnFuW5+FeAnGKifewvnkdBJOrW2pGlFErDVLMeyo/9UYS6tK5NuIS
         kzYah0cN+lqV18XGIsQCojxaa1ZwEYZobmPcezxXW3ARDJrPs3ExKf/3jKbq2kVcZyiu
         N1IyE9fVLvclnF2tbesd/+8yg3G1LT6LxUcldkBk/lhrXzFChEIVN91ThCk++mRFqvZ1
         tlMsopBHLp0B8uWLOdlVInYAEI6nucNyaczNyQVQTW9u/BMOwmyTBZlNreBRqiYQKV6T
         sdXA==
X-Forwarded-Encrypted: i=1; AJvYcCWYyvLnUpAgRUfT7qcSLaHM6s4WJXSdYp5RgPb1Gvjag/wtEgQ4hRnFTB3fYGBYnhWFxTxCE4NUy5ZmAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUsmZcE5H9nGk2qRQ5YXGPVudUaaUK/NxoaSUPu5+yRIKNmktw
	TGgeNnf87vhmAMhEnpydEt7UMtZ6kwK891BqkAZFy86gtdsHVH9d08Sk0IYQhuA=
X-Google-Smtp-Source: AGHT+IEAG9yn1GIhE2YrHT9rrcbTzRT2YsspXsGtFKg4MG2x8/7FF58dsirEGqVuW26T1ugiJs7GKw==
X-Received: by 2002:a05:6512:1106:b0:539:8b49:8939 with SMTP id 2adb3069b0e04-53c79e913efmr2851992e87.41.1730420723969;
        Thu, 31 Oct 2024 17:25:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:09 +0200
Subject: [PATCH v2 6/6] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-6-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2043;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rnWWDnvK/2UdwmliNMd8qjy7ZbPEcXVWLie22T2NTNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/iyyoKxhJ9ymVIF5jZKxhY4Q/llakDKMFQT
 BEjedUrIaeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4gAKCRCLPIo+Aiko
 1URAB/0Q+lN9KyT42dXskzxxSyFiafqSlV1SV+VcON3MjaaEaECIjnFoHbPKEDxvle6Xicl7vHs
 h46RF3lrs7ptPTroESb/pvPY/Jj5EK9/dqatVhqiLYq2adABTz85k64UaLF9WIvj1pF54o1lMJJ
 0R4OFGKZEAjC02s31dNE4fIMUbhsnc8JNoP15YRKxjq6AvslRKkkh+qCN5QhotWa9AUe6/FuS3d
 S7bNUR5mrFzDH3QH2n196BQPAJqsuELq2I2VbXoJuXeBSoQHuH5Dlli1/25UfCBLmbABtstMdis
 ux9EbzgijZfuFg2ndroerRXzSm8rHmu9np1KtZBbhZYdo8ju
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5

