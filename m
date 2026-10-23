Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740843;
	b=KgWihMHAYQaIQQE9gojALyzU3NFbNEilan41qugOh8zyg9RdvyJ6vg84/vjDQ/ock2sI
	 Tw0to1EWLcsNcSjDMMyl7UDLaLXfnoV+6IPF/6e21LoW9C+M9Fu/A1u48uQVfjMj9/Ym1
	 PkMGlYOfyONYTwh7MKg5tnSB0kHvxMj9bpeqTQ0XFYUjchcu4JB8ElkFxqBWVaiMwaTcp
	 0Pc1K7RWTNLBLaIz4TPH7RZufuhap1O1Y/IFXw5EMSTjLrqSeb8fmXnvnKcAzJ33c9u01
	 KTSrhE4v118bDHDt7FLo1mT02KBfQ8fTSbkvDKGNfGfw4T3meC6ZyDNDLY/gFL/2Pvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
	b=szjqQiwDDO70FASAFre8eDVWA4IxcGgIBfJ55NU4FwdPzwUyDmDsLwHK4d3Sb8RvY5Cg
	 HVedLCwDEI/BAoFrBnAKB7n2r4Damz/udHY5f96JXoLCGsYWKfqEj41nK/q7BcxCteflo
	 6/FQed93JjkYRociLpHFkygLfdcPX1VtRiHacMurFMf8lrAoJqiVYrNcrf+SNIld6uB6m
	 KPQVz62/wJDwDv+0PZ8cK3Wh8O8RgnFY785b3Ez0DTkCDtsZzigWErG0RQvcH6IYdjVl2
	 DdphGH1IEj/CZ+irvTrSwhIcA7M1dRK7LPoJCM/9oQ7mT7BY/qZ1Az7ugx/3d1Zm6ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIat8fSr;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B4606A33A
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 07:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6B4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIat8fSr
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-84a248254f4so363191a34.0
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740842; x=1793345642; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
        b=kIat8fSrzxsGLtAXcBQm6RXD2kA5NR8yrbAuPBvpWdWLD5p4/hftN2NYUCgJsQvLe/
         bjfu5w912ruPpzqNq5xN7onbvZI+GUQC7S3JmX0AwpgVfqYECWvJr0ZNgbNQ/8XkJv4d
         PH9POxqnzblHuxt4e4FWg9e/6rgcoL1/5b4YzJaPVMRukuVzAzjRooQXmAaNU1sUU9GX
         qGmSxXo8QUppfqDx672zeYTh16ZLbdDBT7eZhQBePg5uZ9HEJ/oWXp9huVxfzJv/QpYc
         3N9eVSs9r3Jo8Q3ff3Q+hriyh7tsYC4Bqoy7Nyl+xbx2JyJMxlPcOpTSaf/y8cdfz8yO
         IRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740842; x=1793345642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMLYY/97Uq9CVtG7QdmP7izisduGXF/upTM7pDvQJmw=;
        b=fcp+Ao2mBs0P/hhEIXYD+AVeSAQHOwqWo7iezMDvCLezIUDggmF7htFW02ndF80myG
         LgIG2mpwyd0x4kPh8cUwhoaxi8PgCRbfYW1EN9OuEUtzOntIfHYkmE+uPWpX++UWGIiQ
         ogONYvoUo84qkVCJsLZeZXZAZJ0ae6Fd7V4+dCh6S6kki+7rcZUvH5HLP/pUtZZF1Wr4
         +TM7bfVsfOK6GQit7SKGGAIfZiPs5ZrUANaSU8M0zpfn5tI4kwyBApbVNpNaTf8bLowC
         V1xO5L8s/9wBwoJn/Dh36XkkQ4YQp/rrs+TIEED4R6LX7DmKAt/+Ivyk03SljmcPudMO
         FSRA==
X-Forwarded-Encrypted: i=1; AKwUvBxzunW2ceOBC2oEWbIN6P/yMuP7sCn5hN7cPm+F5Z/wE5P2XTHV1qjliXu0Mnt4RnEQkzozIrlmrFljYg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIT5kddem6D3QRRdtUmt8K/52DOVgyp4GZX7390EL2hG+4Kuyft
	TrtL8GuNXbIdvt6spac0GBMWVNfeSrS4YDFiZ3UzmTmuYqSCZfvdT918
X-Gm-Gg: AYBFou3XDeVlhNdi3bFmmg7kcngtdn1Mz/4qbAgY79mO8CC68OJA6Y4mj8xnzspPEVP
	12waemoNcWMSdLInd5289V51rlYNNEQwBnC+eKSSVnXYuhrecUMaQd5o2a2Nk1RE5AgLY1n3E0X
	foc+rwjcV8wMynBQ9BVDyGf1nh3PU8ADIrQOeNSH2m3oN5mFdg3KIWlZEqcExeNT/Wud+zwhZRq
	SosnGIbAdGdXz9ErpaI/JJehnB/yC3txScgyaO/G1iAj8Ink8W5xQ/Nz+24nl/PLOiKiqWt7/+/
	LUQ5e4iNlTJrvdk/L88IR3OFRJr/t0YQ0yON8HCOxyPzDXzOpMQb2eTjPp2NNkRrvnrcBuNYp2M
	xJS4SL484ZhqOCpDIb70LOlTSE7Mh8A9uOQNMNySCaA+rtYNjuq6HevlmR4RjAyQUyM0oyB5Hrp
	sIWk5hpveXpdFLtSRkOWtPVzqtPLhiC/sLoczz5KjS2zmipiRnfLOt0eSk5kJW1I7dygtyuKw1S
	xxQ4GM4As1M0Ei5iq58gExztrGip1ayIsCVcFfn9sQHWp8BtvFDQwf3DG0sZYvKeRoeLpnuizYT
	4RcOgEueUjB9lbSn1Exw8DIKIzWdILFHW7EvhGY4fCvCoVtRyPAzFSSCmqCSp6RCp2Hnc/6tbWm
	MK7R/mK9l0VBGbsYSLSWD6VkR6y56YD/O+EIQ+4Z6D4SJej8lGvndxeq1/PjA6DQyQ4Keg3YUC6
	03xdc=
X-Received: by 2002:a05:6808:5092:b0:4e8:3707:d4cf with SMTP id 5614622812f47-55be7a45f4cmr859576b6e.0.1792740842142;
        Fri, 23 Oct 2026 00:34:02 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:51 -0600
Subject: [PATCH 3/3] arm64: dts: allwinner: h616: identify the UART
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-3-e4a3bae2eba8@gmail.com>
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

Use the H616 UART compatible for all six controllers so the driver can
select their fixed 256-byte FIFO configuration and register layout.
Retain the generic DesignWare compatible as a fallback for older kernels.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..6905c9eaa249 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -538,7 +538,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -551,7 +551,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -564,7 +564,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -577,7 +577,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -590,7 +590,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -603,7 +603,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

