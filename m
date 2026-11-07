Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082382;
	b=i2fXn1TpkzeWBJwur6W3iDb2P6fHrOtBAd/iyOn/KXkrzEmoX2ETfLJnvDTFnTVZchIL
	 ArA4Q7l7VvDKGOSCGpGapNLPRR6pjKskgsauNKYMDadkw1Bp9MehptnAE0nM7y8gWwiRJ
	 ZMXJO/hJhyU83KsxUSe1XEAlGt6LC3JCcurmphwPbohLQJIw3lmfw7nDeyeY0ddexWZBk
	 hHDY6TjBgnij28yF00AeWSF3KFL7WKlRURPasN8p7PO4XQGQ0L86uDtpbxIIZDK93L1pc
	 JqxocUKVghTJPyq0VFm9+TskYoPv9UwCRHYe4IjFHIOXL4jtlkEEGcvdCc+Kc1rlYzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082382;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=q10HEz8kiYMrWgvOwqfdg5IG6VH+ZxR/JVM/7JXlHp0=;
	b=GUJqV0P3Gdt1tD3XF7Unb0M3kibwtHAQDcs0I185tLR09imsBrEOMAyJg2y1kEC9kwWm
	 FZkzlLPciTd7OiduhFnUBJ6Ece3ZEI/J4UKoiPc+E8uV5GdEKvdGy2vtQBQRQlXlp/0dB
	 0duj+3OnF/sjJ3oz+z83QZ42pV/sdO/bDh97TSJFU2Km2HBBXdnL9tWSIZQLEF58YVgE+
	 yowne+vwT7kDnVMweAXqXnRG6mjOUnJsE65bLfrO+2txiqnn6Qp+sBtcKZ0RV70l/DopI
	 xpwna3rGG3a3WGoWaxilNEoVhxheOO6w1PRUl3os7TuCzFos+cZlXuXXAs1spIb9kpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00977606D803
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00977606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4f14642adb4so3876b6e.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082381; x=1794687181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q10HEz8kiYMrWgvOwqfdg5IG6VH+ZxR/JVM/7JXlHp0=;
        b=sOdsn8GZx3WXXozGewLLl5tgy53/WY+7somALMqPoHyXybbcF7Yg1c7PzyG3Jqxiwo
         bdzvQ7cBHMyEBGBRvCyxL4sT7YxkpibagajrF+DuINDmN3xGC66eVc6lFctPn7zJRN0U
         psVnKCstgOuFxCNktLxj7/35h0NQzuPfbKnUI3Ur6i3YtHqHEkMML752DwAh30BRp8UQ
         qsCLfPBBTUpwoV3RGkoffUjptvNNxdgWiholrcqLiw6IB/ZQYjEVt7dvHhrgmqoa5Gop
         kpX5DyPpCeyHJ91XzdkkML71jENkOUo7RtKfYTYmAhJj1uAIrJ6MWJFyh5F2Y4sSOSns
         csSg==
X-Forwarded-Encrypted: i=1; AKwUvBwYaeERDtyFGXVglPLaHOGAw8ui088Uhu+o9NtAx5Atsr0HiFouQp8MFNp8k2ORjqAA/1NCls3CTHznmw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9rJ7RJ3ge24JVU8Q8KAcLwsWJZ+HyVeFR/AUVsXqC3obS+zNsa
	TdtcbdHC7lbPxuiECw86C+c5/5zXgwSqr4fLqy74WcvQ4WO6oyZ07Fl95UjkYGjWtH8=
X-Gm-Gg: AYBFou3QTifSTlaxG925P7KiSI1VFBrjbv3Xc/YEvPzRxcHuHzzmhngOSHfv5Hoq7lj
	8rxCmwRfT49k4f1nDzyQy85WKtTLBXV/xDzjTDcerawz1A6VxykiT6x3b13Ishvi4fSMvoZhMyN
	SyyiRETWACN9RjnK8C9vpUe3LdYhQSE3KmGGlYBZjjjzTe6n0mO0VQCdIE8V8Xqgz2f3d54w6lx
	BoC3TmT0EJw7aC+fQ5QvN5IYQqADYg9aHPnIOzgpx3uvWHygczZs654JVx0zu3hw+Vall0u98cp
	SB5vTWTzZObIiH7fPk7h1vBIXq+Z7pdYTWlmvTH8VyYcjBJooQL8ILfwSFduJNVH5MxbmhvGALQ
	0qs89sxX9FKjgt5PVxCpQLQBaQbIrfJAi0Yv7hmKMXtkNNcdSndJUd58TD5a/Ztm6/dY6jXtW5b
	qvLGyBou5oxGdZ9ZuFkmYv9NkXVEaAhDKtSTCzHaJMqTPESx55E7+Kxm1t/zzjSIZYM5bxgZIv5
	zI6Nr6n0eWhzjbLGDqLBS7Gn/589eQhLVRD9gfY0PqO5I64RaXlRD7neZMlLaJPDh/DkClSFBkV
	8RLddwSvpaAsS+r6DdCvfLZUvOeM8/ot/e8fOsx4pRxCYlaPbPyRTIRnwMSf
X-Received: by 2002:a05:6808:4f67:b0:4f5:cb60:33c5 with SMTP id 5614622812f47-567e098c179mr5133579b6e.6.1794082380862;
        Sat, 07 Nov 2026 12:13:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:27 -0700
Subject: [PATCH 30/58] mtd: rawnand: pl35x: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-30-0181ef0cc4c8@gmail.com>
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

Unwind chip ownership on registration failures as well as removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 46 ++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 26b61d856143..952fe5dcc84d 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1049,6 +1049,11 @@ static int pl35x_nand_reset_state(struct pl35x_nandc *nfc)
 	return 0;
 }
 
+static void pl35x_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct pl35x_nand, chip));
+}
+
 static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 				struct device_node *np)
 {
@@ -1057,22 +1062,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1096,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, pl35x_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1136,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1146,6 +1165,11 @@ static int pl35x_nand_chips_init(struct pl35x_nandc *nfc)
 	return ret;
 }
 
+static void pl35x_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pl35x_nandc, controller));
+}
+
 static int pl35x_nand_probe(struct platform_device *pdev)
 {
 	struct device *smc_dev = pdev->dev.parent;
@@ -1153,12 +1177,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, pl35x_nand_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

