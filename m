Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046609;
	b=FIXbwID4CctD4CChO7U4Oz44eOp2+E7v7EX9sUjB+nilJbAeXcmvQHisvdKGdpIPOoZY
	 U+6jpbazLYkgHw7fIYqJ8d6TqG6qJcsUWhIuvjC0yvOq0y9JM9UjY4Lmu/6+waldw6Kp5
	 YnGWAe6NVhqZnc7sgjaC8MMHi9F1p2+RHERVyFYl1G/rK7cKq1b3HHqvwLn3/iYsJZXOn
	 3ZUfpeTSZOsrZ8/IjapWwed8D+n/e8F1jmjyKDxHNOS1Qa8CgU8QINg9cd4j7W0wLYkH1
	 4eLoR6rspgHcwnmnXGDRBaUNrfmdMpDWmMQ8ah+63buvEj3JenJbge8He0sAziUj9YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
	b=LKPHTe81qi4MoiCuXbTtE4+NxDQS4guMowY7faBNr5Xi5CcUM0sVsAzSL7k2k/vN1ike
	 jwmf1p602EPMkZlCOHBugTA9ButoY3OiUy+1AipB8tqVCbz0bIUvMnfsVXA6+vPQbLMyM
	 rsgJcatOQx7dmVf0+3Ub1+V/9n7Rcy6cu4sHpOxrMPo7HNd5KX7mnf7zdfZLhJzXZGjRc
	 YIAcWowO96d2mWjA5ivGk525GpMfyWOZ8eSAKzhPxSFvhdRXvLTJ6HjbqioTQuABCSNVx
	 G8Mwau8BZZPz+Xd86Es6i/QSVs6P7anTNJaFu2HiALxA8ruAx+QqWTtG3nneIEG2DLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="smqo/JOy";
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9706082BFC
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B9706082BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=smqo/JOy
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8451a619da7so947090a34.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046608; x=1794651408; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=smqo/JOyqcdPjDf0gJiIJWy8GrRPGHMuQKqs3F+MrmH9ITHZTjfAf8o3u6hyBAx/jo
         81x+HARwoPh7+ydF62mHdxI4tloqUidbiIuJWdfTGAwYuowuOAQDm8OjbpsXT6nHHXMR
         XJ/Nyiodio2N7VVLpHIXShicPWoc+c9GnLJqOpYper6jIjg1xlL9MpabUEH/FrCCnkii
         x9npyLt5sF2X93yrQWOh3wbFFNXfdPwKZy+sPLTWjp4Yx4VL1JlQKKActveHAVSQBbnt
         LUkWVIfHN356MkCqjTG3BJyltK5eVkhPBASfIpbdemzukTxvntMX/VGxClc0+IcBv9Ew
         sO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046608; x=1794651408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=BNsQPQCBbyMINH1HlWffSL7BtABS7/i6V4AlrfEGRlIEaQTPCKrv9fFDY6nypJ57wH
         4JcsLMrESIJjZkgWMTa2KtjfMf/dMsqz4eUqYJ1NxrRIEq7xJcj8DV1vNHem9ODtUAf2
         Z0fSe1bT6f7rJOX9AFPA1Oi+u7v0LWKzqOTH4DBjH/NJ7UZ4vypkMbSB44BGBQwMunmO
         cbiVqJf29zXeuCKTITc2q4awN6JzP+hOD15EM+VUpvwwXeXGWnRC+FUe1voEw5AIXmC+
         ugdVkEOzTGhgzvdEvyYEVXDxdd735pAZEB+FBoCw332KvMO30XY2ynhs9SBVmKElW/7D
         SAxA==
X-Forwarded-Encrypted: i=1; AKwUvBxnpJmu4neW1iPUzSnu6QeR4ToNy+4SYE3qwkhjzU/7muxGp1amFiwF90VAs9glLVtBribsWF19Eprrxg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9dAJAIm+tvCPxOsixEy1Qyy6nIEvwws6H968VRCYY2YYbeb7kk
	UX5IhozQdg/KlCrKqa2coJa67MqbUiYSnC8308+3Zn42gseZyUmfnsgG
X-Gm-Gg: AYBFou3A5y8oaZqlirTLdWFru+y7v1+4Z/Ou8/xcI3kqTdwYWD9NisEBG6G7AWVgZz+
	g0Lx8N2NNv+Uy49i77jJHY7pxsskfVCMZ8OdSbC+GrFzJc6e0SHBTv7n13i/sSvfC3laB5ZzzXb
	hlv1KUKyhE+YjXIRuGzrTBO1Nf0/ErnvT+f1eql6+Y+S8MmJ5KUpzYy6OBtzrVhR6N5/sEBe2bZ
	60stSY/J7gJJPJyiWZnMNe6wbKLRYXuo8P43OvBF3kdyPMfWe0z5Bf03iwuc/ZC58jvsvQpWi2n
	LdCHGu8Hi4MqqR59jy+uhuc2K3dffPbU8w2NNG3SVlyG9sNzLzS7MhV99b949CXjtmKeISdQdaB
	wV8Zvqey3xMtYQ37/H4gUC5eQHSP7uXGGU0c8vx8XzK1aH3t2x3k94qa1jJgDNeYus2v4yqz4OX
	JWZHCk3FL5999kMRtbjfMhy+gK8dw3JezhMUUS6YpXsP9I3JgdYsfA9PrlKNWPyzhSM+XOrS2DN
	iV7w8YgbuUKy9aEo8p94FU+2RueGROFQUcxWR5C036tdYihdiE+UTVQTTX7vv2ePYZfdEhRK8Dy
	8SrQF/K4t2iR07h/7L9q4GRF6kbu/gHYCDv+sPoVHb68vHFn1fcJn74dIPov5+rFZ2SDFsA/JgA
	C4t5NP77KVkEwj7M9B/G8XO8L8F5NMfH4qL5BYPABEvpSH6bcNL/3/OP256L23Gx6cH4r1nwZb/
	6TPe6JvcDx/2b5gjnHntX7aByTgtXBOuaBT6b30BSTqLaVFDPao+fA
X-Received: by 2002:a05:6830:4486:b0:81f:b198:5b6c with SMTP id 46e09a7af769-85f1d060dacmr4931533a34.22.1794046607890;
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:05 -0700
Subject: [PATCH 08/58] mtd: rawnand: plat_nand: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-8-0181ef0cc4c8@gmail.com>
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

