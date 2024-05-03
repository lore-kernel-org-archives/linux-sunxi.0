Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4890A158A07
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 18:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760325; cv=none; b=qRwztIRhcMQBiJ7mdG0dz85tKJO0M4beBN6mhqRVYBkJF5k4Ew1C25oOFMaWVOSbGXjg4+nyvFiWF3CA3I2L64m9Nj8O9p/RqoJhLIV2Q8mh7R9AkC9T+8HrBenRPJv89u3l85anyv4sx4mnZKPaXK7/FU7LTS6x/tF3py10N7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760325; c=relaxed/simple;
	bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Te1BKhJi2VfILn/lNLbKkkwcf6Ae73s6ZtNWExepOx16/ffyYqgTBO8+p1I2aYoYzAs827IVnuouwMkUjisTqUE8N2rOCQzuYYMPhKxfcKdiPmkAMIq1/rYKLS8IZs53iFIWVhDmv3CHziLX+f9dC1sY46DjBwjVixHTI+9G0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=R9Dw/2Wq; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="R9Dw/2Wq"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f44390e328so2032b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 11:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760323; x=1715365123; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=R9Dw/2WqUYB7XusaB4YfcTdqYBq9X3hTwgj5IVFRYBOPPKRHsLuWZxS6e8G8oz9C+i
         0Cwdj+DAAZHYrX5cOMcNlGU1n9D1hoXdOezOAESKBXm0WcwAyEt7dV88/7HLTTV64b7H
         o4s5iYoHZTOhpYfxm77ggdADLXvVLoQFgU8AgzJW+M6/yp5+Wb2Oyw1Fnfgr64v8LAnX
         R2NCimLDPvq2i4R4qnyIzvw6xhP3dNMra6zVShZPttCOzgbKAvfLJjDCEG0S0UL2KJg2
         BqZmdvhodm+UCluCMp494D6ByVDfJB+AI9z1FAyvwZjREkk7hMggeaYUZrDY9jIdz9oF
         KlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760323; x=1715365123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=qUrfG0oIh0/7iX5zmfyEbeiG0iTsgmQusMmSh58lolYm+z9DAXAcQIb9cqyqd4pcwN
         FX9G1cov9DG0QMiS4b4HhkdQEV3nWWwFSYBNo8I/th1zwHRebXJ00FwJe7dassnfQx0h
         1xmyZqCxQFA7i5I8NmZdRS0NowRfRZOZHSo7epUAHaVfw8btyCSDCrhQgij4D2oUnR8z
         zcQMR11aaauJF+tnSZ7zqtu4p2126WizUYPGn3zCXjbMQPR0aKM5CSNNRCW2dpkAio3w
         FEX89CPXFkbwoKBRY7dvezCxXBnjduh9sxXvuN5V+pN5wpSwiPqP+GGBsQRq7RJvIUVl
         GGrw==
X-Forwarded-Encrypted: i=1; AJvYcCXy6IZN4qj32XigZY2z6SDKI7MpgwnElKxd4kfrpr/2b2nyamlCFMJe2/F+IH4WY5/buZPw7lDe5zckocKIM+xXMB7ndDKUyesRrPU=
X-Gm-Message-State: AOJu0Yy2DSXnim9U+GnM/Sf7cSXDwx21sZ/d4w1s/3j8vsf8HeavtRcX
	KTtXpYvNHLnhTvanjKqiPrq867xlNPut4tolohfqAWnIIrS+C2+QkKR3WBbJ5/4=
X-Google-Smtp-Source: AGHT+IGBOKl57I24YFZySzh3mz54yFRloG9YDHhQIbdUi/b1ycprdpu0E8l8Tpw+3ZKCGJzBqSM1lg==
X-Received: by 2002:a05:6a00:2411:b0:6ea:b818:f499 with SMTP id z17-20020a056a00241100b006eab818f499mr3821023pfh.19.1714760323428;
        Fri, 03 May 2024 11:18:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:16 -0700
Subject: [PATCH v6 01/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-1-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=3O6DNsqnjho0eOFsM+BkkXkbFm6aePP2kGmbXVZ9SDtJ/226s0zD2dPzdYEZM526omlhaNz9u
 R6CoU3n69abBjslwqGP4BXTu4vuglNkUKagnVw882sVEOVJf8MhdD5N
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0

