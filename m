Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873364;
	b=Qp+BsnHNgOx8uDYYXQHDYNY4pjXavPxQbbuhQXbQZ0xhrXCFIcgmTMxt7IFoTZfoz/bR
	 5chDEhDN7QFkwe04ZldNqn9VANR9E2kXElo/trz+wG3JN7/Ax6HsG17dliV9SCd4PGnl5
	 GyEY5uT6gdh1A3nI2FPJKMFCNvBjNZF9n4jphzAi71xHN6v+Ok6KBTqWopS/MR6lRiFqi
	 MLce/YSqUR0RFv4xBWqDfQMuWTTZrDEC/BDkrcxm2X79PKjHIyXdJZUNIW4diPUccispb
	 fXjfM5PMNAQ7JFi4x95OcupXJOD1Wps1/o3C0YkMvnUwFcULf++Yr6AXI8Dr0c2VDQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
	b=b5K551I8gIId1y3MlJNkqBwR2P7kUhx+TKRvfV6WvBYzdLs6TOZtiGYTSh7odPUmEDka
	 6vXkfW2KLkoHVkz4Jgy7O2Gz1opnDeP5hfGbwD2Dpf7vJUQ/7YsW/STgNz0xoIhC5PwyZ
	 PFiXT3j2JJYesGIO3AQArQzScNNegrqkwFxo69iTfG3L7RFTrnRV9TTMnDWUieRpmCW7N
	 Qa6pWlHxxCvqYiJQ8ksIk+NdVip7DgTPOuHdsKQHGbYHCg2XiaDb0YhbniZdUQZX99FHa
	 vx0cY5al0sZH2RS8GhrvrizGmoKkStLFVHz+g8LIzSeFSXHZv5zamqTJcro7ZraZEmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FC760A2621
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FC760A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-81ba09a5d23so2339262a34.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873358; x=1793478158; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
        b=No/Op3M+jVjSSdDjl7yOdUjcGcc4PwQfcOxP2IwjNRFu42oJRr7dvBSJrzdUKYxECx
         kVhNVoTDqK8N/VGXcq8oA3bzBGt4V2BAYPvr5aTg3u+f3yEAm9TrUcxKGP8M4LtY89kG
         1k0UTjbu+Ult9dNtAkjd4DPtIpcgd9A0X2jn5Jcccl6H48xkiGKZvxX+o9KTGzgu9BYp
         w5ZmAaaGiMlQsT7HkEflG5K0TEkK+FOOpFd7AgbpT6k3EYTaWrL/DkOjDJxE2loLYiO1
         4y2xaCo4cGUiV5NkdjO8EGT0G5F70SbwVFf4v02yJyPCFshh857JpZAS26j2ROCVWh/E
         tImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873358; x=1793478158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
        b=j9joku6aBuWvvib9S4P8/6Vo44r3L4JC5SPcb6FUmofsMEeMloy1mhQJkx/MSts+L7
         AqWyNzhQqxJWpa7venX+3dYSnBmrs90MU1Ad04jfPPkx8XAYEhzliGuIc9IX3QvBD3cJ
         wYtGDhhLTYki8XcUEua7iowJV5H8TDKkduCa/jakZzlo9jyWCnDfHFy0Stz7Eh+EzsMr
         8VnI4LcZcWnSiusQWG1izhSyEcJ6UEU+yRSdhQ7L/TLDhVejfSa7Txe4OS5LyNq08NEK
         FPFfOUFOS6MMLET9F7rKxu1+orxRER0Diz7iENtRa+XRSpPHizVgMf7sYav5MkHBsikT
         SAjg==
X-Forwarded-Encrypted: i=1; AKwUvByFGwPGhWduoUx9P2kgnwmCAK8Csg9SqxtwNp5H/SR+xVEqhD1gyZfjsPVOUhihS2b8AJgtyALWCVbhDg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIdc4m3SmmNKrtmesjHSJPJizrwN9M6IkfGp48pVU9i8kliAa4j
	PNvIgF/UA3WM/hFHaKDxVQ2+bz9AjgmWyz+At/LUiccwFqj6stBML9yX
