Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A87D2E0901
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Sep 2025 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120450; cv=none; b=YL5EIELhCuL/3q5Pcx+XpTncqeYF1f2yXZpaN+vcElycFGKd9t8HORJ2AYhO5aHVwOBDdFNSH7AyPJ3eiKB50u/g5Y/Y1GaY6vlvJdzOF3X8oSICZXnuOvme4z721uGuDPzK6yCt/gg2Xin3lZZixioMAdmOQ20GJT0s4pDMaNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120450; c=relaxed/simple;
	bh=UsvqM3BvXaxvpr7HcsqbbmUjuygpPNM05UVXcP+zk6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5OXVXwC8RRokNRcbs+lkQlSPbMrMZjuyW4IXC4otB+ESffnBK33VhHY954MCTuLjKJf9xZlPRed/Id6aiiMgW8HN8qme4CTfEgCpAY80JrwHEHBn3JcT6QvOp894l6IPWw2hfSSar4f0s7E2bRBDq2AAYmAnB9RcfsgsFC4lvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+vkl+WR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+vkl+WR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA07C4CEFB;
	Wed, 17 Sep 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120450;
	bh=UsvqM3BvXaxvpr7HcsqbbmUjuygpPNM05UVXcP+zk6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L+vkl+WRX+RwuuuQdI2+Wgwhhb0lUMGCWbP3A7X7y+wiK02Zo6sHbS5q9f1gUW2qz
	 y86XSnfb4EgtzOcayxJKTkaqss7p76y8weDFbFpvkDSsn57q9Er3M2UyQXRzWVI4SL
	 lIti72CV7h8pbr9LKrGcY5mF8lJ0Vky8UpdM/RWVJzXdZGTLe8rk4APiD9z0xkxcjY
	 mKujQ9Y9fO3j1waL3N1IcK74/LlnvvAgqUNctymUPp/rgY/7gBKnjgboSGDg5kcnjZ
	 3RXMaqWXSo8yX1ObUrqQ7VYSvZL7Rck+s/bLNPFo/t2I1p9l1qJQymrRO8UUfVmkr6
	 1MsJ7cMU9+2cw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:09 +0200
Subject: [PATCH v4 28/39] drm/sun4i: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-28-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
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
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGjKyauhrL8l3cXNO4WKlEB+G598lDdUtXjMpVPbkdcVQ/6zJ
 oiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmjKyasACgkQJ1/OGaI9vnbkQQF/RNGI
 cLDT3RQaytHwVcB+pY5gOFXtEUqHgpWmbe1C4sL7MCPOi2+iBInpgl/raxOAAYDFWbJt+aJayUR
 cKvyoixGXLolpOpG4PIC3pyxqwjjDCrcAVjGnqfVw909mQQ4M8ME=
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

