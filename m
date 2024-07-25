Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A71210F8
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jul 2024 04:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881004; cv=none; b=M9Ny0lXXaWmzJb4FCiaH/DQUdVQ31/vWkRt4pyXXOYkcBtwqWjY0/op/or0C2Tm0jtyFwPcONen145yglKkAiZr+7o5KCtSnfA8LQooAFtqhbntS9cf70YwVLZc7KPmWMWSNmOG2sEmU5Xrqiuh9/+sREUTAwHRd2JeAa9v69+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881004; c=relaxed/simple;
	bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQbW+BEvUyiyBeCOCQAu1hEccFpQbxV9Ty4TbFq34Mb/2kUeUFV+unQ+sZhOojWBhW1e74jOoCuaXILgrZYWNU6Jqojda51Oiy8RME6caU9S6Lf4MI/Kpc7XZAyV5xWmWWQP24uHHWUWg7Xuq11IoL0VAK2mxLEbiKq7/biUYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=i4td2EPN; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="i4td2EPN"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7a1d48e0a5fso337085a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 21:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881001; x=1722485801; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=i4td2EPNfmb+77rvGL4AgViEHTjW0VU3e8INbige/IlSG6i/FLYh2disJxtwIiTCNL
         yYUc9C+4z0uLMfictWHicUemLzgko1o6dvFUKe7/i20sa6I+gGIRxnuCgM6uiPlIwpyZ
         PHy8AWG7Hjnq9lnVjsuu+ejCgyu0orzsRNL74ccPOmL7iWbp6RxtDL1aV/NUZN6aVdtY
         ITxBc2IfOtx13NTYqcyTwIehvDCCcULavBxTDh5JkZ2v9X3bNiKYpWhudyinzNHzLFa9
         Fnyw87JOnp3aV3zrBWTtuQbnI7pjAaKT6AZON0KSMPF2Kd5AfrgBC9R5W/Mt2Mve845h
         uJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881001; x=1722485801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=f+5pua0wA31g7bvn7DVlPUMXRxyVlYFRKheoswU5UgAAg7vx7fll5JitNg+ClFHPZi
         6rfG+cgOsyYSIpvRqBSOzoUzR0fAJ3X6J67UesEd4ylwLy9GOfZ2LkB+3Zpwj0zwAe6O
         sgRvPeFNDfAQeUeEtqip3QJ+FuXxtT+0qZmAKMhg2aQuUK7sKw27OETwqXAOYVlaYDFr
         +K9RsOu8XGFNExHvmrSwH0TJkaUym2AY+zD5adFCZ9tsnp/oePV67CoPk5U5XfoZtOSZ
         J/hDdcNb4AfVeVxr6dkzFD4PlxH6T/9hC0nXWKdXP3J1iUl/pf8rPeKYPZBKO/2zcmxP
         VYng==
X-Forwarded-Encrypted: i=1; AJvYcCV90/+dybFBpS71hhLuuJWr/l2/E0h6n3yFov5qMZiGz0iDkJEYyqeh2QIHs0zwwR3dSCtLfIdz1v9lb85naAROw0t6W8tTV4X3q40=
X-Gm-Message-State: AOJu0YykiuKDj5ryiimiex4A/BdLp/12YWKddzzbBv6BmwygzueLv1Qp
	RQb8Zzp1sGFhPBGWUyUPtl2GnbYdJMElpxGrY2JSERCgEx8kQ+OjSaHG2JU5XHo=
X-Google-Smtp-Source: AGHT+IFt1RkVFf2OjyTIVYWnNjXMMzXbPhYUj5yMkNfJ1obS1jdCLktWfogDenFlyhmNY0dxbGiqRA==
X-Received: by 2002:a05:6a20:a113:b0:1c2:1ed4:4f90 with SMTP id adf61e73a8af0-1c472867d36mr2466930637.19.1721881001579;
        Wed, 24 Jul 2024 21:16:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:20 -0700
Subject: [PATCH v8 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v8-3-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880992; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
 b=ZAWLZ9wwCs7KaqSUn9fZmYN47ZJqG0m0R/IdKknBruk76HGKRsw/EmJRczJ4ZOD/iVkMqcV03
 SI+sGJRP0kKDKii6PoLcAkWsqoy9XQ8AZNzUmpoWrTo5SJBRIMkCLI2
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

