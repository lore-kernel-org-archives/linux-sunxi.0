Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446917;
	b=KqC3xzbmGxy2ano+eaGxLSD0BBsT0/Tg0rdPHKVSN4+gIAMljoa1NsUW6PW1yxCi7+mv
	 tUwOB970I/s4w9MrOiJNcTDHGyObLugvjo7YKFekfWn4xhrjqGvCn8qp00Z8uYHc+fw+B
	 hjLSo+2hFZiYChqrDS24egx1APzNfp7vP6MB6JtvKkl3fcbGDUNLa3LCGrl0XSpNWqakg
	 kiCO4yA6lG5H24vpoivPrAqk9I9Oc5Rq3HcOaKeUvsJ6Yy/cQ0sxSHSfVfgascm7Eu/+n
	 l1fQWiZLT7J2cjcMEOb1JrpfCJyuA36lzYaHt4TnPHG4Y8AF8kMkVZjnnlUlzRcQTKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
	b=1j3/81+hqYg11S3qud/fo7Cjs/NpYxlBaP+vtmCT+0MMKnmEpUHDStwt9/RYgggWKK7U
	 fPobqCdIk2tKsdpRncaG5a0KsSVE3JRQdI7IeqfVCvCfUv3rVQSLGx3ZJcjm31Qsp5X2Y
	 O4nUKv9WoavsXJHfF/dQ/R9pnfF5+7pMNkbP2CxDnX3yMJxQ56edQkm3nZJ/hmuynfz3R
	 P17wjTx2pTMSsK8BCLU2yo6JxD2o2gFQbtGoyIjBhFqBqvbRqrGaHTgq+YAU80pW8t4VS
	 pblUg52epfZJpQVA7VVGoLAzyfgbZDDdsYcQz4oM2H+JOq4YSGcN3onh6xxJ3VFW/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0gSMtZQ;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B24606A8BF
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 01:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B24606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0gSMtZQ
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-5058b105df7so1342613b6e.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 17:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446915; x=1795051715; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=c0gSMtZQ5/T9NxKHBdAcDkP3XQdgZ0uz/PqPBu4j22/XQah586y/EOywuDx0QXjcRk
         tV95OxCW1GykKDziBGNk5fibHRgk+6I6+ToBadOcd/HB00YK4y6GgWhO1CeA7Mu2w3Ek
         /JE0L766xmLykOnLH7D5ZhuEhDJ13fbaOAgsyMWlRMeAulhfPyGRN8UJGX1SzLAKcBtm
         0dW/Gepn8ps11iYWKVzL011Uny6Gb1B7PBQtoOy6Qf6T+7gnGULKcQSBJbDntBxOLxrY
         8OdYdXOxSuOz8DiIc0CBFJlN0lCnl1GECVk2wJIeouG+VWyiuU6qsiDn4BIh3PSiVcSJ
         sXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446915; x=1795051715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=LQ6wjYhpT3GDjP7ePru79kwfMkEEdSr2JIMO4tWXM/T4hiuJJ4mqwqnTum7tUyrQOi
         cIaEcT4CzOle/ktVAlp2oGbTYyC8ZtcYQXmYC20PtBRQjetTAGA7vbcrVED5PCauc9SK
         moFg6VCNJ5QcHdyQPV5pvLROzatJOqn1vJ0wAREXwhcdbeaTfLUcSnQgJa077BRYYWlm
         j3zDpayWvvQWtjvuwjBckqr9LFeCljmb2rLYFT/Dn2ehh4DKzZ8pHSVFu6IFpX56ONGs
         Ek1cd27yy+4IclRAZMlQ6gnMVgGaWVAwApO9b+nJukgVZQlfy6sQFeuQ3k3VrYEsWUzR
         cNOw==
X-Forwarded-Encrypted: i=1; AL+hErESXYsHP5D9vi6JCSCLosRdfcQ0eymE2tlw5Q2w/96XjFbApJsTyd14ljo9gSoWUaOxOxQHIEGSawsGfg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+u9Y7mUfEK078Q4kEFzDyLEeL7EI+OYRs9Oh+/GCsbDeYB/F12
	kNs4FFcOJSKeoWC6+GmwRSzNnxLt/XqM2ALNCnaJttUsghWzg2asRsStpxq3CZ/k
