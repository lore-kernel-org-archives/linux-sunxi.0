Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB73A1CD
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714166976; cv=none; b=DuF71dhFlvsaO/yNAMc0B9nCfYy+YLNoALFT3sjw6q1kSOxfWoVSB2XAkKY1+waul+MsLQ+re7RMhQ1SY+VQgwCVuZF/i4NLDnu9mHD+ooC008RxOBcVu9X2KMglavW8+ZhE8juxK1a2t4k/BDVgKQlnz//HH+3xzTq3C04kFYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714166976; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSguMBihpX/1gyoEvCS7QOXrxp7cA1T7bEZuJee8HWZ2hkcKASX2ZzG4YeSTPfEX/roI1GXJ2GZbpFm0gQAEU7Xc3CgH/rypiMmlHDVb65pJx2r9p8m3NLRZg8buL0lkrxYNh+hQCbh4A5YhhzeRTOV0H5nImPd8HorGF+EprzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XC3+YrRU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XC3+YrRU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e8f68f8e0dso19469145ad.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166974; x=1714771774; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=XC3+YrRUFkQ+wG+0iVqVJ7P76cPFt/618bTfdiKLwUVjnB7V5M6z+PMwGUXeShYAN+
         vGaMTkBNpQjeh7YZ+Hc7BWvooMi9f7ewky0v+TnpIrIWmWVb9eph7q1KQ7w0PqXD86fV
         qorMkmS38BjWkrxten+Tbs5qlJhGuO7QQMnqYS+Rppb698ZGgJywwPTxdGmyxxHqrljp
         FlX33J5b+WW2m+5D5plAe8yP+BsGTMpMMU5+nmJUoNRdJfhxbwNUNYeNEiRmQKIggHWF
         CEQa6E0b+p+R3oJhNVWDsj7vDdlEKjiCpF6/4M6CFYXCmvR3uqYjXKLoA0UeJWqYFgx5
         6gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166974; x=1714771774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=g4I/lGSBzO4kx8ykKmrNP/ZUUAYtsaSPGL8hldRBWsceDtghnMaepca24etYZiTGxD
         icmTSTXhTLodtJrPRMbWiSPvSd4OJPmxgWfCV0H1WP7VnIdQnzvv3Z7VMoRfidpbn1TM
         dEgDHg3hcZYhAKbhdWj19rCmhprfhlUZLJkjCvH5zUMe9qM4QjtRxtCLDYWWg5ejyFJ9
         R2jxtM4ACamgaQoG+fXn2/OEmkLnWf3TYTk/jei/82otZ+waS52Rkd9eaEC/El5JY37z
         PCXeP5TJqyuXPqg9f4Yzelhpgu52G5zMFyWYNQt1eUi+AkSNNRKeva3KT/1aXWzbJNCt
         uL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVn/+oryPVS82x8ALed78ZwpT6gthBzuXTXrR5uEzj5gH/Sgd70aAetK4zltyYtbIhyowuQP0fJxkKmqOMDa0CIpgecHEYaow33w0w=
X-Gm-Message-State: AOJu0YwpK9O8gcGaBxteDdjqnb5dgwJKLDCvspOnRlwde0YJlAry+viC
	76gLn7SYpT0oZU+Dg+hfFbboXX2amVb92BRDiSJVQ3s8CuqK40sfD1nBy+EZr1c=
X-Google-Smtp-Source: AGHT+IFEldMgHYwrrE/WDKjCeD0h2bT0Le//pf+RTk6e30ppKuQzsBrdr7KrhuDT58Oa4s45KZPzFw==
X-Received: by 2002:a17:902:d543:b0:1ea:c7a4:7e8 with SMTP id z3-20020a170902d54300b001eac7a407e8mr1151133plf.17.1714166973673;
        Fri, 26 Apr 2024 14:29:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:18 -0700
Subject: [PATCH v4 04/16] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-4-b692f3c516ec@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=TRlVfhuV1SKW+NgB2OB5kOL4FF8D9pv84FgA25MEizKMQ2QpkjW4elwnFJEHnNkZ+bTFe0b42
 CPsJoDFwMOwAR8P1a4akFOABH0l1U2tKr+32Eqba9Iryz5WqcOWERRG
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

