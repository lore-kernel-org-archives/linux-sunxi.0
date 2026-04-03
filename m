Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com [45.254.49.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB777378D63
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Apr 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775199652; cv=none; b=lqXybLSW6dV/G9w8GTuhSA3yyePcLAd95caBrPPn9l1m9Vnaza/4q9BR3HAtAQ+F8/3jRg1yXkobV0rQmNhhih5udBnFBQX0GpX+DnH2qGaLU9hHhQDSGc66oqXO7fCZJZO+XjquiyIWYizcoAzbe9BP8LlN30f1923MLuyHcVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775199652; c=relaxed/simple;
	bh=8ri0OPoY/KW3G5nM4FSVP2/vHev0+96L0cNC21OcTwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RXCaFwranUDXEHJ8S5JFw+v7f8Ww89wP8KKz+d8a7EjIoj+AOcpSePqWVaPklPEsmwnQJhpcrHAROL7ELcYbGJX4H0i5UFia2NJgzbvDRRqcCgMrnuEW0WjDiB6v1OYl0S+JFuP0XnpxQ7eOn0H/nsg9XnWYZVju/inkFqfuTjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=MTggQTmp; arc=none smtp.client-ip=45.254.49.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="MTggQTmp"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 396d58c8f;
	Fri, 3 Apr 2026 15:00:40 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	wens@kernel.org,
	samuel@sholland.org,
	luca.ceresoli@bootlin.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	victor.liu@nxp.com,
	dmitry.baryshkov@oss.qualcomm.com,
	shengjiu.wang@nxp.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 3/4] drm/rockchip: dw_hdmi: Apply DRM_BRIDGE_ATTACH_NO_CONNECTOR and the bridge-connector
Date: Fri,  3 Apr 2026 15:00:31 +0800
Message-Id: <20260403070032.447102-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403070032.447102-1-damon.ding@rock-chips.com>
References: <20260403070032.447102-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d5224db2703a3kunm1d6b6bc811deb5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx4ZGlZJSR1LQx5KSUpOHUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=MTggQTmpvpDAkUCTK+phVdqDF0DwSlKrX4o0Bg/D6d8/YgiJQvd2U4TtW6aulksm8kWQCkkqT/Ro3s7iM9nTfEtoe5vhyLxHKXrEjMWzebV5O55UTD9Pdo/33xyT4OzM8T64sJq1OVNcHA+xnQTvFkBOxlhy0fryPFt2AjdYZDk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sFB8BBIFFL7jpCc3yoYdeIALzzlxyXt+AtPHpod/PGU=;
	h=date:mime-version:subject:message-id:from;

Convert this driver to DRM_BRIDGE_ATTACH_NO_CONNECTOR and to the
drm_bridge_connector framework which is the current DRM bridge best
practice.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/rockchip/Kconfig            |  1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index e7f49fe845ea..69b832d0c8c4 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -76,6 +76,7 @@ config ROCKCHIP_DW_DP
 
 config ROCKCHIP_DW_HDMI
 	bool "Rockchip specific extensions for Synopsys DW HDMI"
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Synopsys DesignWare HDMI driver. If you want to
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 21b141b7cb9c..b5cfcb936078 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -13,6 +13,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
@@ -542,6 +543,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi *hdmi;
+	struct drm_connector *connector;
 	int ret;
 
 	if (!pdev->dev.of_node)
@@ -608,7 +610,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 	platform_set_drvdata(pdev, hdmi);
 
-	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, 0);
+	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 
 	/*
 	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
@@ -616,12 +618,21 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	 */
 	if (IS_ERR(hdmi->hdmi)) {
 		ret = PTR_ERR(hdmi->hdmi);
-		goto err_bind;
+		goto err_cleanup_encoder;
 	}
 
-	return 0;
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(hdmi->dev, "Failed to initialize bridge_connector\n");
+		goto err_unbind_bridge;
+	}
 
-err_bind:
+	return drm_connector_attach_encoder(connector, encoder);
+
+err_unbind_bridge:
+	dw_hdmi_unbind(hdmi->hdmi);
+err_cleanup_encoder:
 	drm_encoder_cleanup(encoder);
 
 	return ret;
-- 
2.34.1

