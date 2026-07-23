Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C042305695
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770515; cv=none; b=bBSyX+YR6+4I0PVk8wWCK/e3KAf8sGfAfa0TyyQGBJUzfS9QBT/DVHLShtYF2C8/UJaP8eYlSbzs3QbTWOtD8MSD2OB86k/tM6z6nNYtx2XqD24mocSjTuQWkM6SLnjJeG8otYgsurwtA6QUCC92hl1gR/jZC+qAmpiM327HB8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770515; c=relaxed/simple;
	bh=4oGfD9xRL7tcwtCWgFYxH78Gki6Yb77QKHGnTEVVcXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJE/F+REcvketrbg6LH+bxcoKOWkg1uf8zbDBiCQyxYgfdV7t2jcAZPs5m6Zv7+a1n9iJesgi6m/ImQcv4pcJYIrzCul3+riES9ReTClugsdI5JHbBZZ7WFxxnDuLIJX9dhAxdGXToC6QHUTFYl1cC3A5PdgF/HgZZroTHmnV3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=az469ucf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="az469ucf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770511;
	bh=4oGfD9xRL7tcwtCWgFYxH78Gki6Yb77QKHGnTEVVcXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=az469ucfGISetOTFWW22sTV4Zr0KE/Ql02TdhIy4bRTZG/iuum+shwrsBYeOQvU6u
	 sB2TdyHXpPGHds0bRmQhqTpzJHD2LSmV+HXLJT9wa+PuuxLA1VkNbDqc+AJ2TgrZau
	 pOuyxar1/gTJU2M3wt5bxiyP2v6HlQxLXhFS91KP4P6WaICg0pnVh9Swo6Vk36+SgT
	 mRnDp2mp3Yns+KnYCh9FUghAOz7ZKfm6OmNe3Aqdp54MFx0WH7ox9DV/Hd1Uc982lP
	 O2unCN1JVh/o+U0tnLn9sD7e9yYOPpl6h8AGsYit30z7ieZM79o7ZVF0iBYKwK6ZO0
	 VjJVCSQ75+/uQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D14FA17E1274;
	Thu, 23 Jul 2026 03:35:11 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:03 +0300
Subject: [PATCH v9 14/61] drm/display: bridge_connector: Wire up HDMI 2.0
 scrambler callbacks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-14-4fb12ea22ac9@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2

Connect the bridge connector's .scrambler_{enable|disable} callbacks to
the underlying bridge's .hdmi_scrambler_{enable|disable} funcs when
HDMI 2.0 conformance is advertised.

This completes the bridge connector plumbing so that the SCDC
scrambling helpers can control source-side scrambling through the
bridge chain.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 40 +++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 0d44a270b636..ed3b5b73a88a 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -574,6 +574,32 @@ static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connec
 	return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 }
 
+static int drm_bridge_connector_scrambler_enable(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_scrambler_enable(bridge);
+}
+
+static int drm_bridge_connector_scrambler_disable(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_scrambler_disable(bridge);
+}
+
 static const struct drm_edid *
 drm_bridge_connector_read_edid(struct drm_connector *connector)
 {
@@ -601,7 +627,7 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
 		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
 	},
-	/* audio, hdr_drm and spd are set dynamically during init */
+	/* scrambler, audio, hdr_drm and spd are set dynamically during init */
 };
 
 static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_audio_infoframe = {
@@ -905,6 +931,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			     !bridge->funcs->hdmi_clear_spd_infoframe))
 				return ERR_PTR(-EINVAL);
 
+			if (bridge->supported_hdmi_ver >= HDMI_VERSION_2_0 &&
+			    (!bridge->funcs->hdmi_scrambler_enable ||
+			     !bridge->funcs->hdmi_scrambler_disable))
+				return ERR_PTR(-EINVAL);
+
 			bridge_connector->bridge_hdmi = drm_bridge_get(bridge);
 		}
 
@@ -1024,6 +1055,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->hdmi_funcs.spd =
 				drm_bridge_connector_hdmi_spd_infoframe;
 
+		if (bridge_connector->bridge_hdmi->supported_hdmi_ver >= HDMI_VERSION_2_0) {
+			bridge_connector->hdmi_funcs.scrambler_enable =
+				drm_bridge_connector_scrambler_enable;
+			bridge_connector->hdmi_funcs.scrambler_disable =
+				drm_bridge_connector_scrambler_disable;
+		}
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       &drm_bridge_connector_funcs,
 					       &bridge_connector->hdmi_funcs,

-- 
2.55.0

