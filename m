Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223489;
	b=xBHvLg2djGWitU9MbNbuClDKwtUq2mU0KisVooe5QsPHQRtNnYQZlRadq3Jm+qiSwER9
	 pdauyIxeKs/Aoka765RRz1jh6NppXSDz2hUC40CB1UAKRhWA+xc+UTURk2y16/XMRk/hY
	 Ol4JLnNtrSWUiv+FsO+GvP2QMxijQi58mobL210YnJgr8vtdrMm8BFC5L8KcQ9qPQrQud
	 WrZ2T4lZhGEp7dxp4rI7YUVjCSR3SyEjLsxaZ/ci7iO6jdYAuvKXjxENOgZTDXw4ZiMTG
	 n8BRUyQFJ9do3Gyq99s+bFvlT82nu5Wms51HsM8xYJAL24mi2Aad6BZ2k5Z8zMMacBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
	b=tRLEhOGDgxHT1ovd7kYynyPRAj5H4QLKzGGpaFMhaofotLBcXLJdxfVJxf7FqfsK7ZDE
	 9TE/r9hjWVM/sX6cSIYPs1RMIchHtdCjl4GQLqT1BiYmSh+QkeCj1lcVnz7EhoLdf9aTs
	 1RfOtQ1MDwxHm+u9OoBCUyarYwNiPuJEG7i71hn5LN3Y71AZzG23c7yZNogULN4IXF1gI
	 gE7UCcUa3Axkym3zE408VS/8pzRxxHv+yeJ5n5z7uNlItvtCSkxwxNfYHR6L+L0Ujz12B
	 DmaFXYoMrZYBpNk0veIqI+zq7fDojCU+JGlcneFF76BGxGeLxl6TmywdHhJ0XN2xb0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfzFZQbZ;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845F60A381C
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7845F60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfzFZQbZ
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-56431524c22so678564b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223486; x=1795828286; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=XfzFZQbZQZrlLOfTcbJE0Hw2F5L7PqJsihgSYiU24rGgjKovNe/5LaOFb4l1wmvh4c
         KiF5PnjavU6PQHhES3uXJsQszfAmOcCfBUUEAUjx9gPU5N4hB71yxH8pIsrbhsNZ1t6o
         raXhTZkPchKVxOXy9Qa9FK/TBeQYSYxlH49PGnQEqNwnQTK4C/F5QMc8Wu0AjBmk/S+8
         qY5dXqbihY5sPGX+4Kq0w0yNli96vsj5e0d3SVcp0YdwoXehNG/eHUa4t846z5wwr3UB
         3WCBMzgnft7yHqJ+4iJnu7fHXt3/ks10womgTP0qvXvIb/snQziEVCSEMJWu6laqXf27
         vOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223486; x=1795828286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=EJrY4E+/1djI4+gHt/XVWLRvQyLWwNjPACMozbXEkXpej5NlsQbOsbSZQm8iUKMo+4
         N0Y46/wkZay40VVYbfFBgE5s9SQe66dzp9CcpHeaaSEjfj/EFKwiuoiPr8J2yCK6FBRv
         rJIG60RxMVnhXybW9GfX6NG87GRdXZzXqwHRL9TnIHvFnSxXX9+QFFynKZZaeGzuL1GF
         rvisV63/qT82lOu+LAL/S9suSCtkk5m9P0schKDbTF5brJUEXVYiCr4+WzLR1UVgnvS7
         hoFaR/TUJUg1ZW8457PLqYbcxuJhnVdcVLio94uyBSX3Vn2rdwKAXrtEAyg+XRUz+GyF
         JqfA==
X-Forwarded-Encrypted: i=1; AL+hErFkgeWBHQlNJXSaaiLzZQHpdmeHbuRCSQ3iqCrJZVCtSGwgjHo5cRnCtie7GtsWwOIcLzoW3PNzpISDXA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8vmjrn5/wH/4/G5iAtxF7leDX5gYUuqUQGCU55w8PLViS8l4Ci
	6XUYgHnMUO7dDlmsDvPL3T+9a4VTQ0F84XuAYK2njHnRP4gTAdEYwfzG
