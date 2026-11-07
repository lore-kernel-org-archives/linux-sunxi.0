Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082438;
	b=lz4ZDtAhdUP2JHn+zWgsi/+QXcny3PnDcuExlI5JhSASkX4lTqUUB8vE4yL0rJ8GkogM
	 Ehia0KH/4mTjj82e8CxUwoB1Iy9NXr1CKppE26HsS82PeMYClcFOhX5p8hRR7uwtQIEzP
	 62ehyFzMQZf8O1oiChdnfzOjAF7sUHPJ5JRz54EBYjFfSXOUzfGQYiHLGi0+5V2B1KbGU
	 1KAU5NplqhLvo4BFHAW9EKiDi31YVrHeJyebxxaDtnvCuVeYYtkelL3fPgub4VMbrOZ/p
	 /NUPKLzeiZVQoKlQApSUjU4q+h4UsUzJkQEGtl4Ih+CKP5+9/B8Ngt08XZv96DlKVvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082438;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
	b=4TikaQpZDOwuwZ90bjfaqTBQEUukHNMxz9h2hBbCzXDRpqRh51aEpktE8VLqsCdNaSyI
	 1Uoff7sbffDjcIwvO0RMwBOgjV9qFjZggjHozuvHsj7NciLucux8JLKKv9cGOzOfNO5JQ
	 tpRxWsMPQcOnC6Gz6bHcIVlcFMZhG60Dk+BcRvNMVG2dN9yxDXOY5PWfiOB1oJYYdokRJ
	 j8Q8ejbzAqMJkDgbFkeUwdfjMaAMKkzgv2ZwyZgW70Kfhp3BUGlTFWW5HW7TjA7GjymEM
	 LgS7dUZmFIXCT2F+2nBBy1c2+XjpjqA1Wnl4m+c3HWV1MrmBZepW2mv4w1F2EmT/JJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B9606EEBB
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 310B9606EEBB
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a76f63b243so494594fac.0
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082437; x=1794687237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
        b=Gd6JKm5X5nWB6SoFwEQvdybpUODVV0wV+loaUfaGTewOhMbG01MjlcISRCIkaVetv7
         0fqastRZ4D9mClFMS5+rHSBMZ8x2jitPDNLuH50h+sC0y1ctxPUFDZoJ/xGJvaHMg3ZB
         +L31687BTBCjHVoF3O8ZwjD/Cfwi0lZa6xSqJDvSXJvgLXNAywkQIg8+mRe2NY0KVCYa
         Syx0KIiJ1sJQEqgHZTVg90xWhROyu2MVIfWO2B8DEiMzYx3knlSWBdTsnwMpME+F0B5k
         HJCvVUXQcgIgFvHDHMQ80gGNKsQfD7Ttz/MLc0TfSmAqUZG7o3Cx4ZeuAoHua4hW3IC4
         GRBA==
X-Forwarded-Encrypted: i=1; AL+hErEqSPdeIgXCb1PI4fnCTimxCx8x3pO3XcX5xnoPbY/iSAo+tNTkQvuKSWp0KJobBBwHYSWBnjTLRRynIg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+jVsJRf/3BMZLcJNffH7dv6JK2Ql/uaMx2zVqEnI8roxmq/D+N
	ne1UwvfGmZRZGSLOWeKThk/rBdun81tKKKuSZwUTlFcG2zkeNTx9X9ulzWb7TyprGbg=
X-Gm-Gg: AYBFou1ttyPhPbAqZzV/wW1nGyMJsD4MSEcdw8jSA7oW3Yb/erejlVW5wIjbQCvQogi
	Ei/h/IGxGy3/B1W+ERsLnR6BbXAOP10X9rC5aO61NFCmEUF9Ov+w716L3iZbl29rt4kjagrENJl
	RXGnyWYpa6fIoWaTqDrHjys6dCVBfsP5j6EBKeueoLyyp6sQn//r5HWBmkNJqDYZ0RMaVhkUgu+
	uYtJJ4RgrxiBsEVxJQJ7cSjy9Ra8gIYz0o1TnRuhQlPwGR3m6W6cdTyz9n2BmCUMK4y/saY5vvL
	jUgiwhVOJBS3a74LoGdOYvTc5+O8IMMrrZxmLQ1K1+AOS9KJs3WNhtunFzB07fP2JMRoaeQGO8P
	xKJgdrGQ96Wj6esby8EcOfRnBhbjOF3HV5SQtJtaDfRfKiMNDNby7XG5GNnE9sUcUWUHKGvoqyD
	u+tXAQjqU5/5vIwxtmU6NiYv3R6o7HBe4UDfJquc4I6sBXWmhNJEC+wmq5WmmeGJH00aSFWYS+c
	KPXPBN8K5aYmu3CGO6SP/mNdVhgntZxJFQMFBRAkBmIMDGIuPsL8lXxRPKkcPhgSGVjeIfRtAA1
	BB2TCo82V8jiJDWHZavqmRyRcYZfCcYeWGA/VsxgYwiQ66pIJQO0RRN9aF8M
X-Received: by 2002:a05:6870:9f0d:b0:48f:e0f6:bd51 with SMTP id 586e51a60fabf-4adc11d6d6amr1203868fac.38.1794082437088;
        Sat, 07 Nov 2026 12:13:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:46 -0700
Subject: [PATCH 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-49-0181ef0cc4c8@gmail.com>
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

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 42 +++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..9eae5002e389 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,33 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
+static void txx9ndfmc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct txx9ndfmc_drvdata, controller));
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, txx9ndfmc_release);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +322,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +376,18 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_release(chip, txx9ndfmc_chip_release);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +402,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

