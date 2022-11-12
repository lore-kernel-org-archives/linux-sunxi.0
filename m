Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D184C184E
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:52 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h9so10109399wrt.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQfO9aSpyZwa7Ernl6ZzSUxBAyKCA7qTGVn6Uz2Hc38=;
        b=dkbbqtnqh33JkWn3vU4tGurrQNHv5Vn4+vFX207hgLEVq8Q3Zobjjdb/2kXhILQfSc
         PAbXN+1QwkaAntcWkzAvwynmfttmz07onNAzZmdZUdpVV/O3lyY7ru09rYF5bHh1WLSW
         NVxValVxzw3Ss9KAyhtlixhHJbil9fgyvuysEtG7K/CHaAwG4qrML3mpSDPkj4H/sJ3r
         Wo6WmsE8L3u75t0tnp8ULrPSuDwAiY7DPygcKa4bvbyfsCAiXazoZ8Spuz3J/yEB1X5E
         fDx81WH98jgf0ckE8S8DrtCEm1eDFswHQQIkNyifLHMK5r/oeQSCfBaE4YlwjR9R87b6
         i4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQfO9aSpyZwa7Ernl6ZzSUxBAyKCA7qTGVn6Uz2Hc38=;
        b=72aoisXGTXz4K3Ej5+i4RzBEguVn13PH9LR6Z7xShnwZ68zzMnNQLOC9JJCsrZ9Q4I
         /wily0vfPoEcG/DKTv32gQ+bEdrZH+B23t/Kk+mHWWTrbig0skRvkdjj8DXUx/1iuKFZ
         wonDis21SNJCxtqTQLl9Css2zXfKc+y9Dhv4UqSEK1dHNsSalW+lmQ7uCjzyCFfTScfl
         TlcTeVn0wjccLNskJddDgUXTdvXM6g3Vf23t4Jo4Eu2h/94kwlW9+mj7V4w/dYyr3HzS
         Y6yDh9rXhGeBbmMfHQnMRAz9TSmTV0Ew61IHokYjz7P0Q/PNfOewMsUK64g4r1HHiwmZ
         8Ksg==
X-Gm-Message-State: ANoB5pnvdiKc/TtvOavQ+cZbfvskiZiGk5+bRHthLHg9TdcauWhpWJTM
	Eb7Yy3mr94NdwdcFPjy5u0M=
X-Google-Smtp-Source: AA0mqf7O3izOCW+iaDgPQL58lh7yc12QK0xgKzsNfqmkr7Lnd+IZ9oKF5C97xqdy/F5kRAMpzPthlg==
X-Received: by 2002:a5d:4ecf:0:b0:236:5655:1393 with SMTP id s15-20020a5d4ecf000000b0023656551393mr3666679wrv.626.1668266391110;
        Sat, 12 Nov 2022 07:19:51 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id g11-20020a5d540b000000b0022cdeba3f83sm4567636wrv.84.2022.11.12.07.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:50 -0800 (PST)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lee@kernel.org
Cc: mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	brgl@bgdev.pl,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-kernel@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 15/18] mfd: stpmic1: Fix swapped mask/unmask in irq chip
Date: Sat, 12 Nov 2022 15:18:32 +0000
Message-Id: <20221112151835.39059-16-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usual behavior of mask registers is writing a '1' bit to
disable (mask) an interrupt; similarly, writing a '1' bit to
an unmask register enables (unmasks) an interrupt.

Due to a longstanding issue in regmap-irq, mask and unmask
registers were inverted when both kinds of registers were
present on the same chip, ie. regmap-irq actually wrote '1's
to the mask register to enable an IRQ and '1's to the unmask
register to disable an IRQ.

This was fixed by commit e8ffb12e7f06 ("regmap-irq: Fix
inverted handling of unmask registers") but the fix is opt-in
via mask_unmask_non_inverted = true because it requires manual
changes for each affected driver. The new behavior will become
the default once all drivers have been updated.

The STPMIC1 has a normal mask register with separate set and
clear registers. The driver intends to use the set & clear
registers with regmap-irq and has compensated for regmap-irq's
inverted behavior, and should currently be working properly.
Thus, swap mask_base and unmask_base, and opt in to the new
non-inverted behavior.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/stpmic1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/stpmic1.c b/drivers/mfd/stpmic1.c
index eb3da558c3fb..ee0469d5d435 100644
--- a/drivers/mfd/stpmic1.c
+++ b/drivers/mfd/stpmic1.c
@@ -108,8 +108,9 @@ static const struct regmap_irq stpmic1_irqs[] = {
 static const struct regmap_irq_chip stpmic1_regmap_irq_chip = {
 	.name = "pmic_irq",
 	.status_base = INT_PENDING_R1,
-	.mask_base = INT_CLEAR_MASK_R1,
-	.unmask_base = INT_SET_MASK_R1,
+	.mask_base = INT_SET_MASK_R1,
+	.unmask_base = INT_CLEAR_MASK_R1,
+	.mask_unmask_non_inverted = true,
 	.ack_base = INT_CLEAR_R1,
 	.num_regs = STPMIC1_PMIC_NUM_IRQ_REGS,
 	.irqs = stpmic1_irqs,
-- 
2.38.1

