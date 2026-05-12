Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4650A3812F6;
	Tue, 12 May 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591183; cv=none; b=OrFz+eL+5jDy3mdaltj/GYwbkliunzLRQ7FpAfjvSEm08IIagpRUpcxBn257W2X3JaGMV0rZJujjWTE2udFeCd7lpxkhmrOGOzb8ayQrFYOk4UgAi3pcsrtYFBp+XB7G/umF/8LAhhcR0fj0NV6lQfjXYs99fSu1tymGwj4IjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591183; c=relaxed/simple;
	bh=8gKR8nH9fdwkklOxC1orkJLxbt3pf9ySjt3LJ0StlRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rti6eCbaQkbvhRPPWhrrRCK7Hu4Aiu/LFu1MV5jkKL+sKxsraD7lMrOuDawR+R4FKnoFO+f1LBeeUZOTwa1po1N7xz8+5mdAYQmYFD3KR3hoS7mcvoEG8RpTKeV0Z47hpV8es0OVe9IqxgRkktVKUjXduLGgXMWLJifHvSl4tfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGxZx8KW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGxZx8KW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA07C2BCFC;
	Tue, 12 May 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591182;
	bh=8gKR8nH9fdwkklOxC1orkJLxbt3pf9ySjt3LJ0StlRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GGxZx8KW4BSriBhJaMPGvB3SXhxjVOOLsk9Y8Jr7sqdb6k3bB6CBc0MT0A87tMdjZ
	 HZR8PCv6rVGbklxUlg1yXZfM+n19jM0aHi6D4mcWTA/Yv/QpAwMuLcMYBA2fjxKjkr
	 6bartXn7ScRBz7zE0xSq9Z9a6ZrXc9wFwLbq9UbcAmnqJDQv+YJBLBIiO2VKxs0mB+
	 FyziphPUBuKeRXAZxln0Gs4VETqzp1eYv9ekcJCXWXsRiaYnNhcLFOzq61QHb/2BBm
	 NeU+CNcMrUwy6GGakhgdrFo4Ry91pD6+8GjrK7FwkRz7HA/dQay5jwlbZgsRWFIHlI
	 DOYnx3EGOlBTQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:01 +0200
Subject: [PATCH v4 03/20] drm/atomic: Drop drm_private_obj.state assignment
 from create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-3-591dfdcc1bf9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8gKR8nH9fdwkklOxC1orkJLxbt3pf9ySjt3LJ0StlRk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqrtD1/1LyxZpaGTR47182WtKWs+JnQc33evRO2k6o
 68k+z5bx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIvHWMDRsN2vRvsDixPdn9
 vHZC+mWOzokGDkGtd09a/IoVE3Z8M79924PTC9JNWKR+HzH+GP12K2PDHefTIQoneRL+cNVVLig
 XSC8/tfDMI9t/f2r+1QZ/KPRhNj835daVSeEyWkpen+cF768CAA==
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

