Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911939;
	b=yKDPePdWSbn6iZ9/gPNcvsaBd4+Kq9payQZrWCqX5rEQzrqlz1Nkk25I9IVp0uP1bOSu
	 Epi6Ed04+bUyUtkwAIdYJ+JcRRwV4SHbKoyQoZLT6bOD83roFhn4Z9mHxzic3sgkItH6X
	 f6FWOGjasTn2VeU/1HpF3+ZrkTwjm3gSQrrZFdVKvoNZaYw6bkF9KzsQ0aE3+B1Klv9yB
	 GRLzQeuz4Ucsgtve+A1oT0gThy8icRMLYUfuj+FlvGUyfiTx07P+4T0EZ+2oeG0H3z6rk
	 UQ5jLN0N7wWVUcl7KLG+0j4HrIKzwRT0lBvF2F6zudV5ZvZx4JmhK6r/EX7DnIxmSwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
	b=Hi16eM1FgG49WIJjuZcSHhsZtuM86+TzyZlydyV/pgWvW8YcEIO+jINFb8Iy2V1LrUr+
	 +URh3Vi6GRhyGwj2spOwdO0iVaSz8mcAMkcBWnOXQPL85diYqUk8iMpCzT7kc7s7boMlv
	 EPldCGNk19nv5HKYTGBFZe108PkQXZEFCGcHoeyG+KBc44OHBvbQFFaycIgb8hknwFvQR
	 8t5Ojr4+uw0oHFFU3zaBtrs9veltwJ+eYc+COkZ10eFXkkR52E54dc+eVcF3ZMts2N1mT
	 UwFvgblrSBKWMSGC0CCEryc0rtgkIessDlMLr5iO3Wd9LbjIZZhFpraQcHwmMsnn66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Athtmgj5;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DF9606A32C
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DF9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Athtmgj5
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8451a619da7so6660a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911938; x=1794516738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=Athtmgj5rRmHYJXIqK23x8OoeQFws8kiXV30Q5Ek6ihJksF6zQV+sakLV5FPNO0lmk
         s4ffg5j+lZbI40FfqWbUE2IYeqW+EaUz14OZq7zg6bQS/WwqVEfljeclV6dYGWeAzAX6
         7e6IP9yX5fHSi8GBuL17uhOI4jIp5QHU0YmABIW4u79eeN3+9h95QbG4WYu3IZMKkofj
         Gp8xzcK1S1VRLHh3Svx0SaEGDSH5nuWmC7uqxNyX8U+qvU7Nnlg7hF3dOCROomj0Vup4
         NU+s4Kgc+Ow2PyFbwrH8QuDiKTP3DFaTVdEUI1oNNKXROsQdL9hz5v/0LYnwy90GkIMb
         ZOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911938; x=1794516738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=2JPm7LTlrvbx5wPhY/7m+TyO1KGzY91bmhC6LPAw1+nvu7twHoqc5zbpdUl1LrHQCZ
         koaKj2tuUr1MYO4RPP5IxLdIIu98QG5Bihdi/E53Bh7cURilVsfORET6f6R4YHy09Unn
         gxNt12nMXOdHCXTQVW06TJu2A+DqfCBG22nvnL5AKlhtXp/8oKmhwaMKogk5Qx6x+88c
         rNCAcmmEkVDemHwDH9RHB+RnWrCWjViGBTcy4JljkzuUqbjVov4uGrIw6VT0TFzK7/Ma
         p6jXLhFln1bdILorCFlBUsErbry5P6DfvHJsGEVPhIttnXeBxY/BvqUcoQP89V4bGWVr
         05rg==
X-Forwarded-Encrypted: i=1; AKwUvByHSiUtDsG1pmxDEnqqeTFxbS99Fod/sP2dpoaQzxykBYdpJrsnBYK0nVEevx2vYWwhRy1W6ZzeRk44kg==@lists.linux.dev
X-Gm-Message-State: APuU4Z87EW5MLwaibrxIAr5mV82cLuL2HogKKGMyTkKv1t+eyAyFV47z
	FTjzLv1BUqr8wKClnnrwQzm+zLvFvPlWdiq1FN8SF9EJ0cxfWo16UEXc
X-Gm-Gg: AYBFou0PXJtrsB9lXjISxHGeZYzV4J8KuLR2hM61TCf8Y11PUqGdFfUe/n4BtSlr4n2
	iWpLlvwgb52ci2+Dnju2D5Nj/cKZMelFuVbdoRSawzJUmQ7QygJNRHQ1AhdXVEJDu/sWnVi6GgE
	m/27TXMAOznpr6ua9x6TmzUj6hsQKzQPmbta9bvp5PWouDbiCx3amAR0qMf4zSXCw0U4faAYbhX
	s4y7Pagud0XjWc9Peg0iI4h78i4gbNaYvgGjBYVsBA2u4V7Kt4TeLEFidj3sXeYfWWjn6ZPnFlf
	KC3xBuUEdGwMkUnWpApPzMd4AV4qt/JPRRXTKadTIyWlDvGChykxr/QMKkaMhr8gtel9TQ/uwpA
	vTJPdQg59SnZKqWUcATes4my1g2O/ryTcSA+2249w4jup5l+h7jtr6XezFqV7yVznw6zq5z06vZ
	5wVkHZcIAcAUEjwtmadPfi+sD6e1g5tRDTp530VX/xoBGGDcTA4E5JBt8NEZqHK/dsLujc+rTLA
	EzzjTWlXEsNYpIrsEHN3CqbvIgYufhenOQSD8U9U8mDgiuHNBHVePr6GxsVD+kVevCVUP+EyJ01
	Az/x3qZFJh0YoCR3GG7vg14yuU9Ubv7yNeg8hgh+nHgX/ApD0OCg8nzCBoWZPw/WqYRzPgDX6KM
	AUFWbl+jge9wG1hfto+HQWrIqePhcCn+B0fOWai7/lowhcmToWlNQ33olrx/ggdNpbW6U/Qje5v
	Zaa+iNp866frfEJFKUxwgMIbxbST7fOdYu/mKSYJhBpKyWhzey80jsLZxpF+OnaYeviEb5bPHH
X-Received: by 2002:a05:6830:2317:b0:85d:6045:52c6 with SMTP id 46e09a7af769-85f1d086f53mr580936a34.24.1793911938304;
        Thu, 05 Nov 2026 12:52:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:04 -0700
Subject: [PATCH v8 03/11] serial: 8250: widen RX trigger byte counts to 16
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-3-14024d2b184b@gmail.com>
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

