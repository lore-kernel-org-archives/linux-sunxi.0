Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280400;
	b=w9FuZ0xEHP865/kj3BcSwcNux8DUzeh7CcGFwzlZB9D+La++BvVxb8l5IzfG6F9hH7u7
	 ThuKAahHtT7a61iRaf98LMqE2Ze2yhwOcpkIbeN4Mq84si+cg7+NpvrJ36L/XD5WcGfSb
	 KLbfoAI85atRWzRp+VEor0vuAYJOajuDVcPgrIHSDyBYCKKxwIV9ykDfNtu4OdyASvBFd
	 16ElWMyUOEry7r31qsp0QEc+HmLGCYkpJLuXJCUsECNmBneGnSQrrnbfbB0slZnVStcWP
	 WrCIl5+dx+wafW60jn278cfZfIX9VHGDt//SzwwuN9UeeovY7iw/sxX6UnnVRKK+UpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3G3CWQIL0JbSsmfNksLi3Fp/1YxbYzf4T7l8kEzH84Y=;
	b=VYYewuH0uHl030/bXQp/3NcRUz0eoIzziW/JjkQPUd3avGD8pXqMNdrDYobwfDKgVUop
	 RyxrE79uz0xGB/lxQKDeFAFw+cweqFJx8m00EN977Hz52OA49H3hIjKslqBhyiOkQKNVT
	 +peW/gxoP7aJ2EmnOwjxJdDLvri4VadJ10JgNd587ojQjRS0M0aTfwCV87fAQwWtL+1EA
	 Wl9p0pr7tnjGFBR+b4NgRFGTh+Of1/FZK/yf9EECa+8h/A17e8E+L5nJan7jimYweNiHd
	 TAKAoDll+ukBRVsO6lN0MLHKsr6js+ATpdkFYHnQOIj+/42pKrcxACUYpGas1w0E2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mL6iqc/p";
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BAF60A3818
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BAF60A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mL6iqc/p
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8241a56cd70so1004011a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280399; x=1794885199; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3G3CWQIL0JbSsmfNksLi3Fp/1YxbYzf4T7l8kEzH84Y=;
        b=mL6iqc/p2qBiWKvMYAGfFIurmGkue1Joqx/py8zt3pA7AA3hMEYVGRq0XS2duZ1OJA
         uW0ZJstYU/dA3VVe6uCHrIzOaKnjgY+mCPFuy8UHVbHaHaJ4whKznYDXsIfdgCZycnVi
         2jt3VfUrBnkXqS94kHAQ02dBhehHA/9YJ7yKiLkKiXgUuj3xB/MLO+iavDvHK01UiV8W
         /UyFhKuTjs6WdeT+UxEGjVP1m2hVH6jpDqGOhxqgF4z34nuFCsmNycPEx1c0rfQUIJgZ
         +wm+ZqpTI/kZAJ7XMliQ69gxmSLB6efyj8r3W/3V8NFYOkWgZiHtB2Wse8a7PQjNtuIm
         jP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280399; x=1794885199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3G3CWQIL0JbSsmfNksLi3Fp/1YxbYzf4T7l8kEzH84Y=;
        b=jYcqWFTWh/p1dQc/uMhjZNr02SjGHtR+VNnk2rP5iyTYdN4Uajv3cJEPOc4A+pIjge
         T5WW43MrKXjiEEfKf4sVoPV/Vva5iMAPW2LUI84J0DXz5kcr8umDKxsr9Nb22S9tEdKe
         y8h+jbA1YaDb01taBwhXGgFoGNFv1y2mSshyRNYfG8G/A72D3bDtQ0Cy07RZfmyzUXmc
         BGQTIFnEVUDWvbjQgVA72PBjkvHnROC9yvfr4VNKePkzolnko5vuBNuVb0S3Ul8lUFED
         kKAd0FkSH2FdRfApGkrzab7sIufme3pxA/dx/K6TCFV0S9j9qPrvuHssItpc1ASv8rdD
         awGw==
