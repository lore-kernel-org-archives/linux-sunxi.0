Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDC644237F
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Aug 2026 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193207; cv=none; b=KKuTNfFdvrOHnbswvsnwKVnYATQM2QiY9HLeP5ExIEX6AGcR+3PZhofvksKYIbGEeQKDN3lkKzKTtMxissiNQHcUo0unCwlQGrLaXt3hh/BpEKczpI+9SoU9Cs18On+HgBGUSqWBjEettkuz/WSADrCu0urXYZlziyPoO1rpLTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193207; c=relaxed/simple;
	bh=a9d7GCveTjYpNRIq2WMAfA2b9JIVG5W2l1O1/6gTPp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXgT74h5xuQSDFEAfTox2wxDtnSqRmfU0gtypBltMDYt15YXKD9ZlfPvdCYvE2gjdGyL2N7bO8YJ36gHfiYenDP7uHqrCdl1UjLiLfGM6Yn/Cnb8sAgkEjQWTaXrsXNyxROHOH+c/vExP8hsaY5QlBbKhiY0aJ5qNjpBkJU4HtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MS8tEcFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MS8tEcFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7BF1F00A3D;
	Mon, 31 Aug 2026 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193205;
	bh=AIl8kApfwY+PuNIQ0bDGRHbZMl/F8Fxkf58n8ZSsscI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MS8tEcFIRh5/aRKCbXbrQcojR4CtLsMBx2CQDsk8tD45jbMETjmqDIZOAlQn4F4dL
	 rVKhDeI0AI4s2+La+IQdpPdY6kghflMy6LQLl9sEZFML/JLb+ttmzun/f0R/8DGkIx
	 0h2lxKXPsXBq52C9Gc+HUSohjbqYTokOjX6lOKrWOTB9pfNDcu2VA6VCM7Sn6zqE7k
	 vu7Hr1p+gXpc+AxrugP5LbNwMJzjSvbU77Fh8XBgFoTJMDVic4R2Ye2O5IGvW8Omzo
	 Od/wObvt+xgdVQdb9O+p+d0MJJaCJFrvFOIlWmTLVQDUtZ1bJbbWTAkdS5YdMmry+w
	 +byACqCZN+fOw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 31 Aug 2026 18:17:53 +0200
Subject: [PATCH v3 37/40] drm/sun4i: layer: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-no-more-plane-reset-v3-37-1877c7aa57b3@kernel.org>
References: <20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org>
In-Reply-To: <20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 linux-sunxi@lists.linux.dev, samuel@sholland.org, wens@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6982; i=mripard@kernel.org;
 h=from:subject:message-id; bh=a9d7GCveTjYpNRIq2WMAfA2b9JIVG5W2l1O1/6gTPp4=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGqVqSDIv2dQ303Kptv5DSY7AMbNbqqQFNU9cbVFH30hFibtL
 YiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmqVqSAACgkQJ1/OGaI9vnbeTQGAluz9
 jtilaffBkv/mwRDM+Tif8nArYtR8YCy6xmbcDFZTtJVX7uHLSIDsZ0/z1Gi8AX984N1zn1mwy4d
 +UZiMJ0On364bJ0RLv/LIYcQJX7wBKAuZaW7FpvPQqV7JIEt6Ad4=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The plane reset implementation creates a custom state
subclass, but only initializes a pristine state without resetting any
hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

The conversion was done using the following Coccinelle semantic patch:

@@
identifier funcs;
symbol drm_atomic_helper_plane_reset;
symbol drm_atomic_helper_plane_create_state;
@@

struct drm_plane_funcs funcs = {
  ...,
- .reset = drm_atomic_helper_plane_reset,
+ .atomic_create_state = drm_atomic_helper_plane_create_state,
  ...,
};

@match_struct_reset@
identifier funcs, reset_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .reset = reset_func,
    ...,
};

@reset_uses_helpers depends on match_struct_reset@
identifier match_struct_reset.reset_func;
@@

 void reset_func(...)
 {
 	<+...
(
 	__drm_atomic_helper_plane_reset(...);
|
	__drm_gem_reset_shadow_plane(...);
)
 	...+>
 }

@match_struct_destroy@
identifier funcs, destroy_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .atomic_destroy_state = destroy_func,
    ...,
};

@script:python renamed_func@
old_name << match_struct_reset.reset_func;
new_name;
@@
if old_name.endswith("_reset"):
    coccinelle.new_name = old_name.replace("_reset", "_create_state")
else:
    coccinelle.new_name = old_name

@update_struct depends on match_struct_reset && reset_uses_helpers@
identifier match_struct_reset.funcs, match_struct_reset.reset_func;
identifier renamed_func.new_name;
@@
struct drm_plane_funcs funcs = {
    ...,
-   .reset = reset_func,
+   .atomic_create_state = new_name,
    ...,
};

