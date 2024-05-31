Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFCC1761BE
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164747; cv=none; b=burqW8z8vcWl/F/lagyXTwFCGjFPtVEf9TGuTPW75HgzpdjAB9ViXOzvUbYiCwmNDBmkprGuzNtkxT0yg1YxL1gGoKGHVEJjopH3lIjzVNNc7pwczI5fnbHv+n9I18K9pv9f2jk4oSGS1Z6/Z+2zudQfD8LE8XjqrIDu98e6Fls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164747; c=relaxed/simple;
	bh=RhrUmzVO8TfLZd54FCoZcZD5QHg156A3ksQFZu6P0Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRNkM8ptg5zydtlPxz2KssYno7LZVzQNsKvs57y4aLF+hmWp0oVf0+CbQH5Uc7z+k75dJZo2eoYeRt3UmItYgBKGvQ3N6X9DqReIRfQ5srdXZTAhQznATzqTTGbWGCf0z0gdAPDCKrvjjSUDh/YRvqmMeWf8Zp7AEqMo6A4gNiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nR14pSY/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nR14pSY/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7024003a515so1082293b3a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717164745; x=1717769545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+bkqqaFUuGbFWxlDKxozcD2p6jDvwkVorFlVtLPXmU=;
        b=nR14pSY/lHPrEei+1REZENOhDM0yZyO9eBm/Fr1dRLqIoH9UE3YHwEGc/XSK5vYHOu
         IWoAeEvl1/a1w5ocmu79HFY1jwMS49fk7TdeR9y/3MHXhgIp4sDfKJs8KfvhTgbs88lA
         kyjFewCZ0lqdQHFFLThLRbcY8RepbOn1N4M6teaaCYW2lVrDjuVZH5o1Ydx3IsLe0zZn
         PiUzTTdhSIFdZ9Si4D52ZQK/WruWPDPnVWtLnk3ac75P7rceYphooAypB3ZWyTgb3x30
         WdYaGp8VrFdQaF0CK2yk2q80CXL8w2Sxhhu8QLJSuZMKi698HDZSjEKFQCrkyH37/VMs
         uw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717164745; x=1717769545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+bkqqaFUuGbFWxlDKxozcD2p6jDvwkVorFlVtLPXmU=;
        b=ZrpbdX7aJiMh3ioGkuLq21mxeAEdf4WBvZKgqTSTOs5L4fzULXuQO19/bW9RcTIRfc
         8WaHERhTctFdyE2g86Lni3Hu4T71/IqimpYR6Pzryub9opaHRq0rXr1SxZfykFSdqC4W
         GXutfx4B+StVOzHleHFQbuc7X+8EQuXLNrOCZaera6m5HHmMjraIDm/mBdArEQ4qEGmy
         c5Fhb7j+S2AhpuK5YhdTFtsVyMP1CxzDAFTR/vcvd2pFYNIPEEbfZSyMg6hSyvnNB5FI
         zizf7WFGfb1JXFLaf62s2R/Vl118EsHjizd97Xb/1jpnIDH7t9XG8f1ZnqFGSTqk74mD
         lmQw==
X-Forwarded-Encrypted: i=1; AJvYcCWpqQf8X6k8KtdoFtWmHhWMleXCH5iQmdOjX5Mv/2iZoSRAugd00NiQvMQ0s7lNvExq7y0ukB+DeJWvluYAcUWugjwkOjXMNf96NVo=
X-Gm-Message-State: AOJu0YwgRCZsmxLJggxseYwWvaoflwtzts7tTUySTSd6ImEED9Q66HOu
	o8lesBnzfY8XDYcv8Ucp4u+09G64Z92VSw1lIvja6lQrYbCJjPEC
X-Google-Smtp-Source: AGHT+IHPJgFaqgnxSWkMBgv7lPh1JhhIs574AgD6tNqP5a50Y7sg2nqLpeaI6lfcDle6Wt7ebuqnvw==
X-Received: by 2002:a05:6a21:7888:b0:1af:d148:b713 with SMTP id adf61e73a8af0-1b26f17c7a0mr2374657637.1.1717164744673;
        Fri, 31 May 2024 07:12:24 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b057besm1418103b3a.162.2024.05.31.07.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:12:24 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Aleksandr Shubin <privatesub2@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/5] pwm: sun20i: Add support for Allwinner H616 PWM
Date: Fri, 31 May 2024 23:11:34 +0900
Message-ID: <20240531141152.327592-3-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531141152.327592-1-kikuchan98@gmail.com>
References: <20240531141152.327592-1-kikuchan98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner H616 SoC has a PWM controller similar to the one
in the D1, which is supported by the pwm-sun20i driver.