X-Forwarded-Encrypted: i=1; AL+hErHM98nc35iq+Te5WFK7WugCynOgQmA82Q73uYmXakCnkljJ4hqXqAG8UDxIvVQO/dN046eVHk2sN2UtgA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9hf8KNcf2jDFGrgorynuTbCZlaD2FGxrDTD4vAEVgpctG/ExiD
	ndJPSsZk6CySyFPgo+fKuJLmORPF9Nd2it6Q0lxzziTOXdlIUgMSNksO
X-Gm-Gg: AYBFou1VZ6SIVXXB5eno6qO6BbxHQ+qauYrwQJTDranFzDZz7JtXP+uHjdZp9SFSLZi
	5cWfPPeTwYV+xBa5QB/wfZCvzK9ojUVOyfXOveRNtXpUtrTx7ZQdSEPeedl3qDy4NuxNJxw47V3
	41i/hoYMbRQBKy/aubk5KnAHxwHNV1+qlb7/dfq3zsAoGVkatXTpPXzf3Eshutf8J7vRCsjcnhQ
	Oio5eVqFxoZP/uGEgC8Gw2T0Qf16xn1ARX3EsmSH6immugPyR5AwlyDIbQib3wCMR8wVa8cTcQj
	nDkR1KL+lSX3QIAWJ2iE4u2fr7FZNH0d5cbS/2f5DdKoGBPHuTPeHp0NHLkmsxmbnEyvXoY1iqs
	txM+ppj++OIpcmcY3ZbLMu6vpGrtGSpfW/4V908DUEktWKM9fQSfC//MJMECvkKZuoN7sSYwUXY
	ZS6LCZpCC7Qp3yWU/a03zKOVUiZMaDh30Fvq6FL8FnZBeHdcsQX+HBMcqAJ0FEyLIWDYOGK/nFd
	Y281oe7Eliw6BiOd5JwLx+3PqQqV7f3IVvSFhR30rO7LjkpkNO7xKMQLxFvmiFKRr9MWivKQIWs
	RUsHE6YK09T2PmuplINytoqbrm+keaUQF3JuQ6gyf9fJi7dRAUgMdlRm8j9JIZqN+UFT3VSUWeR
	sqS1Qc5Betzf4SF+ZnfhpmGJExRpB2cj28EWWk9zJmGhTotYTGcfVjz+eHFLJ2lZSYVQAbiyG1B
	DPPyh4w7ozI5jwQ+E5dXsvsQPnVctblWUgj4tm2WVoU8DaVEkDqoyW
X-Received: by 2002:a05:6808:c22c:b0:568:e61:dd02 with SMTP id 5614622812f47-5683cccaabcmr1071675b6e.43.1794280399379;
        Mon, 09 Nov 2026 19:13:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:55 -0700
Subject: [PATCH v9 06/11] serial: 8250_dw: derive RX trigger thresholds
 from the FIFO depth
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-6-3f03961dae8a@gmail.com>
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

DW_apb_uart uses receive thresholds of one byte, one quarter full,
one half full and two bytes below full. The generic 16550A table describes
these encodings only for a 16-byte FIFO. For example, the half-full setting
on a 64-byte DW FIFO is reported as eight bytes instead of 32, and a sysfs
request for 32 bytes selects the 62-byte encoding.

Build a per-port threshold table from the discovered FIFO depth in dwlib
and install receive-trigger callbacks for CPR-described FIFOs, including
LPSS ports. Keep the setup helper available to integrations which obtain
the depth without probing the optional DW registers. Validate that each
threshold is positive and representable before constructing the table.

Serialize FCR updates with termios and the port lock, acquire a runtime PM
reference before accessing the device, and propagate resume errors without
changing the shadow or hardware. Update only the trigger field so changing
the threshold preserves the FIFO contents.

