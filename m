Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079360;
	b=CHmjz5zrlWJVm4ZLoociTGyYzWEsVSxyjAfS/sRVt7uFNOkXU2cmmdHVvGYW6oF4jMb8
	 8pfrNd4IQ8gdw2MrdLynJil/tU9yEJLpiTWbsPvuS5ql75itS7saGu7baUF1z2oBKe+GH
	 UZThw6ZWntOM4l9NN0/V5qAf9MvezbiNczgBzWHrmNa6XJTvUKJm/Mst4AO+go2YD1FYv
	 XTqhsaYbWDNsDI7l6y/hkRqEpVKR1EhPFtFetHZBjRPyPzjQQB9oY+VJcQn5C2a4fSgXx
	 47c3hZt+DALZ2d6vyfG7jlG/JZUyR6eLQC3WDC3UidY88xWc4EXfI620dx8lYL2KVYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=uiQtOwh940AQFNDuY6r5SmQ8am7vK1OuLONOhRhn63FtwMK8claDULxrLMyweGYmnUFb
	 A7Bhn35hzrdrehgoBfwIKrXVDAundk4WaTJpV/SEqaX4fgbs1omHc7zz1qWXKE6fpaIZv
	 OHxVoiQoo/rF50VcK4eIXBawOAeb46XD0nXkWABEGlF29nW9lJQoVBumudzzbWC/GHnrp
	 YwWZKxcJkTOi8BUw0TMs9nVt/gHUNB2jLoB2dM/DJWI+kNmEmzkC8AnXXo7p7XUGhPIES
	 s7iTehZi19jABSKGiEk9maqll8vzpc6hcaoiicNQm9cJj6IGCSipXVg3MdJEI3hNUiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KUdsmpKy;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E58606D80B
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 19:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E58606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KUdsmpKy
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1032573fac.2
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079358; x=1794684158; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=KUdsmpKycypFornE7BCk1/nQinc6XnAuAMXXI2QrQO/yRSSrk9hwOlv37bTEh8LBFx
         ibNF72EgmgmN5jYV0muRcVpzdal8kxEOHVdcqXYxnOpPmBSiCe8w8ks3x8Hz9EOJ9WfR
         wOPfCxYkAlOdh6SugAMphFAGtAkqbb/msw5GNnhON/tPIfLPZFY3M5RZcpub36dOgIe/
         sUAI90yDDN5mc+WbaCW6I1gvim9HANkpRz9ETor11Oe5arG5+YpZ52/LwHhSMIODJYQ/
         Y7kPT4MoRjrxW28ByY4Ue4ivUCQeEiiVYNfe1BzvNpjssOh9N9n82fBLkkoKIuhONBDA
         d2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079358; x=1794684158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=taHBb07tdPwyHOKJ6VFxafuAig4zB4IyURSWyIsgqZceeeeqxeZtkb8f34XUiENXcB
         gJLhMLVxbnGTtQgYp4UDDrn7gu+7JUcsO35QFf55RjoZb/GsbyhNUm0bPIf9rLSAuPII
         F3/enKi50cmIf0lpTcvt9TDgNctKHxfVHStRoqEtAyKqVYAA3Rtk9GPgRAiDkuivuKvG
         4GktB/iKcVRPFQ4Rft1uqvbmArCgUZy3zL/7gVEoVV6cZ5Sm8ltn3AETTVA0i2HoiTa/
         ejjK4a5t7jRLGkkqr7nLNsxjgkOWJ1NfApx1dGDXKYNx1rba9DQ2x+V1Kf+sucRldF60
         d1WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyMkofQTgNNP+xjBBELykL6tNOBNbya4OCiPdvXrbRiYpO9t6XwQSGxUd4oVWQ1OowSVUC2sW1Ewuvrw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8GtzLuLP+biYHam96Y/fskcn9axzPsgTDNfvwAHRgfq3zloofV
	Ddm41v8FLcAdA004x4Nc1heFsvDE0NVgNhHQF6LF8KNszUFsWzcjp6FZ
X-Gm-Gg: AYBFou0Mzjw0vXxbSLEmVQRZpqZ+IYnUtEqr/ueiGVZ82iTUQKN+Pu8A6vOIp8Kj9td
	wrUuVxk60qrlWt/6q5tNmW5dh9HyQXSkvmCXSr29W+D9pIEYzAP7pdDMpOfq9P87FEEAOz6rIou
	eFOlGwWaPXxV8fMXdSjBNyDhnhfmBMnqd7frjihTfdxNjTHIkoR9gj0W8UMbwt+BiMlt+opTgRW
	woN1JMhrauCtnR59Rif6gNnzFsZCZ6CQciXcEvjiAqhimcN/r4B2hRK25bYtGVdh4fgQDEPuMHf
	wMFW+z7TwctAe1s5xFIOoKdzSEWEErnVjEJ2HxUYKEI/9/alRI1sbNUzK26U7Z6gQyJhXKWL15z
	7WDB42N+L/kwA+aDkzaFJ6GH4fl/WMNt1mKYy5QLbJ1KzakxQlJGekcwiGrD4orWpLdrlz8omLm
	J/FNORJ4oWg0ia6z2T0synzE1qrFalpDpCCDLAVMQrWjeDjaxhoUR3z2jQSgaE88KG+6LI4euwz
	lgS8q5QOlbLq2mK+xi+lDWJAGgTjiXFRXzh8QYKecfeAhpNpOQkhT1YLe5ULA35XwiHr07PKZFK
	oVjMUDrOfZiftdOkt03c+oB01w425RrmS/2icwwFZOkNXwj0Ex74O+LyottdQ64TbHMg0xw04M2
	BVZfEke5WwfoCbPFIa4YH9934+cC0ov3Z6iZ4okGJxtPP/7LwNNqeew3i7SqVBwSQiTVcTh2T+w
	Kua5+XMmPtRw7ypnSup0hT2yItPUzUou4IvFYLQCDxB4I68odsLgHj4g==
X-Received: by 2002:a05:6870:e091:b0:49d:c88d:8bea with SMTP id 586e51a60fabf-4ad98e66b72mr4108041fac.42.1794079357895;
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:23 -0700
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-0181ef0cc4c8@gmail.com>
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

