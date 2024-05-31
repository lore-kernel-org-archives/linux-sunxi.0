Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B53176228
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164754; cv=none; b=AhLwYLZfZSGQlG0QcHxfeZmd5McUSZ99llqbJv6CHReDSQlhZGwqpFYEGIG2fGgKCpwhQN8IBAgJrrr65OOciyWDF2DgwEiGHBHvyFg3Grpc/fl4mFDMFF+5ADXPeXl9ZXTnrLc3fZgpTYw5YRhQ2v4x/ww5K38KqASML1b27Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164754; c=relaxed/simple;
	bh=OZyRwhfCjuYMugBwTk1w5i4pXrNaK5W9IMn77+BaC20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umlZ/MIf6i1fcKdpjm+ryQNeYxrZVLS0xTxWsdfOMK+lyz2n1DrBGN/mk5pBTvqWkXVLt0tBSkkPEU4kFZqhZSZkFcQKIJ0aLE0/hQCHijZskGRTYLVGRTTZdVWWU4VjHQIXGwkh7y5x3dXNQm01Q7KwiLznPuuJUfbBCUC8zyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhe/XDbS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhe/XDbS"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f4603237e0so1517970b3a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717164752; x=1717769552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRKfuq7tJP6RRlShAcOHog3cbaDmp6QUmMlJFE3QvoU=;
        b=hhe/XDbSN8NO8IoRbQ+0p4S3kMv3ugbRoOyu106WImb86yf35KkTOiwBv7+2E2ufmj
         cAGYhzKj2230UzGx9V9qBiEJ8uwAPYARhMZjLjfwd6m9Gxk3p93NMlnd+PMJC0fXLB2n
         tI2RxkA6oD7R8ZusKeAu2l6JwCG+/ZIGNLlsYaPdTR9YjTxVdnPGoTxymKu8/OZPYLf4
         i27LC0tV+/KUszZ0RsCArC39AUBdrBccXfl0CkYFrlMjI2NFtdAROlOxPnwNcpt+h3jI
         wA7Mx54FCrshCtOVtb9GLEyLRlOacXs59gm13cXx/wPE8kWloBzxgBHhY3GHxhgfkKHA
         Mufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717164752; x=1717769552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRKfuq7tJP6RRlShAcOHog3cbaDmp6QUmMlJFE3QvoU=;
        b=m63ziKGhM3dKIfLZWJFBOWcuMdtYUnyJBePiJJ1KO4ZP7Ehr0FICJN/oUsjNRWc00b
         GxkBwcPcyhEH5wtvKa/kEO09cQy9RgQdxgP1BvyyXuS/XL4P38JVzBaA5D8hv3YMmoKx
         jJCdrT1NESYrbKR9qdSIU7S6P5impH9uWuP05n4QFk2LNYMgc1dvJPCj5wDqqBrNGcS6
         rDcnEz2ImgtrCJ67dwoM+iJA88aA62UMF9GjlgFbj7qbs+RSGxa+x7mfUB4O+Sf26k5z
         JPIFMHgn+Zx1XxOuDJWP/OKDEeCq1RMRgLKE31sFfgcFKQQD/WosVzQGNJxLGL3sDwWQ
         y57w==
X-Forwarded-Encrypted: i=1; AJvYcCX83k3TFWxCrstvjwDd3ZTq6HPdeMy5ZFlm181b6ze7KVpfOXxTETSzm3tjYJS2ekuL9CgxvEcjHD7Gt5SyN89zis2n0z33OM4qI1g=
X-Gm-Message-State: AOJu0YzFcQp0mTl8GsB2H7wSrTJ3bPkXDgr2cnMrYbD19hg1quG6Tk5t
	O63I3qbqwRvf9yVtsimr3+ddjh/vuupnAHMgt4RWKUPlA5CqzKh0
