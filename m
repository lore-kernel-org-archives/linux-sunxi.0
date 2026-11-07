Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079355;
	b=SnMuABvoQYRl42UBF5GgRVQa1vVxdbpuAF8sDzFDz8ewtGwxX/7CyU3l+l0r9h/0k5dN
	 ybwf+oA+2mNX1k3acnTAEUtoI6w6WSxmho4zzqZCLuqBYb5EPD4y1LVlJ6GpGZI5bPMhg
	 a3Hs+2UQ03IJ2MLbsjY/a47INoqOhr9chfIeuT2Uef0dE4A6dVfgQkyBNQVBxpA3BV4rA
	 vPSB2seps/MghLATTNPy5yXlFUmSwJQgcE4Lhmp6SEKeR5RO+XH/TxzEJTzPe0LhPwvyP
	 X/5llCcyfQYo4DIspt0F4sn3QgRqyG9gpANsiHMRaNw8/CQxW+YqfIBkmEj5Pv5yWbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
	b=gk2j08kieDJwq2LUpfjRa2YaUzTlAAOCUspZlbrD39o8Cv40YYXFi5xeHmJvyoLbUSRM
	 LqmZ/Oyv7V8LWHQSPJEmfCAlQAEHPYXeDWfGP2LWTEkTS/nRzb3PS4ENaTnqk/O8iUbZ8
	 Wcx5+RxrVEq4qlvMTCVXKdQrm1xuCrBgeFGe0v8P6woW61EF9w9v9Q3X0usJWvLLGlGl9
	 q5oLk++/ITG8ggtMLkDIUMF+GKSSHqc/yoID6/VwAn1/FlgLZ6P9VjKS4J4YCGqHod7IL
	 sej8wjP7Apm8XrgRynOzE9z7EmV1S54DUBM/U+j8Hpp9CurzZS8T67StX+c3/fA1FeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNG0VmIf;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292EE606A32C
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 19:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292EE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNG0VmIf
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-46556b9e02cso500457fac.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 11:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079354; x=1794684154; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=JNG0VmIfLZml8fttdl+uxuLKHv4dI/YQsyQJzswmDeArcSHFQFVwBj1y0fPu4GDQaV
         1mHf2dKd8ioCdROqcFduSvxliikz/0J65xVeeVCB9Qf/bwfE6qoLYe9d3pLLHn1yHeDg
         YBfFld2iJa1lHkDDiWi1DCvrTI3cqf8qYLXncqyP7mtrGJr0ye9MiyA0YJGwtAW7mVe1
         EkPREYCJE2RJlbIhpGPrTlQ/uM7K26Ovhj9LW86kGts0qS4lIXs/NpTmhruCoRv6jeaz
         ycyaFJfZEaPr6foIBhPKJBSptzdhdwcBCmI7suU2rD6t0yHAuW2k9alZRGQ3HctppMcE
         nYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079354; x=1794684154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=BTBAHZ/Gvw03QuNNW1VbPwcm42TpsoLvreoDZZCh69c1o8zf/UdLENlViMpQCwdl9k
         Ek0gk/fxo/PE0qrx8JfS5pswYOygvU8Eqgwyd1a2Zi642Os8QGBCc69dQR2+sPQpu17h
         h0NQf3IJoUO1BR/KfllqlM7o623URtJT0J1ZQ2wrOpToIVYuLoDO/mVYW1ZA1+GBz2j9
         3b2HRMCmejb8xh6Qz0K+/x3FNdi1wIASJmZF+WcQOR3uZqKjJz+15mZkB++eQ4b4zSlx
         aF8UoNk/14t+Wg6VnMw8t0LECPCMZS71csMA4qyOplwW0AAVdqU53Bw86IpKT3aG9g6I
         bEMg==
X-Forwarded-Encrypted: i=1; AL+hErEm1XjUMzCll3kbRF3Z7Xb100bnaryM9ktmDfwDNGCX7ma4vKvMcyCwsxTMXOYSYJijLdaGzFKE44WWBw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8wgDQOZGFV3OyCjYPj6OC9vFPAQorQBuj86rWC4XEpFJ5rQCbL
	4d0fk6LUaVd2EhU0w+vvg4e5zQhegqA7XHnQCFxApT8IM8NyOv3kyw06
X-Gm-Gg: AYBFou29wsIGYgjFGzy33PX9cmJ5tJarlFcA12vvsZBX9TpySGwzThIbnQmXieFZhfU
	tD+tsAfktHQ66I10eKXv9eRV/r2i25vRInn65j3PHr2DUFZREiXq4NlB7jrciy/KtWxJVu5/gAq
	yjwK+LqpFPWwfZhDiDBF15LdsS02tbfE/JuVJyQSEeeH1IMB0DksFxs5wID4Z4L0r2garVqFzc3
	xfs1jIQycAsBa65uu6SLAZPEvHtYVjSKNDqW2sfCh1bwo2mvZbsdQybHt6LT/4SbnqVy4keRobL
	EuMG5PyKOD6NC93dCSNynxBUzUnv0dyLq5ocPUnfGHR2BpTVkZ8xvudB/A1gjYUjjS1tir6FjNE
	TPHd8HDz/CjzOZ74jPTkdNq/NEkBK7WGRHxTF4DOQBsf5gOi6ho/Xq4AMoBkMK1ZtNyGrS+O8XA
	q9YbvblpR2XJ1YhL3xPeI5j/xoXW4ixAtP742Tgyawgd09GM3vGEg+QR9gpu+w/2Z3KQdWkWE1l
	h4QkF6tm2q2qf8qD7YAhRWq61lTmj+LfaGiSNkT0EB793tKzecIMWb/oeBnfEBOUy9bx22Hdnb4
	iuVEbTG/U/iRpScIgLVCZ+4PSrBQBf7iUKCvyHAhxotp9b3G8BcBmx0DDbQWH4AIFF86v1IGm7k
	dzCrzgNUSoGp62jJnO43/hxFTc0Oyj5pnep5PkvN+BgQxkhONttOJYbt8HrDHFZ373Hf44Ekm+l
	Vk4v3JK7q7muf+NYZfeqD33aHmgsi9cC3CnY/9lu9MIeSCVrx3mgT3
X-Received: by 2002:a05:6870:b909:b0:49d:c800:c431 with SMTP id 586e51a60fabf-4adc0db6cc1mr1204864fac.28.1794079354066;
        Sat, 07 Nov 2026 11:22:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:22 -0700
Subject: [PATCH 25/58] mtd: rawnand: hisi504: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-25-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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

Retain the host through its embedded legacy controller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..36427a242c2b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -731,6 +731,11 @@ static const struct nand_controller_ops hisi_nfc_controller_ops = {
 	.attach_chip = hisi_nfc_attach_chip,
 };
 
+static void hisi_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct hinfc_host, chip.legacy.dummy_controller));
+}
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
 	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
@@ -740,9 +745,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, hisi_nfc_release);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +798,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +822,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

