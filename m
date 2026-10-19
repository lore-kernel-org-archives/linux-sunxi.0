Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440414;
	b=vTNiNJNYLKnL8oDmeZBQJRYKFRgl+uqU2zjY1T5oLIngf3AANXtepVqR0//GOYDPzVha
	 8m6fatpCQRX9U3kGVuCvW+9SrhFZ7AYNgxkvtUdKeSQmqM5lhbbiOTLPMVLZEBp4GRI5T
	 1hiPe5qnWbXIpM8cW9cDV4T/cu104LgFcjilTIm47jVEYFExFe/Wfp8H9Jje+ktdN29bF
	 d2vOGP9Mm3Z8laLTrMDpPoqmzM4A8dqdfx4XHz/neYgRfNGtUvOwDpSpZtHEMAjSDgTHS
	 mD2XSajK8kwyUr9wkdY+qkCQIYRy+utJ43VjYOzUgNWqv07Hc6w05QiSjGmDzvK9MfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bFBNSvs3JDos8tPW/MP3a/GFNwGRHv00G3UEulH7lLI=;
	b=3O6F+Hr2Jb/Wj5jRsWCjtkDZJ4ZvMnQqV6/43Wxa9mZjJetW0qbOpifQG9xMtHQE8HOU
	 l7yHL0il9Zap0h2dGjCdJcMDdYdMULG7M+EqjtCmLN3kk7GHsZYNf2msuT/U0SoYmbpPp
	 e/d2ZXDMYiEoaYwRgK7FpG0W1t+fUEwntgyFnLzxjjIxBVidBEOciZIGmD/c+oCUrGI5/
	 gVMrcHupMjRd8l9DrkmPDf/mdXbHrhQvIvRz3C6IRXTyKn8iuP8nhAOYcvcvMmeOfXYZD
	 q24qlfjL5zylt5f+/kveGTQK7dndimoiNiGGx7DVN5W7/N/keKEUL/l5+/SH8soYZLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WCrL+TWm;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE57B606A31E
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 20:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE57B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WCrL+TWm
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eac48af23fso581792e0c.2
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 13:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440413; x=1793045213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFBNSvs3JDos8tPW/MP3a/GFNwGRHv00G3UEulH7lLI=;
        b=WCrL+TWmgftN//o7VLBx7xAJgrFL6LfABv+PjGf043723Sl6Ux4lFT2su1WdTXmoDG
         0sKRSkUUCxN18qDHIBFgPP7OJTnzxbRiN6hy+j5V2s4kQUNVU2z1rKObKjNJk65XPmzB
         DiHJCTbtOixetcQAjBPLqCC43D5e0NJYDr46EhANhbVHj6MYTWON5Wj8YhfJLYZry6Lh
         71QAh/Bsqzcph763M9G5Tww1gF8otwIn6j6ZdPFSiXFEeygoxXJYymt7S5O7mH9QAaN7
         6j+aosh9+WjddoKo+Ii1E+s94OetgMlrv+n6zJSjdrSqZcskxTME+icx7TXKIsMCVtAL
         y+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440413; x=1793045213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFBNSvs3JDos8tPW/MP3a/GFNwGRHv00G3UEulH7lLI=;
        b=ufRoT5vdhmb5UfPo8EgBt7vv0PKxjfIGCXqnJYx2gj4cLTZHSDV2ZC9zD8OBaqZIFo
         D8JFuoViOMiU2Hy/wfcJJ2EM9TtmQuqdKGRAL0tlSKsfy+aD5uICdosnrPLXi/gGJvYB
         QSLoP/z/3acMVV2JceE0BPX3r6FNsLTY2TOOyWiCA0V8AL9O4h2sHOz5vlMPCIPElkL7
         ePGxoGGf6LxeTwLwvTS844n38Tqu6I8HQhLUae21irZEpOYK/TdamhHSvs408LemlOLh
         BMvUe0WnGBlb9NQ4U/WDjj11PodR/OKtHhhpvWO+/3O5I658ACuxP018v2DKFdTBAn8y
         noaw==
X-Forwarded-Encrypted: i=1; AKwUvBz9QrHJr7wRR49FVkx4HbGa7iEVVow1JjXYiCauD14FgykXRJza9GTR3CnoEqjqqVzQ0jjqHI2DvT7reA==@lists.linux.dev
X-Gm-Message-State: AFq9FYISVioH5qzjBSXVVnTtpTeibmKAAywRuYpUwjxCFyGz+1ZshiTc
	I7S245C4FR62xfsCyHOnvRQ+E2/VDoUnzNdxpocrn64H4QWaT6B1t3BC
