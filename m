Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299656;
	b=DZR7BWQfqzq6OOOOdb/PR3a15CjtySLp1BCi8tsWUfI8cT1w0pxoPbWgE87ZQetSd0hx
	 Jucz9zbNGC70ZsJu/olF2RkJou5U4uWopgjsICaDNOfX87ou0oI/1kgIAVmj0OpLGZOcA
	 UoWdPY9k7cx1h+3F/7adqt97xMvWJ2SEJnEJ2JGy5CxensSZiiOAR+ntEICSHb/hK4dBz
	 co8gGBcCiy9VyIOufOcO4KIvECM9vOfj+b7NqsekVOW83W236uJhzxZ/7GutCOQ9zHcfd
	 C4fcg6FaZtjWwbqtS2SjtCC3u/a0FAelOumI59U8jDIvbZJ9dwPBPbO5k1iWxVUsNVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
	b=TArdIWqobuKbhqCxK0rFR13yY/hHp7ZCfTUxjJN6fcB1yws6xZ3lbAbgpHquom7vpwlR
	 p7uLqOk9alugd5G1PADyQHIs+MCnePu1pJqwSkcNMxtYTSDfR7K90rxyp+AiEvso654cU
	 ylLO247iA+zWZm3eD077sIOkKBB4tAoRsEGew98kQy0yZ29h7oY1L/3C4j7Legr5MUM5j
	 bf1qyfq1YDinOOLXHIAXh+hUr403y36LptW9dBosNBkZNCgb3ZnDVo/rLDUhoFE4ptBxa
	 0iHpPCCAvkx4hdrfRRTJ4F/3ui0vaAVAgYacPl7wVAfnLcB3/nDQwS53zSN3sWdHV3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMw6STKk;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BC2606A338
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 18:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2BC2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMw6STKk
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-844a8bf7e25so1694333a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299655; x=1793904455; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
        b=uMw6STKkdkEtfNQiFn7NaRyoNmr3hVDIV7VuGJUdjpRwaDxd7JvIrpUahXEttO2WOs
         H415Qw7ibL9OscDM0VqZsRaDexmXTQRuda20bjysV5aI7pBq25VN+SsinM3SSG5ElI8D
         Mrvt4KVkygx7zUkegfGF8INnFnbj5B6Mui7QMJNySlB3s1Cd6DOsfuzDfh6DPzvdfNNQ
         7kkm+YfTcRxxMBC104vbr6phfguv1ai5g99/LzJepIjmpIG1al7CGLjMZ2SaSqMbh6VO
         v+rbjhCXoo0JgYVYKgkasjm1HmpYJVirlkFH7BeFrvNfolq29PdRV1XnzZCNzSjn1zc7
         YyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299655; x=1793904455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
        b=eBALA30bkfGBEprbE0BivSjMScgZl2L1ba1Qcz8KDs58uHnNAqBQ02bzizceJKNzQf
         LlRh5CMQwmTCU/C0AGQcBcKjf/Z8st4w+OpVLSy6auvVHNB9Is0KlDomcbWBU9QMHnDe
         obA+U1Yu+zWF2vfzPRyp8KhsasDe0d8UTk5bZ1uUI5wGkSgnN1lENqAtxBDfU+ralNIk
         Ijf+7FTBPgRi5Mbbtdp6CYxm0NHpDMk2FKAB5ZalAhqza/pt7xwQdJQxEfaSjvx4ZUHj
         +D0FhHrBrowAP2UMLeKPwYWqsJOis0bJQMR4/HffilyQficCl8zikP4OVbeQsxFh1z50
         PwAQ==
X-Forwarded-Encrypted: i=1; AKwUvBze4JLl39sL9ieujtzlset4YI1EqZAJFKe1dxUKCVyMnVae48tv11Tb5FQiDGbAZ6NGO/zDXDa9t6OUSA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKAhmaX7EiJfxlD0nOh7fDxl4/aJwoEAEn2rM10WtojN/kMMPJr
	0BUEMC6uU60/dmDNOPrWc873edujlBYyAR+7ryHKkG/Y5eDSG/MqUbsJ
X-Gm-Gg: AYBFou25tWoYB+Cz6oV6D2qfeErXidWZmQL4hx0psWMvgzeL3c1i75E3wNBW6Z5g7cR
	kbFMW4DBcW36nBoWbWVaobq2LV5lhWs8CuByDsOAwMewy3yeJpQFJOL2HCca5bzjJO4wyEmknKb
	BOB3REIfUFvIxUkCj2DlTNhezBiLyQeTLkaYKycd+U0/fGd8M+ydItYN+UnCS6LwZvz0UiAMUXz
	T61rbgQpP2jJF4EpVo358U+j9h9xYzxQirLwSFLbNTZgwakohT4UfJyWJvDZXq/iu0OUwvUDQnG
	BBTePhvExYa8AZDeg2MqooTJlrRBpxOKr3FgCCuvDUoVeZbrFyrL4wKjNurD9VOVg7TUiKm4wRB
	6gnjSPj0P7kXHVqpVuxZwvUX/S43UXvmB5bE9khycWT273aMyv7XRjdXeXXXHxJZHYLyDFHAB4f
	LVaun2QzAx5KxqhrA6SJ0gU7ETF1h5ggmj72b1k6Y8YihyXouKEjV817WqzuvQd3UZxPvJeHOH7
	MOSGXoZdc9NJtR2bmxAq8oSu1lcA3+nK13d50Jbxz32rj2IgkmiQJFOHELVSBYPRD+xvuiFQlUy
	BsSxkYrnZlCtELDCnKnFW3WARd6ZLXidzVw5aHQ08AoZfLo0iYrlcAj9DdSxyfn0iE3otdqVHv3
	0rnkpmf88UnFzQRG8WQNkJkKWDokavHcjGEWYAfp66S2ZrWsJ8psvAH+Ca64XrsKJ+SFWQoIlJA
	e2PwE4mKjnW1kMIOiDRI2Mu0NmCrreWlIlkGhHv1y4DqAVY7nD99wcJIbeRo/gzeXGgGPAgIO7
X-Received: by 2002:a05:6830:913:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-85d361417afmr94378a34.2.1793299654718;
        Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:23 -0600
Subject: [PATCH v5 2/8] serial: 8250: share the RX trigger conversion
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-2-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
so drivers with per-port threshold tables can use the same conversion as
the generic 8250 implementation. Keep the implementation in 8250_port.c and
export it for subdrivers.

Include the unsupported-table check in the helper and preserve the existing
nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..1600f2e45d76 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..fc3987b5a70c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,22 +3015,27 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	int i;
-
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
-	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
-			return (--i) << UART_FCR_R_TRIG_SHIFT;
+			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
 	}
 
 	return UART_FCR_R_TRIG_11;
 }
+EXPORT_SYMBOL_GPL(serial8250_bytes_to_fcr);
+
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
 
 static int do_get_rxtrig(struct tty_port *port)
 {

-- 
2.53.0

