Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790375;
	b=Au0wX+hzFVC3ayW4AEw3Tk0WrDThxRfYgihwbfEVPWeglCHL5WIkyN8RTeYe0Trdg2To
	 hMQA+LlwQT5Kej6ph74tyOi6RcZEHxiSBuoKs/VJKrCvI6cZHAE1ylmwkQJwDxWKu7Aa7
	 hlsed1FrURsVget8F7rMfnInQ2vhyD9+vWCDVegOQDkUUr45ZpZUxGwChluFfH+Rf7njh
	 ScoQxAyV3dzs0djYdowcmBCAAbG32VfVQ9qTiUNfxgFKS6bG9fl5TG+BcCGlBfeu67Dcg
	 svVxBOan4CS8uAsg+9UVPQZtAG5FlF7Iv4CokoK+3qgVX0mXUL2qi2ZIE3Osn6e0+ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
	b=nEjYxd4KFZusFL4/TDFFbK1dGDU+grxeQuDhUeG1DibyiSpPvImun1Ggdou77XzOozE5
	 oodJBYopzYidT4nuLhH/fVuJHy6ijWpyItEcVbSO1X6nzoGGBX9pLk/FBJJLVtk9Dgem5
	 NMDHl2P6TSA+BjuLQQcnDF493D+Yc/6L+aBavNxTFnJdyxHyo1jaIauyiTrkSlh25Ufus
	 f8LO6eEcw8jh+wx1iUl6JkU/EFyJpJPgk5e/EXpWWK1ekS1QXTWIxq+Vj8+B3PaNr7A/7
	 Jv0iakj0Szbq6sYpUPJHa2tYr7A7hGe0U1y+ay+UmAOOi1sFe3GnMdqceb/kW1n8VaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b4c0ylmR;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10F1606A336
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 21:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10F1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b4c0ylmR
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-823e4047037so963395a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790374; x=1793395174; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
        b=b4c0ylmRW3ar0nB5I2f5qsm88kOQorakSSVYSR67sbuQkFZLArrtb7/h1dSHZjfobV
         CxLPutJEi6oMp7FTouuSaYyYNkZjZJZUF/kND1SKjekOmE/bmk01iiXCiKpdHiZz8PhO
         vrrdI6BikoJC/fmpfyOgVtVnczbx4c1kJlwsytKPkD2v/j7F9eOS/oQ4KbTQSqdmvIfs
         QnmWXujiG0fxtZmwrkvMQniv4hi4N0kokIcljpM0ye9JFcdV+o6wF8ZgdE04AnqMp/VG
         zNm/zhoHif5DwHTgUlMtvEg3Je0QhFK2+E7UzgbjuEznFnh7pq6RrYgHG5ivnkMDvdyO
         ntNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790374; x=1793395174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
        b=GB4EmMGV/cKEqobjuQI+UQOfY3hNCGtmhpHBUlJVyDt7wcBE06QG7G85HD8Dlh7ORW
         +C+YOhDPQ1hw94ZV/NV3bk5alEVFg1hFXUZV/oXVFlUeGxlnZhW2y0Ox7cwpNllnu+S+
         FmjY+bLpNcVYY2FlwH7fR3rGGVH6IAbYiP+a3DkfFfY5D9sorGJWvqZyc3qpDd1T2XJk
         Ot41Fux0TloYSsioBcV+nbMDxHiEKAlJeAB8JZ9OpbkfSNJsxow3Oyl2aq2+iqTf/+yn
         BluKRGKT0Fy3BDH1RSLgSBmrJvFfkLozNzY5po7vnVhvOJec9aOl0Ms+sXqJ6SEm4oNj
         7Qtw==
X-Forwarded-Encrypted: i=1; AKwUvBzYpxAhKZgS4YFFoX2pP2rqJmWWJ91ZPOuAS1Y3ADKRLi7/FhKZ0mDnZYIU413y8y27xk5ZfeQFJ0/5TQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJqgtCsATsf7lTCxq21H09ajFu2KipmpZaSyyCildRsJgapFeL8
	6HjMBzI/2CV3XD4tTONRh4zWLjVnXA9Biu8XpRb+I7JkwtHtAjtlGI62
