Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873356;
	b=tSa9fxSSx4AvwRZyVyLgxkZg00SK3ACaffolxHtLXtxpabyav2frj4ofJ80apmA7xPMc
	 kmkD5gydRluSY4LKGUo8Qxu7wVSO5hfAr0/tzYZXYOJHD13y2i/g229i/0XssdLguKHR5
	 KlmEpsK139akZtROUPem8Y0l4V5Ir8u3ArsU5CLofXtzaKQplfWMfAkcq7NCWjNuJPX1w
	 HVr8OEZg6WJUVYCFml+CL23oi7ptLw5+x2lDOYUEEtGNiBnFKtAvGRslacdH/fxlOENCw
	 L8p1lYV2YG69KqrW0LGvPav/acTrj/t3mq3iogjjt+xfhacxzKtxjKWKos2oOlPWL/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
	b=ao6X+VDOrOpBP4reyMAYbeMU8JZonlBsYecis8RuAugH9J58LKeYTq658Ke+9aDBoOb2
	 77zBi9hKWx5ChKe6UM2Qd/sScHWFasgSP9DivWPB+T/bbEX0LtcjlxY5OJEBicszmS4cp
	 4RhBPo7vgzzDeh1VbXMnVeK/2W/l2hiXA0VdHDSpgFw68AbKG4r1wxdNJhYdZI7CITUzj
	 Yn4BnvN2fwz/cP7mH8odVLxSQun9bWK+ZzW/uXCodjAkrAuz/DVQcelWPBkRQXAril0vs
	 8kiQ8jSaQljpoOYgNiaowNpy9Z0bPSOIrrMrHHlbeBo00KYxWypmkofpWPSk2xc1t0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="I4t/ixHS";
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4832E606A328
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 20:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4832E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I4t/ixHS
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4ed6d69bdfaso1054823b6e.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873355; x=1793478155; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
        b=I4t/ixHSJwAmVgg2qxXrelOaJ8zjoQlzY/5cPRn9v4BpjaTXZzOfjqZqXvwkZgsDmd
         1JeLFK3zsf4rCmTr/a7SZv1q3oPCTlAXITSTFuOiyfdCZVf3Z1HF4/9dGYPqP1vjVmkA
         +fMI4mS5dsZK5rpcO7cOchdBWDZw1sIn33yYeqFW0BGcNUwit8WDX0Ye0BT4w8n+Xj0l
         MZrAc7AwT/31LrR6qM4x4INwsg5ViAyEXaiq5SC+CtPg27uSqd9Sgm1K0IAqQdXVhWZv
         IZJnt4wcEJRxdC9j9BwYyuK5K8qmOUhS4Epmtw3HmzMSe9UKONtkcwx428E6T4jtBLoD
         GClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873355; x=1793478155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
        b=OGs92l+TF8A9hwWW3iXNVAtkRjPLFryHHjFryCm93VAWHWy8a0RXUjx59UKbC8f0D+
         h4NVcgcVwzCa3i+YNmTQi8JxJDq95h8n8lJz2SqVxO9Wi6sqzlpr1/mu+QOwkd7GGpsg
         AH6s0nIR1ol/9hhn8LkhFD3YCD9xomDZk45BfUKppBfi5Mnir7HFWo3YzV0Js5ulTHCb
         Dq93p114jd/OZ/a5uheveIVvdDre+UzmT6YCiJzWBBpE5CJC/NXhYbvEe2hK3iOsO0ri
         ahG5Jehdy5bCeQ7vnnkt8DIowUtThsauzG7U1lnGzhorDm17hA99iq0D/Y5kLkuLNdTS
         oa/w==
X-Forwarded-Encrypted: i=1; AKwUvBwKRzXxFMLZ06vAvTj49xLwB8gZqTGygsTCHbiuaEPD/daK1+QQKe4L4dpU70a/DQhiDN76vgHzCwAp/A==@lists.linux.dev
X-Gm-Message-State: AFq9FYIfSL1FBFpR7m4M+vcXmVZp+7XN9E5ubKDfWOU67NHf6/e43etl
	UcA7tX2f+gyKaAYXfhlrnhwArVR0JE13pM1+yMvHPzWBtH+JLAP1RCB+
