Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04121DE4E0
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266810; cv=none; b=btZvk/rNm+vI4cLZ//m9HfMj6GRNzgD0PA9Jf3pjkuCFpsQsBVrqRdc+fKIAWnmVGKegfnjs+hoYh3JEIXlIO0be+aaKY4zm0q5BV3YVcEppFyYPjLoWbSWnMrn0Sz5qRKDItSKeA3YeF+DgNTkS/POfmyrX1Aih2nG/AIuik/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266810; c=relaxed/simple;
	bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTddfbH2LVUHTHLSza5if3v077flNGpbRe+aWvVMwKiWDvtZUtObnavpjSBqRek3PESC+mLWJ+QpPasS2yt9Ao+eJ43QwERa37g9O0hizzh1xS+wiWXiHv+wrA4x7CV6QRJeEnBoXlEjQJ9rgyNQ+xUgGvqpCrVOm6Grsbvegs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K7Q8R11d; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K7Q8R11d"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53c779ef19cso2228720e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 01:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266807; x=1732871607; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=K7Q8R11dyLko1nLwRKi/VN7yx+JgWWzHZi90jftQjZL+uTjMBqk2SzTEZoOlHZmVIz
         KBBf+nmW1AdjALaISLNDdfb0qq7+pXiZS/187Phpg+6b7s0Uciefg960dBVVqUAnCV08
         NQY8GFzMDg1BLKnL5jQm6xmN0DK0ofa6wUP//dz6f6okMzXrrQHFh77olBzfMDk6LSqU
         lW/MhUj5GjR5BZngDA30lT56BzCjBbipl1FpxHr6DTATbP+rYWFWUI7sypvfChMijMqE
         +cAcz3aNMUdQCNmxR6LiB+TDraI9VGL8k5zUYs1RJ8RPYGoga3sQKI3r3W4xW7f/AEiM
         bnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266807; x=1732871607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=LFDi+tBnxh47x3ZI5P6SfBpkwRAHt6ZeA4nw8bzqyUJfH01sW8Tqsdj0nxRmiGNdrM
         9qW3cMc2IoYAPqnvpQodGt70+t7ZTQShvFKe4526YjNRiBE8ZoKtUBDw0gmdUpcclRcR
         K+psXO9PyEamE/3ExQ+kjgjA6ffRo+Pek8uSGZxb5IOeoEvpjSB1B18+9OBU9QeKTKAS
         EhgIj3RXVC039poPzmRhKwfp53L/Wh2rjSrv3Kjt91jPnUg24hjryskcgNhlak0vODjM
         /UyPdExiqvlQBD9yhO4h8pAZuQkP+aCi8p524oT7zK3GAv8VpPA5HUwUUky/GfFU29oI
         y3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVbt/PUpSIhLcqY79rcTpOPLqj1lM2rEZAimDg0R1NmB6AZQNij/MwHMURYQ2UZJcf1gJaVzcVUe0FYMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjOi2JdmJKHpe9XohGRvpVLKMxpfpjClJuy/1qtyQ2lj7S3PH/
	cGO3bwG98D0tzcWBft5kaU/EyzWDEiolOb1JYDnS7F/k7c9bU61WLqZmFIzREOE=
X-Gm-Gg: ASbGncu19hOee/fg7TpPf5xL3WG6XY4nKw3vmiywJDU/U8LjH2MqsLN6mCAkaJ/+V30
	vsCKvAtIOauaM1Ux+64aiuDSZitWJcLgVLlz4ip1xpD0UKoVAX4go/JOvsRMtx5lWJ2qLB66EtS
	O6HiEV0LheIu2wTcSzOo1pRf9XqyYNsu4RWAhT+4jH9bSQcpjbBkD0Ii5gSN9xpc1aLFxYIP93+
	PLmbRYIKBJER1ZUc4Cdz4SL+Hr7v+cNo1q1IEcmAsgb98Xu16apLXKeWg==
X-Google-Smtp-Source: AGHT+IGP0twniqH2U7ywDpdM5USOAfTTfwclZMuf64h3sSsbdQOKH5VgJsG4NoD2/EPGUBvock6QuA==
X-Received: by 2002:a05:6512:3c96:b0:53d:a27a:2106 with SMTP id 2adb3069b0e04-53dd3ab0eebmr902104e87.55.1732266806968;
        Fri, 22 Nov 2024 01:13:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:03 +0200
Subject: [PATCH v4 07/10] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-7-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsipUZxr2L4H1CSYJPqrSWitJVJYT8cvGGNx
 VzJVBpVLQiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1Wg8CACUh+Qp1wI3QCkqrRc4xvtyhadjSchb8neePNvcL0EeS3MTH3BWZCvgSLpKslneK9k6yVL
 9DTKhgzCmZL0UPCkBx9as8mvdKQBUN1m/r3gplfEUsQe2bFoVBzI24JWS3ZAVJbe0RlQe5A+N4X
 EOOFCw+LkSv89UJBKWSvUvCm4ez0JYCuuQEDWX2MivOuHLjIzOHKXnubiYcFK9u3+KsRADnp1mi
 RBNUHr/fnJw+uvGlqRKuh3Z3pa9ig+V2gAlc7T2X4/0rhodFgbNr3XmxnOOKnL3E4DJ7eP9ejOS
 8KSZ5CU2TIorVoGQxGUAz2vtTDQ5bGJWekzxiEE6bqzE6v0O
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

