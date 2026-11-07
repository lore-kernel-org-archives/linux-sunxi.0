Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046612;
	b=J/S86B6YHKdq2ZOQeKz+tlHzc31NwD6kF/+0I1e2MSZp1rTe69Fb6jkPZcADRXfz/iqh
	 gV7rB/iNgBoY8L39Z/Z1pgVNLyUWdh9epq8vk+giIdm3WNpRqT9ew0XjkNeWRS4KG4lpK
	 mzmxP0hoWgC2988c6JxNRw8SfhLhTsbxBVo6I2Zme3Yyug3vsGuJUsqgUQyeNVyQsyLsp
	 fC3k+Vq5pyP1HQeBM3JtPEAZ95m4GuufbbABQr0nFw/zWgA+ON8IZFLN0oHROB29LoCCU
	 05+kOHw+v+o87ye3aLHkEYYsZ4iF3eYD9pqED7HeTl60kVgMNBJJE7qfFm/PhosDCKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
	b=xTZd+WPeOq0PLMvIkKCeOKCW4598vKl4OFHFCQIDzYnX4fYBw5dW8ajq9aAubn4AuGLX
	 kN9mJXggAS+IFKfd2Xzd0w1dAOqkTpEfWCpjgJbFZfLzgBRf/SmxmvxTph18wTJixhEMA
	 +CLMQ8So4MdecZTFk+eFVy8kd0cLfmH+wlQbej84ppkx/Wdv/L8eqCyc/hejmCtAzJ3y3
	 xUgLHPjx4qAg0+KZOwI2e9iUF0exfleryOWxrkd1itkVuzZ5i2HpQFsp0ojnh/MjTwMu3
	 WQIdsiCQADiPlTtgQwL1ev2JyuicOkZhl55FJr7NPlTpENrydxnZvHkBva39NhFA0cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfm4XwpN;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5F3608360F
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5F3608360F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfm4XwpN
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-823e4047037so955530a34.2
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046611; x=1794651411; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=vfm4XwpNNCsdDJtSFxZR6vq7rFBDxDaV21HKbD6Donbb3C7QcM2+Vkl+bq+Of3DmlK
         Yw99AenAM5A9ZfiNjxGP1IYYY0l+kGgoaQLeJ2/JhTkwUDV1CgiFW5k/6my7RKQe6I2E
         2gQgj89IPP41+5WSb68mZQ0yMbiRTtyuEvy6+2Fve10vTeGL1/OmCtHYbrpNF0+dULab
         ilQ81lU9Mi+uFNOKy7BpxJVqymYE7DP0wLwBO1CHl6xeslh2eRDrFuqlxAL/T5xKvia4
         5pFmTKkRkNMKz/MRDEJKDCSyfP7wcGPi3drkKuCozuOHNg5RY30P6IpUvqLkeNF0fGgN
         nziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046611; x=1794651411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=ZNF9Af8LpN0hsICi7FqosNRIYgC/ZQMu/zNUiTVogy7LrFozxSgK+bN79eIdqV483C
         oUtl/OJppJBJC0AdrJv0nfoynQA4VDRJ9Dgzky7X5sHNFcFxzr4qZp3Sp1rQw/UTmXdj
         Boivy+sgm9yKNlVtKqKt/mV2wmo6GbRZtE2NELFrHqAV+l0/ENoIZY64RxgdFvROh609
         +nbS/dUlIIe6+VAWJ5bHt6WdbYvTPsZzUpARqifSEYIBz9BuMhrtlFFYS9WkVVUxNhfq
         EBCft47efBV21N56jWJc5zcWQAXa0ucWSbRTjqg6lmGvlfvOoGfv5wbu9qaq05Dda59q
         ZqWA==
X-Forwarded-Encrypted: i=1; AKwUvBziZtMEXRAKTypZt/EI736MGgKE24bXzdVtVnyOr79YEuva80a7ocBtf7seLHckeSAtkl2P9ME4g4LSGw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/DZ/pUDqHkZBLs75SdWlKYB1tKCqGdhEnPAyRoKnICKne5IVo/
	a+D9+qsAe+pT1E4G26u1qmfNO4Zi4AUeZET79B6py7+3uvfsw9ZHpvuB
X-Gm-Gg: AYBFou1RUBcPYoN5/H5vHlwxcewiREXc8hTDkF9Z9N8AEMYD9hJKq8EombmfOAVaMAi
	M41Y0QX5gcFt6toui1BhlEwf/dCrd/AOj82iV+s8PDREMOIF4iChGvN3EVKYcykwU8hYdrRw7cz
	SJofFRR6GqhcFE0P7IPFyBQs/zkG0/t5egxbv5uyywelfBdrFvHIK5h8pbZb3yuszSID5y6heRr
	p1f42Kv4gA9cKwbX87gcDBsDNYhPEvzA6PoxHE2fxx+nzVQHFtrQzG28lMwuT6FN1xDtDR2tAyF
	vODBJDbWHeS3CipEBnIsEV/KMsqmBigw/veQARTV1pD0ikOI1gT3vVVgITylP7WDNVPJOd9m2sm
	JOx0AZvtl4Fef2NHeGYNJ2DOurLTz16N8bDOOYy6LN+cEY1aV87lJw7DfdxUVGFTJgYp9TDTyfG
	rrrnKkjuh+B/mFnJNPVrUt0+YxVHVBWH5LxkLnzMqmrwt1cc1E1h1Rm5+U/qgZXCEKcn8t6QN+y
	/cMsuPTcwZqdpDBj6lvS+BqHYoPXAY2s2wRBkIcDuh9iN65ZNP2m9YozLnklrUhrT1xvxZV/sd1
	Cy8Wd5EmDI3J+l16W2hWdCnPsh9tpUWAzA0JUZzrfeLeRKn9zVp3FWuu/BoNsJkXqYgL1knizgb
	aSBx1DCwBRCff0Li4mRjG9B6iXqmwE7s2lKa2yo8FkzjCeRTerw+PfqBeDpzd9dtXyVWCUacrHz
	EZ8RCDIKNES1jjuvCWHonPZUwJjQxG7mT4k/Afa6brdveK8cWXV16xzNIEV3Hz3tAHnsaQ5127p
	w==
X-Received: by 2002:a05:6830:82ee:b0:828:d647:332c with SMTP id 46e09a7af769-85f1d0facf2mr4771818a34.25.1794046610805;
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:06 -0700
Subject: [PATCH 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-9-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..b6c98c374e39 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,6 +265,11 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpiomtd, base));
+}
+
 static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
@@ -273,13 +278,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +300,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpio_nand_release);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +354,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +382,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0

