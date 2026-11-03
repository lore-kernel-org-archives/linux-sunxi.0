Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742009;
	b=l1gXOpY9wAG/0/H3HC4scMxby5d7ui+TBLcEm0BAYmOajnc/o+/mizIxTOB7ZIZwIytz
	 HAWdSfmu7mZ4eM2rc0lfoD/sTZ3jGjSgpKMGMsC/ZTQF+ORJMgjM88NyoLVJaQbkHwYhH
	 LlXOdXvElBF71glov7hRN1mRp/FnaTnmwzpdICRqpHsDZ6yfjI9Oy7VN+75S2Hjw8GDkb
	 AMmdhfxFo0oabF4GF8sQHqbO+AS5mqQMtIAb5NfSTarRbx9it+P6UpyvkZwbNlO5D6DmN
	 8GJr8SVnWOSXs7MiR/SX2Kr9VN1mgm4OCt8nKyD+u1PWtu6qRKzm/Xb4+dOiRa5g7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=d0oFGuyB98j6ln11jD/SQ4VhRhol9TzXRIK176M1SEuEE2hyRpLNNkhe10uXZsA3OsdE
	 YEK5PtLQSIQAQBQfB8QB71D2BUivi+UNiqhhX35EFJCTCYziS8grOFj/ztaWbm/9ZVkKw
	 /FYRG398+EHHh+sj+hIN09XSGIUI/Ta4ir1Yf9PoKU6x/MKd4RVeGxieH/UFc5UvUeclG
	 BLGuAytv6/Ir6sWDUj4j1xTGBmXWtolv9iLjwsKhxtDzHMfAUB084JP4s31Wu/DF9TQ3+
	 +PHkH0QdYwpA7AIou3RKsmhiJg0Hbb2gSMdpcA+Jc5q08crfkz1KNVrlDIFH5sM/6sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSeTSBIh;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21854606A33F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21854606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSeTSBIh
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-55e02e89f78so28447b6e.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742008; x=1794346808; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=hSeTSBIh5p4X/Nd2+YAH3xAiGdk60U+T1PWswsMKQE73xKdCQ/1u3ZNboPWAfLxidb
         Vba4usCiFcE7OEgKnyLF15FItLQjkXuVKs70oapYz9kysmCmquwEAANoCQkG3/3ZsSJH
         jNgmgt0NYRHFOZ1f4rEBvzHZgb18azo9msNmeZxyYxXAMqCPIvUyRvrI5Y6dxTcvFjTU
         KRUcquaM4z4wSDA6eDEnl4b6PxEek8zHXimu3lZV7cNagl8iz2QUZ6841D/v7Os3n3Yz
         NzHHXWEEWcaZwVY0zOGasnFcLg6mXhqxAUQZp+lvhbxG7k26e4kPsWCFWzflyhDdI4Lq
         QMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742008; x=1794346808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=mkXO7SEgIGNo97YyUNFJ9loTBWqGEnjII0LNGjfN3VuH3WjFB1p6Yrkrn9nT9orSFj
         ErSlcch7Sg/8OkXDudCcCwAQ/KHMAXmbFcSiqH/E/VeIBNB8RUdct5sQ11LLu6a9cYfw
         7niKl8vuczCiwq5CDe4dqbLduyoO8tIIJ9QWWhhQFA6GdG42kL1vRxJabUKeRkqiWhvw
         DLVwrHXiiHCBG1ezpk7fQouHa0cYHx2AqzqFROwc5dQYhqUGJ5nrKtenquP/vyne4340
         4jZEi9quYsD5/SURcnb8hBCBtUWwVHwD//+YEXWj1VLxSo2hc1OAMgdzyFhyfSp+gJ8h
         cYLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvUzaCqSzndE0ClzK7at99C08kS1noVvoY2VkG486E0rMLMH3zEjxYLa9EEW/4uj+QoVi/hGUxdtm9BQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9dpEgBAQI0DYtNIUP8YSCrPl8bybIxRu3wtowgrzaYBw5i+KXm
	s1ekKG8/UvqkimfDja9zxUnmSmpbjrlJpNG0gpSLlTSje3JlUPfTx7GN
X-Gm-Gg: AYBFou3XXw3nZT2pUk8t+ThC+Cn6lVBiuUyb7vJQNynn+V2TAAiQWCOqY8cWEH4Hopx
	xGW+0nbv/9xrbjAg4lT1DS78Igqld7AjAXCXmitTIImhhNKmKxqblCfR+POIKcjdu+8YoarCTmt
	tXtkUms/tyQMCgqHv09m+G4gJPy/tp+Z1vtqIK/fz9MIN30Z/OZp5LgOkTFzaLtB5M/8qu11b7V
	KwNJXWXn6CMXqrwAwVPY7By++ooPG/zDq2KoGiLQLsx18s+hWTG48m4D10TVrtA+vLpMQ/HYIcb
	XMD6y5mhKirljNAaGgXVFzGrHC+pey0jhhPWSE0jJvhjkYfRtokuU26HJb0QSqy7YDfn9gKJTu3
	CJtbDTxXY4NMWpEMDUFPQpq62OGBZwmOO7k2GMwtw3ystztOgTPZVSgJgo0dmNlPvTewpf6CM0q
	Yg44kaFAPucTSmSlYB2efvWodrz7HLDw/mXOc7fipdsYyMUlfaLSmnvZ90QFOh2fJWmUPNt/UCv
	vHpwLi0ZPQwOuqQzi/SpckQly3AB9bm83zXhypPUzz01W0SWPBhQ4fHOsTiLLZBbjYDz8QSWN7E
	VfPd1Npn9qJal8D6zd8P9b3vsrUCV8JL6QbDVEoij5UBmT0P9yCYxDq0F/IrqURibmfjlrg/wyR
	bHVVKLby1W3IRC+S7aV+MovenaYR/x4SqcOGMRR99dn+x+vYDdaTn7pYl0iN6P4OMY29EQEeU6W
	BO8MmtTZU7tWKNDKHzATIZoinjEhumfJlrzAH0WABSSjWBjhJHLMzI
X-Received: by 2002:a05:6808:4fce:b0:54c:7ce7:33ba with SMTP id 5614622812f47-5640dc9006emr9815263b6e.28.1793742008124;
        Tue, 03 Nov 2026 13:40:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:56 -0700
Subject: [PATCH v7 03/12] serial: 8250: share the RX trigger conversion
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-3-c9e248d685c1@gmail.com>
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

