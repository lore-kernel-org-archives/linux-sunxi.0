Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142348;
	b=zrNUfm2AZrzsAZXxDHrkWFJsNVdOCtnhNfUzcwIcjNT0D1zHH6Rmy0JfJVN2Z09ymCkk
	 y5uMZKUr7T3V4dx8MD1WU1gc1vIBDxWwxLG2BXRo+R9Eq/jUzicRzFcPYBBg9PvSd89rT
	 g1CHBSDZrDHgt3jxj6OsNQp49ar0d3allGoKiuv7OI08SozV+9yknLk7vezcgTKwh4FuY
	 Mtbbs0m3hQOmiH4/PoA3ZWevXQVAwiCifpEw8cr2KURh4Qg+4He8XnpR96N29+c5f+3iS
	 eg3bG4ntJccg+yS6fbAC41z8V3MlTps8eNm8/KLPbHLvUqYEqK0XICYP4aVuBUhae3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=;
	b=kN5CZuqTcqXknZ9ChIofgDwkcQxee8DYBcNFkSu7hotjiWNS18xbFaLjfjWWJ+IgkWjh
	 8xQF7qqUhfNeFcAt5JaD5rwcmLqH80de+GD10aWnDLMO2J55UC18ZvwlNEHz4lgQFsExN
	 BYDmLk1XCfHsjQCe+tCCSh2b47oVLCOT3LiVayfnltni52drjHqiT2aQp5Ax+NJJoykiq
	 Sp+3bqJWi6AOCsYpNiqr7sHfEqCR64iV7Ce7JMGo+YsW9Y4H5N5qTIk3AuR/OlocBVRGK
	 PNPb8Spj/UbDxkQN+ufPAqpfbhonIwciB1JRRsLkbYfuUVhb07UxRjpO/CWgjPrNmWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8WdjZqr;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D20606A31E
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 23:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8WdjZqr
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70059e4dab6so297538eaf.3
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 16:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142347; x=1793747147; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=;
        b=E8WdjZqrTS7DRGHIlwjCb5fM182B7vMcyfRpozGkAGYPtZ21+E+iZRjpA94iQW/vlJ
         Ze9vu01xR2lFYoBZb0+htRI5VoHT4XVQhxxYXQJdGW0Qrqo9DRoZeXNO7jVvw0izwyqN
         tZIGUi+QU8RItZhv7hmrKjJa04WXuzSTos/C7t3Qq3gdO+hOm7Qgfmd7anEgy8Ulbpup
         BmPD1EWdXramU6r/E7fJjRKYqnmH3C2c+QsBwpNFEaQAU7M1W9FAa3CnXgW5OhMTIL+t
         eY5xOArRTT0/uUhMIM0rbdem23hgxUh2dC4SWKYJJjWp+cunlgsFopWKN0JDmYAP2vEz
         V1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142347; x=1793747147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=;
        b=gtIdRdUFO24fRaW2Bxfqw7x3fNor3XgpL7ZTevpL+1HOjGS7HR/PnroiT6xlKL2G/R
         YbHnlvYEKYC4SkOQnufkpASOX1X522PxUzRJWh3cVcaQSGGU9EfO9VwDlYGcx8vhx1jx
         crjFJBW7sl6LGa+1ptThc9Y7fh0gxTA8pA91RdvH3S+GGKwsRCIS8n4Z8PwO/nmM9MXn
         6palpKqeL/Q31MTu6gCiiwQwCZFVm4Ji3+MppKFTXbu3DDoRVorVBc3o5xGjOFdHaaOp
         yYOFTSKj6cho96L5PH9W6NhvCogkHY7lCp5Lv0I1nCgaEPfaUxXQLTRr3RNYTsM/0yWT
         y8WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTzkHWth1OGhPas5g7+Py0HjFE8xBTXc0imZZup8SnuXt680JY7FB0PRUwAeA/skDfTv3DaQt6D27KDw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKnvqae9EX38pHdKAR+HZpIW63V1EMjnMnGZTqViQvp1ErJY0Jv
	bbmRGEEbNlXYphKw2J8UxLRQUogpXhRiP6cfGJ07WA0Fd+wgeHwB5NMEdshZZ4ar
X-Gm-Gg: AYBFou3cHHoHuFklaO02+BHQSqN9QVszi2oy3fGO03XWAw+UTijaty2cYtocTsgQxwm
	3yVCEHyn+o5SJbYnwY29hTVEKYveG2qZLzo7VdPy71MC5ilgNgQg14b3Amm9BaMafOw7wUCVnIu
	wnghUSDO8hDsXRcPlbr9pQVRxC2pYrnErO3hGz4zXdPR3IEwoZ2t8GiLLeRudgILd59udIh9ohr
	E3oG1y54xM7e3tGT4lAmsNTmIELfDFbf55DGXIvZIYvbQqPZxtL4rselFD4u/orVrZj1f8F+R03
	vdeKadGeWV3uIpr2tq0qJinhOQ9LlS6H9O7XFWgYqigKfaPf/BRasZj49dkWbzU1hL6vu+o2AXK
	PAQtQK1EPhXQU5bZy44B3eoUjSlT0drlmYUPCezaTksQbXwk+01lNLVklm9LlE+jHKYYAp97gSf
	MrP++14SPqybjCj3wWqEfdRsFBB8XErMiTFNpHy/1IDnf9y3vdjivJlocsJy9mzHuqkdzyFSqq4
	eA0rLxcocVEcF4xrJGcughZYXOuUH9qCQejbFlVSGnnME8/z1qFm/Qy4fQCHUcCwjBLt+ho3IUp
	9ZB9xG73jRmBb7BoUsggAGANqRxU4U1oIEPPxcMgRppTQwt7HFX2oJaSaMvg7ruRp2LQ/0pCsBi
	7HJ6e4FVQzvVNRbMryFAtbUETp4NPIfAf75m+hMe7BcTrmAap9L4UBCAbGY+VuW2HOheijpQgol
	d6Xw==
X-Received: by 2002:a05:6820:3385:20b0:713:da3b:901d with SMTP id 006d021491bc7-713f21629bfmr243308eaf.79.1793142346826;
        Tue, 27 Oct 2026 16:05:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:30 -0600
Subject: [PATCH v4 2/5] serial: 8250: share the RX trigger conversion
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
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

Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
so drivers with per-port threshold tables can use the same conversion as
the generic 8250 implementation.

Include the unsupported-table check in the helper and preserve the existing
nearest-lower selection and highest-encoding fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      | 16 ++++++++++++++++
 drivers/tty/serial/8250/8250_port.c | 12 +-----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..195ed58a2231 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/errno.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/dmaengine.h>
@@ -73,6 +74,21 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+static inline int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes,
+					  unsigned char bytes)
+{
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+		return -EOPNOTSUPP;
+
+	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
+		if (bytes < rxtrig_bytes[i])
+			/* Use the nearest lower value */
+			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
+	}
+
+	return UART_FCR_R_TRIG_11;
+}
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..c332963dc2ed 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3018,18 +3018,8 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
-		return -EOPNOTSUPP;
-
-	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
-			/* Use the nearest lower value */
-			return (--i) << UART_FCR_R_TRIG_SHIFT;
-	}
-
-	return UART_FCR_R_TRIG_11;
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
 }
 
 static int do_get_rxtrig(struct tty_port *port)

-- 
2.53.0

