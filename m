Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C730F55B
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998971; cv=none; b=VZ1WL1GAprY3MIeGQpLaoKXPZYR2Ja24w0rwBmxuRU6/+9oZvjft6Xt8WISa4IvPcswC9lueu/H9yNJDjbSV49rR6Zlid5i0ENP7uxDOm14/vwyJazuqMqojIN2G1RIyHiDIHXwfZjEAFKD4zM7s5s8zcLRxWR0KdCst0NzC/9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998971; c=relaxed/simple;
	bh=BGJwH8dk8LKzE2H1BZza4Ik6+OH+/LTvBo91DCfO9sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZOGB3XulCowViHrSB+ZS+1pvQpYgQO547kNK/sGsklJOnno+HOOOTnwoOdbiZC0P/L62yTjNDn5pve2INbpBU/SNts98Oe4iutaXEVGSirImVgfGiXKJ0yh2WUcNmZr4/aFsnXw54o7y7O5u8FiSrbGnea3tY9+DhZaI25F1fXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OublJefQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OublJefQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59A31F000C5;
	Wed, 14 Oct 2026 17:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791998970;
	bh=+j7D1pqgccvLqLZYJZWBw4wk9jaYa1sGsAE6CLxVMQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OublJefQL4jbipRbPssZlHGeswIveO13w0pHuJFyxTIpJdiv3T71G6jd/Hhapv265
	 uq5Kmq4kxOxgpMu4tALk/59jXN09Nwf67ZvNy4zQ228COiYp7NgSdvqoAMCs4xhr04
	 GB/VVkL2MWH5jju8q1uGXKlAUQxWZxlGuQlac7BYlv6wa0J8Iam4e+LN9kXMa7iH83
	 0MZ1Aa/IuGVKSUoX2s63btC3/BLKPtzae7LeShJsX9YDZFxfRqN0T/VUlJ9oijmd9w
	 EdVOKk0xOeIY/4UDB/J7S7LjQtCyepxK350x2L854OIrJh09xmGNjDxrZVnQ/KE1V+
	 fA1qFjyFgApqg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 14 Oct 2026 19:27:01 +0200
Subject: [PATCH 38/75] drm/sun4i: Switch to
 drm_atomic_helper_connector_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-drm-no-more-connector-reset-v1-38-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3047; i=mripard@kernel.org;
 h=from:subject:message-id; bh=BGJwH8dk8LKzE2H1BZza4Ik6+OH+/LTvBo91DCfO9sM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnnd0ev9om4XMGf8869+FrCvq+RE07afDqy+mwe350vz
 6+tmZN/s2MqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBMhEGMseGQ3KPbAnKabrtC
 zzvFdoW71ice8eJ22Rl3aMJTP5+jJydvyusKvTRd49SmkDmHoxgivRkbbmenzAvv/O7X7x009ZC
 2wAwZxQwjfYH9XHuFzsZnsmZxrmLkXVRUWcT8sSTHyEGq1RoA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i connector implementation uses the deprecated
drm_atomic_helper_connector_reset() as its reset hook.

Switch to drm_atomic_helper_connector_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_lvds.c     | 2 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c      | 2 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 6b98d20a8890..f3f035c9260f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -63,11 +63,11 @@ sun4i_lvds_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs sun4i_lvds_con_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= sun4i_lvds_connector_destroy,
-	.reset			= drm_atomic_helper_connector_reset,
+	.atomic_create_state	= drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
 static void sun4i_lvds_encoder_enable(struct drm_encoder *encoder)
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 3da9a9283c6e..c930dd899875 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -154,11 +154,11 @@ sun4i_rgb_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs sun4i_rgb_con_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= sun4i_rgb_connector_destroy,
-	.reset			= drm_atomic_helper_connector_reset,
+	.atomic_create_state	= drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
 static void sun4i_rgb_encoder_enable(struct drm_encoder *encoder)
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae583294..1b7ae9b327c1 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -835,11 +835,11 @@ sun6i_dsi_connector_detect(struct drm_connector *connector, bool force)
 
 static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
 	.detect			= sun6i_dsi_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
-	.reset			= drm_atomic_helper_connector_reset,
+	.atomic_create_state	= drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
 static const struct drm_encoder_funcs sun6i_dsi_enc_funcs = {

-- 
2.55.0

