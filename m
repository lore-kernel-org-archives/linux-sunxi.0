Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223489;
	b=KD9eK5zsjDn/15HT//hBC+7/xtxIuTqXviG0cOEmZTg8aTykWkLPRpnyVU5NQeQQq+Xx
	 D6C6QutAvUoBdumdMyJs8z3R9DuPiFlxXVYqInrow+tGglnmuXJlc/FkPn8xWOEdciZHU
	 CgDEwZ26CEEmpGs1JTp4VrwyeRqMHPT/nWOkXj2I6nEZynKFXoIr+qQfrtVbPTrTp4RR9
	 og3ZVfXSqoaV8dGuIEMjZHQCW/NPUt1MLpFKLSxJfgan3fAqc1RSqHZSzy6C23vK0daN/
	 4iRGa+b4OcWxtLPXEsYrbUlqMXt3a5qR5h1/PaAiLdhBVike3tqU+9gB6M8ijaPUhWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
	b=vUvLYOrJAF561Jrr4dU5e0U5G3EvWg32YyrPIOMgIZ855OdtuTpEhoHhKpg3zMZuB187
	 r6fEiEkuSIzKl23OEb381hxvZGFALVMk79Nsjo9lakqmynxnqwG7kVurdCvIyHTJ+ndyW
	 riLOSR59SVf4c2jym3I8TXFTYiU+lXgbi2vHEfrGNPUIB8usiQATpuVcZh8e7lfVzbkO8
	 czdXlnlg4JAefGBxs67QAzkc+32EXNwxdW6or4Pc33eB7eUEZCwj0IqCQSr/D9+sK0Bd6
	 Llh+prP5Ux7n3BCgndmlLOOFfftdIeZmg4/fUknWhRIBpYeM3D2giqABs/+/h0bFFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4dNc7KP;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44E0606ACC6
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44E0606ACC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4dNc7KP
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4adae187d94so987942fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223484; x=1795828284; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=o4dNc7KP7hrqB5AW0L07UCEdUqWPT9AJ+74zVETvVBAsPGdILQ/TODJ2NShKJK0UYw
         gQ2m2uJnt07V+F1Z4og3gDtNIz64CDJ9UJJbWx0Q5Vlwvr5WL28RrVY5wY3gJL5jIxkD
         1CMxEEpHg/tzQRXlwEJgPm8QicowwhufmDdxXYtr0uB1s42d5zx1IM8EatPu9bBK8Rtn
         uvzpe0X0uQC8DzcHnSu6dGfWs0WM+Gm2jYuWbesOXyRObQ8mvT5ma+i3FktILj3LKQdU
         DrXwhcXhIJva4MX/DMCk8KSmmmlyklD9yPUdEpk32uAf7fuKEwIhTzUtyuGGVgjsBI7e
         7AKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223484; x=1795828284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=FyRlqQ2lmfMZB2JD7tf37gXuJkerA9SJ1hGY73M82twGDlmGeq5alkk3AT9fagsvka
         YxgQ+RTSfxHimt1ckwUrheszIezHjiBUHgAhxZ1+fqwj8y9MYcCD8sOoMrxX3qJYoEie
         p3QJp0WeTiv6TYJ7PqiKayNl1tlpHRjPO8oQs7YQLZPEHMtl4E65a3Lv/chXIoCxfrce
         +/qIJ/ttNM6J9RuS+CbDJXwucosfdBrA/r6hSOompjcX3UGkQJjGxDpqWU5UPADYXjBH
         ZkUaNcSCzqOuSCrTxXqzTnX1uGM6Zjuft7hdrAUmvCpC63mtna0zpTtcAu7KOmcRX121
         JhDg==
X-Forwarded-Encrypted: i=1; AL+hErEfeBn7d0bxxKuCOmtujAR36kP51Rk57qcrM0qse2ySR0JDkYoeH47adK1zQpfnNjJh5tuctbPzUQEamQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8XKJdn6p9ot6F7M5JQtqEiuvTEfbjFQCqYWj23jowMn7aCNKZi
	nqdzHKTBMmKvyMD2QiuNSGWSoLT+fKyi9U6hLpc1YzQdMpcTD5vM9fyD
