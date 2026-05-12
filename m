Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363C3AA9E7;
	Tue, 12 May 2026 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591208; cv=none; b=VviifA6XPCSEIBLuaihQNRmWI5RjF95Rf50vSGeXUSViOQvEH7Jgz5UsTKqzeDQ+49uTQE6PTGI416MX2Nruq8gU4uHR4QQ8SWoaMs1NYXHarxXo6fPgLAu1w7NeMXHKTECTnErgfFctL6np4JNZSGGME+0jBSY+3ZnSToMTDzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591208; c=relaxed/simple;
	bh=qPK0h/dFSo293ccLyG7pv0Iwc28UYnE7zsHTmGqDLXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLWlK3gSuhiOffL0WpyRnFV8FUOk+A5olCZ+hmdVQaWk7WZJqV6uH1FinVBWPa7UFdVnv6JsPc8UuxmxPo1c6T+8CFvZ7Cl/kyBg1JN6DSgea0d6jWHBQmZ2ZHwpyToX/NZcnRTQdkgAv912OJ16c7zaQ0VMMLbHrHe+MBNllDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgtl0qw0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgtl0qw0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9964AC2BCF7;
	Tue, 12 May 2026 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591208;
	bh=qPK0h/dFSo293ccLyG7pv0Iwc28UYnE7zsHTmGqDLXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bgtl0qw0S1HtJHKjUo0l4BjRLEEPmoULtuacXVJUiPWcSRlg8Oat5gVXaTNdiSKLJ
	 yhwrW/+O8ufgzEPmGcUFRHk9YMFXamfJZq4RZVJeBt1ZkO4ONxB+GCGs+k0Jo4uYr1
	 6FT6Nq+rw0xwLRCPS+0lgtJo49EfsAaTEApRN/kdZCzvRJLuHm9fW9NUCwmN4P1ByZ
	 iLcLrKQnugL7LBrows7espk2H1s+UwghlWlWVEUwf4xObcHbxOR/7tWv8k3ov7SFHk
	 llWjgXioyVCv8eHb1vVZixVXnVlPU10xwsdY/SGsFO5F9pbr+h7m/GrEC421wlBnug
	 au0TnD6p79R+w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:10 +0200
Subject: [PATCH v4 12/20] drm/crtc: Add new atomic_create_state callback
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-12-591dfdcc1bf9@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6826; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qPK0h/dFSo293ccLyG7pv0Iwc28UYnE7zsHTmGqDLXg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqgeK5OUcv5wXvLz3w5OfEXyu1Vw3Vj3/deyz3o/Oz
 Jk3Hyl975jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAXWcpYZ+Fz/oT+wws9Rvyl
 24yF7txoll/3fUGtzv+0IJfd5q97N2zvPymziN2v9cyxrWf3LJydwdjwQMxgQa2M/ZETTj4PElz
 0PvpskUp3ipGSO9Bo4aa+1W9GueMXOfcmpglzjU2S/3x9vgUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
to drm_private_obj") introduced a new pattern for allocating drm object
states.

Instead of relying on the reset() callback, it created a new
atomic_create_state hook. This is helpful because reset is a bit
overloaded: it's used to create the initial software state, reset it,
but also reset the hardware.

It can also be used either at probe time, to create the initial state
and possibly reset the hardware to an expected default, but also during
suspend/resume.

Both these cases come with different expectations too: during the
initialization, we want to initialize all states, but during
suspend/resume, drm_private_states for example are expected to be kept
around.

reset() also isn't fallible, which makes it harder to handle
initialization errors properly. This is only really relevant for some
drivers though, since all the helpers for reset only create a new
state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect:
atomic_create_state to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Continue the transition to the new pattern with CRTCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 25 +++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 34 ++++++++++++++++++++++++++++++-
 include/drm/drm_atomic_state_helper.h     |  2 ++
 include/drm/drm_crtc.h                    | 16 +++++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index b277f92f4532..8762171c9432 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -122,10 +122,35 @@ void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc)
 
 	__drm_atomic_helper_crtc_reset(crtc, crtc_state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_reset);
 
+/**
+ * drm_atomic_helper_crtc_create_state - default &drm_crtc_funcs.atomic_create_state hook for crtcs
+ * @crtc: crtc object
+ *
+ * Allocates and  initializes pristine @drm_crtc_state.
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
+	__drm_atomic_helper_crtc_state_init(state, crtc);
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
index fa609357858f..2e2cd18a14b4 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -206,10 +206,39 @@ static int drm_mode_config_plane_reset_with_create_state(struct drm_plane *plane
 	}
 
 	return drm_mode_config_plane_create_state(plane);
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
+	if (drm_dev_has_vblank(crtc->dev))
+		drm_crtc_vblank_reset(crtc);
+
+	crtc->state = crtc_state;
+
+	return 0;
+}
+
+static int drm_mode_config_crtc_reset_with_create_state(struct drm_crtc *crtc)
+{
+	if (crtc->state) {
+		crtc->funcs->atomic_destroy_state(crtc, crtc->state);
+		crtc->state = NULL;
+	}
+
+	return drm_mode_config_crtc_create_state(crtc);
+}
+
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -237,13 +266,16 @@ void drm_mode_config_reset(struct drm_device *dev)
 			plane->funcs->reset(plane);
 		else if (plane->funcs->atomic_create_state)
 			drm_mode_config_plane_reset_with_create_state(plane);
 	}
 
-	drm_for_each_crtc(crtc, dev)
+	drm_for_each_crtc(crtc, dev) {
 		if (crtc->funcs->reset)
 			crtc->funcs->reset(crtc);
+		else if (crtc->funcs->atomic_create_state)
+			drm_mode_config_crtc_reset_with_create_state(crtc);
+	}
 
 	drm_for_each_encoder(encoder, dev)
 		if (encoder->funcs && encoder->funcs->reset)
 			encoder->funcs->reset(encoder);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 0bb72453464a..213f7e298008 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -43,10 +43,12 @@ struct drm_device;
 void __drm_atomic_helper_crtc_state_init(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 				    struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
+struct drm_crtc_state *
+drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 					      struct drm_crtc_state *state);
 struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index c6dbe8b7db9e..152349f973e3 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -636,10 +636,26 @@ struct drm_crtc_funcs {
 	 * 0 on success or a negative error code on failure.
 	 */
 	int (*set_property)(struct drm_crtc *crtc,
 			    struct drm_property *property, uint64_t val);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocate a pristine, initialized, state for the CRTC object
+	 * and return it. This callback must have no side effects: in
+	 * particular, the returned state must not be assigned to the
+	 * object's state pointer and it must not affect the hardware
+	 * state.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, CRTC state instance or an error pointer
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
2.54.0

