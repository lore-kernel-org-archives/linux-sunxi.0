Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC03D3304;
	Fri, 20 Mar 2026 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024078; cv=none; b=GhR13Nl2pIXp98b49JTPvxv+TmH9TD+2lsp8YdK2EzB1PE5tc3bCXIusXdEztBx3mocjqVvbY0wd9KA7TK6AEMyM7WCa3IVNfvrUqxZjDnpM+I+vZDxB+fxOYQFsPAD5s2ucGBj5eD04M7r1fbrA+DNy/ufCzM1m13OpnU7uHKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024078; c=relaxed/simple;
	bh=kpTOHfQdM7ZtfpMEHO2SQd1Cjbd80ECX3YMjYxLWYzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3fa3hLf+DckZX4++dNeR3J5B9U1x8oZng2lG9pihwnSFpHY9cZcF0pf52Su5/T9rLx+lRpkDM6U0d3mZZbeg3z0j4PsrRtPtjf+nL4jk3zSJtUqcFQ6p/LwVl8ZFyenjUQl/W/GVursIa7CA9CFhB8/bfPcCk8gXu5NAqGKORk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPPZzSNA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPPZzSNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328CEC4CEF7;
	Fri, 20 Mar 2026 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024078;
	bh=kpTOHfQdM7ZtfpMEHO2SQd1Cjbd80ECX3YMjYxLWYzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QPPZzSNAUJL+ZetnIVF1PL02lt+uavC4e64FOITPkmxYdfET74Vc8OUVXpuPNLdmb
	 FDLX3+gHeUVxvBXfdA8RLEiJJidky0MsGfNu6gMaxKoOZokG0N7gta3YP1GilkYD7L
	 jRSm3vCEIIdJM5wlvxtq4Qpt3v8IiZfI4x1JeNBF3VxZxc5SV0VRQiEuhRf0aQnifW
	 xWX4fEsSS9lSje+SpQHF42C2C0upSlI5lI10n902/P9PH7EyJNwMEUinnFQEGrkZMY
	 fnLuKjqIiCQk721ffNwmE9NVuJeq+luT4DqekOhniXwTsWzcQr4AKIfeW4QbL3OdWH
	 xWchzhi2bmnaA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:18 +0100
Subject: [PATCH v2 11/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_connector_state_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-11-c63f1134e76c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3941; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kpTOHfQdM7ZtfpMEHO2SQd1Cjbd80ECX3YMjYxLWYzE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7SzNEZFwO6W443PhfSYm5LEzZ5S8b19SNR2YyPFjk5
 eUfZHWjYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExEvomx3jf2Hxv/N6687sp9
 n0PuSKxbfmnGNO9rHUuv/dARPj3D7u7z1DXfbq9SvK5gd+jf6lfGWxjrnUtv7UgMvLb3M/ONs8G
 R9b+WXb/CWr0zhN//8PMNzW8X13VfCTNK3HN9b8r0Vdz3v2T3AgA=
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
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 10 +++++-----
 include/drm/drm_atomic_state_helper.h     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index f1fc2edc6e6e35fbac5ef82437f3cb7485afc412..8ed8cb8a9048e8fd89fa22d20985c84af1672135 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -515,24 +515,24 @@ void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_plane_destroy_state);
 
 /**
- * __drm_atomic_helper_connector_state_reset - reset the connector state
+ * __drm_atomic_helper_connector_state_init - Initializes the connector state
  * @conn_state: atomic connector state, must not be NULL
  * @connector: connectotr object, must not be NULL
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
@@ -547,11 +547,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
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
index bc83094dfb78f0f3699ca7956a8a666ca09b2d1a..259a39a0f41ddb2b7d6c1fe7c1a2b0b51774254c 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -72,11 +72,11 @@ struct drm_plane_state *
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
2.53.0

