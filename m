Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FC68F6D
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 01:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661493; cv=none; b=ntx5tmPIZxatGpK+AhcHGGHcdrjtmyxLEBBV/zRUUx507YlwMgyjq/aCxmbMbanIu7AeHlm3nPAH9e81Ag9BZg6GBrDPi9/k//z5a+gEJ+sNzzT3UyLvGHcx320i+tIjXB/KSWxOvTRUlLpHNB9c1RqcbW4514cpzw0HTtvRC7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661493; c=relaxed/simple;
	bh=PDP+pfWfSCvmvZn17Dj5qqvNgRLWprJakVgT4fj7WMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCW2BSmnadHxyh9eht2aeTRnZU2S63L0ZXbQy0W0f+W95pWmXWpo9w+yOBcuKnNKCdkM7ackvOkwIR5+qz8DHMQa1hQ4ZY8rLJJOghstACwycyUnJBQ6MI1oFtr2FJaiZ0HiQkYC0WXs/qEN7D4PSQfdyrdpJq4KcV/Pk5y/tsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Qg9XjmEO; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Qg9XjmEO"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c74a75d9adso937533b6e.0
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 18:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661490; x=1714266290; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=Qg9XjmEOIk+5G6sAN6rwvRJ32VrWvBFqg/R6br5BUWSknxyousmSkQanhm4W9BU6e3
         3uLrqxRLJN0fBfoow8zvrgZHJZAsJ+irxTNalwM0wSwvDVQHQ8K92guSqZRXiXcTsVcA
         zESueaubi3zDAsLk1bpiiTBgWspcn+ewdYcWwZjSAm8qhlvRE34r/u0QXjW2RZQcQCr7
         Rk/JVHZV45DoAdi+Vk5eyygV/QDduzmAl9VA4pRSgcYk5KsBaYDlP1HqFK857jCHPw9I
         P9HxxPXy3s8Yop13Et1Ld5WUfeImUQVXZ3ahEonLrBE5GW5QOcnhXXicR9GcDmR2nFyg
         cUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661490; x=1714266290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=D1wgK4nnXrusO4hWK8lMbHoknlWuFwNCGbbl9082MUU3DdybpxO2JmQ6wRG8xZzVGg
         6DbvtwZZ8xzRV7BQ1akpUBvuqYTuBQAioT59yPtMIEdPKQXOg6plOFFAkPeSuwZNw9Vm
         5kR9w+oDOTgbiueEudooax1FhRQeSONhEnVpSKEJ5fLLMmcNdMPH0oAqBS6Yd5MXThC+
         Uii190bgSwq1RhHFrBcJoyftEy23QHWTKz/WUZKZ8P7EKhmKS4CKiRGp/Pu6Z9DMccf4
         2GfKq6u1unMdfquj5sbBwV2vmNsl4qyMbh7F6ej/ZufjpcPjo031M8QHAIojuHs2hHII
         0LGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZKAn6VtFVJJOPKXlIxZoDDAh/381IN7faZQn7uvFAAqYOlB72L7UzJ+MVjScc0iwnaHw/Orh/eK50BrmwYKf1KHrxtV4OZ4vILY8=
X-Gm-Message-State: AOJu0YynocXGaFjurkLRcjk7FfCb74qMFSt2fu0WpL1FfjbhbvtmfOYe
	vsPNbIrjoO4nwUraLeN1JhsYnzneLFwp6TAMHdWWDc3aDCcrBh32/CDANLUuLoU=
X-Google-Smtp-Source: AGHT+IHgwgu86RqEqJ440zaOibq3z3LImfEw+LLCOmkiUs5NeZODsGrPDbBsx/BKGgl/AQfbTefjSQ==
X-Received: by 2002:aca:d08:0:b0:3c7:4eff:f5a6 with SMTP id 8-20020aca0d08000000b003c74efff5a6mr5012320oin.36.1713661490626;
        Sat, 20 Apr 2024 18:04:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:35 -0700
Subject: [PATCH v3 03/17] dt-bindings: riscv: cpus: add a vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-3-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=YEjxKtbY5d7XiWDTiqBxcSBLOYectVNJpbMqu5/jHCbEbZ5l1wJ+MUDVVz1YIIJGA01BgcnNg
 0HMrxLA6DorDn5h4tdh5RWRkwuoRsB+sKvNkmlQQwt6LlqImE4+EPn2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

From: Conor Dooley <conor.dooley@microchip.com>

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..edcb6a7d9319 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -94,6 +94,12 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required in
+      systems where the vector register length is not identical on all harts.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0

