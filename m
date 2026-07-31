Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C6B46AA62
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514809; cv=none; b=URlsc00q8ZI+s4dp7OD9oMpMMoI0swYRGRJ5CjXFgejRXeFDGbiwfn2KPTx8pIvpIUwx3aWe9Hv/CA1CnKojDYSTVY4HjawW6/75joiuFPXRtNKdRFrVovU1kBFn+N7EvWKQnUwi40iJw8DN4O9Q9gimD4fK904bHp1mokbBSag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514809; c=relaxed/simple;
	bh=fw8obzJP5OPYqaOUFHt36T0iWpVWKUYn3AqoExbRHJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NuvaADBcaRKm4Vszeq7BGsbY8PT7BArqc4JRdNv11A1noHwJY6xyhMHYC0EezYQGR60rjv5QI3UnwP22+FYn12OnUt9/pyM5O6sPgPHdBim1g+2PSxYGbiCpuz6GfKMwuG2OwrMgRvaGqJ3Q2vTb/az7RBQT32/v7ABZZ9BKDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bHUZ9jy0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bHUZ9jy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514772;
	bh=fw8obzJP5OPYqaOUFHt36T0iWpVWKUYn3AqoExbRHJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bHUZ9jy0n2KaQdJ+NlJchUfjMKIpNDaY1O2NlzvV3A5HvWXoZMM7IRZTVMG3K7439
	 s2YHV/HLKccLhBWsoX0GYlj16Gv6MtgPL/dJJOjw7M8cHgTSLQofjn1anIAi3welAa
	 P3zm2biK/E60UMq7b/mbzTF5degQBChOYnrnjbVOtx2/R8blOQ6Sr44oUjLkh/w97h
	 xqLijZqfWRRPngypOZXrbdBeF/uYY92mDMOVn6vyjH8E5rCiaaHMXJ3sS26Bo5/d9J
	 bv3LYG4I5IScefPwS168XUXnna4Vd/im6cE9krxwD4/T2oDvCbEMGbZUUEXoIRbgBr
	 NMW3x1iQGpgZg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B948B17E08E0;
	Fri, 31 Jul 2026 18:19:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:32 +0300
Subject: [PATCH v10 25/69] drm/bridge: dw-hdmi-qp: Provide
 .{enable,disable}_hpd() PHY ops
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-25-294364b2cf15@collabora.com>
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

Implement the .hpd_enable() and .hpd_disable() bridge callbacks and
extend dw_hdmi_qp_phy_ops with corresponding hooks.

This enables the DRM core to control when HPD interrupts are armed,
which is needed to prevent premature interrupt delivery before the
connector is fully initialized, and to properly quiesce HPD during
suspend.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 18 ++++++++++++++++++
 include/drm/bridge/dw_hdmi_qp.h              |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 7475b6b71836..a0613f0d2ebc 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1189,6 +1189,22 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
 #define dw_hdmi_qp_cec_transmit NULL
 #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
 
+static void dw_hdmi_qp_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	if (hdmi->phy.ops->enable_hpd)
+		hdmi->phy.ops->enable_hpd(hdmi, hdmi->phy.data);
+}
+
+static void dw_hdmi_qp_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	if (hdmi->phy.ops->disable_hpd)
+		hdmi->phy.ops->disable_hpd(hdmi, hdmi->phy.data);
+}
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_get_output_bus_fmts = drm_atomic_helper_bridge_get_hdmi_output_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -1197,6 +1213,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_enable = dw_hdmi_qp_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
+	.hpd_enable = dw_hdmi_qp_bridge_hpd_enable,
+	.hpd_disable = dw_hdmi_qp_bridge_hpd_disable,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index 6ea9c561cfef..b80fceffc315 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -17,6 +17,8 @@ struct dw_hdmi_qp_phy_ops {
 	void (*disable)(struct dw_hdmi_qp *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*setup_hpd)(struct dw_hdmi_qp *hdmi, void *data);
+	void (*enable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
+	void (*disable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 };
 
 struct dw_hdmi_qp_plat_data {

-- 
2.55.0

