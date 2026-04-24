Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0237FF56;
	Fri, 24 Apr 2026 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025998; cv=none; b=aYE6Th12w0UpdaQKe3bVndmFQpBzDJ0srbpIgFZncYeIMphdfVBVqwVNC8Aq7CZTvWn5Xn+aEXcLxr48VuoJwADuGpFFExB2jPEAicUf9/XKxPiIEbezvCL2ecttb572a/LOIXewi+4Ue9s6iGfRMowif82CJy4kwXx75LacqdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025998; c=relaxed/simple;
	bh=TZEBUuL8MVAGlaofV/40p+UHuNP/Fq0bzLy0YsAq1bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l25KqOVVCQeWj1+Ya3pAJKlD7aoav7rBk3qIIkG5/0bkWiLpWzoYEtnMv+sPRMb+EuXNK1IDy8qK0F7ugXLOAB6QyHN7GIUH4D+AJilc/GuHFbHQGDZ6+8H5fmhL3NZ/JdaT0ISWRPGvJrlEIoygVRhj6JJzcocL7Lp4kXiItm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ui8mGOMx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ui8mGOMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FCFC2BCB5;
	Fri, 24 Apr 2026 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025997;
	bh=TZEBUuL8MVAGlaofV/40p+UHuNP/Fq0bzLy0YsAq1bg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ui8mGOMxLJhCc/Sp7guVq6ejeKKGinM9ndcB+/SE3t6ov5jLw30SwSLXKlCDoSVpL
	 cRo2ktRmTsJ4Xn5XrS4GjZr9mQFqgj79WYqNPaWTZQQhucat+eJBMz03nfSqf177uq
	 8n5tod+6zwJp4B9S+vLIMt5cqPLQIt7I7Tm4VULE/W2x5o7ZFe3HdQ8hhyf+4GqhcM
	 G0d9g9VNE5qFa2adzTdwwxPvCTOfEKyNuEIXyTGBcKoCZ8zQuyUZ1+OboruLvenqTr
	 7TZzRkVlrqeA7t1gj298zEFXRUQHI0QiuQZA4gWJg98hcMin7GkFYJuXqmuqFf25Uj
	 fNDC3Pbqp/i8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:19:00 +0200
Subject: [PATCH v3 20/20] drm/bridge_connector: Convert to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-20-8b68d9db0d8b@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2233; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TZEBUuL8MVAGlaofV/40p+UHuNP/Fq0bzLy0YsAq1bg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnScaZpgGxJpuPbCeu7f94dJNje92d5xwurj29fSUu
 j3lUme1OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEHhsw1lc+Y7xmxPX7R3rR
 is5tLMzLpD8t2JV7YdK0TXJuvDv8Gb/dm5c806Wi6v39LQocVgueSjHWmayZ/uln5S0evwCFopu
 neNqkp7xuimLgn9mbcrZmy7KC3T8T/918JHGhyDRwC8uRqmYHAA==
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
index d72f29b73be3..4b310fe505b4 100644
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

