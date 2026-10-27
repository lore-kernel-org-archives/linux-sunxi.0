Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142351;
	b=Ezj0kqXwbo7eSEEUjpnyaxA1cq9Njph/Lx6PZeQtv3jP3/kZZ6db/cx0/b3WTsOUL6s+
	 8YyMkghKvrv/lOVDvbbuA3ub6eKkaH51+657CqQcjCb4hU1bRMNt9imwmTv6Bq3PWKIMr
	 FBcBm+j3scGh28hDcDNkj23pDREWYqHTsZ6S724TJ5Uv7m7dqgahbYVb/c33hV+ZP94ZM
	 pvcazbS7A2ZWnmAP1YDFYBVLGxesccKPSeH6KniMqDG3OudO15dw5MEV/tFtT1Pdwj2nM
	 evEpsjjPfuuhvK6cuO8HCAWcq+RlhewGCvtUK5HbODmEt+c49NcSMmaTUVtA0F7PUeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=;
	b=WrsRAy3roD7/VQq+VwOrP35EXWR4nFp/Y6xcrYNluYiEE/HztMivz5jMP1NpvDn19S3S
	 pj4ZKO0TELDRRlQ2sOUxnrcfZpZqKbjB6NEw2iA19mjNxtnei8ckv1lzApQjnILvEzHjx
	 R1fXBY+PXnw8Hq4tKR1WPih7f0XRJgHu3LWVTpXRcM1YZJyZ+9GTMWQOMUzyCXz4f6kLk
	 C/1BCRkZljE259wJAUldPh4cIdKqWzEqricIlWNue+nX1pfbK/0jhiZq+e1XqD5wOtUQx
	 u7suh5UeOivIScyjh7okXwS8+BYpZmwpyK7TD4kMRQ5uco9J4y3HeTbr6E0mrUjNKkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYEHzvnO;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF94606A339
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 23:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF94606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYEHzvnO
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-823e4047037so283239a34.2
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142350; x=1793747150; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=;
        b=vYEHzvnOnYNfRbrXHcbzdaZZfGb3lyfiYGkW6s4eWEXh0FB68Ahd/JeP35XUn6ywNz
         e1Y9kKdKYmI2vZpMV5sFK7v7opZro5cJqjUh9outwdOr9Q+9iyuJHO3uq3BYvcAyI/pf
         cfz22jygeudcNogUEfMFkc17lKHiuUE3+YQ9BJXqSFjKmLvpHTvLfMPEsy0HEF6zZDCC
         Nme7R762T8C4XlU320YmcijxYIREIAhvufqMRjbn5IlKhvx8ixogT0719tWoUjjLPuc6
         XO4ti61160MTYwl1XUHzIgCgEiYWybTClcb1MdWN5/sG+U6g4+v7xU8jOSgyTpiAQNT2
         4cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142350; x=1793747150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=;
        b=D4Td1fmZlYh2mKFwKaN97Q0Dj/R3Y+dOd8MmiMS9dGwn0YGlQ7dY4EoOZYTD63UkvY
         XuzLG6mvIb3DiX4BYZrk7ivPDMSNMRn+jP9vkJW9tXe3SUDIL+SBLIB0eEu9ab4Wjvsz
         wobYj3PyBsf1BjC9c30lQwDLdJ5UUnDGI4APAu7Hcb+w+nIc57dy10BjjIIIO5mGvDbj
         aApsv1+LqP5+78H+GHQpf2xr8Uh3bFXWw9rOZiNCLVpoQNJZBuTsj5LOTSmvUtZKlpln
         +qlfHWvb9fXnJA899Uk/5HMYM2WmZ/wvqsikh+IiIGGTc6Z5TFRADRKaiTAYt8HcCN2X
         K+yw==
X-Forwarded-Encrypted: i=1; AKwUvByVg8EwwjYfxx2Cc4oBON78sepMDA9UmRRfgBY4w+EOi62i9mZF9Rlat+4nOMotBYZNZP0FPnaLXUlfyQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLBaG8xSFSy5ySdqcXK9Z+zWwbbg0t9CuksVFaWkrOJgkFGIrlc
	cAhjpoPTVCi5b4l90OlBihGEU9RvM5Gg5Q5gvmUNYRX1mIT7qgEly/nkoft0ZHY/
