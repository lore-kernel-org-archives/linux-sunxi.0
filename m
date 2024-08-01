Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354471953BD
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Aug 2024 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722514060; cv=none; b=D3/6Mqet1M6WBOaGEG7Fa/OWscj/HCI+vvXYpq7HoOMSuaJuCBA1RX55vB5TcqleM3c6cyUWm0yUv2DrW9PJV4zbKp2MWdlU/6rFbR4YeasKhQsmUDLq2a9DMQP+3L/xcOpQjZYnAGg5WHF9iaQwqZZpJeE1opwNU+rBlfac3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722514060; c=relaxed/simple;
	bh=EinisjOjPV0e0yKSpJfC3ecduhzTRgqOVJizc0uDCLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jV2xEXh9zgkfns5wtYz040EPOW+PbElPR05uf5X5FRjZl2RBlrN3JjzN7ftG9/j2qu9mUQ3DywlSqKzX66ymYktY5w5las8BR1eb7caa46m9lQt8olqiwG4Qh74CGRlHa4+fYQsBjDjOf0RLqttwN6dp/nVZAVp3kwCOr8SQA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaySkuM2; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaySkuM2"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f025b94e07so89006421fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Aug 2024 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722514056; x=1723118856; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWpJKDgAAIKrTcDAo93c65X2vfalBn4m5VoyMmFWUps=;
        b=jaySkuM2z2rn758xVw4BWt2v1y+fcoCRBijor1da/HQO5TDhCRVeGmGKOr6Cflps3m
         Skr9EMSh3M8vpa9oUauJrPiTWGs39p3Qw6prfGO4vXd1+ySVTdjaCfpDei9pdZCQp3Qw
         ad9R+jqrQIZwJpaXFXxV8YW1PpfAqVBvl4u+JLrqBXXz5sDlpxRBnF299MlANqxXFqQW
         CB1+7tSV+hyyN/5lIBqeDIb5fNLRaOLeelyx0NdfP6jEzAocLZnJ72zmOIE8MIEwV1cp
         Hpri93orSoqAM9tukvU0eFzF/eUht013aBsUwy0tL00PfN9H+nnq0wgUyeCPiSMBkCqv
         XKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722514056; x=1723118856;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWpJKDgAAIKrTcDAo93c65X2vfalBn4m5VoyMmFWUps=;
        b=twI8b53agTqFD47WE3izug7Xxh1ySbiWa7CEPc9YpK4nU0/oJiBG7eNYRhWic9zmbH
         AQ9jTctT+HcspTzayAuGyhj60OQr4QOsLfumLuOiXyGjt3OHsTyztgKx9iKfASPYhauZ
         CcmY9R0hMYxFxJKIEB62pctoBs41mCEGqrsmht/ZzXRtym0DGOM5aepqHQnh9mKAUad1
         Zgny+eUlB8RZYu/3EeJxq3djmHTeKIMsBC+4h6GdwdYw9g9GRsyEZFpYA5D/kB461nAx
         R7g+ppzFTvb132b8KVPq4YEp6nghmf1TERpDQ2gpfPncKJmiiS7JT3iCiuR8IKbbfY54
         3lBg==
X-Forwarded-Encrypted: i=1; AJvYcCXhO6CceNro/74UWbKzdX2ylRAHV/+xxPIlOOWNvSdAaXP179G9uLQCOofwbXeDv/oQzSbYrhzioSuxd0YLTcj1ceVtsJ9jFLyIceE=
X-Gm-Message-State: AOJu0Yzh1Kscv//r7vBldc+ebeK96sQ5lE43+D0E35VE/7pdxD0NYNvS
	UeiDCSuRu7ZMrzXQ+Ef155f1T7q+5Gsfa7H32A+uBjolzNyob1BO
X-Google-Smtp-Source: AGHT+IFZNbzC+YgMBit6OkJtk5dwL+OfkqPRYepqPLnWQLve6sNGUlEaHfkxbiBTBghGKCIoMPkEbw==
X-Received: by 2002:a2e:7011:0:b0:2ef:18ae:5cc2 with SMTP id 38308e7fff4ca-2f15aac0e67mr168391fa.21.1722514055505;
        Thu, 01 Aug 2024 05:07:35 -0700 (PDT)
