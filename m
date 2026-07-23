Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE323364044
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770535; cv=none; b=omCiV4LE0n2S5cxMVoAOqy7D/MB3NQWKn7m4SEbemTHpN5cTqVopOVYUFKEJX5++lcy3RXT52DGH0Kmh/YT1ytpGT2IiPTG3IAbl/B6QDpNhXzlnI/F2q+ku6dy7dkXFwVzyzSaj+IkzENElDNefvNiXmcePr+nN7/KmTsLlejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770535; c=relaxed/simple;
	bh=hse6ZoBRDdkgueZEFZSp6DqlC7adzsHmGMK2OKfFL4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGAJasfDCq1Z8miuX/nDjbBGy2zRMpFLGvVkby9Hfy5UagI63q2u4P2L4qziLUZCQkC3Xc090aaA+mh6giLAfiJk0PViETdfUUX38DlQk7FJtmjmTp7pRnatn2mt0ynPBhZYBv9sIhXnjQVBMaV25wKdxup3/27Mx+sfb8YuVUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TYzLOWvi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TYzLOWvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770530;
	bh=hse6ZoBRDdkgueZEFZSp6DqlC7adzsHmGMK2OKfFL4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TYzLOWviL9pa0KhzNYiVr0m0TPKlqorlneP2coDDfoXCLH8Xh2S2pmV0Rjim01RmR
	 u6cExqeIQhPAPCZKHmM8HYPYgCLXwinhxpFFjXCLrOeNivHWK1CiuUbPLhcrKmaynW
	 /KKIQe7g29JTLbMWktiMb4b9xYnrOVlfulJESfq7ALqxMFMdn6Du9W3diOgSChGkYa
	 UcbH5IZHQTbcgvN/OZkV++dUDA2ws//3AI+I/xG8MM+DKYZPXPkr4YKfhMltXMQ9es
	 qr9tcd373vNEITpo/vM/IfP8FQq08cGzK/mRAAeip9aeP53ulvOYA47xDZo7Ey9nRy
	 g0Gxqw4V3vMXA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3E2B17E3686;
	Thu, 23 Jul 2026 03:35:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:30 +0300
Subject: [PATCH v9 41/61] drm/bridge: inno-hdmi: Advertise HDMI 1.2
 capabilities
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-41-4fb12ea22ac9@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

Since inno_hdmi_phy_config.pixelclock does not exceed 165 MHz for any of
the chip variants handled by the driver, advertise HDMI 1.2 as the
supported version.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index dd35f5a875d3..ea3447d4f285 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -1119,6 +1119,7 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Inno";
 	hdmi->bridge.product = "Inno HDMI";
+	hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_2;
 
 	hdmi->bridge.ddc = inno_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.55.0