The FCR mapping is documented in the DW_apb_uart databook, section 6,
FIFO Control Register. The existing default FCR encoding is unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 87 ++++++++++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_dwlib.h |  2 +
 2 files changed, 89 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 4a06dec6e263..6cfb7674ac11 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -1,18 +1,27 @@
 // SPDX-License-Identifier: GPL-2.0+
 /* Synopsys DesignWare 8250 library. */
 
+#include <linux/array_size.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/math.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 
 #include "8250_dwlib.h"
 
+/* DesignWare FIFO-relative receive thresholds */
+#define DW_UART_RXTRIG_QUARTER_DIV	4
+#define DW_UART_RXTRIG_HALF_DIV		2
+#define DW_UART_RXTRIG_FULL_MARGIN	2
+
 /*
  * divisor = div(I) + div(F)
  * "I" means integer, "F" means fractional
@@ -208,11 +217,85 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
+/* The trigger is the masked FCR receive trigger field, in register position */
+static unsigned int dw8250_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case UART_FCR_TRIGGER_1:
+		return 1;
+	case UART_FCR_TRIGGER_4:
+		return p->fifosize / DW_UART_RXTRIG_QUARTER_DIV;
+	case UART_FCR_TRIGGER_8:
+		return p->fifosize / DW_UART_RXTRIG_HALF_DIV;
+	default:
+		return p->fifosize - DW_UART_RXTRIG_FULL_MARGIN;
+	}
+}
+
+static int dw8250_get_rxtrig(struct uart_port *p)
+{
+	struct dw8250_port_data *pd = p->private_data;
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return pd->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_set_rxtrig(struct uart_port *p, u16 bytes)
+{
+	struct dw8250_port_data *pd = p->private_data;
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int fcr, ret;
+
+	fcr = serial8250_bytes_to_fcr(pd->rxtrig_bytes, bytes);
+	if (fcr < 0)
+		return fcr;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(uart_port_lock_irqsave)(p);
+
+	FIELD_MODIFY(UART_FCR_TRIGGER_MASK, &up->fcr, UART_FCR_R_TRIG_BITS(fcr));
+	/* Changing the trigger alone preserves the FIFO contents */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+int dw8250_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_port_data *pd = p->private_data;
+
+	/* Each FIFO-relative threshold must be positive and fit in the table */
+	if (p->fifosize < DW_UART_RXTRIG_QUARTER_DIV ||
+	    p->fifosize - DW_UART_RXTRIG_FULL_MARGIN > U16_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(pd->rxtrig_bytes); i++) {
+		unsigned int trigger = FIELD_PREP(UART_FCR_TRIGGER_MASK, i);
+
+		pd->rxtrig_bytes[i] = dw8250_rxtrig_bytes(p, trigger);
+	}
+	p->get_rxtrig = dw8250_get_rxtrig;
+	p->set_rxtrig = dw8250_set_rxtrig;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(dw8250_setup_rxtrig, "SERIAL_8250");
+
 int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
 	u32 reg, old_dlf;
+	int ret;
 
 	pd->hw_rs485_support = dw8250_detect_rs485_hw(p);
 	if (pd->hw_rs485_support) {
@@ -258,6 +341,10 @@ int dw8250_setup_port(struct uart_port *p)
 		p->flags |= UPF_FIXED_TYPE;
 		p->fifosize = DW_UART_CPR_FIFO_SIZE(reg);
 		up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT;
+
+		ret = dw8250_setup_rxtrig(p);
+		if (ret)
+			return ret;
 	}
 
 	if (reg & DW_UART_CPR_AFCE_MODE)
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 4d32651956ab..b896dd9bebb7 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -86,6 +86,7 @@ struct dw8250_port_data {
 	struct uart_8250_dma	dma;
 
 	/* Hardware configuration */
+	u16			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 	u32			cpr_value;
 	u8			dlf_size;
 
@@ -100,6 +101,7 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
+int dw8250_setup_rxtrig(struct uart_port *p);
 int dw8250_setup_port(struct uart_port *p);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)

-- 
2.53.0

