Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58D7159215
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760332; cv=none; b=K6bzdbYnFhQzISccuJRM+GZSwhMjotxA3HfFVS+PIWfhAggjKNERUc7U5/gvhS2u+sxJ1aye2DSC0KNteOFZLE/E1ftouAdrdZdh3S6Je61unnkk5JwRlgXCpyEB2IOEdB/OZEbV7CH8APzOFDRvgpuauAqGgCKM0ugGmATBtZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760332; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tw+vrEE5HtmQVl9M+cdf2kBtuJN3yI0yMnnHtbSWyWKvCH0Hf8bupFvluFOSpjeIckAA+q40iC06STYlIWlD5oLBaQEoY4UICx731UhntE8lU2OA/7YVV+vUeYIx5/Qtw1YRzZcBIt/WhpqCsiqaLdtOt7P4orEF8Qwf295mtJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tFaOJNPH; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tFaOJNPH"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f43ee95078so8421b3a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 11:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760330; x=1715365130; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=tFaOJNPHEaXPGeJRvyqkXzVoUdi2R6MwXpE3b4cbYkGr2ILQ6MefiA1wGjit2z6PB0
         qoEqJBcb4Ix9hcbi/fyaz71yyWxLVf033OWl5pYCWfR70F1ZFZrSQFVHKQK0RswXY5Rj
         KtOex+gqcL2L23EtrVA3mif2UJ36x7pcMyJg/4G5BC0t45uDM9WUubZTxdVN2G14cANH
         x9WA51DReRxUq25cdRZECS5FbV5XClWjhbc6A7Ee6aMuNNdt4X8UhaaY/C3+LB1QE4S/
         GqSO5zFYKowDr5bvfG7eAFMQ/JkHLleStrlqDCUlVyU78QuGrRFQnPumodxhufwhCcrA
         FQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760330; x=1715365130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=wth23au3H653fNy2qcMWIEaWOyYzMjBiPHEQQT13ux8pS6qoDpJ9rRtT+nhG5eOb2d
         wVIQvjA3BLeBcnI5MXiihaGlxGeRGgqR+v2cldyOW/WJoQqpIOHaPPaQlGN4j6ejXmEC
         8ISPJDuK9gJe888R/1c1eAWjH5+P7dIEXCGfgzXTjbVw2lbh0pZ8016g6e1Nm7WCsXXA
         /UNdZ8pJGDr5xP+oYhDav5RNWKaiAHn1fQFG03R3+rOiCjlgcgJZUZZzDLMGfjRVRUvj
         gddatefc6uM1TigGFOyVecZfaMVvAT/Ejxh6o1nrk3z9XPZJ65C+dAIzM2VzYrAxMLi7
         PqXA==
X-Forwarded-Encrypted: i=1; AJvYcCWDuFV93OMmOXx+HvzPs1I5wbOyLzeO8MKRJKFS5AuewPjvTZZBrx/Buk9oHg/Hf7fspxWCqkdojOz7UzMl3sU908sNf1y6DhyfZVI=
X-Gm-Message-State: AOJu0Yy1vMUqgrbT6xWCjgnnkY3WFDWqpTLFbdtFPG2S7wdQfNcKlJY8
	OFYZmF+4HSLgWMMgDJuJN6YqSruKXaDYyu+FQAjf4SSX/fKgIuQZEgOgfSgk/tg=
X-Google-Smtp-Source: AGHT+IFy7bjwb5Tc2k3ELswk0ckQlxflBBtAMpFeTTm74dAZvij2X2R0LCw+XDzJCWrMJUDPuSACWA==
X-Received: by 2002:a05:6a20:f393:b0:1a7:4b40:96db with SMTP id qr19-20020a056a20f39300b001a74b4096dbmr3340804pzb.10.1714760330034;
        Fri, 03 May 2024 11:18:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:19 -0700
Subject: [PATCH v6 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-4-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=6g1xI1qEsC25DUPbbFpRsxXutxb45Sm732q6PItZvN9xNDcps0BAvC/bY1rPUIPcJI36yR/lz
 CNxoaMn0OIdCbC6bJdMpDz6ehBx1GiDP/MZbJJlSKdQjCj7lyJtPXxb
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..50c9f4ec8a7f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0

