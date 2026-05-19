Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AE0480DFE;
	Tue, 19 May 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181367; cv=none; b=l+7RbSxlqjQGb3pheT+uss7BOyMkRNFfTPbC8en0b3bYBySvQOjnAYffTfH9cNAq8L+YEkvqowLJbsD/njGsoQCMzQny7XvOhlskPp934k31+HXLRmITP3z69bbfaEsXzHirDGDqpb1DXAKeOX9GS2YQg4v8MjS9kykVH6F+HxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181367; c=relaxed/simple;
	bh=+roR9EKY5P3KByKKPZTrAIusl8O7nRXXLQS93qqd3OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPHMaSV9vgWncAGYJ735jQ/+PKrlTj3CdgoFUcb+ZiPTBrRJpTZMUfH94q9W1vOYLzml9xedg/rAQ43EhGYnplSOrEsh/ZZxoZjD5Y+O2Ac98W/pSiTz/rTvODNDeoX8pZa14jOLjzux01cFNDG9jK+WCjn19716IP0Zpn/d3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjoUP0iG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjoUP0iG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BC5C2BCC6;
	Tue, 19 May 2026 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181367;
	bh=+roR9EKY5P3KByKKPZTrAIusl8O7nRXXLQS93qqd3OQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hjoUP0iGozWVSHBYS3GJDTGqcTNY1RGvhlMC4LikD5Yf29PwTqjKHdaW3LbE6WDvT
	 QdBtXDdfCabxVWtN0MJbGHLiDcY51J1Ip9voDK8HLLc3XDmhmV9VO9qq1E6+y9Opu5
	 VMqa1PyQ6D8lmR+m2gbWvgZCEUafHekCV0OciX6twENJmlSpzmrmXTWyW3f4Ld37N3
	 SHgJnFCmCkuwDklyohXYKlwg94bbZakgFCSVMi2iPEHvrcot9MDt4twLfFbRZPbkgn
	 p7Qw+Tmmq++iYYDubZbXBbEf++w7IZlE/tlbHjptqfcbNHKgfNqlzwCDdheCYn3y1i
	 JTwuma1Vuc2/Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:56 +0200
Subject: [PATCH v5 14/19] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-14-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
In-Reply-To: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7569; i=mripard@kernel.org;
 h=from:subject:message-id; bh=+roR9EKY5P3KByKKPZTrAIusl8O7nRXXLQS93qqd3OQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8av/XVUTm6cQXvNZeu0q4bvpxjb1eb4wu9RS/EHdev
 +LA4Qd+HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi1lyMdeb2qzNL/3nqNJ1K
 2L/ll1fSzN0WKy9GJm2c9eF39FUPlaR4w+y5F988mtWtJ2k7wzQ7lrGGQ/b6+ulRfkLtPzVOt23
 b0BHW8FrgmHaBXeAEkd/tYQ2G8bph7n77Flgpek9OfMNXyAgA
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c     |  4 ++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 15 ++++++++-------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
 include/drm/display/drm_hdmi_state_helper.h        |  4 ++--
 6 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 649969fca141..50408af746d8 100644
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
index 4867edbf2622..a331ebdd65af 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -304,29 +304,30 @@
  *		--kunitconfig=drivers/gpu/drm/tests \
  *		drm_atomic_helper_connector_hdmi_*
  */
 
 /**
- * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
+ * __drm_atomic_helper_connector_hdmi_state_init() - Initialize all HDMI @drm_connector_state resources
  * @connector: DRM connector
- * @new_conn_state: connector state to reset
+ * @new_conn_state: connector state to initialize
  *
  * Initializes all HDMI resources from a @drm_connector_state without
  * actually allocating it. This is useful for HDMI drivers, in
- * combination with __drm_atomic_helper_connector_reset() or
- * drm_atomic_helper_connector_reset().
+ * combination with __drm_atomic_helper_connector_state_init(),
+ * drm_atomic_helper_connector_reset(), or
+ * drm_atomic_helper_connector_create_state().
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
 
 static enum hdmi_colorspace
 output_color_format_to_hdmi_colorspace(const struct drm_connector *connector,
 				       enum drm_output_color_format fmt)
 {
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 07e2afcb4f95..3cad8f9bc529 100644
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
index c9819c3fc635..e89e1af7a811 100644
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
index a161d3b00a25..74dce4be0c00 100644
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
index 0adc30c55ec9..13375bd0f4ae 100644
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
 					   struct drm_atomic_commit *state);
 
 int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,

-- 
2.54.0