X-Gm-Gg: AYBFou1V6ghXvIvdNhv/lru9Ato9qFv6aHRs+ExvXqLUqjqX77RGjvjt1btnu/mt11M
	9AwABw5piqIkHqjFuBWvDRM1T8SKvh+ub9TpEXSTVYaizixC2N5NFWwstWVjB4LCMNwwI3237N6
	Ok+BODP6N5DhWl3sh/ED+HLoWMU+JuSQ0t8jApB7+GybuDU5yOq3GS7j6sB7Av1H6Uw+EoN49WJ
	E5qJoauMFnH/zS0HlZLm59zQweWQMSe/WJi2XYEWVWaR2hu8SJgbVMdTSHDfnwMdLlMfcOxpGRO
	Bc0kbf++XWAgA4ABOXSu2zf7gHrYoc010S/WhIrwMCsANGi/cwtT0+Y30/JK1oBPLX5nt9eh8Gi
	dK2aFHI1YUAJ7/b5Ix33LUyWv/FWKQs/gBQstOyTN1YmBSpmXze5Rk/4i8d0AWOyvEE+ANzW2AF
	E5Qahf5/ET2KAh+9mbFn6H3biNI9Zxi2C0zdHPK1U7Opuhvcg5t/DclGByymr67PISCXaFFRH3d
	qMbjMwM5UhM3o1oFKL9DKEcU1wQTfxZRJtaXXypGvmIuotaqBFHixPHXL9+XkPqwMz1StvoV0YF
	o/9BJ0EZhj/TQlg99CmOBkH7MYHE9b3cfMML0bdkn2URm3mG6/E0nD5Vi5vA9hMO7G2xekCvkql
	gly2smxRXzXRBaapPvkNAJ1+jL8a5SCmB7f/MQCYUqA9FgrOXSlvXL78+vS9+u7kJGiXz43IrYA
	IBnukTQV2JY03Mhn+e9HGvxlVZ37cGL2z5Wa9swU0qOiqdIfsW6o+Q
X-Received: by 2002:a05:6808:4fdf:b0:571:b166:3d77 with SMTP id 5614622812f47-57a0af33b0amr6477590b6e.27.1795223483689;
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:43 -0700
Subject: [PATCH v11 20/26] mtd: rawnand: sunxi: limit buffer transfers to
 the command byte count
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-20-9721b1905ef4@gmail.com>
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

On H616 a page operation can report success after reading or writing
only part of a large unprotected OOB tail. The controller has 8 KiB of
SRAM, but its normal-command byte count has only ten bits, with zero
encoding 1024 bytes. The buffer helpers use the SRAM size as their
limit and advance by the requested length, even when the controller
transfers fewer bytes.

The operation parser already splits data transfers at 1024 bytes, but
the extra-OOB helpers call the buffer helpers directly. Share the
parser's byte-count limit with the buffer helpers and keep each chunk
within the controller's SRAM. Larger buffers are transferred in
successive commands; controllers with 1 KiB of SRAM keep their
existing chunk size.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 37cc023db74e..4478189bf920 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -89,6 +89,9 @@
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
+/* Maximum byte count for a normal data-transfer command. */
+#define NFC_MAX_BYTE_COUNT	1024
+
 /* define bit use in NFC_CTL */
 #define NFC_EN			BIT(0)
 #define NFC_RESET		BIT(1)
@@ -667,7 +670,7 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 {
-	return min(len, nfc->caps->sram_size);
+	return min3(len, nfc->caps->sram_size, NFC_MAX_BYTE_COUNT);
 }
 
 static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
@@ -2498,11 +2501,11 @@ static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
 );
@@ -2512,11 +2515,11 @@ static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_soft_waitrdy,
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),

-- 
2.53.0

