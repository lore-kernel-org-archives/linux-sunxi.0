Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911956;
	b=K2hBbzB3ZEZWwoXNgylSbKp4AHtI8y/8lPQQKaumUbhHkgySId1Xb4FPuCmNuLqg+Jbj
	 lFIq5Fli9M40MjcOQlQ/BTanuZdWu6KyMHnaLgR5iDTivMaFloJvcfyoh8DXHkZLdrnwF
	 +63FsIEVHQ/3PBFux6Irii/Avbw82dW9ee2km3BFaA4eWESDWI93bqOIuWBw8LHsgjkUo
	 v7jTNW5nwCG+FCOTfYZaxCo+e2tfjd4/RlN+G5p1GcMZjhWtDC4aBHtQruPFlylheZkCQ
	 enlrPs0MGWhDjh3jGooD4s0Qsj6IGYuY8f31xefYH/EO6bLe1D0xHKIybFOzgnDHpEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
	b=VZSKkANVVK0Sx2aFTjWuwEeUlinPStelNHQAjwL6vQwGj6hYPhLYv5L4FtU4Ih4SvmHV
	 L/MssV6YEoh4qW2+lrNvrmr/hJaz8hrSBW2syL8+vpK3KV0Z52f1nPmUgm0u37VEVj24R
	 OGoitym050xEnk41g8mZE6B2fSuRQelK0lPb75gaLSk+YcRtFJCIeim457zyaEb8XtSAJ
	 qLVB9HVx//4cOZ1DIcmCQl0puZbDd+i7YJe6I/VKBOYY3FmlD+fPy9ZwpgJln+oJwTrFt
	 72F/w5zG20/6zEvFr5fM4oOi0uIFU/mGSp7+CIRnqD4SAj4L0Gb4a6RJQUUvRhGbHVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w3Fhe+ax;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B939606D82E
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B939606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w3Fhe+ax
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6f8a519e215so1204968eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911955; x=1794516755; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=w3Fhe+axEAg+NwI/dmVtRxkFEwUS4G8dvloyarJvZDzrVMFMtTrJo6pY1KS+4hn15C
         GjOM7qs1ZPNLveffSkouqUtULcz9PGyoFh9/2RwAaJQKPYj/0dhqiVniXxfeMjS5ps7K
         JgAjw33UzbYsifCSBkRlMoTAIcL6enZqk+QLILtIgI8M4sTbQ/mqujwIr7jBpBo15fKZ
         Qhv9BannhFB00NPCkK9M2v0ChHkeM+2xd7Uda6TGKJyHX5B2kwDqJiLEdmDZykBLSFua
         cD9zVls2r0lHlq7mkMY2+F7y4zXbKIBV5zVTdkl+uSHpNiStup6kk5Td8DqHLA7I0Y8e
         Tywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911955; x=1794516755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=SCpvS/z3VS67Z6UdK4IKxjEjn4kvjMnufsUcwPNKdu6eGYG9CjZSJ2DscoGRqQ8ukh
         j8wvCJ+ILALV3xo7ivejtq0fo2GFQdDvx/EUxmhBUL2FE1QQrw4PLPWa6H17ONyA6P5g
         djxdcW7oMYzVY1UVWaCJu4gwkwzzLPlUXPoRglsoQicd7XHmtH2WD2P25WoIi8c7fIV/
         oMWu9pa5Xd46S3m7zDUGKmZn8GkCT5Ra3Io5FetVLC5WdvWvvEm3NQzcb5apEMt6QSbx
         iZFEz1U22VLSC1UuZSpQX8elqY7csvqDQkmDrC76RjjmKA1QMvcv1FJRQ6i8Z9thINeS
         +h1g==
X-Forwarded-Encrypted: i=1; AKwUvByTtJYSS90Dh4z0b0CBnfu4LftEmTAV138tdjKPWLDZ0sgA/F5Iz7XOFMJxBV3+DHnKiDVVXsOOFXdFeg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8sNq64iprH9IZJL1qLyJPRgmgd7BAQER+XBCfVUW3fu3ZVWa80
	0v2qQnFbdkdsyKW8QLKXFphULTqnTLApoCilapt/nlAHAgv+/5PdUL1s
X-Gm-Gg: AYBFou3CGbwFN8+7lAVnFUaleR1eVynKa460XwRtmUtQLwHbxnntu100UzshTpz/hXY
	lnnoAgY2afw/3cLGYgoIHHa9tQJw/Ib9fVNYeZVmNhOwkT/3rzcFxEZBbE85R2F3gW86RmwjXi8
	embv/Ibdgv/cC0fUKxE/CentSqhyyMnNnnUOFTiWkj7WRjjKshr06iqb/jDAzvRnuYOWBXh9pyc
	1BK8350L55YNTpGi2wabMN1YG7jkKaK3n/pEhvNMlvN8lTNVKYwhBfw5CdpactZy+PKJJnmUvVm
	Gm8iDXmUfbIkRT0I9uKLPILXcnuOyul1y2g5aY7Yph6wiq2R1LLJNxFYGTyjnEIkkFLLiZ2agH7
	vIAlP5Ok/jwAAj7dcpPBDpm6ZYeo8H7JvUYOaDX2H0q2+k8vj0NU51qEvDaq9X4T6//fqJjEH+W
	EjrlHVByKP+Ta/oh8DJg6WM2/2PYZ7NnSSGit//M8cA5gLn2vmOs4Bo6Vg8HoY8l/aNdbkd74A5
	liHoZl3+ZZeCylp4Yaw3tMoT1BzbbCFowAgkb42++vxDGdsPv6ysfEA5QLv+T+DrwUjcT8aGU4k
	BpCjr7yg3yG/jFQSSwwWklTK2zaIGBAwZpm5ufu/nfBhgksIw7GUS/0n95DdMVixIY9usjWHNjU
	wCtXy9rFQ/8f88NOmebivzYq8gFpT4KfIMKgfbgUGyFRi8rKbfSp8baJZH3SKdVGh53/PeJb6V6
	EK1vqysNxUe+lmcG1Q2+CsS1esNWtpSPblm2DC2fo974F0KqH3mGtSPYexBjoiFveC8I+VJDwm
X-Received: by 2002:a05:6820:995:b0:6dd:c600:ec2e with SMTP id 006d021491bc7-716d20ba2a8mr2263018eaf.19.1793911954642;
        Thu, 05 Nov 2026 12:52:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:12 -0700
Subject: [PATCH v8 11/11] serial: 8250_dw: configure RX trigger thresholds
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-11-14024d2b184b@gmail.com>
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
 drivers/tty/serial/8250/8250_dw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 257baab5a3ed..31045128dcc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,21 @@ static int dw8250_setup(struct uart_port *p)
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
+	p->fifosize = p->fifosize ?: data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -934,8 +949,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
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

