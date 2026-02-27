Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375EF4219FB;
	Fri, 27 Feb 2026 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200833; cv=none; b=uqJBrGYYdnMmwW6tcIrcZzLYt2rJJHRbxyMWXswYjOCJ5PPjrecbUtryxBOnrxryKZrlC7Yf9WM3y9aI+JOrhV3uq2x4re4S0rv8VO2qb6/FiVXSgBfqkzwaCgN5e96MUhPBHnDx/1XHedJY1JWxr+3ZOBxhXo5Sy+M1YRAJwug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200833; c=relaxed/simple;
	bh=YVQvpGLZ5wA3mAnHs4fX4YhU+wAN3umweSoHZOXTpbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lc1rWDYVX0e3c2WG7GJJ9Kylb8yyKHdAXgOxr6A/qjRS0elZP2tYsih8SM1Kb8i+805J901dNxQtUM3DSOioizz04PEgGOn9hdggpxK0X/e6tkXc2NTNGATyzFYiKnF7EQ+z5uUbj6GQ1VOZ2pPY7BtK5SvlX0v42+foUOX5dNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITVEy0Ss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITVEy0Ss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD67C19425;
	Fri, 27 Feb 2026 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200832;
	bh=YVQvpGLZ5wA3mAnHs4fX4YhU+wAN3umweSoHZOXTpbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ITVEy0SsJyKTpL/ORMk5qp3PfBoxVUBtV25w4T22cWYan2OH4z/q4Tgr50VXYXT9/
	 Ek3xP6PGxTvjoPIl9nI9DVtMUo6B/vKQsTb9mKZrfxvnECP/HJdHNQp0vsWHNAM/bT
	 yymBEJhLN72Xk3TmoSjkaZecwpbzmFG+gc0oQuVm0sUiIV69ugT1z88PzVvBOSlSPC
	 GG6WLUwXD/Ua5CkiPeFFJQTfRmNQO6InMRj/pEnyxY5rlCVP2Qj4LMXJPvui6G4JL9
	 krNQ/UoGp9KkUgrl+lcSk1Ky9VW97Jd7Pf1ShbUvdsPm3a0H1Q3BPC0RJb3MBh6AZX
	 j5KXn2oRDp3uQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:57 +0100
Subject: [PATCH v2 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-13-8bd278e2af9d@kernel.org>
References: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
In-Reply-To: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YVQvpGLZ5wA3mAnHs4fX4YhU+wAN3umweSoHZOXTpbw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLF0d4TpkVErTi0775E/s0i1qd1/cazCl9WfTSUPjk6
 ftle0w4OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEVmgzNlz5rsXs79HSZzZT
 lX9FqJ5gIavqHp89EQvtdVVNPL6dO1/cL+nLuFN3ikvbpzvODEpXGeuzXm9+tm9qa2IVs4VneKC
 nd6bfZ8XWDufvXW/YyoNOMQXacf38WXZ51frsPR/47h6dIAYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
the new enum, we can get rid of those defines.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_connector.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 227f6190438679104f5336be088a73f4529c15fa..562f6da90facdacc98307c50177792e26f2dece6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -722,15 +722,10 @@ struct drm_display_info {
 	/**
 	 * @subpixel_order: Subpixel order of LCD panels.
 	 */
 	enum subpixel_order subpixel_order;
 
-#define DRM_COLOR_FORMAT_RGB444		(1 << DRM_OUTPUT_COLOR_FORMAT_RGB444)
-#define DRM_COLOR_FORMAT_YCBCR444	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR444)
-#define DRM_COLOR_FORMAT_YCBCR422	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
-#define DRM_COLOR_FORMAT_YCBCR420	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
-
 	/**
 	 * @panel_orientation: Read only connector property for built-in panels,
 	 * indicating the orientation of the panel vs the device's casing.
 	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
 	 * When not UNKNOWN this gets used by the drm_fb_helpers to rotate the

-- 
2.53.0

