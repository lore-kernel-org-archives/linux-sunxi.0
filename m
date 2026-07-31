Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EEA45629B
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514787; cv=none; b=lT8jJ0cEWCcQz+bL9ioN1+QwJjS+cR3O3NCfRFpQsiN7ToAbSMuWTvOAKrmKJE9IMBuSnFqhKR5DYNctQYkJkDKhpF8q2EzbP7u29ThgSsCebJPn/bYpASeC1a9FqvllXoOrw9JQrj4ih2L81AHA94ODZ37/CWkkGefFCNv4qZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514787; c=relaxed/simple;
	bh=xADD6VVVgtOmKPZTcdjzwmKjLCfsgRP8n3AoLi1tKmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX9uxZO2D+jyLZ9Yuqx2W22FJW34DzDujZU4s295T8fH0lB1Rhm5AMc0MdfDhzXlJijCGsj2RBbDY55xX30sXFZfnRaq1uDxwiaaOu06YcTrQvqiSWdKqxCtc40NiODndygdLZy3sJJQIHxF6d+Omxshf/NHwmzemBhFIbhgOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NlFzFtAM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NlFzFtAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514762;
	bh=xADD6VVVgtOmKPZTcdjzwmKjLCfsgRP8n3AoLi1tKmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NlFzFtAMJTgoQJcSMgS8jlN99nELF/yDotOoL41GfoqWI0rTlmH9HBU8LTY7YlCk2
	 bXRiB57Eu5nQLlILc95fm11YfS4zFRkU5rGyq+3AwTvRKjTFihfZGycYsqxTwAefDp
	 2o+7lC84JLu78GRD5GBejKPN/CYC4vH5D+sSryAUEgbmxSPesuLXoVtzrcqNjgLwWZ
	 MRuIGXBPbw4wlwoVX+6umBp0rofztyZybALeH6ysT778QCJcWtF5APiOF6FxbqOFRt
	 BucdqwhLR3LqZ5lEgddCHRZXi/mQ1/ELsB64IhLvVqbf6c8iRFrRPaED/oHn9OrRGt
	 1CXvGhIJ+ayJw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CBBF17E091F;
	Fri, 31 Jul 2026 18:19:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:18 +0300
Subject: [PATCH v10 11/69] drm/display: hdmi: Advertise SCDC source version
 when scrambling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-11-294364b2cf15@collabora.com>
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
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2

The HDMI 2.0 spec advises that compliant Source devices report their
SCDC version in the Source Version register.  Do so when enabling
scrambling by calling drm_scdc_set_source_version().

Failures are non-fatal: SCDC version negotiation is purely informational
and does not gate scrambling or any high-bitrate functionality, so a
flaky DDC bus should not block scrambling setup.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index cfecfef639ad..493f2728ab86 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -16,6 +16,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_property.h>
 
+#define DRM_HDMI_SCDC_SOURCE_VERSION	1
 #define DRM_HDMI_SCDC_POLL_DELAY_MS	1000
 
 static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
@@ -556,6 +557,12 @@ int drm_connector_hdmi_enable_scrambling(struct drm_connector *connector,
 	if (!connector->ddc)
 		return -EINVAL;
 
+	/*
+	 * Advertise our SCDC source version. This is purely informational and
+	 * does not gate scrambling, so failures are non-fatal.
+	 */
+	drm_scdc_set_source_version(connector, DRM_HDMI_SCDC_SOURCE_VERSION);
+
 	drm_dbg_kms(dev, "Enabling scrambling\n");
 
 	if (!hdmi->scdc_work_initialized) {

-- 
2.55.0

