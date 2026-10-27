Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142346;
	b=uL/lLqyjQeYuOTvGOUfPUCDPiWWEKlMVd9qCnVc509vTLo1pDImjNy4QGmmckyQKHO3O
	 A1t7i42LX3n6jYVE9QNo0A7PYZjliwygOiGwwAYtuBa20LNmv49a5Cq+v1ouZ3pgP95nu
	 n5KH6yWHl4bLgZeo7Ru9hQgrTKhJdForyxUqip0uW7ZOkAhbF0a0M2iLCQyOMz249WbPK
	 NYj4WeI9qqM8ghJ8A+mfLAFhtMHgZqpG94IzPbWjkvD0R/Ztu/t9Z/QdfFpJEipEGhl9u
	 jHFie88ttlU+gjQ6DUNaF1vOEryOxN0HwD6TliGeqlkpxTO6v84w+ivQVIQOrLoHPwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
	b=vXXPvJkc4PaNyC4wXq0nz7NzbIuYWAr3Momf5di6t9CyqBV1rS4H1eBEs6TiK9ROhJhQ
	 MXcZDY4+lbpF2E5TQIONRfVe1EOlueZFtbTSag/PCajpVKdMozwCyqNbaK97NhVzuHAZ1
	 gpFpQ05jdU4sqeQfAhalayxPk+/cWgtsekXvoometHiACn2JVLkHI/UKvzr5QZ9C7ix4K
	 PlggOF396LrhKBrqMJSlzYFk58Q5mCOMVbVefMvNz3E0uBUL+tvhFH3uF+KYTkPqTfdCg
	 +vuCcNmpWTUy9g+vCOVxgWKZQlBsXWzvtjYh6fDjXkqbxLdCWFz5/+JLjHG16hXLhYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5O1pmM8;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E3606A32A
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 23:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5O1pmM8
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-84d5e56f876so282916a34.3
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142345; x=1793747145; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
        b=j5O1pmM85z+g5usRe2XpFeh+kgzJ+5niwtSCZ+xboDTxLNtREkq9ol1XAaqI5RxMF8
         P0X9HJigcOSBb09WyVgZixJWOsHrijNBglmM5xtce9PJFBWyF6MgwU68ds1iXZo1uTIP
         kFZYCtG4RTL23CTD2y+3E0vDRtD6lQA+j+IQ/KKYub1jp4h0ljqtkl8Ut8sWW51/6rPW
         5usSUuKc7Gw0JagGA0TG5K6pC9FRJjp1S404CX0DJDx6NqPDOkd6mHDHp3H6/qEzY99b
         qgzVzmbQddUsQtzWf5UFpc8EB4/O6pkspWEFLwBBNA6exugH2IC9PaNgZ5N8n3dW0ByA
         PUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142345; x=1793747145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
        b=uqU0aYmP7qTbM5bumNJAHlwOE47JyRghgOX2MJCrmCV1PMPVylL7iZhWOcAChPpDLc
         wmhzo0LnENqd5T8R1y6EmqJMxrY+iiCMTOYxiiGAGpjxyICj2FKbWb5nFZw7QkFP1UOk
         iiG+N5aaJN3l7d71E/8CbuRoYA/PxK88VrH+mYVwjzk+2AUDWhI0K8rkdcc09IVV21YC
         ZHwosztVT0vonZ0k8+fiOWpqvX365lGnHzTEbODTIwZAVwALApNzTQ6xxDAaiiJMsDVm
         yN1CGACPvFRInbqVuUdeP4I1lLZBgUwXwP+yzZTBjc2+guNUG+2vTZDy4zrTZxR1T0fv
         sQjA==
X-Forwarded-Encrypted: i=1; AKwUvBw0oaYFZeYAFtPsbbHyOZ0nUIFZSXXQnIW7MXCLmIVaqJPjYmh1Pk1Cw4KS84iqO+BsHV//dgAsyN5S9g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLlsJEnpb+5jZ/yemMI6r+g9GUTUQEE79GgD7b3wcfdjMVd/XFh
	aM29pLbcCpEand/MCjObY0uJEhipdr3gpQrz7VFYasYn9oflwRo9c+jxij3X1PbE
X-Gm-Gg: AYBFou3JtOZxqNiJER+YYHoNtEVTRCZpLKWmG0ZxR5Ki6vN913WXUudCUFjNfAPwXc4
	JYfts4droZ1NO3irQuDRSj2t/sRZ5RvAPDQ1+FzazM7cF+5yCPnt7eQagHVHK647Xt1kWoD5RKA
	FXiP+pSqiIYBgG0e0h7pTqdZuRHs/+L/1/0jB6PPvzMlZEZ+W+yfh4QhSoK9hEjBmspK1CmY70+
	HlYUHPnJ47kDXc5BufwTFhCpxCZ0WsezRyS9BbZ9fc4gyO8oSILGR4f1Xsc4X2Z2xZvAnWyQXiQ
	LL4CwXkG9peX1uPu9E5Ww/ZK+1Q1Yf1rtMI5hQFVmPkCTQ02f+2r2k/fGatRB0mi951Go5JscE3
	ENHkj2Zil7yhGD17ygYWOSmvOheAujo4gSgWSsIogedAxB8rhIvBCspAK8kVLmTpMwnLTOtDe2K
	pSWlbWpC0/Tddr5Ny40Gf2R2jw9RUhIrNSVsIyqAW0quT4wolikkuWwvcwIr7Mz/wn8ujhSvme7
	e7aq1dn7YGPnip0CPbNOunwoE55ybzZIJPW5ov6hRNN1/LhuweIDPReYWuKHkryoayiSHc9Il7Z
	3Kzn6wsFqporWCnJfr5atmETK9pbZO4C1mcLvIcN3kIgJvbfCUSYpCdDOmdC9CodH/IyItpUo6S
	IkggjGcwedI74EiJ0/EAf54y3n950hxBw6sxFc0XhI8V4nfzr+fSWdKzzxfGyQvwyQYCvQjbqV9
	L72w==
X-Received: by 2002:a05:6830:4411:b0:829:9992:20f0 with SMTP id 46e09a7af769-85ac0fd0da4mr851500a34.28.1793142344897;
        Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:29 -0600
Subject: [PATCH v4 1/5] serial: 8250_dw: select port setup through platform
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-1-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered.

Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
Octeon continues to skip optional-register probing while retaining its DMA
setup; on 32-bit builds it retains the generic setup. Keep generic setup
for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 44 +++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..1351523f0c47 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	void (*setup)(struct uart_port *p);
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
 
@@ -631,6 +630,33 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO. */
+	if (!p->fifosize)
+		return;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+}
+
+static void dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
+static void dw8250_octeon_setup(struct uart_port *p)
+{
+	if (!IS_ENABLED(CONFIG_64BIT))
+		dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +791,14 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		data->pdata->setup(p);
+	else
+		dw8250_setup(p);
 
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
@@ -860,6 +881,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

