Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875638B12A
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 21:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028886; cv=none; b=Ck1kLNL4aIFBNV86leG3ZsPKJAniI+pbQtLnSiRUu4eMLUkyjRGu53FexZd6oT0UNO8kpjX3idM3lwbE+i1B0c6WtbvMyHaCzsyLcKMAjVkVMvSP5PXhroeR7KJRZkDDaT2i+F6gKNzjoyw3tLXTr69kBBY5v6BXBCZou9PfJ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028886; c=relaxed/simple;
	bh=Be/cWPQ59xpS4zI4d7uyaSUlPTVzJY+oz2ilnWbcb+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpEJSGQByQLs35RKBHeF+m07BFqISNySbTBwIqATZsnPM6dytXrf4Q010fIz1YEnttq/4MJ5ekuR5M3RR6Mr3oL9EB4gYUy6y34a/ZFewm8jTVyYBf4uCAjYH22awMJUrJOm2khvHGGPuWromFkI1ryCTHl3curRipxNYydWtM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myJvm1/9; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myJvm1/9"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664eb8cb631so2060651d50.3
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028883; x=1783633683; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b5Ik/jaiyxGq/K61KC4YWGXGDB1yT8F48WMWIyoKQXM=;
        b=myJvm1/9+D7ceJjAbIBN4JL9J545TFs/tkpgPORHpabIxg/bxge2+5PKuUj7PlIG7l
         A/SERJzOkM/byP5RLOsdd/atohv2eH7fen1TgFAvqcNFGa44xUI5IQqmjn24PcJcWELA
         EczrTdooY7qnPh5Zufm3/YvZ6ew8uV8L2vQ54KpooY2nfxHXdwlf7qwK317Iw9IXSKij
         /xhuGnNwEYRmvsm644mKSjAVHnHrpmMfoGHfN634NXHM7M1M31U9UkvQaS/lktuM4K9t
         xSeu0RtufAYm7E1Z3f+FjX58rxQ3yWiEQs8Dp4DEG0UtjYzLqfLqS2FLg7JzSppiOggp
         Iiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028883; x=1783633683;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5Ik/jaiyxGq/K61KC4YWGXGDB1yT8F48WMWIyoKQXM=;
        b=Ma6iZnGMLKuWICPRug2NJgoAXTUZgIm6DPEWrxTeP56HbOgbLCTu/FONhGMO8tbQl8
         SQa8OpE/W3NTSMy8iGb7kXIzO0UdOdEEDTq4F+TS6T3SenOXRiQ1tn2BE64pF6Z2yXVH
         6MI2KJepGLE5LpDP934YNBJBKfcaDMyDDQMndhvrGx8LfwFmxPWGKHUxiUaC7KD9Pihz
         OzhI4zvQv3Drooy+hx8MmAgXmMRktGnPVF2FnOGBUnLCnWUn5bgZRE7c8HV3NKyM+xyT
         Gt7rtQyoZtS0gxao+h5AmHQ/oSCpzkYdGsrZVvs5TuktMXt0vae/tUszH4CbsWEU+ptH
         Lj4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoCmWjY1L7/FAfP4vZcOwK60Op5mW9teqge77fw4EpPzYVIcy7K8hAElzdU+nXrdfylSbOOc8KnEHUD0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeioisxRf6PyHikFwDwkZE3cHtMjycwZHSdU6xmlmnvIuAJY2f
	Ne7dZrSoLdgqOGDKf8kEfFt7Bpg5H9GB/4cqeiiIpBQWoSO5rKbCVGkw
X-Gm-Gg: AfdE7cnZmUEcH2Bw2tadSGskFEj/HDProhnsEy/8jjtTsxIkzl1g8QzasBzK1jZbI7u
	6zOExXe3tK70Vhq4iBF8nUE8VDbATjTBiiFiLfGNg0AvgWPqzZWCJ13x40Ohi25Dmz6n/rn9jZx
	tMjMjyO7+AioPvJcYGVoATwyUWsv8hyhoLcxfJU1XTXsq+zPQFFEjyVPHkYcYUUJ8zlAcoh+EPR
	cipqnXLNUrKvECz/PNuYA0wU+CWwyzHBiuL0Cueb1xKrONZ3ZQXUpE0iBq17Ht1QaEI/DBMgsnJ
	oqwpTk+CqF05dtof3vQYGJhzS5U2HUJ1/qxXvisDnvIa0x8XqTSnOaEqpVZWphm9N+yUGEAg11X
	q19J799c/qTGzot8ed53qLKm2TdQqHQ0CLZ9c7aH8De+yPKhmX9j/D+bwYyiAfUEkq80+MNCIWQ
	rbmiHyfrI5AB052PLU+NxUv22Gk5UB9ShpWF8AZzVjdSzT25s=
