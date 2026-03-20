Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A24A3D3319;
	Fri, 20 Mar 2026 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024104; cv=none; b=DcmzSRuO1jqXON2sHzhdbbPSdyLdAaUarizJmKRStiHg2TxUDZ3Cbi0ERUIXgeEQotgnlYqaGy1VhFmJ1Dg75c7KI07CYuzSeCE8hnMxGz4gW6E+jUZkP5zNgkwEsZn9Peu27SoOkpGC+lFttvPgIPbxjb3egH5q0flJOOg1n4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024104; c=relaxed/simple;
	bh=b66Tl5kZoqYvPt0EneArcC4td5ZO+VTiTMrGRP4Ocis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNDokNiq0WmXRSV300oJ/0prjZ4MjI3mJkQKLr+a3P82FZ8XFZ/UX8xX6eTgA+jaU9V4O1T3LZnACEi0RCzXcQ3h/2GmkXVT9hwKBETHJy3YGjguuucMCWySjOk/GnyhZ+tEvQd4pCwODT7MIibnLonBcPqx51K2ld4jlwQCvX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJXf5Zeu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJXf5Zeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F311C4CEF7;
	Fri, 20 Mar 2026 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024103;
	bh=b66Tl5kZoqYvPt0EneArcC4td5ZO+VTiTMrGRP4Ocis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BJXf5ZeuYCDIhrvsHxH1x2cWRy5dggsOMwsdh/Y2nmJ4+p2VWxuuAWYNEFkUqEZEX
	 c5zU/D5fcvlgkNcQhMcg+J4+kHBYh6zYnImaDb3QL6XrPmIqa5aYk7pJv5SuqthjfE
	 XP3v1PzxM4PxnrBzRVk6VnzOvBbWMFPa4EgjcT64CDMpS2tHGfeu85H0taloLObfeJ
	 p2/a7p1UULFu83tJjCpwTUhuIbS14XwM3xH0IKEhFkrBuGz2Fba1eQWkLTjspcQaxq
	 8ewdQnrfExXM7dmP8nAeMzqLUuwC5rnu8/IQqQzzhBQMvNImN+Xbqgnt8vRgw/FmWS
	 jGNtIzpcnK7wA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:27 +0100
Subject: [PATCH v2 20/20] drm/bridge_connector: Convert to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-20-c63f1134e76c@kernel.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2228; i=mripard@kernel.org;
 h=from:subject:message-id; bh=b66Tl5kZoqYvPt0EneArcC4td5ZO+VTiTMrGRP4Ocis=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S3M2nqx88cjFOTf5hobf8dcX952r1ee4+OuTn1bWU
 vl131597JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATOTedsWHmilddlx2LQsS0
 J3AGCM+fufLdwqwN0ip+73KN75ZNP/IspnKnWaWfW8bG6PKa1FcbbRnrC3MCpxmZOyjqL2H1WSq
 R0VPNLtgu+H3R06dF0u5ffrlxnVjNKzDp9U+/pxovJHkWTVoMAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The connector created by drm_bridge_connector only initializes a
pristine state in reset, which is equivalent to that atomic_create_state
would expect. Let's convert to it.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 929f06b290626d2091418a6377a5230e3c264b60..b640e7d5a065d165a901bd73fc836afaab967dac 100644
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
2.53.0