@drop_destroy depends on update_struct && match_struct_destroy@
identifier match_struct_reset.reset_func;
identifier match_struct_destroy.destroy_func;
identifier container_func;
identifier P;
symbol drm_atomic_helper_plane_destroy_state;
symbol __drm_atomic_helper_plane_destroy_state;
@@

 void reset_func(struct drm_plane *P)
 {
 	...
(
-	if (P->state) {
- 		<+...
(
-		drm_atomic_helper_plane_destroy_state(P, P->state);
|
-		__drm_atomic_helper_plane_destroy_state(P->state);
|
-		P->funcs->atomic_destroy_state(P, P->state);
|
-		destroy_func(P, P->state);
)
- 		...+>
- 	}
|
-	drm_WARN_ON_ONCE(P->dev, P->state);
|
-	WARN_ON(P->state);
)
 	...
(
-	kfree(P->state);
|
-	kfree(container_func(P->state));
|
 	// kfree is optional
)
(
-	P->state = NULL;
|
 	// plane->state clearing is optional
)
 	...
 }

@drop_destroy_mtk depends on update_struct@
identifier P;
symbol __drm_atomic_helper_plane_destroy_state;
symbol to_mtk_plane_state;
@@

 void mtk_plane_reset(struct drm_plane *P)
 {
 	...
-	if (P->state) {
-		__drm_atomic_helper_plane_destroy_state(P->state);
-		...
-	} else {
 		...
-	}
 	...
 }

@transform_nv50_wndw depends on update_struct@
identifier S;
@@

 void nv50_wndw_reset(...)
 {
 	...
-	if (WARN_ON(!(S = kzalloc_obj(*S))))
+	S = kzalloc_obj(*S);
+	if (WARN_ON(!S))
 		return;
 	...
 }

@transform_kzalloc depends on update_struct@
identifier match_struct_reset.reset_func;
identifier P, S;
statement ST;
statement list STL;
@@

 void reset_func(struct drm_plane *P)
 {
 	<...
 	S = kzalloc_obj(*S);
(
-	if (S)
-	{
-		STL
-	}
+	if (!S) return;
+
+	STL
|
-	if (S) ST
+	if (!S) return;
+
+	ST
)
	...>
 }

@transform_body depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier S, P;
expression PS;
@@
- void reset_func(struct drm_plane *P)
+ struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	S = kzalloc_obj(*S);
	...
(
 	if (!S) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (WARN_ON(!S)) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (S == NULL) {
 		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
)
	...
(
-	__drm_atomic_helper_plane_reset(P, PS);
+	__drm_atomic_helper_plane_state_init(PS, P);
|
-	__drm_gem_reset_shadow_plane(P, PS);
+	__drm_gem_shadow_plane_state_init(P, PS);
)
	...
}

@update_early_return depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	<+...
-	return;
+	return ERR_PTR(-EINVAL);
	...+>
}

@update_return_plane depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_atomic_helper_plane_state_init(PS, P);
	...
+
+	return PS;
}

@update_return_shadow depends on update_struct@
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_gem_shadow_plane_state_init(P, PS);
	...
+
+	return &PS->base;
}

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: linux-sunxi@lists.linux.dev
Cc: samuel@sholland.org
Cc: wens@kernel.org
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index d65587d96d9e..7ec6d8131908 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -14,26 +14,21 @@
 #include "sun4i_backend.h"
 #include "sun4i_frontend.h"
 #include "sun4i_layer.h"
 #include "sunxi_engine.h"
 
-static void sun4i_backend_layer_reset(struct drm_plane *plane)
+static struct drm_plane_state *sun4i_backend_layer_create_state(struct drm_plane *plane)
 {
 	struct sun4i_layer_state *state;
 
-	if (plane->state) {
-		state = state_to_sun4i_layer_state(plane->state);
-
-		__drm_atomic_helper_plane_destroy_state(&state->state);
-
-		kfree(state);
-		plane->state = NULL;
-	}
-
 	state = kzalloc_obj(*state);
-	if (state)
-		__drm_atomic_helper_plane_reset(plane, &state->state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_plane_state_init(&state->state, plane);
+
+	return &state->state;
 }
 
 static struct drm_plane_state *
 sun4i_backend_layer_duplicate_state(struct drm_plane *plane)
 {
@@ -131,11 +126,11 @@ static const struct drm_plane_helper_funcs sun4i_backend_layer_helper_funcs = {
 static const struct drm_plane_funcs sun4i_backend_layer_funcs = {
 	.atomic_destroy_state	= sun4i_backend_layer_destroy_state,
 	.atomic_duplicate_state	= sun4i_backend_layer_duplicate_state,
 	.destroy		= drm_plane_cleanup,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.reset			= sun4i_backend_layer_reset,
+	.atomic_create_state	= sun4i_backend_layer_create_state,
 	.update_plane		= drm_atomic_helper_update_plane,
 	.format_mod_supported	= sun4i_layer_format_mod_supported,
 };
 
 static const uint32_t sun4i_layer_formats[] = {

-- 
2.55.0

