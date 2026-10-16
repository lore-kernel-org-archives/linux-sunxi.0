Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7B38B131
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 03:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122340; cv=none; b=LPuarIdj2ugvpedLLO28Hzj5qKyUCO2+IaB7OsXvHTQC71Xo5FeWwwUJLVNfY/AiLFiFzBK93uhMBpqJSe2UwrCDg++nQCFw9JXJKhvBbpcdoN/TGDHN6fr9rXzgH6ICZhWT8ACq0loDoZNFeM6j90GRw+BAMTRSToQGU2hmauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122340; c=relaxed/simple;
	bh=HeEn7ZBI4PAW/iteNQhqHA4zXunmr3jV3/OD3Rh6OA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8SHAPLecImgpmucc7ngVPprnmtWHo5XEzyn3VJp/8cwYgj1UiSOYTI/6GHvwpw+SG3TnA1UwY7IqCSchI90ettt4dknLhdrYO0gtreMNyfOe2odw7V3A0+JT+AUxlWxfg/jw7/Zlz657BuRYSMQhFL+7jmHREax1LGvFNu5caI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma4A8ijT; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma4A8ijT"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-823e4047037so4571187a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 20:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122337; x=1792727137; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=;
        b=ma4A8ijTZIlhygedjQHcnkgWZ2qGokOU5BwZeGrJncfyFW8qyJz2AG65DvqxCoJsrX
         vmdirW6FRyLQVAC8MifKxpWeCNFMQgQqQW+42HkvDmb7f68PzK6D3aE09NLozZb3k5Pq
         VqZwEoBLnizk6ytinfyyxPMUjRD7tZQhOwlfyfR7nGePVGTlAMNcVw9YXauWiwayFhPE
         1jjBdVP8ERpWmvY3chELnN3YgRrrjFaUwtdatriMWU3lhIjsYAsZwCcCtZXKgdn4ZQN7
         6u/mBqLlI6N6/cCOTbgcf69Cwo+KslZFndfLbubuSybW1kzWbYdp3g7LQZI77O0jeJCj
         tWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122337; x=1792727137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=;
        b=l3c4h3RcnyZ5a1wG6LPfFEq/J5tbouDsOh8We3xzN8yrobE9WhDEZDBxLN/XOBaCQp
         ulCDaKPJzY9z8sY0Dvyd/8Pz0RWk7n6wTNv/DSiZbXvLyITnHPIT7pra49ZyQnN8l/1i
         cewXqKHsyRlBsVbJhPWYtGBKTrr/2DFizim3/iX8VGPpuEeKM46xtQ7XIh5w04eg4Csn
         mTMpdd5ffyRmkgtuqRQtjs0jr2fkTEOozeqKSo/PzMP6jwZkGrEYkeIgB6viphMXV9MN
         eDE5fPnE7+4HR1Jzw0qaxaSpgxMO3+tJqgi5q5SBlwAmwzNT183zSrKTD5RKsmqOachP
         epZA==
X-Forwarded-Encrypted: i=1; AKwUvBwZnOEgrkXDSQblAjeSXThUdm4qFVZ39h5vUjAr7B9v4kk6WQnpsGqiIZLsJpkziCk+sWRbegZkFXfsgg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLcrNNz4SzSe7wNRwSR43Vl2iI9nT0f2HJsBDjhMV4Pebh63mhw
	8dcl9OIX5/duwoo4Mj5Jg8ffyQ0yweKN1+q+CByQhaDQO/LCwhyqIyteWnS4ILNQ
X-Gm-Gg: AYBFou0yBa+10aLbnG1Y7bTwnUot/FGjBRJfbugzbrrgihw/xOrDwdk062mj8dE7W8o
	5ZqCYUNcbIr9opbxtSSILjovSrqB/rq196rmefviibn5R+kjlrWaRQpQjClFQpLsk0YNOOuzwp4
	SLXf/rjeStthizdli9h4wbLo5RijkKLWz11eSk7udFXLw3FJWcJD3ZV7WakYpbtoCQ83FanGiVH
	ySlXZJNW6O79v3NVmK+SJdB03hVJSy4jbtSPzWTbW+quHbnDSSc5kMjdR91NWSYWhBWp0+LGG/0
	+XYLF7sCWc8KSlWXfKVYDPWDZ9FWc3N2UFmlAJjfZxd1G20eGe4S+2+BJJCdgVU4bemBps+tyi3
	LyQJKfqpKga7QQVr8+N6dnGtkNIJWgPlYrXlLB72JckX7qRG7LZk+oPf0br0WiYG8wqKpV8maj4
	c80NbG9CvtRGgxOnoEH+AjJ0ZWLhJJDaN1uloO3N9Z2BFk+Fl/z5lQcdSdM5f7X5mHC1NbPw3vk
	LwpXh6tqFKGaziHGiHoJDmNUT91T/9D14CaF1IL6+3nCkcXhVLV/BpstKkOb8gHCaN1qny/RInp
	S5a/VKzpGTttRYbXLsrZ+b3op252bVTfntQIOZNjjb01cA0daEVQG/3UcQ/w9tK30VgOgjXL08O
	NH8wDNLhsyhDPMrx6aIcxjw==
X-Received: by 2002:a05:6830:6a14:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-8309814bd65mr21830521a34.29.1792122336679;
        Thu, 15 Oct 2026 20:45:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:21 -0600
Subject: [PATCH v8 06/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-6-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d71b980ababb..661ced4e07de 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1108,7 +1108,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

