Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8484F16C6AC
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848446; cv=none; b=SYs+fhJEquJsSrozRuo8Q0QD7HbNHYdd7U4OpZumrep8UZTTQHTZ06ULcjTEpaXq82Eu9wUu2udXpxV3SLtjShzrfdKr8PxdKdQeKRriySHP9HIpLa9sU6jQLz7UFh+q/o1Ns/+z/gjuTK1AYw9sGvq+rdAamUg1kN8mEFaOXsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848446; c=relaxed/simple;
	bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YqkvL5bCxkCXJP2CUCkBxvQskLkxHJdlFdtp0UEBXr58In40xsrg2RZg+QWZ5SIlrzbEfjHwOdELmfnUC4duS56fr/pkxWpnu8Vm2JXM/Dd3YiCO++z59XB2t6fh5r5/dW4lOqT62fAqNN5Y09hcOyAV7AFNpFxNrwO74ai/2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=trA8CYrx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="trA8CYrx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc49c1f3e5so1180625ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848445; x=1722453245; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=trA8CYrxYucPznZT0lg8HYkaQfAyUI1nJQRgWUbNzg+7lDzG3+qq/fI5DhWE+XuNoQ
         HzANFghEcGUuYIBqoW8S/6DBAYd5n40rZERJHIRmbT5zgwYZ8BuFAASaf5sRbRBO1HpB
         zlYLD1K6NgFSVUssfeFvRXkw0B1Rvdfh8K14DN+It6G2C3xSI2xtnXCOxGyqq827xra1
         QVkW838gvcbesut51zd2yqrrWvoSLr8drMcKXZbDOWLGt3+YCD+71pJjFtIjc5BWQXgt
         tPfEHzq0cMGahvtOlzFja1xnO+hrjXaO2SgbozxsK6xG4CLzTXpv8MgzkxTYOjbp661j
         8sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848445; x=1722453245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=wGxqbhRx6KQt6VxhYtuJqsWz86AcA6Xfph11c99gK/67ljR4JNZPBHALnO8iUBzi0W
         Bs0BxLTqUrVO07NqryDSzOGKbK1clRJ/nmKZSUli9RKZYBGe9cYNoEUZvEcwIBUfmMqs
         vsBN/EZPf6FNnNBbV387YTx+wZP8bafL554fiVovTXqmkL75wnL0XlG27XaufpmX5DQt
         gQUmAgCBVydJX82pIgUGq8Y5wUt/D9/t/KgpT43DYdWhfAqTvqg1vtETKoDHs8bb8rxR
         0fd3Uq/CrKHtFZ9y8E6NUWkFwbhST6n4IRoz+X9wZB3uREhV8UqE8zVtkxvUvL893wnk
         ufjg==
X-Forwarded-Encrypted: i=1; AJvYcCVWXjheg5pCQ97BBmNHcOSAPU7T5OakwkEQY86WLQW54OCH3R6g6uQ/PJq5SWk6HdasS/Apg2wIP5us9Ibs2L0TvHxUARaBNt48RJE=
X-Gm-Message-State: AOJu0YxyUk0kQlc3BejpDULxyD4ZOsZ7O7YKd2ZGril3M0e58XXxUhus
	m9wJGrMJlLksZcELUJFAoX6mebKlvo9q3j3hUq7SZ6pQmX242dK5q0r1UNoYdpY=
X-Google-Smtp-Source: AGHT+IFx97Y0cC+HCH9nA4VAxFdhc94zzoHJto1hheIT4Bw8Wii3Iml1nv5bpeIsbUYcqNFP8+VQRA==
X-Received: by 2002:a17:90b:1201:b0:2c9:9530:304a with SMTP id 98e67ed59e1d1-2cf2377043emr528027a91.9.1721848444737;
        Wed, 24 Jul 2024 12:14:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:04 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:53 -0700
Subject: [PATCH v7 02/13] dt-bindings: cpus: add a thead vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v7-2-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
 b=CjHZjgnqGNw1RWWuMeXL+h4ZRUcHluI9AgBOflCAqUrmXobpkFE/dlpLH4t3NW1vya+Q6wmXZ
 d8LozeuyiSNDhlJBwI2X3rx31jTWd2nbsaHEp8waveombqcpV2ALPOC
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
2.44.0