X-Google-Smtp-Source: AGHT+IEDId5bGd2rtdv1MJoyfA1gkmv24Qhvy26tVItCuDcbxaF94h7HM+TLn21fO32yRuaYw68WQw==
X-Received: by 2002:a05:6a00:2d1c:b0:6f8:b8d7:1123 with SMTP id d2e1a72fcca58-7024569eae9mr3142578b3a.1.1717164751842;
        Fri, 31 May 2024 07:12:31 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b057besm1418103b3a.162.2024.05.31.07.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:12:31 -0700 (PDT)
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
Subject: [PATCH 4/5] pwm: sun20i: Delegating the clock source and DIV_M to the Device Tree
Date: Fri, 31 May 2024 23:11:36 +0900
Message-ID: <20240531141152.327592-5-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531141152.327592-1-kikuchan98@gmail.com>
References: <20240531141152.327592-1-kikuchan98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch removes the SUN20I_PWM_MAGIC macro by delegating the clock
source and DIV_M selection to the Device Tree.
This change addresses the issue of resolution discrepancies that arise
from the enabling order of PWM channels which are coupled.

Additionally, this patch clarifies and corrects the calculations for
the period and duty cycle. By using DIV_ROUND_CLOSEST(), it minimizes
the errors between the configured and actual values.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 drivers/pwm/pwm-sun20i.c | 190 ++++++++++++++++-----------------------
 1 file changed, 79 insertions(+), 111 deletions(-)

diff --git a/drivers/pwm/pwm-sun20i.c b/drivers/pwm/pwm-sun20i.c
index d07ce0ebd2a..4bf8a67df38 100644
--- a/drivers/pwm/pwm-sun20i.c
+++ b/drivers/pwm/pwm-sun20i.c
@@ -52,53 +52,13 @@
 
 #define SUN20I_PWM_PCNTR_SIZE			BIT(16)
 
