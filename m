Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280394;
	b=fD1aIM/uS9AtaUlRBK5ENsMNbBWHAOG5f2Xt7/diUt6abIBI70LD+7aij0tIW7qzURjg
	 bMU56HuKykZj9ero3EV75WIo+86VtHHpfCCOdHD5mHg4diww3ILZReF4KfB+Pzaw755gI
	 yt8UcqialmV9dT6SpJYBhNWdxm65qU52XCM791qQ+sspTsjfOBomXNAzwKOwjdo0M3f4E
	 maEcIvwr+PKN7RZQMCPlabimv0xFrEVd2r+deRwFCN/qUvF+TnT9AnPCvjqaavoP6/y/5
	 paWSs46jBblXSC3B8fRFm/PQr/1zh13oRDt3ufDI7kDctq1wQeT5EY6a5EIv2wDcFKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
	b=Kc3zgb9nfjMYvkIGDR6LW1KqxKr4Ru6oImLXnSUwUbFbvHbspne5mKChPOjcN9ZIjdPu
	 LO2OEIB2ONdRFi3ooCkJAWP1u+a9H8ygO/B5WHu6L10S4+Ze61E/Y93Z3g43IIVuXa2eu
	 ovOt2RpIjMCDfXuOzdQrhtGRZrBMv/TnkQJ/K1iZ9xI7Ny2hctV5mWOq/Xq9DQH4hjGdy
	 WjEweYJ38XG29qY9XhQRvDN74kYi8lquIcfIi4ErH/8chsQsA4KtR5jMSDVQFkCldDIJj
	 bl8USk2qy87IgESYzT+P46qTU16EiRqWzVdMXybvoQyD4hOc3zxGZvkHOqvJrxyRTbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GPDDV8WB;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FF60A2601
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2FF60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GPDDV8WB
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-51f2e9e6987so941786b6e.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280393; x=1794885193; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
        b=GPDDV8WBw2XZ2eu+0eixWURbxwqWxGUoNSCfolzQa+qV8Rtbv2+GcZgUTAVhwVS76K
         gh8XWe7uXgjEX4zaj5SS5OXnt7EaSNEhmrTKYQSjBPnuGT79PfHTSFgHphlmMSIEJpNL
         1mr7X7hMbd/TIfMPutMwVMQX1Hokqypt6GsHo/oaF2xRZEQSk32oN9Sh+w/DKYEak4x3
         cd9P6vCCrBMc5Q3Xbda4+CUbKFfcWkHG7eF5mGHbh/AFwwONpHtZl2Rbt0aC1z4CUWK0
         yb3t5Uv53svYDM2xuRRwUR+iU9KYitfc8v7kEkItGBAwhgWV0PY7OhijvBKLB9+0v8Zg
         HNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280393; x=1794885193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
        b=N5MjSeRrOHJe++UkSJdfBPk6J3OPNBQyQWF3jSL2Wa5FxAgnlfWXBcNwdLiTkH81U6
         LicoP5ytUMM4iOt64dANKKwBMhm7Sd7TG2qsgSPiei+Pa7wDK/7nOQgpnnwX34sx6KwL
         eUodXy3G/Q+c17FrlVcGuTTRg0qminTOSs4e6ChdH93tHLRReZdzB0kE0VbaxbJQmkBn
         XSSqIad0K4qtUak32kXdqDQP9CjPW4K5RQrFUnAzxHfOjldVz7B20IN1x2NNanyFvKyr
         FBQR2ZflMJCpdkeUZkLOb74aKuqJI5km9tUiv2DeQda3CQB4Wzf70jA9f2J2W5jZNwdm
         u6wA==
X-Forwarded-Encrypted: i=1; AL+hErEyQKx/Q5OgUR+8fU4SiS8YzueO23tLEkwz422GNmDfN/4fnWMw/fSbZxcaSs+5X0tN0Zh1ptDCpx/RgA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8AF9UqUvg5cekI1wzGRNVFEQvAchllt6H6eUim2aqobOCopVKw
	XgEoAf5DY+EIIbRljkM2qkFMXu46pDV8GjdvhcQtf3gGN4srmmIqAmie
X-Gm-Gg: AYBFou24u+GKBh5zSUcvJxEUXvGGllTL8FO32yI919tk5GTzDArO/aO7akcSd5JyDmN
	DObSTOuH3FevOuGP3dj1tlo8cEpZzTdvFCSlAnY4FbfkuuBNVqhVYF+hq3U9i1gfZD4Qqxq9qbs
	F2Wb924bmJffibeuqNd10979GTYpnr/LJpk2bgsY9rkOxyImvcUg0MS5htVHxnWjYn6/xEzXNEL
	eOW5YvvHYQA137CfMP0jMADtc4DZ0PSdwKzAmSd7/i8q7KxTmA2XkXcLeglq91CD6La2FQWjiPj
	ikc1n3QR0PR6cUDoVPbTqIQS3fhhuRWR35hDfyIp6/bDmH5A4mBqPGTg0XJM/W6aBvhlRxJ2ipq
	zRQO1etC6vrE05j7k/Hr99VEJBXAty7bnDzjlTGnQA7p/IEkudg3GCaAL7gTyigLFnoMFDg44hi
	srdREeL3+AQXDj/TN+p3mIxnT/ERDnLRiOLel8INiFuB87DBz/1ttGho+d9UzaXgs7eBsxb0LUP
	kIG0ukOcpNrjy+vtTZBdrsaL0+MQkaM9O8Gfpp6rWJUu6FZxMjeChgq+0oLaQvUnC9gxa4RMHxX
	fyBNeTlul4tbA7asVOe7L8YGqLAfk2mU72pB+rJcyY7rAn3HqOnG1HUiJIGz6RuP+hO0njpEzon
	ZYeYqK4YdvPRB3BVXpTOE9e4mgq+zXUbYbFT1TLDWKHtSq3y6ni1SN7VNE8+IvTS0abe5Y/uo/C
	R8He6nGxZXwlENz+hEdppTR+3NM7LI38CIn9QIQp/K0rwiHjyJnMuz
X-Received: by 2002:a05:6808:11c8:b0:568:195a:3bb0 with SMTP id 5614622812f47-568812d0fa4mr697292b6e.23.1794280392814;
        Mon, 09 Nov 2026 19:13:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:50 -0700
Subject: [PATCH v9 01/11] serial: 8250_dw: allow port setup to report
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-1-3f03961dae8a@gmail.com>
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

Return a status from dw8250_setup_port() and propagate failures through
the DW and LPSS probe paths before registering the UART. Use the existing
LPSS cleanup path to release board resources and IRQ vectors on failure.

Keep the current setup behavior by returning zero on both successful
paths. This separates error propagation from the configuration validation
that will use it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 4 +++-
 drivers/tty/serial/8250/8250_dwlib.c | 6 ++++--
 drivers/tty/serial/8250/8250_dwlib.h | 2 +-
 drivers/tty/serial/8250/8250_lpss.c  | 4 +++-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..8fffb1f9ab0d 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -766,7 +766,9 @@ static int dw8250_probe(struct platform_device *pdev)
 	dw8250_setup_dma_filter(p, data);
 
 	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+		err = dw8250_setup_port(p);
+	if (err)
+		return err;
 
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

