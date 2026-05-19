Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9A4657EE;
	Tue, 19 May 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181347; cv=none; b=VGKAumd688cy/QVJ65IVhOs63UKB6RcMvZHPr5CEari7VPnifd3TAa9mAfwrZFNcW4HYTh44qgPOKgmnCjLlt8Lce7eo9XHjln94aR0qeMnEbCWJ2/Pe+iffOGusyhfBUbM80oYWRjcdgMMo841puxuG8Nk7Ck5k29nYc+t3rjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181347; c=relaxed/simple;
	bh=DoHehglpGEtHjd3p4fHoExXCMyZCNZ7HfU8eg8Uy0C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJDBDK9foHTVmhCM7HYx9gA5UjVDDK3LzRv7aqpYv/b0bXUNQShV2nCtk99lNy2JEBJbou/OinPTZ0dwZVIMvLpfQ9A1+uLreGFZO+MaMU/N/S2UxAsBDCL/eGhpN2L82t51uF+5DJIq7dMTWnWkHeMuiMCxj4cawuqnsLdRPzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6ESb474; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6ESb474"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6F2C2BCC6;
	Tue, 19 May 2026 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181347;
	bh=DoHehglpGEtHjd3p4fHoExXCMyZCNZ7HfU8eg8Uy0C4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u6ESb474/QHRbYABxn5HFdRPtUmgCa7msPBBlh39qWmdEK/2Pd5efciPMYxiGA0kw
	 4WYk6pVFmnxEjvKg5ZA6McfSQ9nTZebrFUMx606HX/z2gRmJySO/0NQ+EOlShC70qe
	 GC8B42ivbaXvbM37nND/ZzZv6x3UiyoS5vLAZTl3VE+L0/lC4Y9HgB9t7vBRNeXQCP
	 163qAAzd5wYWnTUyVcP8npG69Y2BG3sXWUhKQNLTJTOzsn3fJHiaWNk4KWBldpNBha
	 pgw34TNK97gaUBg/yU/a/dNEgI4CDkcWfEdgLmfE7Xxz/VhGht5FUtNAYiTohYwYbm
	 U7PJI9SW1HKmw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:49 +0200
Subject: [PATCH v5 07/19] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-7-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
In-Reply-To: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3524; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DoHehglpGEtHjd3p4fHoExXCMyZCNZ7HfU8eg8Uy0C4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8an+Yrye+2NThsKvBK+hbjLTcPH79zXdjDsY9NXhnO
 kFHXeVzx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIe03GhqdOn1vP330ie9Tu
 nY7C+ao+2yfZvJFh/Ad3ndGbb73jT+xS/xe9U7sureB5XfyYI2/9DcaGH+dWtyUIbWNKEK8NWia
 w6u4DG4ZfQa+uuD36vz1HXNnAumq32BHRmPvaM7jiT2w5unsCAA==
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
index c873199c60da..b4b9e4f558ab 100644
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
2.54.0

