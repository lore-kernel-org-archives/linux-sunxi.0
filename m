Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911943;
	b=qjGLqOloBstyI20yqUUJq5fWsBuHK+vvjj8l5Z4ph0myoN7ZOI4/6lr5xxW19nWNlYYb
	 bKmG6+6R8s/1cZZp9c5woKv1sA+wkGVVGBI7W+liLUgUWUqCWQiadl8zzGjiyEdu8m2wi
	 LwYE3PpDq55aiz1wFexK+xm3jKqrrjlQ8dSsYvPD7YX+qBbGG6pYeqvGVSdRDhz315MA1
	 KSC2iH6FA4AUS0f3IuAXfHnydKlF2uOjggxUP34kqbYTBFP12elxTjXekCjTB3Ud2itcZ
	 4+GvzcXFhbTDAxBhyta4OeA/E92zgzSWRkmYs7mSGtscZJfWSv5GbcvSFUhK7DKusMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=5oqNNC+zrn1VaXwq/YaTh5v6sm7I590UQvP2HuAS4Ijn2ac8sD4iRbI9uaG8GOkFUMLs
	 9f+UNPrVO68aKhB61uhwGHvPBrhquU9JzNnYdvmIxBAhTVrXTT0e/RK07yDxCBxrD4SVP
	 WVV6Q3raBDT+59+XbXvjM8Wj1eZI7MCGHKLkWEAdYT+w8mDARhnKMCqru6UIGV2l5b05k
	 ygL6wzY7pLaqrM7RghEsigXXVA6XbXXhch3xKcMY+8C/c/0B3S7e31WQEwvcC1cxXwb6/
	 YTpLUgdYFVdmeyZaD4+JIyKTS4XckM2MplcfX7gtWSM30KtBE3uL0SHNmMf/8hCNRIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2KEt628;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5FB606A33F
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5FB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2KEt628
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de1fd5f572so1976eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911942; x=1794516742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=E2KEt628VzffzCznmRA3Y7aYXkVqQ/M+0l+ExpGya31ULtaq4InO+QpOir3tTEvCaG
         h0ZTp6TNzAc7yjPCjALe7qJ+CqcqGgGaAotKuuxX8/T2rFG1g8UGedSsli6mWU6v0ZZq
         w9IMhWsR+CWNRWdNC4xbvlDU60pMRAh9kxq9oDLJuGf2+UOc+kdhSRNRlbJHa1r36rkz
         ZDTJIlgXJu4enkpyWIBVdoV729TLf202ljNa3V+jdvXPqoN5mItAZ3BZ+S15ZYuRR0FV
         Asq2XUAUPM65EfUZyt6yaWJ+rwY58fQwTsdw0LejiuYmq7FzGET6W0vBCw1OrOsZjr+z
         +0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911942; x=1794516742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=GmKj12qACxzXUJsl4f0lWok8mLBXeXG2Sb3r+3Qabl37WNGga2kyBhp9F87ZSsznxP
         wEIcUdYgGKG4Dlm30ubCQAa9g9k6T5mTqj3kqJ1pxzbgZeA32xalqKxR6lPyOZ0UJt8t
         9JVkzQxAFv0KEmuH60HP7jsF5aznxhGVBpWCnxpNqOgf1U1/oCROHXfYzOKKs15+1Hqj
         Fn8Bnkfn4mklFwHYPjjYJ6B4+3/6mhZsyQWNhuywco1D+O1T1qwGtVYbJaj0kv/5DsnG
         jhMJ4xg+IEAR8yE6nlcldU9PtznLl+j6uGgXWL+NHKiFnRJfGnBjSOb9BJL9mim+T0WQ
         DN4g==
X-Forwarded-Encrypted: i=1; AKwUvByHWqjvKIDHOZHQ+pT5PL/6HFXm0pqVamnbZUIce7CNUv431qZQq/qCMLT2aU6qkOUOa8OqQDUUTa2Smg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Ak6UrU9RlA1lUkjfQncdileFbG2ZQHCD0Q6F/z3cqEhC9o+Yo
	JZ70LOc3IatOnuAwpkYAgv7gQEk/UwltW2hUsP+vYsToFd20hJLQUuE+
X-Gm-Gg: AYBFou2PUhSFDHsIWxPHbeqx7G0WxkQQUemS3ECg7aj7LLbvue7C0w9AS76Wb5qAH8h
	18fEVk5BaxBdhLjDLuYJdUVpzBck8s+As2QkR9NsSs81IoZ28IqgDunLy/YmB98Pv0MQmQWbECD
	2/nEiq/AWQMmut4PadYymIjgpOXynGyiTpG/aF2rWQuML5AcN5uCQeUKEADPSh7fcVRtW/TNo7/
	DiwHQ9WssETeG8n+R5r2DkLom9o5Yg+lrZ3LsN4XyYnvngAxyPWUV9EElgnBItoQoqZYpVxJmFy
	2O/ruMl7F1lVB/lW9PU5UHPRV4OLWg+ia/L2iANs540ydM1isBjIndqj/VvjGy+IAL0ZEQSzVj7
	7qmobFyMdj+WHPfjA2F+Aft0bhHq93M7t/cUWU5fuiEj4ZnBBk4mqyZVxg+Y2KtNjsck6/TltRC
	qnQBdoUpaH9o1rWuK7Ey70/ZrtdXoubbPhJfk0gzNLqja74JMNbqibF1EuzhPQSGDucNba/vEq4
	DSZ9iT5BcS3kEGfuSHeKU24pAYKM2K4tR6bbp+MyjWp4JYnQOBCZrdrm4yw5H4iOhUuz7cqTZit
	DUsTBfx0/R5XbTBKfmU4yA4e7854N4hc15nm0dvSJwGc692p1jeXYj2j42DDmRoBSGHJdM/wsZO
	tPVm8KJzeyHbNRikfhT/fdj3i8uMOGKL5ZHe76lqJq9mZqLX8koybnP3TaOhI6O+yroufKR+5UR
	V8aPQtVF3Bzsyv/GHLa8f+O3DuYVeVjXFxLD3mr1mAQamd1O/L15k=
X-Received: by 2002:a05:6820:1354:b0:6f9:59ee:cf9a with SMTP id 006d021491bc7-716e73d88b9mr513073eaf.7.1793911942466;
        Thu, 05 Nov 2026 12:52:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:06 -0700
Subject: [PATCH v8 05/11] serial: 8250: expose RX trigger controls for
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-5-14024d2b184b@gmail.com>
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

