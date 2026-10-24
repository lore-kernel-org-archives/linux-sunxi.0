Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873361;
	b=gf6/s+DkTrUWBli8+YFBoS7+oCzmM4RFRRoktNEh+S7jpoof19/3VfZuNmkvcQu3UqY1
	 llYLgzLzo+Eh2ppdjhRaTRdFo1hJw3oa1BpV60NoQDDFJkGtmfjonz0GwzBKelM3+4X6u
	 kKfL4HQ0OUozVJ+dphmHErv5ChMYoYQnKdGwx397GIiSqXQlFsSSXL/HVI5n6sIRMulpe
	 h2Lcf4S2tbeCveHcrOf720B3rR7JD4nG7dbCYdiaDtbIgQOgVBSxyuGSc4Bk/S2MYpuTQ
	 ZGsiC4gtwb32Ca0iA44svw/DduGyGLoR6quAf7eXcp5nXjrgtsMOvs/WHcFtriewvLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
	b=GGqvgFdfyeY1JoWRzRw8Oo5fTkOGdt+rcd8Y6dB38rADn9GYVfI9oDWmlHb7/Y2OcuLC
	 4+jCZQvnWf0gpTPNLlcm4PTKokc59V9UXFraO6vrH6ZxZLAmiLTgdq6z/fAqlBsVKQj8g
	 qf3I9sNgs+0SUWkOWR78jzrN1MdGQRJuWwOtUR+aMdfMOh/9RoRLetCOEG9QFnZYCp2qP
	 yVspiqr/u9lMWieh0/VN3hbudQeEPeSa/0QJpTQU0CHxfx4FVCu0bCmJAYzG2lvR1WKu5
	 3QO0CoIid+GoxmJN1/V4nhFfVy+/ydvDtoXPohbu4BZ7U3DoRjtrfGa7r6NVzXQCKsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TM7iVGET;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A805560A262C
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 20:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A805560A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TM7iVGET
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8490a7d6696so1074701a34.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873359; x=1793478159; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
        b=TM7iVGETQ0Ydx2HMyxC6YbKzlH0i4sWyGa8clnKmDhkyO8WDAgZ+d0iiod2iCSp7ZA
         8ZawoiWsEXkIOvoOcgc7gOYj73g4vUgFAtfL/mTdbcgBXuLrDUGHn+OgLv4y05SznQxH
         plgT3Zz7VUapD0fQyN670jLwXMtX1NJMcR8mYDftBRyByMBk9M0ErfG4tFrP/3TJj/L+
         Lcey+PhCfVMptKXiskPDFqncLc9xAZKc+ucZLZTkInAF4A1llLIXWPxivbpPE5Hlp4js
         UW+noJ4Dq7J+S66JByxfYSUMXXuDtXgmTJMg7ZMDmj+p4Av68S87lASCb1yDnrkVpAKp
         /UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873359; x=1793478159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
        b=Ltv1dy9GMAhVTmHRAWjHb20OP/IO1uR/D9pl7BDYlD5WG9LoyFjsnQ7ILlfu0nAfEg
         khB5ZN6Cjk/4wjlWV6IMYU0hqSba27bwatxsgECb6s+DfnGUpyx6S5w5ZkODmgkizaqC
         V0RWTyfEoNPrxvv/oHesTHHdAF5tvHRKUcjZsPbDEOy446lLPBdSsf5Au87riseDqBBE
         UNuLxjl3ShKNt5ZAB/L6C5Jn9cICI2jQSalCNAEHpJFOaRRUBprOvPYGX/86YailLNb0
         KsGIspAGtwfJCNk8zWeIB5HrPByQmyS2/wo7DPVJ7wbrBtnoBAWoR8+weU+XJgD/rMH+
         /cXw==
X-Forwarded-Encrypted: i=1; AKwUvBwPON/UyZQpyVqBSs9tcDK0DE2vTIFNi2/c1c55bDwUza3CjvT00iFhxijS3kKAnSNF8gnzO3qyEIv4ow==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+TdPZECoV8zUqS2tRl/k4tBBzHtnJaGa1UrVZEk/B9VC1SFmB
	zx7yAAHQ+alsHXacw0I22HQy8s27hK3xiICH6LnWI4PDAU94ezLFo33R
X-Gm-Gg: AYBFou1WgPv8r6YD+hDUCu2ktaLx2SapiFSvYRZIyT57RUP3dMn64kNrcnWvGeo0mg6
	0w/BFsgLjIenz2mzKJmRs+eIDaALW/fcmTOMzeAftvIAXaE07kjGZimJ8OXoYpesBr8i8+r+O+X
	B/LghDSA9LrcqQQzdKLyLkUxplX8JazVVZqvbixRRp6juYH8LhfgwoqEA8AMgzxA4cgjfHyuGEC
	61ZG+dP+4l6LxooYTtsoIqUxv1jF+roWXMYN+byZcYyYh7v+Pc/3ikh7YQczapByKRoYV+i/TaC
	WSbGtXtLxTdn2tbL49LuDPHBdb4iSWbcjI9twkdR5NzCmRSgA5miOXCPxSHhpI66MS/1ero5gHy
	rPVW/7D1Ni9rmLWdjZbxgvrPK2WsSvykZkzgFdjKgRZF533mQRjAMm99xMvLFZcKr3iVwXe2x8o
	LOm3SOggdaVmE7RUYn2pVRrAUHwTDftL243RsU9o++0kitL6Tk7X15crnDHlwdIP1wzEb+PRBwX
	za4dFzG/zV6Erktn1rrSsKBNlstIyGCJa0nPuNWrNmwh9W4Ge3qxN4/GPpKez0B2HdPnFuiIUpr
	uu2aZfnpzHb7wZ86j8hsmKONV2pilar837pBQ4eHHEAKN4R16TxFAZXVOFImV1MypmtxCXsI7Uy
	QyorspYj6CiT5De3kcFZ8N5skuQe+PFPBwGUpHnAazDabk8ayO2OwG0QHvNCeo/Gt7QefDcuJA5
	elABWlRQ6Q1nzJrY5wOnO2xzye
X-Received: by 2002:a05:6808:3099:b0:4c4:8ace:cce8 with SMTP id 5614622812f47-55bfff7e006mr2363837b6e.8.1792873359652;
        Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:26 -0600
Subject: [PATCH v3 4/4] arm64: dts: allwinner: h616: describe the UART
 integration and FIFO size
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-4-286fc1b8c3c1@gmail.com>
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

Identify the H616 UART integration and describe its 256-byte transmit and
receive FIFOs on each of the six controllers. The specific compatible
selects the register layout and receive-trigger mapping, while fifo-size
provides the capacity that the component parameter register cannot report.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..a80f26ee0970 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -538,11 +538,12 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			dmas = <&dma 14>, <&dma 14>;
 			dma-names = "tx", "rx";
@@ -551,11 +552,12 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			dmas = <&dma 15>, <&dma 15>;
 			dma-names = "tx", "rx";
@@ -564,11 +566,12 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			dmas = <&dma 16>, <&dma 16>;
 			dma-names = "tx", "rx";
@@ -577,11 +580,12 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			dmas = <&dma 17>, <&dma 17>;
 			dma-names = "tx", "rx";
@@ -590,11 +594,12 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART4>;
 			dmas = <&dma 18>, <&dma 18>;
 			dma-names = "tx", "rx";
@@ -603,11 +608,12 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART5>;
 			dmas = <&dma 19>, <&dma 19>;
 			dma-names = "tx", "rx";

-- 
2.53.0

