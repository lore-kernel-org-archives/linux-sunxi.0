Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296669;
	b=yKluHCUifTbS5E1imYaSvMe5AOwNVwS0hxbTplcJknnci6mxyhuo20vxHWqJFxfEsDd4
	 Q1++C29pM58/cvFBPFK6c/RGZM8xzVV4ypKQvpaMWU9S+krVkSJdB3ZOmamuVimCqp7F/
	 w9RQ8rgtSinFj99MWvragoCnqqQeMilbcSEKySflfUz0PiHxB7P4tJP861fmNc9F7qP01
	 R5vdu0yAfzT2Icm1155k+BlalCpLhsAkCvqYJFINljytRB2rwP+gHPPAVv/1u1QMRalqe
	 ddJm2DZ+YvtsMlYfK+TrBNLD4X9vDEC+nvuIU48I4oAcVO5gkTfOV/ibk/jtYlUWZuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=;
	b=19HpCRQnZrmCaIfSvzzpsjpy+b5Gn6HpwUA1aImb4BobysSBZGuAKtl8YT989VgnZV7x
	 113QPDpdeKiTtx5DEI4ZZ3q8OA5JHZc/+2BthBhYtyVCHZrSaDeNYC86yUMoyNF9SjTMn
	 lzBSlLYuS6qbfGyIO5cpw58xSbqQOPQy/HWpKYm/O01B4Yef63LYiFI0xtbhKj9ONJWVW
	 yLXos6jLZsyR5ei36DR6gXhmmnYwNtRhU4iqTbJUmwu/BvVGTkHRMbpc+CBoLU3fE19tJ
	 DAzegKQkgohwqLFBS9ZDK0kdsmA8ZVyHSrolGVPGZQWhFMLKMG05bcxffL4c+6a0Icg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkOuDL1H;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB6606A33B
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 07:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEB6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkOuDL1H
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a451915d8aso984513b6e.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 23:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296668; x=1794901468; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=;
        b=zkOuDL1H8WRAWSVkvPiNlD7DsN7Y2jMGWBXDT9GAQ/XYRGIZSSXuwQrZvWuy1CHKt6
         BEdpBWYmUScsjPiyXEOld5tF0+PdOcKTAjnUcdp8xXuxtY2qVqa8nmbytyN0mhmyQuI1
         UJCkwZVkV0XxTsaDIWRvl2oA37qB09GLTK+I/SWLB1eNeR3ZbjHPfGdFsw8hxY7kvQ/m
         o8WUbgNcRxYlGSg4FTYZ8WNDQRW62XE1rzCiP3SRtbcerH4kwZxWrYKhcK6Ct3BTUQx0
         j6+XeiY6k7h93bg32dTLQQH+nTDGr1lrq9ih1EYQ/r44G3scLMzdC2i1Umt4QXWlR+qI
         3FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296668; x=1794901468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=;
        b=19AJ63etu3RGlIqS0kwd69K5BJbs2Yjhwr7Fgl6HkehC3GuCnRtL0dV1SUhoKW+1FT
         Q4lnQa0NhGNh+z65YlCMROaXBXHZ/bLluw9Lzco4bSDWCKqqAUz9dCsns4r85XgwJyZ8
         SzPXvC4hIMQgbfdqB70xalSl6IkYxuf6alIJ5PT4gd5M4kEQD+DFcfGB0QDJWykuCHU6
         KSbFu6mR5+k3ihceogldY/Pfzk+cgVnH79JE2FyU9ZOJQxC+KpVHPtpyI9c+CV6lwAJ7
         aSX2PgUvLBPTWSy6FpU1KRJn2dUqUSHJb2SfLTBzk0blytyMZebZq59ztG+hr/87VY5g
         QAUg==
