Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE30A5349D0
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 17:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999044; cv=none; b=bXG4prk37UrmMQcbr+5rEdY9DeSJsY59+Iq3+/VcrOie06udn9ofPZ03atLo59nuQS2ZiFWMPhPL8k25N8z+JqVeymOk73Lsd9RRQE/QS5ZS309PKZqc5aHzCYUxnywt4ctxhgRatT9tQiJIaXv712+tx5DMMwVQZ7HI971acMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999044; c=relaxed/simple;
	bh=xXF1QFT9UKpEXLDQKR376S3M5YzESlM+RLSaRnFDWqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tTodiGXOdZlFMclBcngE1UwCKceTtHslzIQRAldHLjgJPzNFCpm42faH/XeF5ihQZb+NYF7mMkrXrnmnejhy5W+jAulxaCRlVFxAduXVnwQauSHYafvO6DsSyuq2fFsRt/IWnINrZ4EE8GImZBKQKDTUNlvFG8MfTtgVetHT+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icar3pqg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icar3pqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902B21F000C4;
	Wed, 14 Oct 2026 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791999036;
	bh=d+m2MK+IJdwEt/BFD2LzEho7d6ce+ChRZEHGwMNQO1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=icar3pqgKFkZAn6aYBNl3AIBVBIb+eGrnu6dK5h9uX7GMTrDFQLrMwnPJ2wbZGbCS
	 /uD6fZBqJ6vVNBF6uudc4mX4kLbrFEyNpGVVaZKaVVBXGp0E30WMqPnXWZjjrvxVo0
	 ONk3bqoHh00OhdWpUnPtotYXQLKLKPEJOjbbA0gy1P2KirfdGDHI7Kqa8FuyHBU+P9
	 +vFuiG2Gv0m/b1RJPbxCzDCBk/MssyNidiYoyIlxkuYwEfvHe3kRA7+3eRaXp+oRB6
	 O5t/6I+FNwoI48QOxHUWaoASy/xwh3NBWjbuFCcnvumDFUn87wYy8m6F/1ncxi9AGB
	 1ewoNeh8dIydw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 14 Oct 2026 19:27:19 +0200
Subject: [PATCH 56/75] drm/atomic-state-helper: Rename connector_tv_reset
 to state_init
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-drm-no-more-connector-reset-v1-56-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Chen-Yu Tsai <wens@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5688; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xXF1QFT9UKpEXLDQKR376S3M5YzESlM+RLSaRnFDWqI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnndycr2afu5ZaZeGtZpPj8GTvnF5zQ/hLtJ6CwiNOmt
 8LP8YBVx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiICjtjDYeoQsy2iW35z1dJ
 PW0qFTrNcGTJ+4P7eixXFOz4f6DDo20v16PIPecT7hh8WMQ0P5mXhbHeI1zKeFoZ037fniLRuSY
 9x89ay4SqP34xK+mcRurk5ivptlu2Xo+uqDi2aK+t/Pf5RZIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Recent commits renamed other reset helpers to use the state_init
suffix when they only initialize properties rather than allocate or
update the object state itself.

drm_atomic_helper_connector_tv_reset() falls in the same category:
it initializes the analog TV properties from the kernel command line
defaults without allocating any state. It also reads the connector
state through connector->state, coupling it to the reset path.

Rename it to drm_atomic_helper_connector_tv_state_init() and pass
the connector state explicitly as a parameter. This decouples it
from the reset hook and prepares for the conversion to
atomic_create_state where connector->state is not yet assigned.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 11 ++++++-----
 drivers/gpu/drm/sun4i/sun4i_tv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_vec.c             |  2 +-
 include/drm/drm_atomic_state_helper.h     |  3 ++-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 6238066fd5d6..1424c4873251 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -499,20 +499,21 @@ void drm_atomic_helper_connector_tv_margins_state_init(struct drm_connector_stat
 	state->tv.margins.bottom = cmdline->tv_margins.bottom;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_state_init);
 
 /**
- * drm_atomic_helper_connector_tv_reset - Resets Analog TV connector properties
+ * drm_atomic_helper_connector_tv_state_init - Initializes Analog TV connector properties
+ * @state: the DRM State object
  * @connector: DRM connector
  *
- * Resets the analog TV properties attached to a connector
+ * Initializes the analog TV properties attached to a connector
  */
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
+void drm_atomic_helper_connector_tv_state_init(struct drm_connector_state *state,
+					       struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
-	struct drm_connector_state *state = connector->state;
 	struct drm_property *prop;
 	uint64_t val;
 
 	prop = dev->mode_config.tv_mode_property;
 	if (prop)
@@ -572,11 +573,11 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 			state->tv.hue = val;
 
 	drm_atomic_helper_connector_tv_margins_state_init(connector->state,
 							  connector);
 }
-EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_state_init);
 
 /**
  * drm_atomic_helper_connector_tv_check - Validate an analog TV connector state
  * @connector: DRM Connector
  * @state: the DRM State object
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index ce22f1662c0c..ea86f8a6a35e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -406,11 +406,11 @@ static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_helper_fu
 };
 
 static void sun4i_tv_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_reset(connector);
+	drm_atomic_helper_connector_tv_state_init(connector->state, connector);
 }
 
 static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 792b7b39be59..98cece1e48d8 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -379,11 +379,11 @@ vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static void vc4_vec_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_reset(connector);
+	drm_atomic_helper_connector_tv_state_init(connector->state, connector);
 }
 
 static int
 vc4_vec_connector_set_property(struct drm_connector *connector,
 			       struct drm_connector_state *state,
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 4dac741af22c..5e8619aeef21 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -69,11 +69,12 @@ void __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_s
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
 struct drm_connector_state *
 drm_atomic_helper_connector_create_state(struct drm_connector *connector);
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+void drm_atomic_helper_connector_tv_state_init(struct drm_connector_state *state,
+					       struct drm_connector *connector);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_commit *state);
 void drm_atomic_helper_connector_tv_margins_state_init(struct drm_connector_state *state,
 						       struct drm_connector *connector);
 void

-- 
2.55.0

