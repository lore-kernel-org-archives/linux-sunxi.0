Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5846A3446C8
	for <linux-sunxi@lists.linux.dev>; Sat, 16 May 2026 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956774; cv=none; b=obD+495pg9cFrTfT3BX4jR+rc+31lUW7jUgIEHXqzNsMVdoH6X3mRMfQP5kz4ubSNIfsWHmQkOZiZcJzag/7WjsDwRvJu5s7WHDwz0q1Gd7CpyLadgk3HFsufK/Jc+EufQkqDZ8p/Ui7+2f4Y2mB4TbUR3mirbwnnx+tVOk7aBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956774; c=relaxed/simple;
	bh=UyMDXJFqwt92PcqVetbRHSFwlXi2R9+ZwI6i+0gt8TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxBXLEWH6425n5Q91WDFW3Drr/FMj6IbEuzfAxCH0/LMa7OZKPG5h2LfLP7Y+Tx5TginqUrcnHGGZz6bed6GZCE2KqzY78Jqa9lQjXyge4dYQxjSQbdNgwb7qCHUhddhQuyg7nyEBMY9NGsWiaLn9Ds5cVaXvoq6KEq+PRc3Rpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=YI6P05UZ; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="YI6P05UZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956765; bh=zkkX/KyTfJX+Kz8/6aczHqfvmFQd2dSTtHRmLreRDH4=;
 b=YI6P05UZh2AkXlsCZnYT5CbXVY3L2Z895KXo1devPFbRo3Ipdk6m2LdnrM4ibb8hmKHP1DJ9n
 Zi6v/Mu2PeK93usQqotGkc4Ul/NR6mhs6ju1J0ISbqGiMcP5zRMsCJ+69Ng30eN5hEes6n6ntg5
 +zUvm9PV6cYG5m4+dtuyjJM1YTyUmj7UEyLnW9lheIf75RuCNg4T4K/hiMkgmp7hosX9RaTi1SJ
 TpOPhZsbjJLdbx7aNIWI3Tz6jTG/e562R8gZsGqJmMZLyqr/OXu7YJvlEvQDfyPSji1VlOl2ozL
 qn9R7K59zRsRbvgl4dvfBxQ1QFU73RY89W8losdKvPBw==
X-Forward-Email-ID: 6a08b9ca79c7625f20eeed73
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/22] drm: bridge: dw_hdmi: Fold poweron and setup functions
Date: Sat, 16 May 2026 18:38:15 +0000
Message-ID: <20260516183838.2024991-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516183838.2024991-1-jonas@kwiboo.se>
References: <20260516183838.2024991-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fold the poweron and setup functions into one function and use the
adjusted_mode directly from the new crtc_state to remove the need of
storing previous_mode.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Collect t-b tag
v5: No change, rebase on next-20260508
v4: No change
v3: Collect r-b tag
v2: No change
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aa12397b3343..607faf4da967 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2254,9 +2254,9 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 		    HDMI_IH_MUTE_FC_STAT2);
 }
 
-static int dw_hdmi_setup(struct dw_hdmi *hdmi,
-			 const struct drm_connector *connector,
-			 const struct drm_display_mode *mode)
+static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
+			   const struct drm_connector *connector,
+			   const struct drm_display_mode *mode)
 {
 	const struct drm_display_info *display = &connector->display_info;
 	int ret;
@@ -2396,15 +2396,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, ih_mute, HDMI_IH_MUTE);
 }
 
-static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
-{
-	/*
-	 * The curr_conn field is guaranteed to be valid here, as this function
-	 * is only be called when !hdmi->disabled.
-	 */
-	dw_hdmi_setup(hdmi, hdmi->curr_conn, &hdmi->previous_mode);
-}
-
 static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
 {
 	if (hdmi->phy.enabled) {
@@ -2969,15 +2960,19 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_commit *state)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
+	struct drm_crtc *crtc;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = false;
 	hdmi->curr_conn = connector;
-	dw_hdmi_poweron(hdmi);
+	dw_hdmi_poweron(hdmi, connector, mode);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, true);
 	mutex_unlock(&hdmi->mutex);
-- 
2.54.0

