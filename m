Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951D3FF1D9;
	Tue, 26 May 2026 16:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814042; cv=none; b=LEOKiW5PNaX+eLb1V8a3eyddu8uh+udUVTGlDMiaa6tO+lPYC/wt+/PDm1G6utoXhJdSXGRJQh0tftsk+O+lNovC+N45ZDR6uU1ID/+FGedowNxk/HyQdkgnmIVYtroUwxys/NzBbkMg2eNNj2zzkV2TQJCbMEbG+AX0VxMmfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814042; c=relaxed/simple;
	bh=n4eohByrrLdrAD3Xh6iy0bQauhz8JMCGndNHIg0F7dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GU1DN48vMwFK8e7hoVsem7lv/mctwSgFoqu3fslGOLfko6OzH5QB0703zslqPw+VlkwooPGr+bPfDGLX1G4KvQrsoJNpjo7eEZQfi0jDNwtSo4vCXkPDWyP768MSo/gEbB+BvU8CyE7pNVOGgKp1rRDh6cO2mZFm1S8XMa86jbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8kmmIBd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8kmmIBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FAC1F000E9;
	Tue, 26 May 2026 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814040;
	bh=GoXBOAsCBLkRgIlTLAaPNEvsIAgN10v/xLJsKPeWKHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C8kmmIBdZcidMYCHRPP8N77C3zSxCRkolviS65VmH1HGOaOVhDqbY/xXyPDl5eK+d
	 b5K6y+5BF96u0pTcADOOytkwh/y98u8I1uqJRxYRo1Y8BtbTa3z4jU+TTx82RW2qME
	 BSQxczZxbFuJWBe2pdJvXTfNGr6OWk5MZ4FtNs29jbkYgLSW9e54grHQlf0Sh8ZDfn
	 gPM1ivgNT2VtN9qBCVJvk4ox5cU7E8kmrE3j2+NgpQyypdGyPuqkKwIuNV10TkOtkV
	 vUpXmKjplaLA+AIBtaqxVJlDAhSKlxfbv93r7RIwtpFshcjzCYGa2tdrwqSvyRahIK
	 hkcRssgmlr+Og==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:31 +0200
Subject: [PATCH v6 19/19] drm/bridge_connector: Convert to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-19-852346394200@kernel.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2233; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n4eohByrrLdrAD3Xh6iy0bQauhz8JMCGndNHIg0F7dc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi5+KKsw9J67S4+LT7hnIIfvn922i2MV/qz8c/QrhsX
 DSTl1Z0TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgImk3WJs+C/7eeruiPrYPam3
 Ju94bjDFIOiLkcLuMIs5fYF3+OzXv7MujT8ULbKUaa2v6L5lHNuWMjZ82detLrREx8G8fOZinid
 aNwq9i17zmz+t5dHn2r7zypxdnI6bmyKLKhZ13lr4zDDkgjkA
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

