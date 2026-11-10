Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280396;
	b=wIIAWo9C0p9Wtr1WfBJjWtMJkEvsDhlUFH91lLD+c0UKK2KT5sjmhzcLSNlny1wlKBuY
	 HlGhiJ0WGU4qPP7INsU0c7Nv6ei7pGltBOT11uidukYKHn0xjeJBr5Tb+ILjy1ssgzCJU
	 /ZeuCE+pkhG2kb39GVdJ0pLBvCBuyc6jYh0zs9jYfGPAazVmPSeIIoLcpuBzNxg03Vxn2
	 sqR7Y71oLgcDiLkEV7NJoKgQeA1YbgHaIdY/4zh+ekxahTnNqaibG6sbe+00+SLHYFz3s
	 l/v7tgtM172pvmpvduKopNsfeJ3P7HKg5pOAymMg+aJeZax5b7YLX2+qtNC81HSbavA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
	b=DhKbrknki9NN8oxVzyewSA+/c7f+Ksd00vinRs6ST91/CE9vgSDFLc3sjtJiq4zzNssf
	 mHHPvmh197WTFf1yCbVOZ4q8A+AjixTEOMR1vZIPD5V/deEq4qrwo2GmvLbYdt8q2M1dF
	 v5Ilwm043pilRRYTE3zEL1K/p7wZmOjLQgDik16sZx+5QeVnR8y69KcZEmQpdLqTLJWKs
	 H0JgedV2TN2V/aSosnpY54OKOuFsMfmH1B82zWPVxcK4o0s/3ea3ZLMiFq+SiB0+Z9nDn
	 umEDT4H8JMUNZzFLRIcKLUQrvBNME4xgmS1F+S/Q9oEsrhfjxyKslT8YGhOQIkSGpDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lp1Ss9pX;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB5F60A2620
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB5F60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lp1Ss9pX
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1283552b6e.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280395; x=1794885195; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=lp1Ss9pXSFw8DZvu+3sMvDN7OwP686K43BB/+cn98rz/HiY15mAVR9P9pv2O9WMYHn
         2zZLyFmU29ZqQHbKZtl+K/Xp6Tjjwkd+RrJxMbnNd0j/diQdAvCFolGMuWmjM5WkQ3Ev
         13oHUPLfmpFsdvwOz9DeFBIGjh5Pr0uprzZGnfae7HcH9xDkzsQh4+Zf6vFejtdPzCXn
         hMnFgx313VXYG9O4Sr7SIlw/QDfHu1daVuh6XaxM7eanTtm2fkU4LE9/8mhbVTd0CqDQ
         poQzZvwwqSlbV5dWqUyveVLYpbw4kpodvgmlqTU9avvIjXLHILahrRa2pmXBK7VHr9gu
         JpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280395; x=1794885195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=N7DBNVE/lwzw0D0kSC1HWsfFSxqQ+ht67tXXp171hYZUWCS4m94OschIJ6u94MWc4N
         zYfdD4sWQfTK+HY3Ie2UmP6wony8+rqE6/bb0W9titJGey2PnAGa/oYPYszIhmQ4hExm
         4LakZr8Gs92wYNRByDaN/krQ5xfD5JEmicwCLAxgwU3OEmxK24Nq65UMarzNkgS+bnFW
         ak+ZlXHwOm+5XKdiH17YvkYOYgoa3gYwncWco+TenLY9pKWD9a5Unv1/E5EytUAOwbDD
         eAu8I6yJ/E1DYxAFa6mWvlCkFUSMbgSmOpGLh1UEQ5XCPd+cdxQ/JZIa8Y3JUyK9wdQt
         jfzA==
X-Forwarded-Encrypted: i=1; AL+hErFJLGOhWoGAvzjcEOzHcKwYl8PPAbFq16U+QhCO47C2PmXA94N0UpMsihxzJcZWztLT+tD4+XOIBXAQPQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8baDBGVqI5EH2gt0WV25k290y9yVpz2OEvZleaTJXppzxw9WeI
	GqBRKJIkI2ImENBRz0shjOf9PMwHnoYbqMVz6t0frBQPtERxe52gH1mG
X-Gm-Gg: AYBFou0hfMomwT69C4XtHHOKl1R8FytKzBmt9aFIUV1BFo6VcNnR4fZsLr0s7nxVoFR
	eyDeEFRD+ZjijkkQAQAyoUIKS3CyEaohBoZZJB28rmkwbMoUW0UJLAgGNsPdPRv0WgNgy7zOjoO
	Y5sPb0dp4cMiG/OhN53m3DSlJ9zrrp5CYSMWWGW+PFkt7Z1ho+f4BTCExqCPBg1sSYJL+M74jbd
	bxTot7uJy/ZJeo4D9LZEzoh/4qoHBeCk8ILQQM0mtMK0/YCAFlRSwwhVwE4m7sRSuL3sksBxBBI
	vHV1VPeZwueV6++WAMbos6Qs7tkIphz0qCIS/5R4r9YTR46FDlvEXMGa532oIs4AHvW5M59O+Tg
	CZBYgwsBC4UYcWgFcGUayNEipT9Fp001bI/pCKTIsOndT4RKNTP4zcn7rfcC9DptNL6sq7C917F
	f/9YXOAQtmOZQPGqqLftk7CNMAT9gwLb1EcNEnNjlxNAUaZyjIA8JxN0ElD0zFKbospM8n+iw2M
	CuDK2ovdHDwwG4XNrMwnFbZcd+B0zJP6JuIeAqzcnqObB3UYWdys293RxMdVQ9kt0z3Oduq3HY2
	9qfkgqQOPFrqv+o9JnedZgUODUKT5MhkGJF0P1BwWPgDmibkE4pmOgKG581aaW9ffuvfs+weL9f
	cZmYdS517rdVhR+crM+ft47YnwKiVK+OFRumvwG7kNOvajIFJF+iRsjsmlXjfR74/B/GH04w3H5
	TExIOznnhx1+1ltjfWeBUFJyat+gzuqF6HH4Ns/7GUAf0TL9UJizhGWc1QB62lmlZton/eFPo0+
	Q==
X-Received: by 2002:a05:6808:3089:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-5688127ca80mr655733b6e.31.1794280395471;
        Mon, 09 Nov 2026 19:13:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:52 -0700
Subject: [PATCH v9 03/11] serial: 8250: widen RX trigger byte counts to 16
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-3-3f03961dae8a@gmail.com>
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

