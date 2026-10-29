Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299659;
	b=QqwhE0out5gANDUt3ofyPfjspP5/glrAjswpgAmXxKhRy/j0MT/h321kr9/p0zYoLRvJ
	 Xz1sKwgADQmn1TsD6RKauhACDi4ZA+aPtJWedO7nZ/fzuVZq4medQzaQiAxtNAVzpk5m5
	 Ewn51OMmwRJ2r9BE8mK2fxx0+uknkswMHbr/Acpw4xn/DGnRQXdeA2dYXKJ+QMVlndXhk
	 ypUbwHwAogrelDNdV0/Qsq54+h68kT9woWoygmbIl39MgUnUEGBeHjFuVXy4nMQKpIiTV
	 UJJ3zOCSBqz5t+SrooSegAz0Prq5faB9xF+YVSZAI7Icu+v2TPBig06+Xtn11QEc+IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=R9Ms6dPXhYVGdBQ1tP1VRkK+kzwLLMRES4ig12S9iPeT97JFpme5Vra3dYDy261hTFT3
	 eO5y36w6T/7FIz1CXvF3Vmsm+Q/99b3ypK/ok6uZxN5BIxeSmJ+Ya24qFDx/3060R4+wi
	 xIrnL4/Ov1qB8CMWFitvwji2bqOQNJUhQn/I11Dtb3OJi+DA1xWGIH5wez4VoUo4cvCQC
	 CDCMMqTgSY03ilFilVIF2crD12p9GJAP5CeUhmlBqJKl0YRRNwJ47bJgdQk+4cD20JZNg
	 2QrhzKnSJrwgRht7d4JrZEFVwaZUg75abok5KsbL8nUQlR3NgmchdUumHxF9dK4KmDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iy6gOXcL;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633BC60A2637
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 18:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 633BC60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iy6gOXcL
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d68de53053so1294234eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299658; x=1793904458; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=iy6gOXcLALt1/UaaX7PVKyEkq7WhBSlEa8HfoAPL0uniRyoX+33ff9YNk+38JJS0ID
         TmYybF2kf1awpRYHn2Za47NzgdUp9IvGTx0htc5VpMTCFyJYEOIxnyNq6AJZgSX6lGBd
         mZxkQJlNFY63BB3309/iyzb3424vjtMj4plrcbc3Wtl+5JmDA4sCPRabtd+7E4Y/xrz5
         szkySU1tqrLcbT91CTauiABXL0Ss7gkWo34Cb8TLU0I+Xs61bT9BdLlvI56fF8BmjTvc
         93bP5PcGFZ8+hgAQ5iDRADBeL4tPltDeaIEohuf+gWEr9z9GQ9z5eu/4as/mMzA5sUuy
         /hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299658; x=1793904458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=tbGC8lkvKlevev4mwQ09x9V7IdqkIjDm4gImb0zQBbWWs3uGAArxLDlIjlNNFb07Zo
         Egi5VoFgH+acxXdyfD4gn5XYyxUViOyZHPBkzNZJkqWqPhciyFA2sVwLoZtan+Jn3R8S
         cqivOu5+C+7//sXfJDClFa0gItar/NPHzFEXwmS/Bdjs3hwgqp88WNA2IoAkDsVTL+Nq
         mNmwPSPysKjz9HvDcuGTIO5Ibu4f/4PDsPR0DDsfz4EM/7XA2f7kvy56N+U1c+Z8XXQ4
         nDsHaEi5xFDe2f6qqa3+gaYwyS5t8u93p22U4Mx+XDhtN08npis25/rdlbk9xH1EBcAi
         xfkw==
X-Forwarded-Encrypted: i=1; AKwUvBwzIoaQ1TW2Ny0UXvQ5djA6WJ7ZXAqrO7rKbnz32aJIiyKnBJyYlXWBkPUVK7BiwanNGjn4BrGeHhXmFA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLH2GuN/IIkKpV7ZPAWSpRcbRmyEBv1yg8HkF/vDsxZfseKLSQD
	imHYaAG/1TYQu4LXdbPuh9hLdhBaKyF1lF7x5TxUZ91QheJkJdydimk7
X-Gm-Gg: AYBFou0O8BCfaA5JFM6siWaXgjXiEMUepWj6fVQ3zXP+nL8fl64WtytWAFgDRmmrX3f
	kbxdXMcysi+q2RE+XenDDHD7PAg8RvAnAuEfK6kD6qhqOx7ndE50/LFg34R7puGaJxdiJfjFFP8
	V5hUhgqz3IdVWtiI7SJIoYQC9/ghmf44P1IegQr5x4eYHRJoBGGvNzn3OQOBv6RP5nfYIPEOBCS
	TW1Cd965kyNszgaeP/gFaNCXY5IswJwEQhSAh9R1hhpnxxZKiLq1JpKj5yEchEabjCGr286c7gK
	Nrslgaf5A6jK/1j9m1KM7M2hUKAIaWb+cgZws+NW+cpt/I5I8gleY32OATLHMSun5ahjRpm0ldJ
	lNUGGbFFQkYCdRhbbgdFl1Z7kMu1UvdF8oMWVmJQdrH2zfvqOUv2G6JuCPS6tCOPMPYj4GsLqTD
	7BQ/fb/nYK9Ca3XMZ2Pw+d2TnXpdW4m1A7kqlbeKt7si24CaUKQ7osEiCU8G3/KZA6skw6VCxPc
	kdJMi14+Cf2rTKfeKwmRtF7HlgWG+tFUBAiOX8JLVYdCJRJk3Yd2jFsy5NIvowta8AwQx+367nU
	O4MAT10u0/lAawH3MmMfFqS1x2r8g5lHQnYxnAL89+fzONHWStqp6SviOWWd2vs+4t9LLoW7sB+
	xq7sjPFiyM87WWe0Qv+sFj9uIhRKUDJVQ4S5alXwRUrn50m7Pbl0mTL9fZ7VcMDNWQD3e77wigV
	bMmJBcLrqjrkPUkrGdA9ZtLD5ahusq5/KXXLsrgIDOJcQAuAE2hBKBr9FwbJYTnn1JUZa/2MwT
X-Received: by 2002:a05:6820:c44b:10b0:70e:1dd8:6712 with SMTP id 006d021491bc7-714f29f3ee8mr66212eaf.72.1793299658351;
        Thu, 29 Oct 2026 11:47:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:26 -0600
Subject: [PATCH v5 5/8] arm64: dts: allwinner: h616: describe the UART
 integration
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-5-53b433aebbf8@gmail.com>
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

Identify the H616 UART integration on each of the six controllers. The
specific compatible describes the fixed FIFO capacity, register layout
and receive-trigger mapping.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b4b2f85726e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -550,7 +550,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -563,7 +563,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -576,7 +576,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -589,7 +589,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -602,7 +602,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -615,7 +615,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

