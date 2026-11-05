Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911953;
	b=GWtxwYO0RdEmWPA2Pa08HOUAGkVu3YsUeucdxq80S5zWifVqjNqJNcjbp15Qabu+/r0O
	 BFoxBYsiXqqIJABApevb0ytWCR9uJ43nRfUc3GcCjCwoUJSVikGJ9ymtvUg5eGW5WayyA
	 xjDMGBt+5f+aVax+oX7KtjzOPaeKkaDwCrZ6k0TWQG/8C976HFIIXgabznD5Nyijivckb
	 7syzAR6HsDZc0CLAKC23ObOF7km0voisiwV8AD3pJ/7ZrEO4Rc+Xlfx4eAWzRTmIgsxlI
	 T09lcB6L7Rk9JrFMxWlye2idTeLTYHBidaJGWfVn0b/lsW3l+mlggCHjDGoVfHTW4SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
	b=koPubr5x6mrbdLY/lH7V9bxAwp3sMdAoCL4iR4o17x7k/5eC8yGGzkQAyc5HRoc3yBNr
	 H26eC7SZwGUw8vbX8+0bFctEBp1GIeErpLeMnDeWxARK4A/uA5OC9p8SOxMmby5YsThQM
	 uAGril3wISJPaOy2Jfk5HrfaHJODYv4HrFctJv0sFdUAO6NsBI75qIya6xcmHLMkMl8xa
	 KpRpJnefTRhQRyLXGfvTF8POL3kIIsd/wHdJk/FTQQDm4G5/sVZvTcWKupUBO1YtHdNYn
	 RjQrS3SHtzbMr3ndezicKG6andTYBqJAcazV3Xu9OIb8VUG0QnQsZuxU5j/wl4Zxzzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7Cpfqv7;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A84606A326
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A84606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7Cpfqv7
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-823e4047037so3779a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911952; x=1794516752; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=h7Cpfqv7uUgGv4sWeIPWzNJ59KoxZOoDP8EJpsgwDAkcczmpM1unJ11QvZxrynxlhI
         RSK0VjExbz/YF9VIlklao5Qd9D9F9LhBsZmbqpjJbij3hX34TbkuJLWl7rKclhapeDY0
         bk+70whUMslpuc1VwdiyDNGf+Zr0oYOAECoI4wRgAydl7NPKWdyJFJ5pT/3m5gSC+uME
         wWoo0AgDlS04885xswV2oPRLmJ0INhseH7bhDdNHii9+EIJfMIijHHP24bL2ooLrfVal
         C563OjZTo/SJySsBzSpnxLU1BlvwhwFpjji0TmMc/nawfzcDRSmnhyBkms3fTfy3HXmN
         cnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911952; x=1794516752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=wXEIQHA1fQxGws/ZNUARby5XAyAftZsBv4h1QLAbJuJ76YpBHmsB8wIr8yWCUBbLAI
         G20KC+VLooBpA7OngRy/HHLqXnzYxhuagLwakwWuqHHUBDy31m0CbS2A5iw+6BoqzSfx
         Rrg8xCMPbrVKvpDxcC0CDKPuwunTamwsrlcrO4TjrqUl2Zve3wx6Edvn9uXoIhRvQZFM
         p5Ecm0yKCErNNadLfU9w+gT7bSu+lw0BAFqZ+JVfR49ZMg0VD/e4Y2+ew6jOMXr63nFo
         q66y44YhQdEg5WfC5YdzCBMZ21T9P5ugdGOshGyPfI8+dq8HrHs6i/R9XlFihAVEBAuv
         Cm+A==
X-Forwarded-Encrypted: i=1; AKwUvBxxXbCKlN0XOCYhZ2RmZsG2Ccfi7s1oBj/7StuzFpD/IDS4gUc85cst8q4x2HLsyojfnaFtgSG017JdPw==@lists.linux.dev
X-Gm-Message-State: APuU4Z++oRHNso0m3jyODhJ6+wYrufSIDmmnsLXLrQpbpH14YHB/Xv7M
	CkAdUGMLYUmtZtPQ9A5Vlu8TFW8nXtIp/fakayhbxLiLrcbKxXJ/4uDBiDdK8g==
X-Gm-Gg: AYBFou0dAv30fbEfANCXBB0MAOQWLiZjLYNv00hcpD7XoSdC6l7j94d7RYVfQiISS7w
	FEZT3Of/GocP66N8x8SNx8QFF6rEtrAsxfbw98+DFfKiVSrHzFdVnBZZiy4QSpkNZDIyL3/a4b7
	db3bFdaBLWZRuwKSrF9C3M+Ur6yHDhZn0USZnUabVcbCyB/mmW/31FfGI0IMCtf5NeIRevCn+IK
	coU7kYSeAjTP2VUBUptDAWu1LGsXOyjrQZxM7TAC1ZbD4q4hFrj59ENniyy6JaLlW69Efg5WTpH
	PNLyT6blvuX8rXX1s7kq2ib7SP0BEko4IlPVkTHCcoR0eMHAQG2WRRKjP1M6LEh4kHCRr+y+t0U
	6FRlDVeyIk52cQo4t5RqMRdykYYWlDJzYCJL2+vNyxJ+UZ9FuTxsAfUR26UktOIYXwrJoIH1kh7
	Z/QfKEH6N5B/CJD4DMqFHiywCz6BuvBi92VHa5tXJtlDZedwElSxCqC+KIF/ePibr6GAZeNOHdc
	Sv2lN84aIRr3AIPvn9atosp6MNvzMs3IKoTouX3OjFM2U0ssk8DilzEjnIqTTGXvb3lq1Mz4KcH
	+CVg3hiOuRQqOdauNjq5/+qVwW3xaDpCwbp2kDnmedFNg8akFU1gjYC6Mz2u4WON0RmAvU2PJs0
	90JlXDl/HmDDwIC8T+Ghnp+41t/YZ9CjjtRe8B0PMkI5STywzDWqkyEq9ge9rIIEDoem3IQyhnc
	SvaZOCJI66rlze/rl5C3J8NKXKKLWMaaXFv6OtbpRXk3FF0erm2to=
X-Received: by 2002:a05:6830:43a2:b0:821:8e71:1bb5 with SMTP id 46e09a7af769-85f1cfe1eddmr529135a34.14.1793911952656;
        Thu, 05 Nov 2026 12:52:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:11 -0700
Subject: [PATCH v8 10/11] serial: 8250_dw: discover Allwinner A523 FIFO
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-10-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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

Use the shared DesignWare trigger setup to validate the depth and build
the FIFO-relative threshold table. Invalid depths fail probe before
registration instead of producing zero or truncated thresholds. The 8250
core derives the transmit load from the discovered depth.

Select this setup for the A523 compatible. Like H616, this integration
has Allwinner-specific debug-divisor and RS485 registers overlapping the
generic DesignWare feature probes. Use the common sunxi PIO setup,
BUSY-safe integer divisor programming and software RS485 handling. Keep
the APB clock gate enabled during termios updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a55f60330a51..257baab5a3ed 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -44,6 +44,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -63,6 +67,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed FIFO depth; zero selects discovery during setup */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -666,7 +671,15 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
-	p->fifosize = data->pdata->fifo_size;
+
+	/* Apply given FIFO size or try to autodetect it */
+	if (data->pdata->fifo_size) {
+		p->fifosize = data->pdata->fifo_size;
+	} else {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
 
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
@@ -913,6 +926,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
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
@@ -965,6 +984,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

