Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2313D891
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jul 2026 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783134506; cv=none; b=JOKkXr446mx1peOpuYmJP9XP64qd/adtppnV+Ibau79T3ZgPFsqk8TVjDXXhTFcTFxSmDKIfiIhbnVxebwneFtBrpIC4n2p+7Egvt8FOXsvk3ip/ykLRN9TkchzGq34c9jzZEETA+nEzMKfBMCvwMwro93pbgzNdb1YI4UwvyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783134506; c=relaxed/simple;
	bh=LPbIiJ7zZmtBsIO/M1EHjHGvs0QLJs0MmcNIQUDABz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jpVHICasnOxpuFy5on3MJ8eQqDtfiJbpbYhs1z9VkM2q5VNZ+kAbVj0baUe8XzgA5p2u70CNtNpqewCcWKgAq784lOHb5t5r/fhnQ7KJZp2B6t2FvnOj9PLoUA1ygJcHczAUF+a4BYFPPG2Kh+AqQ6PMZKc38NeJ709IidnRfU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7xQ6zod; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7xQ6zod"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so5037756d6.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 20:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783134504; x=1783739304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkTBzbT5X5ABHpzerhcst+4XPlgsmU1dg5Oeat7Iwoo=;
        b=C7xQ6zodQzNXqRNOOvvCSdKTaWdafzv3KpEtou7z7yoYzM9gas6V4OTeeCyggMG6R0
         BAobSDO9V8kcb/nDava5yc3tWVUJOT2PbRUpHbljca4Xo57eXU2l0fDYndupVmTkOnJH
         7E27MpdtXbKtc9FmOY1OF17HsfxHtN4YrLdfYYs6MxWR8jDVT/f0SorTHayOQOSrnt3J
         tf66/Tq2WGxXMm3sEgc8n8e+JpJiu/xlFX9HojHeZY/AJzDXNcnxCey4O0oJb4Uxlnnd
         EdQcSeUAv19CNxhsJXyM3/3OQ+ZM5bq72a0Tei8Dwi4XquNxIL3Pyz+F+qfaUdCij5C8
         bgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783134504; x=1783739304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkTBzbT5X5ABHpzerhcst+4XPlgsmU1dg5Oeat7Iwoo=;
        b=nXZ86cqaUb6ry7cOJGoMxjMHQICgtPxgrYiFW4rPn4gEnFtqWei6JgxFP82t6FBUeW
         haeufEFlSXqGEz5+kZnO5xVixhuB56YhLVWxUaLgQeLS4lo0CjlmfNkZnJ8qJRiBR4hz
         e7tnsQnF+E0JiUdpvnPWLcyE87hPU31g5KGQy3lC3CBF0+oygk6eUfjd6XMxUyJ0dRit
         h23c9N9lbOPVdG5uC0BkgrtJcW2vzRXK8FzhfhMRjpWBeVYAjn+5lIOp0nSur4bL1QQV
         eTqehAxX8aWL/RENUCNhA1GdX+icpoLqO2BkMfb1hMZQo+9cQ3dFtnEGKgeDVyNy5eVT
         kyKQ==
X-Gm-Message-State: AOJu0Yye+nQBGxPCfSeSrkLW63aVaKG+X+2JOaUMHSxLRUbHjU1m1Xk6
	hmHPaiyKszB+B1fHzb7HoGUeqgOXUFZjfJ0UJjCpxPylDcN/ExjITZxs
X-Gm-Gg: AfdE7clwoscB0QRrYS8CdlexJtgAWIzgyuFswuPlFlo/7sGSy5K87TTQ5UMePNNDnrG
	erOGW1gGRonVbO3cy1X5oAXjUjWjgnGKpL47+6fj48HcXRpcXlyAIl6cnIOab5EeiOpWgX9yfuK
	/n+o3R6FcWEJuHWuYp+5z6GF1BeXb4w8tnZeG+0rowwEgWDi4RS+bwWTITe/2XkqsshlI5aMzNb
	GFb2fkw9eRsBcV+S/dtly6UdkNOQ1s3Qb/iRKfPxyv3a8zwbTKQfmvidxVZNwySR1BAxPCg99so
	D4KG2E6bUi9rEZULSxnK8BbkBhoXJFsKG6BxWNaqXgsIaTZ/01KlI72weoYOTkCbjo1re7/IYjM
	cb3rPhwGk55mrH9oWgh1xDG9NqQn+/1nONoqqXR7FXzl6ifHs3kik+T5IUiXvwrxXXGUoELuhmd
	Zk7JETg4ja7EDhIB6WwJWOxErUWlqRhmRv0xnMNMBy+/sEt5zjMe681qq/5nbJ
X-Received: by 2002:a05:620a:1723:b0:92e:72a4:f290 with SMTP id af79cd13be357-92e9a39fccfmr248652085a.19.1783134503564;
        Fri, 03 Jul 2026 20:08:23 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b804c1sm317815885a.5.2026.07.03.20.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 20:08:23 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH] pinctrl: sunxi: fix EINT bank indexing for SoCs with empty leading banks