-/*
- * SUN20I_PWM_MAGIC is used to quickly compute the values of the clock dividers
- * div_m (SUN20I_PWM_CLK_CFG_DIV_M) & prescale_k (SUN20I_PWM_CTL_PRESCAL_K)
- * without using a loop. These dividers limit the # of cycles in a period
- * to SUN20I_PWM_PCNTR_SIZE by applying a scaling factor of
- * 1/(div_m * (prescale_k + 1)) to the clock source.
- *
- * SUN20I_PWM_MAGIC is derived by solving for div_m and prescale_k
- * such that for a given requested period,
- *
- * i) div_m is minimized for any prescale_k ≤ SUN20I_PWM_CTL_PRESCAL_K_MAX,
- * ii) prescale_k is minimized.
- *
- * The derivation proceeds as follows, with val = # of cycles for requested
- * period:
- *
- * for a given value of div_m we want the smallest prescale_k such that
- *
- * (val >> div_m) // (prescale_k + 1) ≤ 65536 (SUN20I_PWM_PCNTR_SIZE)
- *
- * This is equivalent to:
- *
- * (val >> div_m) ≤ 65536 * (prescale_k + 1) + prescale_k
- * ⟺ (val >> div_m) ≤ 65537 * prescale_k + 65536
- * ⟺ (val >> div_m) - 65536 ≤ 65537 * prescale_k
- * ⟺ ((val >> div_m) - 65536) / 65537 ≤ prescale_k
- *
- * As prescale_k is integer, this becomes
- *
- * ((val >> div_m) - 65536) // 65537 ≤ prescale_k
- *
- * And is minimized at
- *
- * ((val >> div_m) - 65536) // 65537
- *
- * Now we pick the smallest div_m that satifies prescale_k ≤ 255
- * (i.e SUN20I_PWM_CTL_PRESCAL_K_MAX),
- *
- * ((val >> div_m) - 65536) // 65537 ≤ 255
- * ⟺ (val >> div_m) - 65536 ≤ 255 * 65537 + 65536
- * ⟺ val >> div_m ≤ 255 * 65537 + 2 * 65536
- * ⟺ val >> div_m < (255 * 65537 + 2 * 65536 + 1)
- * ⟺ div_m = fls((val) / (255 * 65537 + 2 * 65536 + 1))
- *
- * Suggested by Uwe Kleine-König
- */
-#define SUN20I_PWM_MAGIC			(255 * 65537 + 2 * 65536 + 1)
+#define SUN20I_PWM_CLOCK_SRC_HOSC		(0)
+#define SUN20I_PWM_CLOCK_SRC_APB		(1)
+#define SUN20I_PWM_CLOCK_SRC_DEFAULT		SUN20I_PWM_CLOCK_SRC_HOSC
+#define SUN20I_PWM_DIV_M_SHIFT_DEFAULT		(0)
+
+#define SUN20I_PWM_CHANNELS_MAX			(16)
+#define SUN20I_PWM_ENTIRE_CYCLE_MAX		(0xffff)
 
 struct sun20i_pwm_data {
 	unsigned long reg_per;
@@ -115,6 +75,9 @@ struct sun20i_pwm_chip {
 	/* Mutex to protect pwm apply state */
 	struct mutex mutex;
 	const struct sun20i_pwm_data *data;
+
+	u32 clk_src_reg[(SUN20I_PWM_CHANNELS_MAX + 1) / 2];
+	u32 div_m_shift_reg[(SUN20I_PWM_CHANNELS_MAX + 1) / 2];
 };
 
 static inline struct sun20i_pwm_chip *to_sun20i_pwm_chip(struct pwm_chip *chip)
@@ -139,7 +102,8 @@ static int sun20i_pwm_get_state(struct pwm_chip *chip,
 				struct pwm_state *state)
 {
 	struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
-	u16 ent_cycle, act_cycle, prescale_k;
+	u32 ent_cycle, act_cycle;
+	u16 prescale_k;
 	u64 clk_rate, tmp;
 	u8 div_m;
 	u32 val;
@@ -170,7 +134,7 @@ static int sun20i_pwm_get_state(struct pwm_chip *chip,
 	mutex_unlock(&sun20i_chip->mutex);
 
 	act_cycle = FIELD_GET(SUN20I_PWM_PERIOD_ACT_CYCLE, val);
-	ent_cycle = FIELD_GET(SUN20I_PWM_PERIOD_ENTIRE_CYCLE, val);
+	ent_cycle = FIELD_GET(SUN20I_PWM_PERIOD_ENTIRE_CYCLE, val) + 1;
 
 	/*
 	 * The duration of the active phase should not be longer
@@ -196,9 +160,9 @@ static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			    const struct pwm_state *state)
 {
 	struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
-	u64 bus_rate, hosc_rate, val, ent_cycle, act_cycle;
-	u32 clk_gate, clk_cfg, pwm_en, ctl, reg_period;
-	u32 prescale_k, div_m;
+	u64 bus_rate, hosc_rate, ent_cycle, act_cycle;
+	u32 clk_gate, clk_cfg, pwm_en, ctl, reg_period, clk_rate;
+	u32 prescale_k, div_m, div_m_shift;
 	bool use_bus_clk;
 	int ret = 0;
 
@@ -229,76 +193,49 @@ static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (state->polarity != pwm->state.polarity ||
 	    state->duty_cycle != pwm->state.duty_cycle ||
 	    state->period != pwm->state.period) {
-		ctl = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(sun20i_chip, pwm->hwpwm));
-		clk_cfg = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
+		int idx = pwm->hwpwm / 2;
+
 		hosc_rate = clk_get_rate(sun20i_chip->clk_hosc);
 		bus_rate = clk_get_rate(sun20i_chip->clk_apb);
-		if (pwm_en & SUN20I_PWM_ENABLE_EN(pwm->hwpwm ^ 1)) {
-			/* if the neighbor channel is enable, check period only */
-			use_bus_clk = FIELD_GET(SUN20I_PWM_CLK_CFG_SRC, clk_cfg) != 0;
-			val = mul_u64_u64_div_u64(state->period,
-						  (use_bus_clk ? bus_rate : hosc_rate),
-						  NSEC_PER_SEC);
 
-			div_m = FIELD_GET(SUN20I_PWM_CLK_CFG_DIV_M, clk_cfg);
-		} else {
-			/* check period and select clock source */
-			use_bus_clk = false;
-			val = mul_u64_u64_div_u64(state->period, hosc_rate, NSEC_PER_SEC);
-			if (val <= 1) {
-				use_bus_clk = true;
-				val = mul_u64_u64_div_u64(state->period, bus_rate, NSEC_PER_SEC);
-				if (val <= 1) {
-					ret = -EINVAL;
-					goto unlock_mutex;
-				}
-			}
-			div_m = fls(DIV_ROUND_DOWN_ULL(val, SUN20I_PWM_MAGIC));
-			if (div_m > SUN20I_PWM_CLK_DIV_M_MAX) {
-				ret = -EINVAL;
-				goto unlock_mutex;
-			}
+		use_bus_clk = sun20i_chip->clk_src_reg[idx] == SUN20I_PWM_CLOCK_SRC_APB;
+		clk_rate = use_bus_clk ? bus_rate : hosc_rate;
+		div_m_shift = sun20i_chip->div_m_shift_reg[idx];
+		div_m = 1 << div_m_shift;
 
-			/* set up the CLK_DIV_M and clock CLK_SRC */
-			clk_cfg &= ~(SUN20I_PWM_CLK_CFG_DIV_M | SUN20I_PWM_CLK_CFG_SRC);
-			clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_DIV_M, div_m);
-			clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_SRC, use_bus_clk);
-
-			sun20i_pwm_writel(sun20i_chip, clk_cfg, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
+		if (state->period > U64_MAX / clk_rate || state->duty_cycle > state->period) {
+			ret = -EINVAL;
+			goto unlock_mutex;
 		}
+		ent_cycle = DIV_ROUND_CLOSEST(state->period * clk_rate, NSEC_PER_SEC * div_m);
+		act_cycle =
+			min(DIV_ROUND_CLOSEST(state->duty_cycle * clk_rate, NSEC_PER_SEC * div_m),
+			    ent_cycle);
+		if (ent_cycle == 0 ||
+		    ent_cycle > SUN20I_PWM_ENTIRE_CYCLE_MAX * SUN20I_PWM_CTL_PRESCAL_K_MAX) {
+			ret = -EINVAL;
+			goto unlock_mutex;
+		}
+		prescale_k = clamp(DIV_ROUND_UP_ULL(ent_cycle, SUN20I_PWM_ENTIRE_CYCLE_MAX), 1,
+				   SUN20I_PWM_CTL_PRESCAL_K_MAX);
+		ent_cycle = clamp(DIV_ROUND_CLOSEST_ULL(ent_cycle, prescale_k), 1,
+				  SUN20I_PWM_ENTIRE_CYCLE_MAX);
+		act_cycle = clamp(DIV_ROUND_CLOSEST_ULL(act_cycle, prescale_k), 0, ent_cycle);
 
-		/* calculate prescale_k, PWM entire cycle */
-		ent_cycle = val >> div_m;
-		prescale_k = DIV_ROUND_DOWN_ULL(ent_cycle, 65537);
-		if (prescale_k > SUN20I_PWM_CTL_PRESCAL_K_MAX)
-			prescale_k = SUN20I_PWM_CTL_PRESCAL_K_MAX;
+		clk_cfg = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
+		clk_cfg &= ~(SUN20I_PWM_CLK_CFG_DIV_M | SUN20I_PWM_CLK_CFG_SRC);
+		clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_DIV_M, div_m_shift);
+		clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_SRC, use_bus_clk);
+		sun20i_pwm_writel(sun20i_chip, clk_cfg, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
 
-		do_div(ent_cycle, prescale_k + 1);
-
-		/* for N cycles, PPRx.PWM_ENTIRE_CYCLE = (N-1) */
 		reg_period = FIELD_PREP(SUN20I_PWM_PERIOD_ENTIRE_CYCLE, ent_cycle - 1);
-
-		/* set duty cycle */
-		val = mul_u64_u64_div_u64(state->duty_cycle,
-					  (use_bus_clk ? bus_rate : hosc_rate),
-					  NSEC_PER_SEC);
-		act_cycle = val >> div_m;
-		do_div(act_cycle, prescale_k + 1);
-
-		/*
-		 * The formula of the output period and the duty-cycle for PWM are as follows.
-		 * T period = (PWM01_CLK / PWM0_PRESCALE_K)^-1 * (PPR0.PWM_ENTIRE_CYCLE + 1)
-		 * T high-level = (PWM01_CLK / PWM0_PRESCALE_K)^-1 * PPR0.PWM_ACT_CYCLE
-		 * Duty-cycle = T high-level / T period
-		 */
 		reg_period |= FIELD_PREP(SUN20I_PWM_PERIOD_ACT_CYCLE, act_cycle);
 		sun20i_pwm_writel(sun20i_chip, reg_period,
 			SUN20I_PWM_PERIOD(sun20i_chip, pwm->hwpwm));
 
-		ctl = FIELD_PREP(SUN20I_PWM_CTL_PRESCAL_K, prescale_k);
+		ctl = FIELD_PREP(SUN20I_PWM_CTL_PRESCAL_K, prescale_k - 1);
 		if (state->polarity == PWM_POLARITY_NORMAL)
 			ctl |= SUN20I_PWM_CTL_ACT_STA;
-
 		sun20i_pwm_writel(sun20i_chip, ctl, SUN20I_PWM_CTL(sun20i_chip, pwm->hwpwm));
 	}
 
