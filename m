Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046651;
	b=SGaU4S7KoLGrlSIcNkSnnRnsZmtBQGBEtwcBn1EbRUr4VRZikwtQ5glX1gCjjNw59zYw
	 GGSHqoHZYIbcoFJ74NIgGwb0UWMjmYZrPcK10acbdjAeC5S7dyqk1qXJ+BKwsz40MNuMd
	 +v5A5PW7u8u6v66HrU+QONdQh4eev9/Q0OBswYdFkySC88RGhXsUHNJGZWYMBQ6cEKvNg
	 M+K1Ium/AR6RTnMwc3rQGcRy/hAsC2Zb69luK/lJghQEV7sGUvy/6LUOXmRD5pgfn9+wM
	 qWB0qP264fHP9JWGdEV7FTxcZ8hdAY3pd0IqWkFyIpCq7+dHKnTkC3t6c6aNlIhNPOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
	b=d2gyKkw+9ebwnWeFuljhZMj1bRoqXW9tR0D2xdzfiSgJ4I9W1eXMTqJ+sSkyyIcwnCQM
	 7ssZYyKOVcEsAHy+NQeXd3nQwwlcMavLOP86gZYe/BHEgI73mfaCZbADo0FdU13b0G4Zk
	 vh479hrGV5NmF6UqMF1fiqhqXQyyp1I2yAaKcGdPI51M11W+vh7bkkjkqFMuH7jSQaILv
	 nRnt4kgeWUI9BxeBUTjL1c0pHYBaNB8JgLhXqRt6xSqr+1VXj9rUxiGL1nhZ6uwVzAeGP
	 GYEm60GsrmBXlI8BMmC1gZyocUu7unvOcIP26q+Zw3fbgvJNzdl0w188IroXgY5vNDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgob6sAt;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C1606EEB9
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679C1606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgob6sAt
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8439fe796ebso990711a34.3
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046650; x=1794651450; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=hgob6sAtS1QOIO2JPrECc62+ANaR78S9oZ5eyKHjFUivxgV0/KFlBDxBo/c+J2SBxo
         4cJvV9RZRY7nMWp2LqS2SEQsEtspb9EFOq2KTQACxszjHICDZnMbhNuXiOKMr8CD0wmh
         ZaHXeiH6gzFa8igyFRG09ym28+VEWUlHwz04f+ZXUNa6r8VN35LmSwE4CfwSlwQwq4gQ
         eCUse3+kpS2dHzYawBXOYT1s3b0+DtpS0UNJn5XJsMmyfYLu7og+LKJVp03ztFxCZMH7
         IqZ2Zo4VVovpfjFq9KFW5sS+FFVRgHMI1mIxcBKoT6wdbrOqQpL0BCt/RA4A+fQggfgV
         bl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046650; x=1794651450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=eTeKQI/2uRmRPKmnQ8Lof0W5jjDK1d01kyx7Yr9fhciD6LuCWapFVEdYMkv/KF44U5
         ihzOlgwITOSWe691BhkJ4R8W+6GhQojpLR7t0FQqtGxVXkGKp0N6CHJ+HgGg8+aZBSBY
         4jiERix8b/uBuhaPKYTWc+tcCp7+7AOG21ik5Kh0oQVJA9qixQn8SQxRA2UB4KmQFBJv
         WRpyeA2WwLSljbYRAZcTI3x6psFyqTkBveabhogAUDxqhcVd64DNn8dmCD3xVQBxTnp2
         f1mJN8ykzRmziigBPjxmiL2Y/MPGGEJmX1xVKnUmLdpX0eQznOq6v0LvWvjPvQuyk8Iz
         2Okg==
X-Forwarded-Encrypted: i=1; AKwUvByVN3VJ48ZhDlWyjpwnRS8vUac2HYt6xzEVEkpL2e5/NLULdVDz5phHrlhYwsqvyrqkPaI3gP5PBPZepA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+qXKzrFEKNYbP7qcA1BX+JN98uNkPDfiEJZFq8PP4S8sx/dfyt
	OvZoz1mn7onvJ/0WeYNueS4gR/pkRBCZI4mqNFmMMHvP1+xqgy2pn8T6
X-Gm-Gg: AYBFou3Epvhas23oGeTi170deNd1K+kKGssIadrdztETcMW/kkRbd+Ie6MVGREvojsG
	GMF5D6PiZHz/gCwZ8RUqFh9WVb1ElYShgYTs5BGnKS4RhnZGogGyts3Llx1WNzQ+zDaCTuji2fg
	4ZnSsZ92qe276W6o47fspYDW+Qv0glb7pfZBcxp2HSXRxYhH57/EVHAV5Ndt3lxF6iUL/aACAy+
	vQeOE8J2E8LN0gxj0gqofHV3qrwS3n6Bto3ll6oHWLVm8KqZ3fAlwHYltXH3SIDVVyoLTV6jRdB
	oYEkhMgq1r+YuuH5XElhUrZ8iFUsZDcCM1x8rkeCcK3rzfFW9PH/CzHIQvWXomBF92BPZNZWNAK
	m4M/BEKT1D+ZiZDVNkjgyTqcDb2oXmmgOle0ps83Z8Qxj0+01VzFeTDUMixZJAzetogv0CzqX5Q
	dA1N9xW71XrSW/58lQtiXUUod4TQzTNNTlsTqbCGQVY820zPvpHh7XZqEIMEnLcvqKAlIswLWFr
	MDLhVauSZUHBhPNbcYYrZWXR2QHUaPtctl2u40QwwFbn/2OmnH3f3T7yW0GpsFO0WCytxmye49m
	aJyfMujxjYVtMmBWrSVy8OTdSjbhDUHg6gH1/Ea5He6ZbnKXyE0FjFa2aPM8vm5A2FnSUpOZXL2
	Rf/1XmTaaAxpFnMaNFt/dRRDhdUaoy2xvsIxBSB22wNYJmi67PynqIp2R+MGPQhgkiQn5lpGrgR
	yrYbBtU+fXDUDPiyO6pV2f8EY1KO2xRBgY/J6LDHh+HfC2iT0c2Qu1dnrX7qiGcbQQR9jPEGJPl
	Z4=
X-Received: by 2002:a05:6830:6809:b0:829:2af1:a07d with SMTP id 46e09a7af769-85f1cf0ebb8mr4412683a34.5.1794046650417;
        Sat, 07 Nov 2026 02:17:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:20 -0700
Subject: [PATCH 23/58] mtd: rawnand: ams-delta: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-23-0181ef0cc4c8@gmail.com>
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

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..ca3fd966c4ff 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -233,6 +233,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 /*
  * Main initialization routine
  */
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

