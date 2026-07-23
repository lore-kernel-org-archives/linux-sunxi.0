Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32930305662
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770513; cv=none; b=ccq1zzy6etOGhh1rH4ikz1gYLndD9TDqfh/H45fKhKlHfKrzvYEL2TjE+ZtpwXGINLT60Nj4cuvGfCGkxbiTZeE6L1lIE9XGG5zWta/eT4Ju202URVX9VjHIx24RT7SwoTa1VJFjBVQqlVYRCg4tp7XapYHU9imF4hhQUIcJU9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770513; c=relaxed/simple;
	bh=CJh8qr0reSiITiFxt1GFO/mGRX/C03+mDj0l5CF8lgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUQNme/R1Bc+Ot0VcSGabGBcK1SdEDNAxYA1S83uGY5t5NQGKY11iLsare0FwqdKeJZduFG25eYlgZbg8nmw4xgbBfhr6TZdmF33W4xhhHEOYp2ZRfEdevNzYy3rvypDtU+lZ49wdMEfGFLI0Lh1nDjLhq8ICYreVBjQi/IMC0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B8YcFDBj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B8YcFDBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770506;
	bh=CJh8qr0reSiITiFxt1GFO/mGRX/C03+mDj0l5CF8lgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B8YcFDBjKGf4ylEYcEjN7aOmxFQghEJGdgo3kIvKoXc5FMklKlOzPk9+o/cRsQ12B
	 295/oAR5d1xOusXLCVnZQzuYAQvr4jx7q63xVcjCW4GjZzC336nLo2F3DsAXISsKq5
	 jhf3pNFgf0AdiqiLXUnkXfFFhUaT921x2L4+1GyPAowaDFw4tDvIziwWmF1s84e92H
	 bcWRLjaNS4aWaA+0X92sOlLgqQKDg21Xgt9enpsr6haWpdaBM47ketfz3vNN2AkJeJ
	 rOUyT+vFLRt5g3p4P7xyJVMY67/bTDK5oq0YsCDSJpc2e3q72ueHt+4eoKBDtUDOwZ
	 wpXcChQHkTXuA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 37AC817E0F76;
	Thu, 23 Jul 2026 03:35:06 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:34:55 +0300
Subject: [PATCH v9 06/61] drm/display: scdc-helper: Add macro for
 connector-prefixed debug messages
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-6-4fb12ea22ac9@collabora.com>
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

Introduce the drm_scdc_dbg() wrapper over drm_dbg_kms() to help getting
rid of the boilerplate around prefixing the debug messages with the
connector information.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_scdc_helper.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index df878aad4a36..cb6632346aad 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -55,6 +55,10 @@
 
 #define SCDC_I2C_SLAVE_ADDRESS 0x54
 
+#define drm_scdc_dbg(connector, fmt, ...)					\
+	drm_dbg_kms((connector)->dev, "[CONNECTOR:%d:%s] " fmt,			\
+		    (connector)->base.id, (connector)->name, ##__VA_ARGS__)
+
 /**
  * drm_scdc_read - read a block of data from SCDC
  * @adapter: I2C controller
@@ -158,9 +162,7 @@ bool drm_scdc_get_scrambling_status(struct drm_connector *connector)
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_SCRAMBLER_STATUS, &status);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to read scrambling status: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to read scrambling status: %d\n", ret);
 		return false;
 	}
 
@@ -188,9 +190,7 @@ bool drm_scdc_set_scrambling(struct drm_connector *connector,
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to read TMDS config: %d\n", ret);
 		return false;
 	}
 
@@ -201,9 +201,7 @@ bool drm_scdc_set_scrambling(struct drm_connector *connector,
 
 	ret = drm_scdc_writeb(connector->ddc, SCDC_TMDS_CONFIG, config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to enable scrambling: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to enable scrambling: %d\n", ret);
 		return false;
 	}
 
@@ -248,9 +246,7 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to read TMDS config: %d\n", ret);
 		return false;
 	}
 
@@ -261,9 +257,7 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
 
 	ret = drm_scdc_writeb(connector->ddc, SCDC_TMDS_CONFIG, config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to set TMDS clock ratio: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to set TMDS clock ratio: %d\n", ret);
 		return false;
 	}
 

-- 
2.55.0

