Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725220;
	b=jIL3o/T+aFboZEPG8AsuA1ZYTpV0TG3/P0Myu/iRhhBszjV6cY07FF+V3qBlrMGrYV+y
	 KDIJK0MbOLMpuCHJ5VA97Y/FXALKnJQQ0kyWt1ItdWsE8WQfx8rNvLxdWvN1926XcY9gc
	 Oh63WG7If7HZiy/kDeKoS5jKTAVOuqE8Tg2xJxnIIsyy2kWBOWcT64W/ZPsqgO6clYz1V
	 kYEMxcgpn18pBjtGOQsFNQeHdnJAKsqRdbSKqFV+tNWudGCnpHHVLdkbls1/JYEhxnmPQ
	 Z8yVujVGraqZdN7BUjK0JdsxkHHGrZFsKZMidQgUs+ofgz9nHPKM9x4qkVhPDhJNgRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UnNwggCwKCjSqWmbRtTc0QeuSXjE6eofUZP3n/Jxdsw=;
	b=HjPrOI2nnowHWjbTRMA+PVugTqBXpDnWUrPXYpi9IsMpY9XV/1kEcOWiFRNWOxtToYC3
	 xcis1qx/N/TR42yR1ScdFrFu2Nm7iDG4IWfX8iHs+Luy5xjugGrqBesjDunjYnnpPPlDs
	 hSfbOMJVzTL07EHAeB+T3GJ+VmB5x1syEDhqqAYZCX3/26ajQi7ROjARQ7h42Do3m+6m1
	 omK9Xy/R75eN5ckFUQ2jLQVC+PReUJdn/JlnCsoOEW4xX3pnFVyLcKWK4Sk1tYkgscJHS
	 +xpPaLONiI7ym489iN5cEOQ9bfa971nwV9jQfwrT46iX576wPib4NbrBgw9a2dA73Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDmJngC9;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C1606A688
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542C1606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDmJngC9
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53c156ba662so4198937b6e.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725219; x=1796330019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnNwggCwKCjSqWmbRtTc0QeuSXjE6eofUZP3n/Jxdsw=;
        b=cDmJngC9/RBNLVik3y15PGYVuT2Do4b0wsGrfO35N/1ZNvd121zbOc9e0LnP/OW07Q
         6EtTuXCLACCkKfMzrZZw4IhQ3gBC0q8KYGN+N4CKUtLE/jLrUnkbx+3MIPDUZ95DW2Az
         ptIfiUfSOsruBqbzTXdAJrm4YLPy20q+s5h2I79RBLqu4yRhCD7JQnV6IPKVkZpiZeGM
         f8TaEac+TRa37MxL0EroccTLNlDCiqLAStiX67vatELsHo8Ia84vaFf+Po/kgIv/Os2C
         8UCOnIqMr9Wds5knSeKCmAx/8Az+bDL13Hhvv+8YFBn0XgOjSwMfAQzbJxfqhGHB5lgZ
         4J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725219; x=1796330019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnNwggCwKCjSqWmbRtTc0QeuSXjE6eofUZP3n/Jxdsw=;
        b=HjOncmr8xf9vHLQ5Ue8fI/D3OQNfmfuzXzLcjsPG3YYFzc3nhB1tq4wjmW+0pNBljO
         uQ8MMz/VdTw/2whryWWHY+zz6p3pYA4pNCD0hq4fbWb0Wf56OsFOpXTIBG+NO00YI1tq
         ECL8PtK29E6U7aUDsyvESSJujUkgXmNop0s7iP8A8G1iEgk5TLk5FauZ3Z+h+d0A+mzG
         lN8T/zpY7gWTKwKAd1HWwPc3KP1W7I6vIFwBTL0ztQ2uc1XeTWvTvBGA5mVcMGgp43VF
         rS+hhqYZiqni+HuChLRBFucu06dWAINuxyOtsKh7MuDxF2UH77enTQXu6ORej/zxuo3x
         FnOw==
X-Forwarded-Encrypted: i=1; AL+hErHkwnFwNZEwWv9r2jjuss1GLlfalzuAekGeB7+M5nn61aWhli19V+xoMDOIUn7eEiOnBgklANkOgc3f4g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/fp58pE8gYX1eEyud2njg65JMt/8aAJ4d+LYMYQiXwVg9QAkal
	9rU6/cvs0nQWnLQLrGTSBnoJGJ3LIbrrldO10TP4chYLUv3YKNBBpcYr
