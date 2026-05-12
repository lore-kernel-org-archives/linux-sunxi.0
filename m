Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B0A3BFACE;
	Tue, 12 May 2026 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591232; cv=none; b=tJ0EOeiNI5ymKnF2BXPMCtgSrZD60njdrdmKnzBBdFj0EnJICu+P51GdqE3tkRn3k93uCnmOR3e+elzMQ72b+AjZcvJgABvYOI1gV7Oth9z1V4m2A4BDDwifZ6xMaFR05WlpBSbs4jgns9sEFbZSoM30B0GQ0YpL2TOz6jojhvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591232; c=relaxed/simple;
	bh=n4eohByrrLdrAD3Xh6iy0bQauhz8JMCGndNHIg0F7dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gq8is2tL1Q2Z1gGFVxi9MNC/fIYRE1Y//rwWOwREI9iy24ZHzUy+KwlMwgHWhcDIs+8gfzdCXxbLCl0g+YqkAXibtK1Qlu6wHgbUuMNeSAGSNvRJazsCWDVQep6Nio6T8tOCUtX9bs6MphnBWf+P8XAK6Ltsoev8aw+mmo9LE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZfJpeag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZfJpeag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBA9C2BD05;
	Tue, 12 May 2026 13:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591231;
	bh=n4eohByrrLdrAD3Xh6iy0bQauhz8JMCGndNHIg0F7dc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aZfJpeagASMSt93SGtgNPNFiIKv0sh5rePucN3m7DE4JKFFBrN5YlHVtWXGZR6SLj
	 BEm8ZgWwkKkCdzUj86dqxN2ZdllsnkQx8d0BU0dagu6MI8Ud2z4h8c7CAoV+6W3Tqs
	 rhMmsHRam00BhFm9jzImcyuYcG5NiAowfHeL/iQtZlqHG5EE7OIlKYYXBFRxBVN/Nh
	 /Q10EZZkBhRRSe0WoHbdBRA3d+Zd8+uS6IZFKLJlwgm98N5xwORj66O1phNOwgyaFM
	 yjh/7zdswAcg43SJ7MQ4sEQHn8DqfQF+9PDTMCAZjRuGkY1/TV9DxqpyJxU49SFXLR
	 bAU8JQXLhAbQw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:18 +0200
Subject: [PATCH v4 20/20] drm/bridge_connector: Convert to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-20-591dfdcc1bf9@kernel.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2233; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n4eohByrrLdrAD3Xh6iy0bQauhz8JMCGndNHIg0F7dc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqofX7m//V/ko0eeLjvieiynXfOyL5kYH71h544hi9
 9aImScudUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJKAYyNvyT6Qkx5bJZJs7K
 VHQj1rhjduaE+uctAd4fn/NdbPl9LvLzEs6XR2YG8Qkttj7yu6IgnrHh0JnCA+kqdjM732oV/NJ
 alfLqm805P9mOXUfqrziee9248rOc3d15rDc/GGl8THhRI1sGAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The connector created by drm_bridge_connector only initializes a
pristine state in reset, which is equivalent to what
atomic_create_state would expect. Convert to it.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 50408af746d8..cafa498c3848 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -263,26 +263,33 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 		if (bridge->funcs->debugfs_init)
 			bridge->funcs->debugfs_init(bridge, root);
 	}
 }
 
-static void drm_bridge_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+drm_bridge_connector_create_state(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
+	struct drm_connector_state *conn_state;
+
+	conn_state = drm_atomic_helper_connector_create_state(connector);
+	if (IS_ERR(conn_state))
+		return conn_state;
 
-	drm_atomic_helper_connector_reset(connector);
 	if (bridge_connector->bridge_hdmi)
 		__drm_atomic_helper_connector_hdmi_state_init(connector,
-							      connector->state);
+							      conn_state);
+
+	return conn_state;
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_create_state = drm_bridge_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
 	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };

-- 
2.54.0

