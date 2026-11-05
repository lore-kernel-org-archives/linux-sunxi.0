Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904942;
	b=Jsngxi64Gpq73uJoX/41rLj8IvQdT4ARYIt4WWq5ZOCuCQukIztmZyAdT/WmCqttgmOv
	 CBH3rn8Rspm8ws1sxn5ejgiH/ZLQg9MSPqoSgc0LW1VwNSxDTt1GgmB9pbBTtk/H9l0Gp
	 zTPL+bCgzP7HIsYli9fT7WrbJPldmP7z2WTm3Kp3F0CiFLmfexJsLjHbpc46qhcy8hK8+
	 +Gw4fWtqEp4BD6Fp55O3KquYsMbTfyLyoxGOmttKKPMyhYGcyYA/tVIn/p9Xld54JDpC8
	 2z+UrMyeGGXQPD56ZYIKkp41pXjYHenexAxIYLhNijJN7qkGeEnJFaafZFHg0cMFeaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=;
	b=1LEDkEYblN3i1biUWKTMuFakanCBL8XLVohkQwShK9h9VzYEiEFVKSeU1M5NXIcsUL75
	 Ml9WPEcf9xKWRouQv+gyAaNSQDIOqGwP/pAGtC4L0Cttv+0vJt3ljefHjHT+NT1xJC/d6
	 zzzldrCfkZGz+beol77rH4/Axm19Ey5Yt7gp3LyHm2Nr3fw2BsB+zq5QoFWhu80d5jOWZ
	 CXpka4zvcomv/xzhNgW+1mwI9bduCGjH2+i0hoVNbbMfT8a2WZg6cr4Ozpn/qKfIzcr+P
	 Y6uByGUOYBAc+44zQpLAmF3XdGO+gH0q6Zxf3mTw0CwKnP5J6bK1BhXw6oPHQBrXt/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URd4whpt;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668F606D824
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7668F606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URd4whpt
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-716c0217635so977519eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904941; x=1794509741; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=;
        b=URd4whptvDBUUPfaYFqlSqtPoqO5OEoMk3hhCIOuXGqCe1cd/hMgrhCJRtp+6EB8hv
         tOXfd/HUdazEBbRcuVJr/0aAay9b0h+o/FXTXfHhZPnJ1vgn+fD4VHlhhdoMRPRJudZG
         tOOksMCjUI79K79l/zMrqN4vosWmbN+oLqi6RLaxE6KOkJeASyX4oEHOqhsv0M3/XxhG
         fL9U7FC2YFwU9sQ3NauDhY8nQwBO2VFouEZKiE6ELGqXBI/Z+1lMKs6FPwqF9gGxa8vT
         hptX76pr67uDHUGp1W376lkAxFvBOfB9JJP9tezDaLG5LtqxwWAxc59IwXH4PYd8yVXw
         xTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904941; x=1794509741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=;
        b=s2ih0t9xNMXbVvnpnhyCAErvHs17sHarg8XiGPYPMnvrH3je/BZ5HueAqMfW5Kh0dB
         OhtPnpH4HxWvkqi5m9QMfEP6pal75pyiplbcpZTfBD1+VmjG5nPuZnfZFB0gi9IK35jS
         oU231Lj2HZ2GnS69lE9Xph8xtZr21wvrJY6wxlXnBwdLwsHL4IW3VEaTYpcHixu6+wqj
         7giBNIMJCseWQwpeYlAQ4aYsLDBt8ToagLlRnjhNVGMIym03d5clSIP8n+Tn6+QWn+a1
         17izOVvzH9HqgmQPNdCC8yXZ9S2uLv/vew2T/5pIes3sycMqNbcC/sPV7ztinpIqSf72
         UBcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU0gzG+tdSrS8Q0xWGUX2cECgF0Xs/sbGFOtbfQFBHAsa5ZrEmqAR4aFd19W6Q6pLTHAqXUbKaqHrXtQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z91K/++Vy1nFPNdQuNCJ/ePSfZ5pLXM2IDc4M7sApzW2ygSa0r9
	NZtWbcI0L+5vCovsegra1ntFhrpiC/dF8Vrv/AiAE87AKZco6pUmV052
X-Gm-Gg: AYBFou2Mp+dAIXy3OiFPg8DJKP/MdaDyimm4rMaqD4aXFzzkIC6gmFMJgJk4y4zDwXY
	CQeqdroS1bzbYWeSSKVnbrG6PkawdNrBFqm2BLOBQJ8OC8PqnmU2TEFycdtciOkSzkZbMLlgVYO
	dYZm/r+j1QM2Gf3p9dG0EiI/9JD2ljmjbtE02nLA55Yx0avnmnXJGLCPy9KYBzFsRYPFRvViFdw
	krKRzmRIkB7shGUbXK2w+6xTzp+HZzDeh4h91Jlw8PXb7z+EIU40apeM0OVpaotPD1cX45a0d6C
	9jATHpnD9TGLlGhBOl6KhJY+liESL3pWgywKhufAZOMeWYstPy7+41KSFdYbqOrLugiCZWeinXK
	M/TGJUPvryuELNIY0bbgeHysRNK2uNP6M/gUKtahdi0SqgxUQN7USkhDybglgZ+Mn0q8L3f175P
	2K5YYWq0Waqg0FIdA0E/RGHdcOeyLmnDQd6hdEkGBu+WsBxq2Gu+7QGk/1rULc3c8hdOjpJGT8J
	0ibIBWnFSDSuDzr4v+5WrqkLqsGJ+broFnlLKT8tLThkw317NVgcqle0E6Z76gtBblWgDJNnLOd
	EbAmKvm21AdsXeVACKPJEU2cNYfSpyMEPXxuntMJScBio+8/Q7QL271/qajd1+0kkOZRgNJt4hG
	Myz6PFeLAWXeVuJ/xq20vq9iqoHJOpZXEtKHSJEcftVfHqfcZ15V9OtvIH5JSXTNBEOnnL0Y1JE
	28Gz1B+fiJBpJTRZ4C4kWGGfBDdAPUUxSUjQgsU5xVJgIAMZNI2UaT
X-Received: by 2002:a05:6820:c5ce:10b0:716:b936:7cf6 with SMTP id 006d021491bc7-716e73763e0mr260411eaf.4.1793904941072;
        Thu, 05 Nov 2026 10:55:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:22 -0700
Subject: [PATCH v10 06/26] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-6-dca1f6ed29a8@gmail.com>
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

The ECC read callbacks ignore nand_read_page_op() failures. A command or
ready timeout can therefore leave the requested page unselected, yet the
driver continues with data transfers and can report success for stale
data. Return the setup error before starting PIO or DMA.

After an ECC error, the driver rereads the physical data and OOB with
randomization disabled to distinguish an erased chunk from corrupt data.
Those rereads can also fail. Do not pass stale buffers to
nand_check_erased_ecc_chunk() or count a transport failure as an ECC
result: return the reread error instead. Successful erased checks retain
their existing statistics and correction-count behavior.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

These unchecked returns were found by inspecting the read callbacks and
their NAND-operation helpers.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ae18a7fbca77..9a7b365e998e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1043,7 +1043,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
-/* Return whether the chunk is erased, and account for its ECC result. */
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
 static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
@@ -1055,10 +1058,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
 
-	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1322,6 +1331,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1329,6 +1339,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1380,9 +1392,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
 					    0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
+
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
 
-	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1468,7 +1490,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1476,10 +1500,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1490,7 +1515,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1513,7 +1540,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1522,10 +1551,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = read.max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1538,7 +1568,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

