Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742007;
	b=xndm/oe4RyO2kZ+YxCOA7le6+hTOgnze2d/zXRCwNVoklh/IFVQwZaj7BeH7T+ODt+rC
	 P2+lebf2p6kiHdceaqBcHE8xGaRytAGlm+fdgfT1XUh5pzMbpsZz04quLmpZBXgX/6Qyh
	 pTn38uE6MSvKI1xD2lq3qbSO7ZSeo/4YoFm3hcj6nQ9I1/XFSevpv7f+/+oHKVzQ6Kfu9
	 Bc2XsKkhE7ANH47Jno1fn+vPOg27U3D1gb/JZifA0UIj1kxsMoxjAIyF1ViSMlanPRHhO
	 AtmzzIpTmdKnG+tDH7/0ThokHLs855/NKxsyK2kNmQaFtVwB5QRjZQ5gC6lR1hHpr0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
	b=r1RbzOwvbWEqCyxirNiqnJvSdfXbQiI87pSw1nWmwOuA6FSpCqCgaWCTdbLhEJuD+0dc
	 0ZAfNlQrtjZ+PHarG5KNW4G/YVXMpOadr8PRbNOHFNPHWkORORmC8Nqo3vK2Dun3WDl97
	 ntFrw1pJXXnHP3snajdyWVDbUNxdA36yBYcspivqnxiwQ2ZCqI7OEZIkrY3lqi4c4BLv2
	 Ydu6Ehnf/qOroJ5d7Si3+vqB8TCEbl6ywT1aBqaYFotBcORYqa8oog8V2aeQl5RgyDbT6
	 mxIERJvm3fc/ywcZ8o9/aO5ReiZRG0xcGTJvovEFv685sqc8M2EK4icmzLjcSa05M5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNsg7CoK;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A83606A31B
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A83606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNsg7CoK
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-84a248254f4so19475a34.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742006; x=1794346806; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
        b=jNsg7CoKfUXXvFhbzc7PWC9JWbzIc6rgXmAnoZszr7LjaKwaq9axjXz5Ickcx0a2ak
         GdM9XZw9HBKPqesuUQNd4ZNdlAPqJqWhVFQy8ZrItO3pRMUpawBNeeCMII8s759QdfFU
         pA6X6fGTNh2OWiJtd06IcYn9LVyzS8I0MIwfyjtizJ7CmDrgxs12qn0PLJMm7vyypQX7
         Z+fSREINzGe8+vOz+CCY9BA52wryBnitjV9HVgSSv5StVsl2c1aqLjk7syf5fA2eTGJ5
         1B7XQGh8EgdnWyF54yhqVH9f8FdHkMRu3si+m8M+Jz8opGQ40NhQGY9hS6fZIzVSRtfb
         dqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742006; x=1794346806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
        b=UjA2GKRzkUcaSmfaxoJN7MGkhtBdYRMrX9IES2cGMLddQlcklF63rHPsBOIYJLGLrp
         cihQeLNftI3uMElE8hD8+hcDznpkrHzTTH9ziSllKZDR0uoVUlBW9le9N4VD1QJQfRsK
         Cq6gXP0XtNzu4gI7m+MsBvIpYoYccgucIwtF7IV4M/fqBOhOV8O0CnaKh44dHf6oTcCP
         zrf7OHjhBNWLENUcb2diikUQjxojmA4g9HXTp/Vxzh7130g0I03d8cYHh0Nal+C+6b5C
         AX15j2XPPz703jOY4szgpeYZsaIcsbKxKWPLTvA62zRppAU8ZeIRHy1hg6ai43uYxJZ4
         +oEQ==
X-Forwarded-Encrypted: i=1; AKwUvByrwqTEULKJ/AlCWei1Wj/lx+b3vR66zAwr1C4I9WlmqBCatggPfZwEucBVCerfPsgEQDXSnSdE+WZfDA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ahR0nByckZYqratqOZ+uqHXK4LWBRiS54w45AzZlpTO295USV
	9FK5veT8RM3Up8EJd2NTNWkyK/JyWIRK11FSCRV0GncjX7q68wKNb1p0
X-Gm-Gg: AYBFou3czXJPWmnwpjgmiAWjdbYfTh6jDGdi2ZWos7toMAjqBp348Y/JjlmW1MxCUiV
	e0wszImQaO8B3OZXDxyY3Osl39CKDefwOGuU0y2/3iJCNT5sF7iQL9n7Roi2GY/Oir06zeEpKBX
	Z27o8f/WuCN7l6Oa/uoRBNkNiBZS9NGrSo1OKopUDhr6Wf4U5UOv9k3T8DzV7jJojTP1xfwnk1o
	mKy59U/0NyT8YalvyCJ6VRyWDPxHJ9T6Asm8FUorWjHHildOVbUts+j6Lclkqxl9E6RqJQ2NOcQ
	frbJNiovFkxIcdiroQcE+vK6cOVrZwpJEtgE7rclrk+rRl2x4fV5g3fCkrraDJyWYR/9PRoHHmg
	J1p8OChuPkXgPcLFd9Ie9f+9yTQaPgs3oHAqWdV/rJhtKgvB0oDCFBcAGPBJ9PMx1MRtZqTp1EQ
	n9t9YgiRuJUzveRhIDrgMgoblrdeB+xdT7pfFctiyai6eG+9L5KEGqC4VCI0u9x1rBuT+Ofoudb
	drNEEupWosXUgdw0rVTYnpJvZ9ICr41BNqa00fAQOd01X3glJBh1ikNGnMSC9wtKbMGUEu/RMIj
	ArWgR/8Ap5riQ6uUFRwRrv6gQKWsn+GzrWYBJAMPgwDX0ulK6ASvwk1LhvhQgFgw5XxrU4b/dsW
	irVDg9qZJ3M4CiqFEoN4ir0JSDjbboh5/7CPouoYQ1Rdls/RHtirMmkghNAf0QIAFrYDaN//5Jg
	i/uZTs4b/KlJPbF3TQxMCz/FXLxctMDxx2CclZqrSkLTybM5rkgCf2
X-Received: by 2002:a05:6808:1a0f:b0:4cb:26a3:a0dc with SMTP id 5614622812f47-5640deea675mr10671861b6e.20.1793742005972;
        Tue, 03 Nov 2026 13:40:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:54 -0700
Subject: [PATCH v7 01/12] serial: 8250_dw: select port setup through
 platform data
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-1-c9e248d685c1@gmail.com>
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while preserving
its existing conditional DMA attachment. Select the DMA setup helper
directly for this integration. Keep generic setup for devices without
matched platform data as well.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

