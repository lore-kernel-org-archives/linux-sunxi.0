Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649327;
	b=cgQX7GH2EOmVH7nmd8As/jYWhZnn7II+oQty3u9EPZVw7sQoXSgioF+hZct1xMI/hdfC
	 ZyWRcrECFosRfoCTFpltdWYzeFU/RePCbTD7Nz04s0XwOM7neggvIosC/aSbV5Fog3SvE
	 epfV+Vn0Lyc8NuudX/tnEbSDpnheX0fODi0lK3hd+EVbx1NPF711vRMx0AmukBA3mgPUj
	 uJFlg+kuw9JeJcVhVcrQLzDnuT9G6ZAQtvMTCQqZXTmwp9XV7a6u8a2Bw5fds79jZAuT+
	 GOYJKWFF/m4dWryjayYBQ9uzyo7wz0hGQMRpvJAzMZvOUZIDtFkee33SxK+SIEu8Q4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
	b=PWUqwbLBnMQakcR0WnmbgeUqUOxNqnPOARQVHD/nLb8lq5IZ7UVmgoBQ9kDphmmTfLxy
	 jLLJTt0anwKSMQ8kLzmfSWATQfO+iwgSJ6b0zqOWkG9QLyyozjLBtztiEzaXhkcTtyqWq
	 a3xzjJOvQTf+7jOKbRiD1iceCWGFkO1RfMWdWrFAh37Zb4kpM5yAXLSXvj2AwX/uVjeE0
	 8msPmYEPCq4NrG1orQgujit4IE3Bt+3wZHp+X2keLBvE8A9Cdde63VD/wVrgwjsN+X8SD
	 Bvrwi/fw7rAYN/Uh/f+ryafFT9Rz32Qh+9WVeFQ/WrlXG1SEGBXA2/0Oq7ep9HQjXRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8OsKLQ1;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1A606D818
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 19:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE1A606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8OsKLQ1
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so669890fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 11:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649326; x=1794254126; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
        b=x8OsKLQ1t+zIB03RiRkQGmKnvCwB+tp7Pl1Qq+wBDf4gvKWp55FhifDxiuKiw9ynXT
         Y9XJm/1zYxRSSaWLODTaXE+HpGMDevhXFQX4UQKuK+AOFwCEK1RNZRg7XaMt/IkKkNFu
         3bDMblTdmKSLUkjW3yiWmw8jD5uvpxrIijI0u+zdmiyqg/M6iuC7Jz1Zx6gQXUOfWvse
         aADVu6fYwIOY7SdgX/QlRp/2SP1mncQlGjAyuqrk7CxDIdzdnxLHHndPLZNviOJJG7e6
         EHz7awgem4JBqlnGYGef3H54TJUuiXf94NU3nn2fpgaK6pMJj0jiJsnDyd3O1mZNDY5v
         gqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649326; x=1794254126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
        b=D14LjB5JtzXmAKIymZjoywf0BI8/IlrNb6nkwU5MClb3wbHHsnUL1s5YU82hMh1J6b
         lZ/il+kWoJ88Dz27EH6MXQU2wNNuxc0KTKoCxpNLj8Q6UYlz4gkL2HB2LsLHBHYSsGL3
         FP8vlrTNQ5J4OzFE9nx4qFcjxWD5kF2sBei7DxXKNudIH7VXiGgr303RTxb7VG6sdV0Q
         im0SJjAIY3NF/aKcRUcgePBbKOd2wcpXxaVQdxcIBSULOehxJI58fckqBS6jTNxq5p75
         dM7EqZ876SdYOJRnc+v/CwqGIETHaoi+vuPvwi2dT6jHxj0pkpPljhP++uHJvrb26uGe
         OOaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwLlkEOlUx6gqXjiPn74BOiDQiz7BbQn+axgRnaunQk1rS5Rl31P0jAQWX4IvDJMRCLFo0V0m6TpPzgA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8y/7ofFr4lb1jtAYnAB3VYnjCkxRSWS5n1qbe5WGR4RWdc6tc4
	MiFGTxj9p9siTamWDNk6W5wuq/pWXzYEtoYB+17WueExDA4on1BS/qXO
X-Gm-Gg: AYBFou1xtNK192wSGkFgk0UABu/6Hci34crgAGkun7iiFc/YH7lMObaO4HNITf4qCS0
	brHR/eSWll5yBo4tLV0L0VxJ1ZvRjDaTdE4XhagBvkcRKb34B/tHZOOFD+3Mk373KDtPOeQftlN
	cgUCiRofvZoNgeXBr0zw7GFl6jJYDA4UmPbCJ4ZO64au5dNvkO21Ht3paU8XfA8HUz2hzNRvk/b
	29KcGxJya1nCo8kAC/i/P7l9iNWF7l8QX64+UkE6WYFp6yM7+y6MKwCRDN78fIkXSDibFV5i6YD
	E7CDol5vBkQ0qVz7mo2lZnv8RKch2w+KMppQRrUwIknVlgxNTYFhTk6137v8ZhjAF/sazXq/Mg3
	BtHsq8PDHxx6CPIijIjTBljDOPcPzEbw/Gt77WTKGYBCoNkNo9ojV/Z0c4BFSkQXDlwzSpSoyru
	x0ZaEJw/jZgpmB7GuC3yUb6YQRU0F9Fa/xmQrg59HOnZAl6FrnOalHzwkyXfR1e6sXfM3GFb7js
	AfMWGksSmrRqZXsD76AIbSqCqsCqGW01og1tcEz2+tb1UQRrqH5bTEePSIGi6vmsU2zgSNCG33H
	8/HjN8lwPzmJBy8I+54F3A0dw9oUAN4KgD0nfdVAEy9LGLoDkPphlg0sFw2tacykVQtIFAt66c6
	sD9TQ8Ii7wfhS6GmWFB57vPI3II3tkzVAvbsVfipik7w5sqvx8Oc2lUJZTSdlNTnFTXIQFXhFjQ
	MOqXeMuCZIc8DsiOhRLNvuCqXLs4QInW2MWIRcP0iMJk6LKMRJHP8=
X-Received: by 2002:a05:6870:ac96:b0:48f:e21e:1e7b with SMTP id 586e51a60fabf-4a9077e817fmr6538976fac.59.1793649325629;
        Mon, 02 Nov 2026 11:55:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:16 -0700
Subject: [PATCH v6 1/8] serial: 8250_dw: select port setup through platform
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-1-25afcb346b0c@gmail.com>
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

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

