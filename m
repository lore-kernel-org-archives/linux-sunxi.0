Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBC11E515;
	Fri, 24 Apr 2026 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025950; cv=none; b=BhmkEkzsOc9q0jyhYEMUO/aInOQf1sZTLqUmF1XypHKX2tXoU25JVKhFSAfsIEHufxVSt63bmqLagctH4Tszun60t7dDHq/CHnrq70dX41oLaPi0pPHO9dsupj57ORKNu9nthuvfQlTWGt4roV+yoR3J2pLxnvaU7paVtRKZvY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025950; c=relaxed/simple;
	bh=XAgmvRaLUMDtneZLQ+nRSwQ09O7j2t1sw6KuyUmkyW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tv5foY9BHi1p9L4aN5aP1Es7NwXR95dZGy1UoE4q/5ai+dnYHiEoZa5vkjwXJMOOcPMGMM9YSX3DZggn8FxFwgcjwkOt2tRqXm2MZPnVwVCVNVaYUmJ2l649WMthehei0Yrs5n2n+EIvywfbKnYp/hBnjyxIBB6+FsJBUAJkyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yxv8iu9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yxv8iu9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EDDC2BCC4;
	Fri, 24 Apr 2026 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025950;
	bh=XAgmvRaLUMDtneZLQ+nRSwQ09O7j2t1sw6KuyUmkyW4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yxv8iu9p5oca1HpS1ke2aUuWLynHWauOJPv7fhkNJu8atoJVq+sr0oJ8mzcmEd8cH
	 4MRIFx08lu1pPnXgUPlzzURn5rl6Bp1I/pcL7SS5+tlCsCQCuVeYv730AsRREU111/
	 GFwM6JSOO8N2WNYcjzj9cCG6FzRLuGiSpyrk4Ad+dw5QmrwKEnFA3P5vwifZaUsdwR
	 e2JQ3OeBsSQiICWG1py38LLHE44mduTtqgy9lPSpQLXKWLacvJHJ9Lc1KFhKxHa7K7
	 I/IITi9rPv3AEzOFTKjkXparalaihY/EwSDk+1DdxDUSSHaQM3+erQ5WFhX3ezSnuz
	 KUSJgEHCMSGQA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:43 +0200
Subject: [PATCH v3 03/20] drm/atomic: Drop drm_private_obj.state assignment
 from create_state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-3-8b68d9db0d8b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XAgmvRaLUMDtneZLQ+nRSwQ09O7j2t1sw6KuyUmkyW4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnTub5Y1EX5zpXbVpR+1EbT7GPtt2bq/ZjTtPRKYqa
 O91D2LrmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABMpdGGs4TrjI6iivfnix5/s
 e+/FyHxXkhbJU9s9S/zRmrojrlGdYq+PhkrOLFx34Wfq+2J1JptOxoaJtrvlyrY8zJn9Nq0uYIv
 +iaBlLuLR7Ss3NL6fmRtyIOq2OsezKfdeKN+5wiwY8p//DzsA
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
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 76746ad4a1bb..875149494b00 100644
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
2.53.0

