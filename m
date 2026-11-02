Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649334;
	b=4uGHDLm91CLBq4RiuSI36s0t/LZQLjs2NWo7OwyiWglRcIlxPI+DibW76t9A/w5L4HQu
	 6B22GmPKrzZ092Se+JYa6smsek4VPHXt1bqLbuKdPHFEpebnKpqyizXD5BQNwxlmi+oOE
	 tGqvvL9vcXxYmGAdI8tRJFxgII4HLHnWcjU0lKdYadTM2diuqiyvfBJZsX9/eWRRT5ADp
	 kLijGNpX1rdeKvxrRDTNVrIlWsLyptaSn0Fl2kS75FGgjWQf/bTzgakH28Vj6nLQ9aEYu
	 GRUmstMMwbPioQsK1NTbSMbqKAOyRPLCLypfuHFZ6IB7qEQow0BUNS6PFdz784MFiCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=;
	b=sH+XhyYF8GwZD7EhOWey7B7EbTAX5P0Opp02xFMBTuR0XgiAwARMxwws4B5Y+TW1cSvY
	 v+QpWwifuB9dlXs7b/wDO73A+KIclZ4dmAScK74yBST4yQDpP+Fg47xCs8B73VtBJ/bja
	 ef8abAo2l56Ao3xUUkriWfsS8x7TpOXtHT9CfNx1ZataZGFZ8qe3RXh1hQS6pL9vcCXzt
	 mcJvlYPTUQHoTfiYE2S3+OofIXvBbUtkcrxwJWTAFCfFydxFjBUXpXiGx6fDHju1KuIWt
	 wQfwABfHE/IhaM6U4pZfTuvcsjrpwDfr3q4AlYKMt8ef/oTwldN1KqVa6jMHUiUSaxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJXHB88c;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95559608360F
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 19:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95559608360F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJXHB88c
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-43bf9548df4so3294338fac.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 11:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649332; x=1794254132; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=;
        b=eJXHB88ceXPJ/3L6Jbg1jctGMyIkLHS+wQPy5gkkgSjvRPnxwvxD91pCn8enE9Krgg
         JXwn5Zfng4M04cse85fscy5Z98sBTr6xe7yGHkaEQQuKPZGnwWY8y2N0PsLplLjhJJbg
         XSf97mVL4JxLq7yMqD63J4Lg9XDjaNTTJKqmuNR45g1XN4WPT04MwiU3NsctVz926SBO
         1FaLVBgG9NeOxz9VhwGaGOrFTQCWf0JUxACBznz7rZKhrfaosouvoB9kekNTFnpnrtko
         I30Ak9dlnz8cTTpN2PnC9lzi4PPaHvK31v608Bv3NKtEIhKBYbE3XhS+NJdrLMUJua5L
         pm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649332; x=1794254132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=;
        b=B6VY5jUiPAqX8ePtcJsTE5H5Gh5NS3hjIIOIVPML/wGSKFXN0ACHuzD1id+k3I1v0t
         ffMdd+G/NaMVRF/BTxcdYc4ckdccCsmfRREBGdYaibZTFxryjkTUnkK43xyyFOA3yPOR
         RWNMzoyKAv7xicMMZ632XUt2Tvyy1BIaj8RvPqgWXLgLXZ4qELBRwvu+CUYThcb/bZ7c
         p4cLZ10v4LDQzHw4mU1bG2JIPlbMrMHB3DJ5nIPgR2z48lIiMFG8MKDiEJatVaydDwTt
         Kt02s86GhQwnQ0HXOkV4F/1Yk+0ESvzS1g9ZO8H63OoBO2l+X8JgY/BhzKl+Ig52raG7
         h9vw==
X-Forwarded-Encrypted: i=1; AKwUvBzB76+kHZTthJh5ukAAJjbCHfqDXSvygx/4G1CTqDIbQxlVFL50Tlstu8/iy+3vRun48UycfzjRKTM+dQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK3iyNaSvBMh1Lfy0jGQkkAn9JqFyS1n6/oxqWqSBP3tCXBaiYo
	RgQYm/WG3Yx4dOG6DkVTetsjY07kYl9FGao7Fn7jIf8PRg6qpx/lTCGL
X-Gm-Gg: AYBFou2T0/oBFOik3AZh8SdHKv2uEswUWpKg4SfWGRiNJ/MjDkwRD4hspnnw3qFPa2k
	GXV2iaViON8BHoycOxCKNFxn2bv5yrePuE3rLtEgOc9bIRNFRm3jiTDqkASiDfAf3+Ruim3jeYY
	8QnGf2dmKrtJRSPrahqSFlrvHVmI9xyQtDlamE13ExPLHCMnILNZU3xgEN9i0dB45S/Hm3uzNms
	3RXL3jjpmNFVBlreWmzCwyYVdRLStY0xmmfVrCSvCKMgIUU37K4fqaJfgex/4vSoMddiAlNtell
	ayLhgWc59nqDvhVU8V4o3zwZYtFTYZC1Z7bOqn32HNIMdJm43vZ7MWEntNxDiV4ifqpDos9NWhd
	Uij/eumjHLNknhKIogMU0hIQO8KRNITt0ZpIF75tIuJnLsCnsZEQxhj+q4KkQ4ON8HKAVJwVUgn
	aOxyx6do+Ituj2FT9e9BrCCToWaeY4xR3iA4xqeAz3xSqX5Ry/0ifwCGaO2seC4SiFB2SZ5MssY
	bcQAlCyWMU/SNpOvecumqvWaXhO7kdbUW04EWFzYa3P0mwGvGehWxhyP9grHfi/nle6YtrU0cBw
	66DHYUhptgUElkfkSO19Ecm1ZU2PuVUB4jDGQSGP9CdNtNuS+Yv9Sg2/5CsM3XiU75Lrn7JKwyn
	sONkQ8a+KXnymqXqBpfLDE87WuRtmYsfl9ug+C5eGXERG/WDxIxQc5Vo1hIH7KbWDPqim4VnIiH
	vBLOwOjfD2JjhNSDCGmHpCqacfsdbyF93tQh06jLCsDSzaZdAzxTI=
X-Received: by 2002:a05:6870:960e:b0:48f:e21d:1a30 with SMTP id 586e51a60fabf-4a9078421f2mr5974885fac.59.1793649332410;
        Mon, 02 Nov 2026 11:55:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:22 -0700
Subject: [PATCH v6 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-7-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
zero or truncated thresholds. This bound follows the current 8250
table and callback types, not a hardware FIFO-capacity limit; support
for larger thresholds would require widening that interface.

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
 drivers/tty/serial/8250/8250_dw.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 0b0156464af6..0ed50d9515e7 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -18,6 +18,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -51,6 +52,10 @@
 #define SUNXI_UART_RXTRIG_HALF_DIV	2
 #define SUNXI_UART_RXTRIG_FULL_MARGIN	2
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -70,6 +75,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed FIFO depth; zero selects discovery during setup */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -735,6 +741,20 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
 	p->fifosize = data->pdata->fifo_size;
+	if (!p->fifosize) {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
+	/*
+	 * The byte-sized 8250 RX trigger interface requires positive,
+	 * representable thresholds. Larger thresholds require widening it.
+	 */
+	if (p->fifosize < SUNXI_UART_RXTRIG_QUARTER_DIV ||
+	    p->fifosize - SUNXI_UART_RXTRIG_FULL_MARGIN > U8_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	dw8250_sunxi_setup_rxtrig(p);
@@ -978,6 +998,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
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
@@ -1030,6 +1056,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

