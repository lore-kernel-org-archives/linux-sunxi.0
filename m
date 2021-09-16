Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52BD2FAE
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Sep 2021 11:12:43 +0000 (UTC)
Received: from BC-Mail-Ex09.internal.baidu.com (unknown [172.31.51.49])
	by Forcepoint Email with ESMTPS id 35A309D0935FBB00736D;
	Thu, 16 Sep 2021 18:56:39 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex09.internal.baidu.com (172.31.51.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 18:56:39 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 18:56:38 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/sun4i: dw-hdmi: Make use of the helper function dev_err_probe()
Date: Thu, 16 Sep 2021 18:56:32 +0800
Message-ID: <20210916105633.12162-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
And using dev_err_probe() can reduce code size, the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index f75fb157f2ff..21d473deb757 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -153,22 +153,19 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		return -EPROBE_DEFER;
 
 	hdmi->rst_ctrl = devm_reset_control_get(dev, "ctrl");
-	if (IS_ERR(hdmi->rst_ctrl)) {
-		dev_err(dev, "Could not get ctrl reset control\n");
-		return PTR_ERR(hdmi->rst_ctrl);
-	}
+	if (IS_ERR(hdmi->rst_ctrl))
+		return dev_err_probe(dev, PTR_ERR(hdmi->rst_ctrl),
+				     "Could not get ctrl reset control\n");
 
 	hdmi->clk_tmds = devm_clk_get(dev, "tmds");
-	if (IS_ERR(hdmi->clk_tmds)) {
-		dev_err(dev, "Couldn't get the tmds clock\n");
-		return PTR_ERR(hdmi->clk_tmds);
-	}
+	if (IS_ERR(hdmi->clk_tmds))
+		return dev_err_probe(dev, PTR_ERR(hdmi->clk_tmds),
+				     "Couldn't get the tmds clock\n");
 
 	hdmi->regulator = devm_regulator_get(dev, "hvcc");
-	if (IS_ERR(hdmi->regulator)) {
-		dev_err(dev, "Couldn't get regulator\n");
-		return PTR_ERR(hdmi->regulator);
-	}
+	if (IS_ERR(hdmi->regulator))
+		return dev_err_probe(dev, PTR_ERR(hdmi->regulator),
+				     "Couldn't get regulator\n");
 
 	ret = sun8i_dw_hdmi_find_connector_pdev(dev, &connector_pdev);
 	if (!ret) {
-- 
2.25.1

