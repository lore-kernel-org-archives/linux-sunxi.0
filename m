Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9C154BFF
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Nov 2024 01:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931581; cv=none; b=e2I1WyU+tli5xdETM5JQttpObyrfMW40a3lEZeyrvJduS2Vxc5o0vlmMENXu5R9anL2wLtf/vrU0LDfJ67kccYbhyFwew5s+HOJcLPfvy3pjOYUdiQQh6tfOGW4cyCHV+gfXKZWV3c/h9TO/Qnh85jIBuI364M6sJzcQTby1/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931581; c=relaxed/simple;
	bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lX7eSRcKuHfejcMGKAVxxX3d/xV0uzOiJNxmHQB/NvEzLqnLyt0IsSdwB8hOTepsLdf2q3+O21YE+FiKT9TyAMcAFPDhonsHXW3SS/1lNbYZh1RwHjUHtFJCieVRy1+So6v1EC0Ml4i19AY4ZkrI5FEHPrfe/Ni+R9idGf+zvwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhXSNMki; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhXSNMki"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so2520522e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 17:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931578; x=1733536378; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=bhXSNMkio9ySW/2cvJKuBbHXUcePMxL+TpzGTkzI09zz5PBcEKy8+/A91OeAUKgJqJ
         nTyQsEH3K9BOWaOCD9gIp+uLxBuU0nR6LAQsiGIiJ0b9pFpoSzspvTvIsXXVPrELLrAn
         wXiKyb5dxOzOcxrzU3Y687VTl2CSpgm054TiWS4FTI/bqW8uLEOXSrGcgcZ+E0AtcDz7
         luOTKJw5Dky2j5X5ClwtGVYZ+60vPNWaaDHCpxmyPcz0UBBzwjTcT3bTh1H7FBe+dYWe
         QwdXkm1L+47+3OEPYYD8ggZHX2R9juqgzcC0AMgN8Uq+dMaQL5CMztICD06ex0AaRI4Q
         lSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931578; x=1733536378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=sOy778CK766gEeKKdnzyVUz899W9QAh28Vz8+zG0dXMeCmOjXLGUitomzpRFYCYDJg
         nsQv9Dz5JBRBdUBCFQis2arx3LEnW5Hw/shODhyWnz8TE137FGGt/cymATmpMrP9eQgw
         G2LRQOQUWz0r/lJPjyYHli19NTj2XxrYo+UBV3JVTSsjnXqVAhT6q5NgqrGSGmLolqZJ
         w81RpFkL0DOTFjtdf2CiM43j025Ub75siynAgzsTLWLcg2TWgeyIAo2PAUu5Z8QpPZGg
         LoDMJvxjGHjvZP1zsdYZ8o4WRtof+Rd0UeHpQTtoprFNdEbV00nlr3e0iWiL25ZWgQPt
         e2UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx0jenvQ+Oa00q8zcfuNq0KiAVG2/Uf6Md+jLonhxrlCKlWqErEWa5EapgAApEYI8r8TwYZWtlefaMbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZEvTcTbwlbuV1F5trL5so6qhtnHQQ+ou2Ne1Ln9gb/V90uEfH
	4glrj6k3KL6XCf0RLb367aTg726ndkeE5/grfPo3cTgSPYWIujBnf0wLKiHVEIQ=
X-Gm-Gg: ASbGncvFKJvjPqJFmvym8OzQIbGI5TOeclJJCb3MbBfp05Bvc09SVbVNkJOcZXk17To
	xeqXg3SmGrdaXYdWxUQSqzrlvEn1sfA0r30djf7uuTv+fq1uC2tNU4D1+KjdJzbdRHsNlge+v6f
	xNu9ph2/GgKhki0zrCYUOLYUfEvxTVeMcxDe8cAiqsCqYA9yc5pBlQnVAy+j8AHCzkLcOq0kF0P
	/dZnRwDxybLIKL7Y+bMnqufYQoSmLs8ahZ6sJZ0fIwct0gmYjPtm9aePw==
X-Google-Smtp-Source: AGHT+IEPMkwzovF1BGtYWQPhSNDkhj65yoNCvxf3xV+YxR9n/u9tv7nbpK4B1sxwKYxaX0pKkPUYkw==
X-Received: by 2002:a05:6512:3c81:b0:53d:ea1d:50fc with SMTP id 2adb3069b0e04-53df0111f03mr8755501e87.48.1732931577781;
        Fri, 29 Nov 2024 17:52:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:34 +0200
Subject: [PATCH v5 09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-9-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/hP4NTjv4z5OlKc/siHNPmPX53A9tMpMizW
 QagCkkZEseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4QAKCRCLPIo+Aiko
 1YEYCACSjhD/Ij07xD1HSZ7Kb4z+Son1xvlSmJAJ4SpssXNb9iPUFIVI8goXplbGswSwyMT7gN/
 TJA4uoW5pm1VZfjXG6tfbVQkLp1egYiDvrum1DeygQ92wEt56uRPyVIx4IdIfPtB4T4NeaaxRHz
 LQnkHZDgA5FLhdyenT4uGiwtnYN42jAeIQOKN9kR+a3UWYD+yYdlR7SqZ/7LE57ljVXynJbKs6g
 U1MS/hQbvYoXlzbGG88vk9XYuwEsCee0SN0HMVpBvPgf+iAWlBzry2fAO18n4a3PcxUb5yoO8pZ
 BJV4wpwjoTw7LieiIOIG62SIWjAAknBD03dVAhxa/2O9Jx3N
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

