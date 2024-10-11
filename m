Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C291C212F10
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Oct 2024 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642535; cv=none; b=NXwLMbbiZqghyj69dEVmQLQ5SgCsEAUnhdkKEjsezgIqzXMtpq23Syi3XCQr7sy200TDTSVelZ2g8vn/TAfvLevtpJFhQ4Fj2eKMm4y3QZ50RLHKjcx+XHz4RDyIrLX3X3pCfHrzYXPGxFP0dUxcu49uNmPDvLu7FrglxFQENIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642535; c=relaxed/simple;
	bh=jQx0OmEfk+JVQGlcnteptvebCmDEWfbv5+YLLEhRlbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjb8CxS50PojcNCkQ3Cqa7/vRU/bekOZvANx9Lf2564uliJIPHiYme7fln7fR7zDhyH+a/SAK2NVSfCaCtaPDdP7umIMuRCPuOWjFpV2iwfgqA8mEmxpltQZXrCtXekfQPtn/npBZI3GvWntP+4E1+KKfaUC6rvGJhumTeTsmL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5K7fa3w; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5K7fa3w"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5389917ef34so2237293e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Oct 2024 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728642531; x=1729247331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DshHJ8zY55uDuVCwU/mGmM/Oy4XgnLbq28+oKUmXaXo=;
        b=R5K7fa3w6vB88sTzvFg8vaPJWMS62yQDQRb4e4GwVYUCn7ynC/aVe5iV+n6jVwZI7c
         GHtNEH8tEonhO0EI1YWoEKOS5WTYGtseId1D48F0X8yNarGjol/0dnq996FE5I7QK+9F
         6Ct5r5J/MkLPbO1ImEIUn+wsQWcxq04NL5sN+EAL5Re4hQ2TBLGIUyD/JOovYkk6hvAB
         LOiXFjhrh42EOweBMaFDLjE1ljubr/RA2XMVQtTH9wrpwdOdX2lRATJOkoYmRDzXCOqC
         gQMfUrSRjNp7xktkV4G7R4gD5GHbzcTsDrVEelNOd2dM587EeOGEKaagO+khOqEFwM5p
         GPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642531; x=1729247331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DshHJ8zY55uDuVCwU/mGmM/Oy4XgnLbq28+oKUmXaXo=;
        b=TuwiOPYQgh8XUK0nUVpLHZvDFU+zfJf536y0SqwuiAaUCDwOa7TqFSX7oVCeXP60WJ
         AptXIr+rOlBysW/1CfelZ0yJYjjDPgEWQ7iKr9ho7sIcaSLMX1OxPymD0annLKPgpvmn
         ulWvrrWVTl6k6Q4csQqlTlRKbKfeZ8ZUNiVgQYR8Nh1RdQb80N6UaIaqD8emx6reTjAP
         ZEYSkR5mG6BrAzE6720fXdfNnxZNZpPIRFzJ7t3s4uowblvCZdQYbAGK+/ATEMEjY2Kz
         rdTGeq+qRAmxPyrP1gYl212HU4R6q/RsdDQEKnQUoGHgYlRRUNY3BYlx4tWXlv+BE/ye
         G3MA==
X-Forwarded-Encrypted: i=1; AJvYcCVKpb3jYFrMqlc+MIRKXOz6As4sz6V2/cyra39Hk+b5OV9VkWtyYhS2owfNruoi/7ATBIwkU79DxilQqA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7ywFCSIutRVyfVcbdUD9z1C9FcOXUEfVapsKpg+Idb7xUvMc9
	6PeA/2heQq/X2DKjm0PYBt4ijOUf+76Qh0MpHt1XtLiRPCNa5vw=
X-Google-Smtp-Source: AGHT+IErfno8yHOQbt1+04UEUd4VvB/niy7rdUWHMoAgijBTF/ujyEscLsvd7PebjRRIbThOBAzcQA==
X-Received: by 2002:a05:6512:a8a:b0:536:55a8:6f78 with SMTP id 2adb3069b0e04-539da3c4c95mr1181874e87.17.1728642530431;
        Fri, 11 Oct 2024 03:28:50 -0700 (PDT)
