Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50F304BDE;
	Thu, 25 Dec 2025 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766649766; cv=none; b=ImA5B/eTP40fhIKGajsZe47UHJm2FOeM4/B24JMNPcZ2wSC6ZF2jvKPWt7ziGnT9qE67fNsYHhrIS4/lcC3TOANlk8P523GpmWx/DtmnmgKVdlff5mWz3NAISE3AZTwPJYjVNJgo02/h13xtGKxXaVNLLqE78KIUi74IhzOC2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766649766; c=relaxed/simple;
	bh=uj9yrSuuf2gOll06W83ryExufB13oHVtebJ1kpodW0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQ0NrNB4n6/KTI0yBOBE7mh1CBqswRwEtA7EjuiH0hVmqxi0QlE7Na6SP7V8CO4nZ7U0UDCHK9Vf80GPafObbGjxw3Exn6y5kp+IvgSTC5AoG+fSWB5NZSVOuutS9DNAHntFrJR1nYSspKjUkCRoysAHB5npCkVY0NnrprwEhHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4fTazB6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4fTazB6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBA3C4CEF1;
	Thu, 25 Dec 2025 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766649765;
	bh=uj9yrSuuf2gOll06W83ryExufB13oHVtebJ1kpodW0Q=;
	h=From:To:Cc:Subject:Date:From;
	b=R4fTazB6fEz4Ad8wfHWQvFOSk8Sp1j/zffO5BJeu6s3zAdRFTkW9ljkRrKz3GVnGI
	 vqQZ2XUnxsIARk7yVDdw7utrS+kZSID+4/VCMHz6eSEyYoPCa3TzQ/2MBMUV0SjsCr
	 vZboYtZ2PFx8EiNjAtuhEiKrs+qNzpuUS7KA3UgfphFnGfPUUuJzHzoYDxahL0M1L1
	 m6SrIlfLIMtaX31eJYe0bUE79Tb92HX8kPMUZdb/Fg7+VfiyzSL1tOtdi7lnBVhq2T
	 xp4uU4wBTfMQX9DozpjQpXjJ7xEt3QCMYzGPoDngmxRJZ9UPXhLUiCXrJEahYz0MPH
	 ui02VjtpHS6sw==
Received: by wens.tw (Postfix, from userid 1000)
	id 963775FC5C; Thu, 25 Dec 2025 16:02:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: axp20x: AXP717: Add type-C CC registers
Date: Thu, 25 Dec 2025 16:02:40 +0800
Message-ID: <20251225080241.3153453-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AXP717 has some extra registers related to type-C CC pin
negotiation. They were missing from the original submission.

Add them for completeness.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/mfd/axp20x.c       | 5 ++++-
 include/linux/mfd/axp20x.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index c5f0ebae327f..679364189ea5 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -229,6 +229,8 @@ static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
 	regmap_reg_range(AXP717_ADC_CH_EN_CONTROL, AXP717_ADC_CH_EN_CONTROL),
 	regmap_reg_range(AXP717_ADC_DATA_SEL, AXP717_ADC_DATA_SEL),
+	regmap_reg_range(AXP717_TYPEC_CC_AA_EN, AXP717_TYPEC_CC_AA_EN),
+	regmap_reg_range(AXP717_TYPEC_CC_MODE_CONTROL, AXP717_TYPEC_CC_MODE_CONTROL),
 };
 
 static const struct regmap_range axp717_volatile_ranges[] = {
@@ -237,6 +239,7 @@ static const struct regmap_range axp717_volatile_ranges[] = {
 	regmap_reg_range(AXP717_BATT_PERCENT_DATA, AXP717_BATT_PERCENT_DATA),
 	regmap_reg_range(AXP717_BATT_V_H, AXP717_BATT_CHRG_I_L),
 	regmap_reg_range(AXP717_ADC_DATA_H, AXP717_ADC_DATA_L),
+	regmap_reg_range(AXP717_TYPEC_CC_STATUS, AXP717_TYPEC_CC_STATUS),
 };
 
 static const struct regmap_access_table axp717_writeable_table = {
@@ -458,7 +461,7 @@ static const struct regmap_config axp717_regmap_config = {
 	.val_bits = 8,
 	.wr_table = &axp717_writeable_table,
 	.volatile_table = &axp717_volatile_table,
-	.max_register = AXP717_ADC_DATA_L,
+	.max_register = AXP717_TYPEC_CC_STATUS,
 	.cache_type = REGCACHE_MAPLE,
 };
 
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 3c5aecf1d4b5..b352661d99a1 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -174,6 +174,9 @@ enum axp20x_variants {
 #define AXP717_ADC_DATA_SEL		0xcd
 #define AXP717_ADC_DATA_H		0xce
 #define AXP717_ADC_DATA_L		0xcf
+#define AXP717_TYPEC_CC_AA_EN		0xe1
+#define AXP717_TYPEC_CC_MODE_CONTROL	0xe3
+#define AXP717_TYPEC_CC_STATUS		0xe7
 
 #define AXP806_STARTUP_SRC		0x00
 #define AXP806_CHIP_ID			0x03
-- 
2.47.3

