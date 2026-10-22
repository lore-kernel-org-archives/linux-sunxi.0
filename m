Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672531;
	b=xIsMlgafFI9Vvmlg72LyESU+STNE4ejw7kTZCZoMxGBjTNAiXhE+QzpFUbed2gNNHf15
	 j51PeJgRKWJ5fdYNS5fkjaKdDngS9g30P1rh3ZQwXy5MDNiBK6zxjsgiUR2uzS0mt5Gt5
	 bm7qq3TXKX+LRdHYAK/SnVxk46a0BWwd4usAF4lDQvmQS12euGWCNQfSXtLCNUlzV5tGW
	 BIyFWs6FL282lxltVJ2ENegTMtnMFN6ikWDFo9ORYAGaB/YQiIaiYCFnH2uYcUeUzBnZf
	 8xIv02vMGmmg/7MyHYhnyZ3GhGzGI0rbj6snGFOJqwGJ+lgYlkkbp54h7ksfrtjBMlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672531;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oc0PrDV8DEK9WJ2O0W/WsptT1VrI37wtjGjJETAFueg=;
	b=KXUolIBWpA/JBIoDGQ1okGjJkycKoSnDqmiR5QLO+kcRvs7uhoiZQrBVLAqiZITt3wUT
	 wOMIB54n4Kkaer92fflXG6G7mv4LyB/iHHZ9B1SJvliKkzRqn2QaFc5u9eTM8nR5hb9FA
	 99jLpLdYp0U5blu7KdnPEQt9mgJpNK+OFN2tKBIT4MF4X17RiOWgbDS/LjXz1iexQYsgl
	 +xUJGh6iu7VausNO6FZdhB4mXf0jnpSHVTwB3pE8/UdLsxIMgq+LO/sxAlmMS4rrh2/ao
	 1st2ltoXUrSne7VTtask8IyVxCPhKnH5C2Y1/q4qTUv5RA3gFtbdJQE/N0emV31zAlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lZvpiEef;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0DF606A31A
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lZvpiEef
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824891F000C2;
	Thu, 22 Oct 2026 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672531;
	bh=oc0PrDV8DEK9WJ2O0W/WsptT1VrI37wtjGjJETAFueg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lZvpiEefz+J1z7asoaUVeevFYmJ0ilsklS3JSRCWHN9idEqjaw1ZfWg8klXPQKKU2
	 4gtD8fr2LB4aNvKEVAsy5HmNGezDXG3IO/eI4JpyPRUB/ZAaH7jhE4IM1ya9LKgniX
	 OilP20IZTfxRomwB790JM2seButz6cZTR1YWNdC/8Sotf2APBQeU2c5NLhHBCzZWEv
	 +SOFv9VYADXVPv6pq7FzcfRgcACZO+CkQn//jboED+lhqww8jWKnxkv11CqhG3udZK
	 cUgxIQVoDrytfgXteeqtiwKPpl+7LeNm5oPJHRsnnt9PpbhiC9JzHAwiHJ1T6vYqsd
	 M4Fla1ZnLXV7Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 14:31:28 +0200
Subject: [PATCH v2 29/59] drm/sun4i: Switch to
 drm_atomic_helper_connector_create_state
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-drm-no-more-connector-reset-v2-29-0b7e4e85b1e8@kernel.org>
References: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
In-Reply-To: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555; i=mripard@kernel.org;
 h=from:subject:message-id; bh=WhXdr0caQxsD2xQ8xxnX9ce6ERhKkrPc/zQA/D7z/Z0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3mGZtK9motz3I+YikXsFPt5DEgph45gMi1yuez36gX
 vVwSdLyjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARwxzG+srFU1b1/LZzr5nG
 e/bCHf/iJBPW6c8Uj8wpMk3RC3v46HP+tI4m/gWbFdpeKzDPrl5nwVgfeX5Nqd+E9w6ck9f0OIT
 J/i1YHjWdxZRdqm2h04VwnyUnC5JDFW5tKNx9TOtM7ZeWJVcB
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
@@ -66,5 +66,5 @@ static const struct drm_connector_funcs sun4i_lvds_con_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= sun4i_lvds_connector_destroy,
-	.reset			= drm_atomic_helper_connector_reset,
+	.atomic_create_state	= drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 3da9a9283c6e..c930dd899875 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -157,5 +157,5 @@ static const struct drm_connector_funcs sun4i_rgb_con_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= sun4i_rgb_connector_destroy,
-	.reset			= drm_atomic_helper_connector_reset,
+	.atomic_create_state	= drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae583294..1b7ae9b327c1 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -838,5 +838,5 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
-	.reset			= drm_atomic_helper_connector_reset,
+	.atomic_create_state	= drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

