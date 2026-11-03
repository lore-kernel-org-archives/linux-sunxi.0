Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742010;
	b=m6UEdbQCZf9VXewNzNqM+s4md0T3V9xM1zRQRQVvQyOupfQpIikVDOOPcSk4dEIHWZfL
	 OWMowecEgYeWQb5p3MHR/SAoJrHNLPQzYzqXWQMkk1jL+1BHQA4pD4RwGDJs+Vawy3BTc
	 SDgXAnnun1BiM2MhMz4wGGRDf77G2/xNn6pTiFTODL07l2e0hBDn6UtxDRGx667iim+2R
	 hXcP54FvKjHC26LlxkPDMWi+2pE46/4B3l/gVtEg1/nCFHpFQf5961ExfuF9oH7YSoJWW
	 cAOAkdCq6tL3QlMnVgCk8LkjYlAI12Ggutpcoow9CyHKK/E2ugV41njbzLkUNPib0Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=JZ9Y7teZXIFuuLX+Fcrif6froGp8yq2oLGMPRsEU0plRnMnfdEd+SRxAXheatSVScXo5
	 pvSJ9HdZOMdch6yxEpVu58V/JbOyh+dU22MMOZXheay2dTCcHiXIspMIWHvL7+5L9K6JY
	 uoKeas7gIa2MCF1G5fCyZdsz/zr4DYu6rLIYPei2IQB+7rbqxIdgCg6/6UOWcBPD8aiOt
	 zR7znlvcTi7TcoOf2AVtpTJ0uimvppRLU1rWlRS9VNydVd6NSjTELvaO9C7letkV3cUOc
	 cWFtllbnBO7xE91rgdOZpicKH1kNzQwYnWSEYv8yOTISd6Xw1Y9b0CJCntEhUCHEucg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdCeMtH5;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0B606D808
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA0B606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdCeMtH5
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4af173320f9so46663b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742009; x=1794346809; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=AdCeMtH5EFUfNfZOzhRw8G8WL6H91LhRPI+kDTwE5TEz5wQUY1/5YdBScaHrLXYtfX
         sCB2tV0+UZp8tweyaT/wppr1GifouGOFW3rwBkVnVBeoh44CEq62xTn2g3VCF/CDyD+8
         4JOqzF4AhvEI1Tw0aj2Pn1PaiYV0JlyYa4rfAZ368PLzedNKTOn6egbYScjS7KrZdXp2
         uP7Ezsp7p4VEyxjcU953lZDJNn0Td6/PuHRUJI9P4KrwEJLvtKY5of8ovaRjEE3zvj8K
         bM6t9v8UBYvWNlWfknpGveAOPETttaTsmnjczp3WjSu23VCf9ybkIjAXHxAQK9M4vu0S
         EUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742009; x=1794346809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=iOKq0RkQ0Szzg+oWnnJPNehHejk1dz72PDNnin4FPPWkExoRU8FSvYVrZE5Ps4SwGV
         WPSLhnhACQ9lr1HyFm3Ye7LZDgRnUUFD3p8BmtIit2pO5nEfJfCCMCq+TTHYXpmhAwvm
         CK/ki+yTDlzIJY5HfK/0aIfnRcPWViVdVZviBL2/xhVFHInW2OqneOA/9MkESb2HPDM9
         Nyt0wBXtQsncB5kgsUeWRsPuO+ADItVKL3xgzV5sIYsdNJV9cQoQkUZy5rB822jPZm0R
         VFfVXr8lf9p/1vi/2/2r79RDIw/IUjK4AKILVmYfzB84x197DtysT8rZoFbwVd0cdS0/
         Ho8w==
X-Forwarded-Encrypted: i=1; AKwUvBw5SNaU0WCQ6rxK2FjMi9h3t8R2fo5IpLVtnrjN0eBJIXd15zWyDXYqCjtZsJv/XNXeqHBprcVGLavSbA==@lists.linux.dev
X-Gm-Message-State: APuU4Z80RsiRG+J0kvlIWxvqv63V2csVGfNghaFqFeoA3ke8baTE6YWK
	TdPdP5FZr0aIx1CLQvkYKKYt4PqRJAzzM2terGB926x5CD3Bj3eBPLu45k+mWuAJ
X-Gm-Gg: AYBFou0Mq2dJt9nDFaCp+r8MOGo0D6hK4SB+xmXtsS4LdTNrQsIQV6U+tyyXWVWGA2S
	WrDPCM1h/lmqMsARfwePWKQRu+7kJEfn/+oj3VbomH26notzoMV1UJM0DxkUMlJMSwStmrNqj6x
	d0J189O0Dz0/MM8t5cMDRn5M1woguo44S3p9QeZ1rFL9wWVfQ5LQIfuPqPCdkg2ajXbhCEIMc9w
	HcwGaX8Op1b32o5TjE8uqz5HyVRrRC5YrxLFzqQBeFI+P311yjnWG7Hn/lrFSSb9T6ZiNSYWvQO
	fIGrhA52K3hZI6OwmV3ZwH5zkdRbV7U9RFB30w8V37uUr39DaLSy5S6n17HYttfEWevK+HKSOPK
	+FFnlmRMpvIUAAbuszyhEB/C1ccT6GN8mwJWRrZE2NuHmTc9nRe5XXDdl468fRQ3sDR8Y1YHRyu
	7AOqVIecJXBy549Emgf5Ao7TUQwgeNytzbmmtk8VgCrQx8bSLzOFjMjt3u6a7X4ICXb7Tt2huQu
	8j8o9nkPiXSxeFppgKIQojX8LUIqd5PeOUvnIqcCXZrmQDERsRWb4t167pAb35VLEdhTmceRdpK
	HVu3pnmcUTEoxAIg8+rNVP0zvvgWIh7EWK6wB8OInhUIcsYOnTtc/gbcgFJN1oi2U8LA7EiPt3P
	/rf6cUUZ9dxsOWaXZ6ds2+JK2xVZqBCvK8C6PG/PGIqMOgPvxKeNVWZUSSZYYIn/ytxSqueJq9M
	yu5J7MTmSb2YXgkZ/FFa+QT+1S2jW/+WHcQrR87D7nSl61sqtkEw8gEQ==
X-Received: by 2002:a05:6808:1715:b0:55c:836:5950 with SMTP id 5614622812f47-5640de0af62mr9879107b6e.27.1793742009246;
        Tue, 03 Nov 2026 13:40:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:57 -0700
Subject: [PATCH v7 04/12] serial: 8250: expose RX trigger controls for
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-4-c9e248d685c1@gmail.com>
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

