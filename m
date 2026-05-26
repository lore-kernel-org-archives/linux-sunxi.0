Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B63FD133;
	Tue, 26 May 2026 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814000; cv=none; b=Ig0nGHuFBlv/Ag2s2T3JEP0Z5wvQAahN+X0OF4Kx/z3NyZ3NvAL26+l/Mx0Vt8MOG0oKg7xd6kiN/3V31wRRbAFsdpcmaYHNLSKgHBVGN/VXqSDA7fHaaXtZj7ztFczmC7fucygmtXC0krVeTdnV9aipD4qEK/T1Iv3KCkruHfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814000; c=relaxed/simple;
	bh=u5HTzQX3tbGR+9Qa/HlwJij4QSF7J0Dnsbadygh24+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4MSKMOvjG8BKedvPC5gCPDosPyeMKr8cfbWNP9CyN26ffjzc7ZU2+yEgOZNwG0xa8ddax6YV9ckLO6VIopuQCp1gaS9HFUkXyoBfM7h6xBVamh813KHw3zINV1RfYZetC3fzQYJgniHj7n6skg4fGh7oaFHCpCeJVNLn6fudEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVrVj7lb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVrVj7lb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE721F00A3A;
	Tue, 26 May 2026 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813994;
	bh=7G0AvhnldznKjlOkg6oJndKDwtDSJwo/+5wcviSKhb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DVrVj7lbOQdEd3pO6dhrQAFwfkj63ibCFZ5MR9wHykOKdFO8YY/d6iPHimL+SfFku
	 mEZmfGzj7IHHugR73kZUmQkWhP6O4Br5xk52iR+cxTUruVtZ+5hseOHeepBpreKuGN
	 w6ES52oWhL1z85e44LmYnqrdaZ6zmg5AqZ7iumjlR1NJcFsL8JlQDw3DT6hf6+omxL
	 2y9JgtWenDtqtyPcaYZAWUjnCXZJQel+5dOLKz7x8oPHNZhadWmZBJO3l23eD7zE6i
	 rG6FYwBp2JZgMIQkYIcBPiyFv9CB98oHj2++w2BuwEVFsfRsiS00KNwKS/NSVlNSsh
	 lN0uMT8Q6y/Vw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:15 +0200
Subject: [PATCH v6 03/19] drm/atomic: Drop drm_private_obj.state assignment
 from create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-3-852346394200@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=mripard@kernel.org;
 h=from:subject:message-id; bh=u5HTzQX3tbGR+9Qa/HlwJij4QSF7J0Dnsbadygh24+g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi58Lfzo24yJ29TJ5t2QSWQ4vkPGe/V/hwrcs8N+zqv
 iurco77dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJlEsxNmxpXMwz/7fl+7On
 1718fcJtx2Rfj5kHNyd0LLHlmuJw0+xH2PluRoEM9qf/7jVHHdS+N5+x4cn6HZZMtbLaRp0PAzi
 upCxkrZGZrd8/ocruEof355WvVINyPqW5lHpV/zVjO/J8/iZ9AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The initial intent of the atomic_create_state hook was to simply
allocate a proper drm_private_state and return it, without any side
effect.

However, __drm_atomic_helper_private_obj_create_state(), which most
atomic_create_state implementations call, introduces a side effect by
setting drm_private_obj.state to the newly allocated state.

This assignment defeats the purpose, but is also redundant since
drm_atomic_private_obj_init(), the only call site for the
atomic_create_state hook, will also set this pointer to the newly
allocated state.

Drop the assignment in __drm_atomic_helper_private_obj_create_state().

Fixes: e7be39ed1716 ("drm/atomic-helper: Add private_obj atomic_create_state helper")
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index cc70508d4fdb..a82568d87e4f 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -729,12 +729,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
 						  struct drm_private_state *state)
 {
 	if (state)
 		state->obj = obj;
-
-	obj->state = state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);
 
 /**
  * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state

-- 
2.54.0