This patch adds support for the Allwinner H616 PWM.
The main difference is in the register layout. Specifically, the
GATING flag is placed in the PCCR register instead of the
individual PCGR register. Thus, it must be handled properly.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 drivers/pwm/pwm-sun20i.c | 109 ++++++++++++++++++++++++++++++---------
 1 file changed, 86 insertions(+), 23 deletions(-)

diff --git a/drivers/pwm/pwm-sun20i.c b/drivers/pwm/pwm-sun20i.c
index 93782023af6..d07ce0ebd2a 100644
--- a/drivers/pwm/pwm-sun20i.c
+++ b/drivers/pwm/pwm-sun20i.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * PWM Controller Driver for sunxi platforms (D1, T113-S3 and R329)
+ * PWM Controller Driver for sunxi platforms (D1, T113-S3, R329 and H616)
  *
  * Limitations:
  * - When the parameters change, current running period will not be completed
@@ -20,8 +20,17 @@
 #include <linux/pwm.h>
 #include <linux/reset.h>
 
+#define SUN20I_PWM_REG_OFFSET_PER_D1		(0x0080)
+#define SUN20I_PWM_REG_OFFSET_PCR_D1		(0x0100 + 0x0000)
+#define SUN20I_PWM_REG_OFFSET_PPR_D1		(0x0100 + 0x0004)
+#define SUN20I_PWM_REG_OFFSET_PER_H616		(0x0040)
+#define SUN20I_PWM_REG_OFFSET_PCR_H616		(0x0060 + 0x0000)
+#define SUN20I_PWM_REG_OFFSET_PPR_H616		(0x0060 + 0x0004)
+
 #define SUN20I_PWM_CLK_CFG(chan)		(0x20 + (((chan) >> 1) * 0x4))
 #define SUN20I_PWM_CLK_CFG_SRC			GENMASK(8, 7)
+#define SUN20I_PWM_CLK_CFG_BYPASS(chan)		BIT(5 + ((chan) & 1))
+#define SUN20I_PWM_CLK_CFG_GATING		BIT(4)
 #define SUN20I_PWM_CLK_CFG_DIV_M		GENMASK(3, 0)
 #define SUN20I_PWM_CLK_DIV_M_MAX		8
 
@@ -29,15 +38,15 @@
 #define SUN20I_PWM_CLK_GATE_BYPASS(chan)	BIT((chan) + 16)
 #define SUN20I_PWM_CLK_GATE_GATING(chan)	BIT(chan)
 
-#define SUN20I_PWM_ENABLE			0x80
+#define SUN20I_PWM_ENABLE(chip)			((chip)->data->reg_per)
 #define SUN20I_PWM_ENABLE_EN(chan)		BIT(chan)
 
-#define SUN20I_PWM_CTL(chan)			(0x100 + (chan) * 0x20)
+#define SUN20I_PWM_CTL(chip, chan)		((chip)->data->reg_pcr + (chan) * 0x20)
 #define SUN20I_PWM_CTL_ACT_STA			BIT(8)
 #define SUN20I_PWM_CTL_PRESCAL_K		GENMASK(7, 0)
 #define SUN20I_PWM_CTL_PRESCAL_K_MAX		field_max(SUN20I_PWM_CTL_PRESCAL_K)
 
-#define SUN20I_PWM_PERIOD(chan)			(0x104 + (chan) * 0x20)
+#define SUN20I_PWM_PERIOD(chip, chan)		((chip)->data->reg_ppr + (chan) * 0x20)
 #define SUN20I_PWM_PERIOD_ENTIRE_CYCLE		GENMASK(31, 16)
 #define SUN20I_PWM_PERIOD_ACT_CYCLE		GENMASK(15, 0)
 
@@ -91,6 +100,13 @@
  */
 #define SUN20I_PWM_MAGIC			(255 * 65537 + 2 * 65536 + 1)
 
