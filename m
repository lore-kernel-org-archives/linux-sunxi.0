Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F4035AC19;
	Fri, 24 Apr 2026 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025947; cv=none; b=e+LclCawS22yPPX8F/HaARe5kTQe/wHRMIWyt3MoQTrlzUZGCNRrCNrofj+PE41b6EVFplrLEhF+0+2hJdmIghzWwQPy0qsbcHErm8q0IAwOqXh1B5TMaMCbu3fY1Yw3cO8dJCvMyuHSni/Nh5GuygC57/t79vP2BkIBmaj/URg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025947; c=relaxed/simple;
	bh=f47900U9YnBldlELIPGlSkJt8DWEabQXDHg1J7ci0Xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/QvY5mSCAvGp9s/6oNDDuabFtsIMYQMRNCurJ7AWv0ZFMoL2zXYnbYfPr4BESfqfULOIDQjlR/OfmrwhysIb3M+MEM19rCr0soxYCvp5IVg4kbms/nnWUdKZYkhNjzJUowJN0581fDoLCU06ktbqzX0jeSpMm4Qk4ANa+dSeYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xz+8UR56; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xz+8UR56"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D37DC19425;
	Fri, 24 Apr 2026 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025947;
	bh=f47900U9YnBldlELIPGlSkJt8DWEabQXDHg1J7ci0Xo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xz+8UR56hLr1eLv/f2XUnKAAcORtzPv2HmVhoJeH3JpSAA2tXw+Q3Ga2gWiUr+Bha
	 +1bw37PZdXO5b821IDB1gPfuu01J2sDewBUMorSuv/kSVV26cOCyKWlsX+Cxrspz4q
	 GglDfqxVT0nGOBjxQQR18lfnblWZteYIehMipMRbz3pPNDBlZlwcb/0W28WS++wvBU
	 /m1gkXx7NG4sr+8rCrOL0lx47avGBfO1Oo66ku7fOf1ddf5bso1WbTCMubSva94Cml
	 62FsDjg1Csx//gIizyF7DBiw1ATlRPc7k6s1ZgWAip1iBlz0nlBga6X1/XiVFcQoNn
	 BNb63n4DS8l/g==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:42 +0200
Subject: [PATCH v3 02/20] drm/colorop: Fix typos in the doc
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-2-8b68d9db0d8b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=mripard@kernel.org;
 h=from:subject:message-id; bh=f47900U9YnBldlELIPGlSkJt8DWEabQXDHg1J7ci0Xo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnTsP3NYxbJsYs1f9fnj23S6py4y7gm9WxtlqVTyfv
 8slqYirYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEykUJ2x4WASg8KvheGq19Nz
 Lpp/fap39GnO5BfV32eEdLl+dV9Q/yXq5pfuYtYH6oY3wxaFLlmWwthwd/um6F1PhDyY1jE52fe
 eObP9z5mlfz5/u9K6t2L1sdrSd5v29lhtF1mlqysQPnP9cyUvAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

In the documentation of drm_colorop introduced by commit cfc27680ee20
("drm/colorop: Introduce new drm_colorop mode object"), the
documentation of __drm_colorop_state_reset() and __drm_colorop_reset()
were mentioning CRTC when they really meant colorop, probably due to
copy and paste.

Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object")
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_colorop.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 764d12060666..48d0b7ae3fc9 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -503,11 +503,11 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
  * __drm_colorop_state_reset - resets colorop state to default values
  * @colorop_state: atomic colorop state, must not be NULL
  * @colorop: colorop object, must not be NULL
  *
  * Initializes the newly allocated @colorop_state with default
- * values. This is useful for drivers that subclass the CRTC state.
+ * values. This is useful for drivers that subclass the colorop state.
  */
 static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 				      struct drm_colorop *colorop)
 {
 	u64 val;
@@ -526,14 +526,14 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 /**
  * __drm_colorop_reset - reset state on colorop
  * @colorop: drm colorop
  * @colorop_state: colorop state to assign
  *
- * Initializes the newly allocated @colorop_state and assigns it to
- * the &drm_crtc->state pointer of @colorop, usually required when
- * initializing the drivers or when called from the &drm_colorop_funcs.reset
- * hook.
+ * Initializes the newly allocated @colorop_state and assigns it to the
+ * &drm_colorop->state pointer of @colorop, usually required when
+ * initializing the drivers or when called from the
+ * &drm_colorop_funcs.reset hook.
  *
  * This is useful for drivers that subclass the colorop state.
  */
 static void __drm_colorop_reset(struct drm_colorop *colorop,
 				struct drm_colorop_state *colorop_state)

-- 
2.53.0

