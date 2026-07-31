Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618EC4582EA
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514825; cv=none; b=o6LRDDqGzHkyj7lKVUvEPVM4DkuKS/wz8TBCXKSfqmvPy1n1I82GUrKqRM6N3xGT+plOYTsnVamz3MI/FhSmma0YavZTp4FTMqlVwNu66A2A2o3ZFUgkMGUzRo60Mu2VhGpbfOyFhBk3/jBlQoYbCx/iunrHLOcQIBk/OKSvhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514825; c=relaxed/simple;
	bh=MQdOVA/KEPfHsOiZ2rC34pKBO1gpeVvQA+uY+o5VdNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGNizRqZblr333FQWT3/Tcp/Faqwv8Lz2c/qealettUKHNeZaUC5jgehJxkc28qmLoh3dVZfHQ1M/0O2GDhKquMzddIUtNRFw2FdYuDcJgvwjNihSZLWAev136fChARjq71658WQgfDbeTrmmwFhgOtlMfOBE9ESxh1ihT/iUS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eKzk6vye; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eKzk6vye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514803;
	bh=MQdOVA/KEPfHsOiZ2rC34pKBO1gpeVvQA+uY+o5VdNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eKzk6vyeyqD8l88eWaxN2HRRTCyXrbj+ObYgBuqzvXVheOg8SS6tgRx/a7bidt+7G
	 j1rdiyQayOMK4p1dyadG+dt301zdBl9rMQJMZgI5v1Ah0NrC+JGFSnHvBMjEAv6Qng
	 0HQO/PGA6iMleLGiQuvXy4ljBs3ijZNYYnco/vwva0wBkqG9rW0Z8VCXFhHgoSjpaz
	 pw0QGgUiMkxAvc0ZCgYlCRpsroCrHmxWhLP1gmCvmgrc8s0oS0jVp5MbX9vOQkvYul
	 0Pddcw/S3EZZaIWR1IrY5OjgdMLgyDEHEz3/r7JKYsgurMQnNAdIbbKJ6bvFN1VgeJ
	 3yUDvFB8pRrig==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00AC617E0B82;
	Fri, 31 Jul 2026 18:20:03 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:20:15 +0300
Subject: [PATCH v10 68/69] drm/connector: Drop redundant hdmi
 supported_formats field
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-68-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2

Now that all users migrated to the new drmm_connector_hdmi_init()
signature, supported_formats is provided through struct
drm_connector_hdmi_funcs, a reference to which is already stored in
drm_connector_hdmi.

Drop the redundant field from drm_connector_hdmi and point its users to
hdmi.funcs->supported_formats instead.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 ++-
 drivers/gpu/drm/drm_connector.c                 | 3 ---
 include/drm/drm_connector.h                     | 6 ------
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 83a8fcb41343..c5496641a2f3 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -426,7 +426,8 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return false;
 	}
 
-	if (!(connector->hdmi.supported_formats & BIT(format))) {
+	if (!connector->hdmi.funcs ||
+	    !(connector->hdmi.funcs->supported_formats & BIT(format))) {
 		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
 			    drm_hdmi_connector_get_output_format_name(format));
 		return false;
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f5f38dc4bfa6..293b2823475d 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -610,9 +610,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
-	connector->hdmi.supported_formats = hdmi_funcs->supported_formats;
-
 	/*
 	 * The supported HDMI version can be used to determinate the maximum
 	 * TMDS character rate allowed by the specification. Some controllers,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f7627de624de..75bd9ac03571 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2125,12 +2125,6 @@ struct drm_connector_hdmi_audio {
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
 struct drm_connector_hdmi {
-	/**
-	 * @supported_formats: Bitmask of @drm_output_color_format
-	 * supported by the controller.
-	 */
-	unsigned long supported_formats;
-
 	/**
 	 * @max_tmds_char_rate: Maximum TMDS character rate, in Hz,
 	 * supported by the controller.

-- 
2.55.0

