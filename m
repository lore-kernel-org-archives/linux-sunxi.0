Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280402;
	b=O4Zbj3GElkIH96CQPm+LXmkhhtqmkkyTwUOHmNq1ObKUwgte2BZHJ6Eg8GWCt7gKHeaX
	 OWeKF5t6M5UemrSyiA+LQ/2VY68JVX48AmF40LQlusH3SX/ycqpDAV85SBKlU8Vlyn/e4
	 JVZYkJ+FBSSz8pLBg6ugJW7iVmujtXETjDbLAkUWkcKPWDhslV2YNuaRSYSg1YNZYkok1
	 1pMJfgYAm8g3lSLEu5afn63cPc0kN6lBqyDKboOGLAF2atdH2RX01jn/qafeWxCaIEs85
	 SYcCHHF6hy+z3xWcTjaTp0BI0Lb35UIcVr1LSicFEaBp9Mply6Q6QhwAiX+iPvaYkKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=Qz66OhOAR5mWFuu9nVD0W9rAL3rTQ73Tg1mGu3Ckv1JvzDKLDliiKMYOtM5ebvKynOo/
	 YGT2m6csDjVMmUMB6qGUrm8/224BTphgmR265kNoHAl9K7BFbaGwzhT8kqYtYEU222XVw
	 xMop5M2GIxsQlyFTrt5S9yjCgXTMeM+edrEFjamQojSSaRizYqY2rWs6gyNRiu9esnMRS
	 ryXHsQHmcw9XLqtasECyd9jUSW9B8k0oZ1idvZKIPFGn4IiNLY8gparpVkY2OaGcS2Trn
	 JsnX8JetxXpVCtCCIPD5D0h65/MTwA9JR3S00py8Izvl8WfWI1tqr5L/yeyULFCVd+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeqaFdp9;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D070660A382F
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D070660A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeqaFdp9
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f14642adb4so872223b6e.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280401; x=1794885201; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=JeqaFdp9PchGav9n0BtI2/5BQSQ/H15AITyqDiM7NDgSpkmX75p8gBUNV6q9SX/GnC
         wEMVALgoqzas5eD4r1Sy5kHy3wT5GPfnoE6pt0r3JFaOLkaYuWKQUIilyuwrHYr/stlW
         d3Uek2hkA4UhOr2r9aHJiknJDlFqjDdnpsAv2cld8LBJJTfqNM1TFddTbJq3NStO/WHJ
         E5mxb+n3cn+8s1TZSe4xSyWCUpdj02mvWdlAg5AsVK0P80KAU/Hy8UAOLYQmvDDXXrol
         x6/VqW3tDlK4vLNTtMcF/kG1YBWRuhcCOJfm05ozX0FYcjgwaOEaerYV6ERJtpRQDg7y
         JaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280401; x=1794885201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=b85zT5HSFr2Hh8va0E5wCinx9eGCNChBikM4Z1CI/PoTorVoESvqglIGopxbHzmKuz
         K8RCPJnGVYRRjpTN/a8Om0O0oEu0LuaSB+8KKExgmQBEmWTh9ARYmsfwDUjl4iBmkTUj
         LS0ysHx+e/Gu65wgJE6bjcNFJAM5Qf4pyLr3tN3i4xrKdBCTOO0Ve82rb+rK7hjjIyjC
         1dH8a1IOq+sJre/il/cOUXSkQkDh9q+F+CMKJxLfKEtXIeWlRP5/9PDqHfbpfXUpuWf+
         bgNkCHyQzgIhmjE2i57vruihOVyAA/U5YHuql9Aij8uOjpmB4/WOObjftVQiYcthrzbd
         gfGQ==
X-Forwarded-Encrypted: i=1; AL+hErELocUxn8qB7fgZGJufG/ujnMXPaZntX3IqJ+iWxSLxkZmhdQdus/WGps8sCrzHoZbIAOs2Oq11PwrXtg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+oudBj7pxNIgSHjskGOtMLNpaWO2ci48q8yU0QtOTTC5Y4Ngqx
	DYiL2wQtA5yinQuPhkTrDvzqtny3OuJprIlsmrUbaWLcyT/Lxy5DRDhs
X-Gm-Gg: AYBFou2Re/LqhM6CqzS+amsKdMIfTQN6ncpMg78aXvY4ZvqgFzKhW7KzTRZ2Zk5UyCV
	mScz6mZThsXRqeb72f15Z4EX+p+Yjb0/tQMPJ5NE5/xuYrzpnGNVAqsqShUvpdZD9CPDFgM/3fr
	YcsPFSeT10KtfrBQ/eD28C4m/FP4Ju/c1DQeTt3nDYflD4jkUZUqJhMLP1DJqs+B49OIRwM6ODu
	admI1FiBSOq1zd9xPmh0LtbRctS8bdmjy4wFpm/eOkBA346/qhFDoHKZssOdJZTz1SzjpohxjEV
	4+RtCh82odIB4vG9XQzR31TVyiKcb0JkL0whjqOw8LVQRh7sU2f4VnawX1Wc+Dj8Wy8ORFKO1Su
	qStmH4wMOCB9r/t2/Pu4zYpLqdOxbmJLTgaU7Wqfg168KiZ+T+y3GOQssCe4a27ruXIdnjky5eA
	P6A0xpbO317EIi8G3o4+IQI6ATyWRCrOcuweGOysmZASK4PslgwjqsqnG0+dVcGpZbvWZptLsNq
	5vlouRdlGXJjianBCNYzqu0s0FLGRGTeAycQSWtFMdo2InEvDjwENo6+kbM0DKrij5ZdLQwZXHF
	fdfY6+M8GKOFwlLzMp+lzWca9P0qVG16fAgqiNyU4AnGP/3gKET81x8ydkSA4H9Nil4H4xDgHuP
	LvPmG2vDExdwzApyvtnKM4fa6g4yBgL8LUH5Tq6c0613SCDVHivszP+ZO5BWGloX8tjFaLFLPat
	iotc3q2l5JwmUnXb78oPgDmtWX8oSStuTyeCEA4lttwMTP/Ba6FVcU
X-Received: by 2002:a05:6808:1303:b0:55c:836:5955 with SMTP id 5614622812f47-5683ca2f716mr1299570b6e.44.1794280400815;
        Mon, 09 Nov 2026 19:13:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:56 -0700
Subject: [PATCH v9 07/11] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-7-3f03961dae8a@gmail.com>
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

