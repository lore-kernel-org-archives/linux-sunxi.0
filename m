Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B2D3D3CE1;
	Fri, 20 Mar 2026 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024087; cv=none; b=KFCTVG4cFnFbw8IvUD3fVjeKdLu8ADoYnuBxncQH1iv+a81S9Vg5V+aMQBDycsgmQxNW6zx/1DPFcKTzLeSTyxm+3vaYUwz2tAKmULe0oE3wa5E5GvCjnlepFdO4X6x3xiD9yJ7eYswD6zN6NwdVpRC5NKJ+SSu8VXuLzxKZmo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024087; c=relaxed/simple;
	bh=zRPirJS/vOba8ESgETPuotxPCDJZ9PKy3rB6R6QbbfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EL9vJOyJGhDxid6/NlzY4j8mR8P0Ih+b1obPpygNehWdO9mdPa0+ssbDCmkZV2dRjMapzHQ35Qv5OulRVJO/qbFE17k/dvlllZXiZ+evX0YetsSRs7Jy6EgOvDGcWCAGisk0qQUYU5niSsr9fuqEiVbvIN+hOTDtKagysqMIc/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxubnuRg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxubnuRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA3CC4CEF7;
	Fri, 20 Mar 2026 16:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024087;
	bh=zRPirJS/vOba8ESgETPuotxPCDJZ9PKy3rB6R6QbbfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dxubnuRgFvNE0RmAIeVmg88LHFpHEOgNkuSZWrP85FuFPUKTL6GsLVLQKieVe1db+
	 +h/il0eE4s+ePeo97mTgrYjva4yTXxdiIYfg3r7OZfzR9j8nw0e92JwGKQQTsJEs3s
	 c0TwIcP2tcDTAPT+RQ8zTqNB4++1pG5GTm0ReNDQ88AHN7rNQrZR3rClwQHAxhZU6S
	 ZbGmI7uHhfKLZeyB00lkYz/3GraXWaU4COwRrpgdxvHLHR4ZdC3t/lQtrt38GqwV8K
	 XP5PwEuEesV9diFAeHjQo1GMdOX2FDT/vrzDWP0uq6tlVuU0kzCFIbsvNTIZJBOrNo
	 YTVfK3IEZDd4A==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:21 +0100
Subject: [PATCH v2 14/20] drm/mode-config: Create
 drm_mode_config_create_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-14-c63f1134e76c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6090; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zRPirJS/vOba8ESgETPuotxPCDJZ9PKy3rB6R6QbbfE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7SzPvffkdJNCh1mbephJbHlf0bl2cvwqP1xflUypFw
 dMvRVzvmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABPpZWBsmLCD94J2SZRUce3P
 R25hJvt0Tro3bBf4GSCu+Fpw6ZRXjcvePIyrOXj5RPKWd95CJ+7kM9bnz8w7dMskJlQgo2ZLZ7u
 eBUva/Tl+22wZA9gu+x2dz8HksdSaacmG4y4PA2quXsi0igUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() can be used to create the initial state, but
also to return to the initial state, when doing a suspend/resume cycle
for example.

It also affects both the software and the hardware, and drivers can
choose to reset the hardware as well. Most will just create an empty
state and the synchronisation between hardware and software states will
effectively be done when the first commit is done.

That dual role can be harmful, since some objects do need to be
initialized but also need to be preserved across a suspend/resume cycle.
drm_private_obj are such objects for example.

Thus, let's create another helper for drivers to call to initialize
their state when the driver is loaded, so we can make
drm_mode_config_reset() only about handling suspend/resume and similar.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c      | 12 +++++-
 drivers/gpu/drm/drm_mode_config.c | 87 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h     |  1 +
 3 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 253a00f450b0fb1b7eb6ea42b3235fbf9ee78376..5aa3f9f0620bd155dd53023e6c76e3883ffaadef 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -59,12 +59,20 @@
  * when preparing the update and kept alive as long as they are active
  * in the device.
  *
  * Their respective lifetimes are:
  *
