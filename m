Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3074239E7F
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514783; cv=none; b=teS8FRrJ1uJGxn9M0TKSvruhNU1i50iLgwTtwEh06NNDIKQRZdZW5WztKiiAAlFBiI6bqpoN2Q2taQLa/QOoQKmRkZFlEFx7AWuqfgIGTB2bweJkktDp2piG+xLRvhklu03X65OjYNaZT5m50+qt9DdHC4EanOIJCrFp7gRFENA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514783; c=relaxed/simple;
	bh=q5EwAZk5tThfOFfPU3cHVXQvyZ71nTre7ie20f65OJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9gIF9WwqKy1Gmh82loWf0dU5ddtPmIOiWjiv6T13UHHQiyt6zwcuMy5XRoDYMSFq9MV0y4/pIbZGl+Yf7P6xlmyP1iAMokTZd6QFnXsySde/rOxTW/ZwJxhoiUaSNmeo2pOUk7KMmcYJq3RGtOEEaqmCAJnt2Ezaq3Xmnblcmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DdIo5jxi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DdIo5jxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514765;
	bh=q5EwAZk5tThfOFfPU3cHVXQvyZ71nTre7ie20f65OJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DdIo5jxi023NLYpqtZRc+FgL4egNHK4YDshSat0ZkcnE8BZMWXS5kz5DIFKNCMkRM
	 wETpn+b+RqqvdMgvrM8bNWmVamSBGK6og61qWcM41uUEeiULeEh7wGm4B1XVVBwkkn
	 smxJNatp+2kU5E7CscZ/bdYjNXJT6FYY3CYdLzwtQcPgmj3ahJzUeKiqbfqKPysBgs
	 JooT8xb05zqhGXsvVE0sbat169whW1r7+ZAS01ygfxTO6Cyx8HK3iodjjkIMQPV/+i
	 B8Dn3h80B3MzMXjiCjcrlnRiuYG0fpXOiL7CgJwaghx/UhYGw9XxSjeWiuFSkpozUt
	 vcFHxhLyjSiHw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F15017E0936;
	Fri, 31 Jul 2026 18:19:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:22 +0300
Subject: [PATCH v10 15/69] drm/bridge: Add bridge ops for source-side HDMI
 2.0 scrambling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-15-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Bridges advertising HDMI 2.0 must be able to enable and disable
source-side scrambling and the high TMDS clock ratio when the configured
mode exceeds 340 MHz.

Add .hdmi_scrambler_{enable|disable}() callbacks covering the
source-side programming only; sink-side SCDC negotiation remains the job
of the HDMI connector helpers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/drm/drm_bridge.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 5a5a25995471..77b3ffe69230 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -561,6 +561,41 @@ struct drm_bridge_funcs {
 				     const struct drm_display_mode *mode,
 				     unsigned long long tmds_rate);
 
+	/**
+	 * @hdmi_scrambler_enable:
+	 *
+	 * Enable source-side scrambling and the high TMDS clock ratio for the
+	 * mode currently being applied.
+	 *
+	 * This only programs the source side. Sink-side SCDC configuration is
+	 * handled by the HDMI connector helpers.
+	 *
+	 * Mandatory for bridges that set the DRM_BRIDGE_OP_HDMI flag in their
+	 * &drm_bridge->ops and advertise HDMI_VERSION_2_0 or later via
+	 * &drm_bridge->supported_hdmi_ver; unused otherwise.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise.
+	 */
+	int (*hdmi_scrambler_enable)(struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_scrambler_disable:
+	 *
+	 * Disable source-side scrambling and the high TMDS clock ratio.
+	 *
+	 * This only programs the source side. Sink-side SCDC configuration is
+	 * handled by the HDMI connector helpers.
+	 *
+	 * Mandatory for bridges that set the DRM_BRIDGE_OP_HDMI flag in their
+	 * &drm_bridge->ops and advertise HDMI_VERSION_2_0 or later via
+	 * &drm_bridge->supported_hdmi_ver; unused otherwise.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise.
+	 */
+	int (*hdmi_scrambler_disable)(struct drm_bridge *bridge);
+
 	/**
 	 * @hdmi_clear_avi_infoframe:
 	 *

-- 
2.55.0

