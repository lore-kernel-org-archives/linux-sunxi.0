Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082400;
	b=L6nkJGbCcgU1p+BCGjW69nL2yjgYm412GKHaHNrPxBICbBb47Zl0Kg7I9VRDgSczKtKJ
	 1APQuY9jGLhXUP4Rcj5sm+7OcghAvp65gKPx5MQ8prDP4OMxAf/2Wc87CuCarAsmI0te7
	 i5+fy+XibWd3zoCNmQSxPP1U3322wPd6EaxH5wrkhUeuQb04INB9yokIll7nu5mXtIBi0
	 DC1UINVP4rQuC4R1mGfg1o1PrL2TJeMB0ztMLpraHm/g+f8AUeO2dd71fPLOSFyh6dwQY
	 /3VQ3W7SlpQJyOCv29wthVWIQoyT3DDE03GuSSBwdHSt2HY+4W6dX5PlFjfu8PL73HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082400;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=aq6FcH8o0pFOh9qagX/8knXnGd4aYEu4wccWnJqnW+s=;
	b=dYLR0t1Wx9LU7k/so41DtuiK1OOmIbL1049OV5H7r1aq/8ofG6C7yliZAo9kDYGpyRQx
	 8ysocesN4hlRx9Id4Ly8LzxfYbwkD9p+Qh8c2Saq9ma4GaGDyA/9qZwAMmTITRyAocgc9
	 93HC7LCUpOdoPCphgKjkFvppUSZOI4PaGNS2XHgP2ocjDeXewC75IDhYV4D6mfkuhdgzB
	 Hx5axYPIMhw3rBy9me4kYUEsgBv6zud0rO+s2naiXHnGn1lQXV9k3E8FWsp+9uLncmW7M
	 f5PA8Uh0Ku2h5w+m7uCep6dW4yLQh999gt0h+NPshYX+bYcW6IP+zEeAd+8fgIeJrZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E494B606EE94
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E494B606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-475920b9ca2so865fac.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082399; x=1794687199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq6FcH8o0pFOh9qagX/8knXnGd4aYEu4wccWnJqnW+s=;
        b=q6IQWvse43wNXiM/fAQuiCPseBpfrJN0GrGcnb07NiHLLqzVO+zJlQ6J4b7Aof6OtA
         HTlQEU+WorlAh5eT7Wuy7lxN9rrpbCUDejbVf4y8uWT0CRA7rYLUrsE42kfFsRj780dR
         kFgrkDCpKB/VbElxtP4JKcRWN+teo3GmLy6ndUPZLhZQKMEhmeV7RulLhOlcSrogxY6h
         8yUyo/77oXpxrMFTv5S5yuDwMK9RWwuss6eB+zuCMneFUyOl25xjyxkkv4BTlFdPqfuF
         d9a5w+I803zrbuSP4cipkjHQNdMQYaBnIyfiFtRHikGV7XlG4bKK7RgGV8nL7DVsYmS4
         T4dQ==
X-Forwarded-Encrypted: i=1; AL+hErGAUzF4Yp/242sn1W0mOaYbuocDHtc5IURefmylNBPBXC864NgKXdadDaQuHf7F28yjLKU/EgZl52zIWQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z94hgxVlUNLas91PwXWV75zMVwS75BOfYtPJ5hUl2XiSBGE4f0o
	sVIQywipO8fBPcEDU3ANkq6hCWC7T3vz26RRdjl/lo4aM5m816vr7Xcb2yv6wDo4s2c=
X-Gm-Gg: AYBFou1oJj+iwPzZcF7Ji05XbJGTket3koye20vQoyRN/JqP/RBD4bRSkSClfseHOmA
	RqXX1FX+uVS8QtV0OKjrPPNj/vsJkT7QqPI8oQBRNph2RdrgKlVHlB2ym1AyOyZ0H8+1A5waRv7
	kKeK/r7Dma+gyPiLjgOhmTWCfC/xh7Mg6KV7MTRgkVX69zEhwNxCcOo3O3Pa+SlYRWSrhHubbuL
	N2HsbkC8Glus7bWWbx9WsYPBvB+/RRkCmC+wFIzRyK/A2n4tL74WiCGfksqG2NarMgPk0RMl9fv
	k1z1XAPd6HN6nSgS9M9+emduRLoH6iopZXbCo+IdfGDSvtqWTbEcYrJnyQNCL3Ub2EbC2Mfkyzn
	5dPpk/NyS/Hh0npHNbBH9vV9FPr1n+lSnidjaA26RW0hYrdd230hovGxQbZDfdN9xO71mVQCPvd
	6pFMb/wi+qex3XOXQCydJtPdHh5nf2NERDAIXYcKwpXYruy7h07KOEwqaORzjuhK2aIHxAfnPDy
	J2ZiBmMUaa7H4lB2OnsNoYe76A0F0FmTosSX4sjv+rLfj17qfbROroiacuk3+i7J6xTSTflQ1CM
	ZDzbVLcQgr5TPhtidpNamNrXBALZipFIoyl1AvSJARJiUvD60yT3oMcnL3fHH0Y1Q+xZylfgOo2
	fUwlNmg==
X-Received: by 2002:a05:6870:ed93:b0:49c:8cd1:d293 with SMTP id 586e51a60fabf-4ad9859e590mr4444729fac.1.1794082398830;
        Sat, 07 Nov 2026 12:13:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:33 -0700
Subject: [PATCH 36/58] mtd: rawnand: renesas: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-36-0181ef0cc4c8@gmail.com>
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

Disconnect all chips before dropping runtime PM and transfer buffers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 45 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 201dd62b9990..a8d9e701d7d7 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1201,6 +1201,11 @@ static int rnandc_alloc_dma_buf(struct rnandc *rnandc,
 	return 0;
 }
 
+static void rnandc_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rnand_chip, chip));
+}
+
 static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 {
 	struct rnand_chip *rnand;
@@ -1217,8 +1222,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1233,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1263,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->dev.parent = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_release(chip, rnandc_chip_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1294,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1309,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1316,18 +1330,25 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 	return 0;
 }
 
+static void rnandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rnandc, controller));
+}
+
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc_release);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0

