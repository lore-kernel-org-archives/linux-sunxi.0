Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593722;
	b=onYh/N3jBLXuW3zwE5lwMNrNaplvrzm4Hb5i1Sge5b00OsOEJ5pGP2kPHc3IH4w3CWGm
	 MdlcqesL0vfJRy+WibZUiRL8DQ5aVMOG4OuGdbDPVGsKa3LKPOSfRqUR3pGegvC/wGPOW
	 rfU5fMsVpCdJkYo9M83kzmzXUmcFoHsT0xymYbzY5a1acHavicA2Fy2JC4NzQA1HNnq0l
	 sfzacjLnKicxhPFE8JQP+uwDs/jBjGXXhSPrKDEASUIoN/unbZbhTlRlpRu2hGonivyGl
	 ft2zYwce96G809O60VUpqg4ziuqEytdzB3xDY1GtMiALcf0XvufhioK5KUvlgr3vNOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
	b=E9IxOk1woKLg3g5gzG7cN/YGklZVo72TOcGSwwXvsdEVSYoBgMyDGmAjrrolOuJuoZfO
	 QH9KnbPehe2D+n+aMe4mwzZ1g2fMD4dbaPOY2oD9pEW0d+/g9Qq0AxSD2C+JJmL3rc4Q8
	 9EfmQFtL+WirPJRrc0us/RHqMb0jqZ8kLkzOjY+4dHjsm/dmkBNNYCg8SQSKz6B7lXu4C
	 yOjM3ya8DCZTlze7ohZojBnGUVMeeE6VJQjlg2IMusjLIVqwxJeydo1tRBhLxfzVSFkyC
	 CKFdrOrwyL4Tm/hcb9GEVxlOVAZ01xs/0MKNDvIv42/v7/cl1FaL4iC/Y8b1CFQDjLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IZpq/FcG";
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA06606A88E
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Nov 2026 18:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA06606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZpq/FcG
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8256106635eso518998a34.0
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Nov 2026 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593721; x=1795198521; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=IZpq/FcGvhWjEnYr2AvTo7kRiVgW1xAl1DlTsckDQpsRlitLB6elXNLvDoB9cOlroh
         8leqkDUpJbdmszYG2Vv0mEFIUxJz9RzHYZ/vME5OZ3C97c5galrRBNNUXYPF+VXLUsdm
         Jg7ZG3NpW0OfwD/f/eE2LG8WRGKKBUvZrp0/5lfdu5Ku6wLjLMgrZIUXg0OHiBRY468v
         gsw20h7/Z2YZpYo8/tO/XykuOgjfjGZcX7sSoY0/1d3o3n9uXowvsBp8fLzikGUMkOFb
         qAI+qtGPBQoh54eqjuUfrs8gnSedO+vMybdoDPogM9ZgsiGzz3YrGYhpgKu+1iFYBuzo
         jfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593721; x=1795198521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=uPkPW177aCNj4I3HQVtV/V9eAlmq1qcGU/f6OgvL61o0/Hvvq8HXvVNEaPJtfrItCc
         et0JFHDMUFF+4jxiRNgPvTfpbrEtg1V5fCDao15ag7HQne+8G8xno8F2G2ZuBbL8QLOZ
         YBojznJQYolrXutsHqmvAGPW90Z4w5G5KHmg/1wqQr38UBtfY4adpx2YEbD/mN77OXjj
         KPBuPshYQeOlA6hLm4VZwlpoJgPL6DEwVrvyD6S9Ve8O54jNTCZeq7qd4s68n3IdHyLU
         kVD7a/C2PE4gXuE0j9s9d2hRRGszwOgPt2c7pCSkafTLvVXVxYne1OAYxB4N+CR3hXBx
         4pRA==
X-Forwarded-Encrypted: i=1; AL+hErHvnRe5Cj5ck98KfVx/y/3uuwm/z8tPnaGLpKWTsaFLPmLSaU4du1/OkWlLWzlOMaFoGwden81HXQcXjw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/51pU2uthIbO7CxX7uQX8o6euzJZyqym7Qt8dNBsgrL6xiFkaB
	y3BiSiYQo9KDatnFf1jLsC+JscCT72bnmlmUKT/i5aub0ayL3dtZZKCO
X-Gm-Gg: AYBFou0DmSZgIhJgWByLEgip8rKta/hle5te3Z0dEtz0bQSSwdd+ooCIc+Tj9TlV00M
	05Trd0jP7WaZzq8K4CBJRpWXxVxFbMN0ejhLFxIyIjIL+FWNlWqz+Bh9HU1xHsi8WpjRXuvmI8L
	pks40QzbBTe6owrIjsHgVaF+lahE+VsHT8gV4cFgtL8Pug8K1kGdPeJOEtFVNFZ8WKdGkXljYsc
	kYTlPaO0C8IMbamsIJVMbIeC1LIsTS3Kq9sfBFJrkXGc+C6kkJ40ilNsGwRHiiHZwJBVdVg/cI/
	Sb5vZo9mz/eK/81KuenFXMtnIjVOBrK3h7ffZFaNN72TUHOMfxFlqUBtOfbFkv1N50tcRzfPGHF
	b/avZaW97OEH252rVs8CK+hez/HQDPnWLaFOBgEvqBZcGf1RJd5q2ucGVmla1yUoZRI2ZWSnQVZ
	mDwilJbANn37sK2khH2ZhaP40y4yQ7/fadBqRceGZYUHjwo9NYQ4BM30eWIKJYh5X1E7Foa8J0d
	cYwysqn3D+oIEF+cpI19xgx7FnvhOvEZfvABSsfUPQ5bnAccF8CCT2Xq6x1H7sfQvFAl0q/Kvzy
	AMNvbqQP8c4tesyhl3hUMKBKm1xQgUS4nxpbJkKHiz/w7Mf42fsxGfrNBT3H3+3Oz8HpdimOXs2
	lQT51T3DVScV0lBKo2wyuOUnlMsF0DKr3Hbn70hvQ8kLRgaArNzRPM7qV2wEVAg3ff1a763MiBf
	nehLS1A6xSDRphDmPdZLbbvgDJ2LGXN9GxqyhDhaWzPc5T0a4mTCbR
X-Received: by 2002:a05:6830:2e13:b0:81e:abb6:749f with SMTP id 46e09a7af769-862898286f4mr3720945a34.8.1794593721422;
        Fri, 13 Nov 2026 10:15:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:23 -0700
Subject: [PATCH v4 07/58] mtd: rawnand: sunxi: retain chip state until the
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-7-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

