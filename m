Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC0563FA2
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999055; cv=none; b=CJV4TX08VF5k4VettvHXxR4rd17tFY5pkp2Ygd3MmaeRpX9Cq31Fou8OUQ60HkgNZI/bx1o8FO0y2GgdPX1qJs1XL6gE0uC0195PgBSVKU5cQoxuqjY/ADM6AyjM56KVlVKD+v43jbfJDS74fhUCAd5IIjWo3IIN81IAx7dELks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999055; c=relaxed/simple;
	bh=i8MYkIjGLYh93ZYp+TwUqmFpGoWQ2CROBOjcXchRZbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p99D4CKbRFZi8Y5U7N3+hyok2lUEWuBW+7ewWRYJi2INPvul1hGygYIvOJX02cgxgqc7QYl8N5RKrw2iqPpkok67d0+TbZO34+LNRT/E0Da2XBCeJRP4u9sdTDbdxVpiofWZcVx1ZeU0TzW1QqOCiUvM1Lth9xr8+CiHVpVSAAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls/wC7FH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls/wC7FH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153F01F000C4;
	Wed, 14 Oct 2026 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791999050;
	bh=DbSuhGcU5F2AudOqjawBMeENfozP8H5WOsGmSV1ZOEI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ls/wC7FHf0dFNpmbTLsuMoQOA1oDVdEF1yaadRDiLZCGwB2L6WC9b3AmxBy3Ozogp
	 ou+GPvgdPiIWERdrGFjq65sOgwO16oC8dkxZKIGOJqx7Pzz7jWxwRTzrsriAVu3pGY
	 b2BMmVNVtYFshe0Y3o3XdGG7ANEohwawvI9ALW3hRoxUqYKIR3drQuVztO4Kgg1J4/
	 vxlZOZVYGXgoCzh1qErRfe4fkTWizHvWmcIK4JQWQ5+avt5CpYFN9+36Js2K3DL7qN
	 MiY377V2ZhoNaXdYQtE/UiduFLkKvLMmCxaIIFJkI3BgzeHN/WqAPR/IFwWGvKSBz2
	 oMathAKpOf7Ag==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 14 Oct 2026 19:27:23 +0200
Subject: [PATCH 60/75] drm/sun4i: hdmi: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-drm-no-more-connector-reset-v1-60-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=mripard@kernel.org;
 h=from:subject:message-id; bh=i8MYkIjGLYh93ZYp+TwUqmFpGoWQ2CROBOjcXchRZbM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnnd6eYpKx6p3VXbf/n0h/uNYYlh8XTrHyS766etlkpf
 ZXR1qWbO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEKhMY66wT/qgydzzZeqY6
 VDbx5mz9LYVlB8IaHk7ZW+R91X5KNFv5rttiu69qvBXvdmzqlg3PZWxYVqyctOPyude1N9SEXVg
 8/D/nvDjJHSM095/zMouT2UHbXvh4N8vsOuO32t3yccykU2wA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i HDMI connector reset implementation creates a pristine
state and initializes the HDMI state. It does not perform any
hardware reset.

Since this is equivalent to what atomic_create_state expects, convert
the reset function to an atomic_create_state hook that returns the
initialized state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index d98b6f12a7bc..1226228c2ab3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -283,21 +283,30 @@ sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	}
 
 	return connector_status_connected;
 }
 
-static void sun4i_hdmi_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+sun4i_hdmi_connector_create_state(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_reset(connector);
-	__drm_atomic_helper_connector_hdmi_state_init(connector, connector->state);
+	struct drm_connector_state *connector_state;
+
+	connector_state = drm_atomic_helper_connector_create_state(connector);
+	if (IS_ERR(connector_state))
+		return connector_state;
+
+	__drm_atomic_helper_connector_hdmi_state_init(connector,
+						      connector_state);
+
+	return connector_state;
 }
 
 static const struct drm_connector_funcs sun4i_hdmi_connector_funcs = {
 	.debugfs_init		= drm_hdmi_connector_debugfs_init,
 	.detect			= sun4i_hdmi_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.reset			= sun4i_hdmi_connector_reset,
+	.atomic_create_state	= sun4i_hdmi_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
 #ifdef CONFIG_DRM_SUN4I_HDMI_CEC

-- 
2.55.0

