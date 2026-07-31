Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F878451998
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514780; cv=none; b=JHCG9pt1BqoVDgduwQjqLe1aive7fTWnBsEyRQaoDksh3Z0PECBaM8cV/H0Juq2LYeyv4FtdP3WKfDpBZDvTKNoqxYXDuJPFXwgGAbeSOTK3MX6mTR+AORSPHrSDmSoW75p24xsltauyg/8OnjsTds/4A1JiOELPGpWxtMCPnao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514780; c=relaxed/simple;
	bh=/yiHYpv6JDAP8TqmgFqNkriKXPlZVLMG1+AZdUe8aaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SAXyroLh6q9WJjZrudvamNLNlyncE65wMh+FjyTd9yqmWL8PihGaHw6mOaL3bvzdDWTOnzEHh7LNWZrUiyJQ/U7vOM2hh6ASt2PD3rSXVZZcmuJD8DOPM0bnqYsjTFFulegPG9/QxCHOHyj+litlOfZ8/fHiKkxW3KVz7ugDybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nx3zp4QP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nx3zp4QP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514769;
	bh=/yiHYpv6JDAP8TqmgFqNkriKXPlZVLMG1+AZdUe8aaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nx3zp4QP1XWq1RhdyKxkJGxDjKSAnScsdyLyY/Ejw8Maix9gxRsKZmnBh48DMaOk8
	 Dc8B/0q2srvMM6Vb9cuztdMcU0TndG/ZwvQrn3f7BabQcibqis3G0Z5OFrTgGnHEDp
	 6g7rAhRyZNC7Hn3BSpy9O50UHugX5cNaCSHEMn3q8m2Ema5cSwb3z/M8aW47RKvGJD
	 z926IbktF3gvsVSniXa5qoJLtyHVqYc73Bu0yP50EN4pPxa+4xvCnGm3KoBa0/iBxw
	 FviX8yaiIpnynaWY+ncL+ofGGpKjGi0cC64I2V8wg7+9f8uVXAWGz9LSxL7NkVtCxE
	 yEOaibzjaAsMg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A77117E0943;
	Fri, 31 Jul 2026 18:19:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:27 +0300
Subject: [PATCH v10 20/69] drm/display: hdmi-state-helper: Add source TMDS
 rate validation
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-20-294364b2cf15@collabora.com>
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
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2

Validate the computed TMDS character rate against
connector->hdmi.max_tmds_char_rate, when provided by the driver/source.

This gives HDMI connectors common support for rejecting modes whose TMDS
character rate exceeds the source supported limit, while still allowing
drivers with custom validation requirements to implement their own
tmds_char_rate_valid() callback.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ce17eeefc2da..92be6278ea44 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -560,6 +560,10 @@ hdmi_clock_valid(const struct drm_connector *connector,
 	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
 		return MODE_CLOCK_HIGH;
 
+	if (connector->hdmi.max_tmds_char_rate &&
+	    clock > connector->hdmi.max_tmds_char_rate)
+		return MODE_CLOCK_HIGH;
+
 	if (funcs && funcs->tmds_char_rate_valid) {
 		enum drm_mode_status status;
 

-- 
2.55.0

