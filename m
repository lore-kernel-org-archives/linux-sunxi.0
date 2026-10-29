Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299661;
	b=wKxs/GIsYHM7USUGOb6Q1A5xVrOJPTfLdSVijFLqulDVcNxKzRd8U6s+ZV8tP5581FTX
	 kfJE1JiArFMdR6T+bMO1UKuWne/u9Y7xjSjMUOC58GXPs+KrzX8aL5wLjJwP1AwvS5zTj
	 gBw4uDSmJAYufeZ92pbClVoS4+GQCA8+qwG/x+qYqQ3z2uwMvIyWBZsYbCl+xE07Nmbrg
	 jtaF0xy5FB1c+vsN4qZ8CfTI5iKW/DrvGUQV+RFY67btA3VAJMWb8wsn2Gv9zUU2X5pj8
	 kok8GZyEATizjpB/e/kbw/02JhPpDtQHHu0AtE3Juoh4LI1juhLybekPgfHWPWTwm1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
	b=qiHIePU1CNXbWrfLg49DPUqz+r/83Cp0iCYAiOyAFfpxOUuugLYklt2ky0OqzlOnjoHs
	 T8frak5QU9M2aIspqmbX7Q/mjTEfv3gxqYuGy87wqGSo5PYL1kV4rV9CIZJUpUSSdbnGU
	 WwkERBckfho52eiIzIwrQ+WaKadJYeJtRXZGy6lAd52lvxzeOBVIL3KqqdhIJ3aQbqgrY
	 KBqaj3Ua5SVObo4YleP+AkJ3VwNFnelUzSDU74XLvjaDkO7STZVhRL7Wnb477V9ZQdcwH
	 7RJrKuZ06/Je+ECZld9fXCjs9Z71vtQSE6ryYo8uhrXAR2AAbWej6prQzMU2Y/FM98A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yaHX2hiI;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5841360A2602
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 18:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5841360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yaHX2hiI
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6e560e00a86so1881579eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299660; x=1793904460; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
        b=yaHX2hiIMvNuktutT5X9/DhiAepLIQWJXRa5dS/RhoICJvRtTy/nY4s/yMy5lW/am2
         WUh5QAqCmGsM28xpNiG+WfxnKE80QAs+Ehwsv0Nue/x6pGFbPjN0LQ54YsXJBQnmz8fO
         mnkdpLGOopSFD8b4RGMgiYra/eb/2qCvUGKltLyZPI6Zd9oGJuTQDI3xwEcctzPwHvo0
         KxwukehN+A5Uz+8BeDsTHFSast7z0du73C941qyU4S5sTkDIga7McHj1wC9lbTY5/UbL
         rPtdD6eMEykf8CdX04TnqrlYCJpDol3knpwceFa9yXgqPwEAFMTPZKLLWEK+Q6Arza6D
         KQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299660; x=1793904460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
        b=kuScBPuSWzWdatjF8N9D5nAMAh/hC/Gs0Xc5qIvDAec4z/QgZxE6GEFTLX+rFcchnI
         Ji7otoLKH7X67xBJTphbi6sDXEeOehekDRlVtyjRajnBzY4e7bF9iualNL4HfqtABX1r
         u6T7Y66xE5wcNBkOW2EVPEunAZkl/WuMpRS5Rvby7DJ3N/xcJygajvqYSSftXp8nhkfG
         RjG4LJqcWXegi/p0J8DEDmAuiaZQpGFyv8yzu2FDIFjoonr0D0vDVDqqTwWQc1Lz5FuK
         cITP3U1HddZUk+MO5UnPnvB1cG1NOtaBddFlSUgJteGnTeLeBgP9Ozi1zJtTAP2DZO1L
         LWjg==
X-Forwarded-Encrypted: i=1; AKwUvBwFhwa12Y2MVNCwvv2fbf3TFNsEbvi5JUIdd7W6Hd8YP1EFj1eXIu0FSFLgYPnyacv6Un4YywGkEriM3g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIs3541ByPTC8EM6SOVTSO4+gfrloxmprjXd4GJwotFtp/auUX1
	qERsObCoNEAfAQbHL930M5PSBcKA/rJp8I6z/cN3eVPbsWUE+9EP9tLd
