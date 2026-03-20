Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6503D6686;
	Fri, 20 Mar 2026 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024061; cv=none; b=pMjH12lRK6jtc88bdlf3DDTN58nyUPuJCac3Q/bbk5md+lfd0UzE0Gk47sMbyKWRtmtxYPiflO5HxKc8TCIeR5B8aTsJuBccB/JDEtrwGGTMzV6I5Co4OXtHkA6jAALPy6K4u7xHzd0MQO4oNDjZtP9yVYoGsRECmL5vWnuFL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024061; c=relaxed/simple;
	bh=tV0OUH5Z4hrHQzJZ84b17uMDTCIadEHDfju/TQw420U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tY5hIWxfq7apvDfVM93L1YRtIKIV48PK0RpRJMi++2eeCSJmvCtXvtJ69+B8xl13xIAmt8m+td3DWLtlCgTX04woi0nA7DgKJ9Ms0yoKlQ5+VSw5DPsTIY9m+1cJeGKJb/PeGrAhXYeHegpOZROYax7gCBDh3nVsWMaP8FGmXP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JULZHsrK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JULZHsrK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F16AC2BCAF;
	Fri, 20 Mar 2026 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024061;
	bh=tV0OUH5Z4hrHQzJZ84b17uMDTCIadEHDfju/TQw420U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JULZHsrKhybK2x7+zLx74QYzs0VdouhPCYRj/NTVKOvNFPS/WeHgIMDY4uf/nue1P
	 476XWT0ShIB0WaH8C7+aFvSaDcSSOc4peEasYOHF3OkpnIxdbRNFhk/3mkGdolT7Bh
	 wvuwuA50T+J2tHMERVvM9xcUXMip01xPI70ZFiH0QxJjtm/5LS5j1SfiyIs0Gxry0S
	 u8Jy5bjqosKy/M4nR8ZTJNblNYYHcGOjglBQlY4+8EVOgc5NGOcwzRArJ8NbcpG+Q2
	 eJd1DNfbe/jsv1pO86rgtvrHXW68U5yy7Wb57baffF8PVMm8IqFqPmeIbYmzlk8P/0
	 hQYRVrEP3fllw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:12 +0100
Subject: [PATCH v2 05/20] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-5-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3503; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tV0OUH5Z4hrHQzJZ84b17uMDTCIadEHDfju/TQw420U=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S1NnLnmVcOl2Ug/XzdV53+Jy3NbJqynzqv0Uq7iZ7
 N1dt7agYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkRoyx3qdQ7VXHnyoxCW3m
 a5J27fa/FsySi2m0WfbrCJPwNHMvhp1yvanzinRyvKSfFcyzXTKNsc6uyvjfI6fZz9nsTn85xdm
 zn2m/X8HuvREtSt6GnzNspjtnZ+y6t+bTsixDpdlfgtijDwEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
to drm_private_obj") introduced a new pattern for allocating drm object
states.

Instead of relying on the reset() callback, it created a new
atomic_create_state hook. This is helpful because reset is a bit
overloaded: it's used to create the initial software state, reset it,
but also reset the hardware.

It can also be used either at probe time, to create the initial state
and possibly reset the hardware to an expected default, but also during
suspend/resume.

Both these cases come with different expectations too: during the
initialization, we want to initialize all states, but during
suspend/resume, drm_private_states for example are expected to be kept
around.

And reset() isn't fallible, which makes it harder to handle
initialization errors properly.

It's also only relevant for some drivers, since all the helpers for
reset only create a new state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect: atomic_create_state
to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Let's continue the transition to the new pattern with drm_colorop.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_colorop.c | 23 +++++++++++++++++++++++
 include/drm/drm_colorop.h     |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 6a26b83b260e8d8e83c703ecde490a7a8740ebfb..7bfaf2617ec315f42d80ac72a5eaaef868e65657 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -521,10 +521,33 @@ static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
 						      &val);
 		colorop_state->curve_1d_type = val;
 	}
 }
 
+/**
+ * drm_atomic_helper_colorop_create_state - Allocates and initializes colorop atomic state
+ * @colorop: drm colorop
+ *
+ * Initializes a pristine @drm_colorop_state.
+ *
+ * RETURNS:
+ * Pointer to new colorop state, or ERR_PTR on failure.
+ */
+struct drm_colorop_state *
+drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop)
+{
+	struct drm_colorop_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_colorop_state_init(state, colorop);
+
+	return state;
+}
+
 /**
  * __drm_colorop_reset - reset state on colorop
  * @colorop: drm colorop
  * @colorop_state: colorop state to assign
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index bd082854ca74cac90b42020b09206a8516687666..874ed693329c0ecf94567c094744fe86fd08e382 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -423,10 +423,12 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
 				 struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
 				 uint32_t lut_size,
 				 enum drm_colorop_lut3d_interpolation_type interpolation,
 				 uint32_t flags);
 
+struct drm_colorop_state *
+drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop);
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
 void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 				      struct drm_colorop_state *state);

-- 
2.53.0

