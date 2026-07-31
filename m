Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EAC45D5E2
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514797; cv=none; b=oO9scvcq5STu0VsTESqLFUdEXzdCa4Ucg9VLfbnbi70vNhaLqUB1WN2CeJi0F/8hPChIHEWfV+6+Oca0PqWD4j5OcvMhKotc66jOFgIsDT3DxYxjMxRY8llG3VQ/BUaRjNyJnu+v2TGTK54B4RbqfQOA4rfaXaKgjUyxgI23ixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514797; c=relaxed/simple;
	bh=hMfmPjxTX291Q5EGzy4LRXRcR3XKvgItQhsbL5BpXSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yq/ixZi7RNkEb/BSNEQ3ep3jzN10afB0zY74R5G2nw0YjwglyeAwm56Mtux3yL2ynyA2O/2wPfJljdjwBjDWO7p6Ndezf+b3xIDkdaG2bhVbHgjg7HnLOzVAb7OsFHL05roJZWqnlP0er2X3tDf9klUQripL+8wYbxEC4ndT2Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y31T1Cbx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y31T1Cbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514782;
	bh=hMfmPjxTX291Q5EGzy4LRXRcR3XKvgItQhsbL5BpXSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y31T1CbxRMTEv0VHq3rKBFvjGN7T4PHqWzcFv3WBxy+p5EENVAZIrKHCt1X9dcl/t
	 je//Wvnhilp0J2oKlBjnLkancuuayTRy0xPL6VDqPISVo1mhUWb5N21KlebznHeZv7
	 Wb7uPlfZKYNFC0/WB0fzG2AA/rKVV6Soy8IsoRHUGiT+RBW+Aezi0dgHr+5LRsgEtb
	 aXS8WOcs0kZiSNR1pdoaEt7WWnMwgmCsVkGYKhkTJAVVgS1YK09BQdP+Tt6apRJldp
	 DttKHxr9wdZyTOcIaLeNxwgkPL7xVKhImzHm+DpDJ9kX3h+GdVbGSUB4yxXJIs3xCT
	 5QYACaAi+DLkQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0C5417E0988;
	Fri, 31 Jul 2026 18:19:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:46 +0300
Subject: [PATCH v10 39/69] drm/bridge: dw-hdmi-qp: Drop unused .setup_hpd()
 phy op
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-39-294364b2cf15@collabora.com>
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

With the transition to .{enable|disable}_hpd() phy ops complete in both
the bridge and platform drivers, .setup_hpd() has no remaining callers.
Drop it.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 ---
 include/drm/bridge/dw_hdmi_qp.h              | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index a2277531182c..fcbc518cd90a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1295,9 +1295,6 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp *hdmi)
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

