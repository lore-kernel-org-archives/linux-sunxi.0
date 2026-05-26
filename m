Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CF3FFABB;
	Tue, 26 May 2026 16:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814016; cv=none; b=PeOR26yPmfcBASp5J8ouzEszwbQuKoTxSUbfhviGNbOFoZw93zCIFcK6r/IKnbtT1h3G4Sw1JuZ+r7kwvitD9lgbohtvyBhhs4MOvg3e3RaSfsCNza89IU/b95jFlKk9wx2XlUiqodoGMs3vmJyFCwtkXh8DzRceShBEd+4yvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814016; c=relaxed/simple;
	bh=3P/ZjAcLUex4P3oNpd5Z+isOTz0WG4WoSqpftWEhPh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzQbafJNIGJcgG7Rf8A1Ak9bIlYKe/KPCFzf8Xwbz8agQ521a6S+B1N+0E1tuC2tVVLa4+T8HeQf8kDREe0GcxchUxYmLZZdslXhR7WdUQW4/tIgXuAoh9ASWpfU4LqF0vrvtUHcjcI1+3lIclEWDMxbCc0L4nUaX2+A2bk9vAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDOdftTZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDOdftTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3495F1F000E9;
	Tue, 26 May 2026 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814008;
	bh=/cKXnzyrX5lutQ6EZwTcZY3rLV03+GZQqQU++EjnDVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HDOdftTZPvS7pfLNptRkGlwz1VGENy4v8sAEwT5F0F0rKQTmU/D2bqj9DXwVqN/Kb
	 GmQaWH9Oy0WDDMVIc+CWPcREa8dAjEU4E0cn154CkEDJQ73UmhDWugEPjUV8kOBugq
	 WbaigteXeh7UAYVhRCopE7TWEF8X0WDMDuu+1clw2qIH/+Oei6X4VaS9JfCp4Ykwys
	 /pzOShzCr23UW2IO9ACobV70WTI3bVVJ6GcH6xXPeeAUOqhnFOtnnoI6Wid3NveCpL
	 ggUuXEck0xu64Mq8nP6ZkoBCmSExg3AL0ZLzVubGBFpOwwnlqvDgND0r3iqk93vbDh
	 UdhNZLSlefd9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:20 +0200
Subject: [PATCH v6 08/19] drm/atomic-state-helper: Fix
 __drm_atomic_helper_plane_reset() doc typo
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-8-852346394200@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3P/ZjAcLUex4P3oNpd5Z+isOTz0WG4WoSqpftWEhPh8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi56I0ZTf4PJ+qtET3HceDSRs8g85M59nPzOl8xEVDV
 7xHOc6uYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzk81/GOv3z4b/tqky+h3a7
 nIia4PbQ/NG2OK9X+7SqPOMu/77lMevlRMvL6XOmnbXlNRMpqe/lZWxo9vM/vatYb59NlFVp6nr
 ezsv901ZtivxkZfJCKaEievHZQzY3W25H3ZdpuD6rJzOfuRcA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A typo has slipped through in the __drm_atomic_helper_plane_reset()
documentation, probably due to copy and paste. It will not assign
drm_crtc state pointer, but rather the drm_plane's.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index a82568d87e4f..c8ccf8be5074 100644
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
2.54.0

