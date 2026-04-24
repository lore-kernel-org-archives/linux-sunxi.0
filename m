Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D45371D02;
	Fri, 24 Apr 2026 10:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025983; cv=none; b=g2utD1pzcDx/nECynoV/MZJHmBSG0xl2CthjS6BT0CpcFMbN5IZ/h01WGfzBL4bmFRq4JTOhPRXCiokTo5YuVdkCRC1cbgJHs/qzfCRfvdCWgFoOZJKqPqtjpyLUqh/C9n1bgk7L5gBV2FNDoz+fT9cHeFJ/S4/Y9BfgmhMLHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025983; c=relaxed/simple;
	bh=oXd6HAA/+mPRsOx8vQTdSeX264GKsX87uJfWL9YBUig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1W1i+6FGZtbq6sZ+2yfub3JyxqLIjLgrLlmyQlx0V/8Cvile2UR8Cz9e9ksYRH6B4AzXCYRYarXGDP7qm9HZYNZxfMry7ivMQwKNZyFQV19mWLjwxNPfqq78aj4gZVSuZ8mn8hteGJuPMJ3QabxtHtxKsWPheYTayV3YCp7wvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPKCVVTj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPKCVVTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079CBC19425;
	Fri, 24 Apr 2026 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025983;
	bh=oXd6HAA/+mPRsOx8vQTdSeX264GKsX87uJfWL9YBUig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DPKCVVTjVWnuve0ugREsxy8lglwUJtd/x0kRMyQIeYqTMWXB+NUxSjyk/cFhXnL6y
	 RdPN6MSMhphH2c1r2kXFBtj0e2jOrrfxqkUgmtNhLnch+PxVMiwwZgpYcwcS26Bhzu
	 JEOG54KNvME34xWzIU8RoJu9YkFfMeVBuT4g1CCZaabcpkM3ATr2CSethloQsKsYR3
	 KFAPFpLYi3qzBIoy5qD6XNGjFOUK3GKpf2Ot/mMp7kb8C7O8x29fytcAD1fNP91Hie
	 syvYaBw389MdU8wW2Kd71cOIV529zWxF9o7A508ZDm4/mEcKNu1185GufYnww1HCuu
	 21vI7BF42E+Pw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:55 +0200
Subject: [PATCH v3 15/20] drm/connector: Add new atomic_create_state
 callback
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-15-8b68d9db0d8b@kernel.org>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
In-Reply-To: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6962; i=mripard@kernel.org;
 h=from:subject:message-id; bh=oXd6HAA/+mPRsOx8vQTdSeX264GKsX87uJfWL9YBUig=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnftXf6mfr3B11pKVnXMSzq2dFyPe3CGX+mrq9Ks1r
 0NCFvlVd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJHM5gbFghNIu5Q/LBwumP
 Jki/NxB61T05VOkie6p7R8RWoZtbJ9awWp+8ayY4L/XPE9cPa86uqWKsL+JxPnGbwWKRYoypdDC
 by9ua4xV3GU9MYvBf3cI491X1+YgtzB7VVxlqDb9mfeHLFz4PAA==
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

Continue the transition to the new pattern with connectors.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 21 ++++++++++++++++++++-
 include/drm/drm_atomic_state_helper.h     |  2 ++
 include/drm/drm_connector.h               | 16 ++++++++++++++++
 4 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index f67aacaa3b6e..6140926f4605 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -554,10 +554,36 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
 	kfree(connector->state);
 	__drm_atomic_helper_connector_reset(connector, conn_state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
 
+/**
+ * drm_atomic_helper_connector_create_state - default &drm_connector_funcs.atomic_create_state hook for connectors
+ * @connector: connector object
+ *
+ * Initializes a pristine @drm_connector_state.
+ *
+ * This is useful for drivers that don't subclass @drm_connector_state.
+ *
+ * RETURNS:
+ * Pointer to new connector state, or ERR_PTR on failure.
+ */
+struct drm_connector_state *
+drm_atomic_helper_connector_create_state(struct drm_connector *connector)
+{
+	struct drm_connector_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_connector_state_init(state, connector);
+
+	return state;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_create_state);
+
 /**
  * drm_atomic_helper_connector_tv_margins_reset - Resets TV connector properties
  * @connector: DRM connector
  *
  * Resets the TV-related properties attached to a connector.
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 182d9a8104e7..92ff907f2485 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -212,10 +212,26 @@ static int drm_mode_config_crtc_create_state(struct drm_crtc *crtc)
 	crtc->state = crtc_state;
 
 	return 0;
 }
 
+static int drm_mode_config_connector_create_state(struct drm_connector *connector)
+{
+	struct drm_connector_state *conn_state;
+
+	if (!connector->funcs->atomic_create_state)
+		return 0;
+
+	conn_state = connector->funcs->atomic_create_state(connector);
+	if (IS_ERR(conn_state))
+		return PTR_ERR(conn_state);
+
+	connector->state = conn_state;
+
+	return 0;
+}
+
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -255,13 +271,16 @@ void drm_mode_config_reset(struct drm_device *dev)
 	drm_for_each_encoder(encoder, dev)
 		if (encoder->funcs && encoder->funcs->reset)
 			encoder->funcs->reset(encoder);
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter)
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (connector->funcs->reset)
 			connector->funcs->reset(connector);
+		else if (connector->funcs->atomic_create_state)
+			drm_mode_config_connector_create_state(connector);
+	}
 	drm_connector_list_iter_end(&conn_iter);
 }
 EXPORT_SYMBOL(drm_mode_config_reset);
 
 /*
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index e7c097e6dfe3..8576cd256737 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -75,10 +75,12 @@ void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 void __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
 					       struct drm_connector *connector);
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
+struct drm_connector_state *
+drm_atomic_helper_connector_create_state(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_state *state);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3e422a4f2e72..9fb794957d23 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1569,10 +1569,26 @@ struct drm_connector_funcs {
 	 * when a connector is being hot-unplugged for drivers that support
 	 * connector hotplugging (e.g. DisplayPort MST).
 	 */
 	void (*destroy)(struct drm_connector *connector);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocates a pristine, initialized, state for the connector object
+	 * and returns it. This callback must have no side effects: in
+	 * particular, the returned state must not be assigned to the
+	 * object's state pointer and it must not affect the hardware
+	 * state.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, connector state instance or an error pointer
+	 * on failure.
+	 */
+	struct drm_connector_state *(*atomic_create_state)(struct drm_connector *connector);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current atomic state for this connector and return it.
 	 * The core and helpers guarantee that any atomic state duplicated with

-- 
2.53.0

