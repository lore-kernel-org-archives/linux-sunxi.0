Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280408;
	b=aUZ8ysSp8/J3pOrU6PpvaYs0LxibvM5CcTMuklTxEVM44iVke4lpiQRFkMWg7Px46Yyi
	 LCkrsN5seSr+oYipt1lE790fnUlwOFUcLH4sZmv17K0ix4uzWY/Fr9dV4iPfQatV5VBnG
	 +gtBlqO2ejLPO9rOxze40wvydPP6wgRer7SvQ9X0WjKj4EKsNdNy8tk3bITKJGJ6rfCeY
	 pWA/hdCyCuJ/Xtea2yxz5xi0+HnfkfjIUOzEylhIlRpFhGouMv4HcrogfCug5WK+1z4oP
	 HWe++Dd2sGpkVmMETQEKYS30ZHet757lTk9M6wtt+kw/Kosaolal4T/kT/NsVs+dDxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
	b=PuToPIqk1xE3YPFCMV3kO62hZbvFRnrZYme729v9ROA6P2N02TPFtcwsDEgyuI4yAEa9
	 h0qLm2ckHQFmpStEyctcG63XjPfEqfj4RpMvWCucLyu6boFp6MPMatbCV6D53Cnr1iK8L
	 6eZxOS/4B55sme/M1vmWbYVMbdy4Fkc9NbCSL6XHuIO7oWTlCC77fKSIaqvNUFnSROJpH
	 4cMdueZt+z/66/aMlNujh+6NXlVwfqA1r6aaqpxlr6teVws2IhCS3T4/iQodHh7rIBvI0
	 1cleCgRH4Kl7FVks4nMrm/NteeqC6jesL4rjJk9UOInFBjB1cgJbf/UetpvCVJ7B/sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=htspax5W;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA8460A6F51
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA8460A6F51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=htspax5W
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1283638b6e.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280406; x=1794885206; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=htspax5WdF2zb1yZ7yogMa/O2LOs402y/EbdNLFsRzLbfmKG9F2u2e05AavufLCaA2
         gYxIiR4QqpZ9noMmXUe9oovBsu3aBTqsQVtbc9NGXNvaHB1nGPGNUsoSE5d4p3TPQGcJ
         qIguNuTqqwfKjNalpLQ38ul1cE49T/6GsoLi6GFjKb4qOmRtwsupYgn6NzdULmgiyfBH
         VpqpWwpctePGyULNv6+z78Ebo4QVFZv5lwOP4A17i1MRCshXnCSgVfhTDRZFu4KBvoYh
         +xq/XMPnqnnoy0gwPqHFqSqaO6yuB/RFJrzpmCGy19sCqKh17bRWNklHtwwhwPI/vo30
         4FXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280406; x=1794885206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=kMLAbDuTGk0DqDpQEOEgbvl30BZ2+uX1Z46BrXgFJDSoulGvQKRCDlQ+CDpFA18Rem
         ujCgffXHWkTGwhgZayGOQEY2QAyiwwcDg6ZEtg2rHUWBlF9OfFq0qzZrXUMlisOKw+1X
         e2Xm7TcwtL1rqUf6xOPE2ufhfT0csmQOR8bkmAvnPtzG4ZQ3nWiI++6H8Km0opjcANNE
         0QSC880ml8h5cE/No0i8cbN3dY0MMB7VEp5q5q/h4AlgopwlX5i8p5Vvg7Z1uXYC/AVO
         a+fjMZb4WDY47tDAhcKChN459cQ9jjUZcMz71K+QJkjFWe9suWAekgMgjQGJpNhGwzTO
         Ir6A==
X-Forwarded-Encrypted: i=1; AL+hErF5O/RpR91YymUY2pKA0pWT8opOEYGaz9EuAooohJZ64Nunx4DpmXzf9AYhFHf6t+tawCHw4VX/OZqetA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/K7JYf93qv612pcjJ4CPz8NNa532BK9YvXal4Oy6oCnI4mBBDY
	D4wYe2iWwWWmrM7svYDFW8T7ICdwHc3FMI75dUxG8HvRiTGWw6nSjk99
X-Gm-Gg: AYBFou2714zGVGzGxQVlcq/R3VDk5clGpDDxvgw0TqB9Ewl7XD32iOgpZ3jekmupFrQ
	9eV2qSbQbXXgQXvKPpaMZSSf0pTiOBPDZBoVN7y9yV6GYWEs5X4iOHX5+VIdFvKgCg5DUf/AHqu
	84DiTUT1rlhOEZ4B3SeX2gLKuMrS2t9E/D/vqWnCCVgOMnVX0bqPPwjxMkKrLifNGkoUv5PVJ+i
	Vxqp3K+cslpRyJzgxhFgo2ZuUq0pWvmqwSA7AzWhycdeaXYwHkfvLL+tANMzcXezbTsJshKMtDE
	BDhQ2XuaLkQIjiTsknLH0KVo1n3YZy5gDUQ/reY4W8UQBRp0DqbSmSs2jr1TgIF5YZz+oDsah5K
	9tuemLOme5JPb/taHOx3ZPfFu0rEhNGj3U+GUhmKRW18LRIB7PKnAwtpHXMdQdn6uTe1ZHgtqhW
	p3+13i/OW48QPkOpz8hFvr8cPRcboMT+XiSnOFrgsTUviEo1MUVFzJ6GAEWEo5FJuKsRkHSRdum
	oaP6YJNHkJSvUsVPyDbgZM8R8gbGZHzlZTs/1QsDKHVCyq3PUK7F4VfpWiRehH2Mj+MVSOOYnSP
	ADeOwow0lDdD/G+swJi6BJ1W3wi83A9ioFrJNSasTpqw/m3C8hJOk0TewnkRA8ZsFUlEw5o0H32
	YK7B7MI6TI+ZMG7MUFfzqofmXIaHm/JILG+oS3ryI6T/Pwl/mjmJgZuCLh/9+E3ilg+avrCFpwN
	maPF9ffsNDryGC46Y2jXy0uIye0puprWtc1bSMbDWQ0KRehla9rj9S
X-Received: by 2002:a05:6808:150d:b0:521:561a:8e8c with SMTP id 5614622812f47-568813057e5mr726068b6e.33.1794280406385;
        Mon, 09 Nov 2026 19:13:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:13:00 -0700
Subject: [PATCH v9 11/11] serial: 8250_dw: configure RX trigger thresholds
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-11-3f03961dae8a@gmail.com>
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