+struct sun20i_pwm_data {
+	unsigned long reg_per;
+	unsigned long reg_pcr;
+	unsigned long reg_ppr;
+	bool has_pcgr;
+};
+
 struct sun20i_pwm_chip {
 	struct clk *clk_bus, *clk_hosc, *clk_apb;
 	struct reset_control *rst;
@@ -98,6 +114,7 @@ struct sun20i_pwm_chip {
 	void __iomem *base;
 	/* Mutex to protect pwm apply state */
 	struct mutex mutex;
+	const struct sun20i_pwm_data *data;
 };
 
 static inline struct sun20i_pwm_chip *to_sun20i_pwm_chip(struct pwm_chip *chip)
@@ -139,16 +156,16 @@ static int sun20i_pwm_get_state(struct pwm_chip *chip,
 	else
 		clk_rate = clk_get_rate(sun20i_chip->clk_apb);
 
-	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(pwm->hwpwm));
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(sun20i_chip, pwm->hwpwm));
 	state->polarity = (SUN20I_PWM_CTL_ACT_STA & val) ?
 			   PWM_POLARITY_NORMAL : PWM_POLARITY_INVERSED;
 
 	prescale_k = FIELD_GET(SUN20I_PWM_CTL_PRESCAL_K, val) + 1;
 
-	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_ENABLE);
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_ENABLE(sun20i_chip));
 	state->enabled = (SUN20I_PWM_ENABLE_EN(pwm->hwpwm) & val) ? true : false;
 
-	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_PERIOD(pwm->hwpwm));
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_PERIOD(sun20i_chip, pwm->hwpwm));
 
 	mutex_unlock(&sun20i_chip->mutex);
 
@@ -187,23 +204,32 @@ static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	mutex_lock(&sun20i_chip->mutex);
 
-	pwm_en = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_ENABLE);
+	pwm_en = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_ENABLE(sun20i_chip));
 
-	if (state->enabled != pwm->state.enabled) {
-		clk_gate = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_GATE);
-
-		if (!state->enabled) {
+	if (state->enabled != pwm->state.enabled && !state->enabled) {
+		if (sun20i_chip->data->has_pcgr) {
+			/* Disabling the gate via PWM Clock Gating Register */
+			clk_gate = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_GATE);
 			clk_gate &= ~SUN20I_PWM_CLK_GATE_GATING(pwm->hwpwm);
-			pwm_en &= ~SUN20I_PWM_ENABLE_EN(pwm->hwpwm);
-			sun20i_pwm_writel(sun20i_chip, pwm_en, SUN20I_PWM_ENABLE);
 			sun20i_pwm_writel(sun20i_chip, clk_gate, SUN20I_PWM_CLK_GATE);
+		} else if (!(pwm_en & SUN20I_PWM_ENABLE_EN(pwm->hwpwm ^ 1))) {
+			/*
+			 * Disabling the gate via PWM Clock Configuration Register
+			 * if and only if the counterpart channel is disabled
+			 */
+			clk_cfg = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
+			clk_cfg &= ~SUN20I_PWM_CLK_CFG_GATING;
+			sun20i_pwm_writel(sun20i_chip, clk_cfg, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
 		}
+
+		pwm_en &= ~SUN20I_PWM_ENABLE_EN(pwm->hwpwm);
+		sun20i_pwm_writel(sun20i_chip, pwm_en, sun20i_chip->data->reg_per);
 	}
 
 	if (state->polarity != pwm->state.polarity ||
 	    state->duty_cycle != pwm->state.duty_cycle ||
 	    state->period != pwm->state.period) {
-		ctl = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(pwm->hwpwm));
+		ctl = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(sun20i_chip, pwm->hwpwm));
 		clk_cfg = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
 		hosc_rate = clk_get_rate(sun20i_chip->clk_hosc);
 		bus_rate = clk_get_rate(sun20i_chip->clk_apb);
@@ -234,7 +260,8 @@ static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			}
 
 			/* set up the CLK_DIV_M and clock CLK_SRC */
