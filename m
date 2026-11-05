Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911950;
	b=wbT25Jt6sdEfoRFUo53b7fXVhFfqT9kXzyXI3/6/Cj1cxBD79NQDbHAcs/ewY1wBVLx2
	 A9PrgV71snWE0I34dbKUIvY7cZz+MF+Ju/Q+kflxqEKmt+DnY18gcNQ9/9lA1+5mXvMdE
	 vI59un6pQ8UDtPnhz1vS5TaEgx4So2Y5VoMctlPVeAisSiQGJ3T0/1jqTE1gQWSj8Kjn8
	 PSdEjr0oVGtUl0Em64ncxsSU2nOomlJGoMHx+4QKXQb7QB/zwbt0xccnKKERwwLh01Hp2
	 uo05nqByYg1CFS9017qcMfhdr7Ifu4FkJt08XrfBDpOyHYq176eb6dXSpHykcLoUacQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
	b=M8VF8SutY1CWkx0/poL8Pty7JN4EZ0mFfmUBMjuVWZlJ9fIl8bPebxT6ChxVSe8ZSF5a
	 mcNmnSTFyzUVYUW+BUFn4h4LbM7KMLfEJDTnP0Hcmq/f5fHKmaFhrXbchd8q56Va0/GA7
	 jPQgZ/e2V8lLzQRv5iC9j9+zMuGED316yNEh1jegjR1WGGDfoU3YmcYFDDMeZxM+Qz77L
	 bYyiftwSd/iPtUY0wVacMVwK0Y+Y+qvVciLykuUKgDdZT+PSrQqyvtrZewv6twET+zHUs
	 yFy+Y8eXdBC0gXtvy1RS1XMm1SFpp/2EcHBE/AVV5ZOULtuaMr36o4C8BWu0Pso8LdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c8c6Piz8;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A007606A330
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A007606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c8c6Piz8
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843b6f8e2c7so5127a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911948; x=1794516748; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=c8c6Piz8lVpDnHoKqzGSNGx6CpIkw9dCw9CblsEZhkEsMmO0Oy+XIHPJULYcsJmkyN
         YUiJea4vN8oUq/qkf66lNmujAe/bh8zwoGztvdW2jTm0JXYryzd8ms/8ondvn3jiOeoB
         truoh/3ZkGYNqVolk7dxWXF3prp+hB3GnxU2/UUFN/F64pYuRJc/gra8jC4+4CeugYn/
         zi8yVT+304tyhT8gepH1MCS2rcoshBN1vwdZAu41urR5m5MMvm26xyK7/xanozwbXt19
         T4W2iVMlIgpE3X2UMlSI8JSMvuuABbGUmxrvhIKP73SxMR4TbqvScXrKm2Vf3clfLety
         TWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911948; x=1794516748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=iUmOAPpUJ5eEnpTKnYxvyolya8ZOewZ7FtgSIDd2ppV/SAgXjrgg11DUqv+EC0UIzz
         hXsa6WeSVlUF/iU+FEjITGo/hqntX8gzc3P+Qja4IkdTuxqGRuLJtgiwiJZgJ/1MdgPa
         CYbLP/6kvPrxk4Qd1BK2WqcoEkN+Ck3snKfhothsmSQKYx03+ETMQXqBR2Q3QBnHAvMI
         asoz/04onRk9XewNsPUvH2055Lw5aytZji0bHATfPM9a8hlstgnP9ZFnwvTmYg8pq4hz
         ccjuNHxh5nm+bZQaEq3n2IkZ2LzQn+weGHuWyt2/obwjSxajv084/w9QH5szAsl8RQ5t
         w9ug==
X-Forwarded-Encrypted: i=1; AKwUvBw0R69WCSrFS7QW8ZHECwbJ+aRRLncgxQbb3JZg/bqRZjFP37qGPPcBnR6no2nKLN0DnmTcaEl05kvJOQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/66cGEEYajvh1scsrAWcSlWuYeVak6a7ywUrWNfCvjgL4M0r/T
	CG9mCWJYKcz3qWmCT6k/0hLOEnlrYkCzcfGDj4uqzj4ms183umx1hBlGr/7wXg==
X-Gm-Gg: AYBFou2xIE70gKozlGnNbZH+taQIN0gy9Jx+urNt3xzeOBzXwqBv1ke5vJjdBJ+DVCu
	/OmS4+qvSgWySZlviGLhXMQWDdHwfWNHyjqmJI3usCUDcCKdB0h/5QHy61rFrndAWAGsoVc6Be5
	+MZysN7UgqUQyRk47JRDzL7KOwrgjYcSDa0K/V5Da6FJCVMhoBmTKhkA4c9NLtEaUv+a7tHY4QC
	U1K+lcrcH0YWSaNLdacXCv1f0+QzYlT4c1Dj4i7Xn1fqG6Zws+NhaSPMwNfD1gaYoPHUgl+e9HS
	WDErqkuIKHgGiJkE/FN1ifR7Gv/ZtUJXDgwdYTyAGjhEkiqgsJ/KRD6+JJnXc2t2iFxfWl0ucrm
	tK+ShJIpZ4Z3RFe/9W3yzFydZGC9nXk7ig44AoNPBIwcT+INuGb8WaI9zkpSbLinSS9eh49B7oC
	O1hngglcXP98svvuXqOO29mz45AhZ3gkJPwzQf2ABoHofDKYZacoKriM1ipFT8A1mFIN3wiAaEX
	aR8w0b3NSFCZtgmnJEYrrAOWCFrWv3aarpTA0FaWasSaN1kcsUFsDB+84TDs8Qrm+pU1ySIk5KN
	f7M/yB1YcuTVQR1oFTYBUahBz83hEB5zLMguLuKKkEep0aalfp6imXjf1VM8RQbf3zkPV/gg1+R
	Eh+fuij4Z7qL3K3UbGcgqbzfKE7Sw9KYwYpfEk2rAdrHuqcdc038agOCue6UtXBURF7Sr+98rvH
	JwmCyt2MPawDmM3VBVQoVQc657ehf5bBp5j5IJyEWLMG9TDCeUa9c=
X-Received: by 2002:a05:6830:82ee:b0:830:43b8:72db with SMTP id 46e09a7af769-85f1d0fdec6mr511917a34.24.1793911948501;
        Thu, 05 Nov 2026 12:52:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:09 -0700
Subject: [PATCH v8 08/11] serial: 8250_dw: configure the Allwinner H616
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-8-14024d2b184b@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..a55f60330a51 100644
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
@@ -657,6 +658,31 @@ static int dw8250_setup(struct uart_port *p)
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
+
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
@@ -880,6 +906,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -931,6 +964,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

