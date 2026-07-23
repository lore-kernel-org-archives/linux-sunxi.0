Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D51353A90
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770529; cv=none; b=mWwho02zB+XmzZolEUTqgkbjlxcf5y+1mSuH4ixQOE+9utBvzn0PSsxz8IOtpa8TA8NyJqHrAO3x7WNs2U9Gk2OTzlWni2NroZuPQQWWy0+/DFYdY1Y3ezaFBvUpLdcOlLYqEpTR2c2KVUAbr5zg55LYhXDp4j7fleCbMaH0sJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770529; c=relaxed/simple;
	bh=2xeUyroivcy0FWJ5doDXcW6SCatzUXnv0VtZOEz+FLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2zlB0OEIPL2lHRfHK1//s6icLmRvlllwpeq4l70T+CieIJbeaudnqFtGBNqbhQlATdC2vA/EFvpPU/Yfhj4X6EOTQX2aZxp20XHVwkA64uGqy18G8W5jp9gJtSkWqHfBAFVq+DiLRZ7mghvCxYeHsRyxf4M9M+IY7DCTZlMduI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oqPddgOo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oqPddgOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770525;
	bh=2xeUyroivcy0FWJ5doDXcW6SCatzUXnv0VtZOEz+FLk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oqPddgOoMGHYJDLcfTZZlkNbmpgjVM1cOW91WHHRd/4DWKK3EFIOVPNjy3QVl5F9a
	 bv1qz4YhR05Eit7bT+iv/O2lD0odITuhTID6Ep0tE3n0OY1Jq5bLXDZWX8QTYTqYbi
	 GvDicAcHtd5UkwhHrxZmT8mWWAp64wX0mye01gnVpcUSc3skrKHhcvtiRyud3RXdhJ
	 RXUeOVDSBGMFARWcx7tqLCXZ0S3eyIU5fBDznowvo+slj1DaPeOEBZwQpD1vZHCwUg
	 DymbMgq0D2AYSM/gw9l6efMY61mJpc78o/A1jbo2ruwiy6COLyKQe7629AYM9gTbsB
	 lWZlVl+zXA9Ww==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 21BA217E0857;
	Thu, 23 Jul 2026 03:35:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:22 +0300
Subject: [PATCH v9 33/61] drm/bridge: dw-hdmi-qp: Drop unused .setup_hpd()
 phy op
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-33-4fb12ea22ac9@collabora.com>
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

With the transition to .{enable|disable}_hpd() phy ops complete in both
the bridge and platform drivers, .setup_hpd() has no remaining callers.
Drop it.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 ---
 include/drm/bridge/dw_hdmi_qp.h              | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index be1bd765cb03..8c1f7487efa9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1294,9 +1294,6 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp *hdmi)
 	/* Clear DONE and ERROR interrupts */
 	dw_hdmi_qp_write(hdmi, I2CM_OP_DONE_CLEAR | I2CM_NACK_RCVD_CLEAR,
 			 MAINUNIT_1_INT_CLEAR);
-
-	if (hdmi->phy.ops->setup_hpd)
-		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
 }
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index b4fb1c578a5b..ad33f9cafdeb 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -16,7 +16,6 @@ struct dw_hdmi_qp_phy_ops {
 	int (*init)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*disable)(struct dw_hdmi_qp *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi_qp *hdmi, void *data);
-	void (*setup_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*enable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*disable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 };

-- 
2.55.0

