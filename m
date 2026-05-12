Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4474929D287;
	Tue, 12 May 2026 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591186; cv=none; b=lRyPzBLzYnP1G+h/FfNtOvsz8phX+aF2YWALvZ/L7YwhL4A6lkY5wTgfcUn7QBpx3GAzhbNI5E2JoL3SE97aFvHZd5Gr/hxFU4UCGntcoWCJ11BCvFO5lOke5qpTeEiXNq9Kl5TueYZe/OctVo+PkNphtqM4d7eH3LIALl0MZQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591186; c=relaxed/simple;
	bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/sxQw6twLmY5PvOVXg2EKoPUzuzlt7vDPdBrPaA2jK8UqYPeJeptlWSokp55Q7gJr0keX5ch7NHXsPr88uWHn59r9GfFWa1HPJCTtt6nTLIfab2zGzWilkNE/zMezhcFS710lvnzgkEBl8/UrecvVHbMmnLMUGBbTN6tmri7Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwp2Y9xG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwp2Y9xG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E40C2BCFA;
	Tue, 12 May 2026 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591185;
	bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pwp2Y9xGBuhGo9kicy3s6VhcvSpicrT6FhoprL8oh65mlR2LmlqZpCWuDnFFSSOc9
	 Go6SQc+gIB7LikhaIsxRGvbS6rHbrsE9p6JsLFKHUjqd5Tt8wcKWgP0mTKLHWshmwl
	 quq/Ez08YX2hKAE7tIaBZZcqG5AQEtbm0gCIvMiY3SMxs1vtWTOX0bd8WNP3X6VIUg
	 SpFNUgcKwG0QExf8lYOZq1/8CwizJTTE4KyxVHHR03Hwhrxe4Xwqty7dN0T9nepMk5
	 ixdP+7KvXpDUk93UwzTv8pxUjbNLbZ6Pl7Nb8GrVqddz7Nbouu7rHjpXEq4TpTUhsN
	 CJjfE8Cg/Glzw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:02 +0200
Subject: [PATCH v4 04/20] drm/atomic: Expand atomic_create_state
 expectations for drm_private_obj
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-4-591dfdcc1bf9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqrubt0rsU7siusStsmW6wf+EOktr9bkqIelMf6/Pb
 Yu8sSO8YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExENZyxPuN35dHzT/J3fpAu
 LgiPPXFJ6iIX37SHG+R/7pyQWsm67pru1YzSk2X+jXFrPjMX+STuYWzYZlbcp3cwJjmo+XhRbH2
 Q/Oky9Suu4T2fuEt3HZDbceR+rJrc+oo9XHbXfk3vfbQqYCsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The atomic_create_state callback documentation for planes, CRTCs, and
connectors explicitly states the expected behaviour: the returned
state must not be assigned to the object's state pointer, and hardware
must not be touched.

The drm_private_state_funcs.atomic_create_state documentation is
missing this clarification. Add it for consistency.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1a80a8cdf269..88087910ab1a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -263,11 +263,14 @@ struct drm_private_state;
 struct drm_private_state_funcs {
 	/**
 	 * @atomic_create_state:
 	 *
 	 * Allocates a pristine, initialized, state for the private
-	 * object and returns it.
+	 * object and returns it. This callback must have no side
+	 * effects: in particular, the returned state must not be
+	 * assigned to the object's state pointer and it must not affect
+	 * the hardware state.
 	 *
 	 * RETURNS:
 	 *
 	 * A new, pristine, private state instance or an error pointer
 	 * on failure.

-- 
2.54.0