X-Gm-Gg: AYBFou0kHV6kVtaqTciJM8aY8T0e07q3kgY3Udl4NEJH3JXSoupMofMS+I8OIO6LZHG
	phrJdTv2C/2GurgYxhPeJ58YPLDrniSc0N6Zny/uEys0p9DIp++8c+4aekzeRdD5y6KYBtVGfa0
	++oDDnf1lNRVMHpwQXYvVJns+3b2nAc2CC6yL9OFpcFfUH4s4XT277ijapr/eAjCC2PIL26e/uH
	JgufTuMadCBdgKAN8VaJeoaT29zSw4WVQCwxRDxOnLJKYq6V7G2LyxH7DFkxUBHubmu6rgtBx4v
	TA2YJ2C4HWQuFXatG71R1TcJlarVJgEjlJ/8IAAhvgShRxfEAuj3hiMzzZgCVP8R2Yc6kXmNjNG
	WEksKrQG0EsbJXy7o4ABzoVpvcn3zowNUJlW9WXtpSmY4mi0w/G54jjRrVKMZM7DZrlvrV9C4lP
	rvqi6BGOeU55+Qa0vUasdwB5NvViUMlApWp8hXliXAJxqAUaQCCstRGg5/+lXL6/qtm8tQucwYC
	TI4lyuvislWMvCQPiJXnGfYzfPnMo+XOifjnqf4t66tMRtVL+K6MN+iA+XIt6Rrj0L3DE/G0pnW
	4ZuMVTINTZBURERfwJhsBjWfchfDxvLbx5h6mVmx/6n6FDZYG/nKe/tMrQSrZwKkMMiiTYixZLE
	TeaDn09+UtAkXKMedvDmE34C9/yM5yz7Nx3oaYG4oJ6lgGrO088inC/rJg4STSqlGlKXULtGy05
	oBkIeExQpEZ1GJybF+R5/ItaQ0X3qjV7JbR9fcq0q/GGMpNNVyMs8=
X-Received: by 2002:a05:6820:a65c:10b0:6e2:3d8b:a01c with SMTP id 006d021491bc7-714f24006f7mr112598eaf.19.1793299660372;
        Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:28 -0600
Subject: [PATCH v5 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
offset 0xf0. The field holds a byte count, not a logarithmic encoding.

Read this field in the sunxi setup callback when platform data does not
provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
its 256-byte configuration without accessing FCC. The probe has already
enabled the clocks and deasserted reset before invoking the callback.
Leave the FIFO clock-control bits untouched.

Validate the depth before generating the RX trigger table or setting the
transmit load. The quarter-full threshold must be positive and the
FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
trigger API. Report an invalid depth and fail probe instead of generating
zero or truncated thresholds.

Select this setup for the A523 compatible. Derive the transmit load and
RX threshold table from the discovered depth using the common sunxi
helpers. This handles the different FIFO sizes with one compatible and
one receive-trigger mapping.

Like H616, this integration has Allwinner-specific debug-divisor and
RS485 registers overlapping the generic DesignWare feature probes. Use
the common sunxi PIO setup, BUSY-safe integer divisor programming and
software RS485 handling. Keep the APB clock gate enabled during termios
updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 3bc6735fc253..2ab91f479fc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -45,6 +46,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -64,6 +69,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed sunxi FIFO depth; zero selects discovery through FCC */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -729,6 +735,16 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
 	p->fifosize = data->pdata->fifo_size;
+	if (!p->fifosize) {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
+	/* The RX trigger table must contain positive, byte-sized thresholds */
+	if (p->fifosize < 4 || p->fifosize - 2 > U8_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	dw8250_sunxi_setup_rxtrig(p);
@@ -972,6 +988,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
 	.setup = dw8250_sunxi_setup,
 };
 
+static const struct dw8250_platform_data dw8250_a523_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -1024,6 +1046,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

