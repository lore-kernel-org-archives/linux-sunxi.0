Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71AE46AA66
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514815; cv=none; b=bWn3y2VVw3dfnFocCpy8CWWuuFjSHKN+uKw4zFOzmno4TvsraY2VuCa/YoKwF/UJkZj7P/5Ck12Y40n/i5jZm5eVftl4HavSWAYVNfgOUVQdX74pqTY/UMxiNRrdduNEabpvEININvv6uOAozrFKBcoighHBgY7k7JbLoPFcJPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514815; c=relaxed/simple;
	bh=Nxh58kkTCJhDJZ7LOkXxKPsnDbbAawY8MD7ZCqqJ5bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnejdCJ3nqL2W/wEp0p12lrNofz17MsYE59sK9y63JMR9cWomfhvNiI77Hsiv7tbB73XOIMEdjQ9qmwnTxljhBTn6wxNG1zlT/EuhBs9y32OqR0Il8AcIDRwYUHYewE0FxBg5V/vvdxZBEk144xuxyEJgn9JpdJ0wOgQqPtF08Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KpewS9PA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KpewS9PA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514793;
	bh=Nxh58kkTCJhDJZ7LOkXxKPsnDbbAawY8MD7ZCqqJ5bs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KpewS9PA1BDaDp0B//q/gO+9yphcABEgsq9KIxwt/mjHZ+3nObMDEbeyjCRp4k9pp
	 7TNs6AhYJoyXwy9v1Wji1tb3FoTTJt8FqsrP8oo18um45n5gzB67F2DNUVc58MxGzM
	 ivtmVXnEwEHqebl2ge/J7XLYI64BuUPAi60OqpxbgS/rWt/6jEnntRQm1f3B7xsKo+
	 nTNJRG7WuDXCb38b5NL4caiHrVLYlj93yZc40CbFskxARjhuAljeyQTG5JBAUE2UqZ
	 YDMmtW8z8Ek0JvYYSezDCHqbBLviOXqchG+/RfpV6co1nZKqrdjY3UJ3P79evuGYdM
	 NDWy/xPTO4gNg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3431217E08F7;
	Fri, 31 Jul 2026 18:19:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:20:01 +0300
Subject: [PATCH v10 54/69] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4
 capabilities
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-54-294364b2cf15@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

The RK3066 HDMI TX supports HDMI 1.4a, as described in commit
f84d3d37b7fb ("drm: rockchip: introduce rk3066 hdmi").  However, the
driver does not currently enforce a maximum TMDS character rate, it only
filters non-CEA modes and excludes VIC 1 (640x480) via the .mode_valid
callback.

Advertise HDMI 1.4 support for now so that modes exceeding the 340 MHz
TMDS limit are rejected by the core.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index f28d6a883e09..f748700b0ba6 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -14,6 +14,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include <linux/clk.h>
+#include <linux/hdmi.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -712,6 +713,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_4;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.55.0

