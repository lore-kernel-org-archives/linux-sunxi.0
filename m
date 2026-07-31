Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508534582E3
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514796; cv=none; b=Jlp4EtSoaZHwIXBh/zxGZQFspaesdtDA3N7L9mFXGkT5NM+liLJX0LAfQOcgZVnP1F+dtcKum+56KOgJKYpZhZ5C21PCDYZvl34+u4E/up+EQVZyLGequsTRWqqQ67ZkLyoujFUpgk4KrRYhoWPij/5nAryUQzzRtPj6fJgIxEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514796; c=relaxed/simple;
	bh=HLqZQKV5JFNObYB5noaYf2bUTn1vvtuCTd3ferhs8B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awc7Ms3IYpkMT53x4xZnBrMvcEhH7yg/Q/X/aTWDQ2OHePL0sfrXzrckn5G++pwzhs2A0Ws8goSh/MSqrb8lMRqsHp1/23PmhZ1yNFO4bevq2fF8jFcFMKs42/wDDdxXbW78+fI1LRzIlvvj054cw9QwYQWn0ePZkldGjHkKm2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hvzWtqOS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hvzWtqOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514787;
	bh=HLqZQKV5JFNObYB5noaYf2bUTn1vvtuCTd3ferhs8B8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hvzWtqOSUFMROagsImQZW2ttdWqJuTlsdsG6dOOo//Q8r1Inh9ThmMn4AHyJzQWb7
	 eUpJ2vF+emDjb83pb0OMtZnznLHoYJ2f6Dp0PYfUM8Bz9LmsFhbDhcBR1KxGX8NMv2
	 WND0kxxYi8DDyyhCErS2Dx55BIYjpfJrQQ5exule6HOKNDwVPfJEl+qBXLjL/gHKRo
	 EWdwjt01ZZt1u742bJH7prEHNMMBMmvpC5X055uzEAPGr7x90N+DffmkkrFBHIzBh8
	 kje/DYSA148rQNDMcySvqojCN1ovpvlAbd41lKTV/R8USXh46lTioFyHuqiYo3uJlV
	 +q2evZqpqlpxQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBAFA17E0990;
	Fri, 31 Jul 2026 18:19:46 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:52 +0300
Subject: [PATCH v10 45/69] drm/vc4: hdmi: Convert to common HDMI 2.0
 scrambling infrastructure
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-45-294364b2cf15@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

Replace driver local scrambling logic with the newly introduced common
HDMI 2.0 scrambling support:

- Advertise source-side scrambling capability by setting supported HDMI
  version based on the variant's max_pixel_clock.

- Provide minimal .scrambler_{enable,disable} connector callbacks that
  only toggle the VC5 HDMI_SCRAMBLER_CTL register, while delegating
  sink-side SCDC programming and periodic status monitoring to
  drm_connector_hdmi_{enable,disable}_scrambling().

- Drop vc4_hdmi_reset_link() and vc4_hdmi_handle_hotplug(), switching
  the .detect_ctx() path to drm_atomic_helper_connector_hdmi_hotplug()
  which internally calls drm_connector_hdmi_sync_scdc() to trigger a
  CRTC reset on reconnection.

- Drop the local scrambling_work delayed workqueue and scdc_enabled
  flag, now tracked by the common drm_connector_hdmi layer, as well as
  the now unused output_{bpc,color_format} driver data members.

No functional change intended.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 230 +++++------------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  21 ----
 2 files changed, 28 insertions(+), 223 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d599957fee3a..ec0c1f4224d7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -35,7 +35,6 @@
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
-#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
@@ -114,22 +113,6 @@
 #define HSM_MIN_CLOCK_FREQ	120000000
 #define CEC_CLOCK_FREQ 40000
 
