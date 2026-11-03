Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742019;
	b=IQtOFRPtBygHtoSSAx8qoTohJbPjMWLYdN4ekVr0riHe/3vXpFbYFahobg+vofeJ/78L
	 tATT9+vdFizBXQU3n0Kme9vrrAk82GasCGLoEC8bJF1KLNJhQf+xj2FLsnta1rdokuFjx
	 +LUFKt+zgm0XzQWwfGqk+diD1lrHkqlFDyn6oZEKLemH8fMAH6t8dZD6iexTMF1AavrlM
	 zBpEATm44P15iSRJu8UN2o31/QQjtzxuE8KP4VQ5RfxVPT1MMpYgfFmar701b4p4T5tGM
	 WQY1d1+nwzPs03c25A+JZrYGh/34xJRa06gnAa39xQimZPMWbbpIdnYb3QmUZpMT2KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
	b=NSduoAAp1YYlghJj5Kn4/O2+GPcW4ATcXtx0zh4XDz49bJIZE6HrtfKrDoRNFiXjszjY
	 CmsHG2hKKKgry6xjqwhmkSu8Izk7yd8GfYoMtFKdZC1XwAKY2z23idVH8Oi26OPFSN/m8
	 8jDnrLyQIKKeOgRM95BQr3RrI7IUNLP0OBDlo7x/bBop2nFQ5cp9i7d79c1w7nPLtOHg5
	 W/cHtBTRPjmtofR34XBNuM0A3scd7eRbCz5sZuw1vIvVe24DK0sBqE5+Fz9CjdOyDxCGv
	 CAZtmcce3x+oq/t6MMEF7JC+6Neq9yv1ymI/9oMJS2SZ8rxU7fIS1nBG+Nr57FelVQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSPFWdR2;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00976082BC6
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00976082BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSPFWdR2
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-5641f26ce05so32194b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742018; x=1794346818; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
        b=bSPFWdR2j6dZFCVUt5oADf3eQ3C0OUD12xdIVlMNY5Vo2oLapQEHxdSooWS2AZxVur
         4nfWbdPTcRbMvTYN6Q4U7vcxVRjW7o7k7XAbubgxYqnqQr6Fz6gKHNZYcbU2MhzT9qAC
         /3H8O7MKYVILxan71vKw45R8e+rR9Eb1WXIIGq5wbPjOj/HqHB25evl6TTwQz4XF9KB4
         01WQd/hmv94fh99gjKmwLuzAeubxD8LzVp+kyWw5GI3c5RXzkgg+geJxKYrisaNwXX9n
         TnUprq12uZE280+m3m0o4pMQW3EWmYupRvQ0AKsggzQH938UmPAp2ufhm6Z1AOK5GQih
         YWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742018; x=1794346818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
        b=HRtiYN4unmlzMK0/WwyeXCiTq+i6R8Sa3ZQiFXlY6YvYLtDFg/WgReFtROS/QFpL4e
         Fc0I7T9e9txOj/y2La+MqmeyrRdkq3dZmPTnF2khQyFRffYsMny10ud9sWfZGDzF0mA/
         gQZLer2deKbKip01FKQON8ctor1iMDDEBhTNnT9oLsn1CoWr+VquPViYH3Ew54G3Zh8a
         +QC9a1/re1a6nfHgxSHBBIoHuzzbNVbfj6QFlzCY4C5Oq7H+7u4iDr33cjBe17/93UBn
         BgwItS7zFCA6MK/jrI/nzfRUUS1b+2jGKjSpoBnd3wqaA8OEYsRYFqLuqD3U8TEoMpVM
         BkRw==
X-Forwarded-Encrypted: i=1; AKwUvByDL6E7aFIJeIKAq2pMgLRuVedmjpT3j6i/SMgdxShpN3I45cBQj4cZTa/y0SMuA9/CEiyhCUOmUE/vdQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+iXI6vWipdjtYoSryF7Tg5heRIfHO4uWnhvN55umW0sd3eYR+3
	9EaMAS2M5FlpnWvIlhF7Ivq8y/4HYgl+HqxcF1+e1vwtCMUBXy4a/rQ5qLXPAczn
X-Gm-Gg: AYBFou0B9x6W1VAnG+Jtgdnrtt1jMpNGZzvK+Z+Y4tQOiNkuqMfBePQhXYfL5vT+l38
	iAponVhFeETNRVIPRnYR2v4gTfh4we/iVgY+sYKtU4jHPmXKlWLjgwCmc7j9R3ga+wytag1aM2d
	+BkXD/MmlmYzlcAbyf6wk7OatB+8eugl/tp1urJiGLr8QqlvlbpqadNXJ17f5a0r4+QDZEK8aqr
	BmDXdSmvGj1Otr7XMnTbiV3087OwOm8QmYQVBbKGy6njAzoTEnGBS9y45WwIBJ3QNatMaHzqE88
	lQpqHPFvETTX55A4Wwt+bblpDLPjL3Cf9bJ4ejI6FVxs6QSPnQtVGSf6V2d0S0TpIaet6exCDuu
	yv8cn6lOK8FkCQl7q1RAmBTaScdAa4hbu39TOsfAPALiZJsOfw0asRMbhjv/aTtIgMvt2te5BaZ
	NaDvvfjFDC0beG/jf+ToVfjuzr/zAa+XkGUNnRt/9aBm0sAfEhlqWemWwi1nPKiD331ZdzfpZ1S
	J3NmcAHQLsBQpbeNXf4pjptBUFbcgYCCuPbKQPBzNkmzUiWA/EEsuNqulrsmXUXRqNwifI8+5xp
	P0OktjfurY0sdjubmAj9iObxPNwMbAp/J48Y8FY73dWwZARqeZMFSd0k1iueHO33j7OufuOieMq
	F/4RAQjAO0vwDhcVBsJtHM+jJOJ1RopbxTQ2BPjQbp5WY7odINgY4nhmigjRfONOgJLOniFHqYt
	YSsGXpUij2SVCOkTx4KTnjmC6HEebraKTbxswx/uD4bUTuSFCwHVuRMS6RwONJ7gQNzNRgkcBQR
	Q==
X-Received: by 2002:a05:6808:1997:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-5640e035525mr10789884b6e.59.1793742017956;
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:05 -0700
Subject: [PATCH v7 12/12] serial: 8250_dw: configure RX trigger thresholds
 for Octeon
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-12-c9e248d685c1@gmail.com>
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

Octeon uses the DesignWare receive-trigger mapping with a 64-byte FIFO,
giving thresholds of 1, 16, 32 and 62 bytes. Its setup bypasses
dw8250_setup_port(), so it does not install the common trigger callbacks.
PORT_OCTEON also has no static trigger table, so rx_trig_bytes is not
exposed.

Supply the fixed depth from platform data when firmware has not provided
one and initialize the common trigger table before port registration.
This makes rx_trig_bytes available while preserving the Octeon port type
and register accessors.

Select DMA before filling in the default depth, as before when the 8250
core supplied that default during registration. Thus the new trigger
setup preserves which ports attach DMA and their existing burst sizes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index cdd3a62dfa7e..063441923864 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,22 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_octeon_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	int ret;
+
+	/* Preserve DMA selection before supplying the fixed FIFO depth */
+	ret = dw8250_setup_dma(p);
+	if (ret)
+		return ret;
+
+	if (!p->fifosize)
+		p->fifosize = data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -931,8 +947,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
+	.fifo_size = 64,
 	.quirks = DW_UART_QUIRK_OCTEON,
-	.setup = dw8250_setup_dma,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