X-Gm-Gg: AYBFou0SRtGpqMBsepml3i1OcpL3Bk5w1cIs84zh4jghRTjZRcXBuv2tTrro2GmlvR7
	5GTbq7G/NqaHtA1H4F6UyDQMKFMRPHwyNYskslP1D0Nc10I7D/wLS8ska7N3nAe1SGJZM3RRshJ
	VjI4HqnK7VFybIQ1b10BC3i4lc0kHM6cdsfPbCeI+K/hoTF9ibY/SeV172WTUQjuxQ59tr4kBPB
	PyRBComPTIzfq7kXvBSvX+o+43CwJIeE81GaUbiLNzZOe81ORDbJOllkhAn8LYxmGCznv0SQT8x
	00UnLZ1dadesZBl27BLgqbj4M/QXm6jozEOqlPDXhFsqAWWGVs8wGPJQAJDnAkJTUHxDKo5x27t
	vqZ9r+zvdJnkJmChatrXQ4mJJg8ilLysSQerWLAw5ciqNxK8tgoARevjUwHytEyZ0eNgQenc6Jx
	BwjHDGj6L9f6Lcd9f/1ddNQmxKmEKFDZPMY/eO313D0Nb6LUsGZkMMFHdDFDqiyVzZEE+0PyHZn
	M0TBfao+b6vkTKZwIvWi7qkvPs0kRga3ovKilk4f7iEqZI1HsfIY2aS8Eai/ukz2LPuNoF97R/C
	jCbp7EXwYWQSJZF4ybxNphPpIHIrOzyOTH7d/PSEJCHoIdGemB0K9gbLKJXBFjFpVWnaez5CQP9
	LhSMUhbs4H8sVX+Vy7aCRoovmU4+zeLZxRTuScmrMvIcbEO+a5w1pLpS2YHHUhAjVHOfP0YepZU
	/I+XZylX6Tx56Vexm97hGcAj1++jAqaAhPA2PfNO5Q5qn7Nu1XCoc4
X-Received: by 2002:a05:6808:6d8c:b0:567:dc9f:c83f with SMTP id 5614622812f47-56b96192788mr3947266b6e.14.1794446915574;
        Wed, 11 Nov 2026 17:28:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:46 -0700
Subject: [PATCH v3 07/58] mtd: rawnand: sunxi: retain chip state until the
 final MTD put
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-7-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.15.2

sunxi_nand_chips_cleanup() unregisters each MTD device and immediately
calls nand_cleanup(). Devres subsequently frees the chip and controller.
An open MTD handle can outlive this sequence: another operation or even
closing a writable handle reaches freed metadata and lock storage.

Unregister each MTD device while removal notifiers can still finish I/O,
then disconnect the chip and release the driver's initial MTD lifetime
reference. Run nand_cleanup() during disconnection, freeing the
per-sector working data while the driver is bound. Retain copied names,
OOB regions, flash-node references and chip storage until the final put.

Give the controller a reference for each retained chip and one owned by
devres. Register that devres action first so the IRQ and hardware
resources are released before the initial controller reference. The
shared lock and parent device remain valid until the last chip is
destroyed, while the disconnect gate prevents access to released
hardware resources.

Unwind heap allocations on probe failures, including attach failures for
which nand_scan() does not invoke the detach callback.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4fcb7977de02..d175dc685681 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -2027,9 +2028,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2045,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2440,8 +2439,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2465,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2476,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto err_free_chip;
 		}
 
 		if (tmp > NFC_MAX_CS) {
 			dev_err(dev,
 				"invalid reg value: %u (max CS = 7)\n",
 				tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		sunxi_nand->sels[i].cs = tmp;
@@ -2518,18 +2519,31 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_lifetime(nand, sunxi_nand);
+	if (ret)
+		goto err_cleanup_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
+
+err_cleanup_nand:
+	nand_cleanup(nand);
+err_free_chip:
+	/* nand_scan() does not detach a chip whose attach callback failed. */
+	kfree(sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand);
+	return ret;
 }
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
@@ -2610,12 +2624,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0

