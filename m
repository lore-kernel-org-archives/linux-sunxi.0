Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194BD3D2FFB;
	Fri, 20 Mar 2026 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024076; cv=none; b=O92ql7u91+CWxYKdKRjYa7XSLATLRMN+leWzZGAzj9Q4qaoeFEBESGqb7Y39QPLwjHQHO4Tjg0qhSElsEi8kA4lat4ghd8G+0HHC38xa5vwA6aTkupNfU+TcVE+Q1XCUsnJzwF2rSLg4t9OLJbmtlBLKG8PvIZOCJkZGLjCDkqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024076; c=relaxed/simple;
	bh=2qp5t9aQpBZuM8v67WkQspT3zadSO6zInBF97GrhnHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTvE9Ued4pdmxR3olRy9fgXqW39cRDNWkXL5Qd/haYz6+ryT22WMA9gthD26RbrqZ/xW8EoiRNBBdR5yu/Mqcz/s8y73pgntY8l2uErrw32B/VQU6pwbN1ghNW9EgT6fpbcgBpgmax1bUbvEJ9uS9w6omlZyAcwigXF0NUN1cTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brxfVxXL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brxfVxXL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A29FC2BCB1;
	Fri, 20 Mar 2026 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024075;
	bh=2qp5t9aQpBZuM8v67WkQspT3zadSO6zInBF97GrhnHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=brxfVxXLIfbsPD617Y6Kcp/LyC93yk1DvpzIrrjwDbEdMgfWWQC+qGiWKCxqEByY8
	 ahiI6iHSZyZpikkYYpNTBANCEijsMAc8+idRwjOAAADHzPGq2uYNimcFkT9ntZoyaV
	 s2mr7rATAFkvkOX+4p3x66VZEouY0dur5hcEENHc4o4T+OmONahlFxkbY9CX0RVHG6
	 g99nJVRu4sFJ1Sr7A0973voohK9sjGbYy5w9rmzbbpGqYlW55gBZegdOTye4a6RHmD
	 FD26RKgPQcG0nBHaj0jk3FFLD/VDxIdg48fJsBkUoOlx+fhBi5RmfO+jsJ3HflqSar
	 AL7vrsFYtMoQQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:17 +0100
Subject: [PATCH v2 10/20] drm/crtc: Add new atomic_create_state callback
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-10-c63f1134e76c@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7525; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2qp5t9aQpBZuM8v67WkQspT3zadSO6zInBF97GrhnHA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7SzNYr2k9evvg0vWssJke3lpFzZllE1mnaipxclZt5
 Zu0TyO6YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzklQtjrcT9z90SWwVD+56y
 3CmVefrZ+cek1azn2IzEXnwprdV6cu+BaG7Wqnm9AmveiK9b+Ct2FWPD5D2Nla+ePvx7ZEaVytT
 dYZ+cF62WVmJO3aFvLaaRIvuDQ1H87NVnXgzPZ/OV1K/4nWsCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
to drm_private_obj") introduced a new pattern for allocating drm object
states.

Instead of relying on the reset() callback, it created a new
atomic_create_state hook. This is helpful because reset is a bit
overloaded: it's used to create the initial software tate, reset it, but
also reset the hardware.

It can also be used either at probe time, to create the initial state
and possibly reset the hardware to an expected default, but also during
suspend/resume.

Both these cases come with different expectations too: during the
initialization, we want to initialize all states, but during
suspend/resume, drm_private_states for example are expected to be kept
around.

And reset() isn't fallible, which makes it harder to handle
initialization errors properly.

And this is only really relevant for some drivers, since all the helpers
for reset only create a new state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect:
atomic_create_state to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Let's continue the transition to the new pattern with crtcs.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 47 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 21 +++++++++++++-
 include/drm/drm_atomic_state_helper.h     |  4 +++
 include/drm/drm_crtc.h                    | 13 +++++++++
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index b87cc3cd5b0021699ac57a33739d172a5706e2e1..f1fc2edc6e6e35fbac5ef82437f3cb7485afc412 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -103,10 +103,32 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 
 	crtc->state = crtc_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
 
