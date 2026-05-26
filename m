Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A5D403139;
	Tue, 26 May 2026 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814025; cv=none; b=XS5D7ouaLobGUJytuTM8UgcMGeTY1XlBdW0cUMmPWl2W94tZiLwbwHC2DE/PAbRvBjdQKHXfuXjW0yVH7F0P4urScZ5q68l5FOF0cphliz43HIMvuCXAmAT6JFieGxBf0Xgf/7kt+JTia/OMMIZ8mpD/MIXh7v9aOqMSg4KQEPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814025; c=relaxed/simple;
	bh=qaSP70ZhrUcMPjOf7+v4uq6SslBv0gdUuCOqJYZwmRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUsljacYRd7WDKa8ay0v3WePh7qqovKV53PInbXX5rKzGGtg25i3PCarNiv4etktFKPW6DZHsgWDf8u4SdGntYKMHEMV5pUY4/DbU1/V9ixV98KfjjYzbC3DyHHfPhBqMFNHafXkv3k+ok5wcoBzye0zBiNYX7HVn9zWiq67rD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMNfjFzp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMNfjFzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754241F00A3E;
	Tue, 26 May 2026 16:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814023;
	bh=l0uRAKmoTcdWxVl0y1aWEcfZ605CPR74dshkiJ4lpGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lMNfjFzp79AS7CVyY8in+XHD6I6i5vGvtV7O8VGUBcvjcbipm0kJv+LTIXiMcpNXD
	 lAMOHzOY+i/fYM62RfPCgmdVzBvGgxzu75ri4SvgT9Dc0tulZJED0uwUJLd1HVxNXc
	 ZHDIQ9Z0LHjlTvShqwJsyNcWvGxAyoX1P3FVFEjJ8h0xqPgS8XbRanyYziP9RdN1am
	 SvKENY1G2Ezy41+YlkPIOc0VvK3ZkULVAHAZFZz2AtqxIz+yfZXC4syFuhGMw+QAiv
	 POxnbLaU4P0WFzxStwIBq5kbvWCOWwDrOOmxKuR8o/02T5qLtTBwG0i2DY/9MC1kuP
	 /UAQGH9lRjOHA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:25 +0200
Subject: [PATCH v6 13/19] drm/atomic-state-helper: Rename
 __drm_atomic_helper_connector_state_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-13-852346394200@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4078; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qaSP70ZhrUcMPjOf7+v4uq6SslBv0gdUuCOqJYZwmRw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi52JsL33Zu/D77IfMtaV7FvyzkV9t/GCb+bcZ4bcy7
 nvsEDVz6ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATsQxmbPhwYq/i68gS4dZe
 q2sPIi5d7H3wbmvkO+3fPa/yYjMnG3/5dPPEEW/TPX1ZwhyS2tJSCowNJ5dwr77PrF4e6G5j77I
 sRFU/bUuhCI+0zibN7kguF99vF/l0Jiy9YXM3Rzyb34znwlwA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

__drm_atomic_helper_connector_state_reset() is used to initialize a
newly allocated drm_connector_state, and is being typically called by
the drm_connector_funcs.reset implementation.

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_connector_state instance, we will need to call
__drm_atomic_helper_connector_state_reset() from both the reset and
atomic_create hooks.

To avoid any confusion, we can thus rename
__drm_atomic_helper_connector_state_reset() to
__drm_atomic_helper_connector_state_init().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 12 ++++++------
 include/drm/drm_atomic_state_helper.h     |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 8762171c9432..e2e5a1b8a820 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -474,24 +474,24 @@ void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_plane_destroy_state);
 
 /**
- * __drm_atomic_helper_connector_state_reset - reset the connector state
+ * __drm_atomic_helper_connector_state_init - Initialize the connector state
  * @conn_state: atomic connector state, must not be NULL
- * @connector: connectotr object, must not be NULL
+ * @connector: connector object, must not be NULL
  *
  * Initializes the newly allocated @conn_state with default
  * values. This is useful for drivers that subclass the connector state.
  */
 void
-__drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
-					  struct drm_connector *connector)
+__drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
+					 struct drm_connector *connector)
 {
 	conn_state->connector = connector;
 }
-EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
+EXPORT_SYMBOL(__drm_atomic_helper_connector_state_init);
 
 /**
  * __drm_atomic_helper_connector_reset - reset state on connector
  * @connector: drm connector
  * @conn_state: connector state to assign
@@ -506,11 +506,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
 void
 __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 				    struct drm_connector_state *conn_state)
 {
 	if (conn_state)
-		__drm_atomic_helper_connector_state_reset(conn_state, connector);
+		__drm_atomic_helper_connector_state_init(conn_state, connector);
 
 	connector->state = conn_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_reset);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 213f7e298008..9634a70e0401 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -68,11 +68,11 @@ struct drm_plane_state *
 drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane);
 void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state);
 void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 					  struct drm_plane_state *state);
 
-void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
+void __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
 					       struct drm_connector *connector);
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);

-- 
2.54.0