Date: Fri,  3 Jul 2026 23:08:21 -0400
Message-ID: <20260704030821.561389-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT-table init assigns interrupt bank indices by incrementing on
every bank transition, starting from bank 0 - correct only when bank
A actually has pins. On the A733 bank A is empty, so every EINT bank
got an index one too high: the per-bank parent interrupt was taken
from the next bank's slot in the DT list (bank K falling off the end
entirely), while the EINT registers were still addressed correctly
only because the shifted index happened to coincide with the pin-bank
number under the NCAT3 layout.

Assign 0-based indices over the IRQ-capable banks that actually have
pins, record the pin bank each index refers to in an irq_bank_map,
and honour that map in the NCAT3 register-base formula the same way
the legacy layout already does.

On the Cubie A7S this makes a PB EINT consumer raise its events on
GPIOB's interrupt line instead of GPIOC's - the previously observed
'bank-B IRQ storm' with gpio-keys was the unclaimed GPIOB line
screaming while the handler listened one bank up.

Assisted-by: Claude-Code:claude-fable-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Andre,

This sits on top of your (as-yet unmerged) A733/NCAT3 pinctrl series -
it does not apply to mainline on its own, so it is offered for you to
fold into your v2 rather than as a standalone submission. I found the
off-by-one while bringing up EINTs on the Cubie A7S; it retroactively
explains the bank-B "IRQ storm" you may have seen with gpio-keys.

Not marked Tested-by: the register-addressing and DT-list reasoning is
confirmed by inspection and the IRQ-line behaviour was observed on
hardware, but a clean end-to-end EINT boot is still blocked on an
unrelated DVFS-lane instability on my tree, so I do not want to
overclaim. Take it, adapt it, or drop it as you see fit for v2.

 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 34 +++++++++++++++++-------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h    |  5 ++--
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd..e0036df81 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -143,12 +143,14 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
  */
 static int prepare_function_table(struct device *dev, struct device_node *pnode,
 				  struct sunxi_desc_pin *pins, int npins,
-				  unsigned pin_base, const u8 *irq_bank_muxes)
+				  unsigned int pin_base, const u8 *irq_bank_muxes,
+				  struct sunxi_pinctrl_desc *desc)
 {
 	struct device_node *node;
 	struct property *prop;
 	struct sunxi_desc_function *func;
-	int num_funcs, irq_bank, last_bank, i;
+	unsigned int *irq_bank_map;
+	int num_funcs, irq_bank, last_irq_bank, i;
 
 	/*
 	 * We need at least three functions per pin:
@@ -207,8 +209,20 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * Assign the function's memory and fill in GPIOs, IRQ and a sentinel.
 	 * The extra functions will be filled in later.
 	 */
-	irq_bank = 0;
-	last_bank = 0;
+	/*
+	 * The interrupt bank index selects both the per-bank parent
+	 * interrupt (the DT lists one per IRQ-capable bank, in order)
+	 * and, through irq_bank_map, the pin bank holding the EINT
+	 * registers. The first IRQ-capable bank with any pins must get
+	 * index 0 even when lower banks (like PA here) have no pins.
+	 */
+	irq_bank_map = devm_kcalloc(dev, SUNXI_PINCTRL_MAX_BANKS,
+				    sizeof(*irq_bank_map), GFP_KERNEL);
+	if (!irq_bank_map)
+		return -ENOMEM;
+
+	irq_bank = -1;
+	last_irq_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,17 +235,17 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (bank != last_irq_bank) {
 				irq_bank++;
+				irq_bank_map[irq_bank] = bank;
+				last_irq_bank = bank;
+			}
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
 		}
 
-		if (bank > last_bank)
-			last_bank = bank;
-
 		pin->functions = func;
 
 		/* Skip over the other needed functions and the sentinel. */
@@ -244,6 +258,8 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		pin->variant = 2;
 	}
 
+	desc->irq_bank_map = irq_bank_map;
+
 	return 0;
 }
 
@@ -352,7 +368,7 @@ int sunxi_pinctrl_dt_table_init(struct platform_device *pdev,
 		return PTR_ERR(pins);
 
 	ret = prepare_function_table(&pdev->dev, pnode, pins, desc->npins,
-				     desc->pin_base, irq_bank_muxes);
+				     desc->pin_base, irq_bank_muxes, desc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 699ae8850..9aab94601 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -252,8 +252,9 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
 	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
-		return pctl->bank_offset + bank * pctl->bank_mem_size +
-		       A733_IRQ_REGS_OFFSET;
+		return pctl->bank_offset +
+		       sunxi_irq_hw_bank_num(pctl->desc, bank) *
+		       pctl->bank_mem_size + A733_IRQ_REGS_OFFSET;
 
 	return IRQ_REGS_OFFSET +
 	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
-- 
2.53.0