- * - at reset time, the object reset implementation will allocate a new
- *   default state and will store it in the object state pointer.
+ * - at driver initialization time, the driver will allocate an initial,
+ *   pristine, state and will store it using
+ *   drm_mode_config_create_state(). Historically, this was one of
+ *   drm_mode_config_reset() job, so one might still encounter it in a
+ *   driver.
+ *
+ * - at reset time, for example during suspend/resume,
+ *   drm_mode_config_reset() will reset the software and hardware state
+ *   to a known default and will store it in the object's state pointer.
+ *   Not all objects are affected by drm_mode_config_reset() though.
  *
  * - whenever a new update is needed:
  *
  *   + A new &struct drm_atomic_state is allocated using
  *     drm_atomic_state_alloc().
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 124cef8f0c6eb15c9fde4cf7cee2936cbf2b902f..61c3ba5d3901ea2bb05bbd1db0644187820a44dd 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -21,10 +21,11 @@
  */
 
 #include <linux/export.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_managed.h>
@@ -281,10 +282,96 @@ void drm_mode_config_reset(struct drm_device *dev)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 }
 EXPORT_SYMBOL(drm_mode_config_reset);
 
+/**
+ * drm_mode_config_create_state - Allocates the initial state
+ * @dev: drm device
+ *
+ * This functions creates the initial state for all the objects. Drivers
+ * can use this in e.g. probe to initialize their software state.
+ *
+ * It has two main differences with drm_mode_config_reset(): the reset()
+ * hooks aren't called and thus the hardware will be left untouched, but
+ * also the @drm_private_obj structures will be initialized as opposed
+ * to drm_mode_config_reset() that skips them.
+ *
+ * Returns: 0 on success, negative error value on failure.
+ */
+int drm_mode_config_create_state(struct drm_device *dev)
+{
+	struct drm_crtc *crtc;
+	struct drm_colorop *colorop;
+	struct drm_plane *plane;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_private_obj *privobj;
+	int ret;
+
+	drm_for_each_privobj(privobj, dev) {
+		struct drm_private_state *privobj_state;
+
+		if (privobj->state)
+			continue;
+
+		if (!privobj->funcs->atomic_create_state)
+			continue;
+
+		privobj_state = privobj->funcs->atomic_create_state(privobj);
+		if (IS_ERR(privobj_state))
+			return PTR_ERR(privobj_state);
+
+		privobj->state = privobj_state;
+	}
+
+	drm_for_each_colorop(colorop, dev) {
+		struct drm_colorop_state *colorop_state;
+
+		if (colorop->state)
+			continue;
+
+		colorop_state = drm_atomic_helper_colorop_create_state(colorop);
+		if (IS_ERR(colorop_state))
+			return PTR_ERR(colorop_state);
+
+		colorop->state = colorop_state;
+	}
+
+	drm_for_each_plane(plane, dev) {
+		if (plane->state)
+			continue;
+
+		ret = drm_mode_config_plane_create_state(plane);
+		if (ret)
+			return ret;
+	}
+
+	drm_for_each_crtc(crtc, dev) {
+		if (crtc->state)
+			continue;
+
+		ret = drm_mode_config_crtc_create_state(crtc);
+		if (ret)
+			return ret;
+	}
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (connector->state)
+			continue;
+
+		ret = drm_mode_config_connector_create_state(connector);
+		if (ret)
+			return ret;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_config_create_state);
+
 /*
  * Global properties
  */
 static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
 	{ DRM_PLANE_TYPE_OVERLAY, "Overlay" },
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 687c0ee163d25dfa7cf563e77209dd33e349800b..22c7e767a2e98f99fff9311eb590f62bd4c9c8a9 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -1005,9 +1005,10 @@ int __must_check drmm_mode_config_init(struct drm_device *dev);
 static inline int drm_mode_config_init(struct drm_device *dev)
 {
 	return drmm_mode_config_init(dev);
 }
 
+int drm_mode_config_create_state(struct drm_device *dev);
 void drm_mode_config_reset(struct drm_device *dev);
 void drm_mode_config_cleanup(struct drm_device *dev);
 
 #endif

-- 
2.53.0