X-Forwarded-Encrypted: i=1; AL+hErGdmqDivQtxHWyvuoO5abo7hGi9n3l1pX+S9DtD7hc+yP/s6wpp3SL0+mDhF34z51oe+wZ3oTq8ZbbUBQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8NUQCfVYKaJ0tQDVnUroVDoi06AyZX1pX9PFTwTG7NNVZ9qWNd
	v7eH8PvIzxlPTU4psRafnCZm135dJybOlgt68erXHD0BIuTOjd7P6rZU
X-Gm-Gg: AYBFou1D7T8l/i7JM677fSB3xpkWuKSxx10j4hdoaPqgq66GU1t2LykzzfUEc5h94gE
	9ewOyGyVByqZf2+qWqD1xAbrb55y2NoamxBB8y2VUGfkTsyC2Qhcdr1QGk0nOISsVMsM0ZlMXg2
	lWzEuwG9DUWdI6I8kHPPMB2g64WoMNbjsoioI47/z0pEVSMNIolWdFqk6CXI8nGL7jEd6nmpeeI
	WoLFyscmILvflX4BV6700ud04MYazGVXjdAG9dDiw+yg3sfDf+CHJ4cj98Lh0KnXMkfA+6AfmoO
	5MUrBDunPaJaXDOP5WlesvOuKTauhlcABnBM/1bxGUIo0gEyc82+koNHqMrL6HmUDPd/vV+/+an
	wmFn+wWyAeKGVnBqkUHl5ILAxKdWneYjUlsKJ6ma9uq7YZZOos6vaFdRC9GGlyfOtuzbXHk9EmZ
	R3EdxmO/44dg9Vvdy4gK3MJhUMZqaOuSMJAQp5S49/0AbM7EyI05YdpS7zQEgQbJ/I1ChA1FUFE
	khs7Wf61pbsS542onF0vis1A/QkDDY1siW2m/CiB2cn6xP+5JEiJpYwS/ckvXcECQzx7jj04O3i
	0jtbrqmZM2owj08HZ7q3C+/nm6UHR7ExxCWlGMSyiNqVcLEwwu4nlElyDqZhjsD96nEY8+dxxOy
	vsOqVeTODCozoqfMHbLmPNStRA46+c11KXlcyxG63EKo8VALwWYiR9uucn0+X5UxdL+xD6YQAEB
	l87aG1utAGshnkgdqpf6CdGoNQyutxXEX2xFYiePvXygtIG/zR3x1e
X-Received: by 2002:a05:6808:c1f5:b0:4f9:a153:8446 with SMTP id 5614622812f47-5683ccd9f03mr1360370b6e.38.1794296668122;
        Mon, 09 Nov 2026 23:44:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:10 -0700
Subject: [PATCH v2 07/58] mtd: rawnand: sunxi: retain chip state until the
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-7-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
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
reference. Defer nand_cleanup() and chip destruction until the final MTD
or device reference is released. Retain the chip name, flash node and
per-sector user-data lengths along with the NAND metadata.

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
 drivers/mtd/nand/raw/sunxi_nand.c | 59 +++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..57894ce45065 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -405,6 +406,13 @@ static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
 	return container_of(ctrl, struct sunxi_nfc, controller);
 }
 
+static void sunxi_nfc_release(struct nand_controller *controller)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(controller);
+
+	kfree(nfc);
+}
+
 static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 {
 	struct sunxi_nfc *nfc = dev_id;
@@ -2027,9 +2035,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2052,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2427,6 +2433,13 @@ static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.exec_op = sunxi_nfc_exec_op,
 };
 
+static void sunxi_nand_release(struct nand_chip *chip)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(chip);
+
+	kfree(sunxi_nand);
+}
+
 static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 {
 	struct sunxi_nand_chip *sunxi_nand;
@@ -2440,8 +2453,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2479,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2490,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
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
@@ -2518,18 +2533,32 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_release(nand, sunxi_nand_release);
+	if (ret)
+		goto err_cleanup_nand;
+	mtd->owner = THIS_MODULE;
 
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
@@ -2610,12 +2639,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, sunxi_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0

