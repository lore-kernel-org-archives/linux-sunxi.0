Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234EB4503E1
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514774; cv=none; b=aB7s0xa7rrdnhLJ2weLf1yaJh0dgfZ/SzAC2ASVMC01bSvsFBzjptlZUUnAyxxIVXVHN3gzjPistAvGP6aPD1HE6eiCM7659yRVBU2ls1Zh7SKkwCSdtM7jIExZqBlv3ljhaTlxdth3CmS/+i5tXKB7RjC9SMofPaFnaR+IuEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514774; c=relaxed/simple;
	bh=GINu5YN6iFHFeKdJNvWRwz8yrY1Ka6Rvl6f76x+SBEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejXwCGEa4L3So6aeP+c+gM84Z4t9mfg1Fh+SV0bO/z3DJU+6Y3mxE0ToU1f/kcGaOgJM0+z/KfgrxHN6dBT5K6om1AmsB4/bvpw5MmGGe+sPEuXYinQyCyxciqb98gy3YalhmcbAvgT2UP4/5Lz134o60+woXWWlv+ae2XdcfPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AsM8rhD/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AsM8rhD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514765;
	bh=GINu5YN6iFHFeKdJNvWRwz8yrY1Ka6Rvl6f76x+SBEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AsM8rhD/IHVyq07M9VimKEE+JfV/MLDKpd73PfP1+1HDZRVkGBp8UWUBS1BlyYcLH
	 Lyu79H5BaRIvPJJ248QOZ3Jhq98T7oo6g2o+zqMRhnfzna5Q9XOPQsRUGa7dTzj6lZ
	 qlu2kuhZBCiDZ43SQ6rd/fz8c4RHhysWKDWCN0a94XNKgk/vVFtBqFO7wwkmOWplu3
	 Gdu/0uaeqRIwxz+Nnd5HwT/VL5gnIoD2SriEbElXR5dLpI8VrS3cpPI9yuunJLdPzV
	 9K5h5Lj2yK4LLpTa7MWmJywQ31zrYdcD098dY/EkbTiSqRSpj88mbTlrb1LyDExqQN
	 I+5L2Jh8aqEEQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D650B17E0934;
	Fri, 31 Jul 2026 18:19:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:21 +0300
Subject: [PATCH v10 14/69] drm/bridge: Remove redundant error check in
 drm_bridge_helper_reset_crtc()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-14-294364b2cf15@collabora.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2

Remove the no-op error check after drm_atomic_helper_reset_crtc() since
the goto target is the immediately following label and the return value
is already propagated correctly without it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_helper.c b/drivers/gpu/drm/drm_bridge_helper.c
index 420f29cf3e54..0a3c8fee66b3 100644
--- a/drivers/gpu/drm/drm_bridge_helper.c
+++ b/drivers/gpu/drm/drm_bridge_helper.c
@@ -50,8 +50,6 @@ int drm_bridge_helper_reset_crtc(struct drm_bridge *bridge,
 
 	crtc = connector->state->crtc;
 	ret = drm_atomic_helper_reset_crtc(crtc, ctx);
-	if (ret)
-		goto out;
 
 out:
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);

-- 
2.55.0

