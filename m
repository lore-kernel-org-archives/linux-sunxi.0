Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12529149C6A
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Nov 2024 01:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931576; cv=none; b=GlYdofH07o+QkEpxx+wro50KX3sMoLvPY7zmhBM8Tsg85H5hewZ2PJRiz34ztNZnshPC2Ih+WuLpUBYwHTeRl9pa/twg5Qp4xWyl2YK8C4Qq/q//e6XQrAe3CANfsSW7Wafned0Sy8uvqixE1XyVGep7ztl52PWhsb/VQSKBORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931576; c=relaxed/simple;
	bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAO3n3pFdg5rxTxwzQRi7E2ZUEt+MuT73KDuxKtFBhrs2UMuLfmORRMsiJDhY2jiVVLSZqyTXF+9xTqecd2H8BtNNhTGYhWDyH/z3gIc87NMNIb0GO9uFkzAos9IV1eME9YYdpPup9T7gluj/yklMY+h8fJwlgBg3bv8vZoAPxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwrgzgkO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwrgzgkO"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53de880c77eso2975257e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 17:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931573; x=1733536373; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=VwrgzgkOWlYa5S+/j87/GkSBfo2zWh/8whKeSG7O8oNJt2OVsej8SpxdiFNeo+AqSJ
         YJtJyW/iuCh2OiQ1HXrTNjluL7EA1b3i/lGKHNvTQ6IFqawiXuTObluvkvcRJhx32aVz
         G+oS1RyuwT4iVqA5hfwiGtLcK/Jce5bzwqsH2gMUFWzWrnTLTwVBSsOzsnzngtacDqfD
         uBH+eW9w12JjBWs+gPJ9F+1Ib3UqcF41dK9VSNfy1vKan4aAN80JXnN5n4AUrOR4Baqk
         kJNlvVmtmdWkCW8BydAT1ENWeuLg9iUuP2S7wfUaLafSUjghPh2uBqR8pT75LoaagQQs
         RfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931573; x=1733536373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=og/AlPsRvYOm99Xo2/vlHiVDQSAZRrB1uwdKVx2cp6r2YbSMjmxJV5l86rtSv0lTwI
         /6xgEosbjpDyKwTbHrZyMl6JORJqzYKTTAq3eZbey4UCuCZehT4Mx9BWa4sLvwkhD9Rh
         eMbafjTOvar9GagtOMvUa9PPSZHxHiaahgWEO5UB6tQAkxKN3ZU08YV8b4GstSBDXN8p
         aWOlchSSxWiFzrn0pOcX/OuwEjFO1Tp9L45RWPSFjZx7TYp9KTT0YuGN1CAGPqDZHmxo
         3MNzRp8fUWinXfrA9S/hzy5kNltyNsVMCzhM5Eq4523YMqj7V6S3igtuelq8JVZ4ZdsT
         ex+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdY32dD7u4QqE+UZmK8oJ4WGV5d7xFZBgtUQJlb4dKY15cq0ZVp8e6ow9fa1euicofW9eGYhmsODfp8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs5xVHzghZuc95LJ/pIca6f1Os5E6KB0cGxgmeOxgQOm/cEuG3
	57nuzUZ91cKjM3/MB6QIJ6Ot2durILt4FTCTF2qw8OvpSDRtropS3Cn3+no5AdI=
X-Gm-Gg: ASbGncsqb5vuIIvrTS7ofvjdhxoiu4YQ6t93msJcvsCEHr/8a1QR4yUFUw++x4XJFAe
	0/kcL5LFT7takbeLKol9wFwdGEAmCJ8uwyvaj3ZalhKasZ8c+qK9r1DdFW35vT6mM3xEgo9SRaA
	s67Az3txw8lcPvCZM6anLBVKSJfjOXqhl1cuP//wr0hO2jb6QNFlEqwZYccu+gpc/OTT37VTNQO
	ErNYAOVE8iU9ByiFs1D3FafLvZbIi4FDPnzyuKT2KUlyF/OEbl/nhylfg==
X-Google-Smtp-Source: AGHT+IHEYj74nFURYbWP3Egy7gi3UHFs7eYCLy23sHhESjuboylGOmyFITklL7Me2c+2Ybp446w/LA==
X-Received: by 2002:a05:6512:2309:b0:539:8a9a:4e63 with SMTP id 2adb3069b0e04-53df01046eamr8488039e87.42.1732931573080;
        Fri, 29 Nov 2024 17:52:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:32 +0200
Subject: [PATCH v5 07/10] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-7-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7pX/oMCB23f3Dl28T72F5rnzAu3MnESPs7t7BUhWRXw9
 1Lk0aJORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAExEYR77/zqjCu2Eb83GP2fZ
 /I0qDXeMSL5+ZYbQYbd19606OYpCjUwuXJVSWeoa81rz0QYu07WsVn16WVMTGYueu147XR13uNh
 T6nVdSniXWePDn3mXvlrKHK50mhW0c3t02pUchYWCVXP7qrKitdadmLXiWI+o8cfyYlXF02Eyly
 7cTX1bkJGqtlrte/5e5WlWG9zv7gkRnvf55p2Lfx++Pbnlt5WNd9oMfjsnb9ajO+81VjS/XP3dY
 SrHTqfmxbM9vTmF2xI8hFOWLHGOvlCeUKheLD/vQJrwwT1xHc6L65eUXfbzuar8Yva7pbNVep+6
 KVt/9+9yTnXT9hR+d2mlSIHMxvcmVV+3q8leDvuV/cYaAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
bridge in the bridge chain. This removes the need to perform TMDS char
rate check manually in the bridge driver.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..512ced87ea18c74e182a558a686ddd83de891814 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -299,9 +300,22 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+drm_bridge_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hdmi)
+		return drm_hdmi_connector_mode_valid(connector, mode);
+
+	return MODE_OK;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
-	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };

-- 
2.39.5

