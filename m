Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163403A2E15;
	Tue, 12 May 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591197; cv=none; b=d1Bcx/YcCuWcgDuMiGnB8WAyEvjZnYK0YPGAT1KU/6BFea4V7ATrM36dKplT3li3l+3HlOl5X3Zx+7u8+v7Rcg1CGB2hsrynDa+k8JhfRj+33YKlVBPqr+11Lojn3qVc66beepoVPSqGvooCQ8Jj6eXIgVLbRaQ+IPUpqdzzN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591197; c=relaxed/simple;
	bh=3P/ZjAcLUex4P3oNpd5Z+isOTz0WG4WoSqpftWEhPh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c57Wtin9N0+qenqTuFlS7rFbOBF2m7NtJklbnzldZedL+7lS4z4Jb/Z0arm9zHIuIJWSEveI4VF+hvDn9Thixe9ZOllp7dlN+q7gtqdaVddsu+w5ibHEcQm2hXyW/CrHQ4Hx16vJS0dzzCjoVKwINqVQc1DZtQETnOE9WauTKeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlvvWiHV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlvvWiHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD74C2BCB0;
	Tue, 12 May 2026 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591197;
	bh=3P/ZjAcLUex4P3oNpd5Z+isOTz0WG4WoSqpftWEhPh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AlvvWiHVfcMrbt1s1StpdKpNlZKg2/TjYlsrxkhGB3zQ7kTjUcNKgXVZCYJ3EuU05
	 DAJvK8lHFMoJuDG/CkmCwFgt/zQTDTyOOOoWTbUH6PkZqFogB+IQzcjdVr8lkvav//
	 Xjg5/aplYGvF03YAeMcBlu+SYwweoWpUuTWBqyjlhfvMPq5PlDQHNR5qAzHxq+q3UJ
	 dzt8uVCCgSaoBE1T4UwD1jzDztZ1xodMVG4YwzsCEgDyf6LuBnRw7idO9w9A1UhjvB
	 HcmByWzsVvDsFmVhc66ZDCih0cT/ZrNu9FvfIIAKpIZqlObIqWfXdWJk6jcykUuHTs
	 aVam2CnQsndiw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:06 +0200
Subject: [PATCH v4 08/20] drm/atomic-state-helper: Fix
 __drm_atomic_helper_plane_reset() doc typo
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-8-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3P/ZjAcLUex4P3oNpd5Z+isOTz0WG4WoSqpftWEhPh8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqvvmJRuzn9iybX+NIHt62PVDi/Uk/hgHKmj9qhGwt
 thgd3t2x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIcBNjfRT32tCe1zv9Xz8X
 YzGS3PBf7umPmtdb9zlnb27SunPzi4DbzLrblzb/f+cyYb3SVeX6n4wNh3Tt4zZWRExS3Gzlwf9
 36tFrmfOMds+7UTX/4+Epn7bFza2yPF31q1Rpx9bLL5vP5CjMBwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A typo has slipped through in the __drm_atomic_helper_plane_reset()
documentation, probably due to copy and paste. It will not assign
drm_crtc state pointer, but rather the drm_plane's.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index a82568d87e4f..c8ccf8be5074 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -303,11 +303,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
  * __drm_atomic_helper_plane_reset - reset state on plane
  * @plane: drm plane
  * @plane_state: plane state to assign
  *
  * Initializes the newly allocated @plane_state and assigns it to
- * the &drm_crtc->state pointer of @plane, usually required when
+ * the &drm_plane->state pointer of @plane, usually required when
  * initializing the drivers or when called from the &drm_plane_funcs.reset
  * hook.
  *
  * This is useful for drivers that subclass the plane state.
  */

-- 
2.54.0

