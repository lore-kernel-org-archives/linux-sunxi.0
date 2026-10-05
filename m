Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73F4DC551
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221168; cv=none; b=of/4vn2gcJ7rW8pRp+uepijltQA6DAfiOVJ7TOHjgnk2HVnYgwMfCJNm25laPvXexdRDJXvJL3MzSWP8GmJ19IYSKvl1VU7JsQbVJVdBQiJsQYVk2eW+6blcerdZLCYx2wATj7nx51BOdoH6s5iaJv4OfD1QSZ73eJmnASRU85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221168; c=relaxed/simple;
	bh=0tlu23Wb+fnBd//rKVf7iA12CVAByRfBiHkTg/vcoM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+E7FNUZlURiYz1FJ26/BrhYwpOiscMjLI9Ot4SeHEzfPDnBojCONPW4DKaenj5LFxsqn8XAKcNHTikVdobG87tblS6vE5tg3cHl2gVBHzFjEp58XLfVLpv17634LTW7LREeUNV3Y3OJmEEZyWIPEkI85Kd+j1Jb4mJEEZ1sNRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFMvrQ2N; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFMvrQ2N"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6768a9fc0e8so1774212d50.2
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221165; x=1791825965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSg+xg0GISK2TLhhUpUId1buzLRTI6rIxrwQhAMstEk=;
        b=EFMvrQ2NhuphdQUlZehwsuQ3Oj0n8IsWCdr11c9omOoBR3/S9OFbN0wHB0J31bv/JK
         6OCnGKoyb/wEDYyzdtkRE3m1SQQkub7DOnGaTCvA1dMXX3WXLa50Tn7b/8GVvrZ005k2
         hW5I1FN0uWswL0uPrRDw5TZtzhRDxSgaWxk13ITaGb/op2AzK3KeVLUa9FJQ421sVeNR
         vs5vel+9AaFx2DHVHMm3+jtB6CuIwRN8TTUlEckgTCKIxDNT7L9Vob5DpI2zktPSbFoz
         /uYivYosuJBgeNtHQjGhsIv5L+1PtYi+RnL41RRizRKYYHSY1OGW56KgWdLBHduCvV5f
         Fmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221165; x=1791825965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSg+xg0GISK2TLhhUpUId1buzLRTI6rIxrwQhAMstEk=;
        b=mD8ei9sLp0GQVgBHzUaJwFCBxPM3AGYXrcpFKt+ica6jic2TempLcMIVecZA8EJIkj
         0y2KlOko6/GioelLB/f8vOq3wJgYMxFl9vY4LjhKXi1T5jsC9OXtvARbG5ZPUclfBJmJ
         x6+2N3nWnXT8omz+PPgTQ1IIS14h4BrIYhvVcBl487l8uwPigGtpuhSZ9bTJz5Fv3Vm3
         I4u14X0bYvhK0Hs4h1pHjBMQYO5ecIyvO6Erx0EdD2P0y5ykonJ5QxUj6JSVeyyPOwnj
         rtiOz4Uw8glRXn+LvSRHVfeCACQmoFChwpYUZrtpoxBh/hyTeQRfvkM50VOI98k3lBxo
         yltw==
X-Forwarded-Encrypted: i=1; AKwUvBxTknyXGmPBCyMVtI3Bar2fw5jpPq3lvmDgjtnL9ZBUUn6afYTHquOpwvLWhw5fLR2ik1jJRiE1EatGnQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJBXbhYa0/866Cjp0vlkFUc4nicDiU355Gh/qrrs4vZzPfc7XrX
	snOWr7pVPFSySD+JqTMqmTuf/YOKFE5xwntwsM1EzvK7+RoHoeAybwqT
X-Gm-Gg: AYBFou00R4s/WZ1UlTFn/cqU8/ld67NgGr9Ek89vuTDnVFwkjq/gmvLYMm5d5azVCiK
	1AJ+OgSicxe3OJsz6E/YlYtPZ5hkLC1ha+TW31REVqHfoLKWfzjIH4ExdyoU5HPSqty3iH483jg
	2LoieCOE/QbPxPN0qHxl1Zyuf7FR5AEE9leUYnsGhco2SPNNGUdU5UpAzVS5iY8qH8VTHi4Nl54
	fAd5YltGwAz0tGRO9GTFeQcEY4WY5xdOlhcv3k3UzP5Sg2MwiTnvaBynigZAyrspyXzzyzWIfA1
	lSJEjZuJDX42zl/belCZxEF1SqJ1MG+JGcp3wdZr56ijt3IgYLQBqiHTknjWIxAf0v3zqbox0c4
	uVLoQfw6oca2EJoRT6WuTBhtMw7r0L/zEn2x4zZGCDX7Yu7FOZsO0mu8LEd6qBUjpYQJ3a71OKl
	MdXzb81ia6XuLwQJvHjIViY46r8CaYb8ytJTOamHtiCOctLa6DZKSymVzDyviyVTGH0IWPygBCx
	LimsmdIP3ikIA15hSKc5bMpCFNlRuII1Yf4+oDYCOXCwRfx11jKwu0ZDuvGeiJC+wyTAb/uBZ6T
	xKDYbg==
