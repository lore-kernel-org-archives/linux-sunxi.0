Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69516F8F5
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Oct 2024 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730052605; cv=none; b=NMBKhc+/ytW1fu/J6KmdLM5bejK9ryI5J2sQudKFMTVumbmeWNG3yMVPGjqecwpYbUmr3NdD6hf8SQ5chnwp6wztObn6ZS+WglxitzvZm40S1Y1LQhIEwJZIecoYlpQuvtHiqNvqTUj91kBQ6bHtFAddJRMvK6CR/tsYqwaHcAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730052605; c=relaxed/simple;
	bh=Xl4a65iUilugV+fBphpVSgOCCRtwM6mhRH4xdVAsPaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sF3VCgKJXLZZ3aKny14E65ChtvAVT/L9p8G75cxGBRkVheKwCIXE8fENL10Ze6Wq2mnfCufk3UXPLsGsr9UCWRAGmXRM6REN2hkGAioJOdtsy3iyCGIsvXd91wP1pkugA84qm0NjfRADURKKqio9UkD0f6t6kiDczM1y7fZm+Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=FMJkX+bJ; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="FMJkX+bJ"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 655CBA0472;
	Sun, 27 Oct 2024 19:10:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=CQYMBjKa/6089/ZeL5xA
	OUfW85stKiaNK4L4qGdqr04=; b=FMJkX+bJSwPqBMXD4Q4BKkFtLymd0M6lsHR9
	be8afXm3uNXRMAY/T4H4ReFiLi3GquQaI/CJq9/45fz+ksGhWc3KHHPdGAKdOyGV
	wBfxn0anf2F2n76ghD/OeVyObZjwjoNahcCPcFMBWlhiLfkzTwQ+jOm6S7X4DMzo
	r81Xl97O0bUcfHB5qGdZ6SlSjz0Isruj68gqD/TH8oFZru61H0K2q4B7Rdur0NIo
	IrpGF4wQAlO4vTVzICjHRludv77cGemmv7b3nBhO4JgG7LP21Em0r/+7DPfmvuyT
	JMSXXJ+OiOda0T8H7McGgSwoyo3JVYFt5xF+gNakl7mv/1jS3oophSxMH+KFkMTa
	v15WEqy/sVOAvnlaOZyqX6ndG6mcvTOh4iqP1DwETJmRNgbNy0Aw7CxDUVD4Me6M
	smPeWjadffqIZxwTUu5rWvZ87ky24p7MMDL47/sOUSbUolXVLvMIk3YMgkGVLytB
	9UaxrxDKIQn0cn3XMw+Oq1HybCnhW9Hdgfd1sc0mnAZhbfxwIyx0h5sZj1FfeqoJ
	An9dSBo8U0ok7Ryl/IoiCqYlgifS70zGDweuFvsA9bQaQV39QkU/jDBxFzTEUsz5
	JWjodgTGf2MjiIhDBuA3FJedJed/ewaVQUcJIaZebF/npECMJBkUS4FxjpMvFbYD
	VZ3TpUY=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Vinod Koul
	<vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
Subject: [PATCH v3 02/10] dma-engine: sun4i: Add has_reset option to quirk
Date: Sun, 27 Oct 2024 19:08:55 +0100
Message-ID: <20241027180903.2035820-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4b614d6c-6b46-438a-b5c3-de1e69f0feb8@prolan.hu>
References:
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730052599;VERSION=7978;MC=629135376;ID=158215;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677C63

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
has this bit but in order to support suniv we need to add it. So add
support for reset bit.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased and addressed comments ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * Call reset_control_deassert() unconditionally, as it supports optional resets
    * Use dev_err_probe()
    * Whitespace
    Changes in v3:
    * More dev_err_probe()

 drivers/dma/sun4i-dma.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index d472f57a39ea..f485d6f378c0 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -15,6 +15,7 @@
 #include <linux/of_dma.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -159,6 +160,7 @@ struct sun4i_dma_config {
 	u8 ddma_drq_sdram;
 
 	u8 max_burst;
+	bool has_reset;
 };
 
 struct sun4i_dma_pchan {
@@ -208,6 +210,7 @@ struct sun4i_dma_dev {
 	int				irq;
 	spinlock_t			lock;
 	const struct sun4i_dma_config *cfg;
+	struct reset_control *rst;
 };
 
 static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
@@ -1215,6 +1218,16 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
+	if (priv->cfg->has_reset) {
+		priv->rst = devm_reset_control_get_exclusive(&pdev->dev,
+							     NULL);
+		if (IS_ERR(priv->rst)) {
+			dev_err_probe(&pdev->dev, PTR_ERR(priv->rst),
+						  "Failed to get reset control\n");
+			return PTR_ERR(priv->rst);
+		}
+	}
+
 	platform_set_drvdata(pdev, priv);
 	spin_lock_init(&priv->lock);
 
@@ -1287,6 +1300,14 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Deassert the reset control */
+	ret = reset_control_deassert(priv->rst);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			"Failed to deassert the reset control\n");
+		goto err_clk_disable;
+	}
+
 	/*
 	 * Make sure the IRQs are all disabled and accounted for. The bootloader
 	 * likes to leave these dirty
@@ -1356,6 +1377,7 @@ static struct sun4i_dma_config sun4i_a10_dma_cfg = {
 	.ddma_drq_sdram		= SUN4I_DDMA_DRQ_TYPE_SDRAM,
 
 	.max_burst		= SUN4I_MAX_BURST,
+	.has_reset		= false,
 };
 
 static const struct of_device_id sun4i_dma_match[] = {
-- 
2.34.1


