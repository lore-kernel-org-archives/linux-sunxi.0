Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9197D3FBEAC;
	Tue, 26 May 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814007; cv=none; b=DyDbVHNGz1wSLHUEVeg0ahFxyEOFRfrRx8nrQlDGJq6u3cX1D9LpRbDu7tqYPAZjksElzM8yUWQcmEZA9DpDeCs1B9lq2wXqGI+7ZDu28xDZMkjtV78V/4gRGioVgrIABHoZynXwuyLYbdFPxd2+cKR3USN5ZnnnLmCZFuwMWnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814007; c=relaxed/simple;
	bh=p9ZaVQhU6x2BUkTWwGqZUaX+oUcICWz2dxNRq772dNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M04g6F0Q0utQPjP4984jotrn4qzI76c25/FDj+fFCRY8P0c0ZwwyRtt0xdK4u0fYiJPzExkXGetCeJppxqQ91mkN97FPUFuzIShS26Ydm9QwRJEbAfw7a1e/6xX17mvohDFoGG1fVe0+H+poAlMtj/WeED6bGHMIhdOfW0dbTQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccr+aUxQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccr+aUxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B384D1F00A3E;
	Tue, 26 May 2026 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814000;
	bh=vmAxlo1wPpVUGFi4z8FBEYgHX8eETYEQ7eEa1NRb4nY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ccr+aUxQl8B8VP26+PznQjAM5jvmJNlSdE8U9y1ip5BaMLJntllTX7BY3Nr43ByYR
	 3I7qL/PTr0QwCrtyQp5W+bo5LH0b+yhWamg9kaS/Fw6GLalmo3/TqXzvjcAl9nVoTn
	 t8pbV74ygCP68BufoMuGEOi+/SGvtWM7zzOAXpKfVmwYbW2Tm5LKKOWmxbPJWLA57b
	 rSEhj3pPq4GQvInyObJ0rsAxTMjEppCSJ4qJqErb5Uii0gr0M+ohJ5g6VIUDtjpb+D
	 dfh5vciNbOM7B3WO74qXzJZivvN3UwICa9CBKQ43vqHiJAJxStDMBJJyEzSMzn3vBU
	 WScG04N75WgRQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:17 +0200
Subject: [PATCH v6 05/19] drm/mode-config: Document drm_private_obj
 exclusion from drm_mode_config_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-5-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=mripard@kernel.org;
 h=from:subject:message-id; bh=p9ZaVQhU6x2BUkTWwGqZUaX+oUcICWz2dxNRq772dNc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi5yICquxP9H7QShWVXMCSd7vposCC4Dzt1JqfSx6dF
 OiqXWTfMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbCrsBYZ/nwX9WGoDVKv2vC
 bjQvNb9///Z62doejbvN/TxBeZqHE8IkZtxlYhThFdlgIOh3tdKFsYarJe3f9J1988I8rvZvE1u
 oMvX4X9NpIZ7ygitPKZ30zlN6mP9kotbOvJ9v2Q70TLGW9AUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() does not reset drm_private_states by design.

This is especially significant for the DP MST and tunneling code that
expect to be preserved across a suspend/resume cycle, where
drm_mode_config_reset() is also used.

Document this expectation.

Link: https://lore.kernel.org/dri-devel/aOaQLx-7EpsHRwkH@ideak-desk/
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 66f7dc37b597..c33382a38191 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -187,10 +187,14 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
  * callback. Drivers can use this in e.g. their driver load or resume code to
  * reset hardware and software state.
+ *
+ * Note that &drm_private_obj structures are expected to be stable across
+ * suspend/resume cycles, and drm_mode_config_reset() does not affect these
+ * structures.
  */
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_colorop *colorop;

-- 
2.54.0

