Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046649;
	b=IFoyHEZ8J/Tp/vdKkblFUJIgwtL2R+tLUaQRhdelFXL7L3JDO2cFc9DBlRa8RGvgf42J
	 qVDn3R/mhn8vXln/dd60C0l9w0/Tiv0mrW0OpTNw7GhyTnY+2nlOkLBC/u7fat4A7uxz0
	 vEUaAI15THBXfgbqL/ir7ZUD6eHX4G9ZZcDnUR7ex4Z/fnZcZfQKNg1e/efx78seYAnnS
	 veghg+2e/IRveBL6c1gr9SuwgnJbDn8UrHcqtZX1G21DBhJiS6fQqE6tA3T3QZoIgXYc9
	 aANII2ZPQeK0Tfe+87lkN9fM/d3QZla5JpN8WR0hKiE8d0529bhUNnriPrOO3ZFnrDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
	b=UXJm+Fp+5sHLPe8ChlMRDrLEaAFpxRc8ZaPsX+Nm3iAgkza0hTiuUvw3volwNY2Ulm0Y
	 iU0VzLJe8wrI2cgT4eS+5QA8Pa/3LvppAl8+D7Lsn4bO0o1RBYp2wlPDXIW4NFVgNeET+
	 vEN1Z73kqvMZY+3dQvO5u0ilFU2XZFxbrryYJm63aUOeiIyVFtQXLf1+KiNLgZ0o4HAT4
	 cnPPWOneCHSNkcatkUl/HxPUAJI37DxLFFTVib2D0lmzsqo4sq1yuR+wtK+wBiepjT4NA
	 Qvgga0LPP/SjvkFKR5LdNPb9RItfYM/BLr0/Iw+Y3aDogMvb+1neNTmvr4JrK1OzYIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQEggsdv;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B027B608D964
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B027B608D964
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQEggsdv
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1882131a34.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046647; x=1794651447; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=rQEggsdvgebU2ZtqjBKsdDmQvdo0tCU/75pRNxPY0CZPQXDB0750kDcBOBMxPXesae
         joEKaG+ptIfAJvzLw8CK88u/2ldJR6BZK6V2a/4sIqwUqDDQ4WpuBrAECNiexP0SaocH
         EEa6y14aWxg3+UxmH1XH/Zgm6GEFmW2pgX65wZ+QIlQ0E1IZ5IKljGAN1gEkbPDK2TbV
         R1by2rqCtAEfYsF4eW9K8kN+7F38jv3blCrzgHIiltE8OrLhVn+rzN4VL1D28cQdTuEe
         U5cQPnDoDNzr7b8CIynI6H2kjMANSqIvc08WBcBh/Y4PwbtIwFzlrE9+Z5arVAHknAWg
         H7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046647; x=1794651447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=WFlZJynIC9C93uPH60jA+8V67mHkqfGSjZzjaytqgLocUq9776fPtulQKVq2G7P8RM
         zrxgTeqUXupL3H8GBVb13xC04Eqhp6Mwg8dGyVBCdXYnf8lHL/5f6FEzE3PJ6sr6IJGV
         qiQ39jjXO5eN2kepqUI++uEmPkgO+h0kZksWoj2MBkao+18BgWdeEfssRIYHoaoCrxok
         9578ey9Ylr1zb2V6oJjZAs3/362C3mTbJ49Fhnngo8dVx34ZlQxK4t0gMrDLkXFdn5DQ
         +q5EC7Qqg2l1RZQNX4a2gnARKmbNLKjoIzha1tFisz2q5ZqubB6DWM71ShtHPjqLpC2l
         PUtA==
X-Forwarded-Encrypted: i=1; AKwUvBwr9DLjdnT3SpkLciTCLjXTK0VsdsNzSQ+VpLOQAMbiocyvzQ4w7GT5kU0/JXy3FGokt/BMmgR3wOUzug==@lists.linux.dev
X-Gm-Message-State: APuU4Z9BcfmPvwKtX3zSNSgVeIwlAbzNL2LCpQnl2Mf13e/HsKFEsaZk
	xf6AqItMGnFyjBdHhQVKSjbNl9kv2wEgr+kUhALUdZB/K+3ObiSori91
X-Gm-Gg: AYBFou3h306ic0ZtfL+7x4Y1Tu100G+jzL5RExPak1FqxG0CN8K5gwdge/TXCDP7j8U
	L8VQ0b/O61Gt7c9/PmAZqoU3TrPLKOM4WFylm7ZVzm9zW0+a+Ft9AGxV3kxub1SUDtBJMNmINzd
	XHEL2blhb8Kyx9gCl7UB6oiBFWThhTX1o06LxvGYbl/iy2WBicPPjstyw4DYEkG7TwxJz7Mg422
	Vb5wbjkGKErDC2IL4LPPnPHHR+XqtkL1noG5+Ye68DilGgx+ibVHoi22EhgxSxI9kkXjlsmOE3R
	+6gwdMNRcLVO6FNLLrs5XxBl6FeEJZ+H+1UO7f1eXumFXNpETbgWpxqk/zcO8mIFLroAukyqAhq
	INcPrJBEGKOIhkjQlRKthtaARx+qlBTw9Q2R7et0oP3a9lLyXOOcYpGYnQU9Ww9yK4kpF0JE2Gy
	01Cf8DaJv1gE/7eLm9YxQYINvTGgHx6eVmAXLo/ytaA5lETQtUqW5IoldiiS8H+SB3BHM5jpQbK
	o5Q78lYvHd4eJWbDOylwDwiy3/sVZYYdECHrpjWH643RMCWaUbvZBKux7RYu386zWY4SUiW6iwg
	INNAXAEkVFttktMi0Rx6EY3G513LfvLJYcCvsAJLpwfB24nBcgbzal24PX0AOlc63kZnY6at8Is
	fHQDNrVXTGlSxngcadyOLwiuEre7T+QTUGQWgucUTnTlURA/h8y9UKzK3w9yaN8su2uPggRMSsd
	0WTslJAV+r+ZVt2leKVsMfvK1JUw/+mIj6nvL5A0ardqw4CKocVPU+
X-Received: by 2002:a05:6830:4c0e:b0:846:7d51:d9d7 with SMTP id 46e09a7af769-85f1d18bb98mr4287417a34.28.1794046647554;
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:19 -0700
Subject: [PATCH 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-22-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Release the LPC region and NAND mapping after disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

