Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E965B3905FA;
	Tue, 12 May 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591200; cv=none; b=lKT2/PyzsvtL42g0HhM/s8kgN9FT8K8mjx6i3vOddXRZFYphHXfy3pc49z6hD9bD3WmL+l36bLwR6EkCWfMaMblytcaDiqkhVJkuk22cXurQqp7YYwgjmU9vNgivbByaL4S8PrXVMliXpw0Eb1QF9YKd000gl7ekvf9z1BZmYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591200; c=relaxed/simple;
	bh=4hBvEGtlh5O19lqmxUP9acB4Jq06dsATivmTySgizkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIFlS5C6qBqRKCuYkuGLO3qhEkRChxpNLNQeRs9yi7NmoTH8P5e0j0L4JwJdNDy2N1I06IJYfHHgaZY/jjSQHowbl7Kt0Jzg4xBVJLhwcdhadIV2rRYb4kkEeSzRSm1g6bQi7w2dCApq7/9Vag2n2sjFjmZbH3vNMobtHntboNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRHQxS7v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRHQxS7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FEFC2BCFC;
	Tue, 12 May 2026 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591199;
	bh=4hBvEGtlh5O19lqmxUP9acB4Jq06dsATivmTySgizkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PRHQxS7vvPIGi3niaFIujG6y2gHQFL6ow4utTExP9NLCSbXpIPkT3bnU8cJoYPD2j
	 t56U8Z1gDpkjBqRsA6VTiwcj6pcqhhJw2lx9C1NsKZdy1ElVPY1914/XynSAVNq45Q
	 b5VpJmIyxJ2iqf6ec7iX+I1tB+8SURpnuEOoqqopP6NqYGWavjAczWKR76D4eP+oCg
	 44WCtLSEGbE0+n16Xp7+XWSqzTHVYxWAtqwQ5Ik8KVr65g6Ark6AaF8foCLvRLbdMv
	 Y/dPfwPj/l6k52M41edshxLmf+pYGHLJ/iAwsVHuBIFxkobxz7ja/SuGjqPfCqRy24
	 leHNK42rXfMQw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:07 +0200
Subject: [PATCH v4 09/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_plane_state_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-9-591dfdcc1bf9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4hBvEGtlh5O19lqmxUP9acB4Jq06dsATivmTySgizkk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqvt8i3UD0rbsmvFkVu82HanZapmTIpcdf5tXH1h/6
 0FUXHd/x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiImSBjneKGeV6pZhPEE7OT
 z/ep61tsyK/7XXzbZYokz75TPPKKE+fX53A1fBPOWvLsr4Tu1WXPGRs2z3nuZN0SrrCP7WLFh2V
 9x5UZ+OKZjjyUNvTVm9yzU7nRcHGUreHVUi9e8dKwKu85DwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

__drm_atomic_helper_plane_state_reset() is used to initialize a newly
allocated drm_plane_state, and is being typically called by the
drm_plane_funcs.reset implementation.

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_plane_state instance, we will need to call
__drm_atomic_helper_plane_state_reset() from both the reset and
atomic_create hooks.

To avoid any confusion, we can thus rename
__drm_atomic_helper_plane_state_reset() to
__drm_atomic_helper_plane_state_init().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c  | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_plane.c |  2 +-
 include/drm/drm_atomic_state_helper.h      |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index c8ccf8be5074..ee01700d4ca7 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -235,19 +235,19 @@ void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
 
 /**
- * __drm_atomic_helper_plane_state_reset - resets plane state to default values
+ * __drm_atomic_helper_plane_state_init - Initialize the plane state
  * @plane_state: atomic plane state, must not be NULL
  * @plane: plane object, must not be NULL
  *
  * Initializes the newly allocated @plane_state with default
- * values. This is useful for drivers that subclass the CRTC state.
+ * values. This is useful for drivers that subclass the plane state.
  */
-void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
-					   struct drm_plane *plane)
+void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
+					  struct drm_plane *plane)
 {
 	u64 val;
 
 	plane_state->plane = plane;
 	plane_state->rotation = DRM_MODE_ROTATE_0;
@@ -295,11 +295,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 							   plane->hotspot_y_property,
 							   &val))
 			plane_state->hotspot_y = val;
 	}
 }
-EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
+EXPORT_SYMBOL(__drm_atomic_helper_plane_state_init);
 
 /**
  * __drm_atomic_helper_plane_reset - reset state on plane
  * @plane: drm plane
  * @plane_state: plane state to assign
@@ -313,11 +313,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
  */
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *plane_state)
 {
 	if (plane_state)
-		__drm_atomic_helper_plane_state_reset(plane_state, plane);
+		__drm_atomic_helper_plane_state_init(plane_state, plane);
 
 	plane->state = plane_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
 
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index c181a7d063ec..11467d19399d 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -65,11 +65,11 @@
 static void intel_plane_state_reset(struct intel_plane_state *plane_state,
 				    struct intel_plane *plane)
 {
 	memset(plane_state, 0, sizeof(*plane_state));
 
-	__drm_atomic_helper_plane_state_reset(&plane_state->uapi, &plane->base);
+	__drm_atomic_helper_plane_state_init(&plane_state->uapi, &plane->base);
 
 	plane_state->scaler_id = -1;
 	plane_state->fence_id = -1;
 }
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 61a3b38ad49f..691c1ccfa4e0 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -51,11 +51,11 @@ struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 					  struct drm_crtc_state *state);
 
-void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
+void __drm_atomic_helper_plane_state_init(struct drm_plane_state *state,
 					   struct drm_plane *plane);
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *state);
 void drm_atomic_helper_plane_reset(struct drm_plane *plane);
 void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,

-- 
2.54.0

