Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF003A83A1;
	Tue, 12 May 2026 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591205; cv=none; b=p4M5bk3sDkTGtE0iNL2T3F9CJXK4fbMFzsqEA7dpFY9IZMw0YUc/nYk+n4pkzjAOyU0Kr8BznwBqLKyEqH6wviGbkvYFpDYakKWu+1o2eUiW/mo7uRSQPtWw6Sw0bQ+ijl1P3ZpVVQKHgiUYtIKp0UmY38QxwdtZr0brcSvuolU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591205; c=relaxed/simple;
	bh=uLHaGHSP9UQjQQ5jBIAoXbBwJSEBPtjOM2YeKkN0O2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6vgmJJrTBGjWe/H+mS0Tqwz8fVnDFBAmRii6WLM3NKne4LIkLeemfdomGtVqGrm+Rk1s7ZYN3cvjyuPahaQ6ij6hLJnMSJVRSuaDovujHUURwGbJmZDCaaVBt0mTA6nyQNWbDqbnV6YwCM41HFEHAyBObk69mANRVAJRNqec60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qx/pkiim; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qx/pkiim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA909C2BCF6;
	Tue, 12 May 2026 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591205;
	bh=uLHaGHSP9UQjQQ5jBIAoXbBwJSEBPtjOM2YeKkN0O2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qx/pkiimB/jRi9sGazs9cL7ErD+vzz4h9oJqHvSE/FRCkvIY3WQqHojGQ3Lku4PKj
	 UCkiRlx8xIUYvAH1mXDPZDM5tEfXNV6GQIBike19wfUMpI9mfuLBgER0TavG4HlG1T
	 LUEJig+eAjpSDSRgb1e2gCyX6jsbnF5jthFLOCRAD4r+zenR5hR3kx0X6C+zJ6HQ+L
	 fepL+3Fethj/qa8HdabkRIB++I90GxpoZwb8/HIQQDUntrSHNOHzkmrT7T1k0CKRW2
	 ghQovrLSN+Omwzr1AsL2RI6RsbfTyIHucnj8I+kkuuMxvTEEyjLhylUfaXzJ+OkA7Y
	 l8CTieV1O5ZAA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:09 +0200
Subject: [PATCH v4 11/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_crtc_state_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-11-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqvv3z8xMOXagYo1S+665En87VYueeK3iWft3fp6hy
 PsZeup6HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BeAmP2ZseD/5X/G5yMdiApa3
 LD6K6f74dVtOJvK1+XHlxyYnFDKvG+peMKzuWNex9kFkxv3S/AgRxvrUU55ll/t2X/8g9P/czMJ
 7/bv38+357v9cJUB8em6eis2qd5f+KF7d2XX9HYuCQlm6aSAA
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

