Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740841;
	b=QopelODdvCV4VUbfrnzxXHAUgoA6wIEd4cqXO2SKGT0vrqLXTcBt7gEWhf2wsLKhORBB
	 40DapJL9MzcZfZTScf2vscX7Nc/h19R9ecMb6kKL+6ZbB72Q7WJfDGpR7isEz5iDe18Yu
	 h3+8l84HwLe9pQ/isVad2Dr8CpYDdvpCtrCP0dCPa9MyrIyiT1MjtjBVUWR4sSr0FWdCl
	 9pEcrthBE8WMJ7piaq7tKp3TM7eZ888toycHeecTZ/dFuM+AknpCMREYq9lkhwhmFFjUV
	 GKgjgADYb/L5LMS79Ake/xHuOpxSGWbR8nWXLb5y5QzRPszQZfpNBgnrWEVezIJsU9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
	b=Q87suQgtSTJ1aaYho0ySdlCz4h0evpvY4iJT6ND49ulzmCPa+exFb4v8BaOxyFl9/EFr
	 VXbtfrP7lEpul7EYFbC5zJi3kBCbslVXI4iyllJzkgnMO+d709unT+YHfz1e2xRxWDSiR
	 rWCS0HyrV1GAjEX7Cc1RmilwTfzKDNE1gR1ct5WGC+qTRZTLmst0IKoeIRG2fVuJofcin
	 gBofek3NtFFkVhKQYcEuPBOnjsOK+s0zePPcseBq3rhe69YqLkhurR+Ty4RzWJS/fX3rF
	 4MvgnwGUhQIlaJf4/ZBmchixy6q7tQB7UERkWkCiRYpBJuXo37a/fWCClVJDha9ziHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KhUIps5e;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889F606A31B
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 07:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7889F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KhUIps5e
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-81ae6aefdceso531732a34.0
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740839; x=1793345639; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=KhUIps5e3liRb7q9Jqo/G7jJsnfrpWSNCoo5jdoTnz28aVlnwVJplTB4pM/Ye4IZqt
         2gcQADvQ8+aouj52FUU58sXVyc08XsKMWxO7Rr4LhYjnPO/UUc5S+9xmwgjmwSXrwCSR
         OcJJ8qZfvdAJnPOREj0qIOIObV1OfgBnqnGgCfOxzQgGDsHqgvwbPDklx/BtQl9g6sxA
         gmVQ3evUdGgxq3saPb/DTURL/Tfjkp95lKXL+6KmDeF9+lyT3VhxdJ/+SDVrS6UlwuA5
         TLelq+8XAwEeFPHZhIpc8KzA6MywXLTzFkNx1UV5T5U/RzMvbrGQBZLw5YbEbFm6rvbU
         GvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740839; x=1793345639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=Pjm8Kq7Tb96t5lSwFzfXlH6r4DlNsrCukTuJ/4x13WjSWkR8gtoxYIY+dV5L/6my1N
         WwA6FPwYunhMR4KnlOP4uJyaVE4W+bpQhT+uNLnT5ZS0n+7YMD8TRUIsdYb34aSacdJ2
         OtCLbJ4KQYwiUSgHwzNWY+iVM7GtFDEo5k2Ufg5MEkHpt6S7LA181OYpfIMrvPT5M7ue
         sgveM+bhrIGb0xepC+GDQpDqUkDL9k+3mrVhrpKqfDObyte/Zo/3w6/h8FBCXWuVqlAk
         HgC9AIEdeXUO+8/+NfQnDmhrb4xXqt6IG63DBOxGax1KetVmm7DWTOHVAerCbLQBBZCY
         FaHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx8wPl3YHAvg6cdNgniizSjEztPn2/WQ7nYsJ3LyYtfJ0DNnODPLzdpAWpuAqHgbEOKTnck+yj8gVkSg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ09Rq2VA3/fCAN0ss+TEmV5X0MAUK18ZS+bKb5Ynk9U8168ygH
	mzUrBVUfIIjuVvAEM7g8jyP44hsKtbOS3fTyzvZBdJrgQpsU2LM6t0im
X-Gm-Gg: AYBFou3KxNII5TqnsN9hLjI9sXcZCY2GgMf3WJ6qAx05BjhiOsV9RfhmeF9LqueHGZm
	4AXwV9bn5Hqd1YnvWaTRBqFSBhL+VG4DqTiZsDPzk+z+TJZjs9hQUb+eesQZqQJzr3rfe6dwtRZ
	SdazK14//9fztGLirfllwDdUcNWJ92jGKmVZoux5LHEL3A8AGFWLJdpgz8inDZK3ezI8oZ5MdiP
	dJqZ9kIulhCDGmzHSmNYgQBYtt0E1wlfcKUzHDoSEEUqpyftNpQiL5w0MOoUPfvAEIU/hmtHCvZ
	Be2yGLnC+5kf8ZEYU8Ut+Qg3E28NdrJ3wLkVcyMelxWVk6DHxGRT3LoOhBoot2uol/yqvKrrBB7
	cNPpj54MjXf3vbfX3KoKQ8tN9D11+FCwob/DTKe5qBhYnPLsRRR7Ef+ey/8xni6HweDEf/B6hEj
	0HcVFVmo4bMLNeNm85apiBqYYGXvJNO952hC+k3UIWjcVF2Zd3vKnrFQyChfwPAR9qOsEYwj2Rx
	/B+1FKf5Pn49IGZzY7PDv9Dx4CYCqocp3Lv8WNlRT4jPnbW/DXqr5zXtPZjZOwPsn/uuQglj9O3
	vaaueOfsqF6azDfJqdhIxPB55VTKlnZawpt740506drdoWHXBFvzpwjnDXU1ZPzhl1FK7wYw1qp
	cGmdNCm/7ZYaByz0MtuCQHfaQnBwBh8DGp2uggla9327CTk1ocPnVcsjIdkozz4qPvr/1693ilM
	k3hPI=
X-Received: by 2002:a05:6808:16a8:b0:4d5:27da:a496 with SMTP id 5614622812f47-55be873584emr874475b6e.48.1792740839404;
        Fri, 23 Oct 2026 00:33:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:33:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:49 -0600
Subject: [PATCH 1/3] dt-bindings: serial: snps-dw-apb-uart: add Allwinner
 H616
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-1-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
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

The Allwinner H616 UART has 256-byte FIFOs but does not implement the
DesignWare component parameter register used to discover their size.

Add a compatible to identify this integration and its fixed FIFO
configuration. Retain snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

