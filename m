Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280406;
	b=MlTSYVLhZgXwbWvSGAEKEaQes6AL+3JQ8PfuFbYDNis4oE40gkeqrXua066awMKloMcx
	 lKmQe5NpXy25QLB28pJ0dXtZff0kvbA1DkTaoj2K35MpPx5Msptckwy90s2ptjwdYqokh
	 qlrzhXjNETU92ZALheESOZ70Z1LfWAiEe9CfsI5cK+C2U33j1/lk3ZLY6ZkBxYDaXXW9z
	 ljzmn6O8KHIb6GrbqJra+tuj7MAqEmQUjs9KJF2iDsEfr/MnszSs8tABSOAzs8bjRmt6s
	 VkQKFq6iyJleoKEKgK9nFm2ELgLWJOnQLiji3BvFlpcTXKXObYgi2SpG16jBcVwafMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
	b=2rgSer/PPOpLIxTawZu2rIYHIsLhK30mLManCZddJrGAL07QxnqywlgWG38l5KnVUdUB
	 t8meoHUNY8u2EQcriMAwZ10tA5QJshceN2iwEOtA8UquPD+tybMolztKJERaGIo3zVfZE
	 FIHQ9c1q/5zeIr7/9b9HdB4ijIvUqmpBzDd+8XYI9DIpztjJYPGR1a7QyjzWirHSljJuy
	 EPHNbQU5jN9kFDSQSFaz4uxoz/aft8SnG+bxzdSwTWlJhMok1MEuaAt+iDFlBUo+rozG/
	 tYIaMneWIsCIf5yrs+VZSDNeyeMCl5J/TWLTu0X0MJl1hlz/PQ3HNwlVFXV8hMOca6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dA0PPZE3;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D2160A5BFE
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D2160A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dA0PPZE3
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so947782b6e.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280405; x=1794885205; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=dA0PPZE33+mYoBh5Sgd6a9UWlFa0bn57Eqtqk1MMEXZR0kNRT7g0721i9n+4YP6vT3
         Q+NSMev6GImReThsii/T7YBsnbGkSReOVSXg59D777u5hNqpBonnbv6ajS2+1d786ItG
         hTTL2M6f5UaKpsqhmZU6Uu8wY+jSjhn/BH8wJfP200wf3pAslWVdJCxqDbykN9h/6YVF
         dF+YWm1P5sqfzei82Qfwuz96UKHdtzPt2EoGm+vXWAiJxg7+q2Jp1qJSdQ+lXCdM1c2v
         zh4loaNFufVdIvfiE1PVvasye/wBXwyc94UTw1FSM+AEPKm4efuUY3I/GidaYLvNrWtQ
         /bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280405; x=1794885205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=kz7nucEhWkIM5ajt3Tqwqfr3JjYaduStmB9zfm4fQG7bewScljugrS98w7dMtGGc+N
         f2hd1hF0HZSXcjno2jjHznQFdoKyS1v9C+iX/BZdVrOcQ1yFBWvRwCgbXaVMxB7S44TQ
         rpFUFWFvjiQn+BdsgSe02AwFbsQNhJcyW8hCNNz+Mum4Sz1s7A8qd/g+g5ncHV4eoex7
         s7pcNxeUvovCUFxPC1JI4KPDM8RTJSqVOjGejqzsrwhHFPoZbTUy64ff1oDxrUt7uOBb
         aopaT2xsNrLm0KcA4enpjco5/a6bC3o22GLa5Gt39rRa3EbjOjXdNQPLdYbMTvRHDb2R
         K5Gg==
X-Forwarded-Encrypted: i=1; AL+hErH/RV/APB72QwpVFxr3Aoiff4zmo170Hel7kmCDevPozEt/6UJBZ8WLXd3t5qaJ5Y0gh4bb1Yvh5UfeRA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9lcgdbOssUfbAv5PMm+QLnzcKjw0geCte/RVuqo+6nBFM5x/2m
	NSPIkLT8A+qIOgknM8Ilgi/MECR530jFWu8TP1dHuGv/0i+y2qTx+7fG
X-Gm-Gg: AYBFou1GBX9M2qpzDLvGXMGmebhinrZMtlXqcwbcYWuUssCfoHqJv33VEz34GsnTvB0
	vSzYOZNVPUToXO2Sf1P9tqIeFGHF1p9YFjE8BnINbu0dXcifnAnh17pkjidM5gU5174EJ3UVE5P
	e8lTgDyX9vKwLt9CnsBbRcvuiWQQ7Pokbh+pB3jFxxVSm6+wewm9mpYQLR8XdkmMXFIACfOM0TZ
	uZJ8ribFUtg1XPJIH9XXFl0nbcI94hUafrPAdavWKQkewIARYZORq+j7f7IRn2iBAXHQYhlF/Gm
	kTdQsUxdTt5sw+smpk7CyRB8LNT5+TpzT8Z2GmhopokQmY4SmkOiqBfwW2gXyoQzRJX7GUn8Kgw
	ktHrG86VlCyjDlymo7y9p/CmSXzjRKOfO5skRPgmNNxcdXq2SMKGkYBkXnPcgP5ejdwQLYZeb7M
	WmcrfwDhAKAK+Kbgq9tFizBZ60dR+6wlSZMbfgQqGPlUVlGlkUkjOrbCOgUvG9ZEmSgFIMnlLdU
	YFF09PsY9WtsDT/P5B63wtkIJSbDHWekDnC1mqvXddz+pNfqWZ/Te37m2BpCKR4kMiESv0goJgE
	E/UdxWhJDpX07YJR4kPdyYzTiPu3xfOYDPMF0MRGwkeiFEJpnu3CisCTPamo18TFsuQ+wwWC1qk
	OnpmacQsaaZ48rpZCNNYgNJKQamET0AsYtTHJ8f1Xy60TAIdaE5nOayMFRk8wEjbd9OhZPZEQcQ
	cVNmSVBIdL+JFFQumPJNap3QnWGXmdxoHZ3qLJQ2SNTTu5DSgap72+
X-Received: by 2002:a05:6808:508e:b0:4d6:90f4:48ab with SMTP id 5614622812f47-5683cd1b07bmr1294602b6e.45.1794280405078;
        Mon, 09 Nov 2026 19:13:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:59 -0700
Subject: [PATCH v9 10/11] serial: 8250_dw: discover Allwinner A523 FIFO
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-10-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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