X-Gm-Gg: AYBFou0FQvnB1bFzRhgN6hBfsb619+7WABM+QrC/1l1t8Kw85xfZ1RWeBnAUdhn2f6q
	jmRuHqkC/okWi4Cb9bvpLAz68bIGf1beMWlZb2Dm+7DHjmR4mCXi49QJYDkJebHLJC51TiSy9WP
	kMmYyjjVfBVZC2K9IXeP9ML+gabXM1L/SklrrzqVOKeBnkQI51xLRDEMtUsNheR1JXtsJIN85bC
	TiYTU83kjTWzBhr0ZdtxTvXz/kqSqMk9IL+aN57wb1poxuWRHJdd2NDbu4EHGHh2D086J85NVXh
	XBWE/Pd/APTgPFgf48zPVMidZUKoRgo9lU/do46piznH+Ue1XPCuUBIJOou29l2YGXJ3JvWLsv8
	LqVkSgaWqBntNEVictuBbncmU2uNONhUOMlr2UhR8vjQ8nhG0T4gm4asVpni6w+cAuTnEpJqb0s
	95NxAVu9eS7uJTkRM9W5v2nUZGa1tQFcC62gOW2pQFtJGFsTJWY3rnI9BfIn0fBHqw1ii4izF2V
	GEl8+Ph5qthp8rRv9Swur0PAYiNrZpPpPaYXAwuBddWn2nyz0KXJf3yhzq9BxL/TZYMrpcQmD8I
	4BA19A3mSJy8ajzKAs9jTcNJ0g+vj2rLY9HDGTkMZWpRivwhH781BGNvnVFyz3G+vLIMtPm+tmU
	hDdPD793G5mtG7dn+l6MiQ6M3MVcNpDavKdViMFsVS8hoJ607ihvnkvRvt6KHo026R7mM+LbpH6
	r7A1e1bk+cQy3mzyR/oDNPXFVT
X-Received: by 2002:a05:6808:1982:b0:4f4:3790:65fd with SMTP id 5614622812f47-55c002b7e97mr1918256b6e.29.1792873358250;
        Sat, 24 Oct 2026 13:22:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:25 -0600
Subject: [PATCH v3 3/4] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-3-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
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

Keep PORT_16550A and preserve the FIFO size read from firmware by
uart_read_port_properties(). Use it for the transmit load and derive the
receive thresholds from the documented 1-byte, quarter-full, half-full
and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128 and 254
bytes; the normal 16550A half-full FCR setting selects 128 bytes.

Serialize trigger changes with termios and hold a runtime PM reference
while programming FCR, preserving the FIFO contents. Propagate runtime
resume errors before changing either the FCR shadow or the hardware.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Select the fixed configuration through the platform setup callback.
H616 has debug-divisor and RS485 control registers at the offsets used to
detect DesignWare hardware RS485 and fractional-divisor support. Avoid
those probes and retain the BUSY-safe integer divisor hook and software
RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9c171c5775a6..557832254c37 100644
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
@@ -648,6 +649,73 @@ static void dw8250_setup(struct uart_port *p)
 	dw8250_setup_dma(p);
 }
 
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case 0:
+		return 1;
+	case 1:
+		return p->fifosize / 4;
+	case 2:
+		return p->fifosize / 2;
+	default:
+		return p->fifosize - 2;
+	}
+}
+
+static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return dw8250_sunxi_rxtrig_bytes(p, UART_FCR_R_TRIG_BITS(up->fcr));
+}
+
+static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+	unsigned int i;
+	int ret;
+
+	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
+	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++)
+		if (bytes < dw8250_sunxi_rxtrig_bytes(p, i))
+			break;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(uart_port_lock_irqsave)(p);
+
+	up->fcr &= ~UART_FCR_TRIGGER_MASK;
+	up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
+	/* Changing the trigger alone preserves the FIFO contents. */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_h616_setup(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	up->tx_loadsz = p->fifosize;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -870,6 +938,12 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.setup = dw8250_setup,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_h616_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +1005,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

