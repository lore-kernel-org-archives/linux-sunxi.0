Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A19381B02
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416954; cv=none; b=THqcO2t5a+LJmzGFRiCprwKHS+D0sIdenBSnj7lLbaArw2iL2n6QNYVbPjyC4++b48Hvh7SfKt4LANt4caCeEPq8GuWkvBjobt5Z7R9qi2xOGCNPNAi/Sz7v3vlI0bd2VGOuv0YgjOE7JU0FWKm3KexDZbUCYb6p7saTy+Q2MaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416954; c=relaxed/simple;
	bh=suOWffDugVHMyKc1kvOdlsuWDuqG6CCsuRwNREr8tBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfvTS5h2R2xc4vDEGDOqn4vwtftbanJOxEW8xBLRC8kAG0cwrAQIZFE3m+C+Y9DOdk7Ras3OvoEl4JJu5per0Ld2yyMJPwXWSYfiONPM/VkxXF+UgVPJ1G0SqK6cpaHzKJV0P/WXrBEvADNX2jqOODBgighHBsIDrgUsSXnHL2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=FN2N7pE7; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="FN2N7pE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416942; bh=Rdh0BB0LH0hOOSmxBLwLWxnKBxaJU8xXHPIyn2MeIhg=;
 b=FN2N7pE72NKPkD3bFKOzAhHyW9mOoOV778nb4ifpUxINcfymnTnYNHPjQuOPyHWw1kDOgsSEL
 2nPBA/8nRDuyPLyvMJVO0yhx47vYW2+oX+LuVmYQobpv7om1Cvrlw5NbwX9iV8Rx7WEfPkh7n2K
 bG9p1Nn+xvdc8WOcHYvWbMqKSM2HAmE/0cDDdIMHQAh7I0cZY5eRGKWZlgdWBwD/sKMgeeXF+w9
 ufEFZTFslWCUranY7plmRIAyA75B9L+mZuiAQyUvWDkbOL58J/GqSPm2JkZEJMBBqbDcEYQcO1I
 y4zqKkk679nmZQA21jDa0KB6C6mfzSwBU6IKT2jIs7Kw==
X-Forward-Email-ID: 6a007d090d91f03a31a0bbc9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.0
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
Subject: [PATCH v5 06/21] drm: bridge: dw_hdmi: Remove previous_mode and mode_set
Date: Sun, 10 May 2026 12:40:50 +0000
Message-ID: <20260510124111.1226584-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510124111.1226584-1-jonas@kwiboo.se>
References: <20260510124111.1226584-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the use of adjusted_mode directly from the crtc_state there is no
longer a need to store a copy in previous_mode, remove it and the now
unneeded mode_set ops.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: No change, rebase on next-20260508
v4: No change
v3: Collect r-b tag
v2: No change
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 607faf4da967..a176eb55418c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -156,8 +156,6 @@ struct dw_hdmi {
 		bool enabled;
 	} phy;
 
-	struct drm_display_mode previous_mode;
-
 	struct i2c_adapter *ddc;
 	void __iomem *regs;
 	bool sink_is_hdmi;
@@ -167,7 +165,7 @@ struct dw_hdmi {
 	struct pinctrl_state *default_state;
 	struct pinctrl_state *unwedge_state;
 
-	struct mutex mutex;		/* for state below and previous_mode */
+	struct mutex mutex;		/* for state below */
 	enum drm_connector_force force;	/* mutex-protected force state */
 	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
 	bool disabled;			/* DRM has disabled our bridge */
@@ -2928,20 +2926,6 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	return mode_status;
 }
 
-static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-				    const struct drm_display_mode *orig_mode,
-				    const struct drm_display_mode *mode)
-{
-	struct dw_hdmi *hdmi = bridge->driver_private;
-
-	mutex_lock(&hdmi->mutex);
-
-	/* Store the display mode for plugin/DKMS poweron events */
-	drm_mode_copy(&hdmi->previous_mode, mode);
-
-	mutex_unlock(&hdmi->mutex);
-}
-
 static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_commit *state)
 {
@@ -3005,7 +2989,6 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
 	.atomic_enable = dw_hdmi_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_bridge_atomic_disable,
-	.mode_set = dw_hdmi_bridge_mode_set,
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 	.detect = dw_hdmi_bridge_detect,
 	.edid_read = dw_hdmi_bridge_edid_read,
-- 
2.54.0

