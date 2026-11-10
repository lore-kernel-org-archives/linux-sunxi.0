Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280398;
	b=hd64p4sucHLz5wk3B4jhregFZqrEcUdxbHipcv5A1QugstVh3xzOIfLefTZZyyW+JesS
	 7HmTv4g834a99FAzEdbsBDhsohTgp95fylAoRgo0sTo/jt3c59tE+OBilFG4c4Eyzza92
	 HYvaDxz6y1xyrCgrBC3TbBwr2bQon7X6iFqrbbUiBOh7vnmdK2nszHSt9oOJOCks1vekN
	 8GgujmfepOsYuf+tfNko3Rx2Sw+W42bWOeCn9gm5vZJ1x6o5LbyF9f8dSIhaPBTpd5nOE
	 iCFOYyhs3Rmx1QbIF9+O4gMs3r/tM4hvD8hXyKMWDCMuZ/s5CsjQhkBKc5uYOcbRWAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=XyXTvs5rTZEuj00EDMUGdn77SZCYXGuzc5L7WfLEIR98STEWYYr5hUxpPsjYAAe1BlTn
	 eDggXks+ju0fDs8x8a4WMB/4PxvUNNVIWgwVCK4WvkBk6ocgn+W/G3PX4Z01GQ/VchzT+
	 sr9Y9KpFnC4HtPirBJmmb7wQuLJEvASQuo8bz81mUJEx5CzUrnpTE+2UsJK9U01g7w+BX
	 Ui0rrj38rtOgPpk64LAOpqKAPKD5hUbdUbVD4FvO8sCq6xGtV5T3aOGIk27CZPl/dA4qL
	 R/7mjF6li/RIAE4Xd3PbHq+2zBCQI8QScSdC8wMG4d7Ry943le64GR1GfwhyOxL3+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ar+g2QD8;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FD560A2630
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5FD560A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ar+g2QD8
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4f48d91ba7dso874923b6e.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280397; x=1794885197; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=ar+g2QD8XlhgDInkpxY5Hh1tOsD6V1fJoFqWlQLD0OvyQoTuPdIyPT8MhCWBmbN4OE
         zTf4QkcMdrLQV7uU6vDM7Mj1kEfbnFE8QG3vqpqlsWgID7LDr4ktGTRqdHZzriW7hxSq
         bGE86xrYqQqshhW3x0aOgl7X58LY1tK+1A+FO3OafJwEpKHVwQG4dDZDTNaN3OOstWMb
         eTvcRzap8bvNMK+T+pUOvarGDGuFz6gyxBNq1UCe3Z7hXA2Gn6A79xyfP2iXmMv12kM4
         WrN37G4PaBREABTGUQlVHoxSNDupcBd7JbXVXvUrNE0uwcg93GIMgu/vC/qiKVZC3qhv
         Lotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280397; x=1794885197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=JTnBO2ChZ4LMjiJEeQJ8EaLcZLLd2+Vzro/tq7FK5J233u8IN0bbD2tTetEDHDweZH
         BLiX/XyNerTCsyLGstBgRYepwvuLb15fRldn9lBUJANU9YpFp++4KYQifuqKa3ywyGlp
         DEor8xYBjfF9MHOqScDLR9YSGNxgeSUFGvkv4xutizaVYdAvbaIlieJSOPtWAqKLHXze
         kYt5NeT4B4YkltU3RDW8aFPPGZIwR4axyKj9RfRho+clNmwuUOAJ5at1dETbjq84M/6u
         yjhAGRNEBT2Zc0F+z6Cmcsh876ail98t6a5jfr0BD8JS5ArjTOPJ/G8T6h4xoO64eCc+
         0R9A==
X-Forwarded-Encrypted: i=1; AL+hErGxvNDhDU+oY3zlBGpe+R2smpoa0/ewPGmpX4ewKu7huUwHjitM9dt2fsuOu0kaW/dqT5kfGFmps0gWcQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z//Via4tzGkMsMsuuwUxqrrliys8duMydWlHgWKBI3FlBf4r6s2
	pt6ebZ6AfXnfHYADGblMYfde7D90wTbGew420gchiaJuTXRfUdfYEs/G
X-Gm-Gg: AYBFou0zXjmbtnyLYJVIPf2vqlATlL+FwdcGLu0DIhSToZkQaY6+kMsEfbbw7ZAuJc7
	uF+dPtQRih4efYftmy+YRA9VT9P6+iEOFkWk5qeVLspUNvOvz5jhYGGfNKjptSop64oKu2yneCg
	iNU/YBnDFz43nvckk4Z8Q4FIUDm0vpCF3WRI/la7dsDpCphnma9i/9LQs8R3tGbTVu7aFXl/MD7
	J8AOwbjqCY2jr4Al2/PW8IgfxUOZ/R6yPEuC2Ohxs67ZdMoljNEphWgmxj3zg1mOoJWFYmRLlHv
	KbzjRXYzBs33z+o44+W5zmVqY1P3RhLX5jN0wUAWhxTUlGRMNfIFVe7PXiTaMzayz74IwOlIeNQ
	SWXtB0ktWK0DiUAYABsPygYJ/Wr+Syr4Rpq4HzUPGbguf5FYUS5N5YZvTem7Drtn5frO5MWteqh
	XeAMTWiZLaMZwXGh/BV3o6felaa5tHtL0DsN4eRTIMDIUJnEjOMf+70RyMNL9UNPXl0t1gKRbId
	3zVxiFNWQR8wu3FPLtjsf1nwyEtjRMt267XNeRkz1TEg5VpxG+3gMhM4bBDX01KvxnofviYt/CK
	QCB+mHqLa1l9MxHPeiy4fNw2n1mieYQIgQKTnI0ivCrRxNUlt5oZPVghi35svLLrw1OE9oF0lC7
	xquSywbAHKJTtig+TG3YIT9ov6CyQfFOP6on04V0Z9iQJRNndXr1lsMxTyYakUMaBWJV7xyOFWZ
	CXm1fSdDvk2353Jq37jKX8gEMGQkmq+5B5Lgy/WvMmKXyLRJxfLu1J
X-Received: by 2002:a05:6808:1787:b0:564:347c:5a7c with SMTP id 5614622812f47-5683cd801f3mr1322272b6e.59.1794280396724;
        Mon, 09 Nov 2026 19:13:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:53 -0700
Subject: [PATCH v9 04/11] serial: 8250: share the RX trigger conversion
 helper
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-4-3f03961dae8a@gmail.com>
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

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and share it within 8250_base.
Include the unsupported-table check and preserve the existing nearest-lower
selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 939b7d4209f1..8729619160ea 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 452851815ffc..73bc9e7ab703 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,16 +3015,15 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
 	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
 			return (--i) << UART_FCR_R_TRIG_SHIFT;
 	}
@@ -3032,6 +3031,13 @@ static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 	return UART_FCR_R_TRIG_11;
 }
 
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
+
 static int do_get_rxtrig(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);

-- 
2.53.0