X-Received: by 2002:a05:690e:4006:b0:676:97e6:d7a9 with SMTP id 956f58d0204a3-677bd338f18mr3368433d50.40.1791221165074;
        Mon, 05 Oct 2026 10:26:05 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:26:04 -0700 (PDT)
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
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Mon,  5 Oct 2026 14:25:36 -0300
Message-ID: <20261005172538.398522-2-vinicius.eduardo.pedrosa@gmail.com>
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

dw8250_probe() installs dw8250_set_divisor(), which brackets the
DLAB/DLL/DLH sequence with dw8250_idle_enter()/dw8250_idle_exit() so that
a BUSY UART cannot drop the divisor LCR write. dw8250_setup_port() runs
afterwards and replaces that hook with the dwlib one whenever it detects
a DLF register. The dwlib hook programs the divisor through
serial8250_do_set_divisor() without entering idle.

When termios changes while the UART is transmitting, the LCR|DLAB write
is ignored and dw8250_check_lcr() retries it between
dw8250_idle_enter() and dw8250_idle_exit(). dw8250_idle_exit() restores
IER while DLAB is still set, so the value lands in DLH. The real IER
keeps the zero written by dw8250_idle_enter(), and the port gets no
further TX or RX interrupts while up->ier says they're enabled.

Program DLF from dw8250_set_divisor() inside the idle section and keep
that hook after dw8250_setup_port().

Observed on an Allwinner A733 (Radxa Cubie A7Z): the first interactive
tcsetattr() during console output left hardware IER at 0 and up->ier at
0x07. The shell never printed its prompt or read input. With this change
alone the same boot reached the prompt and echoed input, and hardware
IER matched up->ier afterwards.

Fixes: a7b9ce39fbe4 ("serial: 8250_dw: Ensure BUSY is deasserted")
Cc: stable@vger.kernel.org
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
The A733 has no real DLF. Offset 0xc0 is an RS485 control register that
dw8250_setup_port() mistakes for one (patch 3), which is how this path
was reached. The new DLF write hasn't been tested on a UART with a real
DLF register.

 drivers/tty/serial/8250/8250_dw.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 0ab558230370..ba414306c98a 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -189,6 +189,7 @@ static int dw8250_idle_enter(struct uart_port *p)
 static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 			       unsigned int quot, unsigned int quot_frac)
 {
+	struct dw8250_data *d = to_dw8250_data(p->private_data);
 	struct uart_8250_port *up = up_to_u8250p(p);
 	int ret;
 
@@ -196,6 +197,9 @@ static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 	if (ret < 0)
 		return;
 
+	if (d->data.dlf_size)
+		dw8250_writel_ext(p, DW_UART_DLF, quot_frac);
+
 	serial_port_out(p, UART_LCR, up->lcr | UART_LCR_DLAB);
 	if (!(serial_port_in(p, UART_LCR) & UART_LCR_DLAB))
 		goto idle_failed;
@@ -650,7 +654,6 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	p->set_ldisc	= dw8250_set_ldisc;
 	p->set_termios	= dw8250_set_termios;
-	p->set_divisor	= dw8250_set_divisor;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -767,6 +770,13 @@ static int dw8250_probe(struct platform_device *pdev)
 	if (!data->skip_autocfg)
 		dw8250_setup_port(p);
 
+	/*
+	 * dw8250_setup_port() installs the library divisor hook when it finds
+	 * DLF. Keep the BUSY-safe hook instead: it also programs DLF, and it
+	 * must own DLAB so that a BUSY UART never drops the divisor LCR write.
+	 */
+	p->set_divisor = dw8250_set_divisor;
+
 	/* If we have a valid fifosize, try hooking up DMA */
 	if (p->fifosize) {
 		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-- 
2.43.0