X-Gm-Gg: AYBFou3CP4XRw9+HtNChLqm6P7RL+VXL9giwNlGtDE5MpLZB7FuU/4tGzejP13sBwhh
	G+DORdcUtNiZpVn2fYdvSztG4IGg0W5c3vrLG2FoCYxYD1g8H4w3ylvq5dlzTZBeuvtqnh9wS7j
	yUALVKEvwtWuqqDhPxKw4HxyrIREeGmqsKVDSulzKR689dm6PJ6yvfEgd9xHXw5mJAls56Udzfe
	jYczpl3Yg9FBRNxawkyam8nh1wcEsyUpP/X2DWBpghCtWSRVdmmQn7dRF5JQW9q95ZmW1KVGOP6
	vq+YfwJ6Ldzs5uza5WuK0gN/QOwt+d8GlYCPc5gTr2vyrE12SPVRdQlvyHRFuQwtYbV6hEjUc4e
	0MCDlDxEWzq+D4ZCuGjIJhJ3CC2usf/zu0iLUS92cizfoneC0hq0PXOStEBFK9Y/ZxezpvhFfc7
	+RzU81dAfLX7uT3PtQ2VdEFxW1y9BJoTXJlaNcDxPTge5PI3BvbRcQC8C8klPiyLpcMvJsOw5xX
	ND88Fja5W4MGCEMsd3R3b6O988tALYxYmDcNLqCbCGD5xNJwlGPj+5jTWylfZAMTQGvuO9w1D6Y
	7ydOsS0=
X-Received: by 2002:a05:6122:1c02:b0:5de:ee96:75b with SMTP id 71dfb90a1353d-5eaaa68b961mr2904319e0c.12.1792440412948;
        Mon, 19 Oct 2026 13:06:52 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:06:52 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Mon, 19 Oct 2026 17:06:10 -0300
Message-ID: <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

dw8250_probe() installs dw8250_set_divisor(), which brackets the
DLAB/DLL/DLH sequence with dw8250_idle_enter() and dw8250_idle_exit()
so a BUSY UART cannot drop the divisor LCR write.

dw8250_setup_port() runs afterwards and replaces that hook with the
dwlib divisor hook whenever it detects DLF. The dwlib hook programs the
divisor through serial8250_do_set_divisor() without entering idle,
leaving the LCR|DLAB write exposed to BUSY.

When termios changes while the UART is transmitting, that LCR|DLAB
write can be ignored and dw8250_check_lcr() retries it between
dw8250_idle_enter() and dw8250_idle_exit(). dw8250_idle_exit() then
restores IER while DLAB is still set, so the value lands in DLH. The
real IER stays at the zero written by dw8250_idle_enter(), and the port
gets no further TX or RX interrupts while up->ier says they're enabled.

Do not replace a divisor hook the driver has already installed. Program
DLF from the BUSY-safe hook, inside the idle section, through a dwlib
helper that checks dlf_size.

Observed on an Allwinner A733 (Radxa Cubie A7Z), where
dw8250_setup_port() mistakes the RS485 control register for DLF (see the
next patch): the first interactive tcsetattr() during console output
left hardware IER at 0 and up->ier at 0x07. The shell never printed its
prompt or read input. With this change alone the same boot reached the
prompt and echoed input, and hardware IER matched up->ier afterwards.

Fixes: a7b9ce39fbe4 ("serial: 8250_dw: Ensure BUSY is deasserted")
Cc: stable@vger.kernel.org
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c    |  2 ++
 drivers/tty/serial/8250/8250_dwlib.c | 16 ++++++++++++++--
 drivers/tty/serial/8250/8250_dwlib.h |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..4c86aaf9c121 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -197,6 +197,8 @@ static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 	if (ret < 0)
 		return;
 
+	__dw8250_set_divisor(p, quot_frac);
+
 	serial_port_out(p, UART_LCR, up->lcr | UART_LCR_DLAB);
 	if (!(serial_port_in(p, UART_LCR) & UART_LCR_DLAB))
 		goto idle_failed;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 9bb02a4ab11f..325793f20256 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -36,10 +36,20 @@ static unsigned int dw8250_get_divisor(struct uart_port *p, unsigned int baud,
 	return quot;
 }
 
+/* Program the fractional part of the divisor, if the UART has one */
+void __dw8250_set_divisor(struct uart_port *p, unsigned int quot_frac)
+{
+	struct dw8250_port_data *d = p->private_data;
+
+	if (d->dlf_size)
+		dw8250_writel_ext(p, DW_UART_DLF, quot_frac);
+}
+EXPORT_SYMBOL_GPL(__dw8250_set_divisor);
+
 static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 			       unsigned int quot, unsigned int quot_frac)
 {
-	dw8250_writel_ext(p, DW_UART_DLF, quot_frac);
+	__dw8250_set_divisor(p, quot_frac);
 	serial8250_do_set_divisor(p, baud, quot);
 }
 
@@ -218,7 +228,9 @@ void dw8250_setup_port(struct uart_port *p)
 	if (reg) {
 		pd->dlf_size = fls(reg);
 		p->get_divisor = dw8250_get_divisor;
-		p->set_divisor = dw8250_set_divisor;
+		/* Keep a hook the driver has already installed */
+		if (!p->set_divisor)
+			p->set_divisor = dw8250_set_divisor;
 	}
 
 	reg = dw8250_readl_ext(p, DW_UART_UCV);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 39fcb1b323ad..4bb0ccb3e8ef 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -99,6 +99,7 @@ struct dw8250_port_data {
 
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
 void dw8250_setup_port(struct uart_port *p);
+void __dw8250_set_divisor(struct uart_port *p, unsigned int quot_frac);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
 {
