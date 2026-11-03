Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742008;
	b=JKob8xD9VwwHdePcb7ZBE0Cf8e+R5aGvsTS/U92YsIQywfnqaiRcFRE27y6WtrPUiL0F
	 s4W0C5fGKxvo2zXlhMlZ3xkIyClzD9YuJVszZ5jOGgMIj3PamKYjurRmVQxaE6k4BGT0b
	 E/jOiWrGx0j3F3CwBiOEBrh89MTunav/TzqzGHNDl2MGEAxGJn9F7hC6k1L/YKUYetYgp
	 i0NSfM1qBO0r0P/zyzguTjdRu+H5zvehJwEV9spG/+ukHCBSqR12ULEYNmzcj09OlY3eb
	 yrdHYxwmMl+cWAgWelcytVLRbGTMaCXg+EUPv7nSfaRLRbbCYWKw7rQqdGR2lWN+GCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
	b=JCggnkXoibgEk7BJmtuvSlijgUuhwTVxRZ7hbpuSi6MZQK/V9abbjjF35qiX7gCM3AjM
	 4ulvHzgP/6G7uxoIa9cK1FlGBtDDNeEPHv6voMd2uiWlwgedMRSMeOgrCazUurfh2rcOp
	 bZ9BnIZaYodWbVRvCZktlZT3YaG5TMcMJSl/X/n7HjEI6V4B2w7Gn8KKUgFJFiRy4ULqD
	 DDuRITBskbShv7tW4mJTQa3eGdVJwqSTRSzKjQM/rq/AXfLQGptIi20WNAcoCKu6ANB/Q
	 4Ur0uKhX9DwriybkpMKgR//sEk7tmNaW0UDVbzr1fd6g1hrMh2An9JuZLUbUYjPuNnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wbd5WXfi;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE02606A33E
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE02606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wbd5WXfi
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-56431524c22so31129b6e.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742007; x=1794346807; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=Wbd5WXfiwtN9mRkNCJnAcd7ipo/vkGPvGPxaef5aRyDhM6MALUbAed1Pu0DDBSWeHC
         O/xK8b2lj8y9ylH2yZYsuUVGugQl1BnU0dzhB2XyBNe+5KtsKE9knlrKwraLo/nMKahH
         QOtFHfPqUrrtrjKdsj8MFirWL2wDsHZNXwDl9x2sEyI1YzDLSaMKIDQU6nZFsiRixv9G
         wKDmqXF+opTwKWNz2TXTt4KsUbwI5Ip0RxpLP2G6fMHU5Jivp6meGEThA1M++Ykxraau
         wNo/K/qTDOwOrCPC0+340Kqi9jMo3XrcTv6C0IXrdACMEU0EDvC3tpAaxqZ7LS0y7Fjt
         mHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742007; x=1794346807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=p3J182dTZ3AhV+3YEiedm8mpFxP746bG0Y+b3e726ANZ2OPj+Lstde5ypYoo3kAsPB
         sr2GAjE4zLOSHhdFL9SARLlN3Yqg4sik5RjFQJnYN4UhB9ijiTHygRAFYZkHp0Zc5acn
         39T8Hb2gaL7CamGgxBWXZPEwrlLZNVyXBEomTzXXgfFsZW0CH+mgiqI3blNvXsSfsTdP
         DolKJQK8XWTOdbaJdi312i88xzH38c+MRz6KfPlHfbjbCgKWVPpkMDpL/lrZaEBolcwz
         mGe/8bOPC/M/ob7Or5I1jRRxqoaCcppGuYeD3QvcM7CZzaYb6nDQ6tmYY6+ZGFmVhfAl
         rDag==
X-Forwarded-Encrypted: i=1; AKwUvBwLMAu+LFhQjROq7gWOez0gtuFE5NQwFmkburIlAfayZpy0JhIgzSCfVIn9yxWdR55aiLzMtRwOR1HfVA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Ky+OWGOr3LN9BEojhGIiYmc+WaF7w4yqiYziGwtJT6+FBNrwn
	AWZDNqvZ6Iadv9QunQyktiVYEQCFo2muhJAkAgGL5DbGaJTx2LThUY4z