-			clk_cfg = FIELD_PREP(SUN20I_PWM_CLK_CFG_DIV_M, div_m);
+			clk_cfg &= ~(SUN20I_PWM_CLK_CFG_DIV_M | SUN20I_PWM_CLK_CFG_SRC);
+			clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_DIV_M, div_m);
 			clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_SRC, use_bus_clk);
 
 			sun20i_pwm_writel(sun20i_chip, clk_cfg, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
@@ -265,21 +292,33 @@ static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		 * Duty-cycle = T high-level / T period
 		 */
 		reg_period |= FIELD_PREP(SUN20I_PWM_PERIOD_ACT_CYCLE, act_cycle);
-		sun20i_pwm_writel(sun20i_chip, reg_period, SUN20I_PWM_PERIOD(pwm->hwpwm));
+		sun20i_pwm_writel(sun20i_chip, reg_period,
+			SUN20I_PWM_PERIOD(sun20i_chip, pwm->hwpwm));
 
 		ctl = FIELD_PREP(SUN20I_PWM_CTL_PRESCAL_K, prescale_k);
 		if (state->polarity == PWM_POLARITY_NORMAL)
 			ctl |= SUN20I_PWM_CTL_ACT_STA;
 
-		sun20i_pwm_writel(sun20i_chip, ctl, SUN20I_PWM_CTL(pwm->hwpwm));
+		sun20i_pwm_writel(sun20i_chip, ctl, SUN20I_PWM_CTL(sun20i_chip, pwm->hwpwm));
 	}
 
 	if (state->enabled != pwm->state.enabled && state->enabled) {
-		clk_gate &= ~SUN20I_PWM_CLK_GATE_BYPASS(pwm->hwpwm);
-		clk_gate |= SUN20I_PWM_CLK_GATE_GATING(pwm->hwpwm);
+		if (sun20i_chip->data->has_pcgr) {
+			/* Enabling the gate via PWM Clock Gating Register */
+			clk_gate = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_GATE);
+			clk_gate &= ~SUN20I_PWM_CLK_GATE_BYPASS(pwm->hwpwm);
+			clk_gate |= SUN20I_PWM_CLK_GATE_GATING(pwm->hwpwm);
+			sun20i_pwm_writel(sun20i_chip, clk_gate, SUN20I_PWM_CLK_GATE);
+		} else {
+			/* Enabling the gate via PWM Clock Configuration Register */
+			clk_cfg = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
+			clk_cfg &= ~SUN20I_PWM_CLK_CFG_BYPASS(pwm->hwpwm);
+			clk_cfg |= SUN20I_PWM_CLK_CFG_GATING;
+			sun20i_pwm_writel(sun20i_chip, clk_cfg, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
+		}
+
 		pwm_en |= SUN20I_PWM_ENABLE_EN(pwm->hwpwm);
-		sun20i_pwm_writel(sun20i_chip, pwm_en, SUN20I_PWM_ENABLE);
-		sun20i_pwm_writel(sun20i_chip, clk_gate, SUN20I_PWM_CLK_GATE);
+		sun20i_pwm_writel(sun20i_chip, pwm_en, SUN20I_PWM_ENABLE(sun20i_chip));
 	}
 
 unlock_mutex:
@@ -293,8 +332,29 @@ static const struct pwm_ops sun20i_pwm_ops = {
 	.get_state = sun20i_pwm_get_state,
 };
 
+static const struct sun20i_pwm_data sun20i_d1_pwm_data = {
+	.reg_per = SUN20I_PWM_REG_OFFSET_PER_D1,
+	.reg_pcr = SUN20I_PWM_REG_OFFSET_PCR_D1,
+	.reg_ppr = SUN20I_PWM_REG_OFFSET_PPR_D1,
+	.has_pcgr = true,
+};
+
+static const struct sun20i_pwm_data sun50i_h616_pwm_data = {
+	.reg_per = SUN20I_PWM_REG_OFFSET_PER_H616,
+	.reg_pcr = SUN20I_PWM_REG_OFFSET_PCR_H616,
+	.reg_ppr = SUN20I_PWM_REG_OFFSET_PPR_H616,
+	.has_pcgr = false,
+};
+
 static const struct of_device_id sun20i_pwm_dt_ids[] = {
-	{ .compatible = "allwinner,sun20i-d1-pwm" },
+	{
+		.compatible = "allwinner,sun20i-d1-pwm",
+		.data = &sun20i_d1_pwm_data
+	},
+	{
+		.compatible = "allwinner,sun50i-h616-pwm",
+		.data = &sun50i_h616_pwm_data
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sun20i_pwm_dt_ids);
@@ -338,6 +398,8 @@ static int sun20i_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(sun20i_chip->base))
 		return PTR_ERR(sun20i_chip->base);
 
+	sun20i_chip->data = data;
+
 	sun20i_chip->clk_bus = devm_clk_get_enabled(&pdev->dev, "bus");
 	if (IS_ERR(sun20i_chip->clk_bus))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->clk_bus),
@@ -388,5 +450,6 @@ static struct platform_driver sun20i_pwm_driver = {
 module_platform_driver(sun20i_pwm_driver);
 
 MODULE_AUTHOR("Aleksandr Shubin <privatesub2@gmail.com>");
+MODULE_AUTHOR("Hironori KIKUCHI <kikuchan98@gmail.com>");
 MODULE_DESCRIPTION("Allwinner sun20i PWM driver");
 MODULE_LICENSE("GPL");
-- 
2.45.1

