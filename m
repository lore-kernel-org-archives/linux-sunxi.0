Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299657;
	b=b9mB97iR6ROxbb7x3dLzRrhJI59U3NpxPd27lUIOjAjetVTs7zahilYTdR9AQCpN1UHt
	 VWhKFmPuZZetW3KOKVJ8GhVyzFojDKEdNs5kfPCVQpELml4Y6d65D0J45RN9V/hlN0vcO
	 z0Zp12kYr6ZbrkxWo7dpE0X3F3R4evINER+OvABVPEdE4S1CyJcliTdSb2KOy7xqJlzhM
	 u1jZHfjzhkwVcGBJLICkpvRuZyb//eUJ1P0v+dL6sB8d8zC07XKaJl/y2Tco9LFhQKvvE
	 HOiFdtJw8oLw3Vy6d05ea3ov3UAB5WYoYVYi9c+4IPtK9M5Fo603XlsNK5fuZTDfbCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=npGceEVLZ6R1TJL6hLEU66oJITbGmnSE4nvnaKLa+dhqPQ4u53woGID5sQloLcL3nP20
	 IljgYEPDW+/Ot9BO1vWNCO555/7wUISVYRoXFaJYPGWKFlgoLuU8svfBpVFHWdIi8etH2
	 MEvFU6CDFrlTCNQ0VEKq1oUkgCkalGa6L0/lvkyGufO7rtD3JJe+yGO5+mzYfBvlvgnmc
	 ynLUOhuOLL0AgAfRXWvWOHVI2IOIZ2Rhl/CtOhpxybkUtsPBdi04sWla3HezGp0hFnSui
	 vlCe6EtjF+dS70Uzc9QYjM24aqkLnaudFGCeUgQqEU/R6Py9GO1zmRKywFj3cQPz+tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2tDW5r7;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D8A60A2613
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 18:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D8A60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2tDW5r7
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6aa9606ddadso1981727eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299656; x=1793904456; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=m2tDW5r7c5F+EWlYNbcI0ljmzlAaduqzbnISbqrk+IB6Yy5OymhaNQwtBo6jacV/q+
         RH29xo4NuxawbPTm9+j2smj8ed8ZNKGEOYEYO/HPACnOzqc586NhB5ILN/4A+i9khxV/
         KCiIc1WXVos1D+4gpTmnZd7Timo11BG1ktDkPc1oxUFPdNlTQ0JErbVQET/syoA3TNaF
         WQd43cTEwattEl5cEOF+QG85GrR8sTXsk9cMAYVazN7XhbD2Wy+McPMuJYSkWzlYtvXC
         8TXZJXExmIm8Iu218ofvwXh0+gXhtXgYIxFncQCHO5NaL8R3nClcl6cv7n/hxQOGrKBL
         idNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299656; x=1793904456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=1WhI0sbLb8z5f3UYtHpwwfkn5NC6GNTqLQzTO78h/NZ1THDwDG9DSOJJaJLiBFFvNH
         SEcHl92hGjt3oID9DlOG42CLXbTNydJOw53TSxTjFo7g4hN8n7aDxRsuWxSYYlJI3MdL
         ZIfVbiGv2k2dNhU+VEi+mwgmf7X6QYuiovBlguPIzzZ8NChBvYjs3fUnXCGPXWMXK/Ul
         Llq/e1Qf3qQcgUFPc65UxOj/ryMXqGZeIrKJcdzQoRPyLlJInK8HbnH9vnJNMLgOtXLz
         abv9WhREqeZq3t4u3u+lVecWyYhk7ZNlNwUc5SNdL8BHRW5bHItPNfmMIXUaek7gyDeG
         cX7g==
X-Forwarded-Encrypted: i=1; AKwUvBzas/1C0nS3apazK0G1mOuyFMXdiC1LaVRXY1IG6YdoYGrLi3XwLCIANvdd1QaECdzVT4KXqBQ4Co9ACw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIBP8SIYCpEYie64apGzM3HEuzc3boZFGl/6rp3MRf+2kXqD1Up
	aoZh3WQRzGnkP2oZTAMXeGdZq1LgBpxsvgfxEoqWS7G62l2bcNbyqTCM
X-Gm-Gg: AYBFou3xR2bZPNCj7GYhCOvsDcvp06evWh3WxJyhRRTravOyDMuIKJKrQaayvdNYlb9
	ihLaBfo5n0Oy8TWVfV3P9eJKY0pcQeEbpRUCoa/aJRBF8QmbzFpTBAta/XBNhJ629iItkcl8CgE
	SBjzSHQmcIGK7/bW3pscUmoUNiJpbxR9KgqjyHaQRbthCxOiPR9FYS5HwbR26TTMgVJQQLYN41g
	UmKwMHVGVTw7fqN8BuWGXUWEdvtITHalQt1V4gN3tHLqIqg3J8FEMzQuCZuMQT0VUvNffXLvPv1
	Dah1XnxEeUCvkw2La7njy3yIjYqjCDdBFUPJKcvyE/1KexaKhcj5zSyiqtk4a0YatAzCDz+vDhl
	ibAuWmI5Nzb94icEcEnp6Q8brwZEK3KY7bn6WKx2+GaXqc1+Ixp2uW0QJh3TCXUlWhz5+GMQ19K
	NikBs8hLKCebaSTr4lR5QSjgQif4bNcZnreZj5VaPl6XF4YmEbueC3T79mHNGxUoozzSdDxyuuN
	m64nlstBwvEu1loVwfHwiV0GbCo1USTAw/X82klc/4Btc/GwuJMCe+0LoWrYePrRcqIcCB1E715
	j26BYOL3I6GUq3jbycgLFhUV3OZiMJYfyYn4es3DwEiv/yV/HA5F0TjK40wnvH99RVqBuJlXtV8
	CuEcehSXVYO9eNlK5PNmnZaWA0TN6WlgDZV9SzRCY0Il8SprppeBKtzzA9WUxxnggJjA94iyJXo
	cwkvZcMCpgoKATmw66FQd61AKDFJ0MbHALHtp3fhzH3b9yD4X6688=
X-Received: by 2002:a05:6820:1518:b0:70d:9be9:5351 with SMTP id 006d021491bc7-714f29c23camr97099eaf.36.1793299655746;
        Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:24 -0600
Subject: [PATCH v5 3/8] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-3-53b433aebbf8@gmail.com>
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

