Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280399;
	b=lmMX00UjCsiFqINC8X5NzA1iluCpuMkrkiFmQvNoBtKy3T36XlbolhxjD+WETGQN02I3
	 dfQTygyA/64XWvyuTiEt2eZUcIwC7b9P0sY7sPA7G6cCyirPYUBH6wCZ4dL7TSjhTrmew
	 55EbGPMBULrW1jWF6W+xlrfl4yos8GiTpYzPsalbN2VaTTVbJRk67InGYH1HGlMfuW/oC
	 cmZkVsPHXM7k6bJ5C6fXTGHjqis77DZIXHaXstrRnJ2uaONGPxTVJ6UpggVpMnjJN5BO4
	 za+Wf9To6kDIB3d9Nj1GNRphMzK5CIrWUpNi/eFTWuz92U9QtktKnVYNm36ZV8YOxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=coAqWVa9STcAjW4hoyOJO7aWAg5nOjGLEjkS9FzWYtA4QZkO2yK+RK9oLRHdoA34KLRp
	 i9gsjvXpvxH6rxNwLByp/PyDYh1KooQ1ojEEhktQQVNh/YC7yVaVppNyH5almZyl0sVtw
	 p3c/ltvSA9kreZJMz5+Kg+P4Mo2yN2SD91sg/xB+LWe7BKVtJDgawGCPsKSftNLUNtF3w
	 ijp962zKr/0786iXGZ99BeBbI3S00zmqfoIbQVZjdG2FfmgBxAT5CrCxrOSW6UKv8uox+
	 7ah6dsmL+mOfCga5bAf9/iKXa6EwmdY2mz0uETHu56XdaeQIzYcA2XQgyaSI96RzwFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGj0n9o2;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC2606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGj0n9o2
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-85a5455bd3cso861140a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280398; x=1794885198; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=CGj0n9o2ZM2GUGYDO22Q0VZIZaMosOb6Ew8BYsAAc1/ZcfyPsJLlkHI3HRCtjxM736
         MLBj1nCFvdrsjOUikFdVf77cjFfRum7cThukkKA+gVHOjQ8AhClahx42ubMRo9BDUmyT
         kvu5iRiBlcX2SiEHoYdtX0qGq3tiIpBsMHqjd0wdQWG7eM/oi2KThsXy6TwvsoyEY4Pa
         +rBAFBBlBi1WOm9ewJK05nBPwuBDd60z5r5lRxsaaPykBPmpaEo0RCKx4jGRBzXQxqnO
         rT/2zCTnZOQ1TiNIXF+8d/0bq+IvqBLfwZb+Q8KrEcDoSYIaDddJoSDJ0z2xEELVxlEf
         GciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280398; x=1794885198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=bpV8MtiC0ugWnsdmatOG8Pj3ZdQFx1jeCTbX67UroMnBQQ4FJdaW8qShvwt8SXwIok
         KXdelNt+thAtM2x01NrcE9c39/Kaaq1qCKxytStX3JbXkLfN2NY4+Qg2sxgEiuTwxblG
         cA2dJsEkf4fmnrRtDu37nwYpKEbj3Xl93lKojJ84xBtBaZLNjEdgTvWtIwNIeymX45ZW
         +6Tsqibz/NbVSAPWkaZRBLpOZ8NIjXHRGFBMVardHa+hpEj5wjNzefdUz7FXxuODdPSC
         y3V+iwzG/jXnlJ2VgGJXzlPhSQMoPeCB3LzAjEqKePuDZleyPicV7k6Xi4kAV9HrFHo8
         iBzg==
X-Forwarded-Encrypted: i=1; AL+hErEe11HKZkblS7AMNp5JaOepI+HhiJdbVByw/IU5CyE8u68gNHtv/Bsqgt6CxwAk7k0B5NIvwx8Qqz7y/w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/612CVZfZgiAkCjdxv+JdI7vQyXo0u1Ud0rpttnXhTebgRv1on
	aoXS68Nt5uTYBiK0tHhJjoXzW9B1K7ejEfDxCjB5NSxb+rWmxBrDhwiV
X-Gm-Gg: AYBFou1r4LUDMdqADFVb0kyQ8hZ32OtK37lAxzeRoBHuORf18dJ8EpYlSu5ZVo+3eTW
	Kcvoz75IWb52+R+20VJjpbaM/QuDgZVcmcZvjOSNWFSwxqG4RFCnY5VZR7Plqyxuthzt8CtuHUD
	F4aEpifqWenb5wIG8pGI//PyCS87ji5bKFyAi7wE1RlRS156oV+vYdqTbOgESf4lgFZWiD57fVW
	I+TW2JcrbaVLwulyHVhK0S7Cjt0vVGsgmzvqCmcPrWChGxBCsp63t/5F5GLIxSK/F49p3iBQajI
	RM7w+onr+5cV8DASvGcUZi8e64PlFqZIjieEn4utnAByJF1NHYFaDMxOfP0I8sqvMufgzSh1JNQ
	DMQIyJAqDwOaK0bXhZLj8yCTxS9+DaH0kwlH0mAaCwIVWUpMMAjfWYnNNj5naOU4xZ67QyUsmfH
	fMbA7mq/rfaIPkhhx1U7z+VlskDiz5seAt1YdDQrD1JwaRORi0sf0QFdpC4B4AZOBoqErdD0nEM
	RysKXn2qh3LIJkczG/bCg0QhrZyA8eajt3aQ5L9/Rb6wqPdZ+OA6p0flYaoCVp6m5X4yNwyJ1Co
	OILITSjz8Q7bAnrUpeoaZc0HN1SS2pUUYc5nx0y7ZRHVnP45i9FfOutlPLg8imAVxNuRcJU8ZDh
	2E0Yx7rEBZKjWZYzM3CnFRUWOLOTtKKAq2urgxV9YELesBXwfk9aqIXKG+olPciAGcBCkok6BXV
	v0Gr94pWNz53H4RWoZnEoHyhAKY8WZM7ske5/oyhoNJeq+HNA1TtSz+jBRGQ+2/uBIE4qBBazc1
	Q==
X-Received: by 2002:a05:6808:3c48:b0:568:2e:531e with SMTP id 5614622812f47-5683cdcd52amr1079208b6e.59.1794280397927;
        Mon, 09 Nov 2026 19:13:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:54 -0700
Subject: [PATCH v9 05/11] serial: 8250: expose RX trigger controls for
 custom callbacks
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-5-3f03961dae8a@gmail.com>
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

The rx_trig_bytes attribute dispatches to a port's get_rxtrig and
set_rxtrig callbacks when present, but the attribute group is registered
only when the port type has a static receive-trigger table.

Allow a port that supplies both callbacks to expose the attribute without
a static table. This lets integrations such as Octeon provide their
FIFO-relative thresholds through callbacks while retaining their existing
port type. Require both callbacks because the attribute is read/write;
ports with a static table continue to use the existing fallback handlers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 73bc9e7ab703..d87e2b852c3c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3152,7 +3152,8 @@ static void register_dev_spec_attr_grp(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 
-	if (conf_type->rxtrig_bytes[0])
+	if (conf_type->rxtrig_bytes[0] ||
+	    (up->port.get_rxtrig && up->port.set_rxtrig))
 		up->port.attr_group = &serial8250_dev_attr_group;
 }
 

-- 
2.53.0

