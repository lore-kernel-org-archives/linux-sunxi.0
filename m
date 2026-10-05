Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356694E2378
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 17:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221185; cv=none; b=ljaLUDD3M1Qx0ZpJTkBekgq3Tp5MmuyAM/X9hNwvCORAxWG+rtGkCtfGov9nsQ3gc41fcPJRb+y3qYyjlI6XzOYVEu3vm11RGMzUYwuRCNe694KQ7uubR4/QzjBO+2ndUmYou4dY9bG8H3/fS28DZ0pfpOtpS/ugcAxz/2HRTqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221185; c=relaxed/simple;
	bh=r22mQlPIjskWq/DiG01MMyS5WtM+Mp3QEwj3JMNSpVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6dC/sCVWgtucHl7+UrjEsQ2gOpBsd+OWgBd6CP1VsC6/ZojOCAbQ2f319QBuIW6JjyAUHO9itP9t1dgK1/px2m7owRg+xVNN/rqsnk3oFHqGWchtTt0ptkgrGIoasFrikRAOdJ6HOB+uSqBat00bd+446y1ZAoQW6QbJXRFk+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmdl738V; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmdl738V"
Received: by mail-yx2-f39.google.com with SMTP id 956f58d0204a3-6755aad8a98so1111451d50.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221182; x=1791825982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZmo3FkThSpnGOZcS4sClOcoI4Yj0LiqIFWf1roEIeg=;
        b=Tmdl738VeMjYpVUzRU/jN2Ej7NfyKbB355GF+xeL8xNDStnAHxhYSBMshMQcHIKQTV
         eHXvBMvsvB6+JxybhmJkFDvpYyKKI4TL9ssf7574UQVF3V+FPAphEQWnXS37T5EQ01U+
         FaF/sENuMMN2r4vu2jZkSbWOGD75t1AWVWa6eV+eUXUkQ+b1bHc6VmGPZq2nktWA9TO6
         3dioWu/A+HW8WJsogHpmTiVxN1gsENYF+hzvCK8RBtPcIY9ZsKq4gMYZdd9WT3TXJaCU
         OoMnVTQa32q6aYodmDgYLUNeRPD+l9Zk8+RrSWL7vb0zoS7zktASe/EGmd+AMlFG4dPJ
         kDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221182; x=1791825982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZmo3FkThSpnGOZcS4sClOcoI4Yj0LiqIFWf1roEIeg=;
        b=DX/gJ22dKT17keCMqsk5mrsz/p1xkuqJsj+4Ynj47mOr1OI5pRr3KFQHN07BXMNvNh
         PMv1rSeW3vjp6yaUgMd4JaNUinvknj1sMJ24pYc80SJWd2Q5clewAMVW0XsjWbMjZxk+
         LuuU+4qNiTxeIY30GXjL8m2BFKxmg0S0siM/g4TaNojYrQLvOLY2hlyW3lOpPqPsVtEX
         4KI1edquFBtPuHFypCgSNtlp3kO+yLZZMVhLxQhHTaTm/7goRNzY+toJagoeyByjZDyX
         8iR7oDCQG0ckq59nl8wQN70/ePS5D+pK5DxCPeE1lxzM/kCmDO+l2TdTGOQ9YwQN9C6n
         Pgpg==
X-Forwarded-Encrypted: i=1; AKwUvBx857T5kdTdRldkBGRKeCpj7ur877ZpMaD8/NbOjcTgqjOkmm7u4f6vnUqf8/JstHBL2tJWBCZ5KXWxsg==@lists.linux.dev
X-Gm-Message-State: AFuF++nbfgkSkeGJbxHPvLEYum0rE5WJJvos2mr33GWoGKZMLKBXuiUZ
	YWwIR9fiI9Fu/msb8DZRMBgS5jTe/yOO4sADGGUPsacYJv80O/FvseoK
X-Gm-Gg: AYBFou3AnJY9t6zqVfJxNesy8gxdw7DAXlbk3MLax6gYYFdwxhQyPM78FeTZeYFmdgl
	GEse2/Cxm71sF5GF6SE5yW2OHLMQVKfKYUiSjQXH0DxY3PG3Bjk3cTpIpxCyYlJKZrNaldSS72P
	iUmj6n58VCoI4ifqkFhf/CBgtMjOjt8JetGkuw3u1CT2ANhAoOD3Gwoyd2XtNK/GIkTZdusHiFO
	qzepy3tVPKmVKbakP+zUinnp8qaQxZ2bAphH0XVzpNDXtipC2csMfH1j+IrITi99OuHfUEVThUx
	/07/DmtkhzFuVDh7KpHVEMnQ5bnG8+TcOaImcQyab1HmPtCVUL0rlL/ZYEXBUEnN0wcmmCy4lkT
	+i9v3ruBd4lQCypRwEZ53lBKguFSxODwCvsJf6g2tjXuDN1slQoZngXkZ23vhZDHCQ8o+fH3lO2
	BuhjrqqjThUWStR1BIjvZAxSCgwTWbXi35c16I7CVTI9Z2Asv8EZKfr8Br88EZIPZwDjpjnnt6Q
	kOhtiAhG4jeNGeq4z6NGRzdKC5fi1r0p/gVpS2Es+4CK/wXTP43HpPGdWI4yS+H646Kzid7RzHl
	O3NL/Q==