X-Received: by 2002:a05:690e:4089:b0:664:ae6a:ef2 with SMTP id 956f58d0204a3-66596695a62mr6927006d50.80.1783028882666;
        Thu, 02 Jul 2026 14:48:02 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:02 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 2/4] media: rc: sunxi-cir: add support for the A523
Date: Thu,  2 Jul 2026 17:47:48 -0400
Message-ID: <20260702214750.3428694-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The A523 (sun55i) has a newer revision of the CIR receiver IP. Two
register fields that do not exist on older SoCs must be programmed
for reception to work:

 - CTL bits [7:6] select which pulse polarities are captured into the
   RX FIFO. The reset value of 0 captures nothing, so program "both
   pulse" mode, which captures regardless of header polarity.

 - SPLCFG (the sample configuration register) bits [1:0] select the
   sample clock as a division of the module clock, replacing the
   fixed module clock / 64 sample rate of the older IP. Select
   module clock / 256, which together with the 24 MHz module clock
   used on the A523 gives a 10.7 μs sample period, close to the 8 μs
   of the previous 8 MHz / 64 configuration, and keeps the default
   125 ms idle timeout representable in the 8-bit idle threshold
   field.

Parameterize the sample divisor in the resolution/timeout
calculations, which older SoCs keep at the fixed 64, and add the
A523 quirks and compatible.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 76 ++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 13 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index cb4c56bf0752..82ada9dc0347 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -31,6 +31,11 @@
 /* CIR mode */
 #define REG_CTL_MD			(BIT(4) | BIT(5))
 
+/* Pulse mode selector (bits [7:6]) */
+#define REG_CTL_PMD(m)			((m) << 6)
+/* Capture both pulse polarities */
+#define REG_CTL_PMD_BOTH		REG_CTL_PMD(1)
+
 /* Rx Config */
 #define SUNXI_IR_RXCTL_REG    0x10
 /* Pulse Polarity Invert flag */
@@ -66,6 +71,13 @@
 
 /* IR Sample Config */
 #define SUNXI_IR_CIR_REG      0x34
+/*
+ * Sample clock divider select (bits [1:0]), present on newer IP revisions
+ * (e.g. sun55i). Selects the sample clock as a fraction of the module clock;
+ * must be programmed for the sampler to run. Older SoCs lack the field and
+ * use a fixed module-clock/64 sample rate, so they leave it 0.
+ */
+#define REG_CIR_SDIV(val)    ((val) & GENMASK(1, 0))
 /* CIR_REG register noise threshold */
 #define REG_CIR_NTHR(val)    (((val) << 2) & (GENMASK(7, 2)))
 /* CIR_REG register idle threshold */
@@ -73,6 +85,8 @@
 
 /* Required frequency for IR0 or IR1 clock in CIR mode (default) */
 #define SUNXI_IR_BASE_CLK     8000000
+/* Default sample clock divisor: module clock / 64 (legacy fixed rate) */
+#define SUNXI_IR_SAMPLE_DIV   64
 /* Noise threshold in samples  */
 #define SUNXI_IR_RXNOISE      1
 
@@ -81,10 +95,18 @@
  *
  * @has_reset: SoC needs reset deasserted.
  * @fifo_size: size of the fifo.
