Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC48133C4
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Apr 2022 15:38:52 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id BB8D8CB1BB
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Apr 2022 15:28:31 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A9E4E000D;
	Fri, 15 Apr 2022 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650036504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LT0EhgXq3R2l9e4oXz3V0FKtUtVuZ2/Gch2vNg9Dl2A=;
	b=FHSaqiWxImF5DecN39A8JgDZ9U/pYYsLbQrLw3JkbPjVn7/b5Y5O+Cyu8QgtFi3xFtZOUE
	fRwDqQ+4S6yOqT6BiPS87ptJgoeWp+9ZrARGu37qYh8T3QRueSEH9FS1K5+rX540xvNryT
	orARlEVOS8ZbBunZMBc0fSaej3/WhWD7o1Cv8ZpyQsuG+gGangake1JdxyB6S4Q03EuIcb
	kXlzTB/PwdlxmEL4+ZfJDag0UhES7BiPPAyhdQLwE6fqKutQGCWW7IxuqsXo9U2wLMwMlY
	e21mvvVUXnSBl6jaeeJninnjG0IeRsnnmk0b1b5469zalk4yMvmfp6+r63+R3w==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 04/45] media: sun6i-csi: Always set exclusive module clock rate
Date: Fri, 15 Apr 2022 17:27:30 +0200
Message-Id: <20220415152811.636419-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415152811.636419-1-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some situations the default rate of the module clock is not the
required one for operation (for example when reconfiguring the clock
tree to use a different parent). As a result, always set the correct
rate for the clock (and take care of cleanup).

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 54 ++++++++++++++-----
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index becd8d17f8eb..827583a30ad0 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -154,9 +154,6 @@ int sun6i_csi_set_power(struct sun6i_csi_device *csi_dev, bool enable)
 		regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN, 0);
 
 		clk_disable_unprepare(csi_dev->clock_ram);
-		if (of_device_is_compatible(dev->of_node,
-					    "allwinner,sun50i-a64-csi"))
-			clk_rate_exclusive_put(csi_dev->clock_mod);
 		clk_disable_unprepare(csi_dev->clock_mod);
 		reset_control_assert(csi_dev->reset);
 		return 0;
@@ -168,9 +165,6 @@ int sun6i_csi_set_power(struct sun6i_csi_device *csi_dev, bool enable)
 		return ret;
 	}
 
-	if (of_device_is_compatible(dev->of_node, "allwinner,sun50i-a64-csi"))
-		clk_set_rate_exclusive(csi_dev->clock_mod, 300000000);
-
 	ret = clk_prepare_enable(csi_dev->clock_ram);
 	if (ret) {
 		dev_err(csi_dev->dev, "Enable clk_dram_csi clk err %d\n", ret);
@@ -190,8 +184,6 @@ int sun6i_csi_set_power(struct sun6i_csi_device *csi_dev, bool enable)
 clk_ram_disable:
 	clk_disable_unprepare(csi_dev->clock_ram);
 clk_mod_disable:
-	if (of_device_is_compatible(dev->of_node, "allwinner,sun50i-a64-csi"))
-		clk_rate_exclusive_put(csi_dev->clock_mod);
 	clk_disable_unprepare(csi_dev->clock_mod);
 	return ret;
 }
@@ -819,6 +811,7 @@ static int sun6i_csi_resources_setup(struct sun6i_csi_device *csi_dev,
 				     struct platform_device *platform_dev)
 {
 	struct device *dev = csi_dev->dev;
+	unsigned long clock_mod_rate;
 	void __iomem *io_base;
 	int ret;
 	int irq;
@@ -850,28 +843,53 @@ static int sun6i_csi_resources_setup(struct sun6i_csi_device *csi_dev,
 		return PTR_ERR(csi_dev->clock_ram);
 	}
 
+	if (of_device_is_compatible(dev->of_node, "allwinner,sun50i-a64-csi"))
+		clock_mod_rate = 300000000;
+	else
+		clock_mod_rate = 297000000;
+
+	ret = clk_set_rate_exclusive(csi_dev->clock_mod, clock_mod_rate);
+	if (ret) {
+		dev_err(dev, "failed to set mod clock rate\n");
+		return ret;
+	}
+
 	/* Reset */
 
 	csi_dev->reset = devm_reset_control_get_shared(dev, NULL);
 	if (IS_ERR(csi_dev->reset)) {
 		dev_err(dev, "failed to acquire reset\n");
-		return PTR_ERR(csi_dev->reset);
+		ret = PTR_ERR(csi_dev->reset);
+		goto error_clock_rate_exclusive;
 	}
 
 	/* Interrupt */
 
 	irq = platform_get_irq(platform_dev, 0);
-	if (irq < 0)
-		return -ENXIO;
+	if (irq < 0) {
+		dev_err(dev, "failed to get interrupt\n");
+		ret = -ENXIO;
+		goto error_clock_rate_exclusive;
+	}
 
 	ret = devm_request_irq(dev, irq, sun6i_csi_interrupt, 0, SUN6I_CSI_NAME,
 			       csi_dev);
 	if (ret) {
 		dev_err(dev, "failed to request interrupt\n");
-		return ret;
+		goto error_clock_rate_exclusive;
 	}
 
 	return 0;
+
+error_clock_rate_exclusive:
+	clk_rate_exclusive_put(csi_dev->clock_mod);
+
+	return ret;
+}
+
+static void sun6i_csi_resources_cleanup(struct sun6i_csi_device *csi_dev)
+{
+	clk_rate_exclusive_put(csi_dev->clock_mod);
 }
 
 static int sun6i_csi_probe(struct platform_device *platform_dev)
@@ -891,7 +909,16 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
 	if (ret)
 		return ret;
 
-	return sun6i_csi_v4l2_init(csi_dev);
+	ret = sun6i_csi_v4l2_init(csi_dev);
+	if (ret)
+		goto error_resources;
+
+	return 0;
+
+error_resources:
+	sun6i_csi_resources_cleanup(csi_dev);
+
+	return ret;
 }
 
 static int sun6i_csi_remove(struct platform_device *pdev)
@@ -899,6 +926,7 @@ static int sun6i_csi_remove(struct platform_device *pdev)
 	struct sun6i_csi_device *csi_dev = platform_get_drvdata(pdev);
 
 	sun6i_csi_v4l2_cleanup(csi_dev);
+	sun6i_csi_resources_cleanup(csi_dev);
 
 	return 0;
 }
-- 
2.35.2

