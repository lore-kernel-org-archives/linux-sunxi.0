Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51212CA1
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jan 2022 05:37:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id e3so12951629lfc.9
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 21:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zBzA73wq9oOMpx3FI1zX9gp2UPEJRhF+NPSKH1ogVho=;
        b=SEnKc/gLMBioN6fye2cmioS4ebyT6q+aeLcbhlB4kWyv6oXfdpgdiWRLGraVVGWe6B
         5w94DB//artSLJoMUV8v8mzBR5VTLObyXbMT2WTa5FlkY0QsXBRNlXFFMBg2HVvYD3GY
         nmYex8Bc/b5PwBfgz78JQXcNyyr5ra1Ko3Sqk7rUQte8jtkJ7IOsdOlmkCWpDP3o6bRx
         QgcIRM+tG7BED5mlljwHR2TDJlGoDZxVUdZKe6Mo39Q2CvXdrewLWx3jjMtii2GmLy/F
         68TRCJvdl6PpVK732TisgcfeMfkMrj1ORBRphoaERfb4FZvXdVindJ4khi6eBbQ6v0RS
         RP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zBzA73wq9oOMpx3FI1zX9gp2UPEJRhF+NPSKH1ogVho=;
        b=Gmt2f5DWnRz7Ez9v60mvuhSxAeSzlN+wkadPCUTDo2Bnwm6co4c1C6XzIMdObTpTvY
         BxT1lV6qn4ZJUs0Hlx411+9K068hiv6D4WrpQTCfPqrKGkgA7wHFGG9UOGWqUg1eQy/U
         lPhxLI2rjiqA3gP332H+5nPanCWWqqHWvwFB0o/5jsZ8sjhC2eTGXIsLsPHhq4woTOji
         hgvTnfpOCs7JZITtwsKpTHJR0mDQEdyfWBfLybaC/0ctEyiNQQqX9/FQdZppAh7LRTFe
         1Ao8QRdoub2m7DXNNOaZCcKES097A52/6gl1k3+n+nw/v5oDWKvilhXehpDT1ZyF8lcr
         oAyA==
X-Gm-Message-State: AOAM531ZKtkl0khu2U4eFD64XqDn0c2A32l5Oa2KxrO7w2vyzlfRQvRr
	A3szqnpjHLipURmPdUkQcpREiQ==
X-Google-Smtp-Source: ABdhPJz9k9Ee9CEB/YQ3Yz5frlIL7T2skG1hoRvDFCasbGaOiUfO029IjfCKW+F1oyf8fN0qFgQJ/w==
X-Received: by 2002:a05:6512:220b:: with SMTP id h11mr2128913lfu.443.1642052266745;
        Wed, 12 Jan 2022 21:37:46 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id x21sm180212lfa.296.2022.01.12.21.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 21:37:46 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 1/3] net: allwinner: reset control support
Date: Thu, 13 Jan 2022 08:37:32 +0300
Message-Id: <20220113053734.105813-2-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113053734.105813-1-boger@wirenboard.com>
References: <20220113053734.105813-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R40 (aka V40/A40i/T3) and A10/A20 share the same EMAC IP.
However, on R40 the EMAC reset needs to be deasserted.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 64 +++++++++++++++++++--
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 74635a6fa8ca..56e811b0a279 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -28,6 +28,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/reset.h>
 #include <linux/soc/sunxi/sunxi_sram.h>
 #include <linux/dmaengine.h>
 
@@ -69,6 +70,15 @@ MODULE_PARM_DESC(watchdog, "transmit timeout in milliseconds");
  * devices, EMACA and EMACB.
  */
 