Received: from localhost (host-82-58-19-206.retail.telecomitalia.it. [82.58.19.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857d4fsm19471856f8f.86.2024.08.01.05.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 05:07:35 -0700 (PDT)
From: Matteo Martelli <matteomartelli3@gmail.com>
Date: Thu, 01 Aug 2024 14:07:19 +0200
Subject: [PATCH v2] ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s mode
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240801-asoc-fix-sun4i-i2s-v2-1-a8e4e9daa363@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHZ6q2YC/0XMQQ6DIBCF4auYWXcMIFrpqvdoukAcdRIRA7RpY
 rx7STddfsl7/wGJIlOCW3VApDcnDluBulTgFrvNhDwWgxJKi2sj0abgcOIPptemGVklNFaYcRi
 kbt0E5bhHKoNf9PEsnmLwmJdI9p9qlZFadG1fy16YrkOF3uZMwduYaV25uc/e8lq74OE8v0Law
 /CoAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_P=C3=A9ron?= <peron.clem@gmail.com>, 
 Marcus Cooper <codekipper@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Matteo Martelli <matteomartelli3@gmail.com>
X-Mailer: b4 0.14.0

This fixes the LRCLK polarity for sun8i-h3 and sun50i-h6 in i2s mode
which was wrongly inverted.

The LRCLK was being set in reversed logic compared to the DAI format:
inverted LRCLK for SND_SOC_DAIFMT_IB_NF and SND_SOC_DAIFMT_NB_NF; normal
LRCLK for SND_SOC_DAIFMT_IB_IF and SND_SOC_DAIFMT_NB_IF. Such reversed
logic applies properly for DSP_A, DSP_B, LEFT_J and RIGHT_J modes but
not for I2S mode, for which the LRCLK signal results reversed to what
expected on the bus. The issue is due to a misinterpretation of the
LRCLK polarity bit of the H3 and H6 i2s controllers. Such bit in this
case does not mean "0 => normal" or "1 => inverted" according to the
expected bus operation, but it means "0 => frame starts on low edge" and
"1 => frame starts on high edge" (from the User Manuals).

This commit fixes the LRCLK polarity by setting the LRCLK polarity bit
according to the selected bus mode and renames the LRCLK polarity bit
definition to avoid further confusion.

Fixes: dd657eae8164 ("ASoC: sun4i-i2s: Fix the LRCK polarity")
Fixes: 73adf87b7a58 ("ASoC: sun4i-i2s: Add support for H6 I2S")
Signed-off-by: Matteo Martelli <matteomartelli3@gmail.com>
---
Note that this fix applies for all the i2s controllers compatible with
sun8i-h3-i2s and sun50i-h6-i2s.

The issue had likely been introduced in commit dd657eae8164 ("ASoC:
sun4i-i2s: Fix the LRCK polarity") due to a misinterpreted bit from the
H3 Datasheet (see link below). Then also introduced for the H6 SoC in
commit 73adf87b7a58 ("ASoC: sun4i-i2s: Add support for H6 I2S").

Datasheets:
- H3: https://linux-sunxi.org/images/4/4b/Allwinner_H3_Datasheet_V1.2.pdf
  section 8.6.7.2
- H6: https://linux-sunxi.org/images/4/46/Allwinner_H6_V200_User_Manual_V1.1.pdf
  section 7.2.5.2
- A64: https://linux-sunxi.org/images/b/b4/Allwinner_A64_User_Manual_V1.1.pdf
  section 7.6.7.2

Tests:
- Tested capture and playback in all supported formats (I2S, LEFT_J,
  RIGHT_J, DSP_A and DSP_B) in both normal and frame-inverted mode.
- Test setup: SoC DAI as master, ES8311 codec as slave. Bus monitored
  using a logic analyzer.
- Tested on A64 SoC (Pine64 board).
- Tested on H3 SoC (NanoPi Neo Air board).
- Not tested on H6 SoC.
---
Changes in v2:
- Fix LRCLK inversion mask: used BCLK mask by mistake in previous
  version
- Re-add clock word in DAI polarity comment
- Update patch description with a note about recent tests and datasheets
- Remove separate cover letter
- Rebase on top of asoc/for-next
- Link to v1: https://lore.kernel.org/all/20240529140658.180966-2-matteomartelli3@gmail.com
---
 sound/soc/sunxi/sun4i-i2s.c | 143 ++++++++++++++++++++++----------------------
 1 file changed, 73 insertions(+), 70 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 5f8d979585b6..3af0b2aab291 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -100,8 +100,8 @@
 #define SUN8I_I2S_CTRL_MODE_PCM			(0 << 4)
 
 #define SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK	BIT(19)
-#define SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED		(1 << 19)
-#define SUN8I_I2S_FMT0_LRCLK_POLARITY_NORMAL		(0 << 19)
+#define SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH	(1 << 19)
+#define SUN8I_I2S_FMT0_LRCLK_POLARITY_START_LOW		(0 << 19)
 #define SUN8I_I2S_FMT0_LRCK_PERIOD_MASK		GENMASK(17, 8)
 #define SUN8I_I2S_FMT0_LRCK_PERIOD(period)	((period - 1) << 8)
 #define SUN8I_I2S_FMT0_BCLK_POLARITY_MASK	BIT(7)
@@ -729,65 +729,37 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 				 unsigned int fmt)
 {
-	u32 mode, val;
+	u32 mode, lrclk_pol, bclk_pol, val;
 	u8 offset;
 
-	/*
-	 * DAI clock polarity
-	 *
-	 * The setup for LRCK contradicts the datasheet, but under a
-	 * scope it's clear that the LRCK polarity is reversed
-	 * compared to the expected polarity on the bus.
-	 */
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_IB_IF:
-		/* Invert both clocks */
-		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		/* Invert bit clock */
-		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED |
-		      SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		/* Invert frame clock */
-		val = 0;
-		break;
-	case SND_SOC_DAIFMT_NB_NF:
-		val = SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
-			   SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK |
-			   SUN8I_I2S_FMT0_BCLK_POLARITY_MASK,
-			   val);
-
 	/* DAI Mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH;
 		mode = SUN8I_I2S_CTRL_MODE_PCM;
 		offset = 1;
 		break;
 
 	case SND_SOC_DAIFMT_DSP_B:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH;
 		mode = SUN8I_I2S_CTRL_MODE_PCM;
 		offset = 0;
 		break;
 
 	case SND_SOC_DAIFMT_I2S:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_LOW;
 		mode = SUN8I_I2S_CTRL_MODE_LEFT;
 		offset = 1;
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH;
 		mode = SUN8I_I2S_CTRL_MODE_LEFT;
 		offset = 0;
 		break;
 
 	case SND_SOC_DAIFMT_RIGHT_J:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH;
 		mode = SUN8I_I2S_CTRL_MODE_RIGHT;
 		offset = 0;
 		break;
@@ -805,6 +777,35 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
 			   SUN8I_I2S_TX_CHAN_OFFSET(offset));
 
+	/* DAI clock polarity */
+	bclk_pol = SUN8I_I2S_FMT0_BCLK_POLARITY_NORMAL;
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_IF:
+		/* Invert both clocks */
+		lrclk_pol ^= SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK;
+		bclk_pol = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		/* Invert bit clock */
+		bclk_pol = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		/* Invert frame clock */
+		lrclk_pol ^= SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		/* No inversion */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
+			   SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK |
+			   SUN8I_I2S_FMT0_BCLK_POLARITY_MASK,
+			   lrclk_pol | bclk_pol);
+
 	/* DAI clock master masks */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
@@ -836,65 +837,37 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 				     unsigned int fmt)
 {
-	u32 mode, val;
+	u32 mode, lrclk_pol, bclk_pol, val;
 	u8 offset;
 
-	/*
-	 * DAI clock polarity
-	 *
-	 * The setup for LRCK contradicts the datasheet, but under a
-	 * scope it's clear that the LRCK polarity is reversed
-	 * compared to the expected polarity on the bus.
-	 */
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_IB_IF:
-		/* Invert both clocks */
-		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		/* Invert bit clock */
-		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED |
-		      SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		/* Invert frame clock */
-		val = 0;
-		break;
-	case SND_SOC_DAIFMT_NB_NF:
-		val = SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
-			   SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK |
-			   SUN8I_I2S_FMT0_BCLK_POLARITY_MASK,
-			   val);
-
 	/* DAI Mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH;
 		mode = SUN8I_I2S_CTRL_MODE_PCM;
 		offset = 1;
 		break;
 
 	case SND_SOC_DAIFMT_DSP_B:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH;
 		mode = SUN8I_I2S_CTRL_MODE_PCM;
 		offset = 0;
 		break;
 
 	case SND_SOC_DAIFMT_I2S:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_LOW;
 		mode = SUN8I_I2S_CTRL_MODE_LEFT;
 		offset = 1;
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH;
 		mode = SUN8I_I2S_CTRL_MODE_LEFT;
 		offset = 0;
 		break;
 
 	case SND_SOC_DAIFMT_RIGHT_J:
+		lrclk_pol = SUN8I_I2S_FMT0_LRCLK_POLARITY_START_HIGH;
 		mode = SUN8I_I2S_CTRL_MODE_RIGHT;
 		offset = 0;
 		break;
@@ -912,6 +885,36 @@ static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
 			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
 
+	/* DAI clock polarity */
+	bclk_pol = SUN8I_I2S_FMT0_BCLK_POLARITY_NORMAL;
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_IF:
+		/* Invert both clocks */
+		lrclk_pol ^= SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK;
+		bclk_pol = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		/* Invert bit clock */
+		bclk_pol = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		/* Invert frame clock */
+		lrclk_pol ^= SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		/* No inversion */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
+			   SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK |
+			   SUN8I_I2S_FMT0_BCLK_POLARITY_MASK,
+			   lrclk_pol | bclk_pol);
+
+
 	/* DAI clock master masks */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:

---
base-commit: ead2709553e9182c196c232100058ac008981cf1
change-id: 20240731-asoc-fix-sun4i-i2s-9a09dbb145cf

Best regards,
-- 
Matteo Martelli <matteomartelli3@gmail.com>