X-Gm-Gg: AYBFou2iH0cS0VF5segznfC0OGm4GWAHSlczCZX5+lXgWy/CfAhnCkj7aC7Yv6d886w
	GWEmy2I5gV01nyQcoLgkbGGJdSbrTxzkrpWjDZmedtX1F/ASloufDXFWAbn5IDiHE0Y3CZhEDLH
	Y0VLKjzMtpfLhYYKCfRA61klxrfMAD6IJ2vAjp9DeJdXJtJAlgfBeDQh8smtbUjjWV8tU79LQVj
	rUIjzInx3xjhfhvY1Fn0NTX5HSvmtuGad8gbovNtb6ctZRwBNjU0LVSiBZpMPD7A9O4VdfIVMGq
	V3zs7mqfdesuTxE7rDq81FBkSlg88q4ii9rYtM7m6ZvafwVVOCKIliDdS0gEjSt5/7Mw65hItMJ
	aFTBfO1JuT6cmZx5YjV9L4/OEvisZB9sOTTFgG6F21i3DcOFQ+rARssw51oy0dcV3kr12hIhgh+
	NdJrFB5n+1XwtNfvjcfBwA2sYgPjf4vpPPsylvUxbPb1PPtycwEjUYFaPo7G3BvMjQPDjYoV7hL
	Bj7PljbDene7e6xWadH2NdY+z0RB8hDvwbw+bE27EspcsMrVZOZYhvrkP3XoK72h08AHtqVNcOY
	PZkDxQUWgP0PjSA364EXCvOb9RqC1FhBZCHyp6UK61Yxpf1VTONlDb1QGsok+AAMX7i0gdtDJzB
	LL8bFIa/crjlafrbdeb0otLvk5hkFOGkoIt6Q5/HaObr2OveXimlp6fj+4I/HN4iRhwGOzgTaDW
	xCe0AMqZx0mBO0N/UCmqzCEtxNwMtZc+ZWNeNnvxqNS1EyhZoMMsM+
X-Received: by 2002:a05:6808:11c9:b0:4ec:d580:2440 with SMTP id 5614622812f47-5640de5a472mr9799943b6e.54.1793742007017;
        Tue, 03 Nov 2026 13:40:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:55 -0700
Subject: [PATCH v7 02/12] serial: 8250: widen RX trigger byte counts to 16
 bits
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-2-c9e248d685c1@gmail.com>
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

DesignWare UARTs can have 2048-byte FIFOs, with receive thresholds as
large as 2046 bytes. The byte-sized threshold tables, setter argument and
sysfs parser cannot represent these values.

Use u16 for the threshold tables and byte counts throughout the 8250
conversion and sysfs paths, including the uart_port callback interface.
Keep the FCR encoding byte-sized and preserve the existing threshold
selection. The Moxa setter continues to validate against its 128-byte
FIFO before writing the byte-sized trigger register.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h        |  2 +-
 drivers/tty/serial/8250/8250_mxpcie.c |  2 +-
 drivers/tty/serial/8250/8250_port.c   | 12 ++++++------
 include/linux/serial_core.h           |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..939b7d4209f1 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -69,7 +69,7 @@ struct serial8250_config {
 	unsigned short	fifo_size;
 	unsigned short	tx_loadsz;
 	unsigned char	fcr;
-	unsigned char	rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
+	u16		rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 	unsigned int	flags;
 };
 
diff --git a/drivers/tty/serial/8250/8250_mxpcie.c b/drivers/tty/serial/8250/8250_mxpcie.c
index 4935a5d1c1a3..4f0b881b4f83 100644
--- a/drivers/tty/serial/8250/8250_mxpcie.c
+++ b/drivers/tty/serial/8250/8250_mxpcie.c
@@ -257,7 +257,7 @@ static int mxpcie8250_get_rxtrig(struct uart_port *port)
 	return serial_port_in(port, MOXA_PUART_RTL);
 }
 
-static int mxpcie8250_set_rxtrig(struct uart_port *port, unsigned char bytes)
+static int mxpcie8250_set_rxtrig(struct uart_port *port, u16 bytes)
 {
 	struct mxpcie8250 *priv = dev_get_drvdata(port->dev);
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..452851815ffc 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3008,14 +3008,14 @@ static int serial8250_request_port(struct uart_port *port)
 static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	unsigned char bytes;
+	u16 bytes;
 
 	bytes = conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
 
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
@@ -3073,7 +3073,7 @@ static ssize_t rx_trig_bytes_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", rxtrig_bytes);
 }
 
-static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
@@ -3094,7 +3094,7 @@ static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
 	return 0;
 }
 
-static int do_serial8250_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_serial8250_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	int ret;
 
@@ -3111,13 +3111,13 @@ static ssize_t rx_trig_bytes_store(struct device *dev,
 	struct tty_port *port = dev_get_drvdata(dev);
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
-	unsigned char bytes;
+	u16 bytes;
 	int ret;
 
 	if (!count)
 		return -EINVAL;
 
-	ret = kstrtou8(buf, 10, &bytes);
+	ret = kstrtou16(buf, 10, &bytes);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..97301ef66af0 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -461,7 +461,7 @@ struct uart_port {
 					       unsigned int quot,
 					       unsigned int quot_frac);
 	int			(*get_rxtrig)(struct uart_port *port);
-	int			(*set_rxtrig)(struct uart_port *port, unsigned char bytes);
+	int			(*set_rxtrig)(struct uart_port *port, u16 bytes);
 	int			(*startup)(struct uart_port *port);
 	void			(*shutdown)(struct uart_port *port);
 	void			(*throttle)(struct uart_port *port);

-- 
2.53.0

