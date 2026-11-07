Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082435;
	b=iwozYDnAJUjJvdiE5tXySfiOefs8aHA4XuN54xjk3cJEWpytpNuciKfPMeNrZAb3Jc37
	 CZX8mpLyPes/h9BJegahuCOm2ushx5Ea9ouB08jCPnAiXMp3SbkKIWM6O5YRpHxvfpMkO
	 Dq5u+hgHbH6mteDRj5HVzVIuBkDL2cKykzqRv2HB/7WQgKrt73WY8IxU96/bZk/C5U/B5
	 vw6w0coVoTxO5+H0jTNbn5pG1u0/smyUHKrYME3pZqBJCrlJYX7JjKJ5JJRP4K2sguoLQ
	 cuzHQ+pSxoOoCKZWScmhRXvtiNIDhDrt5xhJj5Wtxov0i/kDrqdJydKW9MD2xUr9KLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082435;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
	b=sEhn+Ubfp3gMo7ylja2KYKP7wupayD5MzSvVaM8d9YwBEF5/HlxeWGZ/oZ7RTnrlPIig
	 imvFostF07XtKL3mJXMKJFT6GgiP0DMgL90SAJ9skcGHpHXVMxVLQnPk12HdPaxZCtnXV
	 5ipbtjb2cTXfyZBcHOiy9PA3oHwB24xERJCyDxXCcYY0g0GEPw3ZFzi9WVKelncRLYa+2
	 vQaectRuhZfywBeHEx5WVQjhomqY6PQCn0/f7HFYJTlmuFWE1Of+gA4vb8G6ZWlrTsK6p
	 Ib1SyEj3fwhfc4wA858P/F+fgcJY1rAI25eHoVScMAA4fZpjoDBrWb1RN7O6eTjbeXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3A606D830
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A3A606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-716c0217635so30370eaf.0
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082434; x=1794687234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
        b=rjnkvNpm2qFr6aG7Fwg7+sRahbqikZkYPpUcr5ql6dezv1/wEk69Y+Vh7/t5fAThCD
         +cNl0LBGqggCrtAQhJhF7BSwijb/e7kqWAow9XHM24NX50v5EfXms9nucrSEhfQMkYNB
         noqfmLUZ/uG64R6iahFIQG0ryFb4ZeQG1Yw5I5m8Pf15fs4+RiDsV2St78Lpk3+mOjq5
         mB/LS97H8hGscbdQCwrG4whldTq+TJQVthRz07qlWJ+sLvpfKqVNg71/J3GGZRFoHs7K
         oVvhfQbYfM2limRAD/10NruHF9iaN2AHUFzBsRCLWH1b+lq13QqFbljmZdQFuvURCy6X
         P7TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxG/Po1zOuHRjvNuhMvHVFxpALdpL0X47xa2MP4rCuDi7kPIRbIom1EQQ4PRm6eIykfwcyrDGKqTnFCw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ecE+6pk4pKvPv23LixeLeAKXXAayqRwnaZUQ3pbVuUfiuEeM9
	D71nbTPY3egmb0FSvjQI0jcTwSLztF5uCO4nQfwL2K/PJCJXA5/oYh/EjNSSTZI5GCc=
X-Gm-Gg: AYBFou1eZU5Hx+9vqwxXFbIKvHaM2ZL1Dw+lKKy/7Z34jDf2U8YgdlhTOI5rL/yvtCt
	swmUE2Rz4GEAWxk8kb0iBXJuFBjTFSglxdoBbverQTam3L5A8LrIKYROLftw/l1xWGb+iZnLBBN
	gHqIxFkiERZTGxPvx65uG5avwXE/hTKaacZYnuHBBlQr08Zywdb3yCccoBEIrWjAwcOhseu9uku
	jGOT3XyEvlKGtMCykN/WuwKVRp5S/TU0VJDLPvHD4rStRttuX7yQp2oAdvS4MHD6wHyu3fdQTX3
	qWDzPrwk8JsyqvivGCOt7YSUU69f97nNFLRopFZvx9DGtY5vS1gwBdKFxkuwEoEmPY8fhcGJvYD
	cKntuRHS1aaSsQiaI3Pk26JcvL/mhsNXHgIm4wPaokFdB3u1OJZiwDNhR+tkxiOn4o4i60MT64S
	IFCwyjVMPCLRafhisqrxlMfaeCrHfxyOIFx9OA6Ye92YBIasvUbl2a1AQu44ZdfO1Af4KfUMv07
	cSwxUvVW2YSORAJ9qc1Wv4mB978HwN8f15WG2Oz2TV6Cesgdg6oD3bT/xK5bbfJUYpa9RXceC3i
	qcOkJeDDiNETrtcZynjF44iu7OoaVsH21BvKffsLJG/IONonUxeytFNvC31O86KBqpZNOiy0t3p
	Qdv3I0w==
X-Received: by 2002:a05:6820:2910:b0:6f6:baee:3ccb with SMTP id 006d021491bc7-717009e3477mr1267617eaf.9.1794082434177;
        Sat, 07 Nov 2026 12:13:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:45 -0700
Subject: [PATCH 48/58] mtd: rawnand: ndfc: retain chip state across removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-48-0181ef0cc4c8@gmail.com>
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

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d7b119028a71..50506ad87fd4 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,13 +171,27 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
 	return ret;
 }
 
+static void ndfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ndfc_controller, ndfc_control));
+}
+
 static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
@@ -187,11 +199,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +214,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc_release);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +259,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0

