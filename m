Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280403;
	b=dlLdQ3lKgRkgXxeIgkImIB3FtUoUXKFtEOPgQqR51bIxKuLzhnIVODgaTYZBVZepC2gD
	 5CF0zxNFza9Pb2wNr2vg9Y8bVNK9c52IpVRF0dKDLA/ueIP82t4FskkZXjr60os8NtYU0
	 Q6QLXh0AWds4jd0X1H+/+gKga21Z3pYqjyNbJWYHZ0sdWVuxqk22cF3lk00iuQA5cspGV
	 TSEKTsZ1Y8POFvqxoSjCB6FllRGtZMq6rXSeTGJ8xmuvB9WP+7MIOMnSxS1HuqCRhH0Sh
	 QEv2B7yB1Ng8YXUpW7TJDOmwO75s17lchAuX36iSAFR2yukpCRt323wtodlra9zQq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
	b=qD6LM9aYAWqzsRyVPgsG6RHHkl+4M/V9zoAXfzHRHhZHH623jaJ1hMUguSubu+bx4T8b
	 jDmzGQSaLgJA96LRy8HokS/YMUliC1nyuSkQ680dHZs0ieXFiOBd/PbOsBbdn20fHIAyn
	 xgqp1egng8t6OjCHgafG5xyhAQN2xPLJwt7cLWHryl/+vwSbnkzQhMZLe1RcnzMvtyKCR
	 NaEDBth1I2uUUR4PORp1Nza1wsxMMjKuyEgAQNOyvKvj5mqHf9rL7i5og7RceUeudY7h7
	 7nO5ox5DPRyKCKpOu3NCqOoZuUjizRtnmiZGsnrXkL2ezWiR4no7qMrYDdvZSHTIb5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2sgRd42;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377360A5BC5
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2377360A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2sgRd42
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70059e4dab6so858824eaf.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280402; x=1794885202; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=X2sgRd42vMmNNN0KphVxDWizWhQkmI/0BdCYHrkjtYR9wWErx8xvyjOtwvTCF4Q8sw
         aSyGLynbNdz+7eu2zzOpIjm0P0nsIal+kFeMa4MPmx/haDaAaVgAnBAr5NM19kR29hCi
         vT0AxYhHhosIz0116KywK/xVdFIsuPbUmjeUuDuhK+RSX35x+28IjCnxzF6i+c1dPF1k
         3shQEy6ZbzxiLMrmT0bDV/0JIfAwu55eKkfzlqLEmEC35zGabftxrt6XQVOPqf6UG9Xj
         1dJcSfaVm0YFD7QX5/Wr64xnu1FWFlpu7jH1dmtBgVEdXmi4zJppIUG618pOPNnURbAV
         xK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280402; x=1794885202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=p4Waie/CF4+7sHX7Vhj7M3G36sycoa3VqU5xFlgxIEYc/hh2zkc+gjZbIWjBTtij/B
         AiAZIBh/yIL+PXS1ONhzwx8wqgznj6+W+R7u10vU3smHVLnt1fhwg3NJ61oURUjXjqX/
         w1cBn/QMaeSyZviMb7sQpmSwPIFsqj9VVKjZy5Em0l+RiJJu5EzTX34Y4oHe0aerJJZy
         QaHiPJYIK4RmpC7dUHgJUUXsTAoxHp/jDdrfsZDTszfWCmpy3HPgSa7xn7PkZbu2pnzE
         UAVyXavGO+uOjDd2bQOcE1J//C7HxaN27FgiXc7DxjUorlxe47erZNG0br9g3CKhDmaP
         CmFg==
X-Forwarded-Encrypted: i=1; AL+hErEVSOqD+XV4jN1OtEBbYE07VS/xBWxGNvOIsYBmk6GNZSah7hgAA2bOyqZN8CRGTe1zRG4jYb4QLIYkQA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+VS4PLizpBgsB+RLcnb/YTKNTCXQ54ciPJNeVjKl3plvBEENGn
	cY+ZcSnw8qD2gyAoO/Zb8GLVKutyx3D4kLmNDmonXdF8DhVbs/UqjqsR
X-Gm-Gg: AYBFou0rcAsDyFD6PZPoNKHGn+Lh+id9wVdwqqZ/EBcfAEWFcQyr0s9Bm7KybkxytYy
	KbCsxV02k8GM2/BfpmRwBV7tOF+zyCgyve1ZXauBkjUfpdEU9kAS/3SDZNrGqFWXdMA8xegOc9d
	E+hvcjink8pa1t+5xPQzx4NbMdG4aT4y1NvBIpdKHRHKBGkWSMUDG1XfY7Z7fXF4+lTZ3GeQL9m
	pJHqSkV9EpcUQnj/oUziee/dnNr9V0Po6FfqjLah9esedjTqdkiAcB5/0k0Vfz33HHq2c/fd/qf
	Jr5Jz84BUlEHvoRR28JNe6suzTpEpPw0LVxAola/0FZ6cU21pMljWiB/0MdeeyUgqXexurYhQTG
	aEbDBtQl3bE41c39TWLlyWcv1Ew+eG5BSi77lsFgzjVLTv71GxhUQdXasipRJods9HT1pkgcVw5
	SvX/vDx1v07qw1+7MxZXkWZtiq4ZHMfcJClbxNGQVT+h5EvcDzAyq0kpshwY11U+rn70SojwVhj
	A4KdQHs7jDYfmcqA2MVCfQzoG60CQVG5YyTCattwCp2+JAIwmZ8r21nfnOfBGxN9msUvIoL4sTt
	cMTe16xiiZnfyIs9pjXVY5Ao4bHco/GifgVSpR0p9IkD/bHtiOPrT+Rp4Kkk5JrONmmhc9pFPJD
	44kPhXI5jBcxkF78UCoKkiABKf57l1OmtRHM8DSN3T2uwEfGA22uIR5DcRLFfaSspUPIIIrZ9Ls
	ktthftPj39eLwBUIB9Y5+5MmCVM2sOLV45DPbJ8qpFcdRP5/JRieGuwkdbdHfMNHrOD5ldMwsuG
	g==
X-Received: by 2002:a05:6808:1713:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5683c945eb5mr1088933b6e.19.1794280402120;
        Mon, 09 Nov 2026 19:13:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:57 -0700
Subject: [PATCH v9 08/11] serial: 8250_dw: configure the Allwinner H616
 UART
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-8-3f03961dae8a@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and supply the fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth. Use the shared
DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
thresholds, with the normal half-full FCR setting selecting 128 bytes.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path for hardware CTS handling.

Select this configuration through the platform setup callback. H616
has debug-divisor and RS485 control registers overlapping the optional
DesignWare feature probes. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..a55f60330a51 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -657,6 +658,31 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	ret = dw8250_setup_rxtrig(p);
+	if (ret)
+		return ret;
+
+	/* Use software RS485 with the Allwinner register layout */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	return 0;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -880,6 +906,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.fifo_size = 256,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +964,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

