Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873358;
	b=aEiXm8//OcC+sdw4nG8FCtILTZtmazZue2i1J6Bw+4pB4sjpskARBGP+9JoSQSuBZm6F
	 8HMnWcs2Sn4VMJF0NDNKXOvZdDmSpzkw4c6Rezj0i9A5pPGyUzhoACPEo9Fngts6w/5hS
	 G5VZTRQ1WK0f/aRRAJAvLzRp4FiByO36QlkBEYl+xx1IeWpjdfMLf2TLLPnmEUXVWi4kC
	 sNNMvlo9y0qGhSAIo8PmLCBgHoQQyeltlnq/qnWaApEV8RAlLVGdjxSoSLVH00Hmt7TzD
	 HKigweo1oLXR4jf7siFYPRcHg54vZjuUn0kjlVcGsSpPcP1mu0Gd2XAg2IgTDppvqnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
	b=4A6teturCe/mB6/QUFWGaeqFJzHZUeQdpIuFu9lNV7iCY4TPS2e6VYjVzoDUiFTIKXGe
	 D0ertlBUn2JBnDVVOFuyoDnu+drE+b8urRZ1BlBcVgsBH+MPD6htALdIpQx+CDtHLuznx
	 yrsKeECb2H1+H/VAP0qkhTDWIOww0KnxQLrQir6erUTf4BaYejxjXd67HI5tbEE5DFQEL
	 xAQiKaXyBQ+RrbAsI6VUZWkbyfUvC3rPDMdycmkkeyxHYqE4sc4hnfMSoSVYrY+OI7POH
	 nB7v+1HOnFlcU3F8onjah4kDH23sSXr+QIU/GT0OTyYuU0hgp1nSKFsUJZQbIMeW5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WOUUJVcE;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108E60A2604
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 20:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E108E60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WOUUJVcE
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-539a57a0b1fso729995b6e.2
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873357; x=1793478157; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
        b=WOUUJVcEBzZQRSRtUGprTN3HU9HtXIyTE1v/4StkC8kt5MvEdFD9OKtve8PSRDk9EE
         KTyz2yen3fTfvyT2kkpWCiiLyMqz+HDQzBBI+V/REZi06IScyWThf6jTXqfGna2XJ3Al
         t9MQzu4KCWBCmpUE8CQFOkct8qN9X2TySNKsmUKdbntqX7yJVUVOH+RO0uIp9I2J9YwY
         RKqcLbwzFW33BrlHWsCAKAbOFQamlQ+YC7eCJZDRNLo8NSXBg4HiLpZraxGGOgD9OWae
         fx1+GRywLl6NRt3sb88yWVlaJkvHu7YjhK/Ag1okRpVcMowG9iBoKHFE5zmnGf2K/dWC
         CKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873357; x=1793478157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
        b=K6kGq4kQf0/rWissBS2NkI83hapuhaSZkbLWFYjtrx2NBRDdXHUQH44QZrDiXdcBY8
         2Lp+JYVqyhVahsAC8Z/IUVsnkkd/JABnJ7WisBoRe/hyAayZlM6Bk+ozkRD8Z7ZYkm5O
         Kf36HfBhUKH1NzgEuzhpAuu1xJBo4C+WKFqKgq3ehdvXA9u7xQZMFx0GAdeGAkckDWx+
         /1oGM2Bsy0jEoNic0YDY9r8xX0ZejmInmZRYYvd1XF50p+jOXBWnvxhLkpiwCmA/jZd9
         nc1bI7GkH+sIvJiOQhoixhcYa3dM6+5pMoDqstEzxHOzoe8K7N/30Eof2np0lRz98vIG
         sAKA==
X-Forwarded-Encrypted: i=1; AKwUvBxYWNqLC8rRsXg8cJNOy0H6ue4ZKZUgLmBjVjIxMTl8CxaWpbjfcrTHWl1KiB/sZt5QFjgEmPJDeNoDcA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJAG2MqAsO92uVqM3vMT+qsqMDJLeRWj89CddSH/z/dGvMdubiq
	LYCaHt0apVmeblmG3F7b0FdLX13tIW76EkAViYi5eAZXZav50bJrlLNR
X-Gm-Gg: AYBFou0cox+8eIBuIhkEySvnSS5l9HwM0hnH6H42DlPZELl6yxUjFrkjIR2vwQu4xT+
	9mJsbzeGPOMXKmd46pOpXFmirO9yAn2hy56RFzF1iQhSg3e48vxBXe7QvMzk4gX+g8lX5/eXO83
	Uu+6H3yhNAfWvKZHlZXE+iWyvIX7kkNiKN3CKlpEQGEMQNIv/aqWxC6DrzMr8b2jcfYpCQkf30K
	Y6pPl15G77a7B9/U9yp/C5TlvuMoiglLKCl5qemBTsXuWCOqwtoTOqH1EglT5bG83noffYDyN43
	mXqQNJ2t7OCqZYF0gJKL7+ohbYg6rP+aRhYWtUFWwwhwOp+VvK2v7nhyjbx1duzuA+6gItPrVhN
	StrPF8U2L2d2dTBDxTO2askvuyTYTz1ircC9MTUbF5yCVZMfAQsRz5iKXNT9B6n/TcyAcQ++5hg
	Lb62x1AschC76zCQgR+arDW6/Z8d3PdbzyrU0uJbUBGqKzBpH6OUFNcJ14KsLLFrDGj9fncXQE4
	vtmkbPEXv20kxqxQfo0X1oiy3OOVeB+SgNUY96iTOKxRvslT0rckt07HqyxIJNN6H4+Ok5Hz4RW
	lG0u5RUFLLrwDLis9mGUqoAT6hbcD2U6nrqTfedu1Bpxb5ql4jh7AdUYcrJbLay/8Pza9XlDrcg
	enTV1VjFcIJNtwtUE/ntXJOcuzP1fJIK0wirHoCF45b8n52MwiQ+BzkS5GRaCrb8Ab2XequIC5p
	J5V9Oq
X-Received: by 2002:a05:6808:ec2:b0:53b:8f8f:ae87 with SMTP id 5614622812f47-55c003447bcmr1551104b6e.36.1792873356787;
        Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:24 -0600
Subject: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
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

Add a specific compatible for the integration and allow the standard
fifo-size property to describe the capacity. Require the documented
256-byte size for H616, retaining snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..0f8fd0485879 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -13,6 +13,18 @@ allOf:
   - $ref: serial.yaml#
   - $ref: rs485.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-uart
+    then:
+      properties:
+        fifo-size:
+          const: 256
+      required:
+        - fifo-size
+
   - if:
       properties:
         compatible:
@@ -60,6 +72,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
@@ -120,6 +133,10 @@ properties:
       - const: tx
       - const: rx
 
+  fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit and receive FIFO capacity in bytes.
+
   snps,uart-16550-compatible:
     description: reflects the value of UART_16550_COMPATIBLE configuration
       parameter. Define this if your UART does not implement the busy functionality.

-- 
2.53.0

