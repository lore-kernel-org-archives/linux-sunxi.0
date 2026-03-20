Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D621E3D333E;
	Fri, 20 Mar 2026 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024081; cv=none; b=jXLwj3rPA5FCoPhkC4f1bOiqTjsG4oMJdPo5Al1vzWh2o2pIcjZh3pa3QsKdRaxRywyX/Hv/51O6gylw19HbPYkyrxQG4z/4SiNjAT9lq3VTfZT2Q7IGbxX+XCd0Yw53KTiiYZ6/dBZzb94nUqV7v6MEmWlZRXOJmczZjBrmDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024081; c=relaxed/simple;
	bh=ZSytMP4sR458YvgRRedQ0/nRW0jY56S7tb1kWHXaG0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THiFtQrEeGNkN7CdWGwXJfb2YLC0Vjn/O8VYXxNCVxzQ2vwCNrawDEA8QUv/V115wxY7RuLewjW5ELP4uKof9mYZWFNk9rAXpCj8+dQ8XNoAXg+i/bxdzavMtBeCpz+s+IjOsS68pSbUfh3BubqOsQ7jpdjWGITg1Zwujud1iqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbvCnD9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbvCnD9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC357C2BC87;
	Fri, 20 Mar 2026 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024081;
	bh=ZSytMP4sR458YvgRRedQ0/nRW0jY56S7tb1kWHXaG0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pbvCnD9wcKv5MKijRCXDPpMJWfMr3KBcSIu62FATcLvPNT9GzL0A4Q195XGFSNIE8
	 lav5Baijqi/iFhliCbr4K3f9WXJnzejPLDcds+Z4SfYzd8Cu+jzYUVjaFCp1W1ZGJs
	 axMvzfLOEI6yVCpkCO4sZpa1CowgH8pdGrqe3cuepe9KphYDNdCB6+TRc/ejL3pfFS
	 qCOZBtgJtTrMIHpW3WPFhUCrDxKh30UEE0vIi78M7OS1NR3HIvltvGcNhghQl3n6GM
	 BpYoJnaWgz10m34BI9zki2D0pX0kU1NwkxfGdWWCCh4zsWQFiZ4DtkAdEVp4rS3gsE
	 kfvdLDY0Ph87A==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:19 +0100
Subject: [PATCH v2 12/20] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7694; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZSytMP4sR458YvgRRedQ0/nRW0jY56S7tb1kWHXaG0s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7SzPEBKLPPTPeurZGK3JCgN0WpjXrQx9M2iXF+7lcf
 9E2qdt3OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE1kgz1hkumNRwosFFR3il
 ZPfSqDOfd5fEzynYHzEjc79s3vcNmV4Tkr5+zzyz8gHP/Q6uqP2TKxkbVlsd5QxcHfZ2lfL8uD+
 yVzZcV1TbeS9HwaVR+ofWvS/rJ/exRhq0fPALbZcp4JWZVXcKAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

__drm_atomic_helper_connector_hdmi_reset() is typically used to
initialize a newly allocated drm_connector_state when the connector is
using the HDMI helpers, and is being called by the
drm_connector_funcs.reset implementation.

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_connector_state instance, we will need to call
__drm_atomic_helper_connector_hdmi_reset() from both the reset and
atomic_create hooks.

To avoid any confusion, we can thus rename
__drm_atomic_helper_connector_hdmi_reset() to
__drm_atomic_helper_connector_hdmi_state_init().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c     |  4 ++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 14 ++++++++------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
 include/drm/display/drm_hdmi_state_helper.h        |  4 ++--
 6 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index f686aa5c0ed9b84dbe5e0957df22d08aff2f1945..929f06b290626d2091418a6377a5230e3c264b60 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -270,12 +270,12 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
 	drm_atomic_helper_connector_reset(connector);
 	if (bridge_connector->bridge_hdmi)
-		__drm_atomic_helper_connector_hdmi_reset(connector,
-							 connector->state);
+		__drm_atomic_helper_connector_hdmi_state_init(connector,
+							      connector->state);
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a1d16762ac7a9ebdc48f081c5d2f5e200d406099..cdd6df37c04a4b2073004ea08a3f5283a56692df 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -304,29 +304,31 @@
  *		--kunitconfig=drivers/gpu/drm/tests \
  *		drm_atomic_helper_connector_hdmi_*
  */
 
 /**
- * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
+ * __drm_atomic_helper_connector_hdmi_state_init() - Initializes all HDMI @drm_connector_state resources
  * @connector: DRM connector
  * @new_conn_state: connector state to reset
  *
  * Initializes all HDMI resources from a @drm_connector_state without
  * actually allocating it. This is useful for HDMI drivers, in
- * combination with __drm_atomic_helper_connector_reset() or
- * drm_atomic_helper_connector_reset().
+ * combination with __drm_atomic_helper_connector_reset(),
+ * drm_atomic_helper_connector_reset(),
+ * __drm_atomic_helper_connector_create_state() or
+ * drm_atomic_helper_connector_create_state() .
  */
-void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
-					      struct drm_connector_state *new_conn_state)
+void __drm_atomic_helper_connector_hdmi_state_init(struct drm_connector *connector,
+						   struct drm_connector_state *new_conn_state)
 {
 	unsigned int max_bpc = connector->max_bpc;
 
 	new_conn_state->max_bpc = max_bpc;
 	new_conn_state->max_requested_bpc = max_bpc;
 	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
-EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
+EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_state_init);
 
 static const struct drm_display_mode *
 connector_state_get_mode(const struct drm_connector_state *conn_state)
 {
 	struct drm_atomic_state *state;
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index a50f260c73e41493528e545591aaad0e3f138be2..0ebebb04e68fab5b7938a604f85ad9b756fe33f6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -283,11 +283,11 @@ sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static void sun4i_hdmi_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
+	__drm_atomic_helper_connector_hdmi_state_init(connector, connector->state);
 }
 
 static const struct drm_connector_funcs sun4i_hdmi_connector_funcs = {
 	.detect			= sun4i_hdmi_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 4bdcea3c7435146aebb1716f38d7302ddb7c6296..aaa73b75f3ce5010147f48afc365d074bb2ec7a7 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -166,11 +166,11 @@ static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
 };
 
 static void dummy_hdmi_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
+	__drm_atomic_helper_connector_hdmi_state_init(connector, connector->state);
 }
 
 static const struct drm_connector_funcs dummy_connector_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9898e5451a07a1dca809fb6db3fec59d07485b95..f59d0877a5f48bed6b421775da7ddd008d68f9d9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -506,11 +506,11 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 }
 
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
+	__drm_atomic_helper_connector_hdmi_state_init(connector, connector->state);
 	drm_atomic_helper_connector_tv_margins_reset(connector);
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.force = drm_atomic_helper_connector_hdmi_force,
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2349c0d0f00fb468167023d4db2055c70e603bcd..f7600aabdd5f066772a9a82a1fa8a00be7a48396 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -9,12 +9,12 @@ struct drm_connector_state;
 struct drm_display_mode;
 struct hdmi_audio_infoframe;
 
 enum drm_connector_status;
 
-void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
-					      struct drm_connector_state *new_conn_state);
+void __drm_atomic_helper_connector_hdmi_state_init(struct drm_connector *connector,
+						   struct drm_connector_state *new_conn_state);
 
 int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state);
 
 int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,

-- 
2.53.0

