Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742017;
	b=i4DnRTjMinuA4O3r0rlk6YRUXLCTCnFZrzC/55w6Z8lY46W5oBf7fydd0dKOzxg0HFXQ
	 LibAZygSdwRQKQyiOVVsF6nEN9oKLDDyo1wYo5I8KZNJ6O39Y6kIv/907hLKoBoZ7QzSj
	 G2XB1fkdSrY4te3d9FZgjW/T7NNWpWmSAXP9NMLA5PrQizHeWopO7lmYs58vz1rldiTwR
	 Ycrmm/7yG3XG2zP+9sQXD9392RXYW3DkbfoztB/cw6qv7qUxMMn4t6049koNzCH4lyEPn
	 KXFCDQ66joZoT9gDaAvdF+xVWUeCUOgbF0M8cXNiBZGn8FjFCWLqkXsfH97i29O23cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mOkByMgIh23Ng8hqFybijqEgXApYqjm77yLCSksIVRY=;
	b=gBh52U50KXYs6cgeynkq1p+esS2NItetZdGCWRiK04KR8Dy7d5GYM6TOMvNlmOZP6Viw
	 EQI4SM8RGXP592RRIObn++lSRHbmhyIW4UqcvAVK8/ZVPGWbCvtO/QtXIU1ooJsgbyO7t
	 LMhisrrl1At5ltvpwbM81yPNuUO/u3LNoPCSP6RqZzX7qk/DEQsoyJpD3YgATrPpCYBZu
	 YVl4L8Rfw3IQiFBMLAtxRvA/eNAdFOEGNZLk3WR68o+SJ0j8xI16dg0H+RN+H8Z6vJDr3
	 ZnZXW0hvQQOTOnjcTO7sdgNPP7HSXhiXYGYzAZXeHD4Oou37FJr2QtD8d951vCBYLsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIfrxqHS;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D3606EE81
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A01D3606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DIfrxqHS
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-563a0462094so39201b6e.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742016; x=1794346816; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOkByMgIh23Ng8hqFybijqEgXApYqjm77yLCSksIVRY=;
        b=DIfrxqHSDeDkI2m9HiVgCKUq1myJ4c1RKcUX5DArSZQMeSAbFU4lxZLLY2m7msbEpy
         Gp93MfEDzeMwz8o9atqGawR3UNNHn6LJS9FoPRn4XSz3rIec6YECBhMbCkDMHDcAMooJ
         aDTh9RNd0LX5VYQbHQ0Oy9+mYaQAK/57XAgfaFIcabf+XsUlVqYGneS+6jz6CosSTmr9
         D/3eOHi6qMVmQJ8dCRiAO/ktJk/eLW03l6BMbRgjTcMpAmv47KmvkPgGznvCeIFwUXnC
         Acl2u0IrCVxOfTgvs7DU4NiuiQr400dH1SrvkS+WuMAUGqaFzNMPyaRguZ0z6dhshECW
         HjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742016; x=1794346816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOkByMgIh23Ng8hqFybijqEgXApYqjm77yLCSksIVRY=;
        b=ADi9IVbE+ii+25XDu+24nAyfQLX1NU57QNv3nEQQySxvv6nKj6C+NAgwu1oYhJJeK+
         UUgZY/NuRzx4gf9NUg19lDQ3N0c7esfdNWIWEpwGzt367BkZSoUajj+PylP3N+aN1PFd
         jqI9ZW5cl9T9om/jrkVNIE/+JuczHhr7+ripEubHT0f8HHxgtciWOKBTrPzAijZC8Duk
         tIQFjAWLKPNcDPT3LPcPpg+O7KXphLLsi3N4Hoy45B0H9XYD+HKbW9XM15iF6R11UGpK
         xIzemiVrATFgN9YS1rc4IQbNje61hteucTRbK21eGskRm6sCdafWbErQErkJAzWm6xL6
         cz+g==
X-Forwarded-Encrypted: i=1; AKwUvBwNSdTx44K1bpkUomyhsAyomVPUYcwLDWflbvhCxgNKYyT4OLC5GnHOX3DGuOLvn1SDYdhYk0gcvpa9Bg==@lists.linux.dev
X-Gm-Message-State: APuU4Z97i59QLXajpk2fLcyQX2DCfOQoip2p+1SBa0v1ELPgHS57ybkD
	tz5gaZZW1rA5boSDMcD4UFXnq98FKf1juq8qpRsoegEdGiIhCkqsKWe4
X-Gm-Gg: AYBFou3q8s2pb5azNTxxPy5nj0pzkXxJKq3awNGbNRwuGeaMoFUMOJJkt8jCk2sIHbJ
	Pto6MIBibJpWSF/Wydy9r5e2+UAvaqpytSOo0shyDikowvp4YvMIYxJVuDxSDI9hwpG8/PtpAA7
	8SO0itShCt0pMHTQN+mWdg9VL2O+SPDHzPHDHJWjaebXwUYHtv/HZh+jg/JhVuHmFLA/5PbBCHJ
	hHyesxpVLtheuoCTrNsLEdBIBZYaSmjB929bVoRm2oaG3REnp6XqjrR22IN3wMMO0dDCbJDBLNY
	sGV+vFZIM4PoQHOpduQWilOGS3YgroO6/BXnbeRLSKxsz0FeO7qceOVRdNchUulzlb58u6944xW
	LgObzcvzOmLX75AHqDN0A7aOjcwMtba8uPbbnIvhhEmHrSt84t5JgX2R6xCus1syx+auCpQNfuF
	rhPjZVosFA0kXZIhkLaXTLHNF6h5vbUZP8uZ1jr4DfIy3T/3bS2gNx0Z2r9T1ufZ2PLBpAOt/Tr
	Yp/S2xijRBxqyzSKQqFIlXwa7JCmaJthJS7b5Ykd8itv6lKIUqyuUPinzfnFbDu9mjJdkdyDs/S
	mXLOkf3mg8POQfGJG7etkBUUw7cPGxpIYp+eXWXWfWTRUeB7YrYPvRfy+9AoyqxaBwtnqZThvEa
	fxWnRpFXx2SEsH4yZSBlyZOZsyKoI6qFaFBWkxrY5iWDuM+Sl9mcXTGkhuebNZDAMvxjLe6BiZ3
	XsurYdnPJQCv0PBIzSPq8l/FKqCD4XphkgWACcLJNCpg7OgUSe/iy4
X-Received: by 2002:a05:6808:151f:b0:53a:e153:e8e6 with SMTP id 5614622812f47-5640de7d903mr9983750b6e.59.1793742015715;
        Tue, 03 Nov 2026 13:40:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:03 -0700
Subject: [PATCH v7 10/12] serial: 8250_dw: discover Allwinner A523 FIFO
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-10-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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
 drivers/tty/serial/8250/8250_dw.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 0e7367ba872e..cdd3a62dfa7e 100644
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
@@ -666,7 +671,13 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
-	p->fifosize = data->pdata->fifo_size;
+	if (data->pdata->fifo_size) {
+		p->fifosize = data->pdata->fifo_size;
+	} else {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	ret = dw8250_setup_rxtrig(p);
@@ -912,6 +923,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
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
@@ -964,6 +981,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

