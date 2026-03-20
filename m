Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75473D6CCC;
	Fri, 20 Mar 2026 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024064; cv=none; b=gn8rwTt+qSA8Zge9mru7WJypXleWXQ/3c02Dohzs26Yv4vGD1G2Vv0QBOcAP301iX3IASAFX1Du3R8RwfhIshoJLzB9+QDBTvJO047M99dC/aPwtDFK0i7TEpemLbCXoVPKUlPgisEyIE1RsX6YPhygk+I0jFJ1EVQajpeKfICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024064; c=relaxed/simple;
	bh=wmAxCcdTkxlbN84+RtEwdgkpAvIMXguvvyonVXL/Njc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bp+boWknGFH2I8QHMA0a6iN0B+qES3yHQL91c5H2UvSymUGHbOVKCwxjY24EVloj+tKrsk5woR0hye/S6lVSl35JvHvdLpK4WWknT8IHrDFUJjOMxS+VJlyqid/TOMCk2xZUaK0/bfGZ3W2JRWZR0yef3zTUbPU+60AmbdcOk8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR0Mh/pu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR0Mh/pu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D8DC4CEF7;
	Fri, 20 Mar 2026 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024064;
	bh=wmAxCcdTkxlbN84+RtEwdgkpAvIMXguvvyonVXL/Njc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jR0Mh/puC65e/v0ntb6R6WiiwEWxRTUgn1ArGBfT0h4ySeEdYZf3+5e3/J+8QB0GP
	 XmEpgypJtNUiVu5DS8cobgjVr+Z1bgW9QWuV6zF5BUK544gs/p3l9vqyMe6y1EB5JJ
	 F2i4D2n1P33Qypgg/IKHmXAXkCpiz4U1M+wYIhK0zDoDubMixrZODL74rBRjNaNBKW
	 T40/hkUbNY4nWO2GaOpOjglXoiYstPq18b/WTXA/ysZI5hg7rrEr8sKcw/PBeh5xuH
	 aSW+4BmrNWo1v/LSbrZSxY+FWCMSD7Jgq2iMmEvsJ2nBGyLjsYRVlmi1KI1gEVFzpg
	 SHsr/GMuVEiMw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:13 +0100
Subject: [PATCH v2 06/20] drm/atomic-state-helper: Fix
 __drm_atomic_helper_plane_reset() doc typo
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-6-c63f1134e76c@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wmAxCcdTkxlbN84+RtEwdgkpAvIMXguvvyonVXL/Njc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S9M8LjcfcYg2ZBQtCeP6+YvzafG2VTXMer6yS+Ju+
 Aafe3S1YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExEU4SxvjrgLcPO2wKXQ77H
 7nze/VfN1WaVXKa96LtLmlFl/B2Bs1z3iU617brt0KydUHFT3UyXsYb7d+YfzujYE1rFJm9F387
 TuVvSupMpblGccsMiz0WT09VUV7p3WjZvXvs8YxvzQ++7bgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A typo has slipped through in the __drm_atomic_helper_plane_reset()
documentation, probably due to copy and paste. It will not assign
drm_crtc state pointer, but rather the drm_plane's.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 875149494b00e1eb7481e87d7d7038103b72b7e3..e1f3d05ad3470154a6be01423979a4deb8617441 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -303,11 +303,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
  * __drm_atomic_helper_plane_reset - reset state on plane
  * @plane: drm plane
  * @plane_state: plane state to assign
  *
  * Initializes the newly allocated @plane_state and assigns it to
- * the &drm_crtc->state pointer of @plane, usually required when
+ * the &drm_plane->state pointer of @plane, usually required when
  * initializing the drivers or when called from the &drm_plane_funcs.reset
  * hook.
  *
  * This is useful for drivers that subclass the plane state.
  */

-- 
2.53.0

