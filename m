Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C494380FF2
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770547; cv=none; b=uGYFHXtlBXaWLLzjMRfwc7SMR5v6ONimNNOegUs8RyWK7pbII08Ym5PQe4bowMMjB8u7t3VBxE+3q9paiinbYr935p/HyOwuTqrBxMiQ0yOfxyYKmWPziDPhLbH2n1hshZ0k4/o63Ma2H7sGJkJqI2r0yNO+Yyhek+XMoAXESuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770547; c=relaxed/simple;
	bh=8hXXUUWxa+3B2LxPEQqVUJAD9gifC9YUHL9RlKRVeXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jxa0l+igk3HFMH7tALw2Ep52hyL24sRIka2X3Zq+66cO+o5dGsTdf2s4e2zu1hB9TohI2ljsVdKLf/4lSZCOVXH3N5hP+0uMUeD3cq1Z5NW9vIsvH/0ew6eBeBeuSEAUN1aN9i5CYoe/zLuamz3CY2sA0lMEHzn/qOd5OGyIp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SipcEpV9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SipcEpV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770543;
	bh=8hXXUUWxa+3B2LxPEQqVUJAD9gifC9YUHL9RlKRVeXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SipcEpV9lZVbWiJqjW++uRT7tNPUstveDehNOmR+cR2MtSfMCu8W/G3Em3vbJJ/YT
	 fvtoF4bXI5cHgwLTQLqUrNpEQRdZsqH2VSUOoGkpFuAjwXbG81atqn75IsrG4e+/W1
	 /nV6Nl8q+kfWMwJjpArrKxr0vRsqkWK8gXnoOK6wo0+YJDTlNVHwDo62D11CPh8MSD
	 Ald7kzKEwyvGje0+PQ1R5+7X9X2Ci458ft3cQDgVLabMcJD4YDyQ5D36FtWE0cqHX3
	 TV9u/fNuyzhB59udhwurrm7XzVgSO7W9zCJr7lGWkpeKL9dKG8dF+eavLU+mJvH64e
	 Qrkz4AvfsYoKw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA98917E3869;
	Thu, 23 Jul 2026 03:35:43 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:49 +0300
Subject: [PATCH v9 60/61] drm/connector: Drop redundant hdmi
 supported_formats field
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-60-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

Now that all users migrated to the new drmm_connector_hdmi_init()
signature, supported_formats is provided through struct
drm_connector_hdmi_funcs, a reference to which is already stored in
drm_connector_hdmi.

Drop the redundant field from drm_connector_hdmi and point its users to
hdmi.funcs->supported_formats instead.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 ++-
 drivers/gpu/drm/drm_connector.c                 | 3 ---
 include/drm/drm_connector.h                     | 6 ------
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index bb4dd9d0b482..83af9426c69b 100644
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
index 837dbaa65eb0..27dfc26c6100 100644
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
index 03f4e6751165..e2ee5af6f7ac 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2119,12 +2119,6 @@ struct drm_connector_hdmi_audio {
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

