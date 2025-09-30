Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC1F2AD0D
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Sep 2025 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759230086; cv=none; b=fy2ujbuAwqcOy7khCzbOoNYxJhIKoe29YEgYTG1HzxY7UYSNDdtJSphqhRJAZt6mRqnUSt1D+Tfc8mFJKUEbeRz5adC036USPxgU4j9TAQVHhc25nnwt8YDSq0XZpDtZ5vY7NK3vScb/pNFb9IDn9AcOFvXUeYgbFBdefXEsVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759230086; c=relaxed/simple;
	bh=gngwj7kF8pArqtb8nuySJzzwxV0Gy2AND/UvRSwqInc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkv4mvH/XCsUE1tUVPUkef3mNi0ExREnUZzduNdhJqZNHvBhLFcMKjDGS1ZrAcNoAxjMz0IyCl82a875UpdQEFhzEzn8mmZx+VBJzEv4eOIJjIqKnoR4T+PG/SklO7OfNrgM63p5q1cMUmKHAoQAW5asfTGq84F0hQQ4gwUql08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlfATGlY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlfATGlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E664C4CEF0;
	Tue, 30 Sep 2025 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230086;
	bh=gngwj7kF8pArqtb8nuySJzzwxV0Gy2AND/UvRSwqInc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mlfATGlYGaiMycFuMPsN2DSxtU3+j4e41bdssv+KKh7YEbforZ2OVz7xU8DSHgLtT
	 bo+LSmsycWpDMW+oPYvR2jmsOTI34vQey0xjAqmOPfx6WXXHP5jjA42qdy6g0Iq7wF
	 96hOnpFxSeH5Fk/eYUWfs3gc0ckHMYbOk0ntRrlGLSZ1sHXoLv5wfqgvv8qQrobmLn
	 gRzr0I6BINB5kEXohW/kYTVftC1sqgyFR83g7PPzqWAkcXjrvVJ0zlgqpW4LyehS4N
	 KN5qo0cmecMARdZcuZVGhR4jx7O/TnbT4PtD1yYT+VvXfGtmkPU7kKIN3+t5iuPYz8
	 o9YtGDgPuFWHg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:43 +0200
Subject: [PATCH v5 28/39] drm/sun4i: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-28-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
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
 h=from:subject:message-id; bh=gngwj7kF8pArqtb8nuySJzzwxV0Gy2AND/UvRSwqInc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d2iXvpTc46J47dNEF8uSp5ffzauud9XxWXKsqvmk+
 KYWk7bgjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARAwXGhrWBGu8nX4rnuN/m
 WZ7reHpZ9Npm1gjtkNrIKRNvNHsUl50+5tzQeWNTmOa/fbFKeq8vM9ZKpx1NWNxV4Z79PfqI79w
 teyzOLRPSFQ27GvLUy9tWRjDNxfdcJk/V5wuOuxZcuJCzdTsA
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
2.51.0

