Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911945;
	b=ihlj9UpvleijGuk07sMKKAH41aIBM6FJrUDbo8TjR5Uxkx0IHc56S9NqftihK/GffD4p
	 gQ3cFSrS6Lpz5Qizg4EFsbDguqlHF9RIFxb/NsCnah39Z+S9bHVBKIKN+CUKPTPeVonEF
	 Tmwf/EjhWc2+MX891B0UK163UqnyGBf7f67XNtL+ZJAUV+iLOXL8USbGyk68u/U0Vf23j
	 soBQ59lEONphXUzEtFoLuiJZmzW4HnXLRZ911lw5Lc4yNf6vXqBGZh5LcgfKw/bphcwXQ
	 RJLzoV6NkiaysA3MGASMbOEXObLh3qdrk2Nu7gChlyp9jHQFLy0wAPBBq/5WSFCllzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yx/SQHSaECwO3aUrTwOJ89YfEk3M9Oew8ijNhTPXOi0=;
	b=HKfyam/m00rvjXSr9A2iytpyzgrKFJPQ5/CBTXyW2QzdRad1A1okJFyR9EjE1N0iIoQT
	 KXk6OAhqrVU4NHW/RkjJQhHks0hV06iWqr0yMI2zHqx972b9xGF6mLzeO8klvhFQgTnS8
	 jdSJtuoU+7MTd2fTMzkO6I5k1hdGtwr70kYk6jDZD7/+yc1U+zSvNLsmCuUBeWtObp7ud
	 hwdMkh4ab+Ej014NtDnSOXWHk2Qc5DgU8p9Ls3q/x9z40uvHMxRXyGJlXrLHl80B9m4AT
	 tm4ZBT1gpRx0fN0M7DVue6kZZv8XVfjma9UwuITOj3BRkI9sgEpzm/k3StkdbM5A91w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfPTRMv+;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73877606D803
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73877606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfPTRMv+
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8256106635eso10842a34.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911944; x=1794516744; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx/SQHSaECwO3aUrTwOJ89YfEk3M9Oew8ijNhTPXOi0=;
        b=yfPTRMv+/XViRw9rL1uNvPoRMGeAeeWjWNEFqKb0QHuY1qr1fhEoGuKbJXFz0iKxfI
         CHJuiWKTBD56fWSlrLIKPY9hYo5Egx8ri8R8j0vMCNa64zQjOQiTBmaulCghs1OKkmp+
         T2rzli/E7cGGtZtd2iOP4E1rvkMBh5W75rN8mamXw+8oV5a4ZBS7jUBrSEIo4dPz9KvD
         QVr5XZTsAuH0BP1seEX8aDAOvrC7A1beMeYQMDJq35ztyQZ2Wns7B9C3hrcHUJ6ZHH9m
         9nu5fh1maWN3v8o1mp11lMoIJIE7cLE3+xXeMgIh2qdIjyWgCYqG0mh7mufuyzsX/bJf
         gOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911944; x=1794516744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx/SQHSaECwO3aUrTwOJ89YfEk3M9Oew8ijNhTPXOi0=;
        b=qqBAHNMdzxI/7Gf5Lj8lWP+cHPlP2uU6qDl0Ib2Odx+BL0Tt/CPIx6vqX2GoQdag2r
         1KKF263Ceo2/ZmF8mMht5gVFytME6GnNChT7igf6coEV+xU+9/69mfun/FfmkjT2e2sG
         yq083teN0iZzV0Ov0erj2E8+twWzFFGuk6zFyidLmRwkEWsHBu9f/0/T7FSvQsROQL5N
         3+VSZ8QThcPWBk+kVpelj79j6RqdRJBocbFZ3kudNwvdhd4b02qKOqLlQpr+2xXa5JwU
         cbImvoGx2mOlUm+H/ycV2/6pUP4XHec+z6vpF39TEXhOcoCV7y6oSzkacZmkrrQg65M5
         v0kA==
X-Forwarded-Encrypted: i=1; AKwUvBy+/CdPjpqbO6SUgT8mCkKYJ6LRSPI4BJUY8fJshuftcgyExPNf1A9e8SX29WJEzc95TudxjY+6eJ3hnQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/eCDb9FleAzOtKG0Cny/PHezMvW5Skzp4A6I8IvQAph53eyrDq
	JhGld+DO8WIQvqOaHTnIA6UvLRGoU/BS62sKsGzx5mQLvqr41ZzgGL+P
X-Gm-Gg: AYBFou2Djq7F/6fD0YtIIEn3sHzezhj+fP9b7Uk8GJ+I1mBYHwBZ1fD/1LxiTvWcAKf
	gzQ/IhgfTEFvLzzhuQt1API2YXmeiwHBC1O9TL4iZaQ1XEMKj1NsqGghA4aWc2KH6Aj7KiNTz4n
	WzX3HlLxttw4p/UyhtL9SZSTwHm5yMXC00+S2B5c0w0m1PRq46z2K1LSsRiARJDnxbLj5ZzuSDQ
	8LjGRMn9tBS43ax5H7n3NmDOo7rrDxSqsJC6MGCGjKMwrn+NiQsE2Qyc1pgT4aPLo8rtMdk0l4d
	Dna+KW079UX3vyWRn8pOZfl8lRIZdz63BSyv2VRFPZBMn9waCrLpHBVA4olOZtSLTIXYm4mVGcV
	Tbwr3ps6nIJnqne1dsVkzIBpevmXP8vXyQCmMNDnqIPQ9JKZsM2lvC8X5jCJ23vyRT9GgT5Y3Bj
	k2jPFjxt5wu+CqgLFBfK8BW1MTj0ebrUxjzR43ddtfyKRdexmX9WFtDZsbj4tZ1R9XZiifGm6CD
	ahJcgyoV7i48qHP+nbcxXYlEEFrYILLxiLYmiJGaBdGHY/mLZlDPF1rVugBToj8kHwouP0/IMHX
	4GEwuSE1DhUGOIsExzcmSfjOtwH6tjQgDA4YTslaxVmkM/MiazEicUDN2Po9v864wSTjqx7FV/K
	JAIvLNaapObziCc1fgMZwLbz8mePrGi6crcrU+UtWVnF+fuQgLZ2ee4eJu/vwSaPRH7dKsHSbEz
	m29h76csL1y+nXjPcWDtmy47An7o4AN6zUVLVrbVgxNkc0wdcKFAE=
X-Received: by 2002:a05:6830:2315:b0:81b:bfb5:26cb with SMTP id 46e09a7af769-85f1cd702f9mr700233a34.3.1793911944568;
        Thu, 05 Nov 2026 12:52:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:07 -0700
Subject: [PATCH v8 06/11] serial: 8250_dw: derive RX trigger thresholds
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-6-14024d2b184b@gmail.com>
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
 drivers/tty/serial/8250/8250_dwlib.c | 88 ++++++++++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_dwlib.h |  2 +
 2 files changed, 90 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 4a06dec6e263..004817cc8f28 100644
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
@@ -208,11 +217,86 @@ static const struct serial_rs485 dw8250_rs485_supported = {
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
+	up->fcr &= ~UART_FCR_TRIGGER_MASK;
+	up->fcr |= fcr;
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
@@ -258,6 +342,10 @@ int dw8250_setup_port(struct uart_port *p)
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

