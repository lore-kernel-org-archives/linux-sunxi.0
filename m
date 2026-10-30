Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373299;
	b=Torkup32YkRZfgIss/OhYuPWyE0KrBK2EoofccGFJK9UwtIeNjraoUZCQo1lJ6+RMZm7
	 RD0PTOzbUsnQq7QlqKwg5YJ/tSYrOMcCgyyvMkVBipfw3om/bkor6tJ5b/Nbl1S1OG7Sy
	 ITifsI/+5ybtOHmmyO/oZ0/klbMv73EahR5wK1mWr7IPMceWa3sSWeGLClLR/QfSbxVpF
	 PYwVhPSWQ/pgkVQmWTDj7WlEKlXmShEhNCIBcx6ZndqInF3OjRIYbZI5sb1WFZbjRdvNN
	 hPoAkLKSHc+lwjjiWG+3VaZ/XRqw15qNwzIWKEj72YL/R8fwLvrJWO2cMTnji6MKjPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373299;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oc0PrDV8DEK9WJ2O0W/WsptT1VrI37wtjGjJETAFueg=;
	b=WsfcyHO2JodhCnZbKGzGt9BV8FXJoPOvUgdvWcOuaZQ3g9M280qHjQxr+OLBy+q/c7I0
	 nDnu08SA/ydaaDekrxPX5SLuwq8yKuK6bP2LKfSoaDx3BOB82+Qtiaf/r/e2HKRKwoq49
	 4xO+Bb/E31w/12E0NnqRQqYt8mLnCHSV6GjTYLQ37HTetZMpbRPvnGtDWGCOiKtdDGNQa
	 d9A1YiwV9MYld4oPOLdyY3rpKPNUEX0Ee3BaGXjvW16NrsBMPqrKX9U584UURHFwH/j7Y
	 1xjknLhB/2IKL0ALCrS8DMhS7E0qX+OecyHTV/CiYLNn4Aa6OwZTWdAMlFa0C+re8pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPWKBRRl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45890606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPWKBRRl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6E71F000C1;
	Fri, 30 Oct 2026 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373298;
	bh=oc0PrDV8DEK9WJ2O0W/WsptT1VrI37wtjGjJETAFueg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YPWKBRRl3rK3doVyFHGwFZHMKD5xsnUKCdOvaVpZdnMkF6mKVa4qyur7YHJYpNYsV
	 ggBviu2ne8azuiPU61/ff6oBZ2zDjhxlJwTID09T4GRi+A+WCXO0BbKaZ9IW/mPtIg
	 M92lL2qQOToYM6DE7jc8aMBH1tqOesYnmtlxIjlCpwRnMq+B99/5H7xRT+Z5FAG2mV
	 AxHHQ7v6/PsBPGNlhs9QwIGl/iiA1wJgujVs85I14V9gD9OnrwzzI5HIww6PtwNTFP
	 rfb/bO9OLybYfEM/YpxQSOjBoCj9A9dCieo8l5zZml2vCLLgFX6OhlCHfsZanqzgPR
	 KvDirvec5fodA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 16:13:48 +0100
Subject: [PATCH v3 18/37] drm/sun4i: Switch to
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
Message-Id: <20261030-drm-no-more-connector-reset-v3-18-30e71d92c327@kernel.org>
References: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
In-Reply-To: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555; i=mripard@kernel.org;
 h=from:subject:message-id; bh=WhXdr0caQxsD2xQ8xxnX9ce6ERhKkrPc/zQA/D7z/Z0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPtqhuCQ1cc6az8UmtWKg6/yZ1tXJpadvIbcuPNcpx5
 U6W8nzaMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZi/YexoamfayZT2ua6GdXP
 r3x9OnPT95sBt3YyrXrUbdUx9yTn5KQ9uU/uODj65gqHnlnhP2XLfMaGRudpd3wPpt32u/LKp8j
 Mk1k35SzTvIq1L379f7mhcdJs7xPqYZpSxh/6ZCYa3570OWEHAA==
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

