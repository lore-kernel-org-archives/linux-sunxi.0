Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D353624CE;
	Fri, 24 Apr 2026 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025964; cv=none; b=vCmIGuX2R3tRdzvIytq4HE4zlM+pcd2CkBhUfwM/KQaZQiEsVmFQ/qUah1+7TauVaVQ90Er9hwmG+cTuxp/m/BgID8hsSWYUavSGiJrm8WvVCqvIY4lEmI2297h7h5Mx65rSLbPyHUebMw+cylwI6DNTSKnhcx2+Ljo4AAsyp4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025964; c=relaxed/simple;
	bh=8PZTAxPa5/UAYysgAmUIBuPOx5UFXVYyKiqDTD5O9mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Glln2FBCmZWsMju3ol+iE9Cb5U8jf1fmVLEyCv5DFMC5zzw9amMR7QynDKAKYSJgVFXVoc1eDl48TjJJU2kdPQYTjwEpXfS7vsrpbR7ajNOkiQX4Cziyf1YLanl1IAv/l25+R4Srfb1FzTUxQNPekHRQgDasc9Zuowxq5XiYFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3GZ8WNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3GZ8WNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF4AC2BCB6;
	Fri, 24 Apr 2026 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025963;
	bh=8PZTAxPa5/UAYysgAmUIBuPOx5UFXVYyKiqDTD5O9mI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I3GZ8WNqRt1wZouvSNkhGd7vGsGdq8+PJ98nZljbs1AWHSJXtuU2Txkw3Dpm4FvMw
	 q7//Ea9mSIzSMoryL76KvK11sgL67N3pW1xtd8GeH5EisrVjOqmSQ7OVnKTzRz0PpD
	 xRxBKSIuWtPJOi0lYpPnO9jEEaMsKvor1xlRf2vWyYV/6pG/iue248R51T0fjKIxQq
	 7Xj0OwVvPRuIMOmcTZoVNb2PgGHYbLQU0rwKZrf4Gk2D+KLfnCVp9sJljm+6KZ5S9b
	 fxTSWPBRJTuZH5fqzfn7AhCKPuHdMiRVOTG4FUti2qmpVNzFhJBYIs0KoJdNYpbi9L
	 twsnhPIp9a5zA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:48 +0200
Subject: [PATCH v3 08/20] drm/atomic-state-helper: Fix
 __drm_atomic_helper_plane_reset() doc typo
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-8-8b68d9db0d8b@kernel.org>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
In-Reply-To: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
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
 h=from:subject:message-id; bh=8PZTAxPa5/UAYysgAmUIBuPOx5UFXVYyKiqDTD5O9mI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnXvq3cMVPeb5cNeK5/Lpvr183ySM2eHDLz+R7dkeC
 hX29b0dU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCI1Roz1HtExXwLfX0qYW7t/
 /f1PikJNZ6bHnN1tnT09SG2xzPqoT9Xb3Bfrie1utHTmnmztfD6PsWFi4qR/1kyv16bdfui468/
 lo8xFszavV/luvGDriYOP9lWe9OBf3vvBZX2u/p9fJmvkdA4BAA==
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
index 875149494b00..e1f3d05ad347 100644
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
2.53.0