@@ -382,9 +319,10 @@ static int sun20i_pwm_probe(struct platform_device *pdev)
 	if (ret)
 		npwm = 8;
 
-	if (npwm > 16) {
-		dev_info(&pdev->dev, "Limiting number of PWM lines from %u to 16", npwm);
-		npwm = 16;
+	if (npwm > SUN20I_PWM_CHANNELS_MAX) {
+		dev_info(&pdev->dev, "Limiting number of PWM lines from %u to %u", npwm,
+			 SUN20I_PWM_CHANNELS_MAX);
+		npwm = SUN20I_PWM_CHANNELS_MAX;
 	}
 
 	chip = devm_pwmchip_alloc(&pdev->dev, npwm, sizeof(*sun20i_chip));
@@ -420,6 +358,36 @@ static int sun20i_pwm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->rst),
 				     "failed to get bus reset\n");
 
+	for (int i = 0; i < (npwm + 1) / 2; i++) {
+		const char *source;
+		u32 div_m;
+
+		sun20i_chip->clk_src_reg[i] = SUN20I_PWM_CLOCK_SRC_DEFAULT;
+		sun20i_chip->div_m_shift_reg[i] = SUN20I_PWM_DIV_M_SHIFT_DEFAULT;
+
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "allwinner,pwm-pair-clock-sources", i, &source);
+		if (!ret) {
+			if (!strcasecmp(source, "hosc"))
+				sun20i_chip->clk_src_reg[i] = SUN20I_PWM_CLOCK_SRC_HOSC;
+			else if (!strcasecmp(source, "apb"))
+				sun20i_chip->clk_src_reg[i] = SUN20I_PWM_CLOCK_SRC_APB;
+			else
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "Unknown clock source: %s\n", source);
+		}
+
+		ret = of_property_read_u32_index(pdev->dev.of_node,
+						 "allwinner,pwm-pair-clock-prescales", i, &div_m);
+		if (!ret) {
+			if (div_m <= SUN20I_PWM_CLK_DIV_M_MAX)
+				sun20i_chip->div_m_shift_reg[i] = div_m;
+			else
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "Invalid prescale value: %u\n", div_m);
+		}
+	}
+
 	/* Deassert reset */
 	ret = reset_control_deassert(sun20i_chip->rst);
 	if (ret)
-- 
2.45.1

