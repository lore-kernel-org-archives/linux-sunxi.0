Received: from mail-m15596.qiye.163.com (mail-m15596.qiye.163.com [101.71.155.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3840372ED6
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Apr 2026 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775199651; cv=none; b=RPRISX2F5ivvJBiuQku8sAuUwV4Mf9iPhB2FdjQk40WOu5u69+5hOOaBPtZ2pvs6T3hWs4Tke8HkYJPrtg3ORgnR/6xMDy3Mt8Cl4r/skLVhR1PYilv4n0fp0obBCbLN2RPW4W1FVCmXmbl4M3prB1mRvZA4hVaJgwcIJo4K47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775199651; c=relaxed/simple;
	bh=tht/dT+WlcrNaVxweAiPJgOXdNqpqyghSF9yw4dIYO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EmrTmyxaslds6BhWELdLy0Lw6C29fI43Hqog24mAyS9k66Th2J9Ffl7DFo12wMVyE1HfrqbWFUJf4PeK7/89hvVoAY5dy9fO2oRh37c1xkOMzQMGGMPvFgmcxqcd7XOLwVGKUVoAkhHjsa5orTj9sK5i1LBL8dvBALvR028MyJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=a3czWbbN; arc=none smtp.client-ip=101.71.155.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="a3czWbbN"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 396d58c7b;
	Fri, 3 Apr 2026 15:00:38 +0800 (GMT+08:00)
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
Subject: [PATCH v1 2/4] drm/bridge: dw-hdmi: Allow &dw_hdmi_plat_data.output_port = 0 without DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Fri,  3 Apr 2026 15:00:30 +0800
Message-Id: <20260403070032.447102-3-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9d5224d3e103a3kunm1d6b6bc811de8c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh4eHVZDSBpJSE8YT09PSkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=a3czWbbNA5bRxbuC+yj8HGXru+0VhED5jHr8yHMEfFFY6t7unzRDodHsLfmDyeRad9b/QdfUJzGJ3Smi7907Aro4Xl9VnWC2+x1KmIVJCb0ntGB2hpB9P/2tQukCKhE58S7ylyU2NlUI9MJ1OAzPunQBSCUK+B3nNmdoWub9CRQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=7YFq+k4oWEJWI7D226Mei8EZK2WhHcRNVgZytreS/T0=;
	h=date:mime-version:subject:message-id:from;

In the previous commit, Luca split the dw-hdmi attach process into two
cases:

 A. hdmi->plat_data->output_port = 0:
    the HDMI output (port@1) in device tree is not used

 B. hdmi->plat_data->output_port = 1:
    the HDMI output (port@1) is parsed to find the next bridge

For Rockchip, many older platforms (RK3288, RK3399, etc.) only support
case A by default. They can support DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
after adapting to the bridge connector helper. Relax this constraint in
preparation for Rockchip dw-hdmi bridge-connector adaptation.

Link: https://lore.kernel.org/all/20260402-drm-lcdif-dbanc-v3-6-27cd247a0847@bootlin.com/
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index dd50dda3a4f5..20b2f9e145b0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2912,9 +2912,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	/* DRM_BRIDGE_ATTACH_NO_CONNECTOR requires a remote-endpoint to the next bridge */
-	if (WARN_ON((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_data->output_port))
-		return -EINVAL;
+	if ((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_data->output_port)
+		return 0;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		struct device_node *remote __free(device_node) =
-- 
2.34.1

