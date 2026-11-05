Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904939;
	b=EimoxS7iPkVxOMIKPChpjZ9Af1wJwfKcdgTvvatypY0Bv7De3BpICgW/sw28VzduTSSw
	 iHFNQFl/3dK+X+G8i3MGlQMBQV1jKvNJaqbfQMuzwl1+3JVXLsnK3VDNCh6YtAghfaR0t
	 Z0jHI8cT1NjmViJgiWxDb2gSk8eHc3DP5g6Np7AQoQKPqwJY1ly5e1PPfb/ZN6pwsiT8R
	 JZTYggEcT43mBxu0jJf69jtKA74Av6PJvFKZS3NZ7pJPsUdOhDjfN5JiwauALWPkGBPQO
	 cA3TR/sxualw5g27HAKq2MRQ7PhgEuuzQFRNpD+gLMfzTJKlTctaF4EGG2M08sXhYOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
	b=FldMIPR/1uvgOJ7vxGvKAPruKTNDxaIaKUctqqg3YqPGQg3hjUI8p8VlrWlE8f/5Y4I1
	 bb4a/yYJyWS7uSLI25nE6eQY4sf1cG3+J/SMHLVoU4BJYCBNk6LMdMnWmIZdV0A0a7na9
	 TgUtkPOFoELBR4Gy00jU5GDuwVd2ONv2LXUmjlMrzrOolUL/U7gvp1N0wl9Q1DInHTTaj
	 8XvifcIxIiuYQquB9X22kS7Wml325Rah9Mt9KkCISeKRK+W1a8f1XTtHZZdWFdiSylQpU
	 VUR9yfnVQIYPtXhNyI4dD2lsq/j4Ug0ZV0f7zzDavJJgVKgzdPmDCOZzGeHH8eJvN8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjkFtusj;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739F8606D805
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739F8606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjkFtusj
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-70bf1671c21so1459137eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904933; x=1794509733; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=rjkFtusjOAHNq/ned4J5LW6Ltz7bAVhWQ2g6+jkXBmNOCqEv7W6P4YKN9CD4jaZ6O+
         5JSqOySdMCoT0IkiINMaNcc/vzgtd8lIdvVzpYOGiV0E+PO3tiYBu2m5fuSRNJ7gKSjD
         30dn1MlB97IX5mMPgUc4dYxeDHze9AkGorNyHC9mqlQMYUdeodFpNbx3OTGZf+IIH5H2
         cu/uJuctPoLvij1Sfn3TDkIorcQpF5Xp7SjsbeZ3vOUndtYcJXN5FE/kdGydpW+sS/VI
         D3wmibbHOP77LUnEkHsmrBk841ylCbM4SVGwD46SQtVPwSO42rQwmNTfAZg5Q8ytQ6lM
         RrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904933; x=1794509733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=Tt9nRh0/wf8AdHlXbfyWxiyMDUlBW9pMGwq44XIgEk+mULZanB/HsHm4lfYXd0S/uI
         JjRDdBuEoH8m0zXvTOPvJgjnElADR0Fs6+fGfyT/P0SUclmTXKhzKQ5SPIt+cfyjJWN/
         E0N8baZwqgK13Kmb4QWTM0zwI5nnkn+J7LiB3af5lVeGmGKm8cFxss3Ys89ktqAnymlZ
         AuPkwsNy6TmGRRZpVwkEPeTS4RWQAGJNF3yfGVmSYX3hfz7gqsXDhAN63epKjG7iXLZh
         tqVKVgIUvctEVRqMTnnPKYjsdfUcMBGihVTjdFhKbHmAMeZ95XF6CnfM541D3PnCddCn
         MvFw==
X-Forwarded-Encrypted: i=1; AKwUvBy79BTTBROYLRsdsnMX++rwvs25C8Ciw9lRVhwh4GqcLtCQxXMgfwD/8l3Pc7T3XM/t9il2CAFfao1r4A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+xjKbSyGcVMca+dezF2F09O8/V2LuZCl3UjiVE3XO5d5FZDc4Q
	gqDFNqK0zLTt3OOwZWEOVIqtKNQ508+sl3fPpKTlvfvH2H6j+DBeW160
X-Gm-Gg: AYBFou0+HrZ/6H/T5UO7A6U1sKbSfJvuX5a33zVUBmZJ3hfGf7qTWxAQRPkJfJI/BsC
	sooZYA7UjbV4c4TWjX3Y2rz/bv+cHD0MjZlJAnCWO5FZ3ndTPXqj3rR/CZrJeoaAC7CdtY+KtdR
	1+SQD1LzbQpR38fs6/t7NymWGSj96esfdqWCdCPX5kSdEy2I4pRPtYODlLjYatqBzNK3d6kWQGB
	pZD9b5dEvoaE5jsWlX/XULW+ujlrBmLyYUDwiPkMYADH+HbMmxrSZLeqlbj39nDUAjEXzcsQAhn
	tt43BYTp0utFSwPcx7L2yvfKQYIrNIxEXysCtGXWw2UYbgauM5rq1ySF4/bykIpEUlruO/JU8vn
	SeXzgmskuDFBs0Lj7joivq2k7LS96NlMTrLqREHrXgtlS92DWZKSLcdulPNSjORNyTpdTDr/c4u
	lJFNSXgDJutlp60fKo9iFwIgOgNX1h5xxbfnJraaoQNwJGyAqxRR29iXt3Rzen8iAfTKasAS6k0
	aj1TI+KR+Q6PVk9uw5A1BXpoEVtXxGN6j6pPkoWcNR4E0TgU8Qy29GmtXjKxmmbbWvuJTI7Dtj7
	6Rz4TXxWvp0TySLcJUU/Nsrf2iAKWhRkTXvtAAxgVPOqrDZ75O/Muejau5a9a6tJu+W0AumNanH
	HVyPA2W3ZN1AFDlUJ+Afe1v7XvmBHNITpkIE7dlraqVdqPXxChH85bvzbU0IaCIEQxPb+2hIe1M
	oz3nTPG9EXLyIsHbs+8o4t7sxOIbii+1ldLgTI83E/M1EtwXVcQ3h47Ia237dsEuIOCMzNTdUJ8
	Q==
X-Received: by 2002:a05:6820:7048:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-716e73a98famr324182eaf.13.1793904933325;
        Thu, 05 Nov 2026 10:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:19 -0700
Subject: [PATCH v10 03/26] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-3-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
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
X-Mailer: b4 0.15.2

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b75984961699..662d96fc2535 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1513,8 +1513,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1537,8 +1535,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
@@ -1562,8 +1558,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1589,8 +1583,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
@@ -1612,8 +1604,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1652,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);

-- 
2.53.0

