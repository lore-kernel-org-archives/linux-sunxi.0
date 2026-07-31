Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20A845628E
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514782; cv=none; b=Z+x4cIudDAcjLW+f3kDU7n7YPfhSs+HaX8gsc7XECF18D9iYHNmNDNprYVml+SkLC0O8gcR/ymjKvh08wxEe2097/sQ3oH+oJoTFeP1/XUhgjz5keE1O13E8j5jygSryu/WSyiMWIEJ3mj2pssl26BEybSDL1QsSFZn3WsTXGiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514782; c=relaxed/simple;
	bh=t0n10iHhf/9/WODO+84lsoOn3fsfS146FQnPcalTtBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgCwgsu+3bxiBMAWbLZea6vYgtk4UagFSfpnEY6EvEsMTFRiBXkX9T7MldJEBeRWj2nlc5bOMtUvEvOT0yKq8QzZLWDiaMEoaxOQ+6NdDPQl4eR/T3+eVvl1OCXXfaztTnohIAl2N29yHvEmRwOMisD8F3h4H4u3q8oaeoo5upg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oPHcO2kn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oPHcO2kn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514770;
	bh=t0n10iHhf/9/WODO+84lsoOn3fsfS146FQnPcalTtBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oPHcO2knZfcrbYyL+Fyjs2Qx87cgYxiiKE6eaoviBJst4Fst+LYvUH9kJeDHkZAif
	 ntmEcCBKzOmQTFT7qRuERxlxK284mM6Nwb0ajFbO5vpskSBRFbu4p+TD03DoGJNKp2
	 XkqRKXOg2inVB3I4wq9MRCPDGrAfxQsbt97QdDAshF3LM3rS2Z19KqywLdXheF0uBd
	 0WFL2hG1/NywKSKOL6IIvr4YxOoaohamBh3JqI9tLu7UWHducnnnvylVuJKQqj33lB
	 qokdKyX7mYZS2PWkOIPKq72INkfG3TqH7wPEtlZ1u9Fs6Fk7HTq/EQ05GoH+YiTtdn
	 Gthb2vgTnznQw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A03517E0946;
	Fri, 31 Jul 2026 18:19:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:29 +0300
Subject: [PATCH v10 22/69] drm/display: hdmi-state-helper: Sync SCDC state
 on hotplug
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-22-294364b2cf15@collabora.com>
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

drm_atomic_helper_connector_hdmi_hotplug() does not currently
synchronize SCDC status on hotplug events, leaving the scrambler state
potentially inconsistent after (re)connect.

Hook drm_connector_hdmi_sync_scdc() into both the connect and disconnect
paths, replacing the existing TODOs around missing scrambler handling.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 4a93c279c9a7..3377ea936120 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1205,13 +1205,16 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 					enum drm_connector_status status)
 {
 	const struct drm_edid *drm_edid;
+	int ret = 0;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle scramber, HDMI sink disconnected.
-		drm_connector_hdmi_audio_plugged_notify(connector, false);
-		drm_edid_connector_update(connector, NULL);
-		drm_connector_cec_phys_addr_invalidate(connector);
-		return 0;
+		ret = drm_connector_hdmi_sync_scdc(connector, false, ctx);
+		if (ret != -EDEADLK) {
+			drm_connector_hdmi_audio_plugged_notify(connector, false);
+			drm_edid_connector_update(connector, NULL);
+			drm_connector_cec_phys_addr_invalidate(connector);
+		}
+		return ret;
 	}
 
 	if (connector->hdmi.funcs->read_edid)
@@ -1224,12 +1227,14 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle scramber, HDMI sink is now connected.
-		drm_connector_hdmi_audio_plugged_notify(connector, true);
-		drm_connector_cec_phys_addr_set(connector);
+		ret = drm_connector_hdmi_sync_scdc(connector, true, ctx);
+		if (ret != -EDEADLK) {
+			drm_connector_hdmi_audio_plugged_notify(connector, true);
+			drm_connector_cec_phys_addr_set(connector);
+		}
 	}
 
-	return 0;
+	return ret;
 }
 
 /**

-- 
2.55.0

