Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911941;
	b=f+GaUBYfacMumvr8p6QlbyziAJwoCOg3PBH9v/aPHNQGkcw0P2RjmsRMv5ASjOKZuf6F
	 fHGKCV9Up1Cy62UCoafFXu9HPOYSNRdMXqQwk3YtpeMIWVcqN6TgljJlmZXxgNlndqf+d
	 BBiMnYP3Pdw/KidsXvGn8e3GqqzszleZzQDNkzYwJMo719AIURBUQqPgl5MQrmdlHPPTW
	 j7Gab2JJHfCqZJfz2mLGSH36qI/ZLR3hoWd/RF2Ck2GtBloi+IZhm9oBLZrFqu09XCp8D
	 5JeqUk2PbVGsvhp2SxHUbTU5lzVOL2i9g41iCxM2LLgpnUaXiKVUAjzozUq1zgTocNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=CARtOp0Opstt4OecdxjWfwdLJqdBja2CTCVPODv23geX0W+scMm3qTOKix25KfvvyUqA
	 Bgnp4I0BX+2t+EBUNuKLOYQjiejQCmne5E0Sh4TpQmqVzA0lF1g2rtRYSMh3hWHjhVGcY
	 w1xWVjHB9NJvvxEi+VnpO1szRuBcW9rjn4iKXy213cBd52RnkbfeaUvxEnj2Ub3PRLDS1
	 t8iueSLGqDN++ILhptHTQN4o2GYtcQOKJr0CHT1wfuGI/R8wRrBVl+bUBmreKco7c+Y+/
	 KI1LbCiXvU/TbuTCgCAOgv5lL9yENiBH4/hOGSf1jdAFNt3RJAgmn10B9unvq7kLsDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=St8I3Q3B;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F6606D811
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544F6606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=St8I3Q3B
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8490a7d6696so1479797a34.3
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911940; x=1794516740; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=St8I3Q3BZ52aAOYmrtQlH1Qz6yNG4MdW6zJaxJPS5FXvFclLbyZIu8O482lzhNZlKQ
         m7P+Lo8/9F8w/2S4zCKih8FQUiY3eN3K43KAl0LuUqsPOjZUif7xJlqvFV+0gGp+QFJK
         eHm1TFA+jOneWhepGCXMm5tWcOgbZKfzCrrPV11QUsMjKVnWjel43vT6P041xqQsKBEF
         SUQZMIbzFxumPOufHSrihgV0/Tlc+/Pz955m8xeWt0h1R+8mzk1poPpp+04zJ2BKOdvs
         Z2IzzU0KMAolGtJqQszJVhyvMaOyQUlpXgZrulFOCbbq71HBQa+kh215SeAGRRJ+Z8MF
         OT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911940; x=1794516740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=nG5GhZZW441jBQPhXZxZZ7GjT2MhO0eVl4ti+F/ztgVGje2qZr+hQLoEfeAs0Je1bV
         /xEYO9+mIyyeFrUzZpUzl6Uf6MMQ3EtNOx2SGkwEFynSmijFEP8MYTj4Uu7oDFzb7clJ
         bbNFn+jeld02zgIeExMpFDp9o075hQ5E+2IzLxtW8i9mX6dhBJ9sJsuIoGWNw/U30Q4H
         NyghFp+kPjbETOLF66vimcBi2DqbDtvwe3gA5rv5Vluujjh3ekrHnZ2NZJI9p6Fqy/LX
         T3rWKdMSsVIFgzkA0f5LHsbiUSX5boaK9bzUj9rOZwJ/+EKKpNNDSV3oNCJm+LdIieA4
         r3nw==
X-Forwarded-Encrypted: i=1; AKwUvBzqQWYmn6d/jP1GIwhpPgHWs0tuHroeSOHaRjjv9uFEUSY1OUjpo8aCepD6Xwn2+3RPuRPOOMVYA0Ln1Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZXsbrx4prY1ffC4b2P6Xk8TVgWhmyYu7Adi4PrwSX5IW7waOp
	GYxCAsrl3NAaU/Fzycs/q6ksUy6QMSJv+j9WGK7DSHu6FeNcKjlwX83s
X-Gm-Gg: AYBFou1BOjbF647nDos5KdwMl2mvlPRUK2SC1FxgAh5ArqRSx+Cf/ogv+/iMA1PsXfO
	I6QMwuK4aXBVlbqmlVc30uJ+dqB5dcSSPuifvZ3pFJGrssB2S3jFKhI5Kq9YdItXCKBr6joCh0e
	X9+eezcTeZJxuYERq+pfeyXZYJhQdTSGSueObBbJL4XUfARGhbqFaAG/Rj6oqCQeacKub2xPCgd
	xbZgFle23iWTEZPYAx3ejAk4IIvAhL6LVLG/A7NqZ8Knz/HMz7POJzn4KKamnj4A+Zc3OA5pya/
	K7263CZaaPnpO3UmDOzohpY0ZV4fCBLUZhlnm/EXr73huYUFurO+rby0XqS87I9dyze8MIBel4j
	45VGOc4BqFy+ed2GGHQF6UVsI9ciqn+1ZoqpxLs2SCUO/uJbYR7BwLxA4h4Bisfz7tUGAsSzdBk
	D97wa3dReMpciUUqFi8nU862NFNCNs/XG5uvl9PJZODQdjBCLKcHEKzl2vtZO8fQOAsuvw38SsM
	BrrqqpyrBj2LWTDe69nfIh/dgWj4Z6pGqx8ehCAknk+ikBxGlS01s3bBocc+4qC/N2j9A5AVkT5
	V2esht/3DgtaznKS8DRc70nwzxUqnrk+e5VYvO00TJHL8SdLRnKkRxmpySae6NUOhwZ/BEln/wX
	G9LVu21luO/fCpnVvdlX0o+YK5V8CicM3kzjnz00T7VQRE9/rJrUWo/n0H/EHdqOdv5VOS3NjuJ
	EmEy3z7OLLkhSn31PJ6wx7xYT4u9qFlMTl/Gubjhrxt/oyZ9eu+Ts=
X-Received: by 2002:a05:6830:310e:b0:821:d65d:37c1 with SMTP id 46e09a7af769-85f1d102bf6mr708163a34.25.1793911940392;
        Thu, 05 Nov 2026 12:52:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:05 -0700
Subject: [PATCH v8 04/11] serial: 8250: share the RX trigger conversion
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-4-14024d2b184b@gmail.com>
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

