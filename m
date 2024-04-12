Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B118044
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 04:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895098; cv=none; b=MCWh0Ny+5m2qZtmkURW+80FkCxmxJ8RSddOfV5mS1JMLgNc9xUHUGXB3mAks63vIvuzmdFjFi1nJp9uvMejnuSD5QHWcicCs/7YPu2pybwUsBlJ7MDtuBZp7FACoDxgb3eXkf0YL2vfg9ZSvhsu7hcyCiOhp2gcGl6Xi/rkbLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895098; c=relaxed/simple;
	bh=aeD7kpIXCYXPUehTkm7IjjI1zeG+m9VrzZ6zXfF/zjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhgEZtwgcPXEZas/f/uJaVS8S70XDVrm+rzXQDzmA588f79lxuoZMJoJTTmFKapsQE5IzZw7VsS6omOZtId7Th3wt9qW6drLzqit343D+sYMgZfXxsFk+BNC02msEk2Pl8cZ1IFsO/FIQuVzCRRw22RfMt5HbeSrLYGMvWjEkEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=T8LwFE+a; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="T8LwFE+a"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6eaf1005fcaso374639b3a.3
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Apr 2024 21:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895095; x=1713499895; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvKWdpWCLanAFVX5zPtD2b3biice8x1/52aRbRjA/1Y=;
        b=T8LwFE+ab4Du0jiL7vS13FQimekUGxK31ZADgTBD/hIu0wIpbqjDFVHTHMu71zoD9M
         JhiK22YUP0fsMYWELnTOjd0KUbV6jyJopPRM/cKBTJBBGWPvloVZIpVEeTs8eIGGLWvX
         CH1Kl8otmR74VsCgrPzets3kDSYACTgMuV3PkpsuFqd19/J764Ssdi04f35gqRKClD4E
         UfVeeSHSmjSNGnrrlw9n11ojXO0n5o5LJI0ARHsX+EOXWHwHTOX1829SLrCNc83wxyXB
         pZBCBGjdHTyYSKiEgrSUsWQQNRHR9B8QInX8ht/DkIQU2uUFaJfgOVD3fDyeSp5dxy86
         nvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895095; x=1713499895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvKWdpWCLanAFVX5zPtD2b3biice8x1/52aRbRjA/1Y=;
        b=VTe2xym3R3XjbtiN1cK+TvTJrCu+mLE+J70D5f8MmLuYz0U3itkIC1X6GXMA9ESyBR
         5U5Bz7S5YSMw6LjmUOJExhzIaylueAHXTKgaAkGqFrEm3ISH1hJyoKOhoOFwvPun6TdG
         Qo4m1DLrBDdsRMeVGAFgIhUw0P6H5eUqHbdnjzjvPP3fMvNz39ReN/724gfLA8ptbFP+
         GOdqULHvY3I7lPtZOgIFR20V1RUPLYPI6lf5H28TSljqKNRAS+u1yRc26EHQkoH9kq89
         xOKoKczG5vaUfeDd2rPQa87RlbnP/uyBqG/zF6XqlC5j165AYlYd3mqLgnlAnl3dyyq8
         w/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVD2Oyi8ieI7D0yWK0dXEKpQ2GwG79veF3aDrbP8Y/aXTBw/2yYG2Q/2se0Z1uD2nwzAnoc4wD7N5ep8GQnkcu861gt4bQA6xBrqb4=
X-Gm-Message-State: AOJu0YwfVFMayXLxzOaHS/lv7rvlY0Uwwj8i5Yu5dO7RNTInfu9W6y6o
	AWGRbJB3RnLyu//9uw57G6UvAfFh5FADucTcgzYizgTvRkdgFQyFt/cJj94Go1k=
X-Google-Smtp-Source: AGHT+IGEzhFDfz+tEhZaJYNr7eckM5oEi1A9mXDPnazuRSbWbM8XnHfKloHOzQmsXo7SSe+IWRZJtA==
X-Received: by 2002:a05:6a00:cd3:b0:6ed:2f52:9acd with SMTP id b19-20020a056a000cd300b006ed2f529acdmr2081497pfv.24.1712895095597;
        Thu, 11 Apr 2024 21:11:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:07 -0700
Subject: [PATCH 01/19] dt-bindings: riscv: Add vendorid and archid
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-1-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1246;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=aeD7kpIXCYXPUehTkm7IjjI1zeG+m9VrzZ6zXfF/zjg=;
 b=gyzpquIQ9EZPFl6tdB4X44dN/ns59zY4ew9u14pmot3GwLVRAjLHanoVkOR4IpnFrYW6m6+IQ
 FGixAlkBa5oBmgLlwpqraJRGcsWGjHUOq+pqsZuW+UYTSJ6pTTDEzAR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

vendorid and marchid are required during devicetree parsing to determine
known hardware capabilities. This parsing happens before the whole
system has booted, so only the boot hart is online and able to report
the value of its vendorid and archid.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..c21d7374636c 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -94,6 +94,17 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,vendorid:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Same value as the mvendorid CSR.
+
+  riscv,archid:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Same value as the marchid CSR.
+
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0

