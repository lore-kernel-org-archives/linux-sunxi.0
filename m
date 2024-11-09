Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F20198A01
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Nov 2024 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731155728; cv=none; b=cPamDdL9OahoZ9+aySXng7JaEFcNNsR1vq72iceVBT7WKCLXWy4oJVpL5UJCJtqlL4nDIy6cIP5Ne9JKLOd78UZ3Q/CcQ4RQTiOp5UcBNrd10i8Wvr6U+e4jG25zvZat20pcvIOdhx/1fOpfDXfnJT7lgSQToe0Zyhy4a0SRYFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731155728; c=relaxed/simple;
	bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+iULINgPe8leIG8HlHL5BWgVa2Rrl0kgyqnpA3LnbMXNkXLA9jYUlBlm2Z+rK0LwZXI7BXVRFjVfokx9f3axoYLwlti5+VeZcQDEiJIsvaWXqMnf/i97GkXrX0w2E5pXEAlkALhNhOVpKZJpFSMqklBRAuFu2g+rj8BCinb4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q6+JyIY4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q6+JyIY4"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53c779ef19cso3779160e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Nov 2024 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155725; x=1731760525; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=Q6+JyIY4NOmVuygaRtSRWkMSSdKlB/2qY1ZJHQsG31zhuLcO2zi2tNAu4MdPxT8dRB
         i0QFzRiWOO7vXL3h9zvehYyjp3CE9xQLqp9KpMTuuM/vwEsfPNpnf5kj3Az0LeKPIxEx
         5IvOVcSLfyiD3telkzn+Mw8hvOTUSXbTs/xsbVjeabCcVGgBNiKjrhv4pVvrBv+uY+Yg
         ipmat3jggJtHk/sgAqka2th/3s31NnalbPxH/+qOyAjIK0coWM5CoN2aSZIxda8xLOnG
         Rn10tjev7JpVC5UMIjyYoN6d/sCd0Srnma9gzaRfmkMjXWajRs+0yMIt9WBWTpIGpMuF
         KIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155725; x=1731760525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=YxI1MBCPR3rTfdcmyVnpwTMrVhMwt4LdEYA7quN8g4PjkJGtHIiOAAqayg1OWscjsA
         Q+lWPtTGno7BEkLWHzzEOqpJlvITcfYKjFmt8Q2skgEAxIlGO3qXPa9JTyzlTp9Hj/5x
         gXZvJQPWqd/OQqJBFuehd9+K6V+PGumckuIZZLu3DnTxasqIytFk9GTJoV3TYTeJdkek
         tqpMA8sIcJYBjWEmwB92ov8T2M7bgCJbzRfiSNiv0j+DXjysdfz8nP4biO7mLWcl731H
         x7N1uGuEQHP7DiuI4N5fSB7hX/erC7pFxHv8LmQlcwiiPL6PF4phOIJlywMVWTpe6tej
         yPEw==
X-Forwarded-Encrypted: i=1; AJvYcCWOc4rgPl+I+RXf4/fK4GNKX8ULY0gdwP6Zb4yoL+dE+xIUgXdCkjFqMP+efjdpyMgz/QoQ/oirDVFu/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQyz0HKccYtapmO8ZMOvAAoazyoz6d7kGnqQrNf0+jx5MOUNxE
	tMbTqF5qrQOh8RQQLHdB50txzzw4C5OslSqPnQzSEfzUY7v9fJCugTVvuStWJrI=
X-Google-Smtp-Source: AGHT+IG2mF9zXCA/y3y0kG03UAbkXGpNVLSwpOM/qt6TF2Y6MK5K8/eQXGRo4a4HPRqLDiFR1eFg0A==
X-Received: by 2002:a05:6512:1592:b0:539:f51e:2465 with SMTP id 2adb3069b0e04-53d8628a83dmr3060627e87.22.1731155724584;
        Sat, 09 Nov 2024 04:35:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:08 +0200
Subject: [PATCH v3 4/7] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-4-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/KHIaludY1+1CnUBh/lq0s+PtcC5v0NONs
 Pv90ths6RCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1c5rB/95XEPGSJ2I/WYRUC9L7roQJ7z8kswhRTv6gT+rta7yHL8pZMMbulp8JmYNT6Rk6+a0XTK
 Z46yGeFYciY49oWjdprjny4+rAL4woYLtKm7yJFmib4najumMWlTV+Pj0JggMJqKwSTFZebEbZr
 xPGfugM6N8F456I3/6sjXptKWIF+VOVGk2tCwSDNlK5K3gX5l2adzR5ldrIquHhJWkh4ySTeUnU
 lJro1JwucnZoQ3+bJ4VWkPpcN4sZUWiMd8Or9Zknb6b9gLWnpIaANiowZHGh3Q1FHVaMUvnezMy
 lUGU0SiMa9kFJBSSehYWwauSlUUfkAEePIgEdIJPy/WCafW3
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

