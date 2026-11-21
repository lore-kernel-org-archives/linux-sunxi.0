Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223469;
	b=FWN/aPUJcJNClL7kNLDrfeU7BQC5d3ocyVIYL1hWz28hbtXh64zLPu/gZaic8KpwD7BT
	 mFnbd+qzYTsyKWXrlfyCmQiR3nRVlSkt/R5/cSsJ/dzaiHFQzUm+VgRnkUEkcyrDYOuID
	 PEzRooWta8RD/u1y+zQQ1afs2qJUIISk9UCawfEe3fsQoqdu6HajZJYE27r/jyaCWo4QP
	 k6Fek+/Pz/8BbEd670mDXMujh6aI1Yf6/4evlVxBSMSVsWF5io+P2P6PzcrravxXVpGIV
	 6BiIYX58YTid6bJzeQCmXftW1BvA+VwnxcsLP0Zl/RexIQw2mRrTCZ87RVfpAvZ5lSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
	b=sLbNQS7jj3oP/W/UVhbl0giYkxZTWAlfa39Y4Hazn50D+5xhG05dwas2TKFO/A524GW6
	 j5Hz9R5snAIJwzDdSEsyyvYjzZtCHsbtVrAcV3gJc/8xesVzgaRwp2M7etRV9gwy2j/dj
	 MqYlx5aYU+UEYoAXU3OhXOFD1xjcisn2xEAtlt9+ERFJJWQP2GkOAxE48uruEXC+uZjB1
	 zbOZRXj8/gDxQzrljS/AXiHeT1iThwkJTdifmfb2fmIXZUE3GF4Um4++v7+eo5vVxPrXf
	 2ocd7tDGsiLYoBnOmwBb3EaaCN6KPCDetEU0wAueHFxQfc6e2svHy0yrzrc37klJY/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=um3HcWoC;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B693760A2631
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B693760A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=um3HcWoC
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed188ee81so910569fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223462; x=1795828262; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=um3HcWoCEZgwEYxokmTwCjxSnfzEutc1z7gUCQrVykFGjjRD/f29c9cpOdfNGdAMtl
         tty8ynBBCcRozV4WgUZrAuQ4wBaPI9XIVwvppE0EwrfOSBcnVd81Q1Q/nFwyEPJwH/y/
         6FDOci7gAHa1cD4mD3UgKeIOp1SgbfIWbIAz+346dvOP4FGQ1Vpz9q3S5Y9rxqaTX7fK
         qw9Mimz0Mg67f6mZ+qfc/vDAnbV6uDUIb7JRmyniYHtKywFpIvGjEGAxlTJ7ZLqwXfiU
         tuNsdnK0Pp/C8dF0yRojTaHSjBBiRmlQiyjKGnDW40lFnw0EQT4q6/bsVG5ja5mSNHgd
         F+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223462; x=1795828262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=EFc+WoYtHiw5fD2OgXC5N3KSb81QP6RdTUJinvscuc7q2Zw60ij+5nL9dWxP/kRT/2
         aFcpkd0xCRr6v85fqIGyAR76qTqPDQJl5638M63ftPGUEhCGcInm6roXeGJjIx9i43+s
         lZe3r9xm1bPd3Vj+pD+jtClXg7GSPCSt1d321hIgp4V5emkWSra589XJFdXaoQUSrmcE
         Sy/cRBfGYvYEeeRfL2loFyzNlH0vgEKyGUX5l7d/2Z4a0NpkPGXN+lB061C1MK6Qhcoj
         9AhGDAgFM6N/LTAXm6+zY/t+2DMRoaxlQx2AEXra0ZEmNcMNKpEa9oI5/ZoxlhFrwkc9
         5BpQ==
X-Forwarded-Encrypted: i=1; AL+hErFTaQEfdwaJYgAT7brwNqT1o96LYV39PvkJ9Ph9JLy91R6MrttZjk/bSBLYBgi89dWKt6f/8bHDnvQCjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Hb+aovA7e6OHIQQYaLB0Ibf+JJUijTNZSXcMjMo3RIcR2W13x
	KKPZXMDzlqy++TKMrrvXb0F1Dp0FeKKCmM+NMEEXJPuO1lidBAiWhnjB