X-Received: by 2002:a05:690e:169d:b0:677:d9d8:d937 with SMTP id 956f58d0204a3-677d9d8e732mr1507439d50.32.1791221181825;
        Mon, 05 Oct 2026 10:26:21 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:26:21 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 3/3] serial: 8250_dw: Add Allwinner A733 UART
Date: Mon,  5 Oct 2026 14:25:38 -0300
Message-ID: <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 UART is clocked from its bus clock gate, which can't change
rate. dw8250_set_termios() still gates it around a no-op clk_set_rate()
on every termios change. That stalls the character being shifted out
and corrupts it on the wire. Use the existing SKIP_SET_RATE quirk, as
other SoCs with a fixed UART clock do.

Offset 0xc0 is the RS485 control register on this SoC (A733 User
Manual, UART_485_CTL), not DLF. dw8250_setup_port() writes all ones
there, reads back a nonzero 9-bit value and takes it for a 9-bit DLF.
Every later divisor change then writes the fractional divisor into the
RS485 control register. Add a NO_DLF quirk so dwlib skips that probe.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 13 +++++++++++++
 drivers/tty/serial/8250/8250_dwlib.c | 22 ++++++++++++----------
 drivers/tty/serial/8250/8250_dwlib.h |  1 +
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index ba414306c98a..ea33aa644cda 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -52,6 +52,7 @@
 #define DW_UART_QUIRK_CPR_VALUE		BIT(5)
 #define DW_UART_QUIRK_IER_KICK		BIT(6)
 #define DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ	BIT(7)
+#define DW_UART_QUIRK_NO_DLF		BIT(8)
 
 /*
  * Number of consecutive IIR_NO_INT interrupts required to trigger interrupt
@@ -606,6 +607,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_out38x;
 	if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
 		p->set_termios = dw8250_do_set_termios;
+	if (quirks & DW_UART_QUIRK_NO_DLF)
+		data->data.no_dlf = true;
 	if (quirks & DW_UART_QUIRK_IS_DMA_FC) {
 		data->data.dma.txconf.device_fc = 1;
 		data->data.dma.rxconf.device_fc = 1;
@@ -892,6 +895,15 @@ static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
 };
 
+/*
+ * The baud clock is the bus clock gate, whose rate cannot change, and offset
+ * 0xc0 is the RS485 control register rather than DLF.
+ */
+static const struct dw8250_platform_data dw8250_sun60i_a733_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE | DW_UART_QUIRK_NO_DLF,
+};
+
 static const struct dw8250_platform_data dw8250_intc10ee = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_IER_KICK,
@@ -913,6 +925,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun60i-a733-uart", .data = &dw8250_sun60i_a733_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 9bb02a4ab11f..9c6f3d926ad5 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -209,16 +209,18 @@ void dw8250_setup_port(struct uart_port *p)
 	}
 	up->capabilities |= UART_CAP_NOTEMT;
 
-	/* Preserve value written by firmware or bootloader  */
-	old_dlf = dw8250_readl_ext(p, DW_UART_DLF);
-	dw8250_writel_ext(p, DW_UART_DLF, ~0U);
-	reg = dw8250_readl_ext(p, DW_UART_DLF);
-	dw8250_writel_ext(p, DW_UART_DLF, old_dlf);
-
-	if (reg) {
-		pd->dlf_size = fls(reg);
-		p->get_divisor = dw8250_get_divisor;
-		p->set_divisor = dw8250_set_divisor;
+	if (!pd->no_dlf) {
+		/* Preserve value written by firmware or bootloader  */
+		old_dlf = dw8250_readl_ext(p, DW_UART_DLF);
+		dw8250_writel_ext(p, DW_UART_DLF, ~0U);
+		reg = dw8250_readl_ext(p, DW_UART_DLF);
+		dw8250_writel_ext(p, DW_UART_DLF, old_dlf);
+
+		if (reg) {
+			pd->dlf_size = fls(reg);
+			p->get_divisor = dw8250_get_divisor;
+			p->set_divisor = dw8250_set_divisor;
+		}
 	}
 
 	reg = dw8250_readl_ext(p, DW_UART_UCV);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index ee7a07fac0f6..ca0dfd6d056e 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -88,6 +88,7 @@ struct dw8250_port_data {
 	/* Hardware configuration */
 	u32			cpr_value;
 	u8			dlf_size;
+	bool			no_dlf;		/* Offset 0xc0 is not DLF */
 
 	/* RS485 variables */
 	bool			hw_rs485_support;
-- 
2.43.0

