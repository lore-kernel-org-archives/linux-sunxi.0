Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D330F92E
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770518; cv=none; b=hLFMfQU/Hz7V91li+r3vWdMipd0SM/q1F5HkuklMBlZ/sQGbEShG703J2pTCRXFmAFplPrVgy3tpR4224sL1oCspKg0RwP3p9tH5RCtp+quBD2fQU1VkHAk6WtS3wUX/E3aGc0pUgRhljHS1HCi8TlCkckv+Dxv5bO7MjmGsi44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770518; c=relaxed/simple;
	bh=vkmohHBcUSuwS6ZyFCylIMegc4f1JtD3hk0obLRPOFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqTcYVz/55o9OCyb6OIJf+/DBN6zt9SniOS8EqAJpuHj2vgTP1ReLbUw+pJU4TvoEHm6980w9txdDeQrOxTaxt3d++YLNW5Bpu3p3lfkNO+2NOSPe3PWtNwIDlkhRxGUb5Kx5jIdF6FxlnAZmoBBMNTzfee0UG4N2ZkNU8NYcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JZBYr7+C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JZBYr7+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770514;
	bh=vkmohHBcUSuwS6ZyFCylIMegc4f1JtD3hk0obLRPOFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JZBYr7+C00r1wL0e/BjKmWVhQ8Pi6A+THSPgl+/zp8kk99hx+dS4egmsocS1JLzS4
	 9qjuKCEvxTXcNCgMRgwBBOCc1tdf5UjPaQihvz6BsAraa4UMlCcH4OJivmIwngKz5Y
	 xSYGriIuRQNqHuI0eLim8jGkUI6enyKwjb6CUG2117DUbrUk/Lr5CQOGcrr7qQAOZP
	 D1/uhFonnoT6QKT8RfD/JJtZTQxvYs+k2nFpVBKQJN8x9hPoG+5AzhHAao7gAhreyj
	 aXyPLR4GXzbxCvtgRgtVb1WOID+vpfiDhYlwUJffI4+aZIJyAG87tvDAQx6rtDkeOm
	 37adn59VBGxyw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F81117E1064;
	Thu, 23 Jul 2026 03:35:14 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:07 +0300
Subject: [PATCH v9 18/61] drm/display: hdmi-state-helper: Set HDMI
 scrambling requirement
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-18-4fb12ea22ac9@collabora.com>
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
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2

Set drm_connector_hdmi_state.scrambler_needed when the computed TMDS
character rate exceeds the HDMI 1.3 maximum TMDS character rate.

HDMI 2.0 requires scrambling above 340 MHz.  Centralize that clock-based
requirement in the HDMI state helper so drivers do not need to open-code
the threshold check.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ad59318a3e85..d112c1555517 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -594,6 +594,9 @@ hdmi_compute_clock(const struct drm_connector *connector,
 
 	conn_state->hdmi.tmds_char_rate = clock;
 
+	/* TODO: also check drm_display_info.hdmi.scdc.scrambling.low_rates */
+	conn_state->hdmi.scrambler_needed = (clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+
 	return 0;
 }
 

-- 
2.55.0

