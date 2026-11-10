Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280395;
	b=DH59dfVmki9ApZMCtVzEzWE2zTTHlq0W+ZuKa6TZQ5XQscpUwkNlPBObHzBBvBdopWOE
	 g5/Ib4ghK4oyvXG1J57c88dvnfy9Gk4FEwklvXFaMVFiHXfqocPY6pISuWXTAE7SB+48A
	 mgtJAKuyOmkWjqwLTsZ9oaK70pRv7nVNwKCYLmAuNFoPUM+Ima+2mfP3SQ+Y4MNShlHMS
	 TyW3htecbxk+EELgiS+QyJOsYpxR9/LY4VcrX9eaa9KqcVFaqkqZoLH4sPamtK/YiNWfL
	 Si48hZ98w7ZLi0zIOnOfeyopwPuLbdMDTS2Om+85sqUtREC3KIttUyPwLbaG4lKFyuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=;
	b=bpEuJWj8Exm7xn5ScMp6Wjp2IR5fnJjQ5eXYhfAByS9YjsoZRyhH4cjfVI5iPpC5PBS5
	 LG9LrtUFa3EExhkPchBQkHAvFvG8yDbp6ftVPZiStAW9qO9sQkhc8rexO5KkguhKTw+Du
	 fnYL6T8DPRtzZMBuxc7PU6OCxZivduKQLcBL1t958BLyXMyoapiduZxmjktesmpTp2FNq
	 oMBhbYyYZAfkC1usmaF4n3XzqjafOav7G4mKGjeyCBd9vKBuPZS47Mgh8bQ7Le8bIL2vx
	 CyZwxWjfUy5ws4/a7WkLz1R4XLP/HrlXlTndXhFbDLGaDrC/PYwYJGQ5QJBGMlGlj0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFIUryB8;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5592860A260F
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5592860A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFIUryB8
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53656465d1dso736543b6e.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280394; x=1794885194; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=;
        b=fFIUryB8ViVWwAmn6CwiFxEOtRRvGVwdmLUn5rfwkLFYs7ebCEQHkxJfAqH9RqqB5k
         xOeEIX8Ye3/EXSD92vAQXQoOs4Yp9/+XUk2B7lG6SYazVrCWdeJqPFfK9UMTvF9mt1EW
         77Ts/OCwKFmT2bQ0mXhWvCHIQ6zBIn3w7XGlnS/3JrSyXKPKWyCGgSz27PhGTI2MGzKQ
         rEOlb2p105cNbQDYw6rjxhaJgcyc7pKROhc3Fvdgr4dsw2GwZtrjrBC9jiVkB2c0W8Pd
         tBdb7b8CW2VGvPzI5rbrmt8nw5PbTbo/LKdv+kcZ77XbW+1ONoK+vnk36jksB30KTQoO
         qjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280394; x=1794885194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=;
        b=CIE92TcM32/JPisCp7FiYT2GHJN4sAHbyekPjZmEh5Z95Tfba4A/UkaFoeRiBQRGRk
         5GLZUuBF8HM0UH4spfbtTnCzIm47PZxbbK/ljdId53BNYWZgCvIFWi4Vg6t+1I6i68rv
         Rsagm6Ve2JyXfJw1hv+g+Pvz2f5H0oQNBq4K89ilYvAi/54QPjKq0m1QLcSMk2lOZJYZ
         mX7Jnhi9JUt9dLlKGyXrOHTNhTbsQqemZ3QtbL4HTIo+V4QseFYbQ9QaNI7RexIbQyJp
         gXgVXfrl3272rD/QJMNGl1RtmwANpGtP12Me5NWaWFy3kvBGKSQ7/N808VFs+JCSa5Eu
         GUgw==
X-Forwarded-Encrypted: i=1; AL+hErGViCq3CQXfpCK/rtki7W0f1ROW1QKJH5I52lRPKPxdSxSdEnMJEudAHCirzQAlixt6BeC8Cx1i4Qh/8Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yCRfOGqFsMc+kRw9Hh65kvsLQf999VohzosS7hHcXlQNujPAL
	rA7RFpWjXIetg6/b/BlsFqJ3j75uOajpDmOCtT2oa5CBD7d7mx3LnPA8
X-Gm-Gg: AYBFou19UNW7hSvds6ijOLGgV6c6RqPrM93s+ejeldn63wIvnEi8a9L19RbWeb9DDed
	hTduKTiMHT+RO/M3Lg5ZAjsSX8CIQu4j3GWueIh4PfkytPmeEp4ZczyKniQCpfhN/T6YAnYixnB
	71HByxKmbgzHwxIRCtKj/JE+voLMSh9SOQHynH8c6LbRGGcTd40NsXldcd+DpfRHMLy14V50RIa
	ODUapZvDp13SL8AHn4Kg6pTqXtygYTiD2rL968RYrk7YGEkje1on9GWqiquy6Uz9MsPmCJMx5EY
	Hy1daduKarEI0RUleHOGE1ej8spfdVCa9m+dTf/T9fJyjM2W/jhC8y01hpuvTM3dy65OZ5waDG4
	IPhZAZ3LxtKFQHkx2YrTDNgvbNSKM0Jha1HLB4paUVw2/xAs+ktOkR8svP6v9E049zrmbxgIid0
	jDtaw0P4OL1yBwzCxl0ybWbzP0GpFr22rMMxPBx5sTHA7ePABmvjljrWQ8mpjNjCwyw4+Z1I0mC
	b8EzEtz/r7Nv/MjRxhoI3qa+Nrtif2bHLPvk8V3fIGpLx0o2a0iToVZAYlfUY3szPmeKb7Ajr1p
	vmExBDZ6NiKDK9KHQIuF+cpUIrDHYk2WYJZrN/oBE5KEWnc9BhQdh+ParKf2Gs3isUjjlccaIPq
	g+OmHdvZx02DjXjaNeCs+2VCNmxGwRb6MbTivEDToRZH2sxLJuLpLq+73H6Ep1avGJX1jhUvItT
	kLWjyX9bqQYTbGnmwcnGom1mGt3J2d8ePM6wPNrvMK02KE0vYRvdLb
X-Received: by 2002:a05:6808:1810:b0:568:e5e:8058 with SMTP id 5614622812f47-5683cbec0aemr1136816b6e.19.1794280394206;
        Mon, 09 Nov 2026 19:13:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:51 -0700
Subject: [PATCH v9 02/11] serial: 8250_dw: select port setup through
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-2-3f03961dae8a@gmail.com>
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
 drivers/tty/serial/8250/8250_dw.c | 44 +++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 8fffb1f9ab0d..613907b8a40f 100644
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
 
@@ -631,6 +630,33 @@ static void dw8250_shutdown(struct uart_port *port)
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
+	int ret;
+
+	ret = dw8250_setup_port(p);
+	if (ret)
+		return ret;
+
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,21 +791,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		err = dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
 	if (err)
 		return err;
 
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
@@ -862,6 +883,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

