Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2226C158A07
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 18:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760328; cv=none; b=ZbVvkzZDUhiX7+A5ltdcOO9zm3saSTQrwWZ3B3R+FTLbzCrL/DF5mZPGbbEsjH5EoK9uP1F/sqN/pbO7PCAUMDgbmlERhDZ6FEI+xHdg13divS/phWRztOSbkXl2JJXfgxsnJdHRYYdRjwtgIcF+QprY4rPQFzCAVKd3Bazyvi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760328; c=relaxed/simple;
	bh=PDP+pfWfSCvmvZn17Dj5qqvNgRLWprJakVgT4fj7WMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6JxK3G/F9wy6jC4WtnZruUYdWxtdusVpRUtLgXWgQpcmdWeA8BpepIDei0CSXOZ6tYrtOVIV77MoacHJHBgA8BD0X6oCeUZEG60c180z2JDbSdEw1BEWV3zX9e3z5llvXxPEQ1FTIer/4ri5h816fvonjJm1Y0sOq9YrFnPnOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=geYF2YL0; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="geYF2YL0"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f4496af4cdso18828b3a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 11:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760325; x=1715365125; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=geYF2YL0Kztw4rPCjlRvB8eBGlAjUO+/+y3NdNr1QEoVKoGbTdKlt7ZN6V+1RuNrM6
         c96fynnxt0aIDkoibWwIlkFCMHlL9SS5ckPFIEWJdZgRuQFb3OXPKMoZHaGvCTndzYT8
         BEdDNjB6pDLf5687rGLQWtDQeUqGWdvr/MyfToH71bVDytUXWSAHnAyPUxhSx1ZQ6GEq
         dTRo2mEZk0Eu99hcXw5W0uOR4CYa42ykKHfmYby3JIEeyq5JxENNU73HeWzBZAv1onfK
         rLQ1DGZhbdtXRRlNfNAcODRlkWWnS/RcGuJ6B1kH75VsRiJoFh9Osg25Bw16cHs/u51L
         AMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760325; x=1715365125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=KGW+Pa79hIotd56gWkpQhr+su2OhgelsKfa3VY05sbuYf5v1i9MI3YZlTzXZ9p2AmI
         uZ+59zKrjGGw3vtJQUqd3h5Cr0GkNwofbLaOVI/d6Sxk6Jz4KQ3YIZfl42xrf/YM6/7d
         aNaZTcgkbELGNMhfu/EmGzvJln4LSUvZ5uQ2GQqrjEsmfz/VNtow14WkLU2rxu0iTUYu
         3MUPNR56G+hbkpUDxJqJ2iO8x4VepB2QChDkzdwW6BEi8s3MTIlHS5auoAaGHb2sSKY/
         GylE6MB1dVgwLzpUMCWK7aRl22JRSCpzW6Mqp3yolepZBALMsE6uoxd4WUgdqXSaGUBM
         M2zg==
X-Forwarded-Encrypted: i=1; AJvYcCVBqiAC5+XK9DRZYDs7qeushmgVDOOAQY15SFbn1EdkWgk9mHpfrb4iRbHooLzGe4GVKu6455B8G5YiJPxxB5qBFWiumXpKDRSEbC0=
X-Gm-Message-State: AOJu0YxRogKKSHO+xc22+gzyL4j3hrexG/2Bzb55OCeanHMiJEaJz/9K
	PR17YNlI+yxSuhmGBM+tz1239OzsrkGZtvyjobmcJj6jlU7SD+MJm3CGl2B4riw=
X-Google-Smtp-Source: AGHT+IHI30fGwc5aCXifihplnCqF21Ywud7b+pXK0ZB29mwiXSifKnIROgJMcOan1fwlZbT+pmL24A==
X-Received: by 2002:a05:6a00:22cc:b0:6f3:ea4b:d24d with SMTP id f12-20020a056a0022cc00b006f3ea4bd24dmr3830280pfj.9.1714760325524;
        Fri, 03 May 2024 11:18:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:17 -0700
Subject: [PATCH v6 02/17] dt-bindings: riscv: cpus: add a vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-2-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=MANeivyUeAYOzXwSGR3gfRRzHTw6Pw61Zb5xoor65at3CiK4Ie+9408tjDxmq/csHeP+IJG6P
 N8Zi0GEi+JoCtDK4iOsRWQHVE5uARUc0GT4i6BEO2Bc0gyaUqRWDOaf
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

