Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082391;
	b=HFAroSiaCYhEhWPkue0dhL4zvYQPZHRdIARdnHMpOeKBdUAj1SIklQKWzJXUd9eML+fu
	 SzB/BcTz/WHisNj7ElFbqEBzU84HyMi61f8CFJSaNQSLrYZHdAO5a20Oez3zRb0dEi/8K
	 GBJ10acVj4O6L0fwaVaTKDk21/8oBqnNFNz2pcFWDug0itD9HIe48R8kDeiO+6d3MXbiW
	 uydgcvZglp7Tk4O5daAOyxKa6xWcqyq/AAGPfO0cdTqDwbi2P2//tN/Wzn7GE4W0vFz0H
	 BzuCriK5qTKEtegf4a6NBPyLm05wgI7s01DrW5X/7qjX8SEQMOtfj/tSI3NzPxINQmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082391;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=VloKSurmIYFY1UFfVkwmy64gkSHDogGYCar5RGOv9NU=;
	b=4ZIL3UlipRj6IVYXIXGr8SotbLBRFJwHuX/zvmok8jP5SNZkkPciu7thsloEyBnMhs6I
	 XuBB1nOdb5ztAtfcLWjDM0+IWpjodJcaLEhz5IrOZAzfPx/tMZz5XFD0oOdlt/E498TDQ
	 y+pwC7Xapi0vEgxqaUtXFPINRpAPzZMgV1w1sGjdDj0+1V5KrNiPyikM7BY+01mti4G77
	 kEqpwRZcCOjhRKY9+9d4YKq3/ThQbanc6LqkBiiLHjXQFKwW+u0hOuiXrPOVZEJUlOuSK
	 EQOYyIVhZCyyqswlFrWoPi7khrLUQpvd5rF2gdNt5a6AXmmcdFRUmp3uUtrLKPdp8Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34B606D82B
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C34B606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70b875f6f1fso1601469eaf.2
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082390; x=1794687190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VloKSurmIYFY1UFfVkwmy64gkSHDogGYCar5RGOv9NU=;
        b=VfyJ7sLiThOTTYAsBiS5gi8wnkLbUfzyt4BQE/5LrsZP/PyxoEjf/C4CkVp4DzZTCM
         p/Njgt3Dsfwa1m8T/O+haYwlZgVkU8ikoVjwahF4vC9YELZ7esgy7HPfPawwvZ1hm5Z6
         IqmKMy4NSXs8Avz75SSEjmconC5VkXW8Es0zfoU74+KRQETnHoOWHqrC5l62u+emozhs
         96qsLtPLBYVGhW+6ej4PgOnwpYXi79nrXvRoGYtEkEwHTWGhuv0ZI0BhO+Dl6Pk2J2FF
         IqnrNkRXO43druHhXoMYggy7GWZmxP/pOk6/2/TcDPyeTMtfzrs+c52sHc7t+ba8fBiK
         T8fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzA2xABMiNfcj/G06Scj50quKBchAvKVc1qgSyV6WCebm8/ZIqsEOEyKEZKGlZP0zR1/eWDOCZch41jGA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9+S499QbwdO22vq3ONIjIo95VGQ6dcVYuA54JYQMBYDQf+28SR
	JTYZxa2LotzOdzGP9Wzd6dNA7y2rnEmBtI0dH00dicTN4tGdEgtnwj2aO04bCUL+PS0=
X-Gm-Gg: AYBFou07AVCSfjQtUskUKEKUpS7SRbO35IR8nLOPHsujVxM3+BRsThBJphkEtfKFGN3
	Cij4OxlxQVh+aLnQQUrmfZcQlmnOkw7T+xCkvm6WGd/ux6ghAukq2h18QBwJdFN+P/80+3+TbsZ
	nW5k5Ll+2st+MyTQAC5cioqArpgMdVR6mT79C7hCrAgyQyGTWbvzAKzwpZL3kVA00TJBna1wDBo
	Dhm/ZhNMK4/VqNW6TgjDV3OHvjapq1Sr7os13+/ZXDZBFAH6XQ6vTRHcSbhg9auV/Cb3mwjQJB5
	x7sEmZ9RRCwUYK9XipYQ6l4AlkGwS9N/FAWbmZIrkCJRMzU6aXn+lWq2zi2jjlqd2pTTdqusMia
	FBQ9EPwkLb52f0opbDsCkTeaolomAeyqjXMgIYa01qWfXn8v2wsnJrG/2ev3E4/bHuMY/HGfTXk
	W+2Fg+2eYAQOW5i0hhWSBwTMB71hzG7IMHH3y/xHAvIzGgcsPIqHZqmtNlXdwB0WyDT34I+rnYW
	Zxu+VexE+7+ny+qCUOvzW0Jb2YSxHi36qb+5qQvzT0qfyawISVr0GQVY1UQv/QVMWAQlJ3P3D22
	UH1CMLKDJ/nF9ggrCVAMVsWiFVV5Z9HBdlDW7DFYI8vPBQxNU6CL5G57uzRz
X-Received: by 2002:a05:6820:838a:b0:716:c53c:3f4b with SMTP id 006d021491bc7-7170f35914amr8104eaf.88.1794082390463;
        Sat, 07 Nov 2026 12:13:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:30 -0700
Subject: [PATCH 33/58] mtd: rawnand: gpmi: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-33-0181ef0cc4c8@gmail.com>
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

Keep geometry available after removal while releasing DMA and clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..cda3bbdca928 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2782,14 +2787,22 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
+static void gpmi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpmi_nand_data, base));
+}
+
 static int gpmi_nand_probe(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, gpmi_nand_release);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2851,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2859,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0

