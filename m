Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810595;
	b=yRT7aGk6KQcm5ULe/ZgHeCxosTkp188bD1AmSh3BPc7eK86UPlaLBPcLku4TfeIYJFhv
	 HlVT+UpnUF5ZP5TeyaBrBvj0KLTBb6Q71r/N0oDmrv2+ycGwJxSxnI/3wSsrzbumIr8Tt
	 jInxVfOqVpDQZXh89hLmR/A/NX2yGoHsLdW9JagMxddjrpRjxDAkxfk6/rtlS4uBw0OuI
	 EqKmQs6w8dB7yWTNrwMqrlDSs2wxP0edaSA7yX26aDYmhaHiGBOFRtdvKoUFl+9ze6Zqo
	 1Yp4B7ytyjTzX1Z/QASp929C7Oqex0RGHLDZOnSa5b3IwdpftHhPNeHlKl3YweS2TDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
	b=2TsOZE7pi0t3iW2NGZ7h7+LE7uUbaXebba38TzO+gZyJ321e/U7YpPmJUWjNNg+TdOfB
	 gFaazpUi2mFLkCEN1SoSIwoXCXcXV8FU0tZZ9PUBO085J6K49mCSa3HEsSC3rTCnzyoFI
	 GNWl5x/xVkxM7cmKsYVj6/KN1BOev6ausQrfVynLu2OPVLawk5X3AYno6vhN2EBXBSAvC
	 8W+a52bTYY1+qA4b6M0EtYdtskSyBU4L8FwTppQX6VkKLiJcSt8l3JLYaKX2B0D7gcN76
	 KR6R9QGRxC4qO53gHuzI//tcdEh7NVUTYIFG900Q4/qvFloq0nEZ4QgQjMYNcVr6edQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGcRVmBA;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4E606A8A6
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 06:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D4E606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGcRVmBA
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aa9606ddadso2737382eaf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 22:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810594; x=1795415394; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=VGcRVmBAMSrL1fxel7ivlqIE/YCJSUGIc0NRDLyX1RJm78EtZ8d5qZEokvmJGULLZ5
         J3MLZ9P+9owhQdhTd4fPHf+Cuu18k9kfZKJFuXaFbyKIM5ec7zKwCpX+vlo6NqyIs9Pf
         TrYnFT5dU/DxubbyputW1pc+KGX2eZLJrzU6QbKjKOoa2IkmE07lL5AiVO7LdRm47Ybj
         xTDBWUrWhkN7iybv+teGYUrPk85nneEQx1hRqRrhgg2zYF6iCLNmjbZ5NOc8lQgzaLFY
         UduwIIudN0yoJGb6D2ol+DkIq/XkAlpZsrlTZ2Hhd8rOj2e5t7GKLhLKWdxjzSFmoNMM
         ovHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810594; x=1795415394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=BSqE2a0EgQub+Snuurnc3yG2YgyCoxf+nCiybGPMWjzS4p0S4V/c3RR4VPCGtJ9KrD
         KzpN2bsfk+dqQKJWvsdQtvcTFETspEgxQ7lkLfAOq8bc1ooEHJbA8lz3qOy6TcGiTebv
         BRwRQO1MX2bIZ2g4IqX/VvwczecWxhXqhk0D11gCEoPO7o8iYg7n68q1aQYT0mNhW/eS
         9N5ViuH36crmIrLidWLgAPjT3Z1F3HF5t31lrl18mkLOeq13Ck/KTAngeiLzyfkzKuEy
         7LBQQcuP1KR1pj6ULUbpNbJRJQXjW8kHtQnTQSShgxCZG+7NUU9UnbUWB3prYXtDMlIb
         RBMg==
X-Forwarded-Encrypted: i=1; AL+hErGv8aPL0i88/7n63sufSRFxKRTmHBz0c2vZByJiTHfL5If1HWUYovYnHA8nl0DV2F6iQsN0Sih+fkluYw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9rABgy8KzyS3WbKJ+xahDcisIXlc02TJcu5Dz81sVyj1bjBz8R
	VPVZ2wWGERMYtGEyRRBoloP7MtY9RHmj57D05hhKu/toUQkwOTvM2an0
X-Gm-Gg: AYBFou3SzC+XG5MFWZPzoi+cLfG/vA/McEjx3d6qpF05/s9UvM/Pyil3s20oGsc2kxY
	3Rh3Sx0TY/mfZPpxNb05NbOhHAtWk+tVABVD1E4cTcYW3/Tz5bgq835T/zwGmoGKIsQwI766wff
	nK59k9XT3JiKK7QXvBG7JhJH+Eo/x/RguXi2qIuesksStUWxLvI3q+nsOndahJIGQb7YBmJlxts
	mNUtzRwAbwcTzZO91rjDA+3S3+1ZE4FOi19zBFVfh4DztsdWyCTdvnKweUkMNyinX8uM8MgYGav
	k4/nrv9w6mDLvNvWbuRHBWCu1XOL+8pVBnyvJDtmqebFt111anoGduY4MahZFhdw6OHf4KvKOT7
	pbEkALxy34C7mZgcIBRASQWKQOBrCfiMayE8EWls4JUAAd3jieGP3+lN19r7QpEU3a/gnzuMRaf
	qOlkeBJm2ancVSjqiZeyQSZqhZ/p9ohoTLwCiBqyOmC1R548dPoLWG6YCVcKcqBKaQNvsvTyuPF
	MhJfS5X+C7n1hAGMKYm3hZ1SFuHk9wq6tqsuffHSfKwZwbRTkxN98zMXnCDzGkDYmbE17TKbrxA
	XB63DxFq48yxBKAJMKxzv6mlqAKGzlTM7nMSpOSxtlURKD/4kqwFwyoQri1ouyd9iRtt5vehvJH
	w+R7MJZ71F+0tNHUCXK7oKYRVFPFScJFr6iYwRBJhbJER4Ow3XnXthi8gzUIJcdw71RwrbmLhv2
	VmvCOTcS2MYPxC7vMe9s3vGpdQ7PZXj/1uq24oACq3sTcHOtRh5aZ0
X-Received: by 2002:a05:6820:2205:b0:70a:12a9:c43d with SMTP id 006d021491bc7-71ab4f8ca14mr5786666eaf.22.1794810593653;
        Sun, 15 Nov 2026 22:29:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:22 -0700
Subject: [PATCH v5 07/58] mtd: rawnand: sunxi: retain chip state until the
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-7-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev

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