X-Gm-Gg: AZFdTZeKH1JUApCq/xd1qJHO7lSeDuzBrTOTOGb/xOFNJxuJ99f0zi2mnGR3yoI2TwD
	bmmc5SnIsIyjCCf/C7GM+Q5abbi/sEmgrRlSKT7ySlifSJuFLckqbT51obwvvIZ9MSpnekJtUIe
	cpHs0k+pZsWAepK8RaEBhf+f4+yVUv5uYeN1TYfeaiJn9CuyinmimaoloSuI9DfrsX/E8ckNQjg
	RMC2OvdVUyBgxZKJS8X6aCEIl0Ie8cB1LVPYCniwnxT1bsAzxSm/yoAf7vXF5C+W6hkw2QnWU78
	TZlX9mb59xcdjz44MyHmMxdeU+tcjLksBnQ7/5xjDpWVj8CBH2WJOILF/OZsdeBMd+jI712Yd8i
	UCA+voQzYiTBeEmCGvfvPiDzRc8dGMEsITyVjjLAVpUFJFnKGk7xh88OiFIDBQBcrKKh9hvh70/
	51mjZGvvmDb0U9cGYb30DtfYHqgjqkbr5QgdKPP8r4X3gVTwgWmIrARTbc9dx0X7QGFMvpcB1gY
	tfIXvx5LjLBvh4JEDvlI+j0TIJT3jyI58a18J9hCK30QZ2co0rR46hwV41mHGe6kZI1fb33zO8R
	JL8aHMGPWcnlRNaCML47cyi1n6VjJTtyppOLzDe1JpH7gzKTnw8mmGafPmbYf45VBBgOpNpvuV7
	6MMs8Sw==
X-Received: by 2002:a05:6808:67c7:b0:575:7930:e650 with SMTP id 5614622812f47-57a0c9c4596mr21951267b6e.54.1795725219040;
        Thu, 26 Nov 2026 12:33:39 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61659cb8sm21247024fac.17.2026.11.26.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v4] pinctrl: sunxi: use automatic voltage detection on A733
Date: Thu, 26 Nov 2026 15:33:36 -0500
Message-ID: <20261125-a733-pinctrl-v4@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A733 uses two-bit voltage-mode fields, but the handlers selected when
v7.4-rc1 added A733 support program them as one-bit fields. The R-PIO
handler also writes an A523 control register absent on A733.

Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
POW_MOD_SEL at controller init and skip per-pin voltage setup. Use it
for both A733 controllers: the A733 User Manual v1.00 documents 01 as
auto in sections 18.14.6.1 and 18.14.7.20. Give A733-R a separate
descriptor so A523-R keeps its existing voltage handling.

On Orange Pi 4 Pro, the one-bit handler leaves bank H in 1.8 V mode
while supplied at 3.3 V, breaking RGMII Gigabit TX. Alastair D'Silva
reported that selecting auto mode restores TX.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Link: https://lore.kernel.org/r/20261107000135.6b684277@ryzen.lan
Reported-by: Alastair D'Silva <alastair@d-silva.org>
Closes: https://lore.kernel.org/r/20261125115703.3724690-1-alastair@d-silva.org
Suggested-by: Andre Przywara <andre.przywara@arm.com>
Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z
Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v4:
- Rebase onto pinctrl fixes after the EINT-mux fix (context only).
- Carry Vinicius' and Norman's Tested-by tags from v3 (code unchanged),
  and credit Alastair's report.

v3: https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
v2: https://lore.kernel.org/r/20261104-a733-pinctrl-v2@gmail.com
Replaces Andre's RFT: https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com

Tests: arm64 defconfig and W=1 sunxi build. Vinicius tested v3 on A7Z.
Norman tested on Cubie A7S with v7.3.6 plus A733 patches, this patch
and Pablo's IRQ-bank series backported, with his voltage-mode patches
removed. POW_VAL matched the schematic; 3.3 V SD High Speed and GPIO
IRQs on PK0, PB0 and PJ24 worked.
Not tested: v4 on hardware, 1.8 V SD switching, A523, pad voltages.

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 19 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  7 ++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  2 ++
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..006754c0645f 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,28 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index 456d9170c2a2..c66f57385075 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -23,7 +23,7 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf4ec4665e2b..e54ed9e0b403 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -732,7 +732,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 	u32 val, reg;
 	int uV;
 
-	if (!pctl->desc->io_bias_cfg_variant)
+	if (pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_NONE ||
+	    pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_AUTO)
 		return 0;
 
 	uV = regulator_get_voltage(supply);
@@ -1655,6 +1656,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	/* Select auto (01) for every bank, including shared VCC-IO. */
+	if (desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_AUTO)
+		writel(0x55555555, pctl->membase + pctl->pow_mod_sel_offset);
+
 	/*
 	 * Seed the output latch shadow from the hardware so pins the
 	 * bootloader left in output mode keep their state; see
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..7b36c5c2263e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -130,6 +130,8 @@ enum sunxi_desc_bias_voltage {
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
+	/* Two-bit PIO_POW_MOD_SEL fields set to automatic voltage detection. */
+	BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 struct sunxi_desc_function {

base-commit: 721850a3086d109c7ea5841673766a393747e4f1
-- 
2.53.0

