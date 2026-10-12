Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718994D8DBE
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830514; cv=none; b=Gw/H48KbrCvx2TC7O7hZaL0xmGwkeDi7PkDtni2c7VIyTcfDoaQs/b2mJ/JJZ/+GKV9t39F7Rk4TCHGgOnEpelT9ozeezBr57s8BshzcszaVUKJcbUlgdI04Fi70vaRV1p3jbog7nvJDiLu8Q01p+5GLh46Yrpsgm7UiyFmgAdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830514; c=relaxed/simple;
	bh=1RrNnLhg06zNzdcDD9jk1F1qWL1NOpDhUSC0M07KyKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvAdFiqmSLCrdjCgK7aSPJNdNjstrZ7UTlHZInYF1/xoUbFf+FVapkhF5YUT8Nr+vd//raoxbdwiMCyKWybtYTCwyjS1exu/oUdx5SqQSME+6usWatZEmntq7FVbzDqQ6OFnA8yCigEx66/7jxQfvRHea7LR0p1vac+o8W5ijxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAtsgbnJ; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAtsgbnJ"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-988f270d308so1345522241.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830511; x=1792435311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nd4AtQBT76nHZ3omEOk4hVxLdCylSGw0mBdnNv1wzzw=;
        b=pAtsgbnJmch3PTQQ4pmKLlKMtOUUpt9V799X3PsNI34JMIartvC+s4oDNj2yvg5qJH
         KeJEbxZaa6AsWEK8Zbjwe9+p8avLB9gZt0Bel0hXr8Ijp5wOWTRvuda6v96+w89xbMLl
         6uGjpvVzvfHAPbgwqIcZqfBYuThO+kubfc8+OqKZaxFr7jXRINQSJTrEIAdV3Ns1qnKd
         JGOPXefnbPTUMOCuGRiHTlgFSLDMVT/1iEEd3G3yotDLBd95TJ+huAb7PEzaX0AjZJom
         hyCcK/hrck5k9r64VPnftF049tUDjE6HgBfa6OE/c1XrXQI+mvq9shAndmHmaM1rBkNh
         lwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830511; x=1792435311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nd4AtQBT76nHZ3omEOk4hVxLdCylSGw0mBdnNv1wzzw=;
        b=aBzymUU9bcV5QWF1hTnHgZWyR5HI5yhpiyleeldozwcIVn/Aji9WrcJvISlsvxDA9Z
         lg6ZyaOyTDb5Lcq+EbVCAUJqo3+aoxxn3dy2IIAZHFCVedzaEbiirIW47dtfRFoGubZ9
         k1ZrhG9V0bn4kX5ULWze7rQvM6wn4JZLPuurnJ6wy41FwENlFHFp6OeQYMxOMptQH3KA
         sOioNX5pUg4Jt56TGLcre+h7ZyOkMXpmPXQ5fBZR53wrx00Ad9xZy/ztFPAEm6jQm2VP
         W8Ok9H55ZOA5+w3ytpIOb8BSKmHDeBylZ9GU9vEwwsTjSwGuQmXwkgphZIiBmcjRYs1O
         JE4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5w1sB+fxaRb4nGHdDO0Jrey/y4sjQJCoIAyLPlZ3d01DLoU52s9fZQfLBnmImG4dcnzeQDxPIQIRumw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIm4sI90S0zgQAcgQZkF2uDT9t/sFkCPLnFEBiRgppuyrHvb45h
	p6hTgB4QtYlxFJ+h0StH75I+1AXTiSN5JCIInBrR+a8lT6i/TMKyAVKq
X-Gm-Gg: AYBFou0zqW4vRXvq9wcg+hk9BLMXA7FrdForJKusIgDfJUs1bvrUdWZnEiXyQukZo4d
	WyZeu4xYGeVPAsI+nCy4LrKHNaCkRx0lcs0lZlAGVj+9TbDyFjr3hp3vzu5Hk+DnankTaYR7FQb
	zI4Jf1Ed0V24t85yaoHrp9i9bs3a9tU+VK1g6vFgpEHQS3k6l7xw1VSnO2ybTPT+iaNkkjLIXbC
	80p/B18JKegK4cU6tBLeco8SC6WtsEHHi0kKAnvIycwe4PEKvL3wAaEcKwpeWux94OWjJ2OFhl6
	1eOdq/SQpMcQKc52GZC39R5u2b2e42Zf/CMefUnK5WuSY1u7v1u+6AwAh5QXEcDOhTMeJdkOqZB
	w3vEYyvWw2kzmAV/njLUOa7ojmZc6oranTrDQIBSmmj4Yb8Z0RsrGLv/U8nFqi2dwpQrKTh3xi4
	q07oQqHJYg5xE8Oz1ghx7hrXNmDp3fdk91ggC5IJtPW0T6ibwnmRmhAD2E4MzHTXjftCU8a1DcQ
	xCG4HaWKoAOAi8QYd16cqaZTfELYoAaAsuCWTDV/xvny+w1bkogTl0aewE0jnDyFG6SLjnKqkjv
	+DYISds=
X-Received: by 2002:a05:6102:5cc7:b0:7a7:198b:6748 with SMTP id ada2fe7eead31-7cb3735ff5cmr3147159137.29.1791830511319;
        Mon, 12 Oct 2026 11:41:51 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:50 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: sunxi: a733: program the two-bit I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:28 -0300
