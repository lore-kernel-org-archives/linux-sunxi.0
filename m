Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6515CD6D
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 23:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718841453; cv=none; b=QWD7HXAhEfKmF2VYx73Uy//uG6isERkDKesnrwGT0bA2FBKPReHVBLpcLCQheRGgreeRkUt+EgcaTXTtrMR0EGZzVVsfWd0bZManUDChpuK2iQJBgKJASTW5r+7wDPU156SFwvvP7F9Einots5ybjOMnWLAqbtICScdmkUv7ogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718841453; c=relaxed/simple;
	bh=AcYcvjjFWiKhiKAl88lWRz1HvD4LxurkZU44w/pWvNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwZh+WbnMEdiEqEfjGf+th4io0dW56orNmrVWpLcRlcsckhi8ISdxyZTqxEhb1fq2N+McWSb/w7P1feucDOmHqtOeIv0vXIKYtD5xDKwoBNcK8XuoTUhccY3e7JcPqE7bLxwGteyhkNYrFGcxZSh8O5+15H2+/M78HZaH2Pk140=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=O/c4B6di; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="O/c4B6di"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f70fdc9644so11261385ad.0
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 16:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841450; x=1719446250; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PelCoZIE6iF05n1jOzSStOEaV77ZcPwwfY9j6HR1NNo=;
        b=O/c4B6diF2ZevqqK7W39Wd2giPayXWhaQEGp2LEgZ+2WI9yqR0Kt3CmB4a84aTZNEW
         Izb8alTGhDJUrb/MqIPtwxqP+X8mMoI2o9DoGpXnLgrZzYesKnVHtAfXB6l7GLtfP8Ac
         LJgDKrmDub8aoWj2ODaSq/RMxBFShRTEbM25dRw/3k/XBBSW2eniY3p3KT1pkjyLdKow
         2D7aMDVvcVC2IHAtaAvz8dDebhr4p3J1CdDcjFVx5cmAMQvX7rcBPQTg1KOQ9Snhrrq2
         aEEUFPUo7L2jp2LlOnKcsA+JDWwMVgq4Epse11YMYNgfJzatQYTsNUB70PsPg5phi0SE
         mxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841450; x=1719446250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PelCoZIE6iF05n1jOzSStOEaV77ZcPwwfY9j6HR1NNo=;
        b=rxN7d0Be3w8H9LKCijMSV/e/Ni46VjyUIK0qi1gS1GqVLnixARu6OxqRaaSRihrze2
         Ds48uKgn4ZSPDOyDY0HcNUPyqVx6L0XRhGGom8gvP4rGwaCe4ciSUoiva7QdzTORhRgj
         GCU3t4+G+68MPSsdLmCS7L35UI7ZQkAcAGVzFYAVZYaYNR6aJMEp260EnTsTKVhVvGVJ
         s6RrvpMwjnUubaEpA6CgLa5tv7MvjQHSnIG6QpKEEfErAtdbsjxBv5yoIR+EDHksRPls
         xeScdund8tYTfGZJeXDivWNSWLPnHVKyiFeMkPOF53Xo1ZWtGJZAhdUP3UITfTUr2PZm
         pzGA==
X-Forwarded-Encrypted: i=1; AJvYcCXz12Dm+gOb091dhVFkWrJhJtfNBGipGWHbJPNLpIQ+CBnrI12Cki8GsB89nL7WW02pNHi04n7THq+kTF3NbCnW+1GPdzEQSp8nLms=
X-Gm-Message-State: AOJu0YytfI65A+e0mtvPgRNVDfQ7WwkzfRtp08X6G/STPMyNKd0AjgVV
	6ieDB/9HKj/Im90c6Dih4v7XVKtXulNVKFrCrZMD4OhnIWrjoKZ04WRniYZEBv8=
X-Google-Smtp-Source: AGHT+IGKiOHqo/xkEw31TNBwetx6wfNgMA1oKjo5fAWCMWu+48/TKV0DOjQRPhYoUq0jsmdx6frb+A==
X-Received: by 2002:a17:903:8c6:b0:1f8:50df:548e with SMTP id d9443c01a7336-1f98b28eff9mr98856635ad.33.1718841450144;
        Wed, 19 Jun 2024 16:57:30 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:29 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:15 -0700
Subject: [PATCH v3 02/13] dt-bindings: cpus: add a thead vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-xtheadvector-v3-2-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AcYcvjjFWiKhiKAl88lWRz1HvD4LxurkZU44w/pWvNk=;
 b=A9QBmc/bNcCzD9U62u8M5LqntgqiVYoO6pMKw58e5Ka8p8moOEMLez3mAwOBcj9EOCElapzC7
 Eek8Z+Nk9vABMXPKzFBZzvHdV3ycLm/UMw8VYhvueinEAk91PEb9I0/
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
index d87dd50f1a4b..a6bbbf658977 100644
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
@@ -94,6 +106,13 @@ properties:
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
2.34.1

