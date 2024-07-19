Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C653146A77
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jul 2024 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405950; cv=none; b=Shitl/QE2Vk2jAuJCzGVInhaHTf+kmkhsXf0gctN0ykAamnsNBdGK4wRt8tJOqldmDYNY4eXlPHOgCEubLL9zyU9POdal4dXhHqES2P3uyp5o7HWUhbbBmvJSbyAQ1HUmnDrx8metTsnJb5APKh6ZGb/n+Tcm4sMuIDWmHDwaHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405950; c=relaxed/simple;
	bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fc2pZDT7coSxO4X31ZuFvkMcc1j2+patIwZNTGdE8I3nQPlBJvzwfDeylHJMkzn2gONRVZBW2WnB38bzHMWtlgHMdF8QFqzm0pP2ArN/f2Q0hVe71VAueRNHxA60wRLD0yU2Q25yoFXsJO5ogOONBViXqtSsyHSDpahiqj0I5ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aBHicHG9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aBHicHG9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc52394c92so18623015ad.1
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Jul 2024 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405948; x=1722010748; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=aBHicHG9ZuRTrE/opnpVOtP3YwJqYg53iDg3kupYr/TPWRxcHY4gB+U8epMjj9xpuA
         0UBLO+zjCkyvfKeO7eT3v44wDN0SEOGSfwdWwSH4pXcBM1jkdixBBeRO/5MXiDp8k1aH
         VpPjL/eQ0+359e2wc+Ma91vCAEKqDR/3+FUKNKwzdDGVa6HJtpSnP2jjCBN8aIzhMyZc
         Mi+UrCEldt0qvIZVh/xtDLBBCJbA4e7KQtzsJDbA+8LUxttvk14wtJer1j741Z+otuOK
         8oIU2zVsWLU2uGHaPiysok9rU3eCJdPTdc5mxijnjPvhWHQWCNX4zj7vqkxrWwjyEVxK
         o1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405948; x=1722010748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=dlGxqhyvApJR/sH0vol42PMwWipKQ3repPLmxR4zGV8OEhSxcMnEV3yOco2B7W/FGf
         FxUQM7YwBYf7F0EDBiz6CWPRQn41HjXCFU2GNFNHtrmi2fPRGtQk6mG6BURX5M7DG9+6
         pr3vN1RCQDeC3Cg0ho0bXgoPn+1R9xpqfRvCjW1yztJxga9gSvqG8sYnZh0elWBghllt
         n8NPVF4dYbZcVVtKx4u/uRwgoqwq8PNsrDzyexbYIrJl1sa55fnt74e7bS65H/u6Hn76
         0NX97luPM6MXIS8wWQ3641I8ooAeDGAekhowkxIhROmASFagjjy1dIJOFx+N7sCYRyuy
         cDBA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9rmMTpbb1E7xZQ73KqxRjs1FJlnsgpLYzIKBrlxmQZNiGjkggI8OdA5HVpg+V4bc3OirUoYH/kRtcMPV9mLCanxM6POA/L7ocMI=
X-Gm-Message-State: AOJu0YyoaxL1c49QMPU3yg+JdGJ7tErzU+cjMv4WJ9x1sBMLHB9cvqcP
	As6nzM1BNYcTHDkohzlp8go809s1H1IRugtboBVpriGcKcwkhGoOlnvyapBThp0=
X-Google-Smtp-Source: AGHT+IHcbYLzjsQXxyR12VWI6a/X+tuZJKGv0nHCdOgw0JTLJN74hjSslq1loINAIy5i8TPsdxBDMA==
X-Received: by 2002:a17:902:e741:b0:1fb:a1cb:cb25 with SMTP id d9443c01a7336-1fd74620ea1mr2584715ad.40.1721405948581;
        Fri, 19 Jul 2024 09:19:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:18:58 -0700
Subject: [PATCH v5 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-3-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
 b=sngfflM5nSLL/9h3hkVIPkIG+9hFUZXHyVmtvYEqQE6t7Z9mbcoiiQMzdG9oZa1acy9OwwhRE
 fH5wzGZXreIDIJjAuA2dBNMbHed2lJBKOXFbMRmO5XQL9nGC0jjFrsq
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..6367112e614a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0

