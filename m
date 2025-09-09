Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77363203B2
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417348; cv=none; b=PNjqK9PvSmYxwvE2KZ2+cG+NM1yV4v2KRd+sJkMLq5qp+qMICXgKczJZiqBWL3sElQOxThGvTKvOmi4rIMBcopJqDiQoo+2K3TnD7fZXS61nSt/sgSrDFEZjTGe8j9f20QxmsFCZPBXwG+TqQES4wOl+4QETMSllGLzA2/PV3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417348; c=relaxed/simple;
	bh=UsvqM3BvXaxvpr7HcsqbbmUjuygpPNM05UVXcP+zk6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsOMmDmlXQOKfIRj1qw+HTiWtvzk9SnNUCEPbTiWkyc7ffmvDScSqN5dPZGZDCSF5ZN208yuuEACsQ8vZwcafgZpwu8ssR3cNb1X7dxue8VbZ+ZaMFbT4UQELHmyl9zZMFZcUwm85XtMC3PyCfIfO/BjFGHbV/lsQFNKw59Pcck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfGhZbUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfGhZbUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A351C4CEF4;
	Tue,  9 Sep 2025 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417348;
	bh=UsvqM3BvXaxvpr7HcsqbbmUjuygpPNM05UVXcP+zk6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JfGhZbUXLGpgm8rpE3DoAq1yWTgRZRTgHJPTRLXqaWMw5x+NPjdxYaU5ueXbro99R
	 DeQptjkBcM7N4w8tArpGzS/0muKochPMZEQNfW5FVQYb5pbJMh5DyWXdUfYB+ljnwN
	 t6Z64i4LIvmuUIsrbroo9IT//wPzeophVos2Nfs3jAgfYhc5ATzYDWNKbJqFVRTW+m
	 BnccXopkxy8pwW7BThJqbWwZkB9+X3CVYQ9bblgC2yt4hKLtu7wzB1JayObQMOIFuX
	 CE5dszNFhaSyZufKOD31e+LNPmeaqTQEPytWYGov1K5OdP2iY41xeUb1PXWXfpWWH0
	 aUVQ+H8MUWVqA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:47 +0200
Subject: [PATCH v3 28/39] drm/sun4i: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-28-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=mripard@kernel.org;
 h=from:subject:message-id; bh=UsvqM3BvXaxvpr7HcsqbbmUjuygpPNM05UVXcP+zk6M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+PVW//rAxfWsP6XwVd5VZZ4XFodK3DlFEw79sZ20q
 e7d1Z+7OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBElkgyNmwNPC992y1tDldQ
 39wwuXlV/H3y36JsupPczXg+3JoauNvJuEq6UXR9l0vGpk0m8nPLGOs07QxnpKyMv5GveSdJs+0
 /48LMc5+m1T/e9O4Z0y2B3TMeePe0rzyyc/WqbtsOtmezQ04BAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 3 +--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f97be0040aab29cb4e138fcceb20e90c72db0252..94ac6ad6f30688a048e594811d2ae72aaa44376d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -204,12 +204,11 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a09ee4097537fca8b653f34a833b36b69e343ea5..1f77e1d2984548e746805f8323f537f3b4d93198 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -325,12 +325,11 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;

-- 
2.50.1

