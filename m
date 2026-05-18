Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F03939A9
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 18:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127445; cv=none; b=a3XnvA4crRZbb6Nos9UVp33ph4npRURSBfcmusfouQFkkDhnMT1vtOzlLPqkUPz0Ue+Ot4FaWu9W+AgPodWhX03Q5WVMbCNEoCRi6GCuiBTEalH3pWB3wLSGjUpI1zYoFm7jdYiW/64GFvBXQmb9Wbb87T98/QYdscMVodBDdV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127445; c=relaxed/simple;
	bh=Wq7HFLMcq+ycT/VWxLv/F1+w4pBeTXs/AtjVVW2asLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAj0AU1TU23BZS44jN/YhspUvTxtP2eURf8juelYLoxy+WuAz06DTbO+DE23USxcnrKzLxiqeMYfTTRPJaV4NmRgL+hHblt/TRzGq1rgGHC2vGlK9Zya4PN6mpmQY+FFEUqA7Y9mZlG36KxMk8sI+Le/RI9wg56WfWwPdM0CUSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=CaQ/WpmQ; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="CaQ/WpmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127442; bh=pRDjhi4A67HVrKb8G93iuKDjCCMCnoa34s8OGiHVDR4=;
 b=CaQ/WpmQAuvObrT0hq053fm3RfgdudcuFvXUz8VxC1dT3pyt69bXNahWUzQtJKw2vmB/usZBP
 McyLkBE3ZmtCyigrNRSOut/6p2SQ2Cf9rRbrmF4YPf+RMB6Q4UkC/EMUzIiQvAxvAslROC/+3ln
 kJwckUTf4YnbShoPaT8TQWEoVBOFrL4Zws6YWvOl0X3cbbCpkr5pcOLK1YJCRhSOY6uhuyTa9ts
 N8wJ55w/AQS9CSVzv5Nu1aKDTNKy4BgNmmGC48zIaRncbdL4ypQe3IwOWc7EtlFKxRfX4v1nVnb
 b6PqHnNZ8EbIYkmhseYybk3iS7ovnmVYRSlXyfKjvPKg==
X-Forward-Email-ID: 6a0b546ab84dbc72d2274f59
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 16/23] drm: bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()
Date: Mon, 18 May 2026 18:01:52 +0000
Message-ID: <20260518180206.2480119-17-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update EDID and CEC phys addr in the bridge detect() func to closely
match the behavior of a bridge connector with a HDMI bridge attached
and the dw-hdmi connector.

This change introduce a slight delay to the bridge connector detect()
and get_modes() funcs due to multiple EDID reads. This is an acceptable
added delay to help ensure EDID and CEC phys addr always are correct.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Update commit message
v6: New patch

This is a temporary change until dw-hdmi is fully converted into a
HDMI bridge in a future part of this multi-series effort.

The patch "drm/bridge-connector: Use cached connector status in
.get_modes()" [1] can help remove one unnecessary EDID read until
dw-hdmi is fully converted into a HDMI bridge.

[1] https://lore.kernel.org/dri-devel/20260426-dw-hdmi-qp-scramb-v5-3-d778e70c317b@collabora.com/
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 37406555af7b..0c4388e7aa5e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2947,8 +2947,17 @@ static enum drm_connector_status
 dw_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	enum drm_connector_status status;
 
-	return dw_hdmi_detect(hdmi);
+	status = dw_hdmi_detect(hdmi);
+
+	/*
+	 * Update EDID and CEC phys addr to match the behavior of a bridge
+	 * connector with a HDMI bridge attached and the dw-hdmi connector.
+	 */
+	dw_hdmi_connector_status_update(hdmi, connector, status);
+
+	return status;
 }
 
 static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge,
-- 
2.54.0

