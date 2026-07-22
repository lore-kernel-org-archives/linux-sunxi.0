Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC735E1CE
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711584; cv=pass; b=Hae2ebAR6gwAjPMpY8Lt6Z4TS2XUM6veNW8xMMxEYdcsZhRHXX+RXVrkglVucSfTRwMGwpoOdZtxdT6ckDGGtuBIDA9QFCNyefmGQ3OTPsU+e6vXxJngQLEKJn99xv8Cc6727xOUA/UTiRaBpW2R/lfbNS1rhJ44lqXV+SwgGOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711584; c=relaxed/simple;
	bh=uZWx+LNGsmz6mrWAnsy+obBgIY91BMfTN9kMd8FU5KY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eO6nmcBjlH5bBu7C4WodRy2k4r+j45pnLS2D1XFzQC7q7qD16gsiAthajQtSpMt1guMu7BS/B81aPJFNpW8ldZLzNZz8ZmPdB5pepPP7r+v+xxW9i2f3ucWwrKNjsTK1hHg1TQJ2+oQHzjTVGyskSvR8nthyHZPA7NJ8uHhAY9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=G2tLvos0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="G2tLvos0"
ARC-Seal: i=1; a=rsa-sha256; t=1784711559; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ed6g9APePcwCYn0JNNPA9ST+yflkjqVKOt4lnYZ9CPWdxc9dm5K+TyCjE2Oxcxsj0NktVh41rt4RsEnCjZvm8cLzX4pn9O83jfCX7xCYIpNNkhtCmjveLugNT+5xyD5nw9CzFA/GPEjjda/BbFLlv35FhyaV0/tqumdkqpB00Yg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784711559; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/Bz0kOVpQ5EYH3MZETJm5OMDFXRozPcW4LBmQ5++M2c=; 
	b=Z4ydMRRRPPYPhi5FkSdiJuhECEht+JEU2+dO/RZAHKW1HHUudmb27Kmw9w8ffl5zVs8MA1acMxrU4ar27vYa3vcd4ka2xR5wdBb8Z52ODgk64qV+JuwKO0haXHu9R0Fc+CR2gudkYSREpWXfAnCPUn+fCQLiZqI/yHcE95EyYnc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784711559;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/Bz0kOVpQ5EYH3MZETJm5OMDFXRozPcW4LBmQ5++M2c=;
	b=G2tLvos0NrUX4ZV2ofI20ACxDLLMeLjU3biRBHZfKDfSmHJlSDMLIdv82G3EB35S
	1+et/b7s8RpgViNvrAR/IzIuMc1U2FBJgG8LYLyho1wIfh1Mn/3JLyTCMxDf4NgoDGy
	70+3fOmP+xbE392Edlqo3CLKp5Svm4aBgBdSVwOE=
Received: by mx.zohomail.com with SMTPS id 1784711558114144.08746265131617;
	Wed, 22 Jul 2026 02:12:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 22 Jul 2026 11:11:51 +0200
Subject: [PATCH v8 5/5] drm/display: hdmi-state-helper: Init SCDC debugfs
 for HDMI
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-scdc-link-health-v8-5-cd1dacbb85d9@collabora.com>
References: <20260722-scdc-link-health-v8-0-cd1dacbb85d9@collabora.com>
In-Reply-To: <20260722-scdc-link-health-v8-0-cd1dacbb85d9@collabora.com>
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

