Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2D17756
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Aug 2024 00:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722990710; cv=none; b=KE/zPgslI8NjwnMiRbNx9B50HgdB9YBK1h08MN85QRT0ii7fCOiNXD3wEEDW4yZsKqgr/oO9rEL+yv53SCapYruxVOcchFFRv5BEIFah0zRz+XvlbMxV8qKMefLY08hMGXY732LVdaE7dPfR2nc4Q103fVfvkgKJCieML1kYc28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722990710; c=relaxed/simple;
	bh=g0Gsy+5TQh3RSmd39xewdNDSsmzEd+HtR+40T1Y+noY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oI9HO/Pqmc3xAPOWYaKMBiUwLqOso/oldpV52w5WsaWdnMbKWR4ZTEcjbqFQs5c8mDGP7DhMLlHCzAawo3cSY7dGjhCKZcJ9c/6GZu83ZCnemOgXb1SFjPAiZmYzUqcEXpiOqfIb7JFPKz74oH1qt+roGb1WfUEEkNQI+eEa31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ovDAWGjM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ovDAWGjM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70f5ef740b7so985339b3a.2
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Aug 2024 17:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990708; x=1723595508; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a31h58dvirjjptvxje9y9Mqcx9iPDZwg1ciuyTglV0=;
        b=ovDAWGjMqfwFIYFMMiTEnVvTsvqtSZVyGokpLFTURWo7WM83KMNBX3MitE5raA9yvc
         OwWBO3Gxcv1WO4JxnQHdehrD66ISw1vxNiOfXX51os5VHNUzeIZ0grjrgtIKSOka8s65
         rvYW2PRqqBWB70oREI4/TFn+mol8PNI1IFS763tr3V/XsKoajLRdBoBSMafERRC5R6ld
         7PygAQacFhmXBu1D6ciaO9ppFTNkYrWnVQZ4jzpnD6WxMABY4MSrBw86cwCrSeJ+u5Gt
         4METS2SIxAQI50lPvLl2oO6nc22P31oKsFRxLDgwHK/T2Yxk+pfUxugfLbFRzgsrab9p
         gxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990708; x=1723595508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8a31h58dvirjjptvxje9y9Mqcx9iPDZwg1ciuyTglV0=;
        b=O0CfN6YCgfwITve8mMOhM73fEsbm7wkMX7PMaIvC2GDqKxLuJFAPfczmoafqoMJTWE
         Q/sQnE3UW8eMh9Fu7tcs5IWBUaiqkWwJFc4Qs8NIQ1lxTjm+ESS4Zzvr4xIHaJDDnhA2
         74X/0ICmVYjcliwqmoqb0twIIFRzn6jdFTJGPFCK9UUtMOexdbM4NI3mKob0hSs3OBJd
         Rr0eW26KZpIFUXeqV1D/R+W/W1VkdPFW2yxiV0lMtoOW0Wec43udJvi3DMNgYMXSpHCH
         cDU508JeUYGqtNFksYNbO+q6IxpbH0HSvFmM/33S30Av1hxWE9SQYQAUn+9w7qCrYKq6
         ncHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOIwSzBCgoWGBBfxMVvf7LYdRpFhvFKJEN39fUQ8pWzIqcurxGl8QcyBA66t0ACipBpiZFgZT+5ZzWmkm9x7ga7CRZZuro623WBrw=
X-Gm-Message-State: AOJu0Yzu80qClnidaYvhkolIBiOu+bwbl9g6tFvxPhIkLYp/ZvL0ZDvh
	Rx76EnWAr+bp+hxlkVCRg+HMsebaZptHOLKB/Fzfr+hcODHA8HCvacv05ZOdCxI=
X-Google-Smtp-Source: AGHT+IFlZgOw01pjcMoUd+dM92axczabu39jYLZiTwPJF7kvu/LR+bRd7eVCTv14rSm6HVWFrxdAGA==
X-Received: by 2002:a05:6a00:140b:b0:70e:8dfd:412e with SMTP id d2e1a72fcca58-7106cfd9d29mr20899556b3a.18.1722990707845;
        Tue, 06 Aug 2024 17:31:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:38 -0700
Subject: [PATCH v9 02/13] dt-bindings: cpus: add a thead vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-xtheadvector-v9-2-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=g0Gsy+5TQh3RSmd39xewdNDSsmzEd+HtR+40T1Y+noY=;
 b=N+0Xga663TzEPFBOSLMhnRrEEwkQ/6SLmoDaPhoQWHjLrgqgonGuO5TdqDaKrTXvQOAb1J3CO
 rYW8rc78xHSAy4uY9OvfHUczaGdel8ciuSTRy72vsYUO4dE58ItO39R
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 8edc8261241a..c0cf6cf56749 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,18 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - thead,c906
+                - thead,c910
+                - thead,c920
+    then:
+      properties:
+        thead,vlenb: false
 
 properties:
   compatible:
@@ -95,6 +107,13 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  thead,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required on
+      thead systems where the vector register length is not identical on all harts, or
+      the vlenb CSR is not available.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.45.0

