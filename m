Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911935;
	b=haFKB8aaBPAbIdaas5mjRm5HmJbwiceHjOe4HH5zhnwK/bxPYiRHTH+vtKrRpHf/ACBJ
	 ac5cBsT6uQCYx+6Q5ogoHsxQmX9BOj7SP48gs3JYHVLBptEG+8yXCEK3345TGjJFAxxDh
	 ywHBmll152gt+g6NQoyBEP5lcPc10yMCDLvRIQR1XFTegFP2p2fSkI2NJM/M5ZzQ2w6y7
	 Dhjyu7NAlwASLbbYvd/X0fwFkejg1ELoQTEdUUMfcf4zK5lQKAqXl9kpn5JWGVZ8M3BIH
	 tVd3VL19zun8Um1HgGjfpW5CRD52A1fScQGN6qhBlHHFW/KMdCiD6JLra9BKPPimsbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
	b=gD2cpB9ToGfadVFba0psrJcD1qRKap9BTzR92CKzMEw0ci9BDaadSMYQ/MkBGY8VFvJn
	 sUEKVGw9eQ2NL/pk7UWEHd1J1eaWu2I1wm7fnzmhKwxmLoUPsi/g21dVhL76RJlDBPG/y
	 mwhrEp3MmUcyuDElfSQYWIYi+2+RpMvJzDjMJr0rQ/8Dh4ELUja9JTV8oxs3c+tYtKHMZ
	 3aPNZIY80Gz93o+nzn9MSkBRcHdqseGlqVptz41T6rc461x4ZhgSwkANLMMUGmO0cxInM
	 zn5WPrUgrPK/TNlHcEywYHSxjBQTIGvovx3GBgq7vJZYtxaxFrxfpq/lVu9Km+NA96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GQOy/lVX";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3564D606A32E
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3564D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQOy/lVX
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8241a56cd70so1559255a34.3
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911934; x=1794516734; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
        b=GQOy/lVXX5hRHfSB59/0p0Om4uFVTud0MQ1JthuY8YxG6gWCsZpoyy+MI+DMwu0kam
         JmzM8nKPJC/SYCdz78mvqSPEG78pwdDHyZviGkVliHbc8X0W6sOJYYn5S0EFWDaIABid
         whwfG4AZK8Ki115qqbjGXOXRdFmZhQawLO3x90XwtFnghX47ptU3QCrDBQTQtHGLltHm
         6gw1HcQ8MQP4PROfqMXyglU0JWm2Z0myo/G6FvdCLS4miOOxCjaWhs3liliutYTIEMCv
         gr1GpFWBIiA+16Hescqxem2MjCBreXXP9vlUFYNVlo5C8GXRHbUvdcu6h8sBc8bQmSLn
         1GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911934; x=1794516734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
        b=XV8DX4R/6A6Ofj9OwRI4lpIh+PMRXmPJL0LsToA2+Hy8m5K8ilDAl6kvttHIFby5K3
         do5y5kL5a/eC/CKIO3mKkW6sYsTqGgUY47pMEBLi3GtXSOvqB/Ba0vdf8lcOfoIjJHsP
         jb66HlaU4VRtWXqgsogQBjekXLP8SMrL6XeoYPGZg+PIWxexgrvItLDWrCzfxMX2Li3D
         2VzNTZ63yVM+++gzx36m/cCQfVXN7hjbJTufA4h89HmQkn9hxw+8sv2NhvN2J4s2re1B
         0I9h0tqat+TAru0JFY0xbZd5V5ygBjHCVG0mqL+PUJaJjJQAm31Zvca/rvf7dKv0vctd
         Byeg==
X-Forwarded-Encrypted: i=1; AKwUvBwaVyFkGWl3wPfQqbjatSBpfid87jLpDnsYKBrzZQPbQiNRXkyIzajaw3QYiMYBoaFI5RLzlWcsaIv8BA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9XMpxqU4ibHUHDIMFmiqjxceWH9PdP/lld/JSJXERAIsW6giwW
	oQR6yde+38JQQZjnr5ke5RAUsXUFErfy7wJe5PmE2brFPSdfMsR7BUiI
