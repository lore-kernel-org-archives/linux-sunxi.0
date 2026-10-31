Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413609;
	b=NLHADXiN+lQxEUx2e1s7sqQruRMqgmkKBftw1VPwOrCffch+u/EXT/vmuwxmydjx8/3E
	 qwYiR8u/rXEygS7SySs/wizWekljTXvp8K6dms1TJw5W283N2Qk2hb4USNByx7SWhmTdP
	 Ao1picnpYUyni8uQQYmxdObG4CvPcqpuyqBwsPuZrpNsf491OvGIj2bF9kb+aU7Na20fu
	 qNMOVhg/UK0+U4FCX3LLRdG68KoX/XPbt55H0J5iBi7gmZqqLo5zAaDQj5hyT+RNUZALS
	 XSHeJ0s2O0WvIaA9oipijwqKLfO3WWmf0/7PGRZOIkTkhZ5x3Hs4BgNcgQqbyiCjfew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=;
	b=YjrSN7dOmt5q9GFd9jVrL8SvIm7OTXUippSSX/Ohrgd0s/2d0XHxNXC/+PmVvk8sI3cp
	 qfEh6Ubdtaa3m8qyIjeFe6YaogrTwhAVnKN1FWxDEe1Jg63UI90H/EWwAMCE2cpDbcdbQ
	 fwUWPD8Ld3rekPLgTAaHu4Fg7uCI9i1Q0YKx4HWLYIRWq0pXWJ5gVo3UFaZ9pHYatvOEv
	 Yur2Mtt9gRnw/LLwZW4ouMIaHpyBK52obVm7drkkRIcJUWe6j28ROtBJNhaFM/T/lJJsm
	 i+4gAuBcWlrR0GEfaMlWMlFbFAgilCxB+Hx8MwNojm16zHQywlZDF9gS9qoaU+N2Y+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6lz3Rpr;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69066606A325
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 02:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69066606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6lz3Rpr
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-703be215729so635883eaf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 19:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413607; x=1794018407; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=;
        b=H6lz3RpriRRUMZm4R9Ig8E3JcvDvrNyPdU+OQkZRkedQudwpln1h6HlLDgPS0OYzV3
         qUV6IYcWr3Dp53SaANY2phrWPZ1xoqKj9WVo/9tUxkoslqc7aQpMeSanIG/ejbV7fjL0
         znsaXuJKNGkZlWgWP8Djjqlz53r3/ss5ZWUbDg+m4LffDPr3GNVBZbhJjBVDPh6ZAUpM
         VvX0c0VZJuU8mAy2gxeiXeOcm5qjawXU+QQsXuwuGoZSTkImVbSJrIy9Teon5SYJ8z/R
         at8YfpoACo04r+syLtRORKHrw48QQisRSbxmovfCcREWc+FwMWPTnpO2n9WlsX/K9tTm
         nlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413607; x=1794018407;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=;
        b=rk2onQRpT4F0zROPR7U5wOI7n+pxxXtY5nYI3IfdeZyeityFZ5LJ2l9KbCTNVQdIt+
         pjfY6Ala8sz3hRsDVq2qOeY8UA0QeXQqmhGahRldZdOSzPZG6ZRWcVWohVavyLvd5fBR
         AhpoIWln5hD8HK96eI04E63evk+MBtOPb6VzpwgQZABgqonDN2l6WRbEBPEZ5Ml1rWeu
         P1rVYqNQ1ySWUN1CO0qovpkfVE2JocdnwGcslClIkAqjdkM++iOLEInChSdh2HsJXTYP
         /kQEb5pPhuqyHiNssH1p/mpxuktWjicPSBEw+o005O/WRigUf2dgDLSxZUnvdsIOFIzI
         Dbww==
X-Forwarded-Encrypted: i=1; AKwUvBweircGn1RHTRDX+fco639af9bMOay/dZyisNO2zM93vsM5oZWgz36DD6WctPrKxq5vEycQBjf9asUQgg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLtrdA5z2KxyGaRja7SvlFH5HA+ij+ZMgVQlmCr3VlowhQEuEaO
	7TVubNblGMImZj/O7R4dExV1cxH4zbUtWloneZu71t1FVjvw/1Fl7tRG
