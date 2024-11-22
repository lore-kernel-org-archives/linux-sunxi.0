Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F61DFE14
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266818; cv=none; b=iRBcnKca/Ie5kDvQmkJ+byIwO7C3VMAAQCGatWaHi43/QxrnzDMV7ruK9xOo02KvUjyiCqfTXe0xbIgWlzOI0Pdf9QmvOwVROj9d+Sn2rShWJO5eu5pqlu3/87HGr23LjXsAU4TDzXhrGpkjhXVrhdK9tT/cFLKlYzwF26ekoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266818; c=relaxed/simple;
	bh=NRpLumrdDZhSXCJcusWkwzHsBkwvkTsOwVSCIyGYQBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlaJ/IwWFO1O4K0tVlYuyp/QCvLVbLpaVHVn465XYGZKh+j3QD9MToxSDIOZlPzUdW/Z6hs3kRLoc5JY/uWd11etl4ibep54TNX5qQmPmRl/aWl+Vm+zcQH6xU3tLuoFpV+MTCIhcZautn+9MtmaPJW+L+Gjt0air4RJHmYFFWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f2/VyLte; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2/VyLte"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so365770e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 01:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266814; x=1732871614; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
        b=f2/VyLteH3Ax/feGGQqTJyywSwxpJFXbIuAX3odpXHpM/LAIu4LrP/n4OperpVMyh4
         ONTS4UXbEO0k7jzv2Ypqh9dbXECNiTtAqsbAWZZi4RlTM6WmIPrgfxTNC3wmAZxyKNnf
         DkWbbAIidJ+DOoEB3eZWcIE04tW2YGkQc26rdaAdihMh/DNjOXvDL3rAIDp9iUrNtnom
         SYqB2LqzFQe4PPUa1RT2RaUChW5R5i7DVbnGdxmRRwRkMOqnYKdF4jFCE+duh7UiX5nl
         Fs18P4xhlLgfu6vjdpf994xPWegPHeoJi4GnVGjiSUbRs1E6Vu8SiAWeeHLwAP+p4LA6
         js9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266814; x=1732871614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
        b=gQ0zA/4o55l7gRmuKh1450qzys2Sprwji3bpKkkSppqXEParXNoxYJGQpiTen4t7h5
         ozQh8SicMxDT3fu/QGAWHIjmxwpv1BSRDkrKHvupT5N1S8RJlEVw2VPSvMk34mP0hoPE
         LgCwNQ3Wj2Gfsbl4TtswqzHv/vQq1bFIpb5bUs/0fDmxBrTPIpZOFRA05nhiXO5oF8Mu
         iD0gRTKHo9QeJaSz8x0rzjRRF4GYqvgGeTEArSovtgxOBzz9PLaE33E94wvHAPgtQ91m
         +fccAS3j/NcWgbVpohwyNGC9WuI96IjN0vx5SIFSHAb97IIV5hUvqtq7C+avrIW3XLIO
         AEYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnVaiHjktB4Pv1yUWxMZnlfiG5F1GRaRlOsjyCMZw3IVCXAXL8+MFox/Su1ZcNn17wYvb2BsADg6bKJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySKc6uIclxCl39u3RrQxkQMwbnSbGZiwaYV/q0xbP9fBy9JXuJ
	p8X74R8zjUdtRvxdxbeiJ7H7Bhqu9PLdCSW3tbtqR6GuqUYXftTngUi2JYK3mWE=
X-Gm-Gg: ASbGnctKuhnP+rDXppTtVaTC4HhglkB42/NVwO8hG3FfwLh28gkD6yobp4S2ZV7orgg
	gYTPm55GCW2rZGJxCtQOW71iY5zQs8X+MvGS3csIbDBd2aav52QefOMXQFQoAl7XDO7mxxtW2iN
	JZFabiaYuRUpggdFbypmmZ5FIx8UZpc7PmtvaWQ4ShzZQI0LS/4WvzXBKk/zcMSasFZ9cJvijh+
	kvPyjJCDaKyxCtFpTURSRrXWMsAiaxydmIEjp07Xgcbs6/xm8LbnhEzrQ==
X-Google-Smtp-Source: AGHT+IFuPDVVeiIBHBx+sqGVLigoH/J3FctzJhynNILKoVJRUYGgovyLxnstEYxyEorm8Lhl1P2kvQ==
X-Received: by 2002:a05:6512:230b:b0:539:f6c4:c29d with SMTP id 2adb3069b0e04-53dd39b4d2bmr879301e87.54.1732266814401;
        Fri, 22 Nov 2024 01:13:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:06 +0200
Subject: [PATCH v4 10/10] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-10-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NRpLumrdDZhSXCJcusWkwzHsBkwvkTsOwVSCIyGYQBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsiTDOV2BoHyoyOts+0adMkGX+r4MYsJsnPa
 Far8OQb/72JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1UrVB/4mHUMcziWq1wY32ABnFkVrTROOJMHkHk+6+aK4dszHbnC762R/MtVLV2lOqnA6MnxSNW0
 EVuY2bQWv4PVDAZe+RPKyAm1fyLq9OizOUvRo1l12zL/O2139m41O4x3tI0r6uFqif8Pn4rZMCk
 t2ZMyaLmzPC6ufRtblUgk+VXVLehNTanDBHYRGga0siqsAnC662tRVl9Nf7/u1NOCILS6qYcKel
 P1sPNcHJSvULZIp9OJpXG/FZB4M7PHg/tR5MlTQzjrj0PWaj0798D+vDyF6eDysiUqnzifGcaGx
 giuaughGqZtani8SvGv0/wuVrNdnUepnAPAPfoATeqV2sc3E
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Replace sun4i_hdmi_connector_atomic_check(), which performs just TMDS
char rate check, with drm_atomic_helper_connector_hdmi_check(), which
performs additional checks basing on the HDMI Connector's state.

Suggested-by: Maxime Ripard <mripard@kernel.org>
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

