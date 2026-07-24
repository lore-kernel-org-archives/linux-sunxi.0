Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64567435AB2
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Jul 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903046; cv=pass; b=RnWug6U4P/XWjltbRhAoiObMOv6HAVa9ICvEIbhjr9phhaqKmBdBSSvZt+jLuKv2AOSqAUR8Xvre+wcBh+MAst6mCVDQoHR92pBAqTQbhEeah8sBjYdUfBoX836Kck2dcdjSo8whNIh9m/TsWWQ97AehGBA0BXuT8ETGFaxupL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903046; c=relaxed/simple;
	bh=uZWx+LNGsmz6mrWAnsy+obBgIY91BMfTN9kMd8FU5KY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYEUYZ0mVE2PfTJbrg8kKbnaVAI5Brjmq+7WCwbjoXSFUyj70s01fIiJghAeGPvvq5ozaGHPA5oDq1NYOSfl5gGYv9KiHAwLxfWMA5ZDc07kh5YB7kcOOpwobwOq4XdpJzFsx3Ut4fY0copOtXgRw4lvpFLQekzoIxBQSAOA/Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=MFrbv+D6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="MFrbv+D6"
ARC-Seal: i=1; a=rsa-sha256; t=1784903017; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V3UKGrt3xpiyRUXW8515DLWmIrPB/9wHhYjz/TIS9bkgScArpuoaPVdfb7re50LrsNO8gBH68QvIj2JwF1O7Bg3C4GPomErn4i50rJbuhudUGhUvx1rD8s+ewR4YcKd6xTK0Es6W41WzLcGcwlLLXeSEAtk/U4yjUn6nM3T8gV8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784903017; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/Bz0kOVpQ5EYH3MZETJm5OMDFXRozPcW4LBmQ5++M2c=; 
	b=OtjtXHlpFPrwjBXHPiMJkalbu6/oXCMC0N4eL3FSMONZWTBXPiDIlm7rlQuv3RaBy6EMxtZASG5SFlZeexG794NTGjy9aFH9jWK9PyTRJU8bfpfRCYe2ItyrZXQeuMaV/UJly9r/XwFyfy4ufRxwUrTKuXNzeF7u/crgJ/zBV5c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784903017;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/Bz0kOVpQ5EYH3MZETJm5OMDFXRozPcW4LBmQ5++M2c=;
	b=MFrbv+D6bfHq5zAanEVxswT9vF4rGP8+4iR8N25117wJdeAiPygrEO7Flx8QKmQv
	aeVMa7cCkV3T3+h6QfqSmNuBMKAvwti6wPbUeE8UZJbMAh7octC/alqLNbjTB31k3T0
	kSn5V0705utbCDc07ORachjwD+Q4zkfiK8ZARVYU=
Received: by mx.zohomail.com with SMTPS id 1784903014662276.19164388155514;
	Fri, 24 Jul 2026 07:23:34 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 24 Jul 2026 16:22:40 +0200
Subject: [PATCH v9 5/5] drm/display: hdmi-state-helper: Init SCDC debugfs
 for HDMI
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-scdc-link-health-v9-5-bdda406d016d@collabora.com>
References: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
In-Reply-To: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

Initialise the SCDC debugfs file for connectors that call the HDMI state
helper's debugfs_init helper. This makes all connectors that use the
helper expose the scdc_status file in their connector debugfs.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 8d5ee10ceb87..709524b40c26 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -13,6 +13,7 @@
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 
 /**
  * DOC: hdmi helpers
@@ -1116,6 +1117,7 @@ void drm_hdmi_connector_debugfs_init(struct drm_connector *connector,
 		return;
 
 	create_hdmi_infoframe_files(connector, dir);
+	drm_scdc_debugfs_init(connector, root);
 }
 EXPORT_SYMBOL(drm_hdmi_connector_debugfs_init);
 

-- 
2.55.0

