Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF110152517
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 22:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060212; cv=none; b=InBEcyVfwcoOpdRzuaMhQXOrUfubvaJzWT6nRn+xhDnQHLU7ShU2SOn1H1AztSYrTe/UA9PqvcPexzUIRb2PozV99DX2DvCZ68ytWD8bp480ev/gNon7zCHadYjdKtGWJnyQ8pdFuwf8qCfGiB4APhAtZweq+7Q8SREMn6sUuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060212; c=relaxed/simple;
	bh=FmiYt7nDWXyQO4kxiIrIwAfbDlksD7XmLdehRC0fezg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kY3R9AqYjzCbfN97yz7PM1fvQHgsoQneuYgOCLVSDTegfOwxEsZIcdVtxYshxfajIWkFNvHV2r05PVzXKymwCt5MNe8gTWTEjCs0M5xRbI3HOs2kTGGv4Daki+Qp+mh50rvhG0bb9aVYVbMy4eJwWzzSZZOGPwnrYFipbhniMgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rqphZ4pM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rqphZ4pM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b441b08so3156805ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060210; x=1718665010; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0+4Y1+kZj7kzyDByjbiS4FxJ2LwioSPa5gPvRUttq4=;
        b=rqphZ4pM4vaIAxXtC31nq2kb4vC/pyJJhadIpaKYQf1GJH9rWnQtYDXey8mhaqpWyo
         M8LU5ZUjDiyj2ED98dOI/yZA3pv2ehJenFv7ltb1+hfWX5j2zrmcmnCwh11EKcEHE0Fm
         YvpgZ+CGy69XwXhpOFGopGaPzo5hOpUeGhKTHuejZCsuJ+jiwTrt39S/2AtaVkQM6Hdw
         S2aZt+OezrzaxwTHUOURegfcDIdycaljktglglilWgjoe5uRiKqrJxP43C/pGCdyt79L
         LDJQYnE/l2sWMAP6dZ7IclfJjmfYhbOed3UbEADXjLaImuGakolbw/1DjHhHAGj8hN8V
         H69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060210; x=1718665010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0+4Y1+kZj7kzyDByjbiS4FxJ2LwioSPa5gPvRUttq4=;
        b=Nyq7gNDgpwevbKnqdyA+dT1/4H8W4jQzBRUBJ7huHErezkM9U/kdjYBV7KLB/QbxQ6
         eFuGFPGsMj82WtzFhPSZvk1U7KhgToMdvz9KbkRL7v2eWFpbJ74YhcpOhrrDy1az9l/H
         8DtcjJG0GjPQ/dju5e0Nyeps5iBIhfkcX4jmc0S4RdLYNmT1yqm3Kgs0KWJOZFyluSkG
         tJliK835lYHxga2CmyadKaipNlGUBqLih98LT4eSpU1kQbebKqdzFGfaZU7zmzuXEbIF
         o5V2HGJYsJDqkSiK5REBHydXBeEUTVSApk0B5s4RiI31xlyKn3Zq5isX9F23mK91yWwF
         yFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXC7E/5/GWmSXI04kl7OWzfGJHEaWCO1/murXuG57IIrFpQulH81EvNVSWfYrjRT+klt3rCPuM3wVxgJLfGfadxZ57RPf+dd4I1ug=
X-Gm-Message-State: AOJu0YzUoNqFWVW6vh4QUbRLJw7DCYNWuoORocJfFjNtjLyovNFOpj+6
	4mYek5CPaB717UDsvTY4dTHfW4fK20hKDlQCj2urv67tY2+ly3p1VWQ4ALZvIpw=
X-Google-Smtp-Source: AGHT+IHY9zRTc7DxB+cvmi8dhG7Q4tdFTL7Ge2pLkU2+1yqUqlGWPw0UVlqVpdnEA5wKCip5t2vlNw==
X-Received: by 2002:a17:902:c40e:b0:1f2:f090:b2c1 with SMTP id d9443c01a7336-1f6d02c05c3mr118292465ad.14.1718060210095;
        Mon, 10 Jun 2024 15:56:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:39 -0700
Subject: [PATCH v2 02/13] dt-bindings: cpus: add a thead vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-xtheadvector-v2-2-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=1855;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FmiYt7nDWXyQO4kxiIrIwAfbDlksD7XmLdehRC0fezg=;
 b=j6worq4qjVrGWSrMLs8ZptH5pEOv7EhqwLLriJxX4IvyZ6q4PNQkoLqbTB+1gPxHp/ucFxW7p
 LqxKtRcAfNJBzenwMB/6ovUljV8lB8Tsp26Tv9p3U5IVmx1duDVW6tB
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
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
2.44.0

