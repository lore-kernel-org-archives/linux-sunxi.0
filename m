Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082376;
	b=ujEVrmukUmKpQpY1nq9oneBOitZulPtx4a1YVX3Zo99cR8Hxce/HO6pLn9IPw0TEw8hr
	 kCM9/KiifWrw1tS0j1s7uEly+v06KPNpu2U0RuVhSVfU9GckR/jwOjIjENWQYaDfB3zya
	 yngeV9vc/frmV3Ycp1KVXRApyA8bEBY/UQ0ibGEMGqn4J6p+pquPrPW+jlMc3WYWnSYPT
	 l2APUQe1iY6/B4wAkUPapUI17lqa1RpTRuiVDa9KirSBqR4e4G/C3/iLQnXXRaxSfq8kw
	 j9/UzBJ5DqDLriufBnMnpGbTS7KdR9tcHzc9eU+irO+IXZFxH/LXDrCmlRlExIKm6TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082376;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=WZWF34gOVCDoNZBsFNBdQRVzEa1ZPBim3Drz0tOLXU8=;
	b=GnCqaPT4ga7212J2TARRPn5LpqkUGVAOvTzhk0apJmBBvOsrXVL1nXwRq81uLRtCrbZ+
	 kr0F4IyzcaZDr2yfh3Hs5ls8/OV+LyyEbNC5MsS9Gm2/nx0y/9/JbmO109Kym+DsA3lBx
	 b8J/8hdWchELYsMNg10Qyc/NZoI13I2laG6Bk6nRS/IUyezVgbaQr4n8sl1E/xeRZM8Ku
	 PTLbxTLYl85dlakKGnHcRpLHYOPt8xKxt05qxiZvk19QiklDafmLxyANE97Bhu7MXa7Ni
	 8C//f2z9cYi1CE533i2G/LIVAJT0oDoESOVJlAmztRCm5JyaIhLWJQU9PGTtGmQs82g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C8A606A33A
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C8A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716c0217635so29800eaf.0
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082375; x=1794687175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZWF34gOVCDoNZBsFNBdQRVzEa1ZPBim3Drz0tOLXU8=;
        b=AoKgKIiu9th30pY3as6juRkryMSuNUT0iYeZBOKchOZVztZKALAQgWotopb/8mJY95
         DCm874fp0+OhiGKANBNxSzGE0aKkRHUjyZh2U5EpefTIqnI+IlaBYacBVc6M5mZGdJ8b
         Iln/AGuRTMPryDcDXaYVICeyjafpYA8ITBE5wcuZgJyrTrr5+A2aErNrz2+901s6+kcy
         BqBay4zluxYgFggMjGnjpQS6/Tyt4x8LJKylM8Aic1KuvEcdEfo3838E6WVQ+KhWxLm7
         ZxjK/ziH+hP2Js9B70aMiZqN5KNMylxW1jcd6oFxdfuxVqL4/nj8GPu6BNLrcIIPSK+n
         BhjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSJ1Ik0cQ1nalMUVoPQUKEKS8b73hbaQ7Sb/zPZt4e0gz+VX66iyK3zXSiWmVix39s0+NLV/MPdZiz5Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9TKnG8eBL1q/gIDsY4FIaHLE5QeVFjjAdoXZt1FXsYH+hL5rtP
	orERTpjBYJ5deXX32zNLt1pBftKbd3G6o/BE/6Kxny7oGnLpChcoYRpnCjeg+ZQ1+rA=
X-Gm-Gg: AYBFou3HoofSmWpfdm5fAyIA9RM6i6o12Kz4foHdAceGpX1UqgTfHY3y+j8e5UULUTW
	CaDWytAE69REVTZpI8CTDSNVQz6x7MQI0mfPzOIeB1eJZcu/jPcNoRSEH91ptebZ+W87CnaJgkO
	iYztQeKVIsD3UDXamg42i7nTBhB8S3M9FaW8Tv3OzsjPeTWtb+1BXYIK4asZDPzas1cwdVz+ASf
	Bpyt7oC8P3pLo9HRK166LUzIEKFkyd/aRbqPgDOLH8kgYdWh5doY/HddN7peqS3fy3ivhD/t6TC
	JAswE/D6/+e5OdUsMK7D0gOQ4no8UpYDQkL2L1d5fvxE2XQ2F2CnG+sZn2gkPYhD++SpGKQz/+s
	m9H6CWQkGov38qmEKTB3g1s4XQS50vFFQMm64ucxZLaLpBOBLrW3FTUEgs82AsGPw7f7afoZAlu
	t2lcjy8CCEZ393X2oyua3fxheQQtY7cIJ/Fjj029s9WGdGSNhKVtAZq0qlODwwS1MeW907FI4LP
	h7H6d+jRbv60DaOF1g0wyKWqWOdqGfsxvV1lk4CUOjShn2LPUsAXTlH7DQ6wSEc2tDqSMAwjoZG
	HN7666iAEuqPoKo2WZs8+Gdlx1Kuoe5/Rg+1WF0eWLsxj9Yvk8v6l6Q5hTPQ
X-Received: by 2002:a05:6820:3091:b0:703:6903:75f5 with SMTP id 006d021491bc7-71700d0c858mr1254161eaf.39.1794082375047;
        Sat, 07 Nov 2026 12:12:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:12:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:25 -0700
Subject: [PATCH 28/58] mtd: rawnand: loongson: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-28-0181ef0cc4c8@gmail.com>
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

Disconnect the chip before DMA resource cleanup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 8490412d5be1..49938c7b9453 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -869,15 +869,26 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
 	return 0;
 }
 
+static void loongson_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct loongson_nand_host, controller));
+}
+
 static int loongson_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,9 +901,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, loongson_nand_release);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +925,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +950,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0

