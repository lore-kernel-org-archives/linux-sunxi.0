Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223483;
	b=gBGgNbhJM1xdeKyGErJVCPgRzAmmXna7FELdCwmXAJIQkCj/7Vwl0T/ibfr9sl/c/Us1
	 ZDcN2R9CMWtEarkL0GYAWGC/jstNdbK946l7DzLo0jBpaxr8bDn9N0ftbLoYhlqzTHRS5
	 wYgPc8mojzU7UO2fVVGSwpYNE/yLRpOlKGjJAvZLD2oV2eq4RmtF8MCMKDRda/c+GrrOX
	 ID0nE2VTL64JdC8aicQ53GbmscjyueA0XGksxFjIpPmFjTgIzbumKh2pZTpVLhODo44dC
	 S+7u8O7cMzk+r0N1Sm+AY5trSbde8homqdQnQAi6BEUQUsYGaI21AGoWZEQLcrTlCUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
	b=ruusbzFk6/kglRSF5u6Ubo+185hCelnwINT1xIpnM+m8TTwpBoYXKUEO2np5kYwD5NSe
	 AWeyEHW74OHJ4WrmgBy8thOchRCapDdpxDqjchBiwflN7NgvNmgJJO5aiKRClS5zImyrc
	 bQbCfFj/UDWZ0sOTR8mXy7qgXFD4l3AywfIW4JbEL0///OKwsMxnokdIoVuMzL8jLRPSE
	 JlRbTSr9rT1aS0tAiTigLRaS9eFlZ+j45SXDFLZ59tUhhYe79X+AvBK+Ce1NKOPw81eVF
	 IeOzllsf8W56y1Lmlm7DzjYc4cagh5JndHazbDzNZzPReSvtTHbQR1SmyxxvoCpKU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SmH7VPWq;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619C60A5BFC
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8619C60A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SmH7VPWq
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1154382a34.1
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223478; x=1795828278; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=SmH7VPWq3yajKfahPou/akdqOJPLf+ZquBJdORd61zI3kjtZX0R3U2ndD3j6VccdwT
         jgGTcC4SYcGEG9MKxyyWOBcZQI+Yy+ccMvL4JMYvYmmDfLXJBVZziVCYSgNpy6lFEcCO
         FglYxGhlJF+bkWXuZnHiWvBsuN69zOM0Oi6HqkFVUVTVBaeQwXhzmvbBrw9rjwfxK968
         swVCiyAV++gDramaIVmod/sXP38TY5u34BHlXju2HvgbAtUM9YLflGRU5bbXs4ML2hMn
         cWC6mm1H/XTXVRpMO1HNFdgHxMiVaeHa+OhENKF1vs30L4SHLhwCHT23NVBC2Us3u+xj
         ejgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223478; x=1795828278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=pG1fRxXhXgolVH7Uqqrm8ZVXS15Rq1F5OEyKzJcNIUhhYut+G3Ow0Gr6mBHfXuVq4h
         /KkEndgoxtOLX9StO1PHORndykNeTM9SUSV0GwSyB1jNV4XIDsij0G+ZRoi0d4Npgz1Q
         5rJZBp2ubejY5JOmfE02cYJTd5u5OXZpGWN2UFRiTexiKD79DZDW1PaJoqrsWEYwd5J0
         5L8gL8EUA+kv0gXGizkAPHoWGgCBs0PA4TwIKwnFZHRe70d+zTYBiZJn9jqUxiYIoUwU
         yzSrL5idK1F1OPFjZ9gWPWcCbXrsnG3qOorMZg0mtC6HlwxO2+/aDjHnqUA84fLbFOBH
         JyVg==
X-Forwarded-Encrypted: i=1; AL+hErHL+dS+GpfRoppXCHD47GGYNUwIiHrYVA+VtZwdX77NDO2p9X53Cds539mHGcFz7PH0F1YNHH7xdzorcw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8juDdNTgXHNWRmuPhraA7w9uyJvSFl6DBbioxQaRB5B7Mt+x9n
	xf34Qtalv3hmTZ4RCebDeihnVJ8HlecHidgWZi0c3I+hI55y/JT+q6/t
