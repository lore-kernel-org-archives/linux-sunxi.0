Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D03FE36E;
	Tue, 26 May 2026 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814020; cv=none; b=kbWKCf/mTz0MnAPD4ySpNUQcBEGii9niwugK0TNGvzz3hZp3ZgXF/CBOK/xbxUIzF8LddRP7qGhsNHciofM2wv65dTcg/GElvRHceoFu0CTTrtM2mlO255EpUv32/XZwMGXIt7oszHeO20NFaccoVTEs8rNEAwXpG7KwIDfB/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814020; c=relaxed/simple;
	bh=uLHaGHSP9UQjQQ5jBIAoXbBwJSEBPtjOM2YeKkN0O2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6xWiWm7bQVhhzc/qdiuF7pNgWrJW++xMm4BESL8hDJlF8LU+3bMCn+GeVFsX7pv41U2bzNKoBVuS3lKtcQ13JKyJMsJMztbhW4fu+MIfr8PlreHCzuhz3D4Cq1WVZxCE0Ww1p8WY+HkiyxG7QMKEVxrH+8yS2NaZ8xqV17EueM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijMTe0Hh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijMTe0Hh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB8B1F00A3D;
	Tue, 26 May 2026 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814017;
	bh=BpKk6Gij2WxsoBaa/RiasDHSglHxtZ5uMjAEt5+zsC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ijMTe0Hh5rDIv4EEV3z5fQQzYT+oGWilemNb+CDA1DGAOKvS3UC4ZlxAWKhdElDfM
	 8qsqoHB5ZOtnmrBFhQCsUgkErTTQt7lbxns4Q1tSgSD9eKCvrl6kv3lda6Lrs2UFKf
	 oSC5MO3uV2O0bP5bmCExONb1k0hnzUCfWRFgjW0ce1kOBjVG0hFhRkMkeAWPQGOyR5
	 JT1aNmuaTBNb6ANoqwRnmhSLtJvJqooxa6x4vzuySGtHMB29Z4uC8dLvQ292zPp4F4
	 cKZW8/oY+kW2kmX5qEg7Ek7Ek+tknOeGqSR/b4GgzndiGPDeJQL9+AXYbuMqs98kdd
	 k1ZPUcNrIzPjw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:23 +0200
Subject: [PATCH v6 11/19] drm/atomic-state-helper: Rename
 __drm_atomic_helper_crtc_state_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-11-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4452; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uLHaGHSP9UQjQQ5jBIAoXbBwJSEBPtjOM2YeKkN0O2Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi56Jlvidp5nI+jp7Cd1PlSGBqp5Dc4UD3FxP9k7NZJ
 B8sZQ7qmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNJLWKsLzGv9dm7a/Uu5idP
 FoWxv5r/o+DT5UMZq/49rl329ILGqiUGclb3q14G8+62WrtUIETGi7E+7f3qPes6t2v3l/zdatC
 buefZ/8htc5nlTRoKghZfPNTcMGtbgcHWLqHSA4s+sn2212AHAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

__drm_atomic_helper_crtc_state_reset() is used to initialize a newly
allocated drm_crtc_state, and is being typically called by the
drm_crtc_funcs.reset implementation.

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_crtc_state instance, we will need to call
__drm_atomic_helper_crtc_state_reset() from both the reset and
atomic_create hooks.

To avoid any confusion, we can thus rename
__drm_atomic_helper_crtc_state_reset() to
__drm_atomic_helper_crtc_state_init().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_crtc.c |  2 +-
 include/drm/drm_atomic_state_helper.h     |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index ab171bfe6e86..b277f92f4532 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -61,25 +61,25 @@
  * For other drivers the building blocks are split out, see the documentation
  * for these functions.
  */
 
 /**
- * __drm_atomic_helper_crtc_state_reset - reset the CRTC state
+ * __drm_atomic_helper_crtc_state_init - Initialize the CRTC state
  * @crtc_state: atomic CRTC state, must not be NULL
  * @crtc: CRTC object, must not be NULL
  *
  * Initializes the newly allocated @crtc_state with default
  * values. This is useful for drivers that subclass the CRTC state.
  */
 void
-__drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
-				     struct drm_crtc *crtc)
+__drm_atomic_helper_crtc_state_init(struct drm_crtc_state *crtc_state,
+				    struct drm_crtc *crtc)
 {
 	crtc_state->crtc = crtc;
 	crtc_state->background_color = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
 }
-EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
+EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_init);
 
 /**
  * __drm_atomic_helper_crtc_reset - reset state on CRTC
  * @crtc: drm CRTC
  * @crtc_state: CRTC state to assign
@@ -94,11 +94,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
 void
 __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 			       struct drm_crtc_state *crtc_state)
 {
 	if (crtc_state)
-		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
+		__drm_atomic_helper_crtc_state_init(crtc_state, crtc);
 
 	if (drm_dev_has_vblank(crtc->dev))
 		drm_crtc_vblank_reset(crtc);
 
 	crtc->state = crtc_state;
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 03de219f7a64..7486f2dc60ef 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -179,11 +179,11 @@ struct intel_crtc_state *intel_crtc_state_alloc(struct intel_crtc *crtc)
 void intel_crtc_state_reset(struct intel_crtc_state *crtc_state,
 			    struct intel_crtc *crtc)
 {
 	memset(crtc_state, 0, sizeof(*crtc_state));
 
-	__drm_atomic_helper_crtc_state_reset(&crtc_state->uapi, &crtc->base);
+	__drm_atomic_helper_crtc_state_init(&crtc_state->uapi, &crtc->base);
 
 	crtc_state->cpu_transcoder = INVALID_TRANSCODER;
 	crtc_state->master_transcoder = INVALID_TRANSCODER;
 	crtc_state->hsw_workaround_pipe = INVALID_PIPE;
 	crtc_state->scaler_state.scaler_id = -1;
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 8d1ef268fdef..0bb72453464a 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -38,11 +38,11 @@ struct drm_connector_state;
 struct drm_private_obj;
 struct drm_private_state;
 struct drm_modeset_acquire_ctx;
 struct drm_device;
 
-void __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *state,
+void __drm_atomic_helper_crtc_state_init(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 				    struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,

-- 
2.54.0