X-Gm-Gg: AYBFou0TjusWlMLp4KUhkoQNhukSpLx4wbfgMebXsT4SKfxku9WmD4NaluHOoRaoe+u
	5olf0Snv3Tea21utkN7U+E6USP545nbmCQEgeaXWVrIkQXlKqL6suN1z9uaBNqnYvt6vK1DNtnj
	NsMApYGBUTkChMSUAzdNcUItk2gQPqdVN3d+55Tug6Kvu906kFDzeZGvY5EG2hbjda+Z6uXAdKP
	JT1fWpuQ1Gj162Rj1nZXpdS2tobeR9HvaxSmbbnrXIcdkR74CgLvJI06bMsY0MtiS5ws5xSUFi6
	+OpN12RUR/NV/DXL4LbYszT7Se43YJoiefoBLf1H+binH0CEL5/E1SnMSbWUDrBEGE60ypmfSGe
	x2xX8VLkGX+/B3JJroOi6npEFSXG1acJhHqF1U8IVw7HpC2dw8oTDGP9L/xd+z2hM6utzHFKwhz
	iLnz75WvDnbFggPRmPmwgL7BfcjuswQUIqFB37PlHXMVwflXq9AJcdqbouF7CvBknZt9fGOUZcq
	LJ5EZspjJDuickMNAxc5Re38wI+4dxMjKQltVl1Tr+f6kZxSzBIe2rcE0u61Kgh5oBHoZ3SiSeK
	SdB5i1Kwl2IpdZbxOnExSH6+FsUJnFklDgxnvrgUti1HwxoyYs9izPnlnd8t+PPyddiDiKjPrZk
	9/BWLi3ciEYD+UsF7bmb7jT6t30OPYyb+N4mSU93yYv1GzNT4M5Hz2xMGvM7rnndImDAg+bzz5d
	OqI6feuu/hRylBQ+2542gg1/kM
X-Received: by 2002:a05:6808:1786:b0:4ec:d521:9124 with SMTP id 5614622812f47-55c002e11f9mr2173304b6e.30.1792873355240;
        Sat, 24 Oct 2026 13:22:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:23 -0600
Subject: [PATCH v3 1/4] serial: 8250_dw: select port setup through platform
 data
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-1-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered.

Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
Octeon continues to skip optional-register probing while retaining its DMA
setup; on 32-bit builds it retains the generic setup. Keep generic setup
for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..9c171c5775a6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	void (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -595,7 +595,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -630,6 +629,25 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* If we have a valid fifosize, try hooking up DMA */
+	if (p->fifosize) {
+		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+		up->dma = &data->data.dma;
+	}
+}
+
+static void dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +783,11 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
+	if (data->pdata) {
+		if (data->pdata->setup)
+			data->pdata->setup(p);
+	} else {
+		dw8250_setup(p);
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -852,16 +867,23 @@ static _DEFINE_DEV_PM_OPS(dw8250_pm_ops, dw8250_suspend, dw8250_resume,
 
 static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+#ifdef CONFIG_64BIT
+	.setup = dw8250_setup_dma,
+#else
+	.setup = dw8250_setup,
+#endif
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_ARMADA_38X,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
@@ -876,16 +898,19 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 		     DW_UART_CPR_DMA_EXTRA |
 		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(16),
 	.quirks = DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_intc10ee = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_IER_KICK,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
@@ -895,11 +920,13 @@ static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
 		     DW_UART_CPR_DMA_EXTRA |
 		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(32),
 	.quirks = DW_UART_QUIRK_CPR_VALUE,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_tda54 = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ,
+	.setup = dw8250_setup,
 };
 
 static const struct of_device_id dw8250_of_match[] = {
@@ -918,6 +945,7 @@ MODULE_DEVICE_TABLE(of, dw8250_of_match);
 static const struct dw8250_platform_data dw8250_apmc0d08 = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_APMC0D08,
+	.setup = dw8250_setup,
 };
 
 static const struct acpi_device_id dw8250_acpi_match[] = {

-- 
2.53.0