Message-ID: <20261012184130.548261-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 GPIO_POW_MOD_SEL register has a two-bit field per bank, but
the A733 uses the helper written for one bit per bank, so a request
for one bank can change the field of another one. With the register
as firmware leaves it on a Radxa Cubie A7Z (the fields of PB, PC, PD,
PE, PG, PH, PJ and PK in automatic mode, 0x01155550), a PJ request at
1.8 V turns the PE field into fixed 1.8 V (0x01155750).

Add a variant that takes the field of each bank from a mask table. It
keeps automatic mode and a fixed 3.3 V mode that already fits, and
writes only the field of the requested bank. PF is left out: its field
(11:10) is known, but it is tied to the MMC vqmmc voltage switching.
PI is left out as well, since its supply domain is not documented.
Only silicon revision B, as reported through SMCCC, is programmed,
since the encoding is documented for that revision only.

Computed with both helpers on that register value, the old one changes
it and the new one leaves it as it is.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 15 +++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 57 +++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       |  6 +++
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..6f5757b8adea 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,10 +21,23 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+/* PA is not implemented. PF and PI are left to the firmware, so are not listed. */
+static const u32 a733_io_bias_masks[SUNXI_PINCTRL_MAX_BANKS] = {
+	[1] = GENMASK(25, 24),	/* PB, VCC-IO */
+	[2] = GENMASK(5, 4),	/* PC */
+	[3] = GENMASK(7, 6),	/* PD */
+	[4] = GENMASK(9, 8),	/* PE */
+	[6] = GENMASK(13, 12),	/* PG */
+	[7] = GENMASK(15, 14),	/* PH */
+	[9] = GENMASK(19, 18),	/* PJ */
+	[10] = GENMASK(21, 20),	/* PK */
+};
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
+	.io_bias_masks = a733_io_bias_masks,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3ee5012463da..8e62111d3409 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -10,6 +10,8 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/arm-smccc.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
@@ -722,6 +724,58 @@ static const struct pinconf_ops sunxi_pconf_ops = {
 	.pin_config_group_set	= sunxi_pconf_group_set,
 };
 
+/*
+ * The two-bit encoding is documented for A733 silicon revision B, which
+ * firmware reports through the SMCCC SOC_ID call. Do not assume it for any
+ * other revision, or when the firmware does not tell.
+ */
+#define SUNXI_A733_SOC_ID		0x091e1903
+#define SUNXI_A733_REV_B		1
+
+static bool sunxi_pinctrl_a733_rev_b(void)
+{
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
+	s32 id = arm_smccc_get_soc_id_version();
+
+	/* Bit 23 is the JEP106 parity bit. */
+	return id >= 0 && (id & ~BIT(23)) == SUNXI_A733_SOC_ID &&
+	       arm_smccc_get_soc_id_revision() == SUNXI_A733_REV_B;
+#else
+	return false;
+#endif
+}
+
+/*
+ * Fields: 0 and 2 fixed 3.3V, 1 automatic, 3 fixed 1.8V. Leave automatic
+ * mode and any other supply voltage to the firmware, and touch only the
+ * field of this bank.
+ */
+static void sunxi_pinctrl_set_io_bias_2bit(struct sunxi_pinctrl *pctl,
+					   unsigned int bank, int uV)
+{
+	u32 mask = pctl->desc->io_bias_masks[bank];
+	unsigned long flags;
+	u32 val, cur, reg;
+
+	if (!mask || !sunxi_pinctrl_a733_rev_b())
+		return;
+
+	if (uV >= 1620000 && uV <= 1980000)
+		val = 3;
+	else if (uV >= 2970000 && uV <= 3630000)
+		val = 2;
+	else
+		return;
+
+	raw_spin_lock_irqsave(&pctl->lock, flags);
+	reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
+	cur = field_get(mask, reg);
+	if (cur != 1 && cur != val && !(val == 2 && cur == 0))
+		writel((reg & ~mask) | field_prep(mask, val),
+		       pctl->membase + pctl->pow_mod_sel_offset);
+	raw_spin_unlock_irqrestore(&pctl->lock, flags);
+}
+
 static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 					 unsigned pin,
 					 struct regulator *supply)
@@ -795,6 +849,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		       pctl->membase + pctl->pow_mod_sel_offset);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 		return 0;
+	case BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT:
+		sunxi_pinctrl_set_io_bias_2bit(pctl, bank, uV);
+		return 0;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..c37170b2e4f4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -130,6 +130,11 @@ enum sunxi_desc_bias_voltage {
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
+	/*
+	 * Bias voltage is set through two-bit fields in PIO_POW_MOD_SEL_REG,
+	 * whose positions are given by io_bias_masks[], as seen on A733.
+	 */
+	BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
 };
 
 struct sunxi_desc_function {
@@ -155,6 +160,7 @@ struct sunxi_pinctrl_desc {
 	bool				irq_read_needs_mux;
 	bool				disable_strict_mode;
 	enum sunxi_desc_bias_voltage	io_bias_cfg_variant;
+	const u32			*io_bias_masks;
 };
 
 struct sunxi_pinctrl_function {
-- 
2.43.0