X-Gm-Gg: AYBFou3HWNMPiLJiwEDUCxlAbj+DxXJ+xProWHPuHGnLeIowGUzv/o82LH1wmNP1RYN
	flbbwS1OB0d1WEESGJIaBOU/QuR/BdKxcUvHMwPch/m5rkSJyiAv1ZnnbpkdLo/9Rz/M9g2lgTu
	mN7IC7RD/KmsQxcmPZgaoErn0KcDYInHDGGdNo0OkwktrbSttUR9jJEhzMFg3pkP9Cz/EQNU0j1
	UYifBKyZHjrcFAvvWygpsOlv8+Oc/5QZQnASJghrT4YoxShXAYfr5fdtfs/rpKHini/jBwTUgPs
	Z+SJPMJWIOEZNeT0b7M/rwP7CzJhdTvtYQ0uAn6LYha4NREc7nMKIt25LCIy+XA+17CcNC/T2dh
	REt9Ap9qXNsKv3Kwp7yxgAfussv+23ID1zDXZeS0TmfQfBrn5+qyhd0JKOSffnzuvy1CTQlzy/V
	2K0Fg4/JsGCwdrqPJHpJHSFIdU9Vkeuw63TOSpF5O/r3GU+c3Uz8939yEHC2REPVjCEofdpUjoJ
	xRyBL8+zgnQkdN1mS8ZhkiaXVd2iPjMUS44KEchukmlRCkMBfPMblufe51rh6kl43qd9jRxjxW6
	uhxjgiBeLxNe7Oaqll41YvsYYN73FPG+sN/RyeZWIL07yQHaLwQ/gJCpwV5uIu0ajaZYBGItdjo
	CTj3oJTc7XPZ3o76lxWo9ZlFYAjJvNhhtj+A8bPCizqFh8X7aMQISkfMO+lpf+U2x7NTbOZbvLj
	vpPA==
X-Received: by 2002:a05:6830:927:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-850fb0769c4mr573277a34.4.1792790373894;
        Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:28 -0600
Subject: [PATCH v2 2/3] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-2-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.
DMA attachment also depends on a FIFO size being available during probe,
so these ports do not reach the existing 8250 DMA path.

Keep PORT_16550A and supply the FIFO size, transmit load and capabilities
when matching the H616 platform data. Provide receive-trigger callbacks
for the documented thresholds of 1, 64, 128 and 254 bytes. The normal
16550A half-full trigger selects 128 bytes on this integration. Serialize
trigger changes with termios and hold a runtime PM reference while
programming FCR, preserving the FIFO contents.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Skip optional-register probing for this fixed configuration. H616 has
debug-divisor and RS485 control registers at the offsets used to detect
DesignWare hardware RS485 and fractional-divisor support. Probing these
offsets writes unrelated registers and can select incompatible callbacks.
Keep the BUSY-safe integer divisor hook and software RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Attach DMA from the fixed configuration before registering the port.
Configure single-byte RX and TX bursts because the peripheral request can
correspond to just one character. The existing startup path requests the
firmware-described channels and falls back to PIO when they are unavailable
or the port is a kernel console.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 87 +++++++++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..b9f5cb61f2b6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -66,6 +67,11 @@ struct dw8250_platform_data {
 	unsigned int quirks;
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 struct dw8250_data {
 	struct dw8250_port_data	data;
 	const struct dw8250_platform_data *pdata;
@@ -630,6 +636,66 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static const u8 dw8250_h616_rxtrig_bytes[] = { 1, 64, 128, 254 };
+
+static int dw8250_h616_get_rxtrig(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return dw8250_h616_rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_h616_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int i, ret;
+
+	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
+	for (i = 1; i < ARRAY_SIZE(dw8250_h616_rxtrig_bytes); i++)
+		if (bytes < dw8250_h616_rxtrig_bytes[i])
+			break;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	ret = pm_runtime_resume_and_get(p->dev);
+	if (ret < 0)
+		return ret;
+
+	scoped_guard(uart_port_lock_irqsave, p) {
+		up->fcr &= ~UART_FCR_TRIGGER_MASK;
+		up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
+		/* Changing the trigger alone preserves the FIFO contents. */
+		serial_port_out(p, UART_FCR, up->fcr);
+	}
+	pm_runtime_put(p->dev);
+
+	return 0;
+}
+
+static void dw8250_h616_setup(struct uart_8250_port *up, struct dw8250_data *data)
+{
+	struct uart_port *p = &up->port;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = 256;
+	up->tx_loadsz = 256;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+	p->get_rxtrig = dw8250_h616_get_rxtrig;
+	p->set_rxtrig = dw8250_h616_set_rxtrig;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	/* A peripheral request can correspond to just one character. */
+	data->data.dma.rxconf.src_maxburst = 1;
+	data->data.dma.txconf.dst_maxburst = 1;
+	up->dma = &data->data.dma;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +831,18 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
+	if (data->pdata == &dw8250_h616_data) {
+		dw8250_h616_setup(up, data);
+	} else {
+		if (!data->skip_autocfg)
+			dw8250_setup_port(p);
+
+		/* If we have a valid fifosize, try hooking up DMA */
+		if (p->fifosize) {
+			data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+			data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+			up->dma = &data->data.dma;
+		}
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -904,6 +974,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

