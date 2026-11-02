Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649329;
	b=4DKHt+BqkLikralCMcpzjlD9vXDzswPd2NF0VKXdt8MFFu98oRjIIKmP0ve6SKEVTFaJ
	 DbNiBBIhS15o2UV8ferDaLeLnWC6BIfDy6ZjWns5oacbv/WwOeu9yermJUqG9OCUFXJ2s
	 AeM2LCG0CqrvL7IIKL48AuweybuYqgDc5Y7YrNw0tfcnDHfIPyvjSO1z3Catob40yK0Tv
	 oLLy45mGp1OgjLjJdarmSFtEFh0s2uVCTzXoDlt7Y1PNo8jNt+GdRfQ6NNnUI2tKWz6oT
	 n0hK3IQNyJONldt/9+uLTXXVT0T6utweGyD/0+K897Yk5htDkMODpeIhyhsVHdm5t0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
	b=Ohy1XxfQS/mjgULYs4ihNrHpL3X2jcnjvZranTb0+xn3CikOyfJGhVusbufWfiZY25us
	 4U0tWVrwzFUf+ALdHxSXjRORuK8WJHY6qAPmwRpzz/Z5FNmru+eFVhaefGlWc2dM6oAbz
	 B4LOHUVkszjjaZ8BlsBkx+EA2dY0SVtD2Mxk/vEE2Yvn9CfJDVAow0qYqGCHd6LxmBDd/
	 XO5n8DrQ7c0TB/uKAUO9iDp9RA2HTU0Ue473UhxEoX8ZciH0dfG6fmqZTjQiHUW6COvhr
	 0o9cJ/XMngE0kvfKjfWi0enQFQexVOx1PoYabJ8uWj2T20vBf6upqpLY5A7u8AsOZnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUo3+Bxb;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3575606D82A
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 19:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3575606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUo3+Bxb
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-49e1251674cso1557987fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 11:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649328; x=1794254128; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
        b=zUo3+BxbGmph0/ngbSCyt8hqKAYLuJTRHgqKbZ4LC0dOXlk5tSd6Qx5njD/iLFBvor
         fEVWGwhP6bzKQmInfBdx9gGxPDhpPDSSnXLuctUFS3QoT7TmJWoalhsb0ppW54qXnoh2
         +DmeZEU0selL4ZqrPHcGVBYwgauQqXsTaUuUsxKv6VZgLItLO30je7sRis3crtyb0RZL
         qiQL9ILGJwPCdpN7QgfAMdmmdxXniRJ1kr+rvh9KsmgKc9dOm+zpS9cxj3oQW+EzsPMj
         XbPRN2xLkDdyKyuZD6V3Go/t9xBnT4bJjmlOk4/DB4b9SR5abVg5fcJGnHd5kjYg28LV
         +5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649328; x=1794254128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
        b=NfcJ4V8NiTJTrsQe1aNx3V4GDhaqBXPwnCz21iMsK03r53SHkRbCZUEfoSk+GfCOfY
         WkE/o2B7b/Vcyj625w8/b+y9gDd/8+xFpGENVUTA34u3qUKinZyY7BDjNxxcroaFmdvo
         SJ0ew/TNrk4yhpmmcXozVinWeDSuxvy09wVcTRY3mh0f+oRIQLqepqwaok0gJAqWfgP/
         1xRiH6+bl4q9qBlMnZMEbzLglVlVIkC5rk3EXmThoEMFWKPOEMmXLNeCiQeLoYf+8CBb
         qd1hHUmob+kJ5K7cj9FoOYTJA3iCSqeHQ+W+OE85IXdqOdBq6XzBb7xg0XLf2IAMMer6
         /KEg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ/sMV7j1J8ew4IKHoHO8LfrrSSzImKBfc0uPWY+pIDcx//L74tjY4kbUS39iPkrTv5xhGyUEkK2NRJQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJeoOHGzfu8SA6gmS2E4pPvuFN9jMqC5MsBhZs3tElWFO1bxVZY
	Luj9WvAjw79QPrMLKD8STkABYtY3PrvbIiCMScGuGTkbtEKJbCTjBOHp
X-Gm-Gg: AYBFou1P5D19XguoSDRLt7WRxA+cj1J/eLDyaNha33OO3yGmMZSQ71xB763lLjSfNLx
	95ZkbCwpgoDPG975SEnla6qOKPpfkqGbBDPsKWR7LAZaoAg7/e+8W8wwSuvM2/rnoWZp9pceybe
	/VXjEGlCXTyaes3E7YdCAC7RBNiWlNWPvR3Ahnppn3hOwdIaBO+dK9VDGRrKxAJwgB9hLB3eXjI
	04krKfDuSQ3mM6SBmTh1orsByWLQlVm8c0pRmiJxcBPQwK/LzrBuLaYx7Bpv81ha8P5yC5ibuKG
	mejT2tsZG8arrPYKu6W1SAn5Y5z+8rlXiSruedC3hCEArwtBJY5e51tFotE+DHWLpjM9aqTmL1r
	RAoHADowNRAFm8deb0Y9eMgBBoNsXzqTe6xkyVs8q4KtfDSdvbJ6bbjUbXNvFlAAcdOdqIntJQb
	1UkCuBWrw+CW/HqtwwkrfscB9eayY8m6uZiJ7VSNSq9okCj/h8PiV+P/f7SKu8YcAMCAveLD/SF
	6fcwdvZhK2RgT4XjfvdFnb3Qlg1smnXdW1bA6o+mFJwamLOYPviQFr6h+Dbk3Jr8hRFoCRH7SWQ
	qSfT4BWuln6av4DeiPrQij3Oyu5fotdKgi2bbBHfzlRBNcKr5Uo+vwUEQzUQboC6QKy5u4QnC6Y
	RJ8WoSHvuSWFy3eaGeHMNDEfaydaM+yxzQ2ina7ibRholwlmxh7ojVhxlRHe5m1/UfbFER8bwF9
	MD4u0B4rqijkwjhARXsajJk23OQiS8cFv65OrmcufMOYxRcacYYCw=
X-Received: by 2002:a05:6871:e41b:b0:4a6:f610:87eb with SMTP id 586e51a60fabf-4a90729a753mr6897453fac.3.1793649326753;
        Mon, 02 Nov 2026 11:55:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:17 -0700
Subject: [PATCH v6 2/8] serial: 8250: share the RX trigger conversion
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-2-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and export it in the SERIAL_8250
namespace. Include the unsupported-table check and preserve the existing
nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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
index 36b2b0a2c05c..4a25badad3c5 100644
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
+EXPORT_SYMBOL_NS_GPL(serial8250_bytes_to_fcr, "SERIAL_8250");
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

