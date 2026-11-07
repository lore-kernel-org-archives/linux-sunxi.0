Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082447;
	b=p2iXokVlpvSz7yIGicgiSaEFnKDNUXGD0a2RWN+WHLMkoXDWm6hwvfyf5N6oOgLFKKq6
	 1OoqpA1ezOCoRvXB6jKpDnw7ADOl9wZtoL9erjISNimQ6h6UzCgC50S6Qxmd5gDwqgt4L
	 K6VN5HH5jbZl1I3eOhTJoZkQU7Wg9MkJNAHsF/G1SOLFHsTFKApbqJYaFRTN2ZVPGyhjw
	 Lxvj2LrlUpfqHsgcoMH8y0zx/4irV+gN3nSAQgjRSIWLRXEk9cC9ChVwAtl/dmkZNGHJk
	 C8S+Yx9qHbZEM8t48mgFcv5e4MLzT+692fvynLxSWe2b+p1D6R4bp2g7jNjIV9VvYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082447;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
	b=1SzDbHwWx5rqFVloc9RLGUtxReQp2qQXbXjlgEaznXpAHmgywW3zdBwXelDW4SJvJPN5
	 HuAv85arjjOWm3nqx6G6j9slLOQKNoQQlxOlQbn+j2vv4CUHch5jcFsVPw30xKbE+LKYg
	 WPtspD4syx69705OxZCLOfqHEwi5fECXPrH4vi9BRTEl95dyUqARG8hKI9ojU5eoKC2ga
	 ay+rVT4HZqlJH2wyMb8m5+DEyMzCRpFE8zw3Djcc5mu8o37ZZhV65zU0+aB2M6vGqOk1U
	 beTp+G1RidwJwtfv6Y+/0rNBn9m0dFS5MMqRn5923y2R2mtLxF4vAhzZwMKMk4mflwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFEA6082BD0
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFEA6082BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dd7070699eso1179532eaf.3
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082445; x=1794687245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=u2qMh2sAskUwTtE1vnUb4AMDr9KWVXIo6SCQrli2v5crs2XjS+QVl+OIMEmuu+Ofpk
         ruHayqkXu3TZAnwkyIItvWZyu9t6Guv7yIy/QnE2tt0HOihr0ecpuLkwwKj/2yk/YUiZ
         mjbijH+w85n9wog1Dvs5u1LDiA2NW/iMnb/ck/k8iAYQG2DeIDV2/JhkCk7bh/yp2NHL
         eSKa8Q2/pYksDG/N/vg2wptQ+t0dYMY6vD3IaeYze5lgArY1vuXiBOXJOP4M54BJ1r41
         8wmEqDVlf0SdKE7ra0ElefP4E2r1qtqbKG3Pu/FXhOvQZ1JCOB5EKMvcpCqeVAMJedAM
         SMOg==
X-Forwarded-Encrypted: i=1; AKwUvByKlLeLf/j2K02DDTNYNKozkgeTKrRLl12AwDPk2tz0amI+QPrxjc4VWOe54wrAEMsnsF3siigCPmqIwg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8QUioU80BcsD9fs8Ql6d7MEzA4shnN3Rw9zBwXjBNc9ffrTCC/
	j/DO1ZFHFGAiPI1udlddQSgIwghmSMOP9A7tkFAOujLok+qh/67GeK844tkPGZfV3qA=
X-Gm-Gg: AYBFou23XxDhCCpDN6f6hS4izGHIIDug1GytxlawIRM1bN0BvecUBJuLLWjTpgd1igl
	VS4RlcvJ5y+hvC0WMncr0U17WVYIPkC0ZLPdjZO247QvcTb7GWkaOa6YTCKQrVJ+AsmItiRnRUP
	dqXKFTZ51ofxvORgahHuV7a0dkYVsbJQVNz1ZfSwzWLGZblUYBUi3U0HCAQ1eyWkg9jWjAOF4eM
	vhf15LY8TrPGJbFM/m8CqCKv81KqQhHb4BAWtuaIDLWEnmyZ3yCx0Qr0nNlHTofDnB7UmbihDA+
	rnwlVh8iu4NPxVUv5pGyT2SsASsixHEj6Yye1z8vSBFoCD0dEW4bBr8NsfieitstIM2ZEM/b5iE
	eacG/UOKTo8VDiuyMw3c90p0q8RkR4FkfEz72mp5B+erbxpTiGziewjYQI+TpAtbMeUgEcMPGnA
	W+4e77EUcu50Lf2KjeG/Sl+SsxsjWEWECLHV++EYXRW8PHSGIFHS+TuY56SGCDJxl9sy7cTIvhk
	dyJAc5lzvqV7+kBwxYeD+92ZjjWT18FLHeekAXU6PXTJumLva0Kw0gEYulQhWqaX1wdTulvndB1
	w+8QinE1vqFWo7ncugYLjA8UeMfXL4ZhLOysDDYLUI/ItVwE8CD7F0s5MGSPwuw8r0bf7gayvQ7
	1im+xlw==
X-Received: by 2002:a05:6820:820:b0:716:c0d5:2cfb with SMTP id 006d021491bc7-7170f1be2c9mr28227eaf.6.1794082445409;
        Sat, 07 Nov 2026 12:14:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:49 -0700
Subject: [PATCH 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-52-0181ef0cc4c8@gmail.com>
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

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4d4e185c22e5..60fc440d4515 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -19,6 +19,12 @@ MODULE_AUTHOR("Rafał Miłecki");
 
 static const char *probes[] = { "bcm47xxpart", NULL };
 
+static void bcm47xxnflash_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct bcm47xxnflash,
+			   nand_chip.legacy.dummy_controller));
+}
+
 static int bcm47xxnflash_probe(struct platform_device *pdev)
 {
 	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
@@ -26,9 +32,14 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller,
+					bcm47xxnflash_release);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +59,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_release(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +83,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0

