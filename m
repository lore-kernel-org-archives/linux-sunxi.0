Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E84363C60;
	Fri, 24 Apr 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025961; cv=none; b=kur2ymRQetaBP3pDfCtxmaNTd3duYw+nLGOrj/2CpudF0W9W/NyiILI7wSN0sTEgX5qU6E8z2rqs7d3kv7Ih+yvAaKRfDCRDjICJW8wyKU/w1diyjAW6BQtuy6mMbbQVm8BaLfJiJzMCWyRevKmkH3ddR+fQ/yjy/vNiVVM1HwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025961; c=relaxed/simple;
	bh=f1p1Qjz6o1/6AK0pHuYPmJPPNVcdZH/dmfB4Pynzfj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XAHonPmYmqlXGI/Kuzk9n8td2VSBjzjjJnkiSygos+uHSFGX4GCuaneohSHg5bf+G7CX+41NANyHk3xy9E4Sbe/IwFhA4NiDQ2xxSSLTknzt8jHCay33YlHf9NhBF9Ylkl8vZ70yKwbqBLi7sTN8R/Q8LfmDV1K2WM6xHhdwr78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLdopPDZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLdopPDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9905BC19425;
	Fri, 24 Apr 2026 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025961;
	bh=f1p1Qjz6o1/6AK0pHuYPmJPPNVcdZH/dmfB4Pynzfj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GLdopPDZszbUpEyI1zd8RSNPKa/D0GOxoIR/D0YU6qlY1oDaksSXBcExGiZYRjy3R
	 gYiE8M53S9+FfSGpHiv5b6mLN//FodA78F6P4Eot5lawRpLHlaMrW6Q9LMJfKsDZzH
	 K79Q/cbD4nOjTZ2rFnNd3ssq+Qj3rx+IYFdv3oNm2ktgmzjFnARcfJZ1lO5lC1OrGX
	 qOaURQiQeb2Honzsd2AUfsaJ5iNpYu63k/IZwf0+BJPQh5yKX+F4AFaYoW31M984O2
	 wahLHBXD0TrZtuDAAujMRrcaQjxnTq/Cc1ArRlo+DGIBjKytvFLvkAd3ZE1JI+bt+S
	 jdOAZB/d7FdJA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:47 +0200
Subject: [PATCH v3 07/20] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-7-8b68d9db0d8b@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3449; i=mripard@kernel.org;
 h=from:subject:message-id; bh=f1p1Qjz6o1/6AK0pHuYPmJPPNVcdZH/dmfB4Pynzfj8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnbv9Ui1V/n7sMbt6OyZhe2TxiriNL1/qx4mlTj2Wx
 9P1NaKwYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEyklp2xPqx+184/HXZ75jlE
 FqqKcZtsVrgc9usPyzbpy1zZC1in/d9y5c5ZrYQAcaX1fyzUErYfZ2x4/5Bv/n3xx0ftHp2s/tv
 XuHNR4YbbbsyOBy2C3H/N2n6aYXqg2YG93pa6me87T8irXl0KAA==
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

reset() also isn't fallible, which makes it harder to handle
initialization errors properly. This is only really relevant for some
drivers though, since all the helpers for reset only create a new
state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect:
atomic_create_state to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Continue the transition to the new pattern with drm_colorop.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_colorop.c | 23 +++++++++++++++++++++++
 include/drm/drm_colorop.h     |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 4c4d0a953e35..c0eecde8c176 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -521,10 +521,33 @@ static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
 							   &val))
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
index bd082854ca74..874ed693329c 100644
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

