Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4712305677
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770516; cv=none; b=Y37IRxht2qVEOZCoSr/L06vTbMDP09dJ8yRgPaCD4+O4bxPRQ8OHLhOetEto7agK6YaOocrf5bvxGSBpiYlFDzDnI7qhkVI+KRLhnQ9noWO4ijoqe9JfEMuJ+4TzqAByOkWXAxKtCU0RUa/YErE54lJJHbelvt2iZWFq7b8NAK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770516; c=relaxed/simple;
	bh=4qfctTxWdvGpdKCYBW0HrvVdkpvsSeML8SODR4sseog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sau3gyl+OksO34btWf8wbvMeqrfgxYdWNw2zXo23QSoApEcIY7yl8E1wILjp+yHOjGa8YavYO0sG/dSWjkl/dd9rQkWJ1lXuQoZ87BImP9cCZuW/sRjSCyWpBcaZ7YkHaUZo8UFFN45l2EGKJdJILfv+KXaTp/kYaR/AVwimNso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PHsSOtCJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PHsSOtCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770509;
	bh=4qfctTxWdvGpdKCYBW0HrvVdkpvsSeML8SODR4sseog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PHsSOtCJjeV+Bjsip7ggBI0mUCOTshL9Izgpq/MYNpawXllth0q9NL+hgTEWocW3W
	 F6qfCNuxeO9w+Omzqaax9RKSjiQVYgCoxVBV/WyOxPSzB/FST1AHMVPJ1Cv0ujOs/D
	 IO6NTYnaZcykXmwQbyj9nUtlQxaR2Cj4yGP2WhPk+0Kb8T1mQn5kIE4VFungf7APN5
	 yKHWTjMt5AMkrQnqFd8lHLkgNmPvyBdyhyaVDwelA4A/4B/1s9ZA39Q41myUdrTd5O
	 shiTbl314RAWOA2gut9B5pIUMNteFSjFGEUDBRmZgktCmW/tLJ+f5T2RheEN0hOeDA
	 xqelZ4bpZCQRg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3B4D17E023C;
	Thu, 23 Jul 2026 03:35:09 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:00 +0300
Subject: [PATCH v9 11/61] drm/bridge: Add bridge ops for source-side HDMI
 2.0 scrambling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-11-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
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
index 727eeb94119a..348ddbe41dec 100644
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

