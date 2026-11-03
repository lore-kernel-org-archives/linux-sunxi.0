Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742012;
	b=oovD+fRL5hBcYtTXQ/QOmkxr7Ti0aNYSTl0BWdwSvGw9pHTfJxF8RO6FTPlc25xcwJPY
	 eMg3Rw5+FLO+x8DKG6uiyC6ukRW2qBKBzs7F/Z3aYEN3VeSTgnrH0hlIM8Wzbg5xizikL
	 VNdrV5lq7szjiqqJNW0jp2Jeyq2es4JZRya5u/XdjRUi0bfKGvquRMx63pz5uQmVdZeQl
	 7T9CwKd0RZSa/LLWUKX+syZnnvgAKHRQl7ItCOsw5avRHpok3TIwouyxcNkYP/dltGhDn
	 Su73I/cFNZH0PWXGe6YWW94a7nM1ACtT2SZcodwG0AkteRO2e7BtsJYCoYKURp1V4+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=AgHZ+S+Eksyn8bA4I43DT3YAyQ0LUqn9X8Qn1b3R9HCK6p5OyqI2Yrtf6prLJhOWzyqq
	 tcJCY9M9iHdCN7Z+RArItd5hBH1K2cJDOXwgpL5MoUvASDkQSlUHsAIhphZlx7RHZ8x5V
	 /jAwl5qeCsTc/cSIn5EX5NN4bLqXIVkT7qeOC8GPIPKhWQ9UPXR5Dlve7rht36dXf/oBy
	 iMnGn278KYqrSX9MejLMyL27sal64jEDYUn+l4cukI7jmCHTW0iV0lqkbAt5kOAK+iMTC
	 QBc+Y+aGT5JoZqM1SQetLVVePz+YfTQQye2ZHz8hUeqvyzivZv7uV94uT703TKmsdMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QMz9CHbG;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58288606D80A
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58288606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QMz9CHbG
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843a4ca671eso19127a34.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742011; x=1794346811; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=QMz9CHbGvzGtVlrB7/xD9oP46wErG2xbCkbLE2fsNnCGAwBHaTirFUKq5ldNb4j9+O
         vEQmXVADkU/1SIhT0trRjJWqGbKgGFZ+64wXldr2TLzRKwI5swMAWWyHZwD1lpS1rGo5
         ATQJ4aLZHlq+EnsRi7+WZ2yFsG6R6XCWcJ73HtHYmPsWk4lFMaY20LqyGCUYh4GfrZHN
         hdwIPyC/IvNzjFk3uIfqfeHnBu912d+w3XeXogBVI7ikOqS0ZJk1pN7z3a0HO5P7lc1W
         +R0ObjoyM1OEkCD6o6b3Q2GscNnyqkYF8R+ddKzHSxRSYenDOyYjNoFN6MHW9YbLdanw
         2Wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742011; x=1794346811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=JTFcpm5yU5znslhJiUq6PESTY6OIa9+bYjFRflwcbWh8leNtXPeuUWni9TIaJpXjdU
         4nkYkFA9j51z9CHEzJ21ma40PlzeofLvV+qRZpnv88uaOaCJfJ0ahgHSF5VIym+ydBZd
         It4913WyE0yTAnYMFTdkkAkffp6UJe+9x63lyb+T/MbqrIswuGU5+biN6OYktRXZOyiY
         fGurrF/N5Xta5v+2V2ldPhjkyq1mmFq8uAuBIgBLclPdSrPCMdl5J9oD01UgNwNwocKO
         xhQs7SRGr7fPRpl2ZL6B/jo/hGihyFh2UeZHmzTZsA9cHegFkMjyrR1tl+TdwvTlkq4l
         Aexw==
X-Forwarded-Encrypted: i=1; AKwUvBx7n8afIe9Rk/nr3Bg8D7JvLsKeRLGBhp2pvASd9vpx1f/9REx+6cKj1o0NTfLvZaCAuDch+PHObRvMuw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+elCjqCW3FbszGOk725SLfKKXA7Sc9exqMx0uAqTmEvxMMVAS1
	YsnyUDY4wkRk0VjRFI27PkH/EN9QEI/GY7H/d5jIY5oLztv4kWpNRvYr
X-Gm-Gg: AYBFou0h0dSdGCT3theqWDrBqWMRCBsPFApFTuaWEC5imfxf1wODwR9BPD7Uowq5+Pr
	aOjdDkntU5/ZJlI9Naeafu9agLM0msFMRo0TBg+q7wG1sGvJuwNq9cyBUnPjCAWqNxdtb+ycb36
	R8fiInIJqtaEu5P3LEQLR4pPPFIy3J8b5NYMeHnEG6OrmA2ASgzcyQa0D29dca8CxlEra0kY8nf
	eGbpidQ63gVOgAOkiedZlxXrg2SJBreDdcuR/6V/VAsVQHaozvTkYS/WsNSycWufBdyp33DrBxO
	3vpxgtbzDRy/SozcOHsWrqm/oIndI4msSFbAFPY3erGEBbzdPpruYWv9+EQ1odpc9B3AxbMpNRD
	uSTW13pe3/U45RPgxfS+qapgldMac6Zx+F+9XODnHiO+K4xBLd8+dWlVCouIOaitSEISgDDc6qV
	ZSYsO7rOijuTVOIC/0+L5KAejib+mRPjygqHBGY0YKg9nz7ObaNWkTSBE4kRcT3UCsRdsLhIV4+
	GTsB0I/Y81fu8BXBtu4i8ZZ0BAo/Hx/wVpr9geUVdvNapu1Ku0o9pyM+NX8xCtJ4ded2L2HiqHc
	XA7lNmpBDVp85UuNR3jtAD4JT/O58QqxqUiwIr3lvw64QdCEqsiVn76BTWWwUwc567pokN4JW+1
	L3o2emt5q6dCoL95aMlblnlSofitSV0hj8GbMA06fWJukBDhBjA2Q/cOsE+e9wjI7WhvkpRr379
	0r9fFHbffA+dKMvf/fNntqTNGJgZIgPCh9zShNDdkcXxrxBfp5hXMO
X-Received: by 2002:a05:6808:2507:b0:4d6:90d4:6bb with SMTP id 5614622812f47-5640dd9d63emr10403938b6e.45.1793742011356;
        Tue, 03 Nov 2026 13:40:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:59 -0700
Subject: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com>
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
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