X-Gm-Gg: AYBFou32qwVfk/IUd5m7Fm9lrDbhNufnDFSSH7OyVlVY3+cO2/kkN0gyJMwNwIPibKr
	Hz+7O8BtZ33tYN8r6em7/2L9UkhDrEzbVYs/Kuoq8zBBFhUAm1yMKq5Ti0sF/XZ86ayIJ4x/iz0
	sZFxfAi8SC+I92/u66XSjW1MZpYcaILzoI52Pi2GEwBzs3YHyQsNm5JsNkILbcRIY2ibewBQndP
	WYJNgwR3Sr3Ni5MJ95sj+Ni8+uC3qEPlLsM9ryGbA7kpbdq3jXykCkEWoU0g53/yt/PXC0lrJsV
	05iOlKhed8++IIa6vhbfFsVxYMb1MmyxO4h4IsN3NNpgKG8H8tquSdj1DCb6rlMZAp/K2Xj2J6u
	ErN36gdNQNTxvBt4ldGgvr71Lemr4cEn3uto3spea/SqPhkK2RvgQLwWREuKbhagV40jeUznDrJ
	Dl9Vs182pFN6umcjC5i9Yayn+PBeBgSA3lLF/hw5+ECZV4L7B87+4FnLmMf1XZu+vIq8AAbRC+V
	rzpf8EAL8bra39IgrGK9UnU9jEMF3IFl7bxt5+x9PSJn88r+gkg8T/tNIcvngXcpmQ/z8uaA6nH
	PJ02HV7hmZHprjrpLAUE/36z3YIgFOWsmxMJBTe+L2M9Ub+rW4jtKBp4siKoFO7Dr+VXHq+vYOq
	mvBjFxQ+2iKwVtwumVye1XGnHPFMbpdeH7PJhzzKOVAkHonyGrjcZGFc9JECfGVHxSPXHgLfyzz
	5T1TP9CoxatoLn7MGeXR3Oy6Q=
X-Received: by 2002:a05:6830:6412:b0:845:8d86:9f88 with SMTP id 46e09a7af769-85abd032c43mr884141a34.15.1793142350443;
        Tue, 27 Oct 2026 16:05:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:32 -0600
Subject: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platform
data. Use common Allwinner setup helpers to configure the transmit load
and receive trigger table from that depth.

Derive the receive thresholds from the documented 1-byte, quarter-full,
half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128
and 254 bytes; the normal 16550A half-full FCR setting selects 128 bytes.

Build the threshold table during setup and use the shared 8250 conversion
helper to select the nearest lower threshold for sysfs writes.

Serialize trigger changes with termios and hold a runtime PM reference
while programming FCR, preserving the FIFO contents. Propagate runtime
resume errors before changing either the FCR shadow or the hardware.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Select the fixed configuration through the platform setup callback.
H616 has debug-divisor and RS485 control registers at the offsets used to
detect DesignWare hardware RS485 and fractional-divisor support. Avoid
those probes and retain the BUSY-safe integer divisor hook and software
RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 94 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1351523f0c47..2f156c01c5a1 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -63,6 +64,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	void (*setup)(struct uart_port *p);
 };
@@ -81,6 +83,7 @@ struct dw8250_data {
 	unsigned int		in_idle:1;
 
 	u8			no_int_count;
+	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -657,6 +660,89 @@ static void dw8250_octeon_setup(struct uart_port *p)
 	dw8250_setup_dma(p);
 }
 
+/* The trigger is the masked, unshifted FCR receive trigger field. */
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case UART_FCR_TRIGGER_1:
+		return 1;
+	case UART_FCR_TRIGGER_4:
+		return p->fifosize / 4;
+	case UART_FCR_TRIGGER_8:
+		return p->fifosize / 2;
+	default:
+		return p->fifosize - 2;
+	}
+}
+
+static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return data->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int fcr, ret;
+
+	fcr = serial8250_bytes_to_fcr(data->rxtrig_bytes, bytes);
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
+	/* Changing the trigger alone preserves the FIFO contents. */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+
+	/* Allwinner RX thresholds differ from the standard 16550A table. */
+	for (unsigned int i = 0; i < ARRAY_SIZE(data->rxtrig_bytes); i++)
+		data->rxtrig_bytes[i] = dw8250_sunxi_rxtrig_bytes(p, i << UART_FCR_R_TRIG_SHIFT);
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+}
+
+static void dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->tx_loadsz = p->fifosize;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	dw8250_sunxi_setup_rxtrig(p);
+
+	/* Use software RS485 with the Allwinner register layout. */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -878,6 +964,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -929,6 +1022,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

