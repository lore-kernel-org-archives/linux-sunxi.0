Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938268;
	b=CGEZFAOcotzZCLXEeW7r1Rr3OqeLuJ5mUcXeOXO3QFroWqgCLCzfpLLQ8TsQtf3+/DAt
	 Za7zFPK8IwNguCzm7KwWxPYLd/CvKFzjBraXZ3rhVSWoVM0EHCTJ6XHZqTnj/JuOjR4/9
	 ZGNUM32EeBosrebtLePr3mQ5BlgAIX6lCqo6W74ElaNpseWZ32iOi44SAYB/l9COcgIwM
	 c9EAYcmYFf629y7Nk/3auZeif0JL7q1tDfBnJzxIBfo5V3z6Z8FCUwCrOmoAxQUcrP+8H
	 PoTp6YhQqfCVPjQ6d7eW2sUOmeTTMA4akQR+zgVidNKfaoMnETlDLQrfLT+gHRcBZYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
	b=j/FbLfnrct2Sp6rWJKHukNOgIV1ijFb+jiObo95+kTR3cQ0RPSW9E/hsyu5DB5oKOn9f
	 7pGhkE8i3HzmJ8gdKFDfD0Wfqg8DsNL21Uj+NDz333WaQVryKs/6PMxR57NiKBUjdpF5W
	 N9gB90hoFgK/HF9TsLwk+QxHPdUDniaJFkF/xO+41c10PfMtgGU3yrCcbaPqQ1LfzXVfC
	 pbK+lf+GCrulNoEy1p2kXF1TMWyVMi2z5PK7Lxt4SCv7YhBdaelmC6PMSZdqREUQfcRLW
	 GUPoaQRjrwyyfBMcLO4fDzqIkrqKXon0XvAcr7E8iJgPTnDLiRVYyCDCjsNDj6NdA9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SNDBVZlp;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06DD606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 14:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06DD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SNDBVZlp
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1905163f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938266; x=1793543066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
        b=SNDBVZlpAIw96vMWk8wolpv7n0Q65KZENNtroyvQVpKBI5yrcKXyOTwsTuTcpjGMQ5
         FdPsmdJNxjruT7bO3Nn1xZup8y+m66UJDOW3zRhPGqfFQPpMdszd0Nv2f+dVRr59BGox
         6xV8Oq27KZbah2Ar9qXRSXZPc3t0Bs0vv/EH70ZWgIPZ4ou4dxo2b/oom6X3LxtSl0Mi
         okwsFkO+q8a/mE3ehY49ruBDa0XtEijTg08WZOkjQe85T7mjm/G7x5pY2uHZN9JpG86m
         ydhlBSCfQ8JQ7I6MsfvPOuWwOrQ9gIsltpV3WqDTHQ2HXpPBKCMA/kj50YUMpaitGLja
         lqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938266; x=1793543066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
        b=nzAVrExhd1RTh1M0tuCqpN+LyUcTgXzrfg+pzOJTKsvY1fmU3hvJnUYe96zHpWBXWy
         5e4uYLbV6XLal43i4Xvki3NoynYIPJZwB3Oh7fUUP2Bf9ug0E3i02wyNkkU/rAVL5W6u
         nWMSJpLA2B3GcCz+4/9bAUx/Vyan0J0qm7L36ATbmDosVqy4hnPKSLB5rZOR7aRWVz/u
         v2X0au9esxG4P893Xz3SUbWdY9XltufVLk0e9Zh6e5f5db5gZ/aOUPbA9j8H1fyXYTQW
         pFn2SNOxvFHjrx5EdqNlJi9mMBQKr4P48ozipUhnFa0y46O8PiT5EDLuPyWd5+fiILpK
         stUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkDcEkVwrFWcPYiCB224NvwQwPQ5etdsGQGntGF7KW98GDP+fO2D82GM1ObZKkMA4ZqIycyYfWD3lM6g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIyL3hOa2FIdKOvwQGlebOpHPEPbvCLX7OyFDeXj3telTiXetiq
	fR+YCWhc8cLUD7BlL4ndsHbTMjCtWcBEcajO2hRc0f+k3tH755nuKYLw
X-Gm-Gg: AYBFou0S4HgOWXUFq9Gl9Y2SZ2Di0oWvQRkLam9v0P6UrqDQmP5XeX8DyOebKgNpRSq
	wag2kGsUGyuNKwmF+SZzjt0xg0g4qcYFRCfGFALI/zL4ZFaD5zHIexUweafO6Yav9u2pGgwu/b+
	Or8Hz3Qb+LtsPOCFLj3vGsy2yZLz4WKxS2Nw8+rOIRF3hsgo6uBvsRohAuWXL/f27pTEOjP0M1I
	h25w+HlSMRcvTVDbzNyhfXifRC4+xrKl1RNjhTVEpMBW6F6QtlsxQidHFir2MrxON7OaNQTZgGj
	BnClY1wFvqAWsUrkbs7c7a072IEK8VG2NnwqGx1jo7kYFfGqfdakI53Z2w3VVdm0obyKpij6zQO
	tovV+1DAc0LJ3/5Td6jrWLQXmNs8zBiP+cmyO4YwB9thPFvLbMZu0v69f0b9gnjup8hYF6o5LZe
	Py21S3RcD5sdG0uBk+G8yQrU4wT0csYHoTBxZaxJ30ZpNehX6+BZ+Jn/mtebMBSOrGhc32IrwXp
	905hnb+hT9hncQLsGJi6JgFkQUQ08rWesEMcfO9oAkbyddvYh0i1CuqoMcLFWEZ5nG1xS7IMymK
	cesZncvunlPUDg==
X-Received: by 2002:a05:600c:5307:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a35acc41a6mr66595165e9.35.1792938265782;
        Sun, 25 Oct 2026 07:24:25 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:25 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:10 +0000
Message-ID: <20261025142412.112216-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. Apply the map to the A733 register
layout too, which so far ignored it. This also fixes PK on both, which
was numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 801f62abc93d..940942bf6f95 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..9c5eb21a86a5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index d09467ed437a..57a1e5e48f35 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -248,12 +248,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
+
 	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
-		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
 		       A733_IRQ_REGS_OFFSET;
 
-	return IRQ_REGS_OFFSET +
-	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
+	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
-- 
2.52.0