X-Gm-Gg: AYBFou04AXfx63eUjFcuk+pUEA1Av6nZYsVjMPkUWQ5VgHRplUKKDiFusS/wnpIFGT6
	x5veZwneR8ZkIgZF4kzBX061DEH0l0YwwMca4AA6lpjAFjtzrWSdq2NoP1FlbnmbqqZzqPpTOMs
	rREoXqXfxf91RjXy5rLgn+RefFu46fRAia2tHghTAyhyOn+q1RCnTYtaeHcimg+YaHYSNgXs7hj
	QVizJgmALBMfuZV7Ap/OS2z22m+w3+QFn9nnTnXnIn4dHQjHvB+ZiMfrEuYggGjspKse9POzckV
	Y2ufCSk7u+00Hc0CAhuA2k7jQKsKZ8LudKRbToEcmk6xZrvXoMqrktXwoEVavlp/hXrsWA28M2q
	qz57nBeKMWIfcA71ARvPddlNsBuYl5lEox5QuphlJNHTANGr2UYiFuST7LOkUmzAAxObVBh91Yp
	Ub+CA9cjCbxvYRx+7r6gDu22+i2e2xIClOWsStRxXq4Oduz8dJIO0+ig4u5pnD1Wz5RgVactXXp
	n2wrxmamwn/JYvF2xHNuYYsftDuu59oYTC7Rs4fqRF8A55/CMgL3/wlyzUkfDgMf5ehN3ffFw0c
	YE6UlUP9G0CMybTzhBVITbUVFcziF//KNuvGVhyYqLTHyPtrhpIh1ZxGzxgeBZ5mTUeAJP9Nj1L
	x4JlzISnFFyHSnWr1peOxo4/arPXZbuEpkRsIm1Hud7ekTIMZ1W6y3l/sDdNlRgStCVWiMVEXRH
	KOhagCRoJNVcrATcFmdtmfjYYU1rqsmuQoW4xK2/GHeUgSzOwn0qek
X-Received: by 2002:a05:6808:6410:b0:574:16ef:89c6 with SMTP id 5614622812f47-57a0ab2e12amr5993188b6e.35.1795223486363;
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:45 -0700
Subject: [PATCH v11 22/26] mtd: rawnand: sunxi: scan all chips before
 registering MTD devices
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-22-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

On a controller with several NAND chips, I/O to the first chip can
overlap identification of the next one. The driver registers each MTD
device as soon as it has scanned that chip. Normal I/O holds the
controller mutex, but nand_scan_ident() does not: its RESET and READ ID
operations can change the chip select and timings under the active
transfer. The transfer can also interfere with identification.

Scan all chips before registering the first MTD device. Track which
scanned chips have been registered so that a failure in either phase
cleans up every scanned chip and unregisters only published devices.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 73d6cd89ca19..abea2ab0cc42 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -274,6 +274,7 @@ struct sunxi_nfc_timings {
  * @sels: array of CS lines descriptions
  * @user_data_total: protected user bytes in a programmable layout
  * @user_data_step: maximum bytes assigned to each step, zero for a fixed layout
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -284,6 +285,7 @@ struct sunxi_nand_chip {
 	u32 timing_ctl;
 	u16 user_data_total;
 	u8 user_data_step;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2563,8 +2565,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 					      struct sunxi_nand_chip,
 					      node);
 		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
+		if (sunxi_nand->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(chip);
 		list_del(&sunxi_nand->node);
 	}
@@ -2644,13 +2648,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret) {
-		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
-		return ret;
-	}
-
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
@@ -2658,6 +2655,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2669,6 +2667,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		}
 	}
 
+	/* NAND identification must finish before MTD users can access the NFC. */
+	list_for_each_entry(sunxi_nand, &nfc->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&sunxi_nand->nand), NULL, 0);
+		if (ret) {
+			dev_err(dev, "failed to register mtd device: %d\n", ret);
+			sunxi_nand_chips_cleanup(nfc);
+			return ret;
+		}
+
+		sunxi_nand->registered = true;
+	}
+
 	return 0;
 }
 

-- 
2.53.0

