Received: from mail-m32110.qiye.163.com (mail-m32110.qiye.163.com [220.197.32.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E79309DB5
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Apr 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775199649; cv=none; b=AtBbIsqCUSIb1IMy4+LkQv1BXnti2tc55YnSYSjG4/AjKaMSrC8mTo3rHB9z9I3Fw31KpnaSqBbRg0SnKOLDQcFgo5iOVE7p57Ge1XzAONQxm2Hb4w9Z0qBiiX4mnT+ghGAXHNWQBj4uJhvxfl+siTARK5qINkJ+rPE+FAIkYG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775199649; c=relaxed/simple;
	bh=dIIIQA4LTfrGZg1D3eZuZADl8y4Z231QFNBp1HGPv/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gtEAtcJLMx0AB4ZRtpz3nBx6PhGEtKT5VUsvyjtiRuZCRRd6+TzTPYT6G/fSPVcdidu95RVmO721niBBez/MluIPn8rCOmUG1d6eR4LMJ+Ku62OAoSe02FaPhqIvRepha009fPGt5SoOGsciWUDCKXOOFssgZSsyGbblb/B6flc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=i3q+UMV3; arc=none smtp.client-ip=220.197.32.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="i3q+UMV3"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 396d58c5d;
	Fri, 3 Apr 2026 15:00:34 +0800 (GMT+08:00)
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
Subject: [PATCH v1 0/4] Apply bridge-connector for the Rockchip DW-HDMI driver
Date: Fri,  3 Apr 2026 15:00:28 +0800
Message-Id: <20260403070032.447102-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d5224c50403a3kunm1d6b6bc811de47
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xKT1YfHhpJHk9KThhDHUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=i3q+UMV3T40Upw+1mmYGdtYmgqCkv9XHwkxm6H6mozeFHn9SlX0oRLG/mD+xCH5lrus0RrFBhRoR6oFsI9CBcLz5+Qf11Ik7WReJYvsvc25eGOkRgJ5A6DWs++LWimnqFfoxgC7ibB9ZThrhcffXNrMjMuXp2JqBqp1c2y8rBu0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Po/SGAUNetbNZqws7TyBI/pS5fyLBPvJOytlLfUBhDg=;
	h=date:mime-version:subject:message-id:from;

This patch series depends on and must be applied after:
https://lore.kernel.org/all/20260402-drm-lcdif-dbanc-v3-7-27cd247a0847@bootlin.com/
(Series [v3,00/11] drm/mxsfb/lcdif: use DRM_BRIDGE_ATTACH_NO_CONNECTOR and the bridge-connector)

Patch 1: Make DRM_BRIDGE_ATTACH_NO_CONNECTOR optional for platforms that call
         dw_hdmi_bind() to attach the dw-hdmi bridge.
Patch 2: Allow &dw_hdmi_plat_data.output_port = 0 without the attach flag
         DRM_BRIDGE_ATTACH_NO_CONNECTOR for dw-hdmi bridge.
Patch 3: Apply bridge-connector for Rockchip dw-hdmi driver, so that connector
         management is unified under bridge-connector. Treat dw-hdmi purely as
         a bridge without using its own connector helper functions, which
         partially overlaps with the bridge helper.
Patch 4: Add next bridge support for Rockchip dw-hdmi driver, so that it can
         support both the HDMI connector and additional bridge chips.

Damon Ding (4):
  drm/bridge: dw-hdmi: Pass bridge attach flags for dw_hdmi_bind()
  drm/bridge: dw-hdmi: Allow &dw_hdmi_plat_data.output_port = 0 without
    DRM_BRIDGE_ATTACH_NO_CONNECTOR
  drm/rockchip: dw_hdmi: Apply DRM_BRIDGE_ATTACH_NO_CONNECTOR and the
    bridge-connector
  drm/rockchip: dw_hdmi: Support to find the next bridge

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 10 +++----
 drivers/gpu/drm/rockchip/Kconfig            |  1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 33 ++++++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  2 +-
 include/drm/bridge/dw_hdmi.h                |  4 ++-
 5 files changed, 39 insertions(+), 11 deletions(-)

-- 
2.34.1

