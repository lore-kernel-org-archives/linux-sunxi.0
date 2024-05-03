Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDC313A27D
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711614; cv=none; b=I6c3mAolzw3r13iUAmBs+x2/Vws4bSTXeaM9Tkg6izyO39Sfv5SsuDtABM2S4CIJzqAERwgrbpV4Ri57TN31vtArUFwQoX4JQDMv0cP1UHXRodSgzoigu+iVpot7N1e+L3W99iwe+vW9rE4vanZMAwncgkVTEd4rUKZtnM2nYNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711614; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGU8GQay0u7Z6lOirfhhlQ+ATYUiPS7OsSPE3dLUFmqNHTinJdG3YY/WhOO5/c3DiNKuiH3le84NiEg8O7xiyZc//LC0KSvi/NETQhbWqU40a+GuYxXbmSu9+WN5sHmiIyt1Dlq5U5TaawQVxVFn80fl03ClW495tpsrd/yk9Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0EPVD8Rv; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0EPVD8Rv"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so6448402a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 May 2024 21:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711612; x=1715316412; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=0EPVD8Rv8sznlTEcJEWNLy+ja4cr8m/6hfZZYoyU+2QBlvC2praK1hNYS2WFDmJike
         eK0r2hOu0XMNRzjLhNBYP+KLAu5lhvM4XRwOX+sP0s8wEx/3B63iPr+ZyWkiXuYqjPQj
         N46AiB1TWpNHpjeeDG/k3Z4T/JWc6SKd4CMbL8yuuqAXOh+NiFbTqmOq+CAiWRS47hr2
         DeHygCcnSGDzWc7yIhQIHy0gqwaAizJOM4JbpWi3mnX7ThqykW5kY8lzXvvW5CaFSziC
         1nYO6xULLxx5aH7G/OHL7L8B5YiA2FWqqCF3oXwzelFl2x28PQA0+/9/ica39DVsPkO6
         pX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711612; x=1715316412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=hpupvYOk7EWK3Hbu2IlJ5LI1QZBYY8Xmpd6SnMTnZGyNb+Z76fH0MKU1PMsmtyktw4
         pYsDhzNKQVpz26TdALwF5GdZeLLcOoTxLLaLt3DNLfKCVe3WAnfjph3I5tol8xV/39FH
         Lq5VW/JHOGo582Ug0H9lv5WpftbmbCJXF/zinagbRNQ99fjk2rTOrQAtWw5pYkKHSa2E
         eZx1CdhS2R7x0CMZayVXXlGSlLXYljLV++n/oudS/P0Jic+tOW/CK/AnffHSxlFrgDiP
         OXlSrFhb2IdGBFfiV7W5Auo2MxZgVzThHlFewdTsqDy8s2xijfBk9EPsUCLp/v0Ik2F+
         S48w==
X-Forwarded-Encrypted: i=1; AJvYcCXtvdKahze6/kj6eh82lo7PyzZ5aSMDcX3Mrmdu79IDbdjM5EqM3qG0up7X3r+gAIM6WKvIVGOEYMyU2BU+vrgEzq6vnHKGZiQ6xRA=
X-Gm-Message-State: AOJu0Yy/1GHRiA6crHHpvBa0BaHPdoT1sUOLmP6Rl4jKNm37lP8FB6zB
	+hCWKXFDEf7RJfnQGT1vM2KB53KuCDZqRb4iNoboQGHhGHZ1HveWUNgLlUqxmlfnPkYITTEILbP
	V
X-Google-Smtp-Source: AGHT+IF41hzKf/haVFQvven/JbxBJ+u/Mlmilmw8xyMi++Oyo7SayUCiC8aXNcvJL+QSQBIxRKdnGg==
X-Received: by 2002:a05:6a20:6f8b:b0:1af:59b9:74e9 with SMTP id gv11-20020a056a206f8b00b001af59b974e9mr2154976pzb.2.1714711612474;
        Thu, 02 May 2024 21:46:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:39 -0700
Subject: [PATCH v5 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-4-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=8IiFogJx9JBBPQ5oODZ/+sRV7hNPdv1Ar9s5kqJOcntxexJjJ6jCBV/6P4yvKFz+I1naMnzjp
 ueolnUb0+eoAAIxaJQM00OvIraOUtrlv7jCWmPGAhRsCznbLEKcwh5j
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

