Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142350;
	b=3syusdrXZ/NYtRWRIWkMwER8GLOPqCI1BXs3ajygr+ExnACraLJeIyuP3snDXwAKGu2m
	 2VoZft7Bj/xRRIPn7uZBjCVxK4O8bXzy4X0pe8HIozH2LE/wGv7e9LajVPQMuMQm5CJZM
	 MB1jmrRTlrkmxeK337K/P8HXWUFGKefzWuL/Cx4KsMFcvqkXriH26rKBYm5oD+RrWDdtC
	 TVsynf4CGeznrlJX5BoaBiOWBwnETY5NlCutKLBl4wwzuJU439aKj9T4vKCa9uU5Ai2uU
	 gZf8CiwiRKaFTGgsTKJQeNYR5VcASplLC5Oi87Lb69sGHvJfHDgFwElKyUtSPR3d+yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
	b=id7Q0DllzdtlbSq/T1I+NHyPx5Hsh+FjngDw2rV5bqD6n5gm6UNnScn5kP3cuh9pDTWU
	 D9Ql2QkZfPmAHzRaNfd6kBTgDqKB/J4a2sAZHsxDrJfMafR9VzWiMZaKD5A8ZODVwLQcw
	 kWJ6hMTDmSZWzx8MdRhPMRPJIJuoFfNgXriV1vEKdUwDh2OIpdtOTfpTYZk7/48ixaun4
	 4iVPQ6ry70wA3uEXDAXFOa6M/MWUrVLRUuHlD/NDjMEb1TIINQYX1WjLIuQvjYGmw/hTX
	 FPwFVzq6m+3i3lW9DeMyTOzuBgFgmqFuJAMVwX9XadUA5SPHynEieVDf0iPE+BWs9qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExvzoUoL;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E5C606A31A
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 23:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E5C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExvzoUoL
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-84a248254f4so241659a34.0
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142349; x=1793747149; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
        b=ExvzoUoLT390caJksjvM+9r0e1bt515pAAbcBEx8rJbJ/g/A4294HiqbiyFLFvYPJ8
         +Zukhi7T2Z9T3hMZU884qnaoXV2MHoYfMK+EUliyHoC/pniDFAlYoDRoNe+LdT7nlLNq
         zJ9/eLULtEkFycN6HDUBzGVMxqyCZV+Elph/jpxEoKGf9HJ5OMWJ9UwS5CCfa35afi1/
         aaqz0aC5CEVNHmuEY7IasktbhcxcVGFGvaUm8PYmyKKGWdoqClz+0hldgvz5SxsXwU6Z
         UuUivjQIV9bHKPUXlJjVPSYFuDGNB5OeXWhON+cUysRDpAeXc0zox1YGakDih8pAuF2N
         UusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142349; x=1793747149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
        b=U0z16/rg3fo6rCzKp0tDVRcX77RZJdNkAcd7eYPeFvZyiXTTi9Jwyj9MpBQf1mMRx/
         /XrGegdSpx8H5xzJJpUSqI2ckOw7356C5bsUQ3gzQuNJLRslAhaRLK7DZTOb0Eb36nfG
         fTdyifdafYkDFyN3Ue+hlXnXyyeGatl/t3kUECPZKuh5DyV6Jdq/QLgD9UC0Gbu1J7xO
         C+k6mPXtXAeBiFfG9dUKWCm6L9TIwfRU+BYsLtAUf60jik7MHRc3FvgjeWPGX790wBJ5
         +BqvOx2bokEBlwHn4tb4LtJSXvnchgzCd0qY/7c+0/82bUGTbU6ZDrP4EKXmo4rGNUdH
         5GGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK8H4TiIF8sa8lpNmMnxEehUhcvEFkLfUKX43X3peinZvFoILocAq1S7NIQcxVjLuUKLV1/gg5cr9DhA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJVzF54B2tcKkojGAbMEneTSd7D69FTXXaIZZGE0k5q1KELnBqV
	ISOjupIw4GYZo1F8ramylxiAuZ9KtlrHe6rWCgx6ZsUsnEG2bauaO5TitwuC9MJR
X-Gm-Gg: AYBFou08BKGMKg9J3sar+c6p4njsoV0ugx12VepQKJp9z1hUVuZeF4f9ywPLt2KKz9M
	6MZuMaI6iDeBhDQuVarWbvoTrqjDhLM38d1rKNUuM8PYcv7PuPGkOR6ifHHS611c0dKYZOgUzkz
	iHmjG0GZtMw9eAHyzgfNXn6Kx8fNC4B2ii75v5bNH8nyTlBFUIEGp6TxRrfB53wEeCq2KsPCB8L
	PgoXgfbusGnepQaKGtFILWbTNbR+3bI1LeGEtoWFdMx7m/GzpJDCkaE1JA9rkFvZ5uVTzPgzij1
	iQv1KKxEA6V6O0IewxoVVQz2q+EECoXWMC7X7wwNPGu5IsS0IvCkFYO38zPWY6pYMeHdiP8PtGd
	1my91tm8AoaH7rkrd6pCReqr/D1M593Uun/bZ+qu6Tw9LjfS0T2kJzqMcnBi+LSBvZDxrFAPYF6
	9Ik0EwbrZ8JiOp7dCKlJ9QD28ozx51LyIa8mWNTGpRY5ihpN1nCe/lf2h1BxXWXF4A4xPgbwpwA
	mHjLyu/bt6C4ZqAAFAf7kicfKLEndD8c3KZSGlAK2laMCpZ1cNle+x4tbmDDsUDVWnwOKX5PF1s
	PWrTu832vB2udPO0kQhsse1/xSPqCDZgAxcFQ0IzANL40Z0l1la7DAxs09yTpAXKV7QWljYBWXO
	9zVy0MyibpbVfD8aLaT4uDbgRf/3TLhmlydYQjArhxXXLUxJL+sRL0Dlt63jqtTjs4usWs0L0uj
	xJ3g==
X-Received: by 2002:a05:6830:4aca:b0:824:df9:971 with SMTP id 46e09a7af769-85abc7246ddmr898761a34.10.1793142348950;
        Tue, 27 Oct 2026 16:05:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:31 -0600
Subject: [PATCH v4 3/5] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-3-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

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

