Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04EE2CA4
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 15:57:37 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id o15so4856584lfo.11
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 07:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xWB86lLShMOvVXpcj6liSWQMqibhlefo7YzIyCndAFs=;
        b=54T92PiCKERDXo2MK7DNMmul3FC9HVF7xNWVf/6uPh+X2Cd/4EPq8pq94BgSZ6T30V
         iNE/waUixYUh889slgqB+y6qdIizEKuc2sSdTpcF5rpswUPBvxrQpH3DNtmkjbBLBSaN
         IPrXjff5Q8rltcml9n+oiP8/UlUttOnBHA6xa92ogN79xSCZ96xyJiDFSfmp1QITdNwV
         6CT3Y3Z8/wtauUFlI+Z5gs+bRgN00sEawN5xqj9ykrYtAqlHqajjiyOD+qO16fazbu96
         IH3oQPLVnv9D8uCTQ+GcAFqbUhc+XJJ8uDYAuhrN/HCs9n1zFXoriNYisEy7Sob7bqM+
         Xdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xWB86lLShMOvVXpcj6liSWQMqibhlefo7YzIyCndAFs=;
        b=in8SMIyOGApmYdr701oaX8U4BoQK38WRvoy5ivZkAvL8bgrv4QWH1YfPdYWva/dWHV
         dAgM2AIOXdfGnYv0JFZlQiALBdmwv3OUhlYrVifKak+/f43e34W5/IXQC6Eyzfjd9TOn
         EeFT9ddtEbKwCPJrdm0jFT1Y5vJZg+++DNaYJB7aQPUyx7Y5OuIkEOzTdPPUj7mJeYkn
         /c0OZGm72JlW5e7vu0BEm5eqnHtrETZxbNw6BmbN+jmZ/IXPKu4soX2X0EOC6H+kC9d1
         +F132VDgayBkT/QLU23tK9xxNXeIrPlFqR3MnJ+AYr8NNqS//NcUb1Pw590K4wE/QJRD
         v+MA==
X-Gm-Message-State: AOAM533X2QwptjYydOW5CVA/rERBkDQO6jeJuIZoWwmwIxVLHXsHYxEF
	BPo+RTh2gIxMvJISYF6uN6MzmQ==
X-Google-Smtp-Source: ABdhPJzGSdWUsXwj8CndEAqmmbfMMV8gzQB7VszCY9/t9/9SDBOZurgzAsIGXesOHh8ZFFHpLIBI0g==
X-Received: by 2002:a2e:868c:: with SMTP id l12mr3552087lji.416.1641916655985;
        Tue, 11 Jan 2022 07:57:35 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id y7sm1370706lfa.92.2022.01.11.07.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 07:57:35 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-can@vger.kernel.org,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Jeroen Hofstee <jhofstee@victronenergy.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
Subject: [PATCH v2 2/3] can: sun4i_can: add support for R40 CAN controller
Date: Tue, 11 Jan 2022 18:57:08 +0300
Message-Id: <20220111155709.56501-3-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111155709.56501-1-boger@wirenboard.com>
References: <20220111155709.56501-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner R40 (also known as A40i, T3, V40) has a CAN controller. The
controller is the same as in earlier A10 and A20 SoCs, but needs reset
line to be deasserted before use.

This patch adds a new compatible for R40 CAN controller. Depending
on the compatible, reset line can be requested from DT.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 drivers/net/can/sun4i_can.c | 61 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 54aa7c25c4de..24a61326915e 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -61,6 +61,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 
 #define DRV_NAME "sun4i_can"
 
@@ -200,10 +201,20 @@
 #define SUN4I_CAN_MAX_IRQ	20
 #define SUN4I_MODE_MAX_RETRIES	100
 
+/**
+ * struct sun4ican_quirks - Differences between SoC variants.
+ *
+ * @has_reset: SoC needs reset deasserted.
+ */
+struct sun4ican_quirks {
+	bool		has_reset;
+};
+
 struct sun4ican_priv {
 	struct can_priv can;
 	void __iomem *base;
 	struct clk *clk;
+	struct reset_control *reset;
 	spinlock_t cmdreg_lock;	/* lock for concurrent cmd register writes */
 };
 
@@ -702,6 +713,13 @@ static int sun4ican_open(struct net_device *dev)
 		goto exit_irq;
 	}
 
+	/* software reset deassert */
+	err = reset_control_deassert(priv->reset);
+	if (err) {
+		netdev_err(dev, "could not deassert CAN reset\n");
+		goto exit_soft_reset;
+	}
+
 	/* turn on clocking for CAN peripheral block */
 	err = clk_prepare_enable(priv->clk);
 	if (err) {
@@ -723,6 +741,8 @@ static int sun4ican_open(struct net_device *dev)
 exit_can_start:
 	clk_disable_unprepare(priv->clk);
 exit_clock:
+	reset_control_assert(priv->reset);
+exit_soft_reset:
 	free_irq(dev->irq, dev);
 exit_irq:
 	close_candev(dev);
@@ -736,6 +756,7 @@ static int sun4ican_close(struct net_device *dev)
 	netif_stop_queue(dev);
 	sun4i_can_stop(dev);
 	clk_disable_unprepare(priv->clk);
+	reset_control_assert(priv->reset);
 
 	free_irq(dev->irq, dev);
 	close_candev(dev);
@@ -750,8 +771,27 @@ static const struct net_device_ops sun4ican_netdev_ops = {
 	.ndo_start_xmit = sun4ican_start_xmit,
 };
 
+static const struct sun4ican_quirks sun4ican_quirks_a10 = {
+	.has_reset = false,
+};
+
+static const struct sun4ican_quirks sun4ican_quirks_r40 = {
+	.has_reset = true,
+};
+
 static const struct of_device_id sun4ican_of_match[] = {
-	{.compatible = "allwinner,sun4i-a10-can"},
+	{
+		.compatible = "allwinner,sun4i-a10-can",
+		.data = &sun4ican_quirks_a10
+	},
+	{
+		.compatible = "allwinner,sun7i-a20-can",
+		.data = &sun4ican_quirks_a10
+	},
+	{
+		.compatible = "allwinner,sun8i-r40-can",
+		.data = &sun4ican_quirks_r40
+	},
 	{},
 };
 
@@ -771,10 +811,28 @@ static int sun4ican_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct clk *clk;
+	struct reset_control *reset = NULL;
 	void __iomem *addr;
 	int err, irq;
 	struct net_device *dev;
 	struct sun4ican_priv *priv;
+	const struct sun4ican_quirks *quirks;
+
+	quirks = of_device_get_match_data(&pdev->dev);
+	if (!quirks) {
+		dev_err(&pdev->dev, "failed to determine the quirks to use\n");
+		err = -ENODEV;
+		goto exit;
+	}
+
+	if (quirks->has_reset) {
+		reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (IS_ERR(reset)) {
+			dev_err(&pdev->dev, "unable to request reset\n");
+			err = PTR_ERR(reset);
+			goto exit;
+		}
+	}
 
 	clk = of_clk_get(np, 0);
 	if (IS_ERR(clk)) {
@@ -818,6 +876,7 @@ static int sun4ican_probe(struct platform_device *pdev)
 				       CAN_CTRLMODE_3_SAMPLES;
 	priv->base = addr;
 	priv->clk = clk;
+	priv->reset = reset;
 	spin_lock_init(&priv->cmdreg_lock);
 
 	platform_set_drvdata(pdev, dev);
-- 
2.25.1

