Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082427;
	b=WO6w1P66+r0m7A8Kiw1M+n59O2qTc7N9dfhvkyAO0OlKG2hs1sUwduPcNAU4tLA4b6MG
	 eyOOekD/ETOlotH145Q/m31VGUbtrQeTRJHuOADF/QrA+soCuAQNTsIeB1HEpk+/VBRKv
	 YsjZX24YsWursIqt8S1Q2VRowMhCGuk5/K0vMLr/t+5wmrg0K9BdxG5/kCYftmwCcCahF
	 voQIgk2edZQMUCnMdU3G4/Zs+WpWEXpFHskgI5Xa1rE4mRVxAYCRsmgmaI2+JPmutw9OD
	 QPaUSbIlcFRo04F3spR2jjWUVgQoCJ/Hge0hFU+SVvjo5yyyrf+Ur3bs5MCHzQ02DgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082427;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
	b=VWHyprRzzL0FvCiP5Y54WnYsqqyi8NGMIO/9iMRdChjLl2sTfHhA7z4/npWsbfV4CEgP
	 TtK54RH+s2PCUA5hMBwcwBvTOb3zi7x8KGvUP3n3ux0tHQ04Dm8Mt/rfIbG6UN22iArYN
	 sBntQRawAMgn+phM1O2ZUOKtOyDzkjLsWvMykE28Rvpclyy3NaIY9+7aQNGRoAMuDMlXd
	 H4Tf4Z88DGJvT5UGI0YIre6rsFMFiNxsbZzyVz/ypfe2jNfLTW2UK9Ao6IYSKzhQzpqws
	 hj2z82/lbTskU0JcO7y89Atbg6hlYpoqk6j0+sutyRMfA/KFlJQW1ebh4d48zVlmo/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911A16082BFB
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911A16082BFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4f488ba6e90so3111b6e.3
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082425; x=1794687225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=vZMHpq1oofZesAmWGblJ8nqDDwBMCrZG47v8VI/HHEmH3KrmODvWfDUEGuN9+1TYQ7
         cjAEOEFPW14vmYKVJ2ENC6SHIwVWve22xz2WLyZhfgeJeSBbr+uFIxfWvyCDsPbQuWtB
         1CJL6isdOUBUZ4k1rFjhQ9dfo5riGG8qulkiM4f6/vxJzaPMebCrt10N3Kr+ayKrOM7U
         dOsnTTOZVlBr+UTD/0jsb3+LLFrYpmilHAgSxHVd2OsC8LZ0EALQCt1fBYiUhjiWKenm
         0I/WwJ73gATf0sTRAQrLOIc3fJ2/SvmY6Nz1RIqgjC7QyQJIkfUPzdtOUyQky0PAhlIr
         bqKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr5ZCWs7cn2pqToGW+ZAwhTExn2z/Xn8noaGwTI3usVk9FxCawhl9fONwns4jvkeGJxE6Vl0oNeHTe9g==@lists.linux.dev
X-Gm-Message-State: APuU4Z81FUxzOQ+ydNnP0bMdUUsu+9+jnfnFLkYQ9KRyiEKvahi0rscG
	d497orguzapXCs9lW4qbOKCg/zKJgmVp197z+jMBj5Aq7TGblEpOeAk9adnEhJIJn2E=
X-Gm-Gg: AYBFou2yeRrN7Jar4irYZjQS3n9SbrqSYq/wtc3qksk65HM+efE03hLUtr3x6JVtnGs
	Q6HldBFaBpsEjMohn/UG7EmQ0MUSzQmJ1OK6GOasMO7IH+N81anY+PWm5Zbm8Q/aoqDPvjb2c1A
	2n1ML2qu2/L5FugzyX5fX6tYW6xppn+d9veBpZ3RCoUO3z9nKu34C0XR4lJ1QOSHUU3EGnV3zKy
	GuWb7UfzRVa9XdcmOb3AXth7dlIOkFTn2VEqbwCItQVlgXjFCBEzIsiQhsX7h7WKuWt8Moq7Osy
	dJGpCVPC0eixSzlDJm11DNjXV63+D/jd5W+c702unGZwc6uL9PKgMQevvr55WbMECiJeSSnQ7qD
	7vQFFQgJyryEM15kgfQrHGz6Njx9QJvhwbkqbpZLtP8oHGa4mUc4WxgxD89tUkEVjPb0CzXmSUZ
	d7nXtOhHyxqzE9rZOp+w6OuIdYAI+fho7qDiQHJO3ciefsPzZKvp5OKff9lnt6TzYhKRLJYMhaG
	EnPA5kBoGbxVInFghbffe3MJAeq/zexgGGwnQjK4GKj3/5ia/C1R4mRRiPckKi5EPlSAKM3nL/R
	/MoA/b5eWfvMDP19VjnFs02u7HBwTP5AB2TaoFM5Gak+tWFpaeRXG1K9pKeS
X-Received: by 2002:a05:6808:1985:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-567e115e036mr4539353b6e.43.1794082425397;
        Sat, 07 Nov 2026 12:13:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:42 -0700
Subject: [PATCH 45/58] mtd: rawnand: sh_flctl: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-45-0181ef0cc4c8@gmail.com>
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ff..291d809d0ea1 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1109,6 +1109,11 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 	return pdata;
 }
 
+static void flctl_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sh_flctl, chip.legacy.dummy_controller));
+}
+
 static int flctl_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1119,9 +1124,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl_release);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1197,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1223,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0

