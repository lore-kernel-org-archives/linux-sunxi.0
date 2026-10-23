Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790373;
	b=r31Rfn1rFI+i0+1bVq06fhQVZ/vgjK0eaWyiHSdS8hkzmM9aYPPUZ4oni3QzBLGVk7mh
	 EsyZbBSRlkLhplQdfAa3WM3HBJllO6rN3cURi9mtW7Z7ZN5m3Zbp3OBygGrH0qshserkf
	 UWccsdr+PS8biZVPK9s2voERsRmKpBEkg3C+35LPRCDDDnPbrP+XkqcgvMy84GwzogIMu
	 OMccAVQAuWonF+AyyC6KMJgL6eSGW+KQVAO83ZjhEstr1Yzlikhd+PWP4FBpms3eyYJPJ
	 1JAApsSEy5SYVYpK+2dGri1wcm5FMQNnFV3a5Q3CeNawuZhmXUJIN6TUw0oXg34WjoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
	b=QQAY6H7VgOPy+xecoPG8zqL4HyfWnP689f25mBci0224MoCb7DhFJAVgD6tDRiJVLB0k
	 DraHkVOlZTqCqgPEEBRTtYSuAu1vQPnX7RLLAb7X9wddqU87FphTeK8f39ysu1I/eX6iJ
	 hjQffBWlHNYvwaITm9FcnwZIeEfuHy4DwjakGM8Mrfv80sox27Bj1gtpIVSgaBrb1EkgN
	 A1LZNs7qeufgj+ukmVSMUhfZUZYc+awx1fVEwdS6x+oXesoU3j9ae6aY7WXSD5duj86xa
	 7ODgVJZd0xRuqCGUx7ZFIGT/qyxxh3DA20xaI/6sol/Du/z0H0oR6Iy/Tzz6p+3SLlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iwAiwN5i;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E3606A325
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 21:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6E3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iwAiwN5i
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-81ba09a5d23so1375824a34.3
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790372; x=1793395172; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=iwAiwN5iT7sNsajFd/NOG0XASDymCekwKZzOo83R/xVgb6RM8CgNGsdFig7U/8pHPY
         zIVwEZ5DrK9KJXPoC7o57q0NXcst8uve3K5mDApqFK+ePiNAja1dSGbapRnwQgCFvsiB
         xFW8f0S0vmfvYxE5HJns0ViAJlm+8dxg6HXAoAcm8IBK7885rqfimp85MXKRWATgi2E5
         z5hKryDT8blH4oGdFHv0guMFdOoIQNWvNfQUngg69LsYW2PNHrh6je7sT4df1nrq5KLe
         uPDg5dN/g4SFPnr9y8FNX9xvY8KP3iKdbjWspYjcrjS8IfurP+veO5s8931z4heRt0Yk
         2NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790372; x=1793395172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=Lhk5YsSRfBbqvmc4YvjqDyP4Q5BNCbPNeTLARdgE9e5rtDZvzt3tlk//mNo/y6h5LB
         iUtJ1n1QHpoxNLR4SYk4874L9pzTPm1OHWWkY2NHSb3aK+cGJgrB1KBEoN+Sp3ob5+HG
         JVn47vhbqVwIKZj9Dm9ZfPLAx9OIyrd9M5swkXp1tRv3BLox3GtfoBLMpD1DXm1dTL8G
         18yiUow5/ALejUUDmEO/ZpTg0roeq1Weqjw/1bHvA733ETKMEuwmerm2mkkSLB8F7kdH
         g/31OTklWhQkE+JqmfKyUCnuTqmDAKB5RSJSSm2LANm+ISI1nG10b7HahXOJZlWKB+Sy
         svjg==
X-Forwarded-Encrypted: i=1; AKwUvByh74WNq2scykcf4nh2VD9yeQZIkH/yZYMlT/W9nYFQQxEUxz/9xr+6xti9cyweejlZDGAJP04hRjGypg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/YfonQBspt81etaaWrv2t5ETmM+6Yb9AL9wZafNiTSuF7vcTK
	Y9CHjMMjJ2PGY71d/Dyv12mEKgMAuUrhDxVYGKUaxTTQH/39CAuR4q3g
X-Gm-Gg: AYBFou2t1lCDy736zkvzCtycy3FRLxQrnUNXuN7ozZH3vppqFNLAeuERYuD75yROVFl
	gAxGC5xiTsaRNoJ97oRh3mdBKsgeoHPldQn38Md3yeDNF7dJsxINq2ErOpTQ+J7f0JViEnldXsq
	n5LtnsqVqHpW1Mmumi/huoJ3zHCWZ6aICMpY1iJH6Hvr8ch0grDuQUPPe+f/43rZxr/tLpQiXAv
	VZqosjtttPcJJtR7qaZ9eBs/+uSf5KKnW9Jy5MPY2SfUMdnarODV71wj7Rigg124M7RDouLcjEw
	YVIxLUpI4QgeCXUCK4uulNMB9/IexzeYLxM41TdHP2FSfvktLYSrk1gvQ8rZTgmocMNKy6FHwkZ
	ItSaIbAYLvda35nZxi1huiReNju5XUuvpbvQ6GZpCvGjx9OrEaqWNziZBLNQZI7IUd5Jn7ARHyX
	VF5WCFQyr2dDHUPE8Zqs8aIr512tTt50Nt6cF5vBc4qfy9B7fa5ROZBHdSyX8awyiPIDxnnWRaw
	ISVShrSjlxIV491FAa5ZhZOT0CCNpmuyuQNbus+E3ILkuTOZYZYdzhLE1NCtVe8QaB9NbUZSpKn
	sFi7OES7/AvVuplJfCHjLC4krV5e+15Iu53UyF8lBey5GanRfiggxxRcis6wtS1Zp6OnF4cy5cM
	qvD9deZNsSrcont8o4pXG+5p3iz8EZJfHiEADuE3bhsu1Xo5FN0MGKybggN+irXvwXoPcz3+Bwh
	FW3w==
X-Received: by 2002:a05:6830:640e:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-850fedbbf50mr560464a34.16.1792790372497;
        Fri, 23 Oct 2026 14:19:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:27 -0600
Subject: [PATCH v2 1/3] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-1-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
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

