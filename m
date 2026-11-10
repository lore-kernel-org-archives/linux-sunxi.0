Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276700;
	b=LBgnklkMzugzpYRAlht9brOCPFkH+1qGbLGRjYBH9oLoQr+y+r4mdy7KEp3P6zLEqPfG
	 0s9HJGIxmGC4/tHCkNHpl80YO9+d9hiIYIsCnvccj6kWZzuzGayuE9HlTz136JhoQu8Bi
	 Yw8JsEnTVLTDfSCN/JFhxk8FHk1WohrsLMswDcxXkW30fli/P3eSoMD43Wd0QAuQOXKWc
	 Li5insk9kB7WEdelgr+D18MdNdy2H3Ud43JlkupGRiEEcDEyYV9DQBUGocQyzT4mc6MBZ
	 bgt9u0HPlO3D7nMNuS9ltbqMKtcgAl6gP8meqY8BjFWHFgwZummpgxyexxTc+cZgFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=;
	b=x3yzPtnAqJ/0Xyoq9qkaVnSM0D0Z5u1J7a/mSKk1nAfLJWUqNBJF5/e/sz+kn86DuSIJ
	 ce5YO23AFLLWA4YPHgxJbwDv8rUeuPGEoD7rs/EQJ4R0DGeWkowdU3btu5faAhoBFmBkw
	 vgOGirxiu4eRXDOumWpPqhiHHD4ezNmCLvLK2DkxJCiTU/TPKKnyN64rqK2N760NbheJj
	 y+fT8qSNc8yRwtyoa6saFp/oct3shfANk/FyUqWMVBVler0oypmXqj4yPZk9rI7KSN4iA
	 Cf7tgETe/Q5S2V1Xd3y91MP1mRv4e8wNPb9VzskoD5z/kvbnGP1PC3pkreob1gSPQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+BG2pKw;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688DA606A321
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 02:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688DA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+BG2pKw
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-716ea2598eeso883411eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 18:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276699; x=1794881499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=;
        b=H+BG2pKwZHYvM2+ZR2E5waizKBeju7gvCxAKfHKBYHimBe+MVAmyY73B1OddNTze9Y
         RP8CWRGcRnKKVwn4LozO2S7dcLypOqR9Epi4y6fgZLTO6I8ebEOiBtWICwDsG0q01+0T
         RN+t/hNS/nwpaSi6AU2TrjMq82B0mfNavSzqCa8bbYlLilpPEA5JMsTzz80OfTRncr2S
         j1wc1ciWhXvauYs3E1JkoosqEwEE4Z+oWkInUTX+luyyLicJZxaVw0k1r+63oAOSefa9
         v4l5zIbk6aSfT4xtZA2bui4BS6iljiEf+b76rFWrKVQWUmobdgMOThI1v81ZTRfbRy+b
         VUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276699; x=1794881499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=;
        b=mXnZsBD9rOueGlUsinleuVRw/zPsYpp2+D/ncg/mJBT6vY365IleSExHDQmWmC28s+
         o/XgcWxjb15ZxmaCR0rvkc7AexNi1z2ayY1EQ/1pTIthXvb6iFe4ui4Cw4L/h1SujdXz
         UOuiTaUJLUCKndL6SspgS73Es22mE7hDRXEj3jXOYd0X4XRc5FcwxlXgDtZhaZJSeaYM
         z59RdeVvKeIcjJN8cbulC3iN/8Rgzq29j2syovBRHtsKv+DeBs1EmSfXuWbdyPksn7K5
         LH63AsVcnu3jFyzP/HmruiRK7tRPQJRgtsz09d/3TYmpYYC5KQ7/iUci1JrFaOluBT+c
         fsSA==
X-Forwarded-Encrypted: i=1; AL+hErHzQjy1WqHKl/uE0A6v4FfUBC0uFl9qT8ledirys/6V/0hSKggEgACmqzmT7BLJBiI4e9ZMcSH8xlIajQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8IZ31xSC/HxM2G4Z0eADBcNgpoNS00ESC1wMgvMa906J28PF3+
	cg9p6Bhpig/qxrpbp7SJZS4RLcMM9W+sOOq2RKC4EfYliXfzOGLPqdXw
X-Gm-Gg: AYBFou0nPNvPyZFz6iSIrJb9CwJFzMcTAHSFKeEokD3DITvaMcVcNOYdhbzzQaNUQ8z
	+qLyvAAxlAgGoJuK2/OQzAJl395g/e7sBm/iyoViE+yFvjlG7AyzAjSIvQ7VK2OwbfxprpBxmV8
	/7d5xkOTx6TX/NrHMR1W7orG+l361j/NGbTsBIJPWqXLkazafDpQAx3diFJF15B055f3fg+dWp/
	3vaWcwNLbi5932MCHW+tc5qQbLmMoDqi3REZ+pu+suB1tcWktftisTsNzZnANTDekzlIZSpqHSG
	bnQyl3ygDug1Tx33bQSuQVMrOGcJC0qrUWENVLUtglRrAob/PdktGo5KPxOfY3C5gLa4P30ym0b
	iLdoNQ36NlhndmK2P+vDCFRYOzIj59lSYZJnmAPoa0UNAhJic/1s3IqprfZFnkp0LxiaS802dne
	5oPGM2Lds+VQC2ufn66mabfHPHlfASGzpHAsidaLHo7XHG/M4CK+247tPhlroaNvc/wmnSOf2tD
	+0Vjiw+iu1Isp37b521do8dHEfzmacSpxmZTl4M7lARQHhDfm94qoMKgWi22/VL3KSX/M52ywMn
	oECpeq1zxQGkvGrDuDxTtfYj9oyjc615yyv65Zz29aTAY1KCzPl+mGq8MNBQXc1BAcFcd2n6zqF
	BoflA
X-Received: by 2002:a05:6820:5055:b0:715:24e6:9529 with SMTP id 006d021491bc7-718a7bd98d0mr462083eaf.86.1794276699230;
        Mon, 09 Nov 2026 18:11:39 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a945ceebsm717268eaf.8.2026.11.09.18.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:11:38 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Date: Mon,  9 Nov 2026 21:11:36 -0500
Message-ID: <20261109-a733-pinctrl-v3@gmail.com>
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

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Link: https://lore.kernel.org/r/20261107000135.6b684277@ryzen.lan
Suggested-by: Andre Przywara <andre.przywara@arm.com>
Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v3:
- Set every two-bit field to AUTO at init on both A733 controllers.
- Shorten the description; retain A523-R's existing handling.
- Drop Vinicius' Tested-by because the voltage-mode programming changed.
  Keep his Suggested-by for the separate A733-R descriptor.

v2: https://lore.kernel.org/r/20261104-a733-pinctrl-v2@gmail.com
Replaces Andre's RFT: https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com

Tests: arm64 defconfig sunxi W=1, boot-stack Image W=1 and DTB W=2 built.
Not tested: board boot, 1.8 V switching, A523.

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
index ca82f08a3a65..e095abbb7232 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -24,7 +24,7 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3ee5012463da..444930d3c389 100644
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
@@ -1659,6 +1660,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
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

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

