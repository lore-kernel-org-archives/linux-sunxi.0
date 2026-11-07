Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082404;
	b=nx7sYZmjY6y1qXMMcqRVzHgwi05AFQf8Iuwjx/Ub+h144JSNeZa0ZLnLJElWNKrVyF/o
	 pcePGwW1KYj9xWhyDljIl3V/685CsNi38+BnI+6FFYEgbuH9/NXcHAhbaNiJ8Uj+SDuH9
	 qauwJRgFOJdwtc8bOLvQg3/HAh2D7G9A8mZjx8MhhsXfQsPzowlVPcMrU7zXm0ESI+txO
	 Z1n8hGVIYBILAnxx1i7fKVXSIcAJAJz5wvqznUTx2xnb/fKdpP6nFbJEmyyLMNMZVCtIr
	 EGs2tHDEDL/4fIGAZAlOIVSyk2+EUK0Jpx5Mmk2r7kVVX0M94MhPNdFHDkMzocbyJyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=4cbHlEgTqAV0uFbOpmY4khYTjF5IiPDWn5PtExd0tWk=;
	b=z+fYT0TEYh8nNGOMM8ogkGnNrMda4Y+Y7T4Hlnt+7XbIe3oNIA9i0zE/f2L8XEU45E3I
	 Q1vHj5U3CenIG8Z2o1zAJv/mN6cKo8zxbIqatTHa66R3uyaW3A+MGytVu0ikgznn7j7yj
	 iIYPb5D6x6svhJpucp6HBL79L6cY6Pn40CoHquL8jhyNPsmtfrVnc9qhpDGkRNn2k7oTA
	 rxu3F9OTHznqmz4nJyVrKSulr5N8e5NmIMyuI+U5DlAJezYpMoHklf19eWsDkwsb924BF
	 WtKD5XiXahS7E+SGrgACMQUBigaluF+hgz7ZaZoOigjQCt+LUiwPpuJkBLXhfub81fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF89F606EEA5
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF89F606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4c5d8c7f326so3378b6e.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082402; x=1794687202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cbHlEgTqAV0uFbOpmY4khYTjF5IiPDWn5PtExd0tWk=;
        b=TusqhBLypJp1WQ6i9WzRc7R07GqbBnPRZMH7ocbZTIkVY26/F0K2Mu3fhgxdS4zb1G
         BBdWfY1kOorjxRrELYCJg/xS9pa8agydspfoNicwUrw+M41vJ0py5GA1kBPElhdMLpMU
         P0qEqZ9ll1e5gz2YUjeImJf3aht5p9mcdWmjsAmbxT7cq+oIb83FiIJW/StREuEuqEU0
         63XeyIaUYmG/F0f4lVchB7m4P9YXc1JuU6P/Yodr3qq1B/nkuBOf4OnUirAdaLXTuYWH
         jrZUK7w2sBH4Ml76hYtLPNgKCOzVa62nveZoTyfzJAmk4hd3G/x8dMgETJH+b3lCsX/W
         pliw==
X-Forwarded-Encrypted: i=1; AKwUvBy0a9l2iNgbsuQqgxJEvnRfiaLawpELTA8f9BCJmvExfcqP0GXwrTMuzyKNq4E3J9jHpDI521DUOyPVnA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+mKv4ZiYA7yey3+oh0o3UJFzFyeC3TcYdt8+omyquuE8jbGwSL
	U8I89yw9aL9mjzU+1k8vQ2NYJU9ovJ4bbdWZHeAsWe3H/rCTfKT8HRhLW8GTU2X8eGA=
X-Gm-Gg: AYBFou1EEN9g4sk5AS6gXpJVNtgQmDozDBw+eSL9AEcpna3VLoIoW1yQKK+ido5RmrV
	r/cPiuyn1PR4ZmPfo5O27W6qXPHtGIsdre49OQXhTR6E8jPDnSNm0RS6AIn9+xxIimr391hdrNW
	zb+XfYqkyNVWC6febU/6H+V5ZfJeGxEfjaypwS3altvO3Q0ZuO6vRvKL264tYmng/UQTs0zTaZg
	DRL/RqQtHCLDCEVJLL+SDXu1VLrrcNWJYVBaPOMkffMKa9ww+oFIcbwwek3uLXEOsvUytVhyiKo
	hv1DcytXfxW7pCSIH2yHAP00qWPRAGizD4Ox2UDWNskTjCcQ4PAt5u+7HrQ/B9t4+Plxq4jGYM8
	IqzJAW09yyx8PjFPtcoRqd/pvp60G4ujnZ0oo5ZRo6IzchVxXy9cHn6kyl2/AS5c2u5ZFSXc3Vr
	Tgg7KvYmUlm/40mvZHjSKaJHV5iFqlMqE2xw8axXUpZdkBKVGl/c44vD/WbYvcR2iq/X/0sIWCN
	ktsGz8dS0w9wXtrsBkIAv+PBiyMBjwLLFbt03tq0qmYc6Gri/HXcoKezkrnRYU1SIoCPsX7KjmG
	JCRuLUnxTVjgar/aXmPFYfK/sqEV596U+Mx3jk5cZoWfFLEUHWlRs7cY7hHm2UylHPHynXanYc/
	sOWFxrQ==
X-Received: by 2002:a05:6808:1b0f:b0:539:df4e:2d20 with SMTP id 5614622812f47-567e14d55ecmr4884980b6e.27.1794082401790;
        Sat, 07 Nov 2026 12:13:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:34 -0700
Subject: [PATCH 37/58] mtd: rawnand: meson: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-37-0181ef0cc4c8@gmail.com>
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

The deferred detach callback only frees heap-allocated transfer buffers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 55 +++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index b8834aa96e81..4f33ea7a1b4d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1381,6 +1381,11 @@ static const struct nand_controller_ops meson_nand_controller_ops = {
 	.exec_op = meson_nfc_exec_op,
 };
 
+static void meson_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(to_meson_nand(nand));
+}
+
 static int
 meson_nfc_nand_chip_init(struct device *dev,
 			 struct meson_nfc *nfc, struct device_node *np)
@@ -1398,8 +1403,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1414,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1434,14 +1439,16 @@ meson_nfc_nand_chip_init(struct device *dev,
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1456,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1464,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_release(nand, meson_nfc_nand_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1501,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1544,21 +1560,28 @@ static const struct of_device_id meson_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
 
+static void meson_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct meson_nfc, controller));
+}
+
 static int meson_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, meson_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0

