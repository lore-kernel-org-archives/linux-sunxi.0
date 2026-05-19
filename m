Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB748A2A9;
	Tue, 19 May 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181378; cv=none; b=rHPqqXyO8ZuPTAzccxTBVNTf00owDyM0FjKHxwb+pBktNKJSyZPNplra8y8icP28euNSOCAed6YO+203VEhHLs41YbY5b5p+k9uPY7RpFpCfuEx1MGnwD91DdYZzvMjNeQzEqZ9ZtnWO2r3HeShDoN8CvFj+kaFegiZq8NdCDUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181378; c=relaxed/simple;
	bh=ol7ZxJRFzPU3goqwZsKdhnIW4o0nEjdILT7N6tLltxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YNcReK8jHel4BzKj+dVmy/o9GM91Jhu6KoljGWC4zh1OAnUH5Bg1NnJ8PhWJlD9RWtZYl66FbYG9ImCo6fyq/sEloq5dUQSNqmyUQ7x4MykJ8t9OqTxtkYzoQHtW+jQV112jDNLsoSzhsm0YP4KWAbqX9mXs0AP9cjpM3ApsCFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFJC76s7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFJC76s7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8771C2BCB3;
	Tue, 19 May 2026 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181378;
	bh=ol7ZxJRFzPU3goqwZsKdhnIW4o0nEjdILT7N6tLltxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GFJC76s7ovJZhz5kivMq2rmmUo3Fs6r2iNh+bmugtZGTCaA+QN8L2ldHayHUxT02C
	 fAZyPljJIcsv42/myPffstArThpuxN4LzsCLUkC6K/lFivUxZDAopxUMHG7RF2MhFB
	 wFMn0HzkMmKvxZCNZzrELSxZKkeOBiMGyx6QJw3aG1QF3t8JDgHZBcxqx906xBi3F8
	 cIRn8Us28lOkHaepx+FKQmOH7HUmMsmrc0VsCvNm9Xwtoiq1HniKt5GOknhpBdEvdH
	 yyhmwnSJIQS+vc9RnzOzyP+buse+ialr87CrfIC3t/j+c7E3VsgzhhLfi/zVk4CwOr
	 oaiY+qO5z0Ssw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:02:00 +0200
Subject: [PATCH v5 18/19] drm/tidss: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-18-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
In-Reply-To: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3091; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ol7ZxJRFzPU3goqwZsKdhnIW4o0nEjdILT7N6tLltxI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk86ozzNTXUl+zNjOTpvta3k3uL6UKpU67su+qq+xQ2L
 kzwUrzaMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZy+CljndHUgp1fNFhsMwO8
 bl7/9jrFYJXRx3c7j0Xucuo6zq4207JU+F9nxd0f+T1OFXL11pUHGesrWep2PL2c53ro/PnLVja
 m6S6ycZsWReWyFDAdlS87xV2/e8aCZ95+UcmVVmcn5Njp+QEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Our driver uses reset to create the various object states, but only
calls the helper that allocate a new state. They are thus strictly
equivalent to the new atomic_create_state helpers, so let's switch to
these.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  | 17 +++++++----------
 drivers/gpu/drm/tidss/tidss_plane.c |  2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index acab9307bdf3..400329aa2200 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -355,24 +355,21 @@ static void tidss_crtc_destroy_state(struct drm_crtc *crtc,
 
 	__drm_atomic_helper_crtc_destroy_state(&tstate->base);
 	kfree(tstate);
 }
 
-static void tidss_crtc_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *tidss_crtc_create_state(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *tstate;
 
-	if (crtc->state)
-		tidss_crtc_destroy_state(crtc, crtc->state);
-
 	tstate = kzalloc_obj(*tstate);
-	if (!tstate) {
-		crtc->state = NULL;
-		return;
-	}
+	if (!tstate)
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_crtc_reset(crtc, &tstate->base);
+	__drm_atomic_helper_crtc_state_init(&tstate->base, crtc);
+
+	return &tstate->base;
 }
 
 static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *state, *current_state;
@@ -403,14 +400,14 @@ static void tidss_crtc_destroy(struct drm_crtc *crtc)
 	drm_crtc_cleanup(crtc);
 	kfree(tcrtc);
 }
 
 static const struct drm_crtc_funcs tidss_crtc_funcs = {
-	.reset = tidss_crtc_reset,
 	.destroy = tidss_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_create_state = tidss_crtc_create_state,
 	.atomic_duplicate_state = tidss_crtc_duplicate_state,
 	.atomic_destroy_state = tidss_crtc_destroy_state,
 	.enable_vblank = tidss_crtc_enable_vblank,
 	.disable_vblank = tidss_crtc_disable_vblank,
 };
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 1a8b44fb45f8..6d82976c2db1 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -176,12 +176,12 @@ static const struct drm_plane_helper_funcs tidss_primary_plane_helper_funcs = {
 };
 
 static const struct drm_plane_funcs tidss_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = drm_atomic_helper_plane_reset,
 	.destroy = drm_plane_destroy,
+	.atomic_create_state = drm_atomic_helper_plane_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
 
 struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,

-- 
2.54.0