+ * @both_pulse: program the CTRL pulse-mode field (newer IP revisions).
+ * @sample_div_sel: value for the SPLCFG sample-clock divider field (0 on
+ *		    legacy SoCs that lack the field).
+ * @sample_divisor: module-clock divisor that yields the sample clock; matches
+ *		    @sample_div_sel on newer IP, or the fixed /64 on legacy SoCs.
  */
 struct sunxi_ir_quirks {
 	bool		has_reset;
 	int		fifo_size;
+	bool		both_pulse;
+	u8		sample_div_sel;
+	u32		sample_divisor;
 };
 
 struct sunxi_ir {
@@ -92,6 +114,9 @@ struct sunxi_ir {
 	void __iomem    *base;
 	int             irq;
 	int		fifo_size;
+	bool		both_pulse;
+	u8		sample_div_sel;
+	u32		sample_divisor;
 	struct clk      *clk;
 	struct clk      *apb_clk;
 	struct reset_control *rst;
@@ -140,17 +165,19 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 }
 
 /* Convert idle threshold to usec */
-static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int ithr)
+static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int div,
+				       unsigned int ithr)
 {
 	return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
-				 base_clk / (128 * 64));
+				 base_clk / (128 * div));
 }
 
 /* Convert usec to idle threshold */
-static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int usec)
+static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int div,
+				       unsigned int usec)
 {
 	/* make sure we don't end up with a timeout less than requested */
-	return DIV_ROUND_UP((base_clk / (128 * 64)) * usec,  USEC_PER_SEC) - 1;
+	return DIV_ROUND_UP((base_clk / (128 * div)) * usec,  USEC_PER_SEC) - 1;
 }
 
 static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
@@ -158,15 +185,17 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
 	struct sunxi_ir *ir = rc_dev->priv;
 	unsigned int base_clk = clk_get_rate(ir->clk);
 
-	unsigned int ithr = sunxi_usec_to_ithr(base_clk, timeout);
+	unsigned int ithr = sunxi_usec_to_ithr(base_clk, ir->sample_divisor,
+					       timeout);
 
 	dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", ithr);
 
-	/* Set noise threshold and idle threshold */
-	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
+	/* Set sample clock divider, noise threshold and idle threshold */
+	writel(REG_CIR_SDIV(ir->sample_div_sel) |
+	       REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
 	       ir->base + SUNXI_IR_CIR_REG);
 
-	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ithr);
+	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ir->sample_divisor, ithr);
 
 	return 0;
 }
@@ -193,8 +222,14 @@ static int sunxi_ir_hw_init(struct device *dev)
 		goto exit_disable_apb_clk;
 	}
 
-	/* Enable CIR Mode */
-	writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
+	/*
+	 * Enable CIR Mode. On newer IP revisions the pulse-mode field must
+	 * also be set, otherwise no pulses are captured into the RX FIFO.
+	 */
+	tmp = REG_CTL_MD;
+	if (ir->both_pulse)
+		tmp |= REG_CTL_PMD_BOTH;
+	writel(tmp, ir->base + SUNXI_IR_CTL_REG);
 
 	/* Set noise threshold and idle threshold */
 	sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
@@ -271,6 +306,9 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	}
 
 	ir->fifo_size = quirks->fifo_size;
+	ir->both_pulse = quirks->both_pulse;
+	ir->sample_div_sel = quirks->sample_div_sel;
+	ir->sample_divisor = quirks->sample_divisor ?: SUNXI_IR_SAMPLE_DIV;
 
 	/* Clock */
 	ir->apb_clk = devm_clk_get(dev, "apb");
@@ -325,10 +363,10 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->rc->dev.parent = dev;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* Frequency after IR internal divider with sample period in us */
-	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
+	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / ir->sample_divisor));
 	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
-	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
-	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
+	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 0);
+	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 255);
 	ir->rc->s_timeout = sunxi_ir_set_timeout;
 	ir->rc->driver_name = SUNXI_IR_DEV;
 
@@ -395,6 +433,14 @@ static const struct sunxi_ir_quirks sun6i_a31_ir_quirks = {
 	.fifo_size = 64,
 };
 
+static const struct sunxi_ir_quirks sun55i_a523_ir_quirks = {
+	.has_reset = true,
+	.fifo_size = 64,
+	.both_pulse = true,
+	.sample_div_sel = 2,	/* sample clock = module clock / 256 */
+	.sample_divisor = 256,
+};
+
 static const struct of_device_id sunxi_ir_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-ir",
@@ -408,6 +454,10 @@ static const struct of_device_id sunxi_ir_match[] = {
 		.compatible = "allwinner,sun6i-a31-ir",
 		.data = &sun6i_a31_ir_quirks,
 	},
+	{
+		.compatible = "allwinner,sun55i-a523-ir",
+		.data = &sun55i_a523_ir_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
-- 
2.54.0

