Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082388;
	b=Na8pEV2GBIOgweuNMzZUtlSGjhN7DreGAfnzjVEJe6EsWMDobDelt57dn42ZWVAMHwFr
	 5B4IvH5R1HOS/2JRsE6CZ8Djag/rjfUHYJz4TAT79lHe5mWaIuH6U56rTkma0TJ9v4m19
	 6a5e+YmLISjqqFnYQCFkR2VvQpAWEQLDcvAVtH4Yg7JDqTqQhz6PNv6DSHBrmxAIKxzd/
	 TgcUw63NgiMf9YTrVjTpTf5j31wH7H8Bwe0yy+XTA+xYrw4GNaWPUjSvpzj6bi3rBa+2w
	 WgCN6KzDSlmetOJoxjiYexOejklzQE0OFwuBE9Kdt6vSNzD2SnG9w+qnZoes9fDNISg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082388;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y022+nlY6fsxp9yeExqcFOZHpsByokSnlDdM4w3Us8I=;
	b=1YqJ3fwEA7XUE233aM2ggbOL5CaSHNfAjbc2JE41Fs5TtX8UCGP4oycB9jsXCunBww8s
	 BTUAPW62RhRQMTTF30YLV9eLdn7uZdv7O74vVnIaow84pcS+WbztO2sv0izP4voZ1tEWT
	 CgQOqqKAR8gZrmhzkHkMoIvT4LLJlFeX15CLk1X+xNpSnbLLGUSP6kZeC9/JcISRcxb3Q
	 1TNX46c+UxK09kDqUtk2WWPNliqZtb6SHyWrwJ4XcmGA8VUSPXC1/HTwzArj3sFXQbuVo
	 SS1zyjYloGDZSNWTCMStBNgp6BDiBMk08tfIBuIqYoKQH22Js+rXe5AbOr/M+oJ7ESQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C9D606D810
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C9D606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4adaa0f72abso503260fac.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082387; x=1794687187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y022+nlY6fsxp9yeExqcFOZHpsByokSnlDdM4w3Us8I=;
        b=VCI8n2SQJBy6i4GtpIPzJ/P6Ylrb9K+rWEjlCDM3jskih7hd/tKHfWFgqmlYCrw3TN
         S1WpE1FfyEM/8mV7rHzbXt0dksW20SdlT3hxIw2CFZtvvZYIfRsmWwU7iBQHwwOAoXIe
         eFldTY1W9kIyxC0BP4087n9dEnber7JKwVbjhWpR6MvErYhkpCT2Exhkf8yDjq8uO+92
         On5TjPFVGgiMocADxfv/bNQlJs8y7mSqAdOKXqOo2E5UA9ZvOmTYH9OlP1d1YQrI7qsV
         BQzEmOIj9PEthHqD3+5jPqcxqtsw07mmkFrFgucnacadSYDwaiQVvvrhlwB4no0Vt/Tj
         Mrsw==
X-Forwarded-Encrypted: i=1; AL+hErH8Z7u6ITBAYOGeTn20d/G96dqOjsmR9YEo589gy9FE0TSRlm3SPq/PyqeGCNWBPYhxpimHNaMBsYAIVQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/zAf7bnhx2VTwLgGNVbZ3rxqjw/iOu1bR60u+9n/gxQByzF1vW
	xz7d9AcuTQ404Be8MbhT6WjKyqvBx0XyZjVDrBcQ08lDyYjuCOmt0mTmNPG86uWaPYQ=
X-Gm-Gg: AYBFou2faCzaLtIUoRGlmU+tKB0rJAH3SS9bj7popqApgEJSYXqBg9cVPOR/g9hSeMV
	1i1oWw69NsCX1EV+gG61ue/6f27BFjjJbmpVjPoAvJ/nFc8iIrSsR/nTiS7JGMNJbHYsqynp/BQ
	R3U4HXXinZWFgOaRjLQGYWS547LA/HzYb4qszYgpHNrVnLajPQS/meLND0lPQCNkLoK8f5ohFu/
	SFBtsDNphUBnRhtRpFNzDj4vuUxvWJMnfPmODBfjlxc5WjI9ygzXpiClcQG+RP1AgYc9w8vTAqJ
	u3QEYoDJhsN4r85qWUCrFckm5Q4VoaeWeN/CZYFCmFxEiA/zIjuwZHFw0n4lFXAUwYosJq3XwwI
	V5Y5cW1JOlQSIJHDQ4/PzURKZXzakrAq9ifFB7/Y4RbVghjGuTj5tO0K+hoD+yIXV58qXLLiZ3v
	4uzLPu+9pZU+Apnz3Hm5lZLwHHtO03EKooGQYOWBvEJIIwrlELKSCax//HCFv2Ef8vnPELUF+UD
	Oj/jJ8iGKukjLNVqnFvyxaWf/C5VlPKS2Kx9m3UwIUt9By1lRiV2F8h02CfVX6EOvLT7JWTeqIQ
	HMPUdY0Q9E6md/nRyNb4BGqTP1BF1PvE8WyDBpQLe/Zw6Z3niW6i6lYQ5uVW
X-Received: by 2002:a05:6870:5b99:b0:470:e96b:43e5 with SMTP id 586e51a60fabf-4adc0c230famr1253184fac.17.1794082387495;
        Sat, 07 Nov 2026 12:13:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:29 -0700
Subject: [PATCH 32/58] mtd: rawnand: fsmc: retain open-handle state on
 removal
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-32-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect before controller disable and DMA channel release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0b1817cdfc5a..ef0738c4cca1 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1024,6 +1024,11 @@ static void fsmc_nand_disable(struct fsmc_nand_data *host)
  * fsmc_nand_probe - Probe function
  * @pdev:       platform device structure
  */
+static void fsmc_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsmc_nand_data, base));
+}
+
 static int __init fsmc_nand_probe(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host;
@@ -1037,9 +1042,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, fsmc_nand_release);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1136,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1147,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1189,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0