X-Gm-Gg: AYBFou0yyJv8yBg/iqBTyBKy+QCN773dIR1zaqemDAIIrqMy+SgMimhUCxDJE3AITit
	eDGJODb5ZHmrCubjtkzKV7hzleRhkeW4xkJmcwl23b1aLG5kOTeK4LIdWTl5rXag1LFmwegGYOd
	JYxNls2UIPktJ2DfXXQpt+7TJRDrLmu19tApui+x1BLmlY4a/cBjXRBcZ5eHBj0kQTYovgavHiY
	4z6ev4+A20l+oY0rJO4Brw+kRhxm647XERxf/RHYzxfC3AYFlcwH2KWB3LVcK6d4j+Abj4QKveF
	i6wX+t7771iPxTb3ZGwrtPnk/6/nqGlSZ8izzVctOdSd7kkhHbvFxHmNMNrC8ZC8bF1fhBDmGzr
	ZyQ49qOjnobDswhVHy10EmUEV1fl13JlUmBynfH19QDdWcL+iatDw7Fj3m7qgM8vVzVpniQCtxJ
	myfJTxVNDUBl5maRKlh7J+hpC3z7wLoBk4jURTwEKk2HnzX1CYE7pfxoCENnd6kUjNrlQ66N3er
	1j2FgMuzNGeLxO1+/PKul8JJWWN7a1Ilxw4+L1Cjj7PsS21h3uX75uIcAKhdDxMhl1QbIdkUb2g
	f9nIVplfAG7v33ohEqVjbN8FT2nR9TmEPH4qXGnqLD5fmLArUMPYHJuEqlFet7+JZj5JZXDIf8p
	TlETPUXCPaZflcD3HD1jMy+kUn+wDmBCGHby8S9UtUEE/76NGv+7gHiTrdWUi1ISXeogF2xcibk
	s1W/dZlTZBtuYW+qp+7TVbRywvlFtrVLD6tX5W8vREWonUfBzJ4q8c0SGNk65EmCn/zpTCbaeX
X-Received: by 2002:a05:6830:2e12:b0:843:cf07:7a99 with SMTP id 46e09a7af769-85f1d14ff4dmr511092a34.31.1793911934069;
        Thu, 05 Nov 2026 12:52:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:02 -0700
Subject: [PATCH v8 01/11] serial: 8250_dw: allow port setup to report
 errors
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
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

Return a status from dw8250_setup_port() and propagate failures through
the DW and LPSS probe paths before registering the UART. Use the existing
LPSS cleanup path to release board resources and IRQ vectors on failure.

Keep the current setup behavior by returning zero on both successful
paths. This separates error propagation from the configuration validation
that will use it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 7 +++++--
 drivers/tty/serial/8250/8250_dwlib.c | 6 ++++--
 drivers/tty/serial/8250/8250_dwlib.h | 2 +-
 drivers/tty/serial/8250/8250_lpss.c  | 4 +++-
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..80b2b673b422 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -765,8 +765,11 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (!data->skip_autocfg) {
+		err = dw8250_setup_port(p);
+		if (err)
+			return err;
+	}
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 91b3607b64e6..4a06dec6e263 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -208,7 +208,7 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
-void dw8250_setup_port(struct uart_port *p)
+int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
@@ -250,7 +250,7 @@ void dw8250_setup_port(struct uart_port *p)
 		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
 	}
 	if (!reg)
-		return;
+		return 0;
 
 	/* Select the type based on FIFO */
 	if (reg & DW_UART_CPR_FIFO_MODE) {
@@ -270,5 +270,7 @@ void dw8250_setup_port(struct uart_port *p)
 		pd->srbr = DW_UART_SRBR_0;
 	else
 		pd->srbr = UART_RX;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7191cabfb086..4d32651956ab 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -100,7 +100,7 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
-void dw8250_setup_port(struct uart_port *p);
+int dw8250_setup_port(struct uart_port *p);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
 {
diff --git a/drivers/tty/serial/8250/8250_lpss.c b/drivers/tty/serial/8250/8250_lpss.c
index f1b4b975571a..7ace0515038e 100644
--- a/drivers/tty/serial/8250/8250_lpss.c
+++ b/drivers/tty/serial/8250/8250_lpss.c
@@ -350,7 +350,9 @@ static int lpss8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	dw8250_setup_port(&uart.port);
+	ret = dw8250_setup_port(&uart.port);
+	if (ret)
+		goto err_exit;
 
 	ret = lpss8250_dma_setup(lpss, &uart);
 	if (ret)

-- 
2.53.0

