Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936704;
	b=1qZJxM+TNim/tbmwW6PjY0Oo4eT0Y7cqo+sUy+IwGK2x+3Cr/n1SCL+vV4aGXNMXB0sy
	 rL4i619H+5pDEwAmpd6Tguu4C7wUh/f3GGWxULUuPGBSRpD78kKknxnz8zJ7aBbFjQJe9
	 tWMy343j3SK/pt0QH6m70Xtr4C+Qp0Z4zIbX2FZmb+OiGNmbJ8nSamAXP9ifdpUaYTS9e
	 wBVlOqlQMzDEydokHf7nwpy9kq+GnFZGzqZgQroVj2Jrn6gc/PmSCoAURRETw1i+bu6ow
	 tvDhV9s4fX/pMfZ7dOFO4SWpCN/ONqOXx2247dGAB90Ngep4V4Zn2JsLx0Hd3NL6Dsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=;
	b=ekTAxGAF+kMDQFteIQNQVYIVjyUFKXUdEs0W8SM50pi8zIrbssCK/OOY7oVNXo2hDRHU
	 0+BJYWLmpeD9y4hUt57KJfD2jHvaOesWzxxLl+ew9nMHlWZvu+quYl1QkWmcGmAc95l5W
	 UzeVkai/eC25X5s3nb0yXpFLoxtXCaZtsoSQ5f7pvWqEB/DQU2xZ8zzKv20sA/CnPEiKq
	 gco/P6rofV7Vdd3im/NGEVpyNg9p0fMjDUfTrWkfiebWc8PLQ4M07hSkdk1rwCWDE3U4k
	 Da63GNjVH78F6cNnMG2U6t2v1QYTLSzuQaWgt+XrH1DUpJf7OTlxXHvLcSr20GV9FtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jfwTu3Hs;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B35606A31B
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 13:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B35606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jfwTu3Hs
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e04773687so662201f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936702; x=1793541502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=;
        b=jfwTu3Hs+KtnqGbI67ivUfUr/iosbjkIWBbXMANdmRwep7f4ZusyGvKlTK7JgG6LrH
         wCNN32QccWcWtct8RUgbOlhlsAMSup60S0HrXVFS+uH8crcemzQIerJdG6wQJWM9bu7q
         n52tmrFUBBqtaUc1pek/Tnm7mAogMmLKDVOAiWsm+deT4CPUEtxQDsr8ZiLYrFyMhlNh
         5qyPgYvtLBXqLAceTUmyLmbDF0htiMCpkXbqfY0PnI8ktAZW8sk57LysjtJ2A49fHH51
         APnT3O6zeMERzNUS0R5sMug1GBxtrBJwavSosGhQ4dioKL8lmsBjglzLqt5ZWS9inuVV
         mU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936702; x=1793541502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmYTsZXrMj8ReAJU3eWsqneDCYu2+oiuB4uylitXZlM=;
        b=GcQj2yX1BQXhkbKQrYpFxiarbygD8uo1p+y2AK3k+KK2KcL3JYNQApcjH4tDaZj5c0
         gqHwbM8PCmKERkNGNonZQiQqPeZJx1LbKW04omPNktronnDh/6C+4NbZWF0Y9jKmTf4h
         hW2NDrsnDqCPzNBNp8XgO1N+6wCrjCf3/EhdGyclbSmugn0eYsHCteTwt8nYY7F1+Y8t
         W9KDhYhMH3UqY6bQHWTWVMbHlT44/sYhT+ZnG4mA2h0T/ewbF6Hd/Zu6Wp/afSU84jKn
         l/QtR+xBeCWHxvTsOQWH3YisVoIFO0OtcssnSq+rzFkMqe5mbZyy+bnB711vgQUPZjtm
         2c8w==
X-Forwarded-Encrypted: i=1; AKwUvBxR4DwKM6pZQqIsz/oI5HyqRb5T1nESqJS4JE8k0dSXZi3VMqRiB8KXFHqLuoahNkYeVT1xrKYetHd7Gw==@lists.linux.dev
X-Gm-Message-State: AFq9FYILHyIgUUXTnI78JLwBCnPRjuwek9C6LwOWH3MF8c3NaGEFXLs4
	HUKY3G/0XCkCoYSXk8CztgpmBEPHbuCIl2Y7rhnI5Gn90kTu7a/WUb9s
X-Gm-Gg: AYBFou3iGs3/0MOQ6Crn3+5VYftnSpYpdglydCcoUOr4t/J16G/f5hJYJS8rd7SIaNR
	84IfVSjyei/WVbtR3lPU8BySmjBmCOkXBluTSlGCyV4mIdw7sVv1787x3XzNfmj4FalLtiTQpqX
	D7J0Pc7Wd/jqT/y2NZhzSvb9nJ0emN8iLj4k5xpBgdqDNISRlm3B8sbGsO+rDGYNKMeNFJaypzv
	c2sfzyxobAFpvmbymQ/ha0ZvXsf4HAtHzixZIySoVmsTXrQTNV0kL2Bd85hY+uWJTR7iLot+GQS
	qdlQEX3ZpL4uloawT649+sIug4612NSV3k20PLbcpiH4TL1bA4yQplNaqGxC2utec2MKfsOf99m
	8q8B32EfIGCz0LmeJciQIA9wPeq0zMUsShguVzCoPSLcd6CY8Hgg+L1ao0npRs+M45wvdSyMwOm
	BYD80MJUFrLQtmZmv4d1coKPqpQE3Yx4iW3qHyklGYqNk/pAifb9/jTHk/dUtu59SpbTsTrvsRl
	SZZI4L61xWBiqn+Rubv9ihsE0WHv4S2IF9gJZd0YHayFp+vc/nTDN0IBkG74VYcu57hH7vr4iJ9
	JcE4fijFgtGHdQ==
X-Received: by 2002:a05:6000:46d9:b0:48d:f498:91e9 with SMTP id ffacd0b85a97d-48e3eb615a0mr4599278f8f.9.1792936702426;
        Sun, 25 Oct 2026 06:58:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:21 -0700 (PDT)
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
Subject: [PATCH v2 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 13:57:43 +0000
Message-ID: <20261025135745.102970-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
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
start at PB, the map they need. This also fixes PK on both, which was
numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

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
 
-- 
2.52.0

