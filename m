Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA875374FF
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714166971; cv=none; b=B6VY/QR6f1ryaKAbJ3caDUE3Ahh9G2UpDtg9CGpNzbyFMdBg7i/3b0c8fLa4qFu90a5ZgaCRYo0uYp7r4wS/mvcoRPxjWRKMMSUAKY+sTtqGuqAh0b3ka47Kc1DdbPOGIwn4m0QjAakdgwGrHUvOfHn3tyofiUAEpGfdCM1eDVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714166971; c=relaxed/simple;
	bh=PDP+pfWfSCvmvZn17Dj5qqvNgRLWprJakVgT4fj7WMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOn3e83ggNckPMU77W0lfbnB0SY3RccItFgzYTcj6fH685IFWyJx+lzi0XHRi65KZqnhWw5YfDYAlfYWWg93GqaJXc9xeHSanMrHACce/hDVnQelsQQp7NMkpfamxsat0WQXRu+1+A11PkX/LXsywBHyz0oVokiiDuCX2ngEIEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zd6cq4tw; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zd6cq4tw"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5f7fc45fe1bso2083211a12.0
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166969; x=1714771769; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=zd6cq4twmmoihsbpqfNCfsvTW0jiYwH6/sjugYKLFTWxU7XtEgQOhw9xUPLvmjgMP1
         vbGtvqeDwuf6bfniTZLSs2MpCtYyZkQUQfP/wVZDRtehD8XvO0QYBBVn4XhiGY4X/Ywl
         1l7m+/L8XO4kpAn12KQ9+ZZJ1TEfBmtUXXu+2C9BmQCyURKd4ZXUkCi+g0ZJf+nEYPoY
         DmmtsMVWICt05PZUpdRbdufCKjWB/dRsCCMkHuQy5PpEDAqDA5gHIBq4CUbf3kwGMbfb
         XkrBuI3UmwUWsmagVKi/iXibtq2we7zB22EgYi4r6iAILWvhDclzbz+hE8StRxFSM2WF
         /JBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166969; x=1714771769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=XLT0JdwN2nKUsJrI4kJu0VQ9cwHYHc91H5Vc6+rs+dy0iit0l9m2h49zQjqYXHgfWp
         hAhTIROgCKKIxi+e/1DGmNxVMlsYK29+ZdaCxWjs77b4DHTNpf3PiSK6L7FXvNt6p3Ni
         xy8z9WZkFc3ChPh4sE7aRyPqm6dzRz2lnrz8g9PI0tYBRe0AHU20P8WPBz8iMXR/sJuC
         N4nb2cGH30WkeLkuah/qLUF84aS63v8cQKF9O6Ygux4MkmgZt6ofReabplmutvXexnEB
         yoy2uMJb19dacBSw4txAtNIcQSkQynFUE+QXDHknnurSGBZl7B5u1jNCkkPMC47v0jiP
         vnAw==
X-Forwarded-Encrypted: i=1; AJvYcCWxrUH3sal0md9+jL2IPx2U9iGWFJskFc7LVa3KVKqiEdUuAm2TBs2Hk3odstX5aEvsrM7i13LqDgMvTEn6eoWNP29KJByLhpt5Fm0=
X-Gm-Message-State: AOJu0Yx4TQ3eZdWOmyLLGweltV0l7qaqqVa4n49EdqgYhg++T437aPUE
	1m05xF5Z4Zk8ggfkxWOzdzn0GA+diYacTgtadwO2E71hBd6FopL0Nf+Nbb2TYzaK0FdmDE2CJov
	L
X-Google-Smtp-Source: AGHT+IG0NLK4iE+eUG4asNWLFKpGGh4C2Wjuei7tv/cQwmtoLplQWM7s+CxqV+3nZNHhGKsZKJXClQ==
X-Received: by 2002:a17:902:f643:b0:1eb:788:b424 with SMTP id m3-20020a170902f64300b001eb0788b424mr3956494plg.43.1714166969118;
        Fri, 26 Apr 2024 14:29:29 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:28 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:16 -0700
Subject: [PATCH v4 02/16] dt-bindings: riscv: cpus: add a vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-2-b692f3c516ec@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=Sv3NOp+Khbllr8+Jo15OweAuQfWJMGJSmsVQYWIPByneO4usORzy+u5Sxph4lQEGlzWYaUTCa
 Prj7RDB934ICi2CTIsEbZ+WZBC4lg45Tneo8TuIKSKFlCvLf8TPmYRa
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

