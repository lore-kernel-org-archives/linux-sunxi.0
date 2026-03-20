Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF43D5663;
	Fri, 20 Mar 2026 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024059; cv=none; b=YK1T91zKxohL6L/TzMAcXapdJHe6TDTSVhYvtki2b1dfO/go2u4YExOGafhBIS7aY6K1awqCxT/tQ0kgO6YSfASZevs1BsagWdA492/3QqZV3AvvSTyF7uqLpABV7gTJAnZYbefFr+4mSQ6kcLFcOZPfi3okDv0VgmUYF1oiQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024059; c=relaxed/simple;
	bh=n4LHo+A3sGmgVx5XTgxskitpmhWZc2WFNui06B/31zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0qncID0U9rJ9ZRJcaDo1y2yZdqIPVplv5QuCk27HzL6A5rzLwpckxz+HnPVhxSaIaPaCW3cnOVvLJaEpi46RjCF6EsHH1zQ+7wDjXa/QCkGeIezTVUJUSaw9xSH0NFK+vYrmAm0uZGpnoxLqpGAAeD+FKTfbvC6Z5HdgSwUzN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGrjLJnd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGrjLJnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878CAC4CEF7;
	Fri, 20 Mar 2026 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024059;
	bh=n4LHo+A3sGmgVx5XTgxskitpmhWZc2WFNui06B/31zE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GGrjLJndjxsZX/x+aJ0oaVTO4nTdlgT9wZZTHsVp2XLsJsx3RoxNOZChyF7RMbD0b
	 1HtspmxvV3b4e50CJg1v4sZgvMy8xjKT0RfjTReFiBVJNSw2RuJIGR0zW3qCo/hSdX
	 QyY3ipfNcOhbTeVPCVWD8MhVsEfGF83iVUjpnu/qaoSkrC85n1zr3GTltrDO257OKg
	 34JfRXhLPDaxCnARYXKYAPZh13DI99sT0U1GV2WYOTtkh8urYnQd/WSmbCL+TM6Pyn
	 yV1gQD8z4QiZoPwMLSUEqGxoaDCD4vT3sJcMhKN/HPIY6wnghSI3txCIiAIdC9bNdn
	 iF5pfcEj3aW6w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:11 +0100
Subject: [PATCH v2 04/20] drm/colorop: Rename __drm_colorop_state_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-4-c63f1134e76c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n4LHo+A3sGmgVx5XTgxskitpmhWZc2WFNui06B/31zE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S1M/7ZpcevxNoYiS0MM966LT+t91K/3scX8juG1Ha
 5PMAv5HHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiK58y1rs3FmS827toya6i
 7AddXRI+djbMbSK+zNf4MrfnSj5ie/1ehoO1TXslr4p7UHnphYW3GRv+2wcdjth22e/bz4JuGdt
 P1tO65c/4V1jcWH+1efO1SfvdZO+mnGUp7Qj+P+O8RUhnjxQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

__drm_colorop_state_reset() is used to initialize a newly allocated
drm_colorop_state, and is being typically called by drm_colorop_reset().

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_colorop_state instance, we will need to call
__drm_colorop_state_reset() from both the reset and atomic_create paths.

To avoid any confusion, we can thus rename __drm_colorop_state_reset()
to __drm_colorop_state_init().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_colorop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 373cd0ddb8fd4478874509ed12c95451c1f66203..6a26b83b260e8d8e83c703ecde490a7a8740ebfb 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -498,19 +498,19 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 	__drm_atomic_helper_colorop_destroy_state(state);
 	kfree(state);
 }
 
 /**
- * __drm_colorop_state_reset - resets colorop state to default values
+ * __drm_colorop_state_init - Initializes colorop state to default values
  * @colorop_state: atomic colorop state, must not be NULL
  * @colorop: colorop object, must not be NULL
  *
  * Initializes the newly allocated @colorop_state with default
  * values. This is useful for drivers that subclass the colorop state.
  */
-static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
-				      struct drm_colorop *colorop)
+static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
+				     struct drm_colorop *colorop)
 {
 	u64 val;
 
 	colorop_state->colorop = colorop;
 	colorop_state->bypass = true;
@@ -537,11 +537,11 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
  */
 static void __drm_colorop_reset(struct drm_colorop *colorop,
 				struct drm_colorop_state *colorop_state)
 {
 	if (colorop_state)
-		__drm_colorop_state_reset(colorop_state, colorop);
+		__drm_colorop_state_init(colorop_state, colorop);
 
 	colorop->state = colorop_state;
 }
 
 void drm_colorop_reset(struct drm_colorop *colorop)

-- 
2.53.0

