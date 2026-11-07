Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082444;
	b=ZGrPt/qBh4eguB+vuivbhzSS1y/UjIPr9RPwmtQ49lsrhu0vfUCYJjEHRngecIRYnG6K
	 t4J6BrBtGvJP4kcNhAKazUF4LTKPwMJX62xpZbQmqUQezB69M5IOxUoEBCIiIeQDi/pKR
	 eb5lBqIFtWF71QV7Eny0hDtjOub13GeKg2HwOr78BfNR+Xvo7hOwTDGt//H6YWWfG4j9p
	 kpiKHKM4U9QSJ20kcKKlKWPIV4EjVsiUlA0I6bsQYnZBmf8xoyO8zTnArQzA8SOxqAp8O
	 MBkSwZ8qYbXO38rsnfT35Ke5J+3Z/PxOWlGF0HEx4WBX9o91lKNsp3owGEZe78+5iog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=7Q5e5yIGTXK7xHQdIJMFEChTgYJAM4yLdAHkjKqEUeE=;
	b=gx95yvQF34velbODBUxL0MBdV2Tvb8Thf5EhUJGKn/6m/GolY5d6RYRHClfvARAJTNUv
	 eVHneJk3t9b4P2T6gkoD9h10mYkKq9ICMxxR0oxnQxBQsyRe4p1dYIpWeaYkJIQFKraCO
	 0YX0p5MRE3Zk6Z+zwOw9ngYXrwcVSlejD873r5zb5iOReYzkE4Mn6TywdCKMR7TalrT9P
	 NcDgwCj152BoRezOKZ9I4WrLfAaAY++lTnq0q+O0Ah8k+i/gWK+iK6XqgxQIAC1RmHb2a
	 RbdNRh1zCaPewNHN03OH9PYOtYAS7syVLhB8EFbDPckHAJTeQJNUmKOD9yycHKPCtPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF716083627
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF716083627
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-48eee44b908so4065fac.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082443; x=1794687243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Q5e5yIGTXK7xHQdIJMFEChTgYJAM4yLdAHkjKqEUeE=;
        b=OTGp4KopvtAEvqzKIEsec+cDtiqJivXnsKzn8DfNEOVOqcqna0sE9gFpzu82tGIu0Z
         TGcNHotw/aNxIHH4+hFwTbsrYbN7r9KdEj3VM7akk+wdgGTt0GBUIy4PqQxdloW5R1QC
         3S+W0BCXfPEplRBCPPJtgsNpTIt0oQ3xXFWpjLAfdrzN6dP8ZdBf5PMU0PmsuIifY4Fo
         wdXkZQovEE9KrjeYF7uCYRwQ7pq+9K72Yal7kR7NqVFDNkC78HPbS+eSylSBHMHOJDbM
         xd5szQYlllb0todYeVITQM3WXiy/V6+285wB+/uExN2YPiqMSAdkeCywrlLvekqEuHmC
         GcUw==
X-Forwarded-Encrypted: i=1; AL+hErFFmN59N6KBgRMujyX9a+HCThtvdoSe9nDMDjgMEBtDM7eQFUBeGbAkjQLJ9yM/TYT5f0hgweDkGCA3+Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8o7J2cs1uXINZeorRuArXytxxmOdYl/7WU34WfK7CVM1nqis1Z
	ZyVjKMBltu+E7fHBO1lJqprbZf/CtOXdCeURIxB2ElRPlu9auTOx5FPvNAv701K594A=
X-Gm-Gg: AYBFou2/rW83tXgDuTbmo9lSFfCRtQXbxZSP7mHVJgcg1c3Ohzyi8x4fSCIcLIIWlNC
	mxjDFi7LEg3WVjXxHksALSeuiQj3L4dBnjsgWElvT5YiWf82xNy8j7nDyzjM27DIvPoB8mpZpxL
	YMeILsDxApA+OYezEcP1CRekJJap/OL30MCCihoKW2k1eEsLsGaurJ/JOQS7EhXociR4RMZMikm
	CPQTHgvioKRd1OFMUrmJ5NHxVID/Qc02o60ixOUdp0ytX02Ep25P68zFLFJYZAbLutIJ8tGF2db
	/RGOfTXYCTeXQJgbTyaH3O6u4z/7jWOHhzWptMTZoQcf0V1a1wQyyDCrx/x5tRjKmt9C150NNs8
	Bkvi79G6h3s4DkfdkIA8t5kHyk2yrWdrsAFCn9KI4nBn12fBH7srWhfnNFDsgkxvYKC8o1dvNXg
	6+H+Z0MuRHnd+xwFoMy55hhajBOs9ltQTOhsCkMLzh3Sh4Qit37Cy9gFd/fV0jXzHItNaahxhv+
	TuHVnMmsrpAlEmgx6O1N0Ea9yo1E1+wBIJJul6tPPcekFP2vg7fYtZPjFR4gQw8LVKMZ2gdYnj0
	HjjkaQ/8OPwco0vQbNXC4xD4QODxod/3WM5oNJl9DuECA+gBB7aq+CCsIPov
X-Received: by 2002:a05:6871:3a10:b0:459:fe2:ef54 with SMTP id 586e51a60fabf-4ad984fa6famr4620570fac.1.1794082442478;
        Sat, 07 Nov 2026 12:14:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:48 -0700
Subject: [PATCH 51/58] mtd: rawnand: mpc5121: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-51-0181ef0cc4c8@gmail.com>
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

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index e6594548b7e0..1618f46f69df 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -611,6 +611,11 @@ static const struct nand_controller_ops mpc5121_nfc_ops = {
 	.attach_chip = mpc5121_nfc_attach_chip,
 };
 
+static void mpc5121_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mpc5121_nfc_prv, controller));
+}
+
 static int mpc5121_nfc_probe(struct platform_device *op)
 {
 	struct device_node *dn = op->dev.of_node;
@@ -636,6 +641,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, mpc5121_nfc_release);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +656,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +789,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_release(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +822,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0

