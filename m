Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4117C8B
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jul 2024 04:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881001; cv=none; b=pxMDY7gvHJG4BDFoqNtyA0998CmUwuhfuNzUL4gf67W0Dwds4K6hI9jIOQV+AvxnYrwDltO97jLnW4oLG/60jJGaHVQp6F6Gl5v9T5NDN3AyyCawU5ryxElfCdvgP137Z42zuz6KW+4VWuyhNMW0Cc2vd9fjslrmaBhm9xnr8V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881001; c=relaxed/simple;
	bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tj3djuX+ryvxD/k1/DTf1brtvys43ERTgaI1U/OIYUc6EQI3ZDtnzR9k7S3p3ibWbJLNwkzckZDclE3NEERRJpSPp4a0fGD1natg+8PDVPkE9s91qBcoy4HMxt3zEEwsc+/gJAfCKSMyq4YbQKtXRXc9YnvFR4yq/IzeuZQz1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ssVSAHoY; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ssVSAHoY"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7a264a24ea7so329996a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 21:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721880999; x=1722485799; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=ssVSAHoYeM1G/+SFl82z6jjBy1w9FuhJU0o34t4uyAc1SPlIYgcX1rEMA62QHUgLAz
         +PcjWu4ygura1RDU/GahM77rS78jum5VgY32h3UChPFZ7zckLXKLcd7M2uSmyG3afDMJ
         oHwLRG0WvfcDhofE6eO/83urKN2pfJLEBRd58Yi3Tws8fK7tu/1xXyhMeWOZvtVWNtmX
         s2WkkqPZMhFV2ADQjcrKDC8VQFWrzfISaA91wG9S5IZHskkAPzsKHB/C+h3WLbgBSOwR
         MKZsW/OM+ZSljYjOIVRST33b8F6BCGdySvYrFLCDoxW3fwHoTP4How99NcJuazvs9jT7
         k1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721880999; x=1722485799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=d4BjwT9HhGUL6690QIClIx/oq+nl9P2G/RIeqwPCPLnwBdIj+VY0Pj6DcELAviF+oc
         iDXAEihpK4nWtvkjM5TcIOgmJEKlsoBrgPi209VvNzFxye2o8KjveJxJOmbtlpWAP5SW
         s55/YnHRG/nb1nR/rgjoWZAauduEY9ZJoQy3IiJs4UMm+eFPfmk1S26LMB4NtKLf7Eyw
         bMxegT29KOkiIgZ+nzJ2T36PVocazI52dnzmRioMOpBiArc4Yx0LyE2yzzfIHhKqvp4C
         vtHxkTBwn/zGh0aCNSmiU5CmvA9GcIRLXslCYFjvY9a6U1nVqYmPP7mUWjmv+MUVCJs2
         U3TA==
X-Forwarded-Encrypted: i=1; AJvYcCWuj1nrB1mOo2vIPETNQ72jrqFZozflp78t9OIZ9akp2ACNXoWSmMd5zrD/zWEw9AK2/T3V9m6UNiuTNdaZLz1Vya7tC4ADWjCp03Y=
X-Gm-Message-State: AOJu0YxKSEzek6iqHmD6jMjmmQUDLaXO0tyUmvfkOTy4nHQy1mn37ORQ
	diVEsiCirJSBqy3OO42eYohyfF+9NgfRX0X8VAjzelG+BPgEaGzk+tpDPfOnwcE=
X-Google-Smtp-Source: AGHT+IHBqouUd60StUuFY3y20z9rotElPmPvr8np0xp/cOd/5D5tZBs9q3oV3mBGdN2o0+1sfhUmuQ==
X-Received: by 2002:a05:6a21:99a1:b0:1c4:231e:8ee5 with SMTP id adf61e73a8af0-1c47b229b19mr919358637.29.1721880999516;
        Wed, 24 Jul 2024 21:16:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:19 -0700
Subject: [PATCH v8 02/13] dt-bindings: cpus: add a thead vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v8-2-cf043168e137@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880992; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
 b=U6hkM0vK7Fw/IQIGJFsZnHJIDTo03z/90pw0ylmD8Hl1YapQisvOP8xIEUjrga2P3in7QNuEq
 K4vTINX6W0gBsmwtfDrGgJt9ujpdnjnf1swACzykXFrMVEH2Gorza/1
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

