Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299661;
	b=qYA1ykPppQKMX0MpgPVO38W6UYNsWjYBCOt40KOyl6kdh6i19NRUbpC6HVeWlryAVKDq
	 89gmlFMRWU97/KaEP6D+YvSoftpEgCimMW15KMIHbZyDB2dUGsyP8HeSnTEF2B7kKmGBY
	 zCCZ5mL1LPk/3zA9XSJ55DQdEDAnMWzfr7Z2Z4488owGmrszg/JCC9h/ZahrqvMkt7YM7
	 EY7rXorDnvI/Ql6eX/m3oRVCsBDhj0uPqKFDIxNdQweokRgjk7CeoKe0QuL6T9/IcpCPB
	 I8H6hxMslmGFzpqtLkMnnCwK+C/qQS6zByKf/vJkb21V6kujLDiaOakPQEbOxwQgswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
	b=c4gc5hD5u5ajDdrJN/nEfC13VU0/RkvwK88OxNbN47j3lL6GGavQ9XcEr7ps569+VaI6
	 q+2osymH8Hrcy3a1AqGIapUrXsXpXb6RucdLslltGsVZDW14t7A0JxDApQLQ9Md3AQxKL
	 Qu/T0+Seki/enTGX08Q5wNfHuZgRnIId6dHUEp/Y0zCvk8NnGup7KRpvnBMVUEcMTXYfT
	 //N0MdyX4cBjq4Rq575mbQU05W2WmSgqjmjG/uXUDUnJOPY5r2qgtw+edjIbYmU9jnnbd
	 MgzaQcQJiQWDgpvsedEoYnxI7DMR1YFC0pc5RQ7SskO01+g6/otFUYlLkI/cLIbzcDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KjtpTAGb;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8861060A3803
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 18:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8861060A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KjtpTAGb
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8253bc5a613so5071a34.0
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299659; x=1793904459; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
        b=KjtpTAGbdPevpT7gImHbtYe4WvTocAqyGDkiTnyh6MH6dIfQ6QJmtfXaOYhMHxdVNc
         wmH2r4WDPsWttoIb3zMFCxQpUf3Mz7c7v6yohV6+DtoLJ2nKdvMwixe4QmZOWj6ZnZ1X
         MLNFPcph0AAZ4LxItAbXuL15fnygLZ4zmvVNLZN/FY6EY2U1jdIHHVzbwEQuiay6SHVf
         RICYvhdJQpqKgpL/CGIT3eRxxLt6Bms2K8N/NcpEPrzAinRHl2rATqQj5ZzoZlXYzBRC
         9zvFpLhBFzlbsmwX8XKm5JrDsir+ZJUiPHEA5oE0NEg20GJ5o4KC60ElDcKI1pDbJnm+
         50jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299659; x=1793904459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
        b=yKAgf1dGoY53xtmD4zfnw/F96rV8ANeXRWLtPBMqpHo4fWFuoiNPjY6LglL8Y48WPi
         5e3SykJqmSf54Q1AGhYiuSbvJSwavNl6pAaOzRTG+pHRo0Kl9QUzoMz0z+OwpzY3Yaol
         Oy/M07XRFsdJmIneNrxz38GR977i1E+i1kOVU34NfEHwYILSavvtuPshXYlG6lJhJr8M
         z1pe79Rnuiw4m9jAcC8lXyHQGxexijs2+rOK8ioVO+RpFmxr5tUB+KTC1rFFkINX8763
         YQJmn/1qVWYAyCz3W2Cq3XdZIcFwawHMhnm7QVXrOilDijd8zl+RvF+8luCC3keH3cWu
         GI6A==
X-Forwarded-Encrypted: i=1; AKwUvBxl4LhmEDK2df7jtTJUTx1YZ3UBrc/OkfZvgVgi50Ws5rkn85yqu7eI7GIxaY5qY83ypjrIeeEYjIzQSg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKucSKlhR00Am2X41epohh6hcCclHN6vX/pfzZK3zlr5Ow9cJDT
	rRXTQ418/VZR4ZypVR33vDF/jDXatptgLcLNhFVn+4bS+BtGUrgn5J1s
X-Gm-Gg: AYBFou2GENjPyslPT2U7/IwSqjJN7/mrGZBTIDHbAx5YSpFmJ1PBpAtPuyAEO+rXCyI
	0HeuBMUq7wOqiHMlt6zSy1+O0mnRIBGo9iOZjJ5g/o4PKjYfDHuplm6/ELRVmzCRcPPiofErn41
	3nIpCA1TEOAKI2pY6/7aXpXp4Xr2cwxZ7FhqDG7rKGjcnfMzNB3aW6Dv67SWN4py4R9A99SrNEI
	i97k4KnNDlloU2vxftl5a7MnsoH4BiM9IucFr8g37NA5Bi0K4OwouipX0cVHLuPmMdwN6uQ9zem
	lcDSBJXJyRvMfOwcj3Kvzi/XAfK1QDlb8DoMreYylDwwud3Nv0BCFeJ0yHuV5ZIaGRUHB40PK2T
	ky8kxDZXKnrUujUcWgkvY3Qn30xET//ujNXSXKnlCZXBLZSG7w6uIIMBI4b2nBzTOGBrpubhIsS
	9UyC8mJOQyQOFD9af31mCKVR+ENlkXXqi6ZTspsb9+pV3Pm502xc+328IXHbdmJsU9NYlgxGhvC
	2x5TeKiAsd/DDBwMwiHBI/sYj2V3r4guAf/PBOdjPVyrW8IEVH8/JUHfiJHOZKdRIibcnrLiGq9
	Z7gvctXM7YvET2yXCpuPmXZ9PXd1eYVGKRS34f11oW4Swyb3M+QeHucXe4qqf0nMwLImB6rdVTr
	58OViCSmLdL/VveAfjxh3+Iv8ZP9DdU4vMkeCiZMSZsQ6CWoTB7hPNnTLmoB710A1cSZi9j5e/c
	8gHHqcGm8Dcpt+m4dV8+k/5LX9cDIAmaJ97SgEYd0KtKKQ/KMWXok=
X-Received: by 2002:a05:6830:3153:b0:830:43b8:72db with SMTP id 46e09a7af769-85d365ca9a6mr29214a34.24.1793299659371;
        Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:27 -0600
Subject: [PATCH v5 6/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-6-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
Its receive thresholds are fractions of that depth, and its optional
register layout differs from the generic DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