X-Gm-Gg: AYBFou1lObny36p8HcLm/o9IOHVrfOUwhh90Z+3WZXGwcQ19OQSzhJ6qOKdkqLFxyqi
	nFsSVWl81mowaPI2WUoWrIDxAi/Vuaa1VMUrQEdw3wtbsr6pnmQKzBeK3FYu/cIfqHIrC+JytC4
	hf1ihH3a3M1Uk5fYunksvuhont+5B5dNBL+32i09wGAQwapdYxwWG7/HE4ALibuym4ERgn7kPXw
	3c+R1e6mFDxnbvXlqD7vSzkjldK+Gv8ykHl0mtwrFa+PHLV0vkIOdjxZF0H7qUEBYo50UFiz4Px
	XG69AlUnLUZjboarKCxzZIiacV3wbjlNXs5vlqfP1z1T5RG/t3sls3b/NK07tB+NFR8AMqM80lk
	McrQQcnvRWTcs6P/oqBgjkREso7MlANWrs0ra55hFKwrZrZAU8aBmGc1VJYwGQnEkpEDArOxvzc
	DNjprFdCCpuMgq/Mox9R9zU7dleU2luK69A+G9TFXRhXSz05nVMi8i81kKwW2SsNhu4Ij4BVVB/
	e1V/Rw5qb4CgIQvQ+nIaGUHHPA6zaO9Q0kIlvuupgTJ92s7CDtiBllQBD3oqBHfzewYAFqhpRfK
	fvL057X2aKqXbpjgFV0jQU1fMPvmOK570lJm7orWJFQkokJpiBbIbrDV9ls5gAciqCYP5bFzk7S
	/sW3JwId4++IKWwrTFOzuCZ5VE945FW/7l19EXhnU3Qj+Z2ohGIz2aICgF92BXorNy7s27akLXW
	/sBirm9ytnoszTioVbB9Up8FHPvf80J25mRLGg3egjUXJjEHnQtGm+
X-Received: by 2002:a05:6808:4f06:b0:53a:9d3c:caad with SMTP id 5614622812f47-57a0a4079a5mr6188187b6e.25.1795223478418;
        Fri, 20 Nov 2026 17:11:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:39 -0700
Subject: [PATCH v11 16/26] mtd: rawnand: sunxi: limit DMA subpage ECC
 results to the requested range
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-16-9721b1905ef4@gmail.com>
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

A read of part of a NAND page can return -EBADMSG even when every ECC
step covering the requested bytes is readable. The DMA path transfers
from the start of the page and accounts for errors in that entire
prefix. An uncorrectable error in an earlier step therefore increments
the failure count that the NAND core checks for this read. Corrections
in earlier steps can likewise inflate the reported bitflip count.

Keep the DMA transfer unchanged, but only process ECC results and
perform raw erased-chunk checks for steps overlapping the request.
Keep hardware slots and user-data register indices relative to the start
of each transferred batch.

Fixes: 2de85e733601 ("mtd: nand: sunxi: Actually use DMA for subpage reads")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7f93ce226f24..5415ac6960b4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1106,6 +1106,7 @@ static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
 struct sunxi_nfc_ecc_read {
 	u8 *buf;
 	int page;
+	int first_req_step;
 	unsigned int max_bitflips;
 	bool oob_required;
 	bool dma;
@@ -1234,6 +1235,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int bitflips;
 
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		if (step < read->first_req_step)
+			continue;
+
 		if (status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1294,7 +1298,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	for (slot = 0; slot < nsteps; slot++) {
 		int step = first_step + slot;
 
-		if (!(status & NFC_ECC_ERR(slot)))
+		if (step < read->first_req_step || !(status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
@@ -1451,12 +1455,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
-					    int oob_required, int page, int nchunks)
+					    int oob_required, int page,
+					    int first_req_step, int end_step)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
 		.page = page,
+		.first_req_step = first_req_step,
 		.oob_required = oob_required,
 		.dma = true,
 	};
@@ -1464,8 +1470,9 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	unsigned int failed = mtd->ecc_stats.failed;
 	int first_step, batch_steps, ret;
 
-	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
-		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+	/* PAGE_OP transfers a prefix; only the requested steps contribute ECC results. */
+	for (first_step = 0; first_step < end_step; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, end_step);
 		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, &read, first_step, batch_steps);
 		if (ret)
 			goto err_stats;
@@ -1618,7 +1625,7 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page, 0,
 					       nand->ecc.steps);
 	if (ret >= 0)
 		return ret;
@@ -1641,14 +1648,15 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
-	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
+	int first_step = data_offs / nand->ecc.size;
+	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, first_step, end_step);
 	if (ret >= 0)
 		return ret;
 

-- 
2.53.0