X-Gm-Gg: AYBFou3RPd0CuZb7uByjHGHC5Xi9GE0/tjnIlPWie6CKyRxImcQktnvdv0TK6zudcPw
	d/bizfONnTj2Na0Cf7xIFK7q0hpSwvyGDPjJ4cvBEW7ppVqqPhIK/kXRuEF1Ke6mzIm87/OQlsC
	0Xc0Fyb2TELXkFfTc7tUP0xz2gIQV5KUgLI1o2JYN6KctJc5lQHC81xuIaCT+FZhsjbPTvvepM2
	Xo+GXJFT1TReL6uYSiIM5IiLZwfSvRukb7CuYigFfP4Kfv78NEpGBWDlBNbliB8Kzsy70jTfq8S
	qeywDqyoW4Uw+Mdfz+RY2l3z9w+ZYuf84OnMFXNrXe6+KyPH1ctaEhiTJ6fcZQpN0wIVKMCoulV
	3Mow4CDaECaAEixniKZxKDFB3Gw/AW8civf5j5Yps++mpmbO/oBT4UKtAV24fJ/YbZOJ51xmz8w
	CVzqv9uLkgqHPnNaIYDJVi9mGUw5kkkQI6fQbxda+oHHnPUOmHEgnwfaOBlZEdjp1xAFAm+5+pN
	jKaXinP85k5WaDp8+gRU8IUdV+ccSXltBFvwQUv/wGhRLazEa4DnieCmf8LK+b1eCDwGfp6SVAT
	pmwsK3D/GpzY35sO0k7xhd8osmJ4miqmhwCWdjDd/nwJzUDbOnwtZbCsnR3RiwBFIVKk4sHZz/e
	Vm7YSiA==
X-Received: by 2002:a05:6820:1c84:b0:6dd:696d:b21f with SMTP id 006d021491bc7-714f24e7c6bmr2638903eaf.2.1793413607382;
        Fri, 30 Oct 2026 19:26:47 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167984dsm1438390fac.1.2026.10.30.19.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:47 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Fri, 30 Oct 2026 22:26:45 -0400
Message-ID: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The A733 voltage-selection fields are two bits wide. The main controller
uses a separate VCCIO field at bits 25:24 for PB; the older one-bit
handler instead writes bit1 when PB is requested. A733 R-PIO also
differs from A523: its documented table has SEL at 0x340 and VAL at
0x348, without the A523 control register at 0x344.

Stop using those incompatible layouts on A733. Select BIAS_VOLTAGE_NONE
for both controllers and give A733-R its own descriptor, retaining the
A523-R descriptor and behavior. This preserves firmware voltage modes
when explicit bank supplies are requested. It does not implement dynamic
voltage switching or choose among conflicting manual AUTO descriptions.

The public October 14 discussion recommends this conservative treatment:
https://lore.kernel.org/all/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com/

AI assistance: Codex:gpt-6-astra.

Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This implements Vinicius Pedrosa's recommended conservative approach
for both A733 controllers, including a separate A733-R descriptor:
https://lore.kernel.org/r/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com
It avoids the disputed AUTO encoding and does not replace that public
discussion with a claim that voltage switching is solved.

The standalone base is official commit
d89e1d186ec9271bf78e62771779e9fc03bf0fc3 plus Pablo Mazzini's three
IRQ-bank v3 patches:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
The IRQ changes are prerequisites, not part of this patch's diff.

With the separate A7S DT v2 and its PMIC/bank supplies enabled, two
final-candidate RAM boots preserved the main and R SEL controls and
PF supply selector across kernel handoff. UART0, R-I2C0/PMIC and
read-only MMC0 traffic worked, including after unused-regulator cleanup.
The firmware's PF high-voltage path was verified before each boot.

A regression harness exercised 60 A733 no-read/no-write cases, the old
main-handler wrong-bit counterexample, and the unchanged A523-R
handler behavior. Both changed objects built with W=1. A523-R hardware
was not tested; its behavior is retained and checked by the regression
harness. No analog voltage, UHS or dynamic voltage-switching claim is
made. The read-only VAL observations are not precision measurements.

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 20 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  3 ++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef141cf5f00ec37435af0f8f6a94b45..1cfd8118435066b403f8b9b0b3725e849643ff84 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,29 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	/* A733 has two-bit voltage modes, without the A523 control register. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
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
index 3ebe926a1bc6ba75716f13804db718174b4be229..e2cd7a431af7bc5ec47e8f5719ab11c22b461658 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -27,7 +27,8 @@ static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
 	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	/* Preserve the firmware-configured two-bit voltage modes. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
-- 
2.53.0

