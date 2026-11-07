Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046641;
	b=x2LVBifYvtW4OxTAMIx4Fgaae3cZxoE8OyIPLqEvH3vRETBoaycMGtGBIWLhgtmpQVja
	 rxlyzRBkhMHRuDO0S9rBSy3TNV/gIXuBOkmIR8uAAJL36l9pdY4cIl6262GXPD40iYI2b
	 Zrt6otb4exPqbS1qwx5cKxSxjhBGsovak3WQHaf7jsCUakXS2Zhv0uk107uSJX7XetTS6
	 o9irmAZxHrY7qkMDssOZi4R2Ib+XHW1RKvsAGkQ7wcyl2vJI3vCCQw5VpsNvZXDZ4wbRK
	 nK6TuxwYyWe73H04WZP2T+wIXH/c4tHGb+0dtmM3oy9f+kUiivfxV7OixWZcseO4JeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
	b=nNdc+ZmAtPcHBPkGtT6DjuiTqlFOJF0eKsya20lbnw5dYSB218YPODdhUUZBi/Ys1Z1V
	 Qen/YOTTTU9GyT8FoFND+krm9TAgL7/h1j1BtkR2wlnxdVHuiWsm98/vrAIai8NomCqRs
	 gQa5rnJ6MHLc3QfXHfBPPfnNCj76HkWLfNCMTxQ3YsdbmC0CFdRdpXPrSKLAiuV8Skjhz
	 Eg0lh0+aIOUa3FrIyE/ACu9b//YrHyLuxCodBz2rdRlHcagLpGgdMuuwU6d+Zgpv44V5C
	 8biMfJSg1CUnyk01u2CugSIRj6ebk7MneSbSQwPHbDPO3FOka4UI7nE6r9JJ6Q2DzTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLgdwn3x;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A54606EEAE
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A54606EEAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLgdwn3x
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1882011a34.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046639; x=1794651439; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=hLgdwn3x4MZ/yO2Vln6J75qoyjSNGAB0c7lxikF9mQhO89fv3I7GUI89iudecPFohT
         iIgSKZcTFgTdEpzlQohG4JEjBG3NHIQzPJTZUksjZGotKZcG79hJ7BEd9C++kEJUBWCB
         iu5oEN4aIgSmz7xK74Db3JKRNPmelQMmzcornTfhlMlgJ6mbPZP2xlCEUPu1zgBmtS3a
         MaQ4oiFKOvOZgAdIDgCsw5tetbQIotEV6YVMyx5MzsgIf2J2QvUiCrcYq/smMJv4c138
         EQ97luEsfsprK+cNRNj8uip9K5rO+Uj1Bg017o9aT/uNqKt9cBBx9+zeKmys0OErD9uc
         v//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046639; x=1794651439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=gPChmrjIP5/cS4E6a+oCCnxsmjDeWskj/loNN10nXjbgO6iM8VC04JPn3TmiHoFay+
         TzYh3qoxapNFCvZoJch9q+h6eESuDOLh8Jo7mO/365fNC6Zbo9Yx8rgPfp/wiFSPhdHK
         PYAAnh/w5s/eGC0NBFH7xW1MX6z8OOKy6nFanQj8sv1+MZETQUHM+NSmW7iIz3y7fR5M
         HM7VBp3eP/cNNIsizQt90/QNnvNb9eulzzR5ohis8tzbqeBKUW8JdfymNLkQS0jdCy15
         MYJAF4lH7OIo33MqKCfam7kG2Kv723apCcEqIin73oSxqPzsk8fSaHJPg3YuREjovmO6
         KB9A==
X-Forwarded-Encrypted: i=1; AKwUvBzrDmZjHKsKwqOXGrgm4zjHYGyZo3C4VSEN5Cd+/Jhd5WzYZ0YfwB8BNyVlI9ycW10CycEG9W/aVSFQKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9BNqwVfudYefJ3y2ouLpH9JKZNhQNFJb58p3Szn3BxYo+bbwmc
	K2jSeuruaRNLzqvtni41HQFz/0kYi2Hq/c1Y+jjtQMl7yStoHcmhSmfu
X-Gm-Gg: AYBFou2w2nuR8nBCUlqxV+Vyskamg7y6lxrH/C4BasHsrSkj0J/DGPAY4ibPSm8Uh0k
	Zm/+hqMH7WXoXbe8vS8miGx5j+zDhY5JefMhxAwIg1qLrgRx77vPQKGeqyUDsWe7RBIa7UMjomJ
	CtnOD1TfbWc9eh8Ah8nYYEpG67gbrYsZlC+E02mYscrBFCo44MEJq8jqCPY/6+JjGaQ5S9TyUZo
	IIk/uKDYgPrB+po17+vGoMJXuWa4dTTw3r/cOPWFwknS13syP0UW+m8g4eo6d0QrLiUG894elNU
	uERsJOtxK0JHVpr5UkDht4P3w4C7axCjbWWOLCks9su1DeCkiUC0tT7wiuN35ETGrBNW+qjLecT
	v5Fz7DdgomV4BqmD4QfIxvIVew3SfJ004BOqbZxkjiFsdol5dqa9Bm3eujYXAGFksdR4IRjSy+4
	wUhLfoTIG0tQcCm7GMW40Hdr7N7k8qrAePu5XyMQI6htJnw1xDLi6ntuu/Wmjdf+rkO0NWgi6Mn
	F0UB/bZMDEDotugKWPeu78mh57AFijRyf6bJm3j0NYUb6d0tIM1sViB7cE+f6HDZm7+irNd7KGL
	FwvGKbFyuCvGr/w/HBTytRzADAdxCjzVMxBTQ1ZGBoxZsURqOatgCBc4l9s95EAqD4DsTlIOkUa
	EPrvngz2qceJ0ZVJOJpfSpsVivrMBrFT4K9ZPZ/mY4wbx29b6CEoxJ8RgmDJwV0EBf65/V3cvak
	mysGxbGKxUQqrmjzuZTXQN1K4vFxQSFdmyvtOIaD08/m33KOR+pfl/kw==
X-Received: by 2002:a05:6830:34a6:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f1cbf2fa6mr4361234a34.0.1794046639191;
        Sat, 07 Nov 2026 02:17:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:16 -0700
Subject: [PATCH 19/58] mtd: rawnand: orion: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
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

Retain the embedded chip and its copied name through the shared
allocation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..aae054e47db5 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -96,6 +96,11 @@ static const struct nand_controller_ops orion_nand_ops = {
 	.attach_chip = orion_nand_attach_chip,
 };
 
+static void orion_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct orion_nand_info, controller));
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -106,15 +111,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, orion_nand_release);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +191,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_release(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +214,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

