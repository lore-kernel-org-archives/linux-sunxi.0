Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742014;
	b=GUlIZHYhPyq83GZN1SomQTtqlvLHM+/G7KGQLcHiW1aSMWjdYYONpi+4iqf9r8zXu5Bo
	 nWJMKx8Ec/2imjBOLwWw9k4RKJZez3By1gOTKZW7dIHLokMP2/dUPLPAJ+oA8L8OJChyG
	 1NJCw8kmCkkEIwono6EMlKn264XfxKwQrunNqkOE3tNoajlbM8x4CQT0ignOFDlUusp78
	 /U/tb2kNMzQ57EBGRQIIwFFGDFgG1FTiPHKyBKL6aO4d24Vms+45SoGTAXogseJ+y8Ucq
	 NJ7swJOC5ns3gefxx0lgIrqfZ7HG2ZNFL7r1y6Jfio1czFJ8VPuUlWoo5dylimqksmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
	b=vMT2eKZutsebdEWySGa9VtAMpX3YP5vuiFw8bXX9YkoN2cyD2Ha5DwsZuUYRRkQHAfgs
	 eRWj8zUIn5EhkrE81qIflLR9Yh16Vu6b01W2GnvizShnzJuWvPupRs9ijqjGcv4JpP+O/
	 N5Zf4YGx8CvmXn/RskXw9BDnzW78gHQvgSexS+iAY/EChlal6B9kLQhBdQuJYGzovflPZ
	 MF5LsZHTS0H/67VPzHjBkEgkR2MFXwB21x5k/Fk7uAukP5dHL5BeNtm0ybA9Xta6G4FEc
	 rmDayWggEkKoWXSV2fFEZ0yhiZ5QdrtRqFGPFZP+Sp/QCACs3p8HaMhMIk9DTKYcWhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l93Z9ofE;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E27606D829
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E27606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l93Z9ofE
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6df5e315bd1so22986eaf.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742012; x=1794346812; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
        b=l93Z9ofE+Jp3TIxshsruc2Et5O9IZnceFo6pBzcGFfdyM54WBXfYv2+SSol09/zmWT
         itVt1pHGEhbA9RSvbE0ySM8NSaIFk1yRP6oyy8yeNYmbKmHpqHYfnC6wBQNDno8aGz/1
         8YrzjwTvsNzMbxMogtIb2ia3hNlCFY37bN/94BYlWMRsN4r9A200kFEzPN6+XPJKvq3J
         uJAohmfBYJgI6aL63inA2Iy2kiTV4eyDvO1msMuzqW2D6HBUEbynoXvxCOS5H2TxrnAh
         SIw/QCbLFphzIzNDlDwNffgfB9iOahE/EXMqTNR0gvz4Jy18PtNh5vO41LbHolGhpbyM
         VQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742012; x=1794346812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
        b=KilhJZrys0Y0Zv3LT1cSxHcr0jdU6DTOmQgSKHAmGmGrgve+ulAlmhxmctoifGchBp
         a11MTz+STIgLHIxJb16u47/lYhqqiv8H7/C86AfUlM3JTsyTDlMfLFLcZPWtED9/69Kg
         pf7+o8ps87BNtEItru090Mxuzign1LRkc0pFxYWuE/X0k7qlaIokkmVslLXesa0Xo2fX
         pYHfrW/XWREhr35fKRSRM71dIkuBQvwtUyqS4XYsSrmd2wAjmFVjEabsDEX9sOmM0fUY
         nmXgU5bG0t+t3yw17k6+SWZms7RJSy5PfCLgYUOgBFlmLu+Vh8EriSUsylk5MMXt/Mfl
         x/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwxmjRu0R8n4nfsMNo4Fa/DBgxYkizaWwoS1T/Fa0Rr0qCKtjtKbSNXsd8MaMt62gagyWJDyfcgkwpNgQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9fQ6StfG3Dd9aJt6iCTT8Jntw65kPCLeFSCz9x01t6k8eLkGes
	5HAkifmGuPfJDzIT7f2gN4385xIztl+CCqf8OWht4hMS3lz7veofkDdo
X-Gm-Gg: AYBFou2/az+rYIWorys1IBYhtWBZLsMywE+H+ouT+98zXWUJa4ISr0s2WlE377g5t6h
	jBQFm+j5sX/HJUzkkhpqGSZ2haOhymqMX7ChMnQoFFZbS180sb+sJQ4w+SPyMTACO4D7VVjuXwW
	WGTRV8CvrOsG7YMxVwsB4F15bsymFzvHPCyHNFGHmIbj4VvJzd/ESbjcKVokYn76O6qXC2kMsoz
	hkecsyh/3IeChpMgx5vwiBZqMejBV3GfxO5xlhYz3Hu9G2rnTJB1hYVsEoipGbrSy92AuH+a7Yr
	3ji8yXmeC1+56GKCzRupyjavmN1pfTZNkJXRTRuLG5FfylaEg6ipbeRMH9Wgkp8x542XMvIeOWX
	aMKk0Mi0Ya2EWvz37EpWapHs+CYoNQThTTz4cDxU5egFypIeRA0lE/YRoYNQ3S4RXxd6aSWX75z
	6+4LEzgTbiaDMljm6Vhwf9qhjCtNOgCNV2BpEW4iaynEkxUOkIPY5rjrIL+1fC26AbuHjSD58qH
	wXF0xckRpsBS8TkhRAQgzsift/bYpOCzOfUeBHIrretM2/ieAxUyOflFd4Xufbk7xNPvClVbAjp
	dDbAoivDvGFSTmYxjyzkXnrAQIb1ZvIYFE4CtWHBnJ8Vbnag+CE7+treiCX+zoG1t+Zc0Nz9Qqu
	t9dukWLfxgR8L81d0o1wOQw0qpilaB9sR5zIpmMyVrGzK9VrqTM/pt5pvmUO54X5/uDafOhXj6E
	ZV8i06zoBVbfp5PRRPEpIrAXdDuDN0yeCvkvdieG1P6wjP/sQk5YRq
X-Received: by 2002:a05:6808:191f:b0:4f4:3790:6615 with SMTP id 5614622812f47-5640deea416mr11125036b6e.11.1793742012357;
        Tue, 03 Nov 2026 13:40:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:00 -0700
Subject: [PATCH v7 07/12] serial: 8250_dw: configure the Allwinner H616
 UART
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-7-c9e248d685c1@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and supply the fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth. Use the shared
DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
thresholds, with the normal half-full FCR setting selecting 128 bytes.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path for hardware CTS handling.

Select this configuration through the platform setup callback. H616
has debug-divisor and RS485 control registers overlapping the optional
DesignWare feature probes. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..0e7367ba872e 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -657,6 +658,30 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	ret = dw8250_setup_rxtrig(p);
+	if (ret)
+		return ret;
+
+	/* Use software RS485 with the Allwinner register layout */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	return 0;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -880,6 +905,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.fifo_size = 256,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +963,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