X-Gm-Gg: AYBFou1LsunC5x/XL+RUyaLG+fLtP6ZynmLG51Vknaao00SC4hjnTcOmh6YS1BO+beJ
	4ZpEgx6Q96QbqsTSQTv/0mf6cSg7cqtmemc0wACWBaly1Gsxj8BL7K9vo2CpQfotpVZkEPLna3l
	yes4S7Yz0VHqv5UW6hZvhZ/mQSGU10s9JGQIwIACPpztB7YPqjMrT5cWW99JdBZEADioC7CH0Bd
	s3yeJdykdyhjATnIRPMdMdBh1gFMlmQAcNBwEh39coK4RuyLFvIW+/TZRdOdaK0l3L6pXr7hwBt
	sYd2itxNZQ8w9Wy6cIn9bafPtrKjnXEOGMP3S7R1sKQLtCF2wlxYw+dfwiP1iemxVT3T9cn8egb
	SsIs9b8l3cwzJvrYdGOulELshK0mJ+qcHDLsd7P4Rxw+IrYKurVxtREwUSQDaOVqL7BifI1Rc1I
	6LlqJoY+sImnpGsg8tLHs7kJiGIlEzOuaiugvt1SIXTEaiVOsi1XsmGLophv2NvFDZNsVUf1MzZ
	MV+IYxNYoKRFQ5I/vNZgeQQU9BoBPfjfBG+QowjGZ7y5EdzSN8vsZpeWe5mZNDmrtY/vVStI4VL
	EGwsan9kioLc4FKleuMRjm2d4VKtMwJnppQV4168PiUQZM+AckakNIZSGIs/PINFl/+SsahbRsV
	1cZwB6UPXO1YHSlrp8Wke7Mdo3AH0wakPrYh1kNO2gtIMPutBnk1VUZpFphcm/sUdwtaeXVwiAA
	W8B0uGq409ZbNKK5T73Jnr9GBs7xnlt180v9ON1qHS2AxjQLhAv77Q
X-Received: by 2002:a05:6808:e8c:b0:4f3:e98f:fa27 with SMTP id 5614622812f47-57a09c1107cmr6207418b6e.16.1795223462573;
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:28 -0700
Subject: [PATCH v11 05/26] mtd: rawnand: sunxi: reject ECC layouts that
 overwrite the bad-block marker
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-5-9721b1905ef4@gmail.com>
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

On 8-bit NAND with 512-byte pages the factory bad-block marker is at
OOB byte 5. With a 512-byte BCH16 step and 32 spare bytes, A10 and A23
can fit all the parity, but only bytes 0 through 3 are user data. Byte
5 is generated parity: programming a good block can change its marker,
and a mark-bad write cannot set it independently.

Reject on-host ECC if the marker is outside the two bytes reserved for
it by the layout. Leave the on-flash marker at its NAND-defined offset.

This also rejects some configurations that used to probe. On A10 and
A23, requesting a 1 KiB hardware ECC step on a 512-byte page could
trigger a fallback to software Hamming. That fallback kept the
controller's OOB layout: its first three parity bytes occupied offsets
4 through 6, including the marker at byte 5. Selecting software ECC or
no ECC explicitly does not install the controller's layout.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ffbe851b87c7..086618dee999 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -221,6 +221,7 @@
  * On H6/H616, this size became configurable, from 0 bytes to 32, via the
  * USER_DATA_LEN registers.
  */
+#define SUNXI_NFC_BBM_SIZE 2
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
@@ -1939,14 +1940,9 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
 	user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
 
-	/*
-	 * The first 2 bytes are used for BB markers, hence we
-	 * only have user_data_sz - 2 bytes available in the first user data
-	 * section.
-	 */
 	if (section == 0) {
-		oobregion->offset = 2;
-		oobregion->length = user_data_sz > 2 ? user_data_sz - 2 : 0;
+		oobregion->offset = SUNXI_NFC_BBM_SIZE;
+		oobregion->length = user_data_sz - SUNXI_NFC_BBM_SIZE;
 
 		return 0;
 	}
@@ -2099,6 +2095,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (mtd->oobsize < sunxi_get_oob_offset(sunxi_nand, ecc, nsectors))
 		return -EINVAL;
 
+	if (nand->badblockpos >= SUNXI_NFC_BBM_SIZE) {
+		dev_err(nfc->dev, "cannot store bad-block marker at OOB byte %u\n",
+			nand->badblockpos);
+		return -EOPNOTSUPP;
+	}
+
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);

-- 
2.53.0