+/**
+ * __drm_atomic_helper_crtc_create_state - initializes crtc state
+ * @crtc: crtc object
+ * @state: new state to initialize
+ *
+ * Initializes the newly allocated @state, usually required when
+ * initializing the drivers.
+ *
+ * @state is assumed to be zeroed.
+ *
+ * This is useful for drivers that subclass @drm_crtc_state.
+ */
+void __drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc,
+					   struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_state_init(state, crtc);
+
+	if (drm_dev_has_vblank(crtc->dev))
+		drm_crtc_vblank_reset(crtc);
+}
+EXPORT_SYMBOL(__drm_atomic_helper_crtc_create_state);
+
 /**
  * drm_atomic_helper_crtc_reset - default &drm_crtc_funcs.reset hook for CRTCs
  * @crtc: drm CRTC
  *
  * Resets the atomic state for @crtc by freeing the state pointer (which might
@@ -122,10 +144,35 @@ void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc)
 
 	__drm_atomic_helper_crtc_reset(crtc, crtc_state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_reset);
 
+/**
+ * drm_atomic_helper_crtc_create_state - default &drm_crtc_funcs.atomic_create_state hook for crtcs
+ * @crtc: crtc object
+ *
+ * Initializes a pristine @drm_crtc_state.
+ *
+ * This is useful for drivers that don't subclass @drm_crtc_state.
+ *
+ * RETURNS:
+ * Pointer to new crtc state, or ERR_PTR on failure.
+ */
+struct drm_crtc_state *drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_crtc_create_state(crtc, state);
+
+	return state;
+}
+EXPORT_SYMBOL(drm_atomic_helper_crtc_create_state);
+
 /**
  * __drm_atomic_helper_crtc_duplicate_state - copy atomic CRTC state
  * @crtc: CRTC object
  * @state: atomic CRTC state
  *
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 09b8292195ba5eb5d96735aee5506407bd32ade3..f5092d03b168bb114a199b1dbcaeb770983c9749 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -196,10 +196,26 @@ static int drm_mode_config_plane_create_state(struct drm_plane *plane)
 	plane->state = plane_state;
 
 	return 0;
 }
 
+static int drm_mode_config_crtc_create_state(struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *crtc_state;
+
+	if (!crtc->funcs->atomic_create_state)
+		return 0;
+
+	crtc_state = crtc->funcs->atomic_create_state(crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	crtc->state = crtc_state;
+
+	return 0;
+}
+
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -227,13 +243,16 @@ void drm_mode_config_reset(struct drm_device *dev)
 			plane->funcs->reset(plane);
 		else if (plane->funcs->atomic_create_state)
 			drm_mode_config_plane_create_state(plane);
 	}
 
-	drm_for_each_crtc(crtc, dev)
+	drm_for_each_crtc(crtc, dev) {
 		if (crtc->funcs->reset)
 			crtc->funcs->reset(crtc);
+		else if (crtc->funcs->atomic_create_state)
+			drm_mode_config_crtc_create_state(crtc);
+	}
 
 	drm_for_each_encoder(encoder, dev)
 		if (encoder->funcs && encoder->funcs->reset)
 			encoder->funcs->reset(encoder);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 161cd1f6b8266e882eb1fd128b403cba350be3d2..bc83094dfb78f0f3699ca7956a8a666ca09b2d1a 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -43,10 +43,14 @@ struct drm_device;
 void __drm_atomic_helper_crtc_state_init(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 				    struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
+void __drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc,
+					   struct drm_crtc_state *state);
+struct drm_crtc_state *
+drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 					      struct drm_crtc_state *state);
 struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 312fc1e745d226adec787cd5f1b7c923fe629670..9e410191683c4cb978d759e3b734afdd3bb8aa76 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -636,10 +636,23 @@ struct drm_crtc_funcs {
 	 * 0 on success or a negative error code on failure.
 	 */
 	int (*set_property)(struct drm_crtc *crtc,
 			    struct drm_property *property, uint64_t val);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocates a pristine, initialized, state for the crtc object
+	 * and returns it.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, crtc state instance or an error pointer
+	 * on failure.
+	 */
+	struct drm_crtc_state *(*atomic_create_state)(struct drm_crtc *crtc);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current atomic state for this CRTC and return it.
 	 * The core and helpers guarantee that any atomic state duplicated with

-- 
2.53.0

