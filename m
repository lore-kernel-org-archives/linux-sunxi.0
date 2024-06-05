Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC692770E
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717608058; cv=none; b=EyK3Jki8dLfjG+Tcwj9Lp+pjFC1c2ACjkG0DbEkL0j6dEmHHKfgrDeZm+0z2cCoSy3obOfObJGaZvELFVqcxSGFTWRJTvZ0/6hZDTeg0hs+/SuxsILPenW9W0QPxsdu7tnK26jd023hr0hEU8D2Lpa47XCBllQzfmZBem++tekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717608058; c=relaxed/simple;
	bh=lcvuYe7GeCU9jXQJtaC1ntbheOmI8WkJcC1aR3hKv2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kTepLfs6QF8mN5x7opZLYZS7FTFvbC0k1ywUzGtOwqoJFjwwLTXMMmhZfiNesc21ajRSxeWsRnZT3430iMiCMEFn/xQLpNZIuONU1brXkuaBaKlwk+cQWp19bzKF3MW373qOP7JSuK99tNTUzcXWjbeR5bbhhde/Jyf5bwwe1ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOZ7yJSA; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOZ7yJSA"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ba6dd7b976so145004eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717608056; x=1718212856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/z8afaos4QN1j31mCC9NKqTF3Z6R6V7O2t8IBODAYE=;
        b=YOZ7yJSA75nYYI8OUjh1j/QTaTe2ZnPgZKf1/L1abTZBbfkBu+1pip4nw61lJAA2U8
         8RhbuhIm55WWK1EeeDAIRfLKJagqwKvUlCvUNcvURmgf+PGARVWS8sf2BSUOuD/GxE1i
         gBFds4oF3ocV6dwGnIIaC9Xhr7QLrZ03ID/7g9XDnczgGnqo59IOjMTHy8jOv+bXyBWV
         h32R4nK0ADRpQfwgK86F+uDk34X9vQnrpq8dlcuyS2XxmYiYnsMjO1fGxDj3m+xmvirM
         zy2cBUspRZ8tmfPgw79Cv8IUMNsde/9U9WjEK+Ru96yF71WuVy5ozDzqK954/E6P3h9T
         X5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717608056; x=1718212856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/z8afaos4QN1j31mCC9NKqTF3Z6R6V7O2t8IBODAYE=;
        b=gg2oCjEd67SpRoFp8OrLS60o9bIp7UCLCcFLuCFUml4UZhC793AuuzDnuj429wRskk
         Xl4wmb/ykPNzKWSln682oZ0cuZCF1ckg887/z1ZsBx4YSUZl2lBW9m8COkUIgahNZqoe
         OKNV4jqonrgseqF97YIunP3nUbLlYCdoprdOKu8CZMAd+BIhmVyY+DCjQMxri/DHXa5I
         MfX1Z88RUfMez0g7Iqf8ECS8QN1d7HexgWjgnBdin8XwRK5CNiWkZaykcBhAdhOZUP6V
         +vz365LpFygxvKXOxLar6sm7Z0Cu7pP383s2zo6oq3cdMzJYKVsVPB+MihpBx/XMi56Z
         90cw==
X-Gm-Message-State: AOJu0Yz9avVdaop0ege+mgSogtskmISJqyt6d02HmWr6Z9xfj01TaWZ1
	TAnbNyJjtHTrcLIMKlY8IcJLVond5J6yeedEXLp/gwgrsU16lCBHyMMnDw==
X-Google-Smtp-Source: AGHT+IF8/BaMC9Cy37HnJE/gDWoJIWn5VGKga5nBgLv3JuPdyTdrRaAwARV/IAT6vrD6FGx0R/k9Gg==
X-Received: by 2002:a05:6820:22a0:b0:5b9:8d0a:1568 with SMTP id 006d021491bc7-5ba78f2e102mr3789488eaf.2.1717608055898;
        Wed, 05 Jun 2024 10:20:55 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ba72cb44f4sm586124eaf.40.2024.06.05.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 10:20:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	p.zabel@pengutronix.de,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 2/4] clk: sunxi-ng: h616: Add clock/reset for GPADC
Date: Wed,  5 Jun 2024 12:20:47 -0500
Message-Id: <20240605172049.231108-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605172049.231108-1-macroalpha82@gmail.com>
References: <20240605172049.231108-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the GPADC required clock and reset which is used for the onboard
GPADC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 5 +++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 45aae1ae5178..64f476c46f5b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -489,6 +489,8 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(ts_clk, "ts", ts_parents, 0x9b0,
 
 static SUNXI_CCU_GATE(bus_ts_clk, "bus-ts", "ahb3", 0x9bc, BIT(0), 0);
 
+static SUNXI_CCU_GATE(bus_gpadc_clk, "bus-gpadc", "apb1", 0x9ec, BIT(0), 0);
+
 static SUNXI_CCU_GATE(bus_ths_clk, "bus-ths", "apb1", 0x9fc, BIT(0), 0);
 
 static const char * const audio_parents[] = { "pll-audio-1x", "pll-audio-2x",
@@ -807,6 +809,7 @@ static struct ccu_common *sun50i_h616_ccu_clks[] = {
 	&bus_emac1_clk.common,
 	&ts_clk.common,
 	&bus_ts_clk.common,
+	&bus_gpadc_clk.common,
 	&bus_ths_clk.common,
 	&spdif_clk.common,
 	&bus_spdif_clk.common,
@@ -940,6 +943,7 @@ static struct clk_hw_onecell_data sun50i_h616_hw_clks = {
 		[CLK_BUS_EMAC1]		= &bus_emac1_clk.common.hw,
 		[CLK_TS]		= &ts_clk.common.hw,
 		[CLK_BUS_TS]		= &bus_ts_clk.common.hw,
+		[CLK_BUS_GPADC]		= &bus_gpadc_clk.common.hw,
 		[CLK_BUS_THS]		= &bus_ths_clk.common.hw,
 		[CLK_SPDIF]		= &spdif_clk.common.hw,
 		[CLK_BUS_SPDIF]		= &bus_spdif_clk.common.hw,
@@ -1021,6 +1025,7 @@ static struct ccu_reset_map sun50i_h616_ccu_resets[] = {
 	[RST_BUS_EMAC0]		= { 0x97c, BIT(16) },
 	[RST_BUS_EMAC1]		= { 0x97c, BIT(17) },
 	[RST_BUS_TS]		= { 0x9bc, BIT(16) },
+	[RST_BUS_GPADC]		= { 0x9ec, BIT(16) },
 	[RST_BUS_THS]		= { 0x9fc, BIT(16) },
 	[RST_BUS_SPDIF]		= { 0xa2c, BIT(16) },
 	[RST_BUS_DMIC]		= { 0xa4c, BIT(16) },
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
index fdd2f4d5103f..a75803b49f6a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
@@ -51,6 +51,6 @@
 
 #define CLK_BUS_DRAM		56
 
-#define CLK_NUMBER		(CLK_PLL_SYSTEM_32K + 1)
+#define CLK_NUMBER		(CLK_BUS_GPADC + 1)
 
 #endif /* _CCU_SUN50I_H616_H_ */
-- 
2.34.1

