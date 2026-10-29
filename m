Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299655;
	b=dI4+zSpnJ4XLlslWmWZ19iy/tN6rUwgJn5KQN4ZhFlNRC0X8mow0jkBQxjLSYuEfSFQT
	 8xgnNBH2jbV9HGQh1gqcJnUX8Tc2W0QJcTU9AIOhbRuUs2wj5YRBzkqEzw0ihQ6yLH+ZY
	 BzoSPoBp5h3iVtEQws+MXmORfs2FRVjh6+hbhCbT1VR8qsJzFDqTDjB4UqdvbqwkEViId
	 fyNd5n69JMUkFiIP1ANzoZb9Cw6UX4c8SvCgrnxnSCdLatKBwnwMEi8NEflZ9G7MP3elI
	 lSmwiQxFfDzL19/B9N/kEYRIEUwmA+h6493l8FG+HKDAJ+hK4D31BFqOwj27F100K1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
	b=5TxqrsVKBdnw3AUi0nZIXvvSs6EUnm+rJVc63lzZ5jYqyF1MNrmllQgJJUJ5ju5BuKpW
	 kkH1Onzl302ijO5RuqAA7Yw/tmB7v94qD7srmCEJF/wXKL2ugSFlgT7NN8dquqNqx0LL+
	 6Xf9+jtTdEfVBR/3c1wOfdYADLdNBCiV22fKHB/Q6amciPOdWepBUDNdyuj4TOGq//AQb
	 mwRgWPNG5jitdOz2zTCW9lR7y3DofsIeeU53ooCRK28L9A/w8ui9ztVjykYUq3KfhGXXQ
	 klxSFDu+j3gCWYyOq41QYmrhSwLhBu53AyouJJVACmSsuWmf5TS9KLef9J3HNoeuU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqVcg2V6;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F9606A32D
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 18:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5F9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqVcg2V6
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f48c750afcso1685583a34.0
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299653; x=1793904453; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
        b=hqVcg2V6LdAGgBmyEhrE+PVmNE9MLa1yhDzcXA3AdqBB72lH6pNKOAyb3kMN27/Wtj
         8aYAuwdJvbTszm+zN5JKDDvuifYyX1ejpTrOnhLeRDDTUNHBzeegbl4T8ycSNDRGt2cJ
         pm2s5iF1dyMwyc6/E2p3IQ1KOnDZ8ngajEXFW9J5sQTlrOgwyonvGbKOvURWmGymoYzw
         RDlJ1N51T/+KagStR+B2ZiG0k67uAAEkx4Y5AKfzOQKWQIZC6XrYB0A2CbYLC2HFvnfo
         SMyMicHFsRudbgs1A69wgnwYdVXrGcAO+frRm1SpuBIQSda1L1aAIRxoHdx3LjTPEZk1
         0z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299653; x=1793904453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
        b=RHX89XU1g4zSyVMZtw/3eCbPKgIAi/pBKYKgl76EIKJzHJqf3dwcvbS8ywSyg8H6s5
         FY28lkuW5iWgh0a6bWSorEd50HAeXO4coT35HA0Oiw6QS8xuZ63g/bNz7MdtHmVoq8Fe
         zcBHKy8OI4EQKHj0AR8nH014zhu/OqBS//+vdwcYQNRLTn+odoUtBMNQL1f4e7Xrm1Wz
         OUwlxh4SYZLn++dUmJdwgwKGYEECuunDkJx4nL5ofQllMcen12LmDVgX8Fl/bH+TKnME
         kVQi8g0MHT1g9MRGxocwyMy82WXgLjG2zx968fgeBBODEETP0iZUZCGF054w+pxYrdgJ
         on/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTIEBVbiQDaADclKPH3y7zudYfdSTzw1r6yt1ZpHfBnQNi01xmV6HeF/eUQOq04usRG3iNH+IyqsH8Zw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLASKnYoyycacaJMcctpSaMv9KMcjb7bFHkbF8RPPBOb3Hftpi4
	bbSngZYA6kmwhUc1XgtBLwtKItjqonLN9koU5C6yETKnXoQ5sPxGm7g1
X-Gm-Gg: AYBFou1q9WI/SL3TcdwaviLBKZRZNpcy6Xbg0C7ZwGswx858DNnoBWDiD3+mWoX6IsR
	Xe6wo7Hat54vy72uh5Clh8zlPpRo5IhYfT4IU/BdFJzABhp5nFX1ffTm4YR3nAkYZDE+m6hDHqW
	Mx/EwameBug5lsJW4d8HnwDpDSIPuCpcVsUJNhtjbJkQM5xRYs8BABEBu1fRd9dZf2+5qPyA5jE
	QWMTOKiGrW2YcMxMRmz4fFW0kfXg8Zc/H1fOEJBdTa1JOGlcGsos0qta4NI1vrmhM5FFK7J2vUt
	4lYKuXIX080lMpArPFNiEb5DbycjiKraGB4HnLcwVWabOIlbb+s302WsQluF5G5yCYDIuGCqHkw
	W0etuoJu1jho5hezOMqOTpZqkLWuyriSBAx+cJJgPrn+vyLXcOXXr7VJEWmhLWwJTxF71VfrXvV
	lNpmFe/dL4w7NNa3gM6AWOSxsZtNYzGsfZjTa3ypwzWb6CH8qq4/0o/VgF1sQ1HKYtZr5Eik+g0
	JSPSaxp4aE6pqWsG/F9keBlTX7Kyd2E/rtVl+7bxTdpGvZCEBM0POwfer3tHkyWfniZCXulXfVC
	s4M7S9u+I7MRXhFGq6nhDD6O/VC3DW2zdB/Wza8v2yiAHWYsmV9iV3fkFTC5/5XCOx30PEOhK3u
	0EEYwNaN60ytr51/HyMXfFvV3svsny/7zIz2t1vm0rS1/EhsQ6+vU8b8/sAUfmNqG0f9mOBixPe
	Mockj1+hRJ8fiqyu4qq77w+Zx2V2VQCW2L3zvX7aVTGeLThH6yXYU=
X-Received: by 2002:a05:6830:43a6:b0:821:a0a4:5016 with SMTP id 46e09a7af769-85d364068famr49875a34.18.1793299653520;
        Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:22 -0600
Subject: [PATCH v5 1/8] serial: 8250_dw: select port setup through platform
 data
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-1-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while retaining
its DMA setup. Select the DMA setup helper directly for this integration.
Keep generic setup for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 41 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..a546cf2de7b6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	int (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -631,6 +630,28 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static int dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO */
+	if (!p->fifosize)
+		return 0;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+
+	return 0;
+}
+
+static int dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +786,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
+	if (err)
+		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
-	}
-
 	data->data.uport = serial8250_register_8250_port(up);
 	if (IS_ERR(data->data.uport))
 		return PTR_ERR(data->data.uport);
@@ -860,6 +878,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