+/**
+ * struct emac_quirks - Differences between SoC variants.
+ *
+ * @has_reset: SoC needs reset deasserted.
+ */
+struct emac_quirks {
+	bool		has_reset;
+};
+
 struct emac_board_info {
 	struct clk		*clk;
 	struct device		*dev;
@@ -85,6 +95,7 @@ struct emac_board_info {
 	unsigned int		link;
 	unsigned int		speed;
 	unsigned int		duplex;
+	struct reset_control	*reset;
 
 	phy_interface_t		phy_interface;
 	struct dma_chan	*rx_chan;
@@ -968,6 +979,7 @@ static int emac_probe(struct platform_device *pdev)
 	struct emac_board_info *db;
 	struct net_device *ndev;
 	int ret = 0;
+	const struct emac_quirks *quirks;
 
 	ndev = alloc_etherdev(sizeof(struct emac_board_info));
 	if (!ndev) {
@@ -986,6 +998,13 @@ static int emac_probe(struct platform_device *pdev)
 
 	spin_lock_init(&db->lock);
 
+	quirks = of_device_get_match_data(&pdev->dev);
+	if (!quirks) {
+		dev_err(&pdev->dev, "Failed to determine the quirks to use\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
 	db->membase = of_iomap(np, 0);
 	if (!db->membase) {
 		dev_err(&pdev->dev, "failed to remap registers\n");
@@ -1002,19 +1021,34 @@ static int emac_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
+	if (quirks->has_reset) {
+		db->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (IS_ERR(db->reset)) {
+			dev_err(&pdev->dev, "unable to request reset\n");
+			ret = PTR_ERR(db->reset);
+			goto out_dispose_mapping;
+		}
+
+		ret = reset_control_deassert(db->reset);
+		if (ret) {
+			dev_err(&pdev->dev, "could not deassert EMAC reset\n");
+			goto out_dispose_mapping;
+		}
+	}
+
 	if (emac_configure_dma(db))
 		netdev_info(ndev, "configure dma failed. disable dma.\n");
 
 	db->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(db->clk)) {
 		ret = PTR_ERR(db->clk);
-		goto out_dispose_mapping;
+		goto out_assert_reset;
 	}
 
 	ret = clk_prepare_enable(db->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Error couldn't enable clock (%d)\n", ret);
-		goto out_dispose_mapping;
+		goto out_assert_reset;
 	}
 
 	ret = sunxi_sram_claim(&pdev->dev);
@@ -1070,6 +1104,8 @@ static int emac_probe(struct platform_device *pdev)
 	sunxi_sram_release(&pdev->dev);
 out_clk_disable_unprepare:
 	clk_disable_unprepare(db->clk);
+out_assert_reset:
+	reset_control_assert(db->reset);
 out_dispose_mapping:
 	irq_dispose_mapping(ndev->irq);
 out_iounmap:
@@ -1095,6 +1131,7 @@ static int emac_remove(struct platform_device *pdev)
 	unregister_netdev(ndev);
 	sunxi_sram_release(&pdev->dev);
 	clk_disable_unprepare(db->clk);
+	reset_control_assert(db->reset);
 	irq_dispose_mapping(ndev->irq);
 	iounmap(db->membase);
 	free_netdev(ndev);
@@ -1126,11 +1163,28 @@ static int emac_resume(struct platform_device *dev)
 	return 0;
 }
 
-static const struct of_device_id emac_of_match[] = {
-	{.compatible = "allwinner,sun4i-a10-emac",},
+static const struct emac_quirks sun4i_a10_emac_quirks = {
+	.has_reset = false,
+};
+
+static const struct emac_quirks sun8i_r40_emac_quirks = {
+	.has_reset = true,
+};
 
+static const struct of_device_id emac_of_match[] = {
+	{
+		.compatible = "allwinner,sun4i-a10-emac",
+		.data = &sun4i_a10_emac_quirks
+	},
+	{
+		.compatible = "allwinner,sun8i-r40-emac",
+		.data = &sun8i_r40_emac_quirks
+	},
 	/* Deprecated */
-	{.compatible = "allwinner,sun4i-emac",},
+	{
+		.compatible = "allwinner,sun4i-emac",
+		.data = &sun4i_a10_emac_quirks
+	},
 	{},
 };
 
-- 
2.25.1