-static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
-{
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	if (!display->is_hdmi)
-		return false;
-
-	if (!display->hdmi.scdc.supported ||
-	    !display->hdmi.scdc.scrambling.supported)
-		return false;
-
-	return true;
-}
-
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
@@ -263,115 +246,6 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
-static int vc4_hdmi_reset_link(struct drm_connector *connector,
-			       struct drm_modeset_acquire_ctx *ctx)
-{
-	struct drm_device *drm;
-	struct vc4_hdmi *vc4_hdmi;
-	struct drm_connector_state *conn_state;
-	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *crtc;
-	bool scrambling_needed;
-	u8 config;
-	int ret;
-
-	if (!connector)
-		return 0;
-
-	drm = connector->dev;
-	ret = drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);
-	if (ret)
-		return ret;
-
-	conn_state = connector->state;
-	crtc = conn_state->crtc;
-	if (!crtc)
-		return 0;
-
-	ret = drm_modeset_lock(&crtc->mutex, ctx);
-	if (ret)
-		return ret;
-
-	crtc_state = crtc->state;
-	if (!crtc_state->active)
-		return 0;
-
-	vc4_hdmi = connector_to_vc4_hdmi(connector);
-	mutex_lock(&vc4_hdmi->mutex);
-
-	if (!vc4_hdmi_supports_scrambling(vc4_hdmi)) {
-		mutex_unlock(&vc4_hdmi->mutex);
-		return 0;
-	}
-
-	scrambling_needed = drm_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_adjusted_mode,
-							   vc4_hdmi->output_bpc,
-							   vc4_hdmi->output_format);
-	if (!scrambling_needed) {
-		mutex_unlock(&vc4_hdmi->mutex);
-		return 0;
-	}
-
-	if (conn_state->commit &&
-	    !try_wait_for_completion(&conn_state->commit->hw_done)) {
-		mutex_unlock(&vc4_hdmi->mutex);
-		return 0;
-	}
-
-	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
-	if (ret < 0) {
-		drm_err(drm, "Failed to read TMDS config: %d\n", ret);
-		mutex_unlock(&vc4_hdmi->mutex);
-		return 0;
-	}
-
-	if (!!(config & SCDC_SCRAMBLING_ENABLE) == scrambling_needed) {
-		mutex_unlock(&vc4_hdmi->mutex);
-		return 0;
-	}
-
-	mutex_unlock(&vc4_hdmi->mutex);
-
-	/*
-	 * HDMI 2.0 says that one should not send scrambled data
-	 * prior to configuring the sink scrambling, and that
-	 * TMDS clock/data transmission should be suspended when
-	 * changing the TMDS clock rate in the sink. So let's
-	 * just do a full modeset here, even though some sinks
-	 * would be perfectly happy if were to just reconfigure
-	 * the SCDC settings on the fly.
-	 */
-	return drm_atomic_helper_reset_crtc(crtc, ctx);
-}
-
-static int vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
-				   struct drm_modeset_acquire_ctx *ctx,
-				   enum drm_connector_status status)
-{
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	/*
-	 * NOTE: This function should really be called with vc4_hdmi->mutex
-	 * held, but doing so results in reentrancy issues since
-	 * cec_s_phys_addr() might call .adap_enable, which leads to that
-	 * funtion being called with our mutex held.
-	 *
-	 * A similar situation occurs with vc4_hdmi_reset_link() that
-	 * will call into our KMS hooks if the scrambling was enabled.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_atomic_helper_connector_hdmi_hotplug(connector, ctx, status);
-
-	if (status != connector_status_connected)
-		return 0;
-
-	return vc4_hdmi_reset_link(connector, ctx);
-}
-
 static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 					 struct drm_modeset_acquire_ctx *ctx,
 					 bool force)
@@ -383,8 +257,8 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 	/*
 	 * NOTE: This function should really take vc4_hdmi->mutex, but
 	 * doing so results in reentrancy issues since
-	 * vc4_hdmi_handle_hotplug() can call into other functions that
-	 * would take the mutex while it's held here.
+	 * drm_atomic_helper_connector_hdmi_hotplug() can call into other
+	 * functions that would take the mutex while it's held here.
 	 *
 	 * Concurrency isn't an issue at the moment since we don't share
 	 * any state with any of the other frameworks so we can ignore
@@ -407,7 +281,8 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 			status = connector_status_connected;
 	}
 
-	ret = vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
+	ret = drm_atomic_helper_connector_hdmi_hotplug(connector, ctx, status);
+
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return ret == -EDEADLK ? ret : status;
@@ -534,6 +409,14 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
+	/*
+	 * Since we don't know the state of the controller and its
+	 * display (if any), let's assume it's always enabled.
+	 * drm_connector_hdmi_disable_scrambling() will thus run at boot,
+	 * make sure it's disabled, and avoid any inconsistency.
+	 */
+	connector->hdmi.scrambler_enabled = drm_connector_hdmi_scrambler_supported(connector);
+
 	/*
 	 * Some of the properties below require access to state, like bpc.
 	 * Allocate some default initial connector state with our reset helper.
@@ -759,32 +642,15 @@ static int vc4_hdmi_write_spd_infoframe(struct drm_connector *connector,
 					buffer, len);
 }
 
-#define SCRAMBLING_POLLING_DELAY_MS	1000
-
-static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
+static int vc4_hdmi_scrambler_enable(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = connector->dev;
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 	int idx;
 
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
-		return;
-
-	if (!drm_hdmi_mode_needs_scrambling(mode,
-					    vc4_hdmi->output_bpc,
-					    vc4_hdmi->output_format))
-		return;
-
 	if (!drm_dev_enter(drm, &idx))
-		return;
-
-	drm_scdc_set_high_tmds_clock_ratio(connector, true);
-	drm_scdc_set_scrambling(connector, true);
+		return -ENODEV;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
@@ -793,59 +659,27 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	drm_dev_exit(idx);
 
-	vc4_hdmi->scdc_enabled = true;
-
-	queue_delayed_work(system_percpu_wq, &vc4_hdmi->scrambling_work,
-			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
+	return 0;
 }
 
-static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
+static int vc4_hdmi_scrambler_disable(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = connector->dev;
 	unsigned long flags;
 	int idx;
 
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	if (!vc4_hdmi->scdc_enabled)
-		return;
-
-	vc4_hdmi->scdc_enabled = false;
-
-	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
-		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
-
 	if (!drm_dev_enter(drm, &idx))
-		return;
+		return -ENODEV;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
 		   ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
-	drm_scdc_set_scrambling(connector, false);
-	drm_scdc_set_high_tmds_clock_ratio(connector, false);
-
 	drm_dev_exit(idx);
-}
 
-static void vc4_hdmi_scrambling_wq(struct work_struct *work)
-{
-	struct vc4_hdmi *vc4_hdmi = container_of(to_delayed_work(work),
-						 struct vc4_hdmi,
-						 scrambling_work);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	if (drm_scdc_get_scrambling_status(connector))
-		return;
-
-	drm_scdc_set_high_tmds_clock_ratio(connector, true);
-	drm_scdc_set_scrambling(connector, true);
-
-	queue_delayed_work(system_percpu_wq, &vc4_hdmi->scrambling_work,
-			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
+	return 0;
 }
 
 static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
@@ -890,7 +724,7 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 	}
 
-	vc4_hdmi_disable_scrambling(encoder);
+	drm_connector_hdmi_disable_scrambling(&vc4_hdmi->connector);
 
 	drm_dev_exit(idx);
 
@@ -1598,6 +1432,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
+	struct drm_connector_state *conn_state;
 	unsigned long flags;
 	int ret;
 	int idx;
@@ -1666,7 +1501,9 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	}
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
-	vc4_hdmi_enable_scrambling(encoder);
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	drm_connector_hdmi_enable_scrambling(connector, conn_state);
 
 	drm_dev_exit(idx);
 
@@ -1683,8 +1520,6 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	mutex_lock(&vc4_hdmi->mutex);
 	drm_mode_copy(&vc4_hdmi->saved_adjusted_mode,
 		      &crtc_state->adjusted_mode);
-	vc4_hdmi->output_bpc = conn_state->hdmi.output_bpc;
-	vc4_hdmi->output_format = conn_state->hdmi.output_format;
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -1754,8 +1589,9 @@ static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi14 = {
 static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi20 = {
 	VC4_HDMI_CONNECTOR_FUNCS_COMMON,
 	.max_bpc		= 12,
-	/* TODO: set HDMI_VERSION_2_0 and convert to common scrambler infra */
-	.supported_hdmi_ver	= HDMI_VERSION_UNKNOWN,
+	.supported_hdmi_ver	= HDMI_VERSION_2_0,
+	.scrambler_enable	= vc4_hdmi_scrambler_enable,
+	.scrambler_disable	= vc4_hdmi_scrambler_disable,
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
@@ -3229,7 +3065,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	spin_lock_init(&vc4_hdmi->hw_lock);
-	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
 
 	dev_set_drvdata(dev, vc4_hdmi);
 	encoder = &vc4_hdmi->encoder.base;
@@ -3242,15 +3077,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->pdev = pdev;
 	vc4_hdmi->variant = variant;
 
-	/*
-	 * Since we don't know the state of the controller and its
-	 * display (if any), let's assume it's always enabled.
-	 * vc4_hdmi_disable_scrambling() will thus run at boot, make
-	 * sure it's disabled, and avoid any inconsistency.
-	 */
-	if (variant->max_pixel_clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
-		vc4_hdmi->scdc_enabled = true;
-
 	ret = variant->init_resources(drm, vc4_hdmi);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index d5ffcc17de32..f6159c9e6144 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -118,8 +118,6 @@ struct vc4_hdmi {
 	struct vc4_encoder encoder;
 	struct drm_connector connector;
 
-	struct delayed_work scrambling_work;
-
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
@@ -193,25 +191,6 @@ struct vc4_hdmi {
 	 */
 	bool packet_ram_enabled;
 
-	/**
-	 * @scdc_enabled: Is the HDMI controller currently running with
-	 * the scrambler on? Protected by @mutex.
-	 */
-	bool scdc_enabled;
-
-	/**
-	 * @output_bpc: Copy of @drm_connector_state.hdmi.output_bpc for
-	 * use outside of KMS hooks. Protected by @mutex.
-	 */
-	unsigned int output_bpc;
-
-	/**
-	 * @output_format: Copy of
-	 * @drm_connector_state.hdmi.output_format for use outside of
-	 * KMS hooks. Protected by @mutex.
-	 */
-	enum drm_output_color_format output_format;
-
 	/**
 	 * @hdmi_jack: Represents the connection state of the HDMI plug, for
 	 * ALSA jack detection.

-- 
2.55.0

