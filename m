Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB1B427A10;
	Tue, 19 May 2026 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181341; cv=none; b=KDPek+iXIbK7YpQp0AYJWuFviNwK06XoF/8XW0iI0cFP+8wDW1fn93aAboJfu7RB2u6qZ9j1xSmzt+/jMPIuzvbg8nhITRdFC/okcAJjvNPL2V5zeQMaWuXsuEMKGagmOr+mXkXqcLv8Wi4A/q3F7SxRjzpi0I6a81Yf26VQIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181341; c=relaxed/simple;
	bh=OOzvE+PDY+lMMJPx9rpX9siTCSFetWvZ9fVlq7uKBtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6JKOo1ziOLFe0GNMID6CHGpOhjWqoPLmEdQyFGaxIB7O1X7kwQJoBox1mlRlbZkMQVWbO22zgC3Oz0NZf2GSeoT+eba7tCaimSzD/IrvSjT0Fep1td80om3gJV/DmDgYvZhYl+l0X4PQRh5esBa0k12ajvjs/SUGIVnj+qbJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4cGV95U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4cGV95U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6442CC2BCF5;
	Tue, 19 May 2026 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181340;
	bh=OOzvE+PDY+lMMJPx9rpX9siTCSFetWvZ9fVlq7uKBtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y4cGV95UPDj7Y9KGJgAxd9rqvaQulKEX/+tIhrOy2Q+fcuwJ4pihVzVLN3JYmfqxQ
	 r6BZEBLbm8vw6LspNUuEQ2Ock+xGPP8EhmGMikgOaUN6N5J2GLjXTCbI3eSY8JiV+K
	 r7BbGSupl128A8bN5Fc32DykYtEWwohNCnIhiAAJx2pH3a/iGsu6nuumLjimtiSKSu
	 n/xPW+u4RoDJLqT5IAjj495Ez3tN8QkRH7hp/s0Oikn/I7BC7dC9QhSZqrjBNJU0PX
	 Z/eZE+phuV+0HQDndlrwfZItYxHXiGQaD/rxjDElnK+fDqvLrzirSX+eh4zuP6++sj
	 tesI/alMZ21BA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:47 +0200
Subject: [PATCH v5 05/19] drm/mode-config: Document drm_private_obj
 exclusion from drm_mode_config_reset()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-5-388b03321e38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=mripard@kernel.org;
 h=from:subject:message-id; bh=OOzvE+PDY+lMMJPx9rpX9siTCSFetWvZ9fVlq7uKBtk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8ar/L/PIuBqXVas85f/zTBoPfj0LMhH7POHwq4cMS7
 rNVjJaKHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAia1Yw1odIhv8yY+yaUvL6
 Y/G6Wpl3r1zO/WCaf3D/7Lurt2VsK1wysUi+wvPEJYfa9Y9bnQ3TfjLWVwnvKv097YfDu8Nbs/k
 5pZ1TmyRSv5559Xrlx628SdNq2iYrRz6rCZNpczsRIXb7oaYGAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() does not reset drm_private_states by design.

This is especially significant for the DP MST and tunneling code that
expect to be preserved across a suspend/resume cycle, where
drm_mode_config_reset() is also used.

Document this expectation.

Link: https://lore.kernel.org/dri-devel/aOaQLx-7EpsHRwkH@ideak-desk/
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 66f7dc37b597..c33382a38191 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -187,10 +187,14 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
  * callback. Drivers can use this in e.g. their driver load or resume code to
  * reset hardware and software state.
+ *
+ * Note that &drm_private_obj structures are expected to be stable across
+ * suspend/resume cycles, and drm_mode_config_reset() does not affect these
+ * structures.
  */
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_colorop *colorop;

-- 
2.54.0

