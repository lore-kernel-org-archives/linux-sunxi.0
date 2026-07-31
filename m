Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC444BCB8
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514774; cv=none; b=jLlAtT+xqTt6tkTxQpXBpFDzVZmQ5IzuW46RXv7Lglbc0HpZBQ3CWnBRQvas7ppNa0PX4a46DSyZoJbBRkA+tGzVckWqS5sUvzatfKK2mbJTrDS3iMU1oy3zy00JaelfsUhA+7KizNpiwVPuE1R+8BuDi0VNxne+Z0S07r4XJdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514774; c=relaxed/simple;
	bh=QfP7xZFECc7vFiekq/+2Q7b3eH9Ms2hU2uC26kblPso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJtKGxzslNuqGpnWcJ40e3qjIhmsdqiuM5xU/mipJKsMZ5pYk5PO5u5rLPtEtn9Zflbb1/P0jRlBx0Xtmu7HmWfkPpM+/caSJwqwCtKrVFaLUiolZKQUyDtPSJcxFchgvhpF7vZUJMV/UsAvTCw7o7oj+tBNzuTudGz6vnjhag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CrkXIV4p; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CrkXIV4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514764;
	bh=QfP7xZFECc7vFiekq/+2Q7b3eH9Ms2hU2uC26kblPso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CrkXIV4pSbcS2j13yhmqRBSGHJg+x2dBkRF3JBOoE5pT/GVqog8GEe2lCoWfdoup0
	 71WFGnTTc/xb+Ht/5XfQBWs+2I2Ngpid9U+nbh8HFky+OeP6/e6y/eHt+6D9rl+mga
	 Itjcjl9fTk+WmE8+ok3H3ut44M2ZqFQD2KRuFP5HPe3fpojoNrqNs2Le4ReLQXDXG1
	 S3eS6Vzl8HfM81mumZWNCX2doC3mLmV+vgJGJLtvFPsdarjmZnPcpvyRHQxNe/gBB6
	 mkmmmv3nFHUUMb36/0NufYnQg6lcNaNiw7sTOwrjX3DgUywFpwxHmXP5AoDzvvhk5G
	 zBMBBfoL3iaEg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A70117E092F;
	Fri, 31 Jul 2026 18:19:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:20 +0300
Subject: [PATCH v10 13/69] drm/bridge: Fix unlocked list access in
 drm_bridge_attach()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-13-294364b2cf15@collabora.com>
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

drm_bridge_attach() inspects bridge->list to warn about bridges being
attached without a previous drm_bridge_add() call, but it does so
without holding bridge_lock.

The list head can be concurrently written by drm_bridge_add(),
drm_bridge_remove() and __drm_bridge_free() while they operate on
neighbouring entries of bridge_list or bridge_lingering_list, all of
them under bridge_lock.  Hence the unlocked read is a data race, even
though it is unlikely to change the outcome of list_empty() in practice.

Perform the check with bridge_lock held.

Fixes: 76f1a9711b83 ("drm/bridge: add warning for bridges attached without being added")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 8b8f71c3ccff..9a658decad2a 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -600,8 +600,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (!bridge->container)
 		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()\n");
 
-	if (list_empty(&bridge->list))
-		DRM_WARN("Missing drm_bridge_add() before attach\n");
+	scoped_guard(mutex, &bridge_lock) {
+		if (list_empty(&bridge->list))
+			DRM_WARN("Missing drm_bridge_add() before attach\n");
+	}
 
 	drm_bridge_get(bridge);
 

-- 
2.55.0