Received: from localhost.localdomain ([188.162.200.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f1003sm552534e87.233.2024.10.11.03.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:28:48 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
Date: Fri, 11 Oct 2024 13:27:33 +0300
Message-Id: <20241011102751.153248-3-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011102751.153248-1-privatesub2@gmail.com>
References: <20241011102751.153248-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allwinner's D1, T113-S3 and R329 SoCs have a quite different PWM
controllers with ones supported by pwm-sun4i driver.

This patch adds a PWM controller driver for Allwinner's D1,
T113-S3 and R329 SoCs. The main difference between these SoCs
is the number of channels defined by the DT property.

Co-developed-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 drivers/pwm/Kconfig      |  10 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-sun20i.c | 379 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 390 insertions(+)
 create mode 100644 drivers/pwm/pwm-sun20i.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 0915c1e7df16..778151aa3860 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -652,6 +652,16 @@ config PWM_SUN4I
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sun4i.
 
+config PWM_SUN20I
+	tristate "Allwinner D1/T113s/R329 PWM support"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  Generic PWM framework driver for Allwinner D1/T113s/R329 SoCs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-sun20i.
+
 config PWM_SUNPLUS
 	tristate "Sunplus PWM support"
 	depends on ARCH_SUNPLUS || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 9081e0c0e9e0..85ad1fe0dde1 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_PWM_STM32)		+= pwm-stm32.o
 obj-$(CONFIG_PWM_STM32_LP)	+= pwm-stm32-lp.o
 obj-$(CONFIG_PWM_STMPE)		+= pwm-stmpe.o
 obj-$(CONFIG_PWM_SUN4I)		+= pwm-sun4i.o
+obj-$(CONFIG_PWM_SUN20I)	+= pwm-sun20i.o
 obj-$(CONFIG_PWM_SUNPLUS)	+= pwm-sunplus.o
 obj-$(CONFIG_PWM_TEGRA)		+= pwm-tegra.o
 obj-$(CONFIG_PWM_TIECAP)	+= pwm-tiecap.o
diff --git a/drivers/pwm/pwm-sun20i.c b/drivers/pwm/pwm-sun20i.c
new file mode 100644
index 000000000000..7d1b47843bb6
--- /dev/null
+++ b/drivers/pwm/pwm-sun20i.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PWM Controller Driver for sunxi platforms (D1, T113-S3 and R329)
+ *
+ * Limitations:
+ * - When the parameters change, current running period will not be completed
+ *   and run new settings immediately.
+ * - It output HIGH-Z state when PWM channel disabled.
+ *
+ * Copyright (c) 2023 Aleksandr Shubin <privatesub2@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/reset.h>
+
+#define SUN20I_PWM_CLK_CFG(chan)		(0x20 + ((chan) * 0x4))
+#define SUN20I_PWM_CLK_CFG_SRC			GENMASK(8, 7)
+#define SUN20I_PWM_CLK_CFG_DIV_M		GENMASK(3, 0)
+#define SUN20I_PWM_CLK_DIV_M_MAX		8
+
+#define SUN20I_PWM_CLK_GATE			0x40
+#define SUN20I_PWM_CLK_GATE_BYPASS(chan)	BIT((chan) + 16)
+#define SUN20I_PWM_CLK_GATE_GATING(chan)	BIT(chan)
+
+#define SUN20I_PWM_ENABLE			0x80
+#define SUN20I_PWM_ENABLE_EN(chan)		BIT(chan)
+
+#define SUN20I_PWM_CTL(chan)			(0x100 + (chan) * 0x20)
+#define SUN20I_PWM_CTL_ACT_STA			BIT(8)
+#define SUN20I_PWM_CTL_PRESCAL_K		GENMASK(7, 0)
+#define SUN20I_PWM_CTL_PRESCAL_K_MAX		field_max(SUN20I_PWM_CTL_PRESCAL_K)
+
+#define SUN20I_PWM_PERIOD(chan)			(0x104 + (chan) * 0x20)
+#define SUN20I_PWM_PERIOD_ENTIRE_CYCLE		GENMASK(31, 16)
+#define SUN20I_PWM_PERIOD_ACT_CYCLE		GENMASK(15, 0)
+
+#define SUN20I_PWM_PCNTR_SIZE			BIT(16)
+
+/*
+ * SUN20I_PWM_MAGIC is used to quickly compute the values of the clock dividers
+ * div_m (SUN20I_PWM_CLK_CFG_DIV_M) & prescale_k (SUN20I_PWM_CTL_PRESCAL_K)
+ * without using a loop. These dividers limit the # of cycles in a period
+ * to SUN20I_PWM_PCNTR_SIZE by applying a scaling factor of
+ * 1/(div_m * (prescale_k + 1)) to the clock source.
+ *
+ * SUN20I_PWM_MAGIC is derived by solving for div_m and prescale_k
+ * such that for a given requested period,
+ *
+ * i) div_m is minimized for any prescale_k ≤ SUN20I_PWM_CTL_PRESCAL_K_MAX,
+ * ii) prescale_k is minimized.
+ *
+ * The derivation proceeds as follows, with val = # of cycles for requested
+ * period:
+ *
+ * for a given value of div_m we want the smallest prescale_k such that
+ *
+ * (val >> div_m) // (prescale_k + 1) ≤ 65536 (SUN20I_PWM_PCNTR_SIZE)
+ *
+ * This is equivalent to:
+ *
+ * (val >> div_m) ≤ 65536 * (prescale_k + 1) + prescale_k
+ * ⟺ (val >> div_m) ≤ 65537 * prescale_k + 65536
+ * ⟺ (val >> div_m) - 65536 ≤ 65537 * prescale_k
+ * ⟺ ((val >> div_m) - 65536) / 65537 ≤ prescale_k
+ *
+ * As prescale_k is integer, this becomes
+ *
+ * ((val >> div_m) - 65536) // 65537 ≤ prescale_k
+ *
+ * And is minimized at
+ *
+ * ((val >> div_m) - 65536) // 65537
+ *
+ * Now we pick the smallest div_m that satifies prescale_k ≤ 255
+ * (i.e SUN20I_PWM_CTL_PRESCAL_K_MAX),
+ *
+ * ((val >> div_m) - 65536) // 65537 ≤ 255
+ * ⟺ (val >> div_m) - 65536 ≤ 255 * 65537 + 65536
+ * ⟺ val >> div_m ≤ 255 * 65537 + 2 * 65536
+ * ⟺ val >> div_m < (255 * 65537 + 2 * 65536 + 1)
+ * ⟺ div_m = fls((val) / (255 * 65537 + 2 * 65536 + 1))
+ *
+ * Suggested by Uwe Kleine-König
+ */
+#define SUN20I_PWM_MAGIC			(255 * 65537 + 2 * 65536 + 1)
+
+struct sun20i_pwm_chip {
+	struct clk *clk_bus, *clk_hosc, *clk_apb;
+	struct reset_control *rst;
+	void __iomem *base;
+	struct mutex mutex; /* Protect PWM apply state */
+};
+
+static inline struct sun20i_pwm_chip *to_sun20i_pwm_chip(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static inline u32 sun20i_pwm_readl(struct sun20i_pwm_chip *chip,
+				   unsigned long offset)
+{
+	return readl(chip->base + offset);
+}
+
+static inline void sun20i_pwm_writel(struct sun20i_pwm_chip *chip,
+				     u32 val, unsigned long offset)
+{
+	writel(val, chip->base + offset);
+}
+
+static int sun20i_pwm_get_state(struct pwm_chip *chip,
+				struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
+	u16 ent_cycle, act_cycle, prescale_k;
+	u64 clk_rate, tmp;
+	u8 div_m;
+	u32 val;
+
+	mutex_lock(&sun20i_chip->mutex);
+
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm / 2));
+	div_m = FIELD_GET(SUN20I_PWM_CLK_CFG_DIV_M, val);
+	if (div_m > SUN20I_PWM_CLK_DIV_M_MAX)
+		div_m = SUN20I_PWM_CLK_DIV_M_MAX;
+
+	if (FIELD_GET(SUN20I_PWM_CLK_CFG_SRC, val) == 0)
+		clk_rate = clk_get_rate(sun20i_chip->clk_hosc);
+	else
+		clk_rate = clk_get_rate(sun20i_chip->clk_apb);
+
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(pwm->hwpwm));
+	state->polarity = (SUN20I_PWM_CTL_ACT_STA & val) ?
+			   PWM_POLARITY_NORMAL : PWM_POLARITY_INVERSED;
+
+	prescale_k = FIELD_GET(SUN20I_PWM_CTL_PRESCAL_K, val) + 1;
+
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_ENABLE);
+	state->enabled = (SUN20I_PWM_ENABLE_EN(pwm->hwpwm) & val) ? true : false;
+
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_PERIOD(pwm->hwpwm));
+
+	mutex_unlock(&sun20i_chip->mutex);
+
+	act_cycle = FIELD_GET(SUN20I_PWM_PERIOD_ACT_CYCLE, val);
+	ent_cycle = FIELD_GET(SUN20I_PWM_PERIOD_ENTIRE_CYCLE, val);
+
+	/*
+	 * The duration of the active phase should not be longer
+	 * than the duration of the period
+	 */
+	if (act_cycle > ent_cycle)
+		act_cycle = ent_cycle;
+
+	/*
+	 * We have act_cycle <= ent_cycle <= 0xffff, prescale_k <= 0x100,
+	 * div_m <= 8. So the multiplication fits into an u64 without
+	 * overflow.
+	 */
+	tmp = ((u64)(act_cycle) * prescale_k << div_m) * NSEC_PER_SEC;
+	state->duty_cycle = DIV_ROUND_UP_ULL(tmp, clk_rate);
+	tmp = ((u64)(ent_cycle) * prescale_k << div_m) * NSEC_PER_SEC;
+	state->period = DIV_ROUND_UP_ULL(tmp, clk_rate);
+
+	return 0;
+}
+
+static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
+	u64 bus_rate, hosc_rate, val, ent_cycle, act_cycle;
+	u32 clk_gate, clk_cfg, pwm_en, ctl, reg_period;
+	u32 prescale_k, div_m;
+	bool use_bus_clk;
+
+	guard(mutex)(&sun20i_chip->mutex);
+
+	pwm_en = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_ENABLE);
+
+	if (state->enabled != pwm->state.enabled) {
+		clk_gate = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_GATE);
+
+		if (!state->enabled) {
+			clk_gate &= ~SUN20I_PWM_CLK_GATE_GATING(pwm->hwpwm);
+			pwm_en &= ~SUN20I_PWM_ENABLE_EN(pwm->hwpwm);
+			sun20i_pwm_writel(sun20i_chip, pwm_en, SUN20I_PWM_ENABLE);
+			sun20i_pwm_writel(sun20i_chip, clk_gate, SUN20I_PWM_CLK_GATE);
+
+			return 0;
+		}
+	}
+
+	ctl = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(pwm->hwpwm));
+	clk_cfg = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm / 2));
+	hosc_rate = clk_get_rate(sun20i_chip->clk_hosc);
+	bus_rate = clk_get_rate(sun20i_chip->clk_apb);
+	if (pwm_en & SUN20I_PWM_ENABLE_EN(pwm->hwpwm ^ 1)) {
+		/* if the neighbor channel is enabled, check period only */
+		use_bus_clk = FIELD_GET(SUN20I_PWM_CLK_CFG_SRC, clk_cfg) != 0;
+		val = mul_u64_u64_div_u64(state->period,
+					  (use_bus_clk ? bus_rate : hosc_rate),
+					  NSEC_PER_SEC);
+
+		div_m = FIELD_GET(SUN20I_PWM_CLK_CFG_DIV_M, clk_cfg);
+	} else {
+		/*
+		 * Select the clock source based on the period,
+		 * since bus_rate > hosc_rate, which means bus_rate
+		 * can provide a higher frequency than hosc_rate.
+		 */
+		use_bus_clk = false;
+		val = mul_u64_u64_div_u64(state->period, hosc_rate, NSEC_PER_SEC);
+		if (val <= 1) {
+			use_bus_clk = true;
+			val = mul_u64_u64_div_u64(state->period, bus_rate, NSEC_PER_SEC);
+			if (val <= 1)
+				return -EINVAL;
+		}
+		div_m = fls(DIV_ROUND_DOWN_ULL(val, SUN20I_PWM_MAGIC));
+		if (div_m > SUN20I_PWM_CLK_DIV_M_MAX)
+			return -EINVAL;
+
+		/* set up the CLK_DIV_M and clock CLK_SRC */
+		clk_cfg = FIELD_PREP(SUN20I_PWM_CLK_CFG_DIV_M, div_m);
+		clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_SRC, use_bus_clk);
+
+		sun20i_pwm_writel(sun20i_chip, clk_cfg, SUN20I_PWM_CLK_CFG(pwm->hwpwm / 2));
+	}
+
+	/* calculate prescale_k, PWM entire cycle */
+	ent_cycle = val >> div_m;
+	prescale_k = DIV_ROUND_DOWN_ULL(ent_cycle, 65537);
+	if (prescale_k > SUN20I_PWM_CTL_PRESCAL_K_MAX)
+		prescale_k = SUN20I_PWM_CTL_PRESCAL_K_MAX;
+
+	do_div(ent_cycle, prescale_k + 1);
+
+	/* for N cycles, PPRx.PWM_ENTIRE_CYCLE = (N-1) */
+	reg_period = FIELD_PREP(SUN20I_PWM_PERIOD_ENTIRE_CYCLE, ent_cycle - 1);
+
+	/* set duty cycle */
+	val = mul_u64_u64_div_u64(state->duty_cycle,
+				  (use_bus_clk ? bus_rate : hosc_rate),
+				  NSEC_PER_SEC);
+	act_cycle = val >> div_m;
+	do_div(act_cycle, prescale_k + 1);
+
+	/*
+	 * The formula of the output period and the duty-cycle for PWM are as follows.
+	 * T period = PWM0_PRESCALE_K / PWM01_CLK * (PPR0.PWM_ENTIRE_CYCLE + 1)
+	 * T high-level = PWM0_PRESCALE_K / PWM01_CLK * PPR0.PWM_ACT_CYCLE
+	 * Duty-cycle = T high-level / T period
+	 */
+	reg_period |= FIELD_PREP(SUN20I_PWM_PERIOD_ACT_CYCLE, act_cycle);
+	sun20i_pwm_writel(sun20i_chip, reg_period, SUN20I_PWM_PERIOD(pwm->hwpwm));
+
+	ctl = FIELD_PREP(SUN20I_PWM_CTL_PRESCAL_K, prescale_k);
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		ctl |= SUN20I_PWM_CTL_ACT_STA;
+
+	sun20i_pwm_writel(sun20i_chip, ctl, SUN20I_PWM_CTL(pwm->hwpwm));
+
+	if (state->enabled != pwm->state.enabled && state->enabled) {
+		clk_gate &= ~SUN20I_PWM_CLK_GATE_BYPASS(pwm->hwpwm);
+		clk_gate |= SUN20I_PWM_CLK_GATE_GATING(pwm->hwpwm);
+		pwm_en |= SUN20I_PWM_ENABLE_EN(pwm->hwpwm);
+		sun20i_pwm_writel(sun20i_chip, pwm_en, SUN20I_PWM_ENABLE);
+		sun20i_pwm_writel(sun20i_chip, clk_gate, SUN20I_PWM_CLK_GATE);
+	}
+
+	return 0;
+}
+
+static const struct pwm_ops sun20i_pwm_ops = {
+	.apply = sun20i_pwm_apply,
+	.get_state = sun20i_pwm_get_state,
+};
+
+static const struct of_device_id sun20i_pwm_dt_ids[] = {
+	{ .compatible = "allwinner,sun20i-d1-pwm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sun20i_pwm_dt_ids);
+
+static void sun20i_pwm_reset_ctrl_release(void *data)
+{
+	struct reset_control *rst = data;
+
+	reset_control_assert(rst);
+}
+
+static int sun20i_pwm_probe(struct platform_device *pdev)
+{
+	struct pwm_chip *chip;
+	struct sun20i_pwm_chip *sun20i_chip;
+	int ret;
+
+	chip = devm_pwmchip_alloc(&pdev->dev, 8, sizeof(*sun20i_chip));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	sun20i_chip = to_sun20i_pwm_chip(chip);
+
+	sun20i_chip->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sun20i_chip->base))
+		return PTR_ERR(sun20i_chip->base);
+
+	sun20i_chip->clk_bus = devm_clk_get_enabled(&pdev->dev, "bus");
+	if (IS_ERR(sun20i_chip->clk_bus))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->clk_bus),
+				     "failed to get bus clock\n");
+
+	sun20i_chip->clk_hosc = devm_clk_get_enabled(&pdev->dev, "hosc");
+	if (IS_ERR(sun20i_chip->clk_hosc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->clk_hosc),
+				     "failed to get hosc clock\n");
+
+	sun20i_chip->clk_apb = devm_clk_get_enabled(&pdev->dev, "apb");
+	if (IS_ERR(sun20i_chip->clk_apb))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->clk_apb),
+				     "failed to get apb clock\n");
+
+	if (clk_get_rate(sun20i_chip->clk_apb) > clk_get_rate(sun20i_chip->clk_hosc))
+		dev_info(&pdev->dev, "apb clock must be greater than hosc clock");
+
+	sun20i_chip->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(sun20i_chip->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->rst),
+				     "failed to get bus reset\n");
+
+	ret = of_property_read_u32(pdev->dev.of_node, "allwinner,pwm-channels",
+				   &chip->npwm);
+
+	if (chip->npwm > 16) {
+		dev_info(&pdev->dev, "limiting number of PWM lines from %u to 16",
+			 chip->npwm);
+		chip->npwm = 16;
+	}
+
+	/* Deassert reset */
+	ret = reset_control_deassert(sun20i_chip->rst);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to deassert reset\n");
+
+	ret = devm_add_action_or_reset(&pdev->dev, sun20i_pwm_reset_ctrl_release, sun20i_chip->rst);
+	if (ret)
+		return ret;
+
+	chip->ops = &sun20i_pwm_ops;
+
+	mutex_init(&sun20i_chip->mutex);
+
+	ret = devm_pwmchip_add(&pdev->dev, chip);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to add PWM chip\n");
+
+	return 0;
+}
+
+static struct platform_driver sun20i_pwm_driver = {
+	.driver = {
+		.name = "sun20i-pwm",
+		.of_match_table = sun20i_pwm_dt_ids,
+	},
+	.probe = sun20i_pwm_probe,
+};
+module_platform_driver(sun20i_pwm_driver);
+
+MODULE_AUTHOR("Aleksandr Shubin <privatesub2@gmail.com>");
+MODULE_DESCRIPTION("Allwinner sun20i PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

