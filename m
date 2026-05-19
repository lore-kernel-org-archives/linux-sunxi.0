Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44103F6C5F;
	Tue, 19 May 2026 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181375; cv=none; b=L42APVkk4umDkwNSQ5LjKLLO3Gmd/IQof9VSsSYzDTp5J3hmlh49eFDDRzjZ96sSQ+6l9JvlAHq+YQXIwhh1grgdNxEFeDSPr6hGUeno96RMydfL2pqIeMLZHJG6rmjol+1NXI6GofBCaf+2j/un7d/LUbB/+gcXYUdRQr5St6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181375; c=relaxed/simple;
	bh=FGCqhfXKq37ObBfvHzfst4BF+DfJNKqHOHC/ClHMucs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGxxAqPyynqIS25mrjjhkZMycHB0k0+z6Deiu86dWSnYz+lSKOLSbAyIzYSPQweCTBWi4pD5nFRZVKOr//nuDV5EwEOP689cWdHMan1pkpiTjLcsGx56z1GEeSqLJj+b8jGiu01wMOTVM5SR/bPyh/XCckCInyTkryu5GdXdTyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pt4hyhFC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pt4hyhFC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F006DC2BCB3;
	Tue, 19 May 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181375;
	bh=FGCqhfXKq37ObBfvHzfst4BF+DfJNKqHOHC/ClHMucs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pt4hyhFCmuMPM8t+lDlWEqmLWpnFkLFbCTxBc+OHIRaS4pzcyqx4DP5JYAvnLcwtN
	 8ua7J7382xLSuk2Ellzw7rdjmPoX8Y0GLbKaROzM30DoDsFugVQlrTuvGv1+ec0XyE
	 d5XjQt7I7tOqiAFH/krk4ADz8A3l0kjIK3CWSdrNw6PEHJCtBp3qWmA1CkSyECxFKM
	 tXWrzJNdaKKmJCiVfsTKSWp+vEgbe6WQkrhaeDQY4Lpx5XEEboVeWPPX+QB9ZUxfZN
	 CwlaGyvcoZQi4vPORqpbRz2C2n7+eqqDE1C7v12bTZBNEvWulvzhhztg1oR2lpPhSQ
	 Dfpv9Xydm+gQA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:59 +0200
Subject: [PATCH v5 17/19] drm/drv: Switch skeleton to
 drm_mode_config_create_initial_state()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-17-388b03321e38@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FGCqhfXKq37ObBfvHzfst4BF+DfJNKqHOHC/ClHMucs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk86gwfgo5K5ugkPGTbfU8l2OX37KQfxdWFjzS2q5kzr
 Q1fGyDVMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyYQdjrfzXy8VfmFv9ryyT
 8Dv+KD7G3KvFUrPEXN0584LRl9lmaR9eMul9NeH7/MjrulGKU9wlxoaFz/M/VP05Jxx9ZfIHTs3
 taz9P8ul3lpA+w6RQmX9W5a2cS0GqrJv85at2J8yXsB/l5AQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The driver skeleton currently recommends calling
drm_mode_config_reset() at probe time to create the initial state.

Now that drm_mode_config_create_initial_state() exists to handle
initial state allocation without hardware side effects, update the
skeleton to recommend it instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 985c283cf59f..f537556b06a8 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -340,11 +340,13 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		// Further setup, display pipeline etc
  *
  *		platform_set_drvdata(pdev, drm);
  *
- *		drm_mode_config_reset(drm);
+ *		ret = drm_mode_config_create_initial_state(drm);
+ *		if (ret)
+ *			return ret;
  *
  *		ret = drm_dev_register(drm);
  *		if (ret)
  *			return ret;
  *

-- 
2.54.0

